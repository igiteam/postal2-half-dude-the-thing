class LPSM_ForkArmGrab_Escape extends LPSM_ForkArmGrab_Release
    config(Game);

function StartReleaseAnimation()
{
    StartAnimationChoreography(MySPPawn, FollowerPawn, 17, false, ReleaseFinished, FollowerSMInstance.EndAnimationFinished);
    //return;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_Escape.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_Escape.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_Escape.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    AnimationTemplateNodeNames=/* Array type was not detected. */
}