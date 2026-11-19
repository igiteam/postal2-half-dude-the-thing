class LPWeaponVSISSRailgun extends LPBaseVSISSWeapon
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyVSPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataRailgun;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCharged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWaitingForAnim[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWaitingForEffect[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ChargeEffectCmp[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ChargingSound[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MaxDistancePlaybackOverride;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedAnim[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedEffect[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeShoulderHold[536870913];

simulated event PostBeginPlay()
{
    super(SPInventoryWeapon).PostBeginPlay();
    MyVSPawn = LPAIPawnVSISS(Owner);
    Mesh = MyVSPawn.Mesh;
    //return;    
}

simulated function InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super(LPBaseVSWeapon).InitTuneData(TuneData);
    TuneDataRailgun = LPTuneDataWeaponVSISSRailgun(TuneData);
    TimeShoulderHold = TuneDataRailgun.TimeShoulderHold;
    //return;    
}

simulated function PlayWeaponReloading()
{
    //return;    
}

function RightShoulderUpAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    //return;    
}

function GetTargetPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], PawnISS, ControllerISS, TargetPawn;

    PawnISS = LPAIPawnVSISS(Owner);
    ControllerISS = LPAIControllerVSISS(PawnISS.Controller);
    // End:0x8D
    if(ControllerISS != none)
    {
        TargetPawn = LPPawn(ControllerISS.FireTarget);
    }
    return TargetPawn;
    //return ReturnValue;    
}

function GetTimeShoulderHold()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TargetPawn;

    // End:0x36
    if(TimeShoulderHold >= TuneDataRailgun.MinTimeShoulderHoldWhenPlayerDamagedRecently)
    {
        return TimeShoulderHold;
    }
    TargetPawn = LPPlayerPawn(GetTargetPawn());
    // End:0xF5
    if(TargetPawn != none)
    {
        // End:0xF5
        if((WorldInfo.TimeSeconds - TargetPawn.TakeDamageParams.Time) < TuneDataRailgun.TimePlayerConsideredDamagedRecently)
        {
            return TuneDataRailgun.MinTimeShoulderHoldWhenPlayerDamagedRecently;
        }
    }
    return TimeShoulderHold;
    //return ReturnValue;    
}

state WeaponFiringSingle
{
    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        bCharged = false;
        bQuickFinish = false;
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        MyVSPawn.PlayShoulderDownAnimation();
        // End:0x38
        if(!bCharged)
        {
            AbortCharge();
        }
        super(WeaponFiring).EndState(NextStateName);
        //return;        
    }

    simulated function AbortCharge()
    {
        bCharged = true;
        MyVSPawn.StopAdditiveChargingAnimation();
        StopChargingEffect(ChargeEffectCmp);
        //return;        
    }

    simulated function PlayChargingEffect()
    {
        local /*0x97E50000-0x00000000*/ private @NULL SoundOwner;
        local /*0x97E50000-0x00000000*/ private int I;

        MaxDistancePlaybackOverride.PlaybackDistanceOverride.OverrideType = 2;
        MaxDistancePlaybackOverride.PlaybackDistanceOverride.OverrideValue = 100000000000000000.0000000;
        ChargeEffectCmp = TuneDataWeaponFXEventBindings.PlayEventFX('VSISSRailgunCharge', none, MyVSPawn.Mesh, MaxDistancePlaybackOverride);
        // End:0x1BC
        if(ChargeEffectCmp != none)
        {
            ChargeEffectCmp.ActivateSystem();
            ChargeEffectCmp.__OnSystemFinished__Delegate = FinishedChargingEffect;
            I = 0;
            J0x12F:

            // End:0x1BC [Loop If]
            if(I < ChargeEffectCmp.EmitterInstances.Length)
            {
                ChargeEffectCmp.SetKillOnDeactivate(I, false);
                ChargeEffectCmp.SetKillOnCompleted(I, false);
                I++;
                // [Loop Continue]
                goto J0x12F;
            }
        }
        SoundOwner = ((Owner == none) ? self : Owner);
        // End:0x262
        if(ChargingSound == none)
        {
            ChargingSound = AudioComponent(TuneDataWeaponSoundEventBindings.PlayEventSoundLocallyEx('VSISSRailgunCharge', 'VSISSRailgunCharge', SoundOwner, none, none));
            ChargingSound.bStopWhenOwnerDestroyed = true;
        }
        // End:0x290
        if(ChargingSound != none)
        {
            ChargingSound.Play();
        }
        //return;        
    }

    private final simulated function @NULL FinishedChargingEffect()
    {
        local /*0x97E50000-0x00000400*/ private @NULL FinishedComponent[8388609];

        bWaitingForEffect = false;
        //return;        
    }

    private final simulated function @NULL StopChargingEffect()
    {
        local /*0x97E50000-0x00000400*/ private @NULL FinishedComponent[8388609];

        // End:0xB0
        if((ChargeEffectCmp != none) && ChargeEffectCmp == FinishedComponent)
        {
            WorldInfo.MyEmitterPool.OnParticleSystemFinished(ChargeEffectCmp);
            ChargeEffectCmp.DetachFromAny();
            ChargeEffectCmp.SetActive(false);
            ChargeEffectCmp = none;
        }
        // End:0xE8
        if(ChargingSound != none)
        {
            ChargingSound.FadeOut(0.5000000, 0.0000000);
        }
        bWaitingForEffect = false;
        //return;        
    }

    function RightShoulderUpAnimFinished()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
        local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
        local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

        bWaitingForAnim = false;
        //return;        
    }

    simulated function EndFire()
    {
        local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

        super(SPInventoryWeapon).EndFire(FireModeNum);
        HandleFinishedFiring();
        //return;        
    }
