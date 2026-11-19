class LPWeaponHalberd extends LPWeaponHuntingRifle
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AdditionalDamage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxChargeTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ChargeTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ReticleChargePercent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ChargingParticlesDeactivateDelay;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ChargingParticles[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ChargingSound[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFireReleased;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bReachedMaxCharge;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDebugOutputInfoToHUD;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WeaponChargingWaveform;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WeaponMaxChargeLoopingWaveform;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataHalberd;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int bStartChargingFX;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPPC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ChargingAnimName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name FullyChargedAnimName;

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super(LPWeapon).InitTuneData(TuneData);
    TuneDataHalberd = LPTuneDataWeaponHalberd(TuneData);
    // End:0x132
    if(TuneDataHalberd != none)
    {
        AdditionalDamage = TuneDataHalberd.AdditionalChargedDamage.GetValue();
        MaxChargeTime = TuneDataHalberd.TimeUntilReachingMaxCharge.GetValue();
        WeaponChargingWaveform = TuneDataHalberd.WeaponChargingWaveform;
        WeaponMaxChargeLoopingWaveform = TuneDataHalberd.WeaponMaxChargeLoopingWaveform;
        ChargingParticlesDeactivateDelay = TuneDataHalberd.ChargingParticlesDeactivateDelay;
    }
    //return;    
}

simulated function GetFireModeDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609], HitActor;
    local /*0x97E50000-0x00000000*/ private int HitNum[9437185];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return super(SPInventoryWeapon).GetFireModeDamage(HitLocation, HitActor, HitNum) + (AdditionalDamage * (ChargeTime / MaxChargeTime));
    //return ReturnValue;    
}

simulated function GetEMPIncreasedDuration()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], EMPDurationMult;

    // End:0x17
    if(ChargeTime == float(0))
    {
        return 1.0000000;
    }
    EMPDurationMult = TuneDataHalberd.AdditionalChargedEMPTime.GetValue();
    EMPDurationMult -= 1.0000000;
    EMPDurationMult = ((EMPDurationMult * ChargeTime) / MaxChargeTime) + 1.0000000;
    return EMPDurationMult;
    //return ReturnValue;    
}

simulated function ReachedMaximumCharge()
{
    bReachedMaxCharge = true;
    LPPawn(Instigator).bPlayWeaponFullyChargedEffect = true;
    PlayWeaponFullyChargedEffect();
    //return;    
}

simulated function TimerDeactivateChargingParticles()
{
    // End:0x39
    if(ChargingParticles != none)
    {
        ChargingParticles.DeactivateSystem();
        ChargingParticles = none;
    }
    //return;    
}

simulated function GetLPPC()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x40
    if(LPPC == none)
    {
        LPPC = LPPlayerPawn(Instigator).SavedController;
    }
    return LPPC;
    //return ReturnValue;    
}

simulated function StopWeaponFullyChargedWaveform()
{
    // End:0x5C
    if(((GetLPPC()) != none) && LPPC.IsLocalPlayerController())
    {
        LPPC.ClientStopForceFeedbackWaveform(WeaponMaxChargeLoopingWaveform);
    }
    //return;    
}

simulated function StopWeaponChargingWaveform()
{
    // End:0x5C
    if(((GetLPPC()) != none) && LPPC.IsLocalPlayerController())
    {
        LPPC.ClientStopForceFeedbackWaveform(WeaponChargingWaveform);
    }
    //return;    
}

simulated function PlayWeaponChargingWaveform()
{
    local /*0x97E50000-0x00000000*/ private bool bAtMaximumCharge[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL NewWaveform;

    // End:0xA2
    if(((GetLPPC()) != none) && LPPC.IsLocalPlayerController())
    {
        // End:0x57
        if(bAtMaximumCharge)
        {
            NewWaveform = WeaponMaxChargeLoopingWaveform;            
        }
        else
        {
            NewWaveform = WeaponChargingWaveform;
        }
        // End:0xA2
        if(NewWaveform != none)
        {
            LPPC.ClientPlayForceFeedbackWaveform(NewWaveform);
        }
    }
    //return;    
}

simulated function PlayFireEffects()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[9437185];

    StopWeaponChargeUpEffect();
    LPPawn(Instigator).bPlayWeaponChargeUpEffect = false;
    LPPawn(Instigator).bPlayWeaponFullyChargedEffect = false;
    super(LPWeapon).PlayFireEffects(FireModeNum, HitLocation);
    //return;    
}

