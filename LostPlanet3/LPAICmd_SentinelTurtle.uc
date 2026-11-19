class LPAICmd_SentinelTurtle extends LPAICommand within LPAIControllerSentinel;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLastSpecialMoveStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DurationOfTurtleLoop[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TotalDamageReceivedDuringTurtle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTurtleLoopTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTurtleLoopTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageAmountToCauseEndOfTurtle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDistanceToBeAwayForThisTurtle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIgnoreTurtleTimeRestrictions[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTurtleCausedByDamage[536870913];

function Pushed()
{
    local /*0x97E50000-0x00000000*/ private @NULL MySentPawn;

    super.Pushed();
    MySentPawn = LPAIPawnSentinelAdroit(Outer.Pawn);
    TimeLastSpecialMoveStarted = -1.0000000;
    DurationOfTurtleLoop = -1.0000000;
    MinTurtleLoopTime = MySentPawn.TuneDataSentinelAdroit.MinTimeToTurtle.GetValue();
    MaxTurtleLoopTime = MySentPawn.TuneDataSentinelAdroit.MaxTimeToTurtle.GetValue();
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
    Outer.SentinelPawn.EndSpecialMove(Class'LPSM_SentinelTurtleLoop');
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
    Outer.SentinelPawn.DoSpecialMove(Class'LPSM_SentinelGoingIntoTurtle', true, true, On_LPSM_GoingIntoTurtle_Finished);
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
        // End:0xA2
        if(!bIgnoreTurtleTimeRestrictions)
        {
            durationOfAction = Outer.WorldInfo.TimeSeconds - TimeLastSpecialMoveStarted;
            // End:0xA2
            if(durationOfAction > MaxDurationOfState)
            {
                return true;
            }
        }
        // End:0xD7
        if(Outer.CheckValidRangeToEnemy() && !bTurtleCausedByDamage)
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
    if(!IsDoneWithThisState(1, Outer.SentinelPawn.TuneDataSentinel.MaxTimeForGoingIntoTurtleSM.GetValue()))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x68;
    }
LoopingTurtle:


    DurationOfTurtleLoop = GetTurtleLoopTime();
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.SentinelPawn.DoSpecialMove(Class'LPSM_SentinelTurtleLoop', true, true);
    J0x189:

    // End:0x206 [Loop If]
    if(!IsDoneWithThisState(3, DurationOfTurtleLoop))
    {
        // End:0x1E6
        if(!Outer.DesignerForceTurtle)
        {
            Outer.SelectTarget();
        }
        Outer.Sleep(0.1000000);
        // [Loop Continue]
        goto J0x189;
    }
    FinishTurtleLoopSpecialMove();
CommingOutOfTurtle:


    Outer.CurrentTurtleState = 5;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.Focus = Outer.MyLPEnemy;
    // End:0x42C
    if(Outer.Enemy != none)
    {
        Outer.SentinelPawn.StemSkelControl.ControlStrength = 1.0000000;
        Outer.SentinelPawn.StemSkelControl.BoneRotation.Yaw = Rotator(Outer.Enemy.Location - Outer.SentinelPawn.Location) - Outer.SentinelPawn.Rotation.Yaw;
    }
    Outer.SentinelPawn.DoSpecialMove(Class'LPSM_SentinelComingOutOfTurtle', true, true, On_LPSM_ComingOutOfTurtle_Finished);
    J0x47D:

    // End:0x50C [Loop If]
    if(!IsDoneWithThisState(5, Outer.SentinelPawn.TuneDataSentinel.MaxTimeForCommingOutOfTurtleSM.GetValue()))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x47D;
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