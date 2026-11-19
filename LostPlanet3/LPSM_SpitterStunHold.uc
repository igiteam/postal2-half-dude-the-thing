class LPSM_SpitterStunHold extends LPSM_SpitterStunBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], SpitterPawn;

    SpitterPawn = LPAIPawnSpitter(MySPPawn);
    // End:0x4C
    if(SpitterPawn != none)
    {
        SpitterPawn.SetGrabPointEnabledByIndex(0, true);
    }
    super(LPSM_SpitterAttackMoves).SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, SpitterPawn;

    EnableRotation(false);
    SpitterPawn = LPAIPawnSpitter(MySPPawn);
    // End:0x57
    if(SpitterPawn != none)
    {
        SpitterPawn.SetGrabPointEnabledByIndex(0, false);
    }
    super(LPSM_SpitterAttackMoves).SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}