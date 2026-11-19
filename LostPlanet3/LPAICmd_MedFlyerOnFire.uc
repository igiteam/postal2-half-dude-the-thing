class LPAICmd_MedFlyerOnFire extends LPAICmd_Attack within LPAIControllerMedFlyer;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurDamageAssessmentCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerPawnThatIsDoingMelee[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Duration;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SafeSeperation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxFleeDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PawnThatSetMeOnFire[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxOnFireSpecialMoveTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOnFireSpecialMoveStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxPanicSpecialMoveTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimePanicSpecialMoveStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WithdrawAfterBeingSetOnFireLoc[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfAttemptsToFindWithDrawPoint[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDontStopDesiredSpeedOnSpeedUpdate;

function Pushed()
{
    super.Pushed();
    Outer.bReactingToBeingOnFire = true;
    TimeStarted = Outer.WorldInfo.TimeSeconds;
    MaxOnFireSpecialMoveTime = default.MaxOnFireSpecialMoveTime;
    TimeOnFireSpecialMoveStarted = -1.0000000;
    MaxPanicSpecialMoveTime = Outer.myAIPawn.TuneDataAIPawn.TimeAfterStartOfOnFirePanicToForceKill.GetValue();
    TimePanicSpecialMoveStarted = -1.0000000;
    Outer.Kynapse_ActivateBot(true);
    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetFleeingMaxSpeedScale(Outer.myAIPawn));
    bDontStopDesiredSpeedOnSpeedUpdate = Outer.myAIPawn.bDontStopDesiredSpeedOnSpeedUpdate;
    WithdrawAfterBeingSetOnFireLoc = vect(0.0000000, 0.0000000, 0.0000000);
    MoveToPositionCmd = none;
    //return;    
}

function Popped()
{
    Outer.bReactingToBeingOnFire = false;
    PlayerPawnThatIsDoingMelee = none;
    Outer.Kynapse_ClearLatentAgent();
    Outer.Kynapse_ActivateBot(false);
    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
    Outer.myAIPawn.bDontStopDesiredSpeedOnSpeedUpdate = bDontStopDesiredSpeedOnSpeedUpdate;
    super.Popped();
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    Outer.Kynapse_ClearLatentAgent();
    Outer.Kynapse_ActivateBot(false);
    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
    super(LPAICommand).Paused(NewCommand);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    Outer.Kynapse_ActivateBot(true);
    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetFleeingMaxSpeedScale(Outer.myAIPawn));
    //return;    
}

function SetPawnWhoSetMeOnFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL FleeFrom[8388609];

    PawnThatSetMeOnFire = FleeFrom;
    //return;    
}

function NotifyPlayerStartMelee()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bHandled;
    local /*0x97E50000-0x00000000*/ private @NULL LeechPawn;

    LeechPawn = LPAIPawnLeech(Outer.MySPPawn);
    // End:0x42
    if(LeechPawn == none)
    {
        return false;
    }
    bHandled = super(LPAICommand).NotifyPlayerStartMelee(PlayerPawn);
    // End:0xDC
    if(!bHandled)
    {
        Outer.SetTimer(FRand() * LeechPawn.TuneDataLeech.JumpBackMaxRandomLag, false, 'ReactToStartMelee', self);
        PlayerPawnThatIsDoingMelee = PlayerPawn;
    }
    return true;
    //return ReturnValue;    
}

function ReactToStartMelee()
{
    GotoState('ReactToMelee');
    //return;    
}

function OnJustGotSetOnFireFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    GotoState('StatePanic');
    //return;    
}

function OnOnFirePanicFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    GotoState('StateFleeEnded');
    //return;    
}

function StartMovingToWithdrawpoint()
{
    Outer.myAIPawn.PlayWithdrawingScaredSound();
    MoveToPositionCmd = Outer.CmdMoveToPosition(WithdrawAfterBeingSetOnFireLoc,, -1.0000000, Outer.CmdStatus_MoveToPosition, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfWithdraw);
    MoveToPositionCmd.SetMovementMonitorParameters(true, Outer.myAIPawn.TuneDataAIPawn.DurationBetweenMovementDeltaDuringOnFireWithdraw, Outer.myAIPawn.TuneDataAIPawn.MinMovementDeltaDuringOnFireWithdraw, Outer.myAIPawn.TuneDataAIPawn.DelayAfterStartOfOnFireWithdrawBeforeMonitorStarts, NotifyOfFailedMovementToWithdrawPoint);
    //return;    
}

function NotifyOfFailedMovementToWithdrawPoint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(MoveToPositionCmd != none)
    {
        Outer.AbortCommand(MoveToPositionCmd);
    }
    return true;
    //return ReturnValue;    
}

function LPCommandTick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x84
    if((int(Outer.WorldInfo.NetMode) != int(NM_Standalone)) && !Outer.IsOnFire())
    {
        Outer.PopCommand(self);
    }
    //return;    
}

state StateCmdActive
{
    function HasMaxSpecialMoveTimePassedAndMovedNeedForceStop()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float TimePassed;

        TimePassed = Outer.WorldInfo.TimeSeconds - TimeOnFireSpecialMoveStarted;
        // End:0x89
        if(TimePassed > MaxOnFireSpecialMoveTime)
        {
            MyPawn.EndSpecialMove(Class'LPSM_JustGotSetOnFire');
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    Outer.Focus = PawnThatSetMeOnFire;
    TimeOnFireSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    MyPawn.DoSpecialMove(Class'LPSM_JustGotSetOnFire', true, true, self.OnJustGotSetOnFireFinished);
    // End:0xEE
    if(MaxOnFireSpecialMoveTime > float(0))
    {
        J0xBF:

        // End:0xEE [Loop If]
        if(!HasMaxSpecialMoveTimePassedAndMovedNeedForceStop())
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0xBF;
        }
    }
    GotoState('StatePanic');
    stop;                
}

state StateFleeEnded
{Begin:

    Outer.myAIPawn.TakeDamage(5000, PawnThatSetMeOnFire.Controller, PawnThatSetMeOnFire.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypeForced');
    Outer.PopCommand(self);
    stop;            
}

state StatePanic
{
    function HasMaxPanicSpecialMoveTimePassedAndMovedNeedForceStop()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float TimePassed;

        TimePassed = Outer.WorldInfo.TimeSeconds - TimePanicSpecialMoveStarted;
        // End:0x89
        if(TimePassed > MaxPanicSpecialMoveTime)
        {
            MyPawn.EndSpecialMove(Class'LPSM_OnFirePanic');
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    TimePanicSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    MyPawn.DoSpecialMove(Class'LPSM_OnFirePanic', true, true, self.OnOnFirePanicFinished);
    // End:0xC6
    if(MaxOnFireSpecialMoveTime > float(0))
    {
        J0x97:

        // End:0xC6 [Loop If]
        if(!HasMaxPanicSpecialMoveTimePassedAndMovedNeedForceStop())
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0x97;
        }
    }
    GotoState('StateFleeEnded');
    stop;                
}

defaultproperties
{
    Duration=6.0000000
    MaxOnFireSpecialMoveTime=5.0000000
    MaxPanicSpecialMoveTime=5.0000000
    bInterruptible=false
}