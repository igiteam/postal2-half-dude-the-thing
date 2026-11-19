class LPSM_GrappleDownLand extends LPSM_GrapplingBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], PlayerPawn;

    PlayerPawn = LPPlayerPawn(MySPPawn);
    PlayerPawn.OnGrappleDownLanded();
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    LPPlayerPawn(MySPPawn).StopGrappling();
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}