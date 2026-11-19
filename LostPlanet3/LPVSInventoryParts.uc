class LPVSInventoryParts extends LPInventoryParts
    abstract
    hidecategories(AnimDependency,Navigation);

enum EPartActionMode
{
    epamPrimary,                    // 0
    epamAlternate,                  // 1
    epamNone,                       // 2
    EPartActionMode_MAX             // 3
};

enum EPartAnimationIndex
{
    epaiEquip,                      // 0
    epaiHold,                       // 1
    epaiUnequip,                    // 2
    epaiTakeOut,                    // 3
    epaiLoop,                       // 4
    epaiPutAway,                    // 5
    EPartAnimationIndex_MAX         // 6
};

enum EPartState
{
    epsNone,                        // 0
    epsExtendingingArm,             // 1
    epsArmExtended,                 // 2
    epsRetractingArm,               // 3
    epsAlternateAction,             // 4
    EPartState_MAX                  // 5
};

enum EPartEquippedState
{
    epesUnequipped,                 // 0
    epesEquipping,                  // 1
    epesEquipped,                   // 2
    epesUnequipping,                // 3
    EPartEquippedState_MAX          // 4
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PartSlot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PartLocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte DesiredActionMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PartState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte EquippedState[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL WeaponMeshComp[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL DamageStateComp[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AnimationTemplateNodeNames;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AnimationTemplates[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataVSParts;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastArmAssistanceTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL IdealIKEffectorLocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActualIKEffectorLocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IKTrackRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AimOriginSocket;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ForceFeedback;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class PartDamageType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MaxDistancePlaybackOverride;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name CCDControlName;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL StartSoundComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL LoopingSoundComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL EndSoundComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name StartSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name LoopingSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name EndSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name DamageTraceSocketName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name TipSocketName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasDamageMinigame;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseParentAnimComponent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPreventPutAwayCleanup[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSLogicAnimTree[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OwnersArmPartInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BlendPerBoneAnimNode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PartSlotNodeInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToStartWorryingAboutIKPenetration[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name WeaponMeshAttachBoneOrSocketName;

// Export ULPVSInventoryParts::execUpdateArmIKController(FFrame&, void* const)
native simulated function UpdateArmIKController()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];


}

// Export ULPVSInventoryParts::execGetSnowFactor(FFrame&, void* const)
native final simulated function GetSnowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

simulated function InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super(Actor).InitTuneData(TuneData);
    TuneDataVSParts = LPTuneDataVSParts(TuneData);
    //return;    
}

simulated event GetMasterTuneDataReference()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return TuneDataVSParts;
    //return ReturnValue;    
}

function InitFromPlayerControlledVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPlayerPawn;

    vsPlayerPawn = LPVSPlayerPawn(MyLPPawn);
    // End:0x7B
    if(vsPlayerPawn != none)
    {
        VSLogicAnimTree = vsPlayerPawn.VSRightArmPartAnimTree;
        OwnersArmPartInfo = vsPlayerPawn.RightArmPartInfo;
    }
    //return;    
}

function InitFromAiControlledVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL VsLarochePawn;

    VsLarochePawn = LPAIPawnVsLaroche(MyLPPawn);
    // End:0x7B
    if(VsLarochePawn != none)
    {
        VSLogicAnimTree = VsLarochePawn.MechLogicAnimTree;
        OwnersArmPartInfo = VsLarochePawn.RightArmPartInfo;
    }
    //return;    
}

function Init()
{
    InitFromPlayerControlledVs();
    InitFromAiControlledVs();
    PartState = 0;
    EquippedState = 0;
    MaxDistancePlaybackOverride.PlaybackDistanceOverride.OverrideType = 2;
    MaxDistancePlaybackOverride.PlaybackDistanceOverride.OverrideValue = 100000000000000000.0000000;
    // End:0x1CF
    if(TuneDataPartsSoundEventBindings != none)
    {
        StartSoundComponent = TuneDataPartsSoundEventBindings.PlayEventSoundLocallyEx(StartSound, 'None', Owner, none, MaxDistancePlaybackOverride);
        SetupSoundComponent(StartSoundComponent);
        LoopingSoundComponent = TuneDataPartsSoundEventBindings.PlayEventSoundLocallyEx(LoopingSound, 'None', Owner, none, MaxDistancePlaybackOverride);
        SetupSoundComponent(LoopingSoundComponent);
        EndSoundComponent = TuneDataPartsSoundEventBindings.PlayEventSoundLocallyEx(EndSound, 'None', Owner, none, MaxDistancePlaybackOverride);
        SetupSoundComponent(EndSoundComponent);
    }
    //return;    
}

function @NULL SetupSoundComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL mySound[8388609], myAk;

    myAk = AkComponent(mySound);
    // End:0x41
    if(myAk != none)
    {
        SetupAkComponent(myAk);        
    }
    else
    {
        SetupAudioComponent(AudioComponent(mySound));
    }
    //return;    
}

function @NULL SetupAkComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL myAkComponent[8388609];

