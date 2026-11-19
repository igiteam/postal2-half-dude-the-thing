class LPSM_VsPlayerVsLarocheStruggleVsShutDownVsWithEmpPulseStrike extends LPSM_LeadVsStruggleMode
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPVSPlayerPawn(inPawn).TuneDataStruggleVsPlayerShutDownVsWithEmpPulseStrike;
    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VsPlayerVsLarocheStruggleVsShutDownVsWithEmpPulseStrike.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultVsStruggleCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VsPlayerVsLarocheStruggleVsShutDownVsWithEmpPulseStrike.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    VsStruggleCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VsPlayerVsLarocheStruggleVsShutDownVsWithEmpPulseStrike.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    VsStruggleTransitionInParam=GrabCamTransitionInParamObj
    PlayerCtrlStateName="StruggleVsLarocheAttack"
    TuneDataClass=Class'LPTuneDataStruggleVsPlayerShutDownVsWithEmpPulseStrike'
    ApplyDamageClass=Class'LPDamageTypeVsLarocheSawingCockpitStruggle'
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_VsPlayerVsLarocheStruggleVsShutDownVsWithEmpPulseStrike.StruggleCamParamObj'
    begin object name=StruggleCamParamObj
    end object
    StruggleCamParams=StruggleCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VsPlayerVsLarocheStruggleVsShutDownVsWithEmpPulseStrike.StruggleCamTransitionInParamObj'
    begin object name=StruggleCamTransitionInParamObj
    end object
    StruggleTransitionInParam=StruggleCamTransitionInParamObj
    FollowerSpecialMoveClass=Class'LPSM_VsLarocheVsPlayerStruggleVsShutDownVsWithEmpPulseStrike'
}