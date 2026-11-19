class LPSM_SnowCrabStunBase extends LPSM_SnowCrabAttackHastyPincerBashBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    CrabPawn = LPAIPawnBaseSnowCrab(MySPPawn);
    // End:0x7C
    if(CrabPawn != none)
    {
        CrabPawn.MyBaseCrabController.SetDyanmicPincherBashStretchRangeForStunned();
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0x43
    if(CrabPawn != none)
    {
        CrabPawn.MyBaseCrabController.SetDyanmicPincherBashStretchRangeForNotStunned();
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}
