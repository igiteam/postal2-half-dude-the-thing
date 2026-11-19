class LPSM_BurrowerJumpBiteStrike extends LPSM_BurrowerStaticStrikeBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], MyBurrowerPawn;

    super.SpecialMoveStarted(bForced, PrevMove);
    MyBurrowerPawn = LPAIPawnBurrower(MySPPawn);
    // End:0x68
    if(MyBurrowerPawn != none)
    {
        MyBurrowerPawn.GoUnderground(false);
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, MyBurrowerPawn;
    local /*0x97E50000-0x00000000*/ private bool bTransitionToStruggleMode;

    super.SpecialMoveEnded(PrevMove, NextMove);
    bTransitionToStruggleMode = false;
    // End:0x4C
    if(LPSM_FollowerStruggleMode(NextMove) != none)
    {
        bTransitionToStruggleMode = true;
    }
    // End:0xA6
    if(!bTransitionToStruggleMode)
    {
        MyBurrowerPawn = LPAIPawnBurrower(MySPPawn);
        // End:0xA6
        if(MyBurrowerPawn != none)
        {
            MyBurrowerPawn.GoUnderground(true);
        }
    }
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}