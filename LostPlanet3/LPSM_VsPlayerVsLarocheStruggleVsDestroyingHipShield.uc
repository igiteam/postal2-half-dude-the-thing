class LPSM_VsPlayerVsLarocheStruggleVsDestroyingHipShield extends LPSM_LeadVsStruggleMode
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VsPlayerVsLarocheStruggleVsDestroyingHipShield.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultVsStruggleCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VsPlayerVsLarocheStruggleVsDestroyingHipShield.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    VsStruggleCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VsPlayerVsLarocheStruggleVsDestroyingHipShield.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    VsStruggleTransitionInParam=GrabCamTransitionInParamObj
    PlayerCtrlStateName="StruggleVsLarocheAttack"
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_VsPlayerVsLarocheStruggleVsDestroyingHipShield.StruggleCamParamObj'
    begin object name=StruggleCamParamObj
    end object
    StruggleCamParams=StruggleCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VsPlayerVsLarocheStruggleVsDestroyingHipShield.StruggleCamTransitionInParamObj'
    begin object name=StruggleCamTransitionInParamObj
    end object
    StruggleTransitionInParam=StruggleCamTransitionInParamObj
}