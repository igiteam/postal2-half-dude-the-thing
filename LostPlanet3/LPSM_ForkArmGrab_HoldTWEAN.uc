class LPSM_ForkArmGrab_HoldTWEAN extends LPSM_ForkArmGrab_Hold
    config(Game);

enum ETweanValueType
{
    etvtButtonMash,                 // 0
    etvtJoystickRaise,              // 1
    etvtJoystickLower,              // 2
    ETweanValueType_MAX             // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyCrossFader;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TheirCrossFader;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyCross1;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyCross2;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TheirCross1;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TheirCross2;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyBlend;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TheirBlend;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte TweanValueType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurTweanValue;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ButtonMashInc;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ButtonMashDeclineRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float JoystickMoveRate;

function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor, vsPawn;

    super(LPSM_ForkArmGrab_Base).PrepSpecialMove(PrevMove, InteractionActor);
    vsPawn = LPVSPlayerPawn(MySPPawn);
    CurTweanValue = 0.0000000;
    vsPawn.ReplicatedForkArmGrabCurTweenValue = 0.0000000;
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    switch(TweanValueType)
    {
        // End:0x42
        case 0:
            InitButtonMash();
            // End:0x5C
            break;
        // End:0x47
        case 1:
        // End:0x59
        case 2:
            InitJoystickMove();
            // End:0x5C
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function StartInteraction()
{
    super.StartInteraction();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    StopTwean();
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function StartHoldAnimation()
{
    LPBaseVSPlayerPawn(MySPPawn).TemplateLogicData.bFirmGrab = true;
    StartTwean();
    //return;    
}

function InitButtonMash()
{
    //return;    
}

function InitJoystickMove()
{
    TweanValueType = 1;
    //return;    
}

function StartChoreographedAnimationLooped()
{
    local /*0x97E50000-0x00000000*/ private @NULL Leader[8388609], Follower;
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private float BlendTime[9437185], PlayRate, PreferredMovementPercent;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    0.2500000
    1.0000000
    0.5000000
    //return ReturnValue;    
}

function StartTwean()
{
    local /*0x97E50000-0x00000000*/ private @NULL at, Seq, MD;

    at = AnimTree(MySPPawn.Mesh.Animations);
    // End:0x2B5
    if(at != none)
    {
        MySPPawn.StopFullBodyAnim(0.0000000);
        MyBlend = SPAnimNodeBlend(at.FindAnimNode('TweanBlend'));
        MyBlend.SetBlendTarget(1.0000000, 0.0000000);
        MyCrossFader = SPAnimNodeCrossfader(at.FindAnimNode('Crossfader'));
        MyCrossFader.SetBlendTarget(CurTweanValue, 0.0000000);
        MyCross1 = SPAnimNodeSequence(at.FindAnimNode('Crossfade1'));
        MyCross2 = SPAnimNodeSequence(at.FindAnimNode('Crossfade2'));
        Seq = GetBestSequenceTemplateByIndex(8);
        MyCross1.SetAnim(Seq.AnimSeqName);
        Seq = GetBestSequenceTemplateByIndex(9);
        MyCross2.SetAnim(Seq.AnimSeqName);
        MyCross1.PlayAnim(true, 1.0000000, 0.0000000);
        MyCross2.PlayAnim(true, 1.0000000, 0.0000000);
    }
    at = AnimTree(FollowerPawn.Mesh.Animations);
    // End:0x5F6
    if(at != none)
    {
        FollowerPawn.StopFullBodyAnim(0.0000000);
        TheirBlend = SPAnimNodeBlend(at.FindAnimNode('TweanBlend'));
        TheirBlend.SetBlendTarget(1.0000000, 0.0000000);
        TheirCrossFader = SPAnimNodeCrossfader(at.FindAnimNode('Crossfader'));
        TheirCrossFader.SetBlendTarget(CurTweanValue, 0.0000000);
        TheirCross1 = SPAnimNodeSequence(at.FindAnimNode('Crossfade1'));
        TheirCross2 = SPAnimNodeSequence(at.FindAnimNode('Crossfade2'));
        MD = SPAnimMetaDataChoreographed(MyCross1.GetFirstAnimMetaDataByClass(Class'SPEngine.SPAnimMetaDataChoreographed'));
        TheirCross1.SetAnim(MD.OtherAnimName);
        TheirCross1.PlayAnim(true, 1.0000000, 0.0000000);
        MD = SPAnimMetaDataChoreographed(MyCross2.GetFirstAnimMetaDataByClass(Class'SPEngine.SPAnimMetaDataChoreographed'));
        TheirCross2.SetAnim(MD.OtherAnimName);
        TheirCross2.PlayAnim(true, 1.0000000, 0.0000000);
        SetUpChoreography(MySPPawn, MyCross1, FollowerPawn, TheirCross1, MD, 0, true,, 0.5000000);
    }
    //return;    
}

function StopTwean()
{
    MySPPawn.StopPawnChoreography();
    TheirBlend.SetBlendTarget(0.0000000, 0.2500000);
    MyBlend.SetBlendTarget(0.0000000, 0.2500000);
    MyCross1.StopAnim();
    MyCross2.StopAnim();
    TheirCross1.StopAnim();
    TheirCross2.StopAnim();
    MyBlend = none;
    TheirBlend = none;
    MyCrossFader = none;
    MyCross1 = none;
    MyCross2 = none;
    TheirCrossFader = none;
    TheirCross1 = none;
    TheirCross2 = none;
    //return;    
}

function ReachedGoal()
{
    MySPPawn.TriggerEventClass(Class'LPSeqEvent_VitalSuitCombat', FollowerPawn, 2);
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], PreTweanValue;

    super.Tick(DeltaTime);
    // End:0xBC
    if(CurTweanValue < 1.0000000)
    {
        PreTweanValue = CurTweanValue;
        switch(TweanValueType)
        {
            // End:0x67
            case 0:
                UpdateButtonMash(DeltaTime);
                // End:0x8A
                break;
            // End:0x6C
            case 1:
            // End:0x87
            case 2:
                UpdateJoystickMove(DeltaTime);
                // End:0x8A
                break;
            // End:0xFFFF
            default:
                break;
        }
        // End:0xBC
        if((PreTweanValue < 1.0000000) && CurTweanValue >= 1.0000000)
        {
            ReachedGoal();
        }
    }
    // End:0xF8
    if(MyCrossFader != none)
    {
        MyCrossFader.SetBlendTarget(CurTweanValue, 0.2000000);
    }
    // End:0x134
    if(TheirCrossFader != none)
    {
        TheirCrossFader.SetBlendTarget(CurTweanValue, 0.2000000);
    }
    UpdateStickyAim();
    //return;    
}

function UpdateButtonMash()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    CurTweanValue += (DeltaTime / ButtonMashDeclineRate);
    CurTweanValue = FClamp(CurTweanValue, 0.0000000, 1.0000000);
    //return;    
}

function UpdateJoystickMove()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PC, PInput, vsPawn;
    local /*0x97E50000-0x00000000*/ private float JoystickVal;

