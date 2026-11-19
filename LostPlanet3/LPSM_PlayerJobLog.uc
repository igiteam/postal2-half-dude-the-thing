class LPSM_PlayerJobLog extends LPSM_PlayerArmUI
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWaitingForMessageCompletion;

function GetControllerState()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'JobLog';
    //return ReturnValue;    
}

function HideUI()
{
    // End:0x46
    if(MyPlayerController != none)
    {
        MyPlayerController.myLPHUD.ShowJobLog(false);
    }
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x5A
    if(!MyPlayerController.bWaitingForJobLogToOpen)
    {
        bWaitingForMessageCompletion = false;
        PlayIntro();        
    }
    else
    {
        bWaitingForMessageCompletion = true;
    }
    //return;    
}

function FinishedWaitingForHUDMessage()
{
    bWaitingForMessageCompletion = false;
    PlayIntro();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    bWaitingForMessageCompletion = false;
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
    bAllowAdditiveHitReaction=true
}