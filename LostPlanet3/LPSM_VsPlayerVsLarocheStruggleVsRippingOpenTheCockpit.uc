class LPSM_VsPlayerVsLarocheStruggleVsRippingOpenTheCockpit extends LPSM_LeadVsStruggleMode
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPVSPlayerPawn(inPawn).TuneDataStruggleVsPlayerRippingOpenTheCockpit;
    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

function StartGrabedHold()
{
    local /*0x97E50000-0x00000000*/ private class Move[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EnemyVsPawn[8388609];

    //return;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VsPlayerVsLarocheStruggleVsRippingOpenTheCockpit.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultVsStruggleCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VsPlayerVsLarocheStruggleVsRippingOpenTheCockpit.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    VsStruggleCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VsPlayerVsLarocheStruggleVsRippingOpenTheCockpit.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    VsStruggleTransitionInParam=GrabCamTransitionInParamObj
    PlayerCtrlStateName="StruggleVsLarocheMobilityKillAttack"
    TuneDataClass=Class'LPTuneDataStruggleVsPlayerRippingOpenTheCockpit'
    ApplyDamageClass=Class'LPDamageTypeVsPlayerCauseByDrillMobilityKill'
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_VsPlayerVsLarocheStruggleVsRippingOpenTheCockpit.StruggleCamParamObj'
    begin object name=StruggleCamParamObj
    end object
    StruggleCamParams=StruggleCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VsPlayerVsLarocheStruggleVsRippingOpenTheCockpit.StruggleCamTransitionInParamObj'
    begin object name=StruggleCamTransitionInParamObj
    end object
    StruggleTransitionInParam=StruggleCamTransitionInParamObj
    FollowerSpecialMoveClass=Class'LPSM_VsLarocheVsPlayerStruggleVsRippingOpenTheCockpit'
}