    vsPawn = LPVSPlayerPawn(MySPPawn);
    // End:0x188
    if(MySPPawn.IsLocallyControlled())
    {
        PC = LPPlayerController(MySPPawn.Controller);
        PInput = LPPlayerInput(PC.PlayerInput);
        // End:0x185
        if(PInput != none)
        {
            JoystickVal = ((int(TweanValueType) == int(1)) ? PInput.UnfilteredMovementStick.Y : -PInput.UnfilteredMovementStick.Y);
            CurTweanValue += ((JoystickVal * DeltaTime) * JoystickMoveRate);
            vsPawn.ServerForkArmGrabUpdateTween(CurTweanValue);
        }        
    }
    else
    {
        CurTweanValue = vsPawn.ReplicatedForkArmGrabCurTweenValue;
    }
    CurTweanValue = FClamp(CurTweanValue, 0.0000000, 1.0000000);
    //return;    
}

function UpdateStickyAim()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn, AkridPawn, AimControl, AimAtActor;
    local /*0x97E50000-0x00000000*/ private float InputScale;

    AkridPawn = LPAIPawnAkrid(FollowerPawn);
    vsPawn = LPVSPlayerPawn(MySPPawn);
    // End:0x1E7
    if((AkridPawn != none) && AkridPawn.GrabPoints[ForkArmGrabInfo.GrabPoint.GrabPointIndex].bStickyAimOnFSMShields)
    {
        AimControl = SPGFAimControlPlayerControlled(vsPawn.GetAimController());
        // End:0x1E7
        if(AimControl != none)
        {
            AimAtActor = AimControl.GetAimCollisionActor();
            // End:0x1BE
            if(LPShieldFracture(AimAtActor) != none)
            {
                InputScale = 1.0000000 - vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_StickOnFSMPercent;
                AimControl.SetDynamicFloatingAimInputScale(InputScale, InputScale);                
            }
            else
            {
                AimControl.SetDynamicFloatingAimInputScale(1.0000000, 1.0000000);
            }
        }
    }
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x6A
        case Class'LPSMMTypes'.default.SMM_ShockStart:
            MySPPawn.DoSpecialMove(Class'LPSM_ForkArmGrab_Shock',,,, FollowerPawn);
            return true;
        // End:0xFFFF
        default:
            return super.ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

defaultproperties
{
    TweanValueType=ETweanValueType.etvtJoystickRaise
    ButtonMashInc=0.1500000
    ButtonMashDeclineRate=-2.0000000
    JoystickMoveRate=2.0000000
    bShowTaserHelp=true
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldTWEAN.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldTWEAN.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldTWEAN.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    FollowerSpecialMoveClass=Class'LPSM_ForkArmGrabVictim_HoldTWEAN'
    AnimationTemplateNodeNames=/* Array type was not detected. */
}