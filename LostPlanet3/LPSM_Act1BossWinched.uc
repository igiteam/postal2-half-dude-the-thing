class LPSM_Act1BossWinched extends LPSM_LargePawnWinched
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    LPAIPawnAct1Boss(MySPPawn).bIsWinched = true;
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    LPAIPawnAct1Boss(MySPPawn).bIsWinched = false;
    //return;    
}

function StartDragAnimation()
{
    MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(1),,, 1.0000000, 0.2000000, 0.2500000, true);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}