class LPSM_PlayerArmUI extends SPSpecialMove
    config(Game);

enum EArmUIAnimationIndex
{
    ArmUI_Intro,                    // 0
    ArmUI_Loop,                     // 1
    ArmUI_Outro,                    // 2
    ArmUI_MAX                       // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNormalShutdown[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPlayerController[536870913];

function GetControllerState()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    //return ReturnValue;    
}

function HideUI()
{
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], vsPawn;

    bNormalShutdown = false;
    super.SpecialMoveStarted(bForced, PrevMove);
    MyPlayerController = LPPlayerController(MySPPawn.Controller);
    // End:0x25B
    if(MySPPawn.IsLocallyControlled() && MyPlayerController != none)
    {
        MyPlayerController.SetAimDownSightMode(false);
        MyPlayerController.MPStartState(GetControllerState());
        MyPlayerController.StopFire(0);
        MyPlayerController.bFire = 0;
        // End:0x1C2
        if(LPPlayerInput(MyPlayerController.PlayerInput) != none)
        {
            LPPlayerInput(MyPlayerController.PlayerInput).UseDefaultRotationInputCurve();
            LPPlayerInput(MyPlayerController.PlayerInput).bDisableMouseAiming = true;
        }
        vsPawn = LPBaseVSPlayerPawn(MySPPawn);
        // End:0x25B
        if(vsPawn != none)
        {
            vsPawn.SetPitchControllerTarget(0, 0.2500000);
            vsPawn.SetPitchControllerLock(true);
            MyPlayerController.StopVSCockpitCameraShake(vsPawn);
        }
    }
    //return;    
}

function PlayIntro()
{
    MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(0), PlayCycle,, 1.0000000, 0.1000000, 0.2500000, false, true, 2, 0, true, 3);
    //return;    
}

function PlayCycle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x27
    if(MySPPawn.GetCurrentSpecialMoveInstance() != self)
    {
        return;
    }
    // End:0x36
    if(bInterrupted)
    {
        return;
    }
    MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(1),,, 1.0000000, 0.1000000, 0.2500000, true, true, 2, 0, true, 3);
    //return;    
}

function PlayOutro()
{
    local /*0x97E50000-0x00000000*/ private @NULL Seq;

    Seq = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(2), OutroFinished,, 1.0000000, 0.1000000, 0.2500000, false, true, 2, 0, true, 3);
    Seq.SetIssueAnimFinishedCallbackOnInterruption(true);
    //return;    
}

function OutroFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    bNormalShutdown = true;
    MySPPawn.EndSpecialMove(Class);
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
        case Class'LPSMMTypes'.default.SMM_PlayJobLogOutro:
            PlayOutro();
            return true;
        // End:0x83
        case Class'LPSMMTypes'.default.SMM_AbortJobLog:
            MySPPawn.EndCurrentSpecialMove(self);
            return true;
        // End:0xFFFF
        default:
            return super.ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, LPP, vsPawn;

    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x47
    if((NextMove != none) || bNormalShutdown == false)
    {
        HideUI();
    }
    // End:0xB5
    if(MySPPawn != none)
    {
        // End:0xB5
        if(MySPPawn.IsLocallyControlled())
        {
            SPPlayerController(MySPPawn.Controller).UnPauseFire();
        }
    }
    // End:0x1FA
    if(MySPPawn.IsLocallyControlled() && MyPlayerController != none)
    {
        LPP = LPPlayerPawn(MySPPawn);
        // End:0x1FA
        if(((LPP != none) && !LPP.bIncapacitated) || ClassIsChildOf(MySPPawn.Class, Class'LPVSPlayerPawn'))
        {
            // End:0x1B6
            if(MyPlayerController.bCinematicMode)
            {
                MyPlayerController.MPStartState('PlayerWalking', true);                
            }
            else
            {
                MyPlayerController.EnterWalkState();
            }
            MySPPawn.StopFullBodyAnim(0.3000000);
        }
    }
    vsPawn = LPBaseVSPlayerPawn(MySPPawn);
    // End:0x26D
    if(vsPawn != none)
    {
        vsPawn.SetPitchControllerLock(false);
        MyPlayerController.StartVSCockpitCameraShake(vsPawn);
    }
    // End:0x2D9
    if(LPPlayerInput(MyPlayerController.PlayerInput) != none)
    {
        LPPlayerInput(MyPlayerController.PlayerInput).bDisableMouseAiming = false;
    }
    //return;    
}
