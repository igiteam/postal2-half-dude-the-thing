class LPSM_PlayerAct1BossStruggle extends LPSM_LeadStruggleMode
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateTree;

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPPlayerPawn(inPawn).TuneDataStrugglePlayerAct1Boss;
    super.InitSpecialMove(inPawn, InHandle);
    MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    MySPPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x19
    if(AnimTemplateTree != none)
    {
        return AnimTemplateTree;
    }
    return super.GetAnimTemplateTreeForSpecialMove();
    //return ReturnValue;    
}

event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    // End:0x41
    if(MySPPawn != none)
    {
        MySPPawn.ZeroMovementVariables();
    }
    // End:0x6F
    if(FollowerPawn != none)
    {
        FollowerPawn.ZeroMovementVariables();
    }
    //return;    
}

defaultproperties
{
    AnimTemplateTree=AnimTree'AKD_act1bs.PlayerBossStruggleAnims'
    PlayerCtrlStateName="StruggleAct1BossAttack"
    TuneDataClass=Class'LPTuneDataStrugglePlayerAct1Boss'
    ApplyDamageClass=Class'LPDamageTypeLeechStruggle'
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_PlayerAct1BossStruggle.StruggleCamParamObj'
    begin object name=StruggleCamParamObj
    end object
    StruggleCamParams=StruggleCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_PlayerAct1BossStruggle.StruggleCamTransitionInParamObj'
    begin object name=StruggleCamTransitionInParamObj
    end object
    StruggleTransitionInParam=StruggleCamTransitionInParamObj
    FollowerSpecialMoveClass=Class'LPSM_Act1BossPlayerStruggle'
}