class LPWeaponVSWelder extends LPVSParts_CauseTraceDamage
    abstract
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL FlameEffectComp[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OwnersMiniGameMissDamage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OwnersMiniGameModerateDamage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OwnersMiniGameFullDamage[536870913];

function Init()
{
    super.Init();
    //return;    
}

function InitFromPlayerControlledVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPlayerPawn;

    vsPlayerPawn = LPVSPlayerPawn(MyLPPawn);
    // End:0x17E
    if(vsPlayerPawn != none)
    {
        super(LPVSInventoryParts).InitFromPlayerControlledVs();
        BlendPerBoneAnimNode = vsPlayerPawn.RightArmWelderBlendPerBone;
        PartSlotNodeInfo = vsPlayerPawn.RightArmWelderAnimInfo;
        OwnersMiniGameMissDamage = vsPlayerPawn.TuneDataVSPlayerPawn.MiniGameMissDamage.GetValue();
        OwnersMiniGameModerateDamage = vsPlayerPawn.TuneDataVSPlayerPawn.MiniGameModerateDamage.GetValue();
        OwnersMiniGameFullDamage = vsPlayerPawn.TuneDataVSPlayerPawn.MiniGameFullDamage.GetValue();
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
                playCtrl.DoSpecialMove(Class'LPSM_PlayerVSWelderArmWelding', true);                
            }
            else
            {
                // End:0xDA
                if(mechCtrl != none)
                {
                    mechCtrl.DoSpecialMove(Class'LPSM_PlayerVSWelderArmWelding', true);
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

function @NULL TakeArmOut()
{
    local /*0x97E50000-0x00000400*/ private @NULL FlameBurstComp;

    super.TakeArmOut();
    FlameBurstComp = TuneDataPartsFXEventBindings.PlayEventFX('WelderFlameBurst', none, WeaponMeshComp, none);
    FlameBurstComp.SetTickGroup(3);
    FlameBurstComp.bAutoActivate = false;
    WeaponMeshComp.ParentAnimComponent.AttachComponentToSocket(FlameBurstComp, TipSocketName);
    FlameBurstComp.SetActive(true);
    //return;    
}

function PutArmAway()
{
    super.PutArmAway();
    // End:0x3A
    if(FlameEffectComp != none)
    {
        FlameEffectComp.SetActive(false);
    }
    //return;    
}

function PlayLoopSound()
{
    super.PlayLoopSound();
    // End:0xC8
    if(FlameEffectComp == none)
    {
        FlameEffectComp = TuneDataPartsFXEventBindings.PlayEventFX('WelderFlame', none, WeaponMeshComp, none);
        FlameEffectComp.SetTickGroup(3);
        FlameEffectComp.__OnSystemFinished__Delegate = None;
        FlameEffectComp.bAutoActivate = false;
    }
    // End:0x172
    if(!WeaponMeshComp.ParentAnimComponent.IsComponentAttached(FlameEffectComp))
    {
        WeaponMeshComp.ParentAnimComponent.AttachComponentToSocket(FlameEffectComp, 'FlameTip');
        FlameEffectComp.bJustAttached = true;
    }
    FlameEffectComp.SetActive(true);
    FlameEffectComp.SetScale(3.5000000);
    //return;    
}

function UpdateSound()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.UpdateSound(DeltaTime);
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
    //return;    
}

function SetWeakParameters()
{
    RightArmMinigameInfo.DamageModifier = OwnersMiniGameMissDamage;
    //return;    
}

function SetSweetSpotParameters()
{
    RightArmMinigameInfo.DamageModifier = OwnersMiniGameModerateDamage;
    ForceFeedback = TuneDataVSParts.ForceFeedbackSweetSpotHit;
    //return;    
}

function SetSuperSweetSpotParameters()
{
    RightArmMinigameInfo.DamageModifier = OwnersMiniGameFullDamage;
    ForceFeedback = TuneDataVSParts.ForceFeedbackSuperSweetSpotHit;
    //return;    
}

function GetDefaultDamageType()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPDamageTypeVSWelder';
    //return ReturnValue;    
}

simulated state PrimaryAction
{
    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
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
        // End:0x93
        if(FlameEffectComp != none)
        {
            FlameEffectComp.SetActive(false);
        }
        super.EndState(NextStateName);
        //return;        
    }
    stop;    
}

defaultproperties
{
    TraceRepeatPeriod=0.1500000
    PartLocation=EVSInventoryPartSlot.EIPS_RightArm
    // Reference: SkeletalMeshComponent'Default__LPWeaponVSWelder.WeaponMesh'
    begin object name=WeaponMesh
    end object
    WeaponMeshComp=WeaponMesh
    IKTrackRate=10000.0000000
    AimOriginSocket="CameraSocket"
    PartDamageType=Class'LPDamageTypeVSWelder'
    // Reference: SPTuneDataEventDefSoundBase'Default__LPWeaponVSWelder.MaxDistancePlaybackOverrideObj'
    begin object name=MaxDistancePlaybackOverrideObj class=Class'SPEngine.SPTuneDataEventDefSoundBase'
        PlaybackDistanceOverride=(OverrideType=SPFloatScaleOverrideType.SPFSDOverride_ByValue,OverrideValue=100000000000000000.0000000)
    end object
    MaxDistancePlaybackOverride=MaxDistancePlaybackOverrideObj
    CCDControlName="CCDControl_WelderArm"
    StartSound="VSWelderStart"
    LoopingSound="VSWelderLoop"
    EndSound="VSWelderEnd"
    DamageTraceSocketName="FlameStartDamageTrace"
    TipSocketName="FlameTip"
}