class LPSM_LedgeWalkNearFall extends SPGFCoverSpecialMove
    config(Pawn);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    PlayAnim();
    //return;    
}

function PlayAnim()
{
    local /*0x97E50000-0x00000000*/ private byte TranslationExtraction, RotationExtraction, RMMode;

    TranslationExtraction = 0;
    RotationExtraction = 0;
    RMMode = 2;
    TranslationExtraction = 2;
    RMMode = 3;
    MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(0), AnimFinished,, 1.0000000, 0.1000000, 0.1000000, false, true, TranslationExtraction, RotationExtraction, true, RMMode);
    //return;    
}

function AnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.EndSpecialMove(Class);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}