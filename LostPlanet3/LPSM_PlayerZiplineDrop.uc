class LPSM_PlayerZiplineDrop extends LPSM_PlayerZiplineBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    PlayPreDropSequence();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.StopFullBodyAnim(0.1000000);
    //return;    
}

function AnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    PlayDropSequence();
    //return;    
}

function PlayPreDropSequence()
{
    bEndSpecialMoveOnAnimFinish = false;
    MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(0), AnimFinished,, 1.0000000, 0.1000000, 0.1000000, false, true,,, true);
    //return;    
}

function DropFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.EndSpecialMove(Class);
    //return;    
}

function PlayDropSequence()
{
    bEndSpecialMoveOnAnimFinish = true;
    MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(1), DropFinished,, 1.0000000, 0.1000000, 0.1000000, false, true,,, true);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}