class LPSM_CoreShield_Destroyed extends SPSpecialMove
    config(Game);

protected function InternalCanDoSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    PlayDestructionIdle();
    //return;    
}

function PlayDestructionIdle()
{
    LPAIPawnNushiCoreShield(MySPPawn).HideCore();
    MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(0),,, 1.0000000, 0.0000000, 0.1000000, true, true);
    //return;    
}

function StartRecovery()
{
    MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(1), EndSpecialMove,, 1.0000000, 0.2000000, 0.1000000, false, true);
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
        // End:0x40
        case Class'LPSMMTypes'.default.SMM_StartRecovery:
            StartRecovery();
            return true;
        // End:0xFFFF
        default:
            // End:0x46
            break;
            break;
    }
    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function EndSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    LPAIPawnNushiCoreShield(MySPPawn).ShowCore();
    LPAIPawnNushiCoreShield(MySPPawn).Recover();
    MySPPawn.EndCurrentSpecialMove();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPAIPawnNushiCoreShield(MySPPawn).AttackAnimTree;
    //return ReturnValue;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}