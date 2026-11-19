class LPSM_PlayerPackHunterStruggleNPH extends LPSM_LeadStruggleMode
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPPlayerPawn(inPawn).TuneDataStrugglePlayerPackHunterNPH;
    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

defaultproperties
{
    PlayerCtrlStateName="StrugglePackHunterAttackNPH"
    TuneDataClass=Class'LPTuneDataStrugglePlayerPackHunterNPH'
    ApplyDamageClass=Class'LPDamageTypePackHunterStruggleNPH'
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_PlayerPackHunterStruggleNPH.StruggleCamParamObj'
    begin object name=StruggleCamParamObj
    end object
    StruggleCamParams=StruggleCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_PlayerPackHunterStruggleNPH.StruggleCamTransitionInParamObj'
    begin object name=StruggleCamTransitionInParamObj
    end object
    StruggleTransitionInParam=StruggleCamTransitionInParamObj
    FollowerSpecialMoveClass=Class'LPSM_PackHunterPlayerStruggleNPH'
}