    // End:0x70
    if(myAkComponent != none)
    {
        myAkComponent.bAutoDestroy = false;
        myAkComponent.bUseLocation = false;
        myAkComponent.Stop();
    }
    //return;    
}

function @NULL SetupAudioComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL myAudioComponent[8388609];

    // End:0x4F
    if(myAudioComponent != none)
    {
        myAudioComponent.bAutoDestroy = false;
        myAudioComponent.Stop();
    }
    //return;    
}

function InitAnimations()
{
    // End:0x6A
    if((MyLPPawn != none) && AnimationTemplateNodeNames.Length > 0)
    {
        // End:0x6A
        if(VSLogicAnimTree != none)
        {
            VSLogicAnimTree.FindAnimNodes(AnimationTemplateNodeNames, AnimationTemplates, Class'SPEngine.SPAnimNodeTemplateLogicNamedRoot');
        }
    }
    //return;    
}

function GivenTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL thisPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDoNotActivate[9437185];

    MyLPPawn = LPPawn(thisPawn);
    super(Inventory).GivenTo(thisPawn, bDoNotActivate);
    //return;    
}

reliable client simulated function ClientGivenTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewOwner[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDoNotActivate[8388609];

    MyLPPawn = LPPawn(NewOwner);
    Init();
    InitAnimations();
    InitWeaponMeshComp();
    super(Inventory).ClientGivenTo(NewOwner, bDoNotActivate);
    //return;    
}

reliable client simulated function InitWeaponMeshComp()
{
    // End:0x156
    if(WeaponMeshComp != none)
    {
        // End:0x59
        if(bUseParentAnimComponent)
        {
            WeaponMeshComp.SetParentAnimComponent(MyLPPawn.Mesh);
        }
        MyLPPawn.Mesh.AttachComponentToSocket(WeaponMeshComp, WeaponMeshAttachBoneOrSocketName);
        WeaponMeshComp.SetShadowParent(MyLPPawn.Mesh);
        WeaponMeshComp.SetScale(MyLPPawn.DrawScale);
        WeaponMeshComp.SetLightEnvironment(MyLPPawn.LightEnvironment);
    }
    //return;    
}

function IsEquipped()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return int(EquippedState) == int(2);
    //return ReturnValue;    
}

function IsEquippedAndIdle()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (IsEquipped()) && int(PartState) == int(0);
    //return ReturnValue;    
}

simulated function PartEquipped()
{
    local /*0x97E50000-0x00000000*/ private byte InSlot[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Params, PlayingSeq;

    PartSlot = InSlot;
    EquippedState = 1;
    OwnersArmPartInfo.CCDControl_Arm = LPSkelControl_CCD_IK(MyLPPawn.Mesh.FindSkelControl(CCDControlName));
    OwnersArmPartInfo.CCDControl_Arm.SetSkelControlStrength(0.0000000, 0.0000000);
    // End:0xFA
    if(BlendPerBoneAnimNode != none)
    {
        BlendPerBoneAnimNode.SetBlendTarget(1.0000000, 0.0000000);
    }
    Params.SequenceTemplate = GetBestSequenceTemplateByIndex(0);
    Params.EndDelegate = EquipPartFinishedCB;
    Params.BlendInTime = 0.0000000;
    PlayingSeq = MyLPPawn.PlayAnimationFromParams(PartSlotNodeInfo.AnimNodeSlot, Params);
    PlayingSeq.SetIssueAnimFinishedCallbackOnInterruption(true);
    //return;    
}

simulated function EquipPartFinishedCB()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    StartEquippedHoldAnim();
    //return;    
}