Begin:

    // End:0x10B
    if(!MyVSPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_SmartObjectInteraction'))
    {
        bWaitingForAnim = true;
        MyVSPawn.PlayShoulderUpAnimation(RightShoulderUpAnimFinished);
        J0x69:

        // End:0x81 [Loop If]
        if(bWaitingForAnim)
        {
            Sleep(0.0000000);
            // [Loop Continue]
            goto J0x69;
        }
        TimeStartedAnim = WorldInfo.TimeSeconds;
        MyVSPawn.PlayShoulderHoldAnimation();
        J0xC8:

        // End:0x10B [Loop If]
        if((WorldInfo.TimeSeconds - TimeStartedAnim) < (GetTimeShoulderHold()))
        {
            Sleep(0.0000000);
            // [Loop Continue]
            goto J0xC8;
        }
    }
    MyVSPawn.StartAdditiveChargingAnimation();
    bWaitingForEffect = true;
    TimeStartedEffect = WorldInfo.TimeSeconds;
    PlayChargingEffect();
    J0x168:

    // End:0x202 [Loop If]
    if(bWaitingForEffect)
    {
        // End:0x1F7
        if((TuneDataRailgun.ChargeTime > 0.0000000) && (WorldInfo.TimeSeconds - TimeStartedEffect) > TuneDataRailgun.ChargeTime)
        {
            bWaitingForEffect = false;
        }
        Sleep(0.0000000);
        // [Loop Continue]
        goto J0x168;
    }
    // End:0x283
    if(MyVSPawn.TransitionComponent.IsDoingTransition())
    {
        J0x239:

        // End:0x27B [Loop If]
        if(MyVSPawn.TransitionComponent.IsDoingTransition())
        {
            Sleep(0.0000000);
            // [Loop Continue]
            goto J0x239;
        }
        Sleep(0.5000000);
    }
    AbortCharge();
    MyVSPawn.PlayShoulderDownAnimation();
    FireAmmunition();
    // End:0x2D0
    if(bQuickFinish)
    {
        HandleFinishedFiring();        
    }
    else
    {
        TimeWeaponFiring(CurrentFireMode);
    }
    stop;                    
}

defaultproperties
{
    // Reference: SPTuneDataEventDefSoundBase'Default__LPWeaponVSISSRailgun.MaxDistancePlaybackOverrideObj'
    begin object name=MaxDistancePlaybackOverrideObj class=Class'SPEngine.SPTuneDataEventDefSoundBase'
    end object
    MaxDistancePlaybackOverride=MaxDistancePlaybackOverrideObj
    bAllowTracers=true
    // Reference: StaticMeshComponent'Default__LPWeaponVSISSRailgun.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponVSISSRailgun.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    bCanThrow=false
    // Reference: SkeletalMeshComponent'Default__LPWeaponVSISSRailgun.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    // Reference: StaticMeshComponent'Default__LPWeaponVSISSRailgun.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
}