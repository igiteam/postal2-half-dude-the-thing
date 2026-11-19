class LPAICmd_PhadyrTurtle extends LPAICmd_Strike within LPAIControllerPhadyr;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLastSpecialMoveStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DurationOfTurtleLoop[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TotalDamageReceivedDuringTurtle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTurtleLoopTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTurtleLoopTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageAmountToCauseEndOfTurtle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDistanceToBeAwayForThisTurtle[536870913];

function Pushed()
{
    super.Pushed();
    TimeLastSpecialMoveStarted = -1.0000000;
    DurationOfTurtleLoop = -1.0000000;
    MinTurtleLoopTime = 1.0000000;
    MaxTurtleLoopTime = 5.0000000;
    TotalDamageReceivedDuringTurtle = 0.0000000;
    //return;    
}

function Popped()
{
    super.Popped();
    FinishTurtleLoopSpecialMove();
    Outer.ResetTurtleStatusVars();
    //return;    
}

function SetMinTurtleLoopTime()
{
    local /*0x97E50000-0x00000000*/ private float TimeToLoop[8388609];

    MinTurtleLoopTime = TimeToLoop;
    //return;    
}

function SetMaxTurtleLoopTime()
{
    local /*0x97E50000-0x00000000*/ private float TimeToLoop[8388609];

    MaxTurtleLoopTime = TimeToLoop;
    //return;    
}

function SetDamageAmountToCauseEndOfTurtle()
{
    local /*0x97E50000-0x00000000*/ private float DamageToCauseEnd[8388609];

    DamageAmountToCauseEndOfTurtle = DamageToCauseEnd;
    //return;    
}

function SetMinDistanceToBeAwayForThisTurtle()
{
    local /*0x97E50000-0x00000000*/ private float MinDistanceNeeded[8388609];

    MinDistanceToBeAwayForThisTurtle = MinDistanceNeeded;
    //return;    
}

function On_LPSM_GoingIntoTurtle_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentTurtleState = 3;
    //return;    
}

function On_LPSM_ComingOutOfTurtle_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentTurtleState = 6;
    //return;    
}

function FinishTurtleLoopSpecialMove()
{
    Outer.PhadyrPawn.EndSpecialMove(Class'LPSM_PhadyrTurtleLoop');
    Outer.CurrentTurtleState = 4;
    //return;    
}

function GetTurtleLoopTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], TimeToLoop;

    TimeToLoop = RandRange(MinTurtleLoopTime, MaxTurtleLoopTime);
    return TimeToLoop;
    //return ReturnValue;    
}

function GoIntoTurtle()
{
    // End:0x8B
    if(Outer.PhadyrPawn.bUsingLowPosture)
    {
        Outer.PhadyrPawn.DoSpecialMove(Class'LPSM_PhadyrGoingIntoTurtleLow', true, true, On_LPSM_GoingIntoTurtle_Finished);        
    }
    else
    {
        Outer.PhadyrPawn.DoSpecialMove(Class'LPSM_PhadyrGoingIntoTurtleHigh', true, true, On_LPSM_GoingIntoTurtle_Finished);
    }
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PausedState()
    {
        super(SPStateObject).PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function IsDoneWithThisState()
    {
        local /*0x97E50000-0x00000000*/ private byte StateToTest[8388609];
        local /*0x97E50000-0x00000000*/ private float MaxDurationOfState[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float durationOfAction;

        // End:0x32
        if(int(Outer.CurrentTurtleState) != int(StateToTest))
        {
            return true;
        }
        durationOfAction = Outer.WorldInfo.TimeSeconds - TimeLastSpecialMoveStarted;
        // End:0x93
        if(durationOfAction > MaxDurationOfState)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
GoingIntoTurtle:

    Outer.CurrentTurtleState = 1;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    GoIntoTurtle();
    J0x68:

    // End:0xF7 [Loop If]
    if(!IsDoneWithThisState(1, Outer.PhadyrPawn.TuneDataPhadyr.MaxTimeForGoingIntoTurtleSM.GetValue()))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x68;
    }
LoopingTurtle:


    DurationOfTurtleLoop = GetTurtleLoopTime();
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.PhadyrPawn.DoSpecialMove(Class'LPSM_PhadyrTurtleLoop', true, true);
    J0x189:

    // End:0x1C3 [Loop If]
    if(!IsDoneWithThisState(3, DurationOfTurtleLoop))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x189;
    }
    FinishTurtleLoopSpecialMove();
CommingOutOfTurtle:


    Outer.CurrentTurtleState = 5;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.Focus = Outer.MyLPEnemy;
    // End:0x2F3
    if(Outer.PhadyrPawn.bUsingLowPosture)
    {
        Outer.PhadyrPawn.DoSpecialMove(Class'LPSM_PhadyrComingOutOfTurtleLow', true, true, On_LPSM_ComingOutOfTurtle_Finished);        
    }
    else
    {
        Outer.PhadyrPawn.DoSpecialMove(Class'LPSM_PhadyrComingOutOfTurtleHigh', true, true, On_LPSM_ComingOutOfTurtle_Finished);
    }
    J0x344:

    // End:0x3D3 [Loop If]
    if(!IsDoneWithThisState(5, Outer.PhadyrPawn.TuneDataPhadyr.MaxTimeForCommingOutOfTurtleSM.GetValue()))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x344;
    }
    goto 'EndCommand';
EndCommand:


    Outer.Sleep(0.0100000);
    Outer.PopCommand(self);
    stop;        
}

defaultproperties
{
    bInterruptible=false
}