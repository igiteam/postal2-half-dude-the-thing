class LPSM_ForkArmGrab_HoldSpitterTailUpToNeutral extends LPSM_ForkArmGrab_HoldSpitterTailBase
    config(Game);

defaultproperties
{
    BlendTime=0.1000000
    HoldState=ETemplateLogicHoldState.etlhsSpitterTail_UpToNeutral
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldSpitterTailUpToNeutral.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldSpitterTailUpToNeutral.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldSpitterTailUpToNeutral.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    Transitions=/* Array type was not detected. */
    AnimationTemplateNodeNames=/* Array type was not detected. */
}