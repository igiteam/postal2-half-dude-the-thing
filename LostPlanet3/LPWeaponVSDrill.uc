class LPWeaponVSDrill extends LPVSParts_CauseTraceDamage
    abstract
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OwnersMiniGameMissDamage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OwnersMiniGameModerateDamage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OwnersMiniGameFullDamage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OwnersMiniGameSoundBlendTime[536870913];

function Init()
{
    super.Init();
    //return;    
}

function InitFromPlayerControlledVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPlayerPawn;

    vsPlayerPawn = LPVSPlayerPawn(MyLPPawn);
    // End:0x1BB
    if(vsPlayerPawn != none)
    {
        super(LPVSInventoryParts).InitFromPlayerControlledVs();
        BlendPerBoneAnimNode = vsPlayerPawn.RightArmDrillBlendPerBone;
        PartSlotNodeInfo = vsPlayerPawn.RightArmDrillAnimInfo;
        OwnersMiniGameMissDamage = vsPlayerPawn.TuneDataVSPlayerPawn.MiniGameMissDamage.GetValue();
        OwnersMiniGameModerateDamage = vsPlayerPawn.TuneDataVSPlayerPawn.MiniGameModerateDamage.GetValue();
        OwnersMiniGameFullDamage = vsPlayerPawn.TuneDataVSPlayerPawn.MiniGameFullDamage.GetValue();
        OwnersMiniGameSoundBlendTime = vsPlayerPawn.TuneDataVSPlayerPawn.MiniGameSoundBlendTime;
    }
    //return;    
}

function InitializeAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL Controller[8388609];
    local /*0x97E50000-0x00000000*/ private byte ActionMode[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL playCtrl, mechCtrl;

    // End:0x11
    if(Controller == none)
    {
        return;
    }
    switch(ActionMode)
    {
        // End:0xDD
        case 0:
            playCtrl = LPPlayerController(Controller);
            mechCtrl = LPAIControllerMech(Controller);
            // End:0x9F
            if(playCtrl != none)
            {
                playCtrl.DoSpecialMove(Class'LPSM_PlayerVSDrillArmDrilling', true);                
            }
            else
            {
                // End:0xDA
                if(mechCtrl != none)
                {
                    mechCtrl.DoSpecialMove(Class'LPSM_PlayerVSDrillArmDrilling', true);
                }
            }
            // End:0xE3
            break;
        // End:0xFFFF
        default:
            // End:0xE3
            break;
            break;
    }
    //return;    
}

function UpdateSound()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], Delta, Alpha;

    super.UpdateSound(DeltaTime);
    // End:0x178
    if((LoopingSoundComponent != none) && LoopingSoundComponent.IsPlaying())
    {
        Delta = RightArmMinigameInfo.TargetSoundEventValue - RightArmMinigameInfo.CurrentSoundEventValue;
        // End:0xC8
        if(OwnersMiniGameSoundBlendTime > float(0))
        {
            Alpha = FClamp(DeltaTime / OwnersMiniGameSoundBlendTime, 0.0000000, 1.0000000);            
        }
        else
        {
            Alpha = 1.0000000;
        }
        RightArmMinigameInfo.CurrentSoundEventValue += (Delta * Alpha);
        // End:0x178
        if(AkComponent(LoopingSoundComponent) != none)
        {
            AkComponent(LoopingSoundComponent).SetRTPCValue("DrillingIntensity", RightArmMinigameInfo.CurrentSoundEventValue);
        }
    }
    //return;    
}

function GetDamageAmount()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], ReturnValue;

    return DamageRemainder + (((GetDamageRate()) * DeltaTime) * RightArmMinigameInfo.DamageModifier);
    //return ReturnValue;    
}

function SetNormalParameters()
{
    RightArmMinigameInfo.DamageModifier = 1.0000000;
    RightArmMinigameInfo.TargetSoundEventValue = 0.0000000;
    RightArmMinigameInfo.DrillAnimSpeed = TuneDataVSParts.NormalDrillAdditiveAnimSpeed;
    //return;    
}

function SetWeakParameters()
{
    RightArmMinigameInfo.TargetSoundEventValue = 0.0000000;
    RightArmMinigameInfo.DamageModifier = OwnersMiniGameMissDamage;
    RightArmMinigameInfo.DrillAnimSpeed = TuneDataVSParts.WeakDrillAdditiveAnimSpeed;
    //return;    
}

function SetSweetSpotParameters()
{
    RightArmMinigameInfo.TargetSoundEventValue = 60.0000000;
    RightArmMinigameInfo.DamageModifier = OwnersMiniGameModerateDamage;
    PartDamageType = Class'LPDamageTypeVSDrillSweetSpot';
    ForceFeedback = TuneDataVSParts.ForceFeedbackSweetSpotHit;
    RightArmMinigameInfo.DrillAnimSpeed = TuneDataVSParts.SweetSpotDrillAdditiveAnimSpeed;
    //return;    
}

