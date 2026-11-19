class LPSM_BurrowerRecoverFromRagdoll extends LPSM_AkridSmallRecoverFromRagdoll
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
    LPAIPawnBurrower(MySPPawn).GoUnderground(true);
    //return;    
}

defaultproperties
{
    AnimTemplateTree=AnimTree'BurrowerAttackAnim.BurrowerAttackAnimations'
    OrientationBoneName="JO_hip"
    FacingBoneName="JO_hip"
    AnimationTemplateNodeNames=/* Array type was not detected. */
}