simulated function StartEquippedHoldAnim()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Params;

    EquippedState = 2;
    Params.SequenceTemplate = GetBestSequenceTemplateByIndex(1);
    Params.bLooping = true;
    Params.BlendInTime = 0.0000000;
    MyLPPawn.PlayAnimationFromParams(PartSlotNodeInfo.AnimNodeSlot, Params);
    //return;    
}

simulated function PartUnequipped()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Params;

    // End:0x43
    if(int(PartState) != int(0))
    {
        MyLPPawn.StopRightArmPartAction(0, true);
        StartPartState(0);
    }
    EndAction(CurrentActionMode);
    PartSlot = 0;
    EquippedState = 3;
    OwnersArmPartInfo.CCDControl_Arm.SetSkelControlStrength(0.0000000, 0.0000000);
    Params.SequenceTemplate = GetBestSequenceTemplateByIndex(2);
    Params.EndDelegate = UnequipFinished;
    Params.BlendInTime = 0.0000000;
    MyLPPawn.PlayAnimationFromParams(PartSlotNodeInfo.AnimNodeSlot, Params);
    //return;    
}

simulated function UnequipFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    EquippedState = 0;
    // End:0x44
    if(BlendPerBoneAnimNode != none)
    {
        BlendPerBoneAnimNode.SetBlendTarget(0.0000000, 0.2500000);
    }
    //return;    
}

reliable server function ServerStartAction()
{
    local /*0x97E50000-0x00000000*/ private byte ActionMode[8388609];

    //return;    
}

reliable server function ServerStopAction()
{
    local /*0x97E50000-0x00000000*/ private byte ActionMode[8388609];

    //return;    
}

function GetDefaultDamageType()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    //return ReturnValue;    
}

function InitializeAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL Controller[8388609];
    local /*0x97E50000-0x00000000*/ private byte ActionMode[8388609];

    //return;    
}

simulated function StartSpecialMove()
{
    //return;    
}

simulated function BroadcastSMMStart()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return MyLPPawn.BroadcastSMMessageToAll(0, Class'LPSMMTypes'.default.SMM_VSRightArmPartStart, self);
    //return ReturnValue;    
}

simulated function BroadcastSMMEnd()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return MyLPPawn.BroadcastSMMessageToAll(0, Class'LPSMMTypes'.default.SMM_VSRightArmPartEnd, self);
    //return ReturnValue;    
}

simulated function StartAction()
{
    local /*0x97E50000-0x00000000*/ private byte ActionMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForce[9437185];

    false
    MyLPPawn.SetInventoryPartInUse(PartSlot, true);
    DesiredActionMode = ActionMode;
    TryBeginAction(ActionMode, bForce);
    //return;    
}

simulated function TryBeginAction()
{
    local /*0x97E50000-0x00000000*/ private byte ActionMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForceRestart[9437185];

    false
    // End:0x79
    if(MyLPPawn.IsInventoryPartInUse(PartSlot) && (int(ActionMode) != int(CurrentActionMode)) || bForceRestart)
    {
        BeginAction(ActionMode, bForceRestart);
    }
    //return;    
}

