class LPSM_SnowCrabTauntGrenadeInMouthToStun extends LPSM_SnowCrabGrenadeReaction
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], myLPAIPawnBaseSnowCrab;

    super.SpecialMoveStarted(bForced, PrevMove);
    myLPAIPawnBaseSnowCrab = LPAIPawnBaseSnowCrab(MySPPawn);
    // End:0x69
    if(myLPAIPawnBaseSnowCrab != none)
    {
        myLPAIPawnBaseSnowCrab.AttachedGrenadeJustExploded(7);
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super(LPSM_SnowCrabStunBase).SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    bManageRootMotionMode=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}