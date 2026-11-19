class LPSM_SpitterStunFinish extends LPSM_SpitterStunBase
    config(Game);

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    MySpitterPawn.RestoreLegCores();
    super(LPSM_SpitterAttackMoves).SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}