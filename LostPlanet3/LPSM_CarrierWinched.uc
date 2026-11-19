class LPSM_CarrierWinched extends LPSM_LargePawnWinched
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
    //return;    
}

function StartAnimation()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLooping[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeq;

    AnimSeq = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(Index),,, 1.0000000, 0.2000000, 0.2500000, bLooping,, 2, 2, true);
    // End:0x92
    if(AnimSeq != none)
    {
        AnimSeq.SetIssueAnimFinishedCallbackOnInterruption(true);
        return true;        
    }
    else
    {
        ScriptTrace();
        return false;
    }
    //return ReturnValue;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MySPPawn.HitReactLogicAnimTree;
    //return ReturnValue;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}