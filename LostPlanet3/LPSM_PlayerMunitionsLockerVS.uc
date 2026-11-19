class LPSM_PlayerMunitionsLockerVS extends LPSM_PlayerMunitionsLocker
    config(Game);

enum EMunitionsLockerAnimationIndex
{
    MLocker_Intro,                  // 0
    MLocker_Loop,                   // 1
    MLocker_Outro,                  // 2
    MLocker_MAX                     // 3
};

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x62
    if(MyPlayerController != none)
    {
        MyPlayerController.myLPHUD.SetVSJobLogFocused(true);
    }
    PlayIntro();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0x45
    if(MyPlayerController != none)
    {
        MyPlayerController.myLPHUD.SetVSJobLogFocused(false);
    }
    super(LPSM_PlayerArmUI).SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function PlayCycle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x58
    if((MyPlayerController != none) && bOpenLockerOnStart == false)
    {
        MyPlayerController.myLPHUD.ShowMunitionsLocker(true);
    }
    super(LPSM_PlayerArmUI).PlayCycle(Node, InUserData, bInterrupted);
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
        case Class'LPSMMTypes'.default.SMM_AbortJobLog:
            return true;
        // End:0x59
        case Class'LPSMMTypes'.default.SMM_PlayerRequestsExitVS:
            return true;
        // End:0xFFFF
        default:
            return super(LPSM_PlayerArmUI).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

defaultproperties
{
    bOpenLockerOnStart=false
    AnimationTemplateNodeNames=/* Array type was not detected. */
}