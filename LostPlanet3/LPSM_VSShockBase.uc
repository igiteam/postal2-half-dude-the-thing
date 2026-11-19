class LPSM_VSShockBase extends SPSpecialMove
    abstract
    config(Game);

function AnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    PlayShockedAnim();
    //return;    
}

function PlayShockedAnim()
{
    MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(0), AnimFinished,, 1.0000000, 0.1000000, -1.0000000, false, true);
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
        // End:0x41
        case Class'LPSMMTypes'.default.SMM_TossCrushedPawn:
            PlayTossReaction();
            // End:0x6D
            break;
        // End:0x67
        case Class'LPSMMTypes'.default.SMM_IsPawnGrabbed:
            return true;
            // End:0x6D
            break;
        // End:0xFFFF
        default:
            // End:0x6D
            break;
            break;
    }
    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function PlayTossReaction()
{
    MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(1), AnimFinished,, 1.0000000, 0.1000000, -1.0000000, false, true);
    //return;    
}

defaultproperties
{
    DefaultAICommand=Class'LPAICmd_SpecialMoveBase'
}