simulated function PlayChargingSoundEffect()
{
    local /*0x97E50000-0x00000000*/ private @NULL SoundOwner;

    SoundOwner = ((Owner == none) ? self : Owner);
    // End:0xA6
    if(ChargingSound == none)
    {
        ChargingSound = AudioComponent(TuneDataWeaponSoundEventBindings.PlayEventSoundLocallyEx('HalberdCharging', 'HalberdCharging', SoundOwner, none, none));
        ChargingSound.bStopWhenOwnerDestroyed = true;
    }
    // End:0xD4
    if(ChargingSound != none)
    {
        ChargingSound.Play();
    }
    //return;    
}

simulated function PlayChargingForceFeedback()
{
    local /*0x97E50000-0x00000000*/ private bool bAtMaxCharge[9437185];

    false
    // End:0x3B
    if(Instigator.IsLocallyControlled())
    {
        PlayWeaponChargingWaveform(bAtMaxCharge);
    }
    //return;    
}

simulated function PlayWeaponChargeUpParticle()
{
    local /*0x97E50000-0x00000000*/ private bool bAtMaxCharge[9437185];

    false
    // End:0x33
    if(ChargingParticles != none)
    {
        ChargingParticles.DeactivateSystem();
    }
    // End:0xE4
    if(AmmoTypeInfo.CurrentAmmoMode == 0)
    {
        // End:0xA4
        if(!bAtMaxCharge)
        {
            ChargingParticles = TuneDataWeaponFXEventBindings.PlayEventFX('HalberdCharge', none, Mesh, none);            
        }
        else
        {
            ChargingParticles = TuneDataWeaponFXEventBindings.PlayEventFX('HalberdFullCharge', none, Mesh, none);
        }        
    }
    else
    {
        // End:0x133
        if(!bAtMaxCharge)
        {
            ChargingParticles = TuneDataWeaponFXEventBindings.PlayEventFX('HalberdChargeAlt', none, Mesh, none);            
        }
        else
        {
            ChargingParticles = TuneDataWeaponFXEventBindings.PlayEventFX('HalberdFullChargeAlt', none, Mesh, none);
        }
    }
    // End:0x259
    if(ChargingParticles != none)
    {
        ChargingParticles.bAutoActivate = false;
        ChargingParticles.SetTickGroup(3);
        ChargingParticles.ActivateSystem();
        ChargeTime = ((bAtMaxCharge) ? MaxChargeTime : 0.0000000);
        // End:0x259
        if(Instigator.IsLocallyControlled() && IsScopeActive())
        {
            ChargingParticles.SetOwnerNoSee(true);
        }
    }
    //return;    
}

simulated function PlayWeaponChargingAnim()
{
    local /*0x97E50000-0x00000000*/ private bool bAtMaxCharge[9437185];

    false
    // End:0x2E
    if(bAtMaxCharge)
    {
        PlayCustomWeaponAnimation(FullyChargedAnimName);        
    }
    else
    {
        PlayCustomWeaponAnimation(ChargingAnimName);
    }
    //return;    
}

simulated function PlayWeaponChargeUpEffect()
{
    PlayChargingSoundEffect();
    PlayChargingForceFeedback();
    PlayWeaponChargeUpParticle();
    PlayWeaponChargingAnim();
    //return;    
}

simulated function PlayWeaponFullyChargedEffect()
{
    StopWeaponChargeUpEffect(false);
    PlayChargingForceFeedback(true);
    PlayWeaponChargeUpParticle(true);
    PlayWeaponChargingAnim(true);
    //return;    
}

simulated function CanSwitchAmmoTypes()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !IsFiring();
    //return ReturnValue;    
}

simulated function StopChargingSounds()
{
    // End:0x38
    if(ChargingSound != none)
    {
        ChargingSound.FadeOut(0.5000000, 0.0000000);
    }
    //return;    
}

simulated function StopAllForceFeedback()
{
    // End:0x48
    if(((GetLPPC()) != none) && LPPC.IsLocalPlayerController())
    {
        StopWeaponChargingWaveform();
        StopWeaponFullyChargedWaveform();
    }
    //return;    
}

simulated function StopChargingFX()
{
    // End:0x39
    if(ChargingParticles != none)
    {
        ChargingParticles.DeactivateSystem();
        ChargingParticles = none;
    }
    //return;    
}

simulated function StopWeaponChargeUpEffect()
{
    local /*0x97E50000-0x00000000*/ private bool StopSound[9437185];

    true
    StopChargingFX();
    // End:0x26
    if(StopSound)
    {
        StopChargingSounds();
    }
    StopAllForceFeedback();
    //return;    
}

simulated function StopWeaponFullyChargedEffect()
{
    StopChargingFX();
    StopChargingSounds();
    StopAllForceFeedback();
    //return;    
}

simulated function StopFireEffects()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

    super(SPInventoryWeapon).StopFireEffects(FireModeNum);
    //return;    
}

