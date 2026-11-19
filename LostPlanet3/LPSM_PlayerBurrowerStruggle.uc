class LPSM_PlayerBurrowerStruggle extends LPSM_LeadStruggleMode
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPPlayerPawn(inPawn).TuneDataStrugglePlayerBurrower;
    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x58
    if(PlayerPawn.Health <= 0)
    {
        PlayerPawn.Destroy();
    }
    //return;    
}

defaultproperties
{
    PlayerCtrlStateName="StruggleBurrowerAttack"
    TuneDataClass=Class'LPTuneDataStrugglePlayerBurrower'
    ApplyDamageClass=Class'LPDamageTypeBurrowerStruggle'
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_PlayerBurrowerStruggle.StruggleCamParamObj'
    begin object name=StruggleCamParamObj
    end object
    StruggleCamParams=StruggleCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_PlayerBurrowerStruggle.StruggleCamTransitionInParamObj'
    begin object name=StruggleCamTransitionInParamObj
    end object
    StruggleTransitionInParam=StruggleCamTransitionInParamObj
    FollowerSpecialMoveClass=Class'LPSM_BurrowerPlayerStruggle'
}