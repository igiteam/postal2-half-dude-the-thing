class LPSM_SpitterStunStart extends LPSM_SpitterStunBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super(LPSM_SpitterAttackMoves).SpecialMoveStarted(bForced, PrevMove);
    SPGFCoverAIController(MySPPawn.Controller).PawnZeroVelocity();
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}