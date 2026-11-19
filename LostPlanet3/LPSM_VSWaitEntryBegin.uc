class LPSM_VSWaitEntryBegin extends SPSpecialMove
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x81
    if(LPBaseVSPlayerPawn(MySPPawn).bShouldHoldAnticipation)
    {
        LPBaseVSPlayerPawn(MySPPawn).bShouldHoldAnticipation = false;
        AnimFinished(none, 0, false);
        return;
    }
    MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(0), AnimFinished,, 1.0000000, 1.0000000, -1.0000000, false, true);
    //return;    
}

function AnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(1), None,, 1.0000000, 0.1000000, -1.0000000, false, true);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x4F
    if(NextMove == none)
    {
        MySPPawn.StopCustomAnim(0.5000000);
    }
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x36
        case Class'LPSMMTypes'.default.SMM_AllowMunitionsLockerAccess:
            return true;
        // End:0xFFFF
        default:
            return super.ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}