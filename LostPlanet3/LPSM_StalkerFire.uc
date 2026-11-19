class LPSM_StalkerFire extends SPSM_PlayAnimBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    MySPPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    PlayBackRate = 1.3500000;
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609];

    super.AnimationStartedPlaying(SeqNode);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}