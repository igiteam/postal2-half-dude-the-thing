class LPSM_PlayerBurrowerStruggleMelee extends LPSM_LeadStruggleMode
    config(Game);

function StartInteraction()
{
    // End:0x38
    if(PlayerPawn.bBearTrapped)
    {
        PlayerCtrlStateName = 'None';        
    }
    else
    {
        PlayerCtrlStateName = Class'LPSM_PlayerBurrowerStruggleMelee'.default.PlayerCtrlStateName;
    }
    super.StartInteraction();
    //return;    
}

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPPlayerPawn(inPawn).TuneDataStrugglePlayerBurrowerMelee;
    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

defaultproperties
{
    PlayerCtrlStateName="StruggleBurrowerAttackMelee"
    TuneDataClass=Class'LPTuneDataStrugglePlayerBurrowerMelee'
    ApplyDamageClass=Class'LPDamageTypeMelee'
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_PlayerBurrowerStruggleMelee.StruggleCamParamObj'
    begin object name=StruggleCamParamObj
    end object
    StruggleCamParams=StruggleCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_PlayerBurrowerStruggleMelee.StruggleCamTransitionInParamObj'
    begin object name=StruggleCamTransitionInParamObj
    end object
    StruggleTransitionInParam=StruggleCamTransitionInParamObj
    FollowerSpecialMoveClass=Class'LPSM_BurrowerPlayerStruggleMelee'
}