simulated function StartRightArmAction()
{
    local /*0x97E50000-0x00000000*/ private byte ActionMode[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForceRestart[9437185];

    0
    false
    StartAction(ActionMode, bForceRestart);
    //return;    
}

simulated function StopAction()
{
    local /*0x97E50000-0x00000000*/ private byte ActionMode[9437185];

    255
    MyLPPawn.SetInventoryPartInUse(PartSlot, false);
    DesiredActionMode = 255;
    TryEndAction(ActionMode);
    //return;    
}

simulated function TryEndAction()
{
    local /*0x97E50000-0x00000000*/ private byte ActionMode[8388609];

    // End:0x5D
    if(!MyLPPawn.IsInventoryPartInUse(PartSlot) && int(CurrentActionMode) == int(ActionMode))
    {
        EndAction(ActionMode);
    }
    //return;    
}

simulated function NewControllerState()
{
    local /*0x97E50000-0x00000000*/ private bool bActive[8388609];

    // End:0x3A
    if(bActive && int(DesiredActionMode) != int(255))
    {
        TryBeginAction(DesiredActionMode);        
    }
    else
    {
        // End:0x72
        if(!bActive && int(DesiredActionMode) == int(255))
        {
            TryEndAction(CurrentActionMode);
        }
    }
    //return;    
}

simulated function StartPartState()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];

    // End:0x1D
    if(int(NewState) == int(PartState))
    {
        return;
    }
    PartState = NewState;
    switch(PartState)
    {
        // End:0x55
        case 0:
            CleanupPart();
            // End:0x96
            break;
        // End:0x67
        case 1:
            TakeArmOut();
            // End:0x96
            break;
        // End:0x79
        case 2:
            LoopArm();
            // End:0x96
            break;
        // End:0x8B
        case 3:
            PutArmAway();
            // End:0x96
            break;
        // End:0x93
        case 4:
            // End:0x96
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function TakeArmOut()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Params, PlayingSeq;
    local /*0x97E50000-0x00000000*/ private bool bPlayedAnim;
    local /*0x97E50000-0x00000000*/ private float IKBlendTime;

    // End:0x12D
    if(OwnersArmPartInfo.bUseAnimation)
    {
        Params.SequenceTemplate = GetBestSequenceTemplateByIndex(3);
        Params.EndDelegate = TakeArmOutFinished;
        bPreventPutAwayCleanup = true;
        PlayingSeq = MyLPPawn.PlayAnimationSequenceOnBodyPart(OwnersArmPartInfo.SlotType, Params);
        IKBlendTime = PlayingSeq.AnimSeq.SequenceLength;
        bPlayedAnim = true;
        bPreventPutAwayCleanup = false;        
    }
    else
    {
        bPlayedAnim = false;
    }
    TimeToStartWorryingAboutIKPenetration = 0.0000000;
    // End:0x227
    if(int(OwnersArmPartInfo.IKType) != int(0))
    {
        TimeToStartWorryingAboutIKPenetration = MyLPPawn.WorldInfo.TimeSeconds + TuneDataVSParts.IKTriggerDelay;
        OwnersArmPartInfo.CCDControl_Arm.SetSkelControlStrength(1.0000000, IKBlendTime);
        ActualIKEffectorLocation = vect(0.0000000, 0.0000000, 0.0000000);
    }
    // End:0x243
    if(!bPlayedAnim)
    {
        TakeArmOutFinished(none, 0, false);
    }
    //return;    
}

simulated function TakeArmOutFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    StartPartState(2);
    //return;    
}

function LoopArm()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Params;

    // End:0xB6
    if(OwnersArmPartInfo.bUseAnimation)
    {
        Params.SequenceTemplate = GetBestSequenceTemplateByIndex(4);
        Params.bLooping = true;
        Params.BlendInTime = 0.0000000;
        MyLPPawn.PlayAnimationSequenceOnBodyPart(2, Params);
    }
    //return;    
}

function PutArmAway()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Params, PlayingSeq;
    local /*0x97E50000-0x00000000*/ private float IKBlendTime;

    // End:0x152
    if(OwnersArmPartInfo.bUseAnimation)
    {
        Params.SequenceTemplate = GetBestSequenceTemplateByIndex(5);
        Params.EndDelegate = PutArmAwayFinished;
        LPVSPlayerPawn(MyLPPawn).StopRightArmAnimation();
        PlayingSeq = MyLPPawn.PlayAnimationSequenceOnBodyPart(OwnersArmPartInfo.SlotType, Params);
        PlayingSeq.SetIssueAnimFinishedCallbackOnInterruption(true);
        IKBlendTime = PlayingSeq.AnimSeq.SequenceLength;        
    }
    else
    {
        IKBlendTime = 0.5000000;
        StartPartState(0);
    }
    // End:0x1D8
    if(int(OwnersArmPartInfo.IKType) != int(0))
    {
        OwnersArmPartInfo.CCDControl_Arm.SetSkelControlStrength(0.0000000, IKBlendTime);
    }
    StopAction(0);
    //return;    
}

