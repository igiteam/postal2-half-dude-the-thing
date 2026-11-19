class LPSM_DirectionalHitReactionVs extends LPSM_DirectionalHitReaction
    config(Game);

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x9B
    if(MySPPawn.Controller == none)
    {
        MySPPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);        
    }
    //return;    
}
