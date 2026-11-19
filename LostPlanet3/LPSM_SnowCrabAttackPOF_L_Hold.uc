class LPSM_SnowCrabAttackPOF_L_Hold extends LPSM_SnowCrabAttackPOFBase
    config(Game);

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609];

    super.AnimationStartedPlaying(SeqNode);
    LPAIPawnBaseSnowCrab(MySPPawn).CauseClawPlayerStumble('LeftClaw2');
    MySPPawn.ZeroRotationRate();
    MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    MySPPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.ResetRotationRate();
    //return;    
}

defaultproperties
{
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}