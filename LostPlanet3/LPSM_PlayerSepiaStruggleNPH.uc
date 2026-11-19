class LPSM_PlayerSepiaStruggleNPH extends LPSM_LeadStruggleMode
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPPlayerPawn(inPawn).TuneDataStrugglePlayerSepiaNPH;
    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

defaultproperties
{
    PlayerCtrlStateName="StruggleSepiaNPH"
    TuneDataClass=Class'LPTuneDataStrugglePlayerSepiaNPH'
    ApplyDamageClass=Class'LPDamageTypeSepiaStruggleNPH'
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_PlayerSepiaStruggleNPH.StruggleCamParamObj'
    begin object name=StruggleCamParamObj
    end object
    StruggleCamParams=StruggleCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_PlayerSepiaStruggleNPH.StruggleCamTransitionInParamObj'
    begin object name=StruggleCamTransitionInParamObj
    end object
    StruggleTransitionInParam=StruggleCamTransitionInParamObj
    FollowerSpecialMoveClass=Class'LPSM_SepiaPlayerStruggleNPH'
}