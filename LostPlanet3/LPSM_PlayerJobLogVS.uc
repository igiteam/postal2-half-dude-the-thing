class LPSM_PlayerJobLogVS extends LPSM_PlayerJobLog
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x95
    if(MyPlayerController != none)
    {
        // End:0x89
        if(!MyPlayerController.bWaitingForJobLogToOpen)
        {
            MyPlayerController.myLPHUD.SetVSJobLogFocused(true);            
        }
        else
        {
            bWaitingForMessageCompletion = true;
        }
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0x45
    if(MyPlayerController != none)
    {
        MyPlayerController.myLPHUD.SetVSJobLogFocused(false, false);
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function PlayCycle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x6D
    if((MyPlayerController != none) && MySPPawn.GetCurrentSpecialMoveInstance() == self)
    {
        MyPlayerController.myLPHUD.ShowJobLog(true, true);
    }
    super(LPSM_PlayerArmUI).PlayCycle(Node, InUserData, bInterrupted);
    //return;    
}

function FinishedWaitingForHUDMessage()
{
    // End:0x46
    if(MyPlayerController != none)
    {
        MyPlayerController.myLPHUD.ShowJobLog(true, true);
    }
    super.FinishedWaitingForHUDMessage();
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
        // End:0x56
        case Class'LPSMMTypes'.default.SMM_PlayerRequestsExitVS:
            MySPPawn.EndCurrentSpecialMove(self);
            return false;
        // End:0xFFFF
        default:
            return super(LPSM_PlayerArmUI).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}