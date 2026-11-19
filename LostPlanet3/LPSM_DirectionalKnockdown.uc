class LPSM_DirectionalKnockdown extends LPSM_DirectionalDeath
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], LPPC;

    LPPC = LPPlayerController(MySPPawn.Controller);
    // End:0x63
    if(LPPC != none)
    {
        LPPC.GotoState('Incapacitated');
    }
    super(SPSM_DirectionalDeath).SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    LPPlayerPawn(MySPPawn).OnKnockdownAnimFinished();
    super(SPSM_DirectionalDeath).SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    bEndSpecialMoveOnAnimFinish=true
}