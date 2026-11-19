class LPWeaponVsSaw extends LPVSParts_CauseTraceDamage
    abstract
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte SawState[536870913];

function Init()
{
    super.Init();
    //return;    
}

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    WeaponMeshComp = Pawn(Owner).Mesh;
    SawState = 1;
    //return;    
}

reliable client simulated function InitWeaponMeshComp()
{
    //return;    
}

function InitFromPlayerControlledVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPlayerPawn;

    vsPlayerPawn = LPVSPlayerPawn(MyLPPawn);
    // End:0x35
    if(vsPlayerPawn != none)
    {
        super(LPVSInventoryParts).InitFromPlayerControlledVs();
    }
    //return;    
}

function InitFromAiControlledVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL VsLarochePawn;

    VsLarochePawn = LPAIPawnVsLaroche(MyLPPawn);
    // End:0x5D
    if(VsLarochePawn != none)
    {
        super(LPVSInventoryParts).InitFromAiControlledVs();
        PartSlotNodeInfo = VsLarochePawn.RightArmSawAnimInfo;
    }
    //return;    
}

function TakeArmOut()
{
    TakeArmOutFinished(none, 0, false);
    PlayStartSound();
    //return;    
}

function LoopArm()
{
    //return;    
}

function PutArmAway()
{
    StopAction(0);
    EndLoopSound();
    PlayEndSound();
    //return;    
}

simulated function GetBestSequenceTemplateByIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], AnimTemplateRoot;

    // End:0x15
    if(Index == 3)
    {
        return none;        
    }
    else
    {
        // End:0x2A
        if(Index == 4)
        {
            return none;            
        }
        else
        {
            // End:0x3C
            if(Index == 5)
            {
                return none;
            }
        }
    }
    AnimTemplateRoot = SPAnimNodeTemplateLogicNamedRoot(AnimationTemplates[Index]);
    // End:0x7D
    if(AnimTemplateRoot == none)
    {
        ScriptTrace();
        return none;
    }
    return AnimTemplateRoot.GetBestSequenceTemplate(MyLPPawn);
    //return ReturnValue;    
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
                playCtrl.DoSpecialMove(Class'LPSM_PlayerVSSawArmSawing', true);                
            }
            else
            {
                // End:0xDA
                if(mechCtrl != none)
                {
                    mechCtrl.DoSpecialMove(Class'LPSM_VsLarocheSawArmSawing', true);
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

simulated function PartEquipped()
{
    local /*0x97E50000-0x00000000*/ private byte InSlot[8388609];

    super(LPVSInventoryParts).PartEquipped(InSlot);
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
    RightArmMinigameInfo.TargetSoundEventValue = 0.0000000;
    //return;    
}

function GetDefaultDamageType()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPDamageTypeVSSaw';
    //return ReturnValue;    
}

function SetSweetSpotParameters()
{
    RightArmMinigameInfo.TargetSoundEventValue = 0.0000000;
    RightArmMinigameInfo.DamageModifier = 1.5000000;
    PartDamageType = Class'LPDamageTypeLarocheVsRightArmStrightSaw';
    ForceFeedback = TuneDataVSParts.ForceFeedbackSweetSpotHit;
    RightArmMinigameInfo.DrillAnimSpeed = TuneDataVSParts.SweetSpotDrillAdditiveAnimSpeed;
    //return;    
}

function SetSuperSweetSpotParameters()
{
    RightArmMinigameInfo.TargetSoundEventValue = 0.0000000;
    RightArmMinigameInfo.DamageModifier = 2.0000000;
    PartDamageType = Class'LPDamageTypeLarocheVsRightArmStrightSaw';
    ForceFeedback = TuneDataVSParts.ForceFeedbackSuperSweetSpotHit;
    RightArmMinigameInfo.DrillAnimSpeed = TuneDataVSParts.SuperSweetDrillAdditiveAnimSpeed;
    //return;    
}

simulated state PrimaryAction
{
    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        MyLPPawn.NotifyArmSaw();
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
        super.EndState(NextStateName);
        //return;        
    }
    stop;    
}

defaultproperties
{
    TraceRepeatPeriod=0.1000000
    PartLocation=EVSInventoryPartSlot.EIPS_RightArm
    // Reference: SkeletalMeshComponent'Default__LPWeaponVsSaw.WeaponMesh'
    begin object name=WeaponMesh
    end object
    WeaponMeshComp=WeaponMesh
    IKTrackRate=10000.0000000
    AimOriginSocket="CameraSocket"
    PartDamageType=Class'LPDamageTypeVSSaw'
    // Reference: SPTuneDataEventDefSoundBase'Default__LPWeaponVsSaw.MaxDistancePlaybackOverrideObj'
    begin object name=MaxDistancePlaybackOverrideObj
        PlaybackDistanceOverride=(OverrideType=SPFloatScaleOverrideType.SPFSDOverride_ByValue,OverrideValue=100000000000000000.0000000)
    end object
    MaxDistancePlaybackOverride=MaxDistancePlaybackOverrideObj
    CCDControlName="CCDControl_DrillArm"
    StartSound="VsSawStartUp"
    LoopingSound="VSSawLoop"
    EndSound="VsSawTurnOff"
    DamageTraceSocketName="SawStartDamageTrace"
    TipSocketName="SawTip"
    bHidden=false
}