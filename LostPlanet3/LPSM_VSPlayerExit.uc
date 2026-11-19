class LPSM_VSPlayerExit extends LPSM_VSPlayerEnterExitBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    LPBaseVSPlayerPawn(MySPPawn).bShouldHoldAnticipation = true;
    // End:0x6E
    if(LPPlayerTurretPawn(MySPPawn) == none)
    {
        MySPPawn.DoSpecialMove(Class'LPSM_VSWaitEntryBegin', true);
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}
