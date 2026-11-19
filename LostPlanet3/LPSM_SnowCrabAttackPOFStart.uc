class LPSM_SnowCrabAttackPOFStart extends LPSM_SnowCrabAttackPOFStartBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    PlayBackRate = LPAIPawnBaseSnowCrab(MySPPawn).TuneDataIceCrab.ClawAttackAnimationRatePOF.GetValue();
    super(LPSM_SnowCrabAttackHastyPincerBashBase).SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], MyCrab;
    local /*0x97E50000-0x00000000*/ private float R;

    super.AnimationStartedPlaying(SeqNode);
    MyCrab = LPAIPawnBaseSnowCrab(MySPPawn);
    R = RandRange(0.0000000, 1.0000000);
    // End:0xA9
    if((MyCrab != none) && R <= MyCrab.ChanceOfPlayingAggressiveClawStrike)
    {
        MyCrab.StartAdditiveNudgeRightAnimation();
    }
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}