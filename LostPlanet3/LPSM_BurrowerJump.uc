class LPSM_BurrowerJump extends SPSM_PlayAnimBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], MyBurrowerPawn;

    super.SpecialMoveStarted(bForced, PrevMove);
    MyBurrowerPawn = LPAIPawnBurrower(MySPPawn);
    // End:0x8A
    if(MyBurrowerPawn != none)
    {
        MyBurrowerPawn.bJumping = true;
        MyBurrowerPawn.SetCollisionType(3);
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, MyBurrowerPawn;

    super.SpecialMoveEnded(PrevMove, NextMove);
    MyBurrowerPawn = LPAIPawnBurrower(MySPPawn);
    // End:0x89
    if(MyBurrowerPawn != none)
    {
        MyBurrowerPawn.bJumping = false;
        MyBurrowerPawn.SetCollisionType(1);
    }
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}