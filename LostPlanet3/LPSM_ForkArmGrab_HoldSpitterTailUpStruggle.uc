class LPSM_ForkArmGrab_HoldSpitterTailUpStruggle extends LPSM_ForkArmGrab_HoldSpitterTailBase
    config(Game);

function ShouldShowReticleHelp()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], LPPC;

    super.SpecialMoveStarted(bForced, PrevMove);
    StopSpitting();
    LPVSPlayerPawn(MySPPawn).RightArmPartInfo.IKType = GetIKAssistanceType();
    LPVSPlayerPawn(MySPPawn).RightArmPartInfo.IKTargetPawn = LPPawn(FollowerPawn);
    LPVSPlayerPawn(MySPPawn).RightArmPartInfo.IKTargetDepthSocket = GetIKTargetDepthSocket();
    LPVSPlayerPawn(MySPPawn).RightArmPartInfo.IKTargetAssistSocket = GetIKTargetAssistSocket();
    LPPC = LPPlayerController(MySPPawn.Controller);
    // End:0x1AD
    if(LPPC != none)
    {
        LPPC.SetTutorialMode(6);
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, LPPC;

    LPPC = LPPlayerController(MySPPawn.Controller);
    // End:0x62
    if(LPPC != none)
    {
        LPPC.SetTutorialMode(0);
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function HitVulnerableCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609], LPPC;

    LPPC = LPPlayerController(MySPPawn.Controller);
    // End:0x61
    if(LPPC != none)
    {
        LPPC.CompletedTutorialMode(6);
    }
    super(LPSM_ForkArmGrab_Base).HitVulnerableCore(HitPawn);
    //return;    
}

function GetIKTargetDepthSocket()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'IKTailTarget';
    //return ReturnValue;    
}

function GetIKAssistanceType()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 2;
    //return ReturnValue;    
}

function GetVictimVulnerableCoreID()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return 0;
    //return ReturnValue;    
}

defaultproperties
{
    bCanDamageFollower=true
    bLoopAnimation=true
    HoldState=ETemplateLogicHoldState.etlhsSpitterTail_UpStruggle
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldSpitterTailUpStruggle.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldSpitterTailUpStruggle.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldSpitterTailUpStruggle.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    AnimationTemplateNodeNames=/* Array type was not detected. */
}