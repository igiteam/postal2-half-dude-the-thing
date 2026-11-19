class LPSM_DongoFrenzyIn extends LPSM_SnowCrabAttackPOFStartBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyDongoPawn[536870913];

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    MyDongoPawn = LPAIPawnDongo(MySPPawn);
    super(LPSM_SnowCrabAttackHastyPincerBashBase).SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    MyDongoPawn = none;
    //return;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609];

    super.AnimationStartedPlaying(SeqNode);
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Discard
    RotationExtraction=ERootRotationOption.RRO_Discard
    bManageRootMotionMode=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}