function SetSuperSweetSpotParameters()
{
    RightArmMinigameInfo.TargetSoundEventValue = 99.0000000;
    RightArmMinigameInfo.DamageModifier = OwnersMiniGameFullDamage;
    PartDamageType = Class'LPDamageTypeVSDrillSuperSweetSpot';
    ForceFeedback = TuneDataVSParts.ForceFeedbackSuperSweetSpotHit;
    RightArmMinigameInfo.DrillAnimSpeed = TuneDataVSParts.SuperSweetDrillAdditiveAnimSpeed;
    //return;    
}

function GetDefaultDamageType()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPDamageTypeVSDrill';
    //return ReturnValue;    
}

function GetDamageRate()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Upgrade, vsPlayerPawn, PC;
    local /*0x97E50000-0x00000000*/ private float BaseDamage, DamageMod;

    BaseDamage = super.GetDamageRate();
    DamageMod = 1.0000000;
    vsPlayerPawn = LPVSPlayerPawn(MyLPPawn);
    PC = vsPlayerPawn.GetMyPlayerController();
    // End:0xF7
    if((PC != none) && PC.HasUpgrade(Class'LPVSUpgrade_PreorderDrillUpgrade', Upgrade))
    {
        // End:0xF7
        if(LPVSUpgrade_PreorderDrillUpgrade(Upgrade) != none)
        {
            DamageMod = LPVSUpgrade_PreorderDrillUpgrade(Upgrade).GetModifier();
        }
    }
    // End:0x11F
    if(DamageMod > 0.0000000)
    {
        return DamageMod * BaseDamage;
    }
    return BaseDamage;
    //return ReturnValue;    
}

simulated state PrimaryAction
{
    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        MyLPPawn.NotifyArmDrill();
        // End:0xAB
        if(int(OwnersArmPartInfo.ForceProceduralSpinType) != int(0))
        {
            LPVSPlayerPawn(MyLPPawn).SetDrillSpinControlStrength(1.0000000, 0.2500000, OwnersArmPartInfo.ForceProceduralSpinType);
        }
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x63
        if(!MyLPPawn.IsLocallyControlled())
        {
            MyLPPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_VSRightArmPartEnd, self);
        }
        LPVSPlayerPawn(MyLPPawn).SetDrillSpinControlStrength(0.0000000, 0.2500000);
        LPVSPlayerPawn(MyLPPawn).SetVSReticle("grab");
        LPVSPlayerPawn(MyLPPawn).SetVSReticleGrabState(false);
        super.EndState(NextStateName);
        //return;        
    }

    simulated event Tick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL vsPlayerPawn;
        local /*0x97E50000-0x00000000*/ private float Speed;

        super.Tick(DeltaTime);
        // End:0x112
        if(int(OwnersArmPartInfo.ForceProceduralSpinType) != int(0))
        {
            vsPlayerPawn = LPVSPlayerPawn(MyLPPawn);
            // End:0x112
            if(vsPlayerPawn != none)
            {
                Speed = RightArmMinigameInfo.DrillAnimSpeed;
                // End:0xDF
                if(int(OwnersArmPartInfo.ForceProceduralSpinType) == int(2))
                {
                    Speed += TuneDataVSParts.BaseDrillAnimSpeed;
                }
                vsPlayerPawn.AddDrillSpinControlRotation(DeltaTime * Speed);
            }
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    TraceRepeatPeriod=0.1000000
    PartLocation=EVSInventoryPartSlot.EIPS_RightArm
    // Reference: SkeletalMeshComponent'Default__LPWeaponVSDrill.WeaponMesh'
    begin object name=WeaponMesh
    end object
    WeaponMeshComp=WeaponMesh
    IKTrackRate=10000.0000000
    AimOriginSocket="CameraSocket"
    PartDamageType=Class'LPDamageTypeVSDrill'
    // Reference: SPTuneDataEventDefSoundBase'Default__LPWeaponVSDrill.MaxDistancePlaybackOverrideObj'
    begin object name=MaxDistancePlaybackOverrideObj
        PlaybackDistanceOverride=(OverrideType=SPFloatScaleOverrideType.SPFSDOverride_ByValue,OverrideValue=100000000000000000.0000000)
    end object
    MaxDistancePlaybackOverride=MaxDistancePlaybackOverrideObj
    CCDControlName="CCDControl_DrillArm"
    StartSound="VSDrillStart"
    LoopingSound="VSDrillLoop"
    EndSound="VSDrillEnd"
    DamageTraceSocketName="DrillStartDamageTrace"
    TipSocketName="DrillTip"
    bHasDamageMinigame=true
    bHidden=false
}