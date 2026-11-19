class LPSM_VsPlayerVsLarocheStruggleVsKnockOutHitsOnUr extends LPSM_LeadVsStruggleMode
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPVSPlayerPawn(inPawn).TuneDataStruggleVsPlayerKnockOutHitsOnUr;
    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VsPlayerVsLarocheStruggleVsKnockOutHitsOnUr.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultVsStruggleCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VsPlayerVsLarocheStruggleVsKnockOutHitsOnUr.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    VsStruggleCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VsPlayerVsLarocheStruggleVsKnockOutHitsOnUr.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    VsStruggleTransitionInParam=GrabCamTransitionInParamObj
    PlayerCtrlStateName="StruggleVsLarocheAttack"
    TuneDataClass=Class'LPTuneDataStruggleVsPlayerKnockOutHitsOnUr'
    ApplyDamageClass=Class'LPDamageTypeVsLarocheSawingCockpitStruggle'
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_VsPlayerVsLarocheStruggleVsKnockOutHitsOnUr.StruggleCamParamObj'
    begin object name=StruggleCamParamObj
    end object
    StruggleCamParams=StruggleCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VsPlayerVsLarocheStruggleVsKnockOutHitsOnUr.StruggleCamTransitionInParamObj'
    begin object name=StruggleCamTransitionInParamObj
    end object
    StruggleTransitionInParam=StruggleCamTransitionInParamObj
    FollowerSpecialMoveClass=Class'LPSM_VsLarocheVsPlayerStruggleVsKnockOutHitsOnUr'
}