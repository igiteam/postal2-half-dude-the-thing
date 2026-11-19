class LPSM_ForkArmGrab_HoldSpitterTailRight extends LPSM_ForkArmGrab_HoldSpitterTailBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], vsPawn;

    super.SpecialMoveStarted(bForced, PrevMove);
    vsPawn = LPVSPlayerPawn(MySPPawn);
    vsPawn.RightArmPartInfo.IKType = GetIKAssistanceType();
    vsPawn.RightArmPartInfo.IKTargetPawn = LPPawn(FollowerPawn);
    vsPawn.RightArmPartInfo.IKTargetDepthSocket = GetIKTargetDepthSocket();
    vsPawn.RightArmPartInfo.IKTargetAssistSocket = GetIKTargetAssistSocket();
    StartTargetlessSpit();
    //return;    
}

function GetIKTargetDepthSocket()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'IKSpitTarget';
    //return ReturnValue;    
}

function GetIKAssistanceType()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 1;
    //return ReturnValue;    
}

defaultproperties
{
    HoldState=ETemplateLogicHoldState.etlhsSpitterTail_NeutralToRight
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldSpitterTailRight.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldSpitterTailRight.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldSpitterTailRight.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    Transitions=/* Array type was not detected. */
    AnimationTemplateNodeNames=/* Array type was not detected. */
}