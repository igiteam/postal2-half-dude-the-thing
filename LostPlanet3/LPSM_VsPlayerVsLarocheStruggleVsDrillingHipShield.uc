class LPSM_VsPlayerVsLarocheStruggleVsDrillingHipShield extends LPSM_VsPlayerVsLarocheStruggleVsDestroyingHipShield
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPVSPlayerPawn(inPawn).TuneDataStruggleVsPlayerDrillingHipShield;
    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VsPlayerVsLarocheStruggleVsDrillingHipShield.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultVsStruggleCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VsPlayerVsLarocheStruggleVsDrillingHipShield.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    VsStruggleCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VsPlayerVsLarocheStruggleVsDrillingHipShield.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    VsStruggleTransitionInParam=GrabCamTransitionInParamObj
    PlayerCtrlStateName="StruggleVsLarocheMobilityKillAttack"
    TuneDataClass=Class'LPTuneDataStruggleVsPlayerDrillingHipShield'
    ApplyDamageClass=Class'LPDamageTypeVsPlayerCauseByDrillMobilityKill'
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_VsPlayerVsLarocheStruggleVsDrillingHipShield.StruggleCamParamObj'
    begin object name=StruggleCamParamObj
    end object
    StruggleCamParams=StruggleCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VsPlayerVsLarocheStruggleVsDrillingHipShield.StruggleCamTransitionInParamObj'
    begin object name=StruggleCamTransitionInParamObj
    end object
    StruggleTransitionInParam=StruggleCamTransitionInParamObj
    FollowerSpecialMoveClass=Class'LPSM_VsLarocheVsPlayerStruggleVsDrillingHipShield'
}