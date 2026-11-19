class LPAICmd_FollowPath extends LPAICmd_Attack within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FollowPathData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SaveMaxSpeedScale[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SaveRotationRate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SaveMaxDesiredSpeed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurMoveCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurTurnToFaceCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFinishedPath[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFollowPathPaused[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWantFollowPathPaused[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStartupAnimationFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumFailedAttempts[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentDestination[536870913];

function SetFollowPathData()
{
    local /*0x97E50000-0x00000000*/ private @NULL Data[8388609];

    FollowPathData = Data;
    //return;    
}

function Pushed()
{
    SetInterruptible(true);
    super.Pushed();
    CurMoveCmd = none;
    CurTurnToFaceCmd = none;
    SaveMaxSpeedScale = MyPawn.ReplicatedMaxSpeedScale;
    SaveRotationRate = MyPawn.RotationRate;
    SaveMaxDesiredSpeed = MyPawn.MaxDesiredSpeed;
    //return;    
}

function Popped()
{
    AbortAnyRunningChildCommand();
    CurrentDestination = none;
    MyPawn.SetMaxSpeedScale(SaveMaxSpeedScale);
    MyPawn.RotationRate = SaveRotationRate;
    MyPawn.MaxDesiredSpeed = SaveMaxDesiredSpeed;
    // End:0x19F
    if(bFinishedPath)
    {
        // End:0x141
        if(FollowPathData.bDestroyObjectiveWhenPathDone)
        {
            Outer.AIObjectiveManager.RemoveObjective(MySPAIObjective);
            Outer.AIObjectiveManager.RemoveAIObjectiveFromKismet(FollowPathData);
            FollowPathData = none;
        }
        Outer.myAIPawn.TriggerEventClass(Class'LPSeqEvent_AIMoveDone', Outer.myAIPawn, 0);
    }
    Outer.MoveTarget = none;
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    super(LPAICommand).Paused(NewCommand);
    //return;    
}

private final function AbortAnyRunningChildCommand()
{
    // End:0x38
    if(CurMoveCmd != none)
    {
        Outer.AbortCommand(CurMoveCmd);
    }
    // End:0x70
    if(CurTurnToFaceCmd != none)
    {
        Outer.AbortCommand(CurTurnToFaceCmd);
    }
    //return;    
}

function ShouldAbortMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(bFollowPathPaused)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function DoFollowPath()
{
    local /*0x97E50000-0x00000000*/ private @NULL FollowPathRotationRate;

    Outer.Focus = none;
    MyPawn.SetMaxSpeedScale(FollowPathData.MaxSpeedScale);
    MyPawn.MaxDesiredSpeed = FollowPathData.MaxSpeedScale;
    FollowPathRotationRate = SaveRotationRate;
    FollowPathRotationRate.Yaw *= FollowPathData.FollowPathRotationScale.X;
    FollowPathRotationRate.Pitch *= FollowPathData.FollowPathRotationScale.Y;
    FollowPathRotationRate.Roll *= FollowPathData.FollowPathRotationScale.Z;
    MyPawn.RotationRate = FollowPathRotationRate;
    CurMoveCmd = Outer.CmdMoveToActor(CurrentDestination, none, FollowPathData.HowCloseToGetToEachPathPoint, Outer.CmdStatus_MoveToActor, 1, 0);
    CurMoveCmd.__MoveAbortDelegate__Delegate = ShouldAbortMove;
    CurMoveCmd.bZeroVelocityOnFinish = false;
    CurMoveCmd.SetMovementMonitorParameters(true, 1.0000000, 50.0000000, 2.0000000, NotifyOfFailedMovement);
    //return;    
}

function NotifyOfFailedMovement()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(CurMoveCmd != none)
    {
        Outer.AbortCommand(CurMoveCmd);
    }
    return true;
    //return ReturnValue;    
}

function PauseFollowPath()
{
    //return;    
}

function ResumeFollowPath()
{
    //return;    
}

function PickDestination()
{
    // End:0xB8
    if(FollowPathData.bPickClosestPathPoint)
    {
        CurrentDestination = FollowPathData.PathStartingPoint.GetClosestLinkedPathTargetPoint(MyPawn.Location);
        // End:0xB5
        if(CurrentDestination == none)
        {
            CurrentDestination = FollowPathData.PathStartingPoint;
        }        
    }
    else
    {
        CurrentDestination = FollowPathData.PathStartingPoint;
    }
    //return;    
}

function DoStartupAnimation()
{
    bStartupAnimationFinished = true;
    //return;    
}

function ShouldTurnToFaceDestination()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        NumFailedAttempts = 0;
        bStartupAnimationFinished = false;
        super.BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function MoveFailed()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x40
        if(int(CurMoveCmd.MoveToActorStatus.Cmd_Error) == int(1))
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function AbortFollowPath()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        Outer.PopCommand(self);
        return true;
        //return ReturnValue;        
    }

    function CanAbortFollowPathFor()
    {
        local /*0x97E50000-0x00000000*/ private @NULL InPotentialEnemy[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL PotentialEnemy;
        local /*0x97E50000-0x00000000*/ private int NumAttackers;

        PotentialEnemy = LPPlayerPawn(InPotentialEnemy);
        // End:0x2D
        if(PotentialEnemy == none)
        {
            return true;
        }
        // End:0x80
        if(Outer.IsTooLongSinceEnemySeen(PotentialEnemy) || !PotentialEnemy.IsAliveAndWell())
        {
            return false;
        }
        // End:0xA6
        if(FollowPathData.MaxNumAttackersPerEnemy == 0)
        {
            return true;
        }
        NumAttackers = Outer.NumberOfAttackersFor(PotentialEnemy);
        // End:0x106
        if(NumAttackers >= FollowPathData.MaxNumAttackersPerEnemy)
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }

    function CheckIfShouldAbortCommand()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private int iter;
        local /*0x97E50000-0x00000000*/ private @NULL EnemyCandidate;
        local /*0x97E50000-0x00000000*/ private float separationSq, separationToCurrentEnemysq, HowCloseToLetEnemiesGetBeforeAttackingSq;

        // End:0x28
        if(FollowPathData.HowCloseToLetEnemiesGetBeforeAttacking <= float(0))
        {
            return false;
        }
        // End:0xAE
        if(Outer.MyLPEnemy != none)
        {
            separationToCurrentEnemysq = VSizeSq(MyPawn.Location - Outer.MyLPEnemy.Location);            
        }
        else
        {
            separationToCurrentEnemysq = float(2147483647);
        }
        HowCloseToLetEnemiesGetBeforeAttackingSq = FollowPathData.HowCloseToLetEnemiesGetBeforeAttacking * FollowPathData.HowCloseToLetEnemiesGetBeforeAttacking;
        iter = 0;
        J0x112:

        // End:0x33B [Loop If]
        if(iter < Outer.TargetList.Length)
        {
            EnemyCandidate = Outer.TargetList[iter].Actor;
            // End:0x32D
            if((EnemyCandidate != none) && Outer.CanBeMyEnemy(EnemyCandidate))
            {
                // End:0x22F
                if((Outer.MyLPEnemy == none) && LPPawn(EnemyCandidate) != none)
                {
                    Outer.MyLPEnemy = LPPawn(EnemyCandidate);
                }
                separationSq = VSizeSq(MyPawn.Location - EnemyCandidate.Location);
                // End:0x2E5
                if(separationSq < HowCloseToLetEnemiesGetBeforeAttackingSq)
                {
                    // End:0x2E2
                    if(CanAbortFollowPathFor(EnemyCandidate))
                    {
                        Outer.MyLPEnemy = LPPawn(EnemyCandidate);
                        return AbortFollowPath();
                    }                    
                }
                else
                {
                    // End:0x32D
                    if(separationSq < separationToCurrentEnemysq)
                    {
                        Outer.MyLPEnemy = LPPawn(EnemyCandidate);
                    }
                }
            }
            ++iter;
            // [Loop Continue]
            goto J0x112;
        }
        return false;
        //return ReturnValue;        
    }

    function FollowPathTick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x0F
        if(CheckIfShouldAbortCommand())
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }

    event LPCommandTick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        super(LPAICommand).LPCommandTick(DeltaTime);
        // End:0x35
        if(!bFollowPathPaused)
        {
            FollowPathTick(DeltaTime);
        }
        //return;        
    }

    function PauseFollowPath()
    {
        bFollowPathPaused = true;
        bWantFollowPathPaused = true;
        SaveCurrentDestination();
        // End:0x6C
        if(CurMoveCmd.IsActive())
        {
            MyController.PopCommand(CurMoveCmd);
        }
        //return;        
    }

    function ResumeFollowPath()
    {
        bWantFollowPathPaused = false;
        //return;        
    }

    function SaveCurrentDestination()
    {
        CurrentDestination = CurMoveCmd.GetDesiredTarget();
        //return;        
    }
Begin:

    bStartupAnimationFinished = false;
    PickDestination();
    bFollowPathPaused = false;
    // End:0xAA
    if((ShouldTurnToFaceDestination()) && CurrentDestination != none)
    {
        Outer.CmdTurnToFacePosition(0, CurrentDestination.Location);
        Outer.Focus = CurrentDestination;
    }
    DoStartupAnimation();
    J0xB4:

    // End:0xE4 [Loop If]
    if(bStartupAnimationFinished == false)
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0xB4;
    }
FollowPathLoop:


    bFinishedPath = false;
    Outer.Focus = none;
    // End:0x129
    if(CurrentDestination == none)
    {
        PickDestination();
    }
    // End:0x142
    if(CurrentDestination == none)
    {
        goto 'EndCommand';
    }
    DoFollowPath();
    // End:0x1D9
    if(bFollowPathPaused)
    {
        Outer.PawnZeroVelocity();
        // End:0x1D9
        if(CurrentDestination != none)
        {
            J0x187:

            // End:0x1CF [Loop If]
            if(bFollowPathPaused)
            {
                Outer.Sleep(0.2000000);
                // End:0x1CC
                if(!bWantFollowPathPaused)
                {
                    bFollowPathPaused = false;
                }
                // [Loop Continue]
                goto J0x187;
            }
            goto 'FollowPathLoop';
        }
    }
    // End:0x232
    if(MoveFailed())
    {
        Outer.Sleep(0.2000000);
        NumFailedAttempts++;
        // End:0x228
        if(NumFailedAttempts > 5)
        {
            goto 'EndCommand';
        }
        goto 'FollowPathLoop';
    }
    NumFailedAttempts = 0;
    bFinishedPath = true;
EndCommand:


    Outer.PopCommand(self);
    stop;            
}
