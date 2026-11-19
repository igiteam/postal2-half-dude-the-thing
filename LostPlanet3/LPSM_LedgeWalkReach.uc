class LPSM_LedgeWalkReach extends SPGFCoverSpecialMove
    config(Pawn);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayerReaching;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayingReachEndAnim;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentlyPlayingAnim;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    bPlayerReaching = true;
    bPlayingReachEndAnim = false;
    StartReach();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x4B
    if(CurrentlyPlayingAnim != none)
    {
        MySPPawn.StopFullBodyAnim();
    }
    CurrentlyPlayingAnim = none;
    //return;    
}

function StartReach()
{
    local /*0x97E50000-0x00000000*/ private byte TranslationExtraction, RotationExtraction, RMMode;

    TranslationExtraction = 0;
    RotationExtraction = 0;
    RMMode = 2;
    TranslationExtraction = 2;
    RMMode = 3;
    CurrentlyPlayingAnim = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(0), IntroAnimDone,, 1.0000000, 0.1000000, 0.1000000, false, true, TranslationExtraction, RotationExtraction, true, RMMode);
    //return;    
}

function IntroAnimDone()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    StartReachLoop();
    //return;    
}

function StartReachLoop()
{
    local /*0x97E50000-0x00000000*/ private byte TranslationExtraction, RotationExtraction, RMMode;

    TranslationExtraction = 0;
    RotationExtraction = 0;
    RMMode = 2;
    CurrentlyPlayingAnim = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(1),,, 1.0000000, 0.1000000, 0.1000000, true, true, TranslationExtraction, RotationExtraction, true, RMMode);
    //return;    
}

function EndReach()
{
    local /*0x97E50000-0x00000000*/ private byte TranslationExtraction, RotationExtraction, RMMode;

    TranslationExtraction = 0;
    RotationExtraction = 0;
    RMMode = 2;
    TranslationExtraction = 2;
    RMMode = 3;
    CurrentlyPlayingAnim = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(2), ReachEndAnimDone,, 1.0000000, 0.1000000, 0.1000000, false, true, TranslationExtraction, RotationExtraction, true, RMMode);
    MySPPawn.EndSpecialMove(Class);
    bPlayingReachEndAnim = true;
    //return;    
}

function ReachEndAnimDone()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    CurrentlyPlayingAnim = none;
    MySPPawn.EndSpecialMove(Class);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}