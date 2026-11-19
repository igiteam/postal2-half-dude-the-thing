class LPSM_LeechRecoverFromRagdoll extends LPSM_AkridSmallRecoverFromRagdoll
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    LPAIPawnLeech(MySPPawn).SetNotInverted();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    AnimTemplateTree=AnimTree'LeechAttackAnimTemplate.LeechAttackAnimations'
    OrientationBoneName="JO_Chest"
    FacingBoneName="JO_Chest"
    AnimationTemplateNodeNames=/* Array type was not detected. */
}