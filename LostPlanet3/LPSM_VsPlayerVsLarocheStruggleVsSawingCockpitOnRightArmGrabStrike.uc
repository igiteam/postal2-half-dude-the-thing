class LPSM_VsPlayerVsLarocheStruggleVsSawingCockpitOnRightArmGrabStrike extends LPSM_LeadVsStruggleMode
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPVSPlayerPawn(inPawn).TuneDataStruggleVsPlayerLarocheVsSawingCockpitOnRightArmGrab;
    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VsPlayerVsLarocheStruggleVsSawingCockpitOnRightArmGrabStrike.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultVsStruggleCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VsPlayerVsLarocheStruggleVsSawingCockpitOnRightArmGrabStrike.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    VsStruggleCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VsPlayerVsLarocheStruggleVsSawingCockpitOnRightArmGrabStrike.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    VsStruggleTransitionInParam=GrabCamTransitionInParamObj
    PlayerCtrlStateName="StruggleVsLarocheAttack"
    TuneDataClass=Class'LPTuneDataStruggleVsPlayerLarocheVsSawingCockpitOnRightArmGrab'
    ApplyDamageClass=Class'LPDamageTypeVsLarocheSawingCockpitStruggle'
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_VsPlayerVsLarocheStruggleVsSawingCockpitOnRightArmGrabStrike.StruggleCamParamObj'
    begin object name=StruggleCamParamObj
    end object
    StruggleCamParams=StruggleCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VsPlayerVsLarocheStruggleVsSawingCockpitOnRightArmGrabStrike.StruggleCamTransitionInParamObj'
    begin object name=StruggleCamTransitionInParamObj
    end object
    StruggleTransitionInParam=StruggleCamTransitionInParamObj
    FollowerSpecialMoveClass=Class'LPSM_VsLarocheVsPlayerStruggleVsSawingCockpitOnRightArmGrabStrike'
}