simulated function ShouldSpawnTracerFX()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x14
    if(int(FireModeNum) == 4)
    {
        return false;
    }
    return super(SPInventoryWeapon).ShouldSpawnTracerFX(FireModeNum);
    //return ReturnValue;    
}

static simulated function SpawnTracerEffect()
{
    local /*0x97E50000-0x00000000*/ private @NULL InWeapon[8388609], InInstigator, SpawnLocation, SpawnRotation, TargetLoc;

    local /*0x97E50000-0x00000000*/ private float HitDistance[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LPWHal;

    LPWHal = LPWeaponHalberd(InWeapon);
    // End:0x21B
    if(LPWHal != none)
    {
        // End:0x21B
        if(LPWHal.TuneDataHalberd != none)
        {
            // End:0x152
            if(LPWHal.AmmoTypeInfo.CurrentAmmoMode == 0)
            {
                // End:0xFD
                if(LPWHal.bReachedMaxCharge)
                {
                    LPWHal.TracerSmokeTrailEffect = LPWHal.TuneDataHalberd.FullyChargedTracerSmokeTrailEffect;                    
                }
                else
                {
                    LPWHal.TracerSmokeTrailEffect = LPWHal.TuneDataHalberd.TracerSmokeTrailEffect;
                }                
            }
            else
            {
                // End:0x1C9
                if(LPWHal.bReachedMaxCharge)
                {
                    LPWHal.TracerSmokeTrailEffect = LPWHal.TuneDataHalberd.AltAmmoFullyChargedTracerSmokeTrailEffect;                    
                }
                else
                {
                    LPWHal.TracerSmokeTrailEffect = LPWHal.TuneDataHalberd.AltAmmoTracerSmokeTrailEffect;
                }
            }
        }
    }
    return super(SPInventoryWeapon).SpawnTracerEffect(InWeapon, InInstigator, SpawnLocation, SpawnRotation, TargetLoc, HitDistance);
    //return ReturnValue;    
}

simulated function InstantFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartTrace, EndTrace;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ImpactList;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL RealImpact, MuzLoc;

    StartTrace = Instigator.GetWeaponStartTraceLocation();
    EndTrace = StartTrace + (Vector(GetAdjustedAim(StartTrace)) * (GetTraceRange()));
    RealImpact = CalcWeaponFire(StartTrace, EndTrace, ImpactList);
    // End:0x154
    if(Pawn(RealImpact.HitActor) == none)
    {
        MuzLoc = GetMuzzleLoc();
        StartTrace = MuzLoc;
        EndTrace = StartTrace + (Vector(GetAdjustedAim(StartTrace)) * (GetTraceRange()));
        ImpactList.Length = 0;
        RealImpact = CalcWeaponFire(StartTrace, EndTrace, ImpactList);
    }
    // End:0x19D
    if((int(Role) == int(ROLE_Authority)) || bClientSideInstantHit)
    {
        SetFlashLocation(RealImpact.HitLocation);
    }
    Idx = 0;
    J0x1A8:

    // End:0x1F5 [Loop If]
    if(Idx < ImpactList.Length)
    {
        ProcessInstantHit(CurrentFireMode, ImpactList[Idx]);
        Idx++;
        // [Loop Continue]
        goto J0x1A8;
    }
    //return;    
}

function RefireHoldTimer()
{
    //return;    
}

function BlockFireDuringSpecialMove()
{
    //return;    
}

simulated function StartFire()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

    // End:0x19
    if(IsTimerActive('RefireHoldTimer'))
    {
        return;
    }
    super(SPGFWeapon).StartFire(FireModeNum);
    //return;    
}

simulated exec function ToggleWeaponDebug()
{
    bDebugOutputInfoToHUD = !bDebugOutputInfoToHUD;
    //return;    
}

