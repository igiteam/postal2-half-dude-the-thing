class LPSM_VsPlayerVsLarocheStruggleVsDrillingToExposeCommArray extends LPSM_VsPlayerVsLarocheStruggleVsExposingCommArray
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPVSPlayerPawn(inPawn).TuneDataStruggleVsPlayerDrillingToExposeCommArray;
    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VsPlayerVsLarocheStruggleVsDrillingToExposeCommArray.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultVsStruggleCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VsPlayerVsLarocheStruggleVsDrillingToExposeCommArray.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    VsStruggleCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VsPlayerVsLarocheStruggleVsDrillingToExposeCommArray.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    VsStruggleTransitionInParam=GrabCamTransitionInParamObj
    TuneDataClass=Class'LPTuneDataStruggleVsPlayerDrillingToExposeCommArray'
    ApplyDamageClass=Class'LPDamageTypeVsPlayerExposingDrillingCommArrayStruggle'
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_VsPlayerVsLarocheStruggleVsDrillingToExposeCommArray.StruggleCamParamObj'
    begin object name=StruggleCamParamObj
    end object
    StruggleCamParams=StruggleCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VsPlayerVsLarocheStruggleVsDrillingToExposeCommArray.StruggleCamTransitionInParamObj'
    begin object name=StruggleCamTransitionInParamObj
    end object
    StruggleTransitionInParam=StruggleCamTransitionInParamObj
    FollowerSpecialMoveClass=Class'LPSM_VsLarocheVsPlayerStruggleVsDrillingToExposeCommArray'
}