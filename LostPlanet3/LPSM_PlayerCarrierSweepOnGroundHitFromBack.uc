class LPSM_PlayerCarrierSweepOnGroundHitFromBack extends LPSM_PlayerCarrierSweepOnGround
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

    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.DoSpecialMove(Class'LPSM_PlayerCarrierSweepGetUpHitFromBack');
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}