simulated function DrawHUD()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];
    local /*0x97E50000-0x00000000*/ private float NewChargePercent;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ChargeString;
    local /*0x97E50000-0x00000000*/ private float textHeight, TextWidth;

    NewChargePercent = ChargeTime / MaxChargeTime;
    // End:0x79
    if(ReticleChargePercent != NewChargePercent)
    {
        LPHUD(H).SetHalberdReticleChargePercent(NewChargePercent);
        ReticleChargePercent = NewChargePercent;
    }
    // End:0x8A
    if(!bDebugOutputInfoToHUD)
    {
        return;
    }
    // End:0x2AF
    if(Instigator != none)
    {
        // End:0xF4
        if((ChargingParticles != none) && ChargingParticles.bIsActive)
        {
            ChargeString = "ChargeTime: " $ string(ChargeTime);            
        }
        else
        {
            ChargeString = "ChargeTime: 0";
        }
        // End:0x2AF
        if((GetLPPC()) != none)
        {
            // End:0x1AF
            if(LPPC.IsForceFeedbackWaveformPlaying(WeaponChargingWaveform))
            {
                ChargeString = ChargeString $ " * (FF) CHARGING *";
                H.Canvas.SetDrawColor(255, 255, 20);                
            }
            else
            {
                // End:0x247
                if(LPPC.IsForceFeedbackWaveformPlaying(WeaponMaxChargeLoopingWaveform))
                {
                    ChargeString = ChargeString $ " * (FF) FULLY CHARGED * ";
                    H.Canvas.SetDrawColor(255, 0, 0);                    
                }
                else
                {
                    ChargeString = ChargeString $ " * (FF) NOT CHARGING *";
                    H.Canvas.SetDrawColor(51, 102, 51);
                }
            }
        }
    }
    H.Canvas.Font = Class'Engine.HUD'.static.GetFontSizeIndex(2);
    H.Canvas.TextSize(ChargeString, TextWidth, textHeight);
    H.Canvas.SetPos((H.Canvas.ClipX * 0.5000000) - (TextWidth * 0.5000000), (H.Canvas.ClipY * 0.9000000) - (textHeight * 1.5000000));
    H.Canvas.DrawText(ChargeString);
    //return;    
}

simulated state WeaponFiringCharge
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0x39
        if(ChargingSound != none)
        {
            ChargingSound.Stop();
            ChargingSound = none;
        }
        bReachedMaxCharge = false;
        super.BeginState(PreviousStateName);
        LPPawn(Instigator).bPlayWeaponChargeUpEffect = true;
        PlayWeaponChargeUpEffect();
        ClearFlashLocation();
        ClearFlashCount();
        //return;        
    }

    simulated function CanReload()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x19
        if(IsTimerActive('RefireHoldTimer'))
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    simulated event Tick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPP;

        global.Tick(DeltaTime);
        ChargeTime = FMin(ChargeTime + DeltaTime, MaxChargeTime);
        // End:0x6E
        if(!bReachedMaxCharge && ChargeTime >= MaxChargeTime)
        {
            ReachedMaximumCharge();
        }
        LPP = LPPlayerPawn(Instigator);
        // End:0x12A
        if(LPP.IsInState('PlayerGrappling') && LPZiplinePoint_Base(LPP.GrappleActor) != none)
        {
            LPPlayerPawn(Instigator).bPendingFire = false;
            ClearPendingFire(int(CurrentFireMode));
            HandleFinishedFiring();            
        }
        else
        {
            // End:0x226
            if(!IsTimerActive('BlockFireDuringSpecialMove'))
            {
                // End:0x17B
                if(LPP.IsDoingASpecialMove())
                {
                    SetTimer(0.5000000, false, 'BlockFireDuringSpecialMove');                    
                }
                else
                {
                    // End:0x226
                    if(!StillFiring(CurrentFireMode))
                    {
                        // End:0x1C0
                        if(LPP.CanFireWeapon())
                        {
                            FireAmmunition();
                        }
                        // End:0x21C
                        if(LPP.IsAliveAndWell())
                        {
                            // End:0x21C
                            if(!IsTimerActive('RefireCheckTimer'))
                            {
                                SetTimer(GetFireInterval(CurrentFireMode), false, 'RefireHoldTimer');
                            }
                        }
                        HandleFinishedFiring();
                    }
                }
            }
        }
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        StopFireEffects(0);
        StopWeaponChargeUpEffect();
        LPPawn(Instigator).bPlayWeaponChargeUpEffect = false;
        LPPawn(Instigator).bPlayWeaponFullyChargedEffect = false;
        ChargeTime = 0.0000000;
        bReachedMaxCharge = false;
        super.EndState(NextStateName);
        //return;        
    }
    stop;    
}

defaultproperties
{
    ChargingAnimName="WPN_Halberd_Halberd_StartCharging"
    FullyChargedAnimName="WPN_Halberd_Halberd_Charged_Core"
    // Reference: StaticMeshComponent'Default__LPWeaponHalberd.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponHalberd.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    HUDIconName="halberd"
    HUDReticleName="halberd"
    HUDReticleName_SecondaryAmmomode="halberd"
    FriendlyName="Halberd"
    Description="A long-range weapon that fires kinetic energy blasts.  Build up energy for even more powerful shots."
    // Reference: SkeletalMeshComponent'Default__LPWeaponHalberd.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    PickupMessage="Halberd Rounds"
    // Reference: StaticMeshComponent'Default__LPWeaponHalberd.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
}