class LPSM_PlayerStalkerStrikeBull extends LPSM_LeadStruggleMode
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPPlayerPawn(inPawn).TuneDataStrugglePlayerStalkerStrikeBull;
    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

defaultproperties
{
    PlayerCtrlStateName="StruggleStalkerAttack"
    TuneDataClass=Class'LPTuneDataStrugglePlayerStalkerStrikeBull'
    ApplyDamageClass=Class'LPDamageTypeStalkerStruggle'
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_PlayerStalkerStrikeBull.StruggleCamParamObj'
    begin object name=StruggleCamParamObj
    end object
    StruggleCamParams=StruggleCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_PlayerStalkerStrikeBull.StruggleCamTransitionInParamObj'
    begin object name=StruggleCamTransitionInParamObj
    end object
    StruggleTransitionInParam=StruggleCamTransitionInParamObj
    FollowerSpecialMoveClass=Class'LPSM_StalkerPlayerStrikeBull'
}