simulated function PutArmAwayFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x69
    if(!bPreventPutAwayCleanup)
    {
        // End:0x5D
        if((int(EquippedState) == int(2)) && BlendPerBoneAnimNode != none)
        {
            BlendPerBoneAnimNode.SetBlendTarget(1.0000000, 0.0000000);
        }
        StartPartState(0);
    }
    //return;    
}

simulated function MarkArmAssistance()
{
    LastArmAssistanceTime = MyLPPawn.WorldInfo.TimeSeconds;
    //return;    
}

function CleanupPart()
{
    OwnersArmPartInfo.CCDControl_Arm.SetSkelControlStrength(0.0000000, 0.2500000);
    MyLPPawn.EnableLineSweepHitTester(false);
    //return;    
}

simulated function GetBestSequenceTemplateByIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], AnimTemplateRoot;

    AnimTemplateRoot = SPAnimNodeTemplateLogicNamedRoot(AnimationTemplates[Index]);
    // End:0x41
    if(AnimTemplateRoot == none)
    {
        ScriptTrace();
        return none;
    }
    return AnimTemplateRoot.GetBestSequenceTemplate(MyLPPawn);
    //return ReturnValue;    
}

function ForceDamageMinigame()
{
    //return;    
}

function @NULL GetDamageStateOwnerMesh()
{
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689];

    return WeaponMeshComp;
    //return ReturnValue;    
}

function @NULL GetOwnerDamageStateComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689];

    return DamageStateComp;
    //return ReturnValue;    
}

function @NULL SetOwnerDamageStateComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL Comp[8388609];

    DamageStateComp = Comp;
    //return;    
}

function NotifyPartStopped()
{
    //return;    
}

function NeedsGracefulStop()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

event Destroyed()
{
    // End:0x9D
    if(Pawn(Owner) != none)
    {
        // End:0x9D
        if((LPVSPlayerPawn(Owner) != none) && LPVSPlayerPawn(Owner).PartsInvManager != none)
        {
            LPVSPlayerPawn(Owner).PartsInvManager.RemoveFromInventory(self);
        }
    }
    //return;    
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

        super.EndState(NextStateName);
        // End:0x4B
        if(BlendPerBoneAnimNode != none)
        {
            BlendPerBoneAnimNode.SetBlendTarget(1.0000000, 0.0000000);
        }
        //return;        
    }
    stop;    
}

state AlternateAction
{
    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0x20
        if(int(PartState) == int(3))
        {
            bPreventPutAwayCleanup = true;
        }
        StartPartState(4);
        MyLPPawn.EnableLineSweepHitTester(true);
        //return;        
    }

    simulated event Tick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        super(Actor).Tick(DeltaTime);
        //return;        
    }

    function NeedsGracefulStop()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function NotifyPartStopped()
    {
        bPreventPutAwayCleanup = false;
        OwnersArmPartInfo.bTipDamageEnabled = false;
        OwnersArmPartInfo.IKType = 0;
        StopAction(CurrentActionMode);
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        bPreventPutAwayCleanup = false;
        StartPartState(0);
        super.EndState(NextStateName);
        //return;        
    }
    stop;    
}

defaultproperties
{
    DesiredActionMode=255
    // Reference: SkeletalMeshComponent'Default__LPVSInventoryParts.WeaponMesh'
    begin object name=WeaponMesh class=Class'Engine.SkeletalMeshComponent'
    end object
    WeaponMeshComp=WeaponMesh
    AnimationTemplateNodeNames=/* Array type was not detected. */
    // Reference: SPTuneDataEventDefSoundBase'Default__LPVSInventoryParts.MaxDistancePlaybackOverrideObj'
    begin object name=MaxDistancePlaybackOverrideObj class=Class'SPEngine.SPTuneDataEventDefSoundBase'
    end object
    MaxDistancePlaybackOverride=MaxDistancePlaybackOverrideObj
    bUseParentAnimComponent=true
    WeaponMeshAttachBoneOrSocketName="JO_R_WristOsc"
    RemoteRole=ENetRole.ROLE_None
}