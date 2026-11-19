class LPSM_PlayerVSDrillArmSwingShoulderCharge extends LPSM_PlayerVSArmSwingBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    StopUpperBodyAnimation();
    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x55
    if(MyLPVSPlayerPawn != none)
    {
        MyLPVSPlayerPawn.NotifyArmQuickGrab();
    }
    // End:0xAA
    if(MyLPVSPlayerPawn.SubscribedOnArmAction != none)
    {
        MyLPVSPlayerPawn.OnArmAction('ShoulderCharge');
    }
    //return;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609];

    super(SPSM_PlayAnimBase).AnimationStartedPlaying(SeqNode);
    //return;    
}

defaultproperties
{
    PlaybackType=SPSM_PlayAnimType.SPSM_PlayAnimFullBody
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    AnimationTemplateNodeNames=/* Array type was not detected. */
}