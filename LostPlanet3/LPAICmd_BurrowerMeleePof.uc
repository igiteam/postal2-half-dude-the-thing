class LPAICmd_BurrowerMeleePof extends LPAICmd_Attack within LPAIControllerBurrower;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FormationSlotPosition[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveCircleCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StrikeCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL JumpingCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DamageReceivedSinceUnderground;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampStartSM;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampDoJump;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTimeNextJump;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDistanceToDestinationDontJump;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageStopBurrowing;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampLastStrike;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    Outer.ClearTimer('TimerTransitionToJump', self);
    GotoState('None');
    Outer.ReleaseMeleeAccess();
    super.Popped();
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super.SetDesiredEnemy(InEnemy);
    Outer.GetCombatEngagementAccess(InEnemy);
    //return;    
}

event NotifyReceivedDamage()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DamageInstigator[8388609];

    super(SPAICommand).NotifyReceivedDamage(Damage, DamageInstigator);
    // End:0x42
    if(!Outer.PawnIsUnderground())
    {
        return;
    }
    // End:0x77
    if((JumpingCmd != none) && JumpingCmd.IsActive())
    {
        return;
    }
    // End:0x88
    if(StrikeCmd != none)
    {
        return;
    }
    DamageReceivedSinceUnderground += Damage;
    // End:0xC3
    if(float(DamageReceivedSinceUnderground) > DamageStopBurrowing)
    {
        GotoState('Damaged');
    }
    //return;    
}

function ResetDamageStopBurrowing()
{
    DamageReceivedSinceUnderground = 0;
    DamageStopBurrowing = RandRange(Outer.BurrowerPawn.TuneDataBurrower.MinDamageStopBurrowing, Outer.BurrowerPawn.TuneDataBurrower.MaxDamageStopBurrowing);
    //return;    
}

function ResetTimeToJump()
{
    TimeStampDoJump = Outer.WorldInfo.TimeSeconds;
    MinTimeNextJump = RandRange(Outer.BurrowerPawn.TuneDataBurrower.MinTimeBetweenJumps, Outer.BurrowerPawn.TuneDataBurrower.MaxTimeBetweenJumps);
    //return;    
}

function TimerTransitionToJump()
{
    // End:0x4E
    if(Outer.BurrowerPawn.TuneDataBurrower.bEnableJumpAnnounce)
    {
        return;
    }
    // End:0x5F
    if(StrikeCmd != none)
    {
        return;
    }
    // End:0x9F
    if((MoveToActorCmd != none) && Outer.Kynapse_PathFinderGetDistanceLeft() < MinDistanceToDestinationDontJump)
    {
        return;
    }
    // End:0x123
    if(VSize(Outer.BurrowerPawn.Velocity) < Outer.BurrowerPawn.TuneDataBurrower.MinVelocityStartJump)
    {
        return;
    }
    // End:0x171
    if((Outer.WorldInfo.TimeSeconds - TimeStampDoJump) < MinTimeNextJump)
    {
        return;
    }
    ResetTimeToJump();
    JumpingCmd = Outer.CmdBurrowerJump();
    //return;    
}

function ResetStrikeWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    // End:0x99
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        EnemyForAttack.AIResourceManager.ResetTimerRange('BurrowerStrikeTimer', MinTime, MaxTime);        
    }
    else
    {
        // End:0xAB
        if(EnemyForAttack == none)
        {            
        }
    }
    //return;    
}

state StateCmdActive
{Begin:

    ResetDamageStopBurrowing();
    ResetTimeToJump();
    Outer.SetTimer(0.2000000, true, 'TimerTransitionToJump', self);
    Outer.SetAttackResourceNames();
    GotoState('MovingToEnemy');
    stop;            
}

state Damaged
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.PawnUnderground(false);
        ResetDamageStopBurrowing();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AbortCommand(ChildCommand);
        Outer.PawnUnderground(true);
        ResetTimeToJump();
        //return;        
    }
Begin:

    Outer.PawnLookAtActor(EnemyForAttack);
    Outer.PawnZeroVelocity();
    Outer.CmdSpecialMove(Class'LPSM_BurrowerWalkOut', true, 0.0000000, 4.0000000);
    Outer.CmdSpecialMove(Class'LPSM_BurrowerTauntIn', true, 0.0000000, 4.0000000);
    Outer.CmdSpecialMove(Class'LPSM_BurrowerTauntLoop', true, 0.0000000, Outer.BurrowerPawn.TuneDataBurrower.TimeSurfaceAfterDamaged);
    Outer.CmdSpecialMove(Class'LPSM_BurrowerTauntOut', true, 0.0000000, 4.0000000);
    Outer.CmdSpecialMove(Class'LPSM_BurrowerWalkIn', true, 0.0000000, 4.0000000);
    GotoState('MovingToEnemy');
    stop;        
}

state MovingToEnemy
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AbortCommand(MoveToActorCmd);
        MoveToActorCmd = none;
        //return;        
    }

    function IsAtMovingToFormationDistance()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return VSize(EnemyForAttack.Location - Outer.Pawn.Location) < Outer.BurrowerPawn.TuneDataBurrower.DistanceStartMovingToFormation;
        //return ReturnValue;        
    }
Begin:

    // End:0xBB
    if(!IsAtMovingToFormationDistance())
    {
        MoveToActorCmd = Outer.CmdMoveToActor(EnemyForAttack, none, Outer.BurrowerPawn.TuneDataBurrower.DistanceStartMovingToFormation, Outer.CmdStatus_MoveToActor, 1, 1);
        MoveToActorCmd = none;
    }
    Outer.PawnZeroVelocity();
    GotoState('MovingToFormation');
    stop;                
}

state MovingToFormation
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ClearTimer('TimerTransitionToStrike', self);
        Outer.AbortCommand(MoveCircleCmd);
        MoveCircleCmd = none;
        //return;        
    }

    function HaveRequiredAccessForForStrikingDuringAttack()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x6E
        if(Outer.CurrentCombatManagerResourceRef != none)
        {
            Outer.CurrentCombatManagerResourceRef.PublishNewAttackOption(Outer, 13, 1.0000000, false);
            return false;            
        }
        else
        {
            // End:0xB6
            if(HasStrikeWaitTimerExpired())
            {
                GetStrikeAccess(EnemyForAttack);
                // End:0xB4
                if(Outer.HaveStrikeAccess())
                {
                    return true;
                }
                return false;
            }
        }
        return false;
        //return ReturnValue;        
    }

    function OnEngagementAttackOptionApproved()
    {
        local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        GotoState('MovingToStrike');
        return true;
        //return ReturnValue;        
    }

    function HasStrikeWaitTimerExpired()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x76
        if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
        {
            return EnemyForAttack.AIResourceManager.HasTimerExpired('BurrowerStrikeTimer');            
        }
        else
        {
            // End:0x8A
            if(EnemyForAttack == none)
            {
                return false;                
            }
            else
            {
                return true;
            }
        }
        //return ReturnValue;        
    }

    function TimerTransitionToStrike()
    {
        // End:0xA6
        if((Outer.WorldInfo.TimeSeconds - TimeStampLastStrike) > Outer.BurrowerPawn.TuneDataBurrower.MinTimeBetweenStrikes)
        {
            // End:0xA6
            if(HaveRequiredAccessForForStrikingDuringAttack())
            {
                GotoState('MovingToStrike');
            }
        }
        //return;        
    }
Begin:

    Outer.SetTimer(0.4000000, true, 'TimerTransitionToStrike', self);
    MoveCircleCmd = Outer.CmdCircleActor(EnemyForAttack, Outer.BurrowerPawn.TuneDataBurrower.MinDistanceCircling, Outer.BurrowerPawn.TuneDataBurrower.MaxDistanceCircling,, 1);
    stop;            
}

state MovingToStrike
{
    ignores BeginState;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.PawnUnderground(true);
        ResetTimeToJump();
        TimeStampLastStrike = Outer.WorldInfo.TimeSeconds;
        Outer.FlushPersistentDebugLines();
        Outer.ClearTimer('TimerMovingToEnemyToStrike', self);
        StopStrike();
        //return;        
    }

    function StopStrike()
    {
        Outer.AbortCommand(MoveToActorCmd);
        Outer.AbortCommand(StrikeCmd);
        Outer.AbortCommand(JumpingCmd);
        JumpingCmd = none;
        StrikeCmd = none;
        MoveToActorCmd = none;
        Outer.ReleaseStrikeAccess();
        ResetStrikeWaitTimer();
        // End:0x12B
        if(Outer.CurrentCombatManagerResourceRef != none)
        {
            Outer.CurrentCombatManagerResourceRef.NotifyOfAttackCompleted(Outer, 13);
        }
        //return;        
    }

    function TimerMovingToEnemyToStrike()
    {
        local /*0x97E50000-0x00000000*/ private float separation;

        separation = EnemySeperation2D();
        // End:0x15D
        if(separation < Outer.BurrowerPawn.TuneDataBurrower.DistanceStartStrike)
        {
            Outer.ClearTimer('TimerMovingToEnemyToStrike', self);
            // End:0x134
            if(Outer.BurrowerPawn.TuneDataBurrower.bEnableJumpAnnounce)
            {
                JumpingCmd = Outer.CmdBurrowerJump();
                Outer.SetTimer(0.1000000, true, 'TimerWaitingForJumpToFinish', self);                
            }
            else
            {
                Outer.AbortCommand(MoveToActorCmd);
            }
        }
        //return;        
    }

    function TimerWaitingForJumpToFinish()
    {
        // End:0x92
        if((JumpingCmd == none) || !JumpingCmd.IsActive())
        {
            JumpingCmd = none;
            Outer.ClearTimer('TimerWaitingForJumpToFinish', self);
            Outer.AbortCommand(MoveToActorCmd);
        }
        //return;        
    }

    function MoveToEnemyForStrike()
    {
        Outer.SetTimer(0.1000000, true, 'TimerMovingToEnemyToStrike', self);
        MoveToActorCmd = Outer.CmdMoveToActor(EnemyForAttack, none, 0.0000000, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfMoveToStrike);
        //return;        
    }
Begin:

    // End:0x8C
    if(Outer.WantsToDoStruggleMode(EnemyForAttack))
    {
        // End:0x8C
        if(!EnemyForAttack.bBearTrapped)
        {
            Outer.SpawnBearTrappedBurrower(EnemyForAttack.Location);
        }
    }
    MoveToEnemyForStrike();
    // End:0x306
    if(Outer.BurrowerPawn.TuneDataBurrower.bEnableAnnounce && Outer.BurrowerPawn.TuneDataBurrower.TimeStrikeAnnounce > 0.0000000)
    {
        Outer.BurrowerPawn.TuneDataPawnFXEventBindings.PlayEventFXAtLoc('UnderGroundAttackWarning', Outer.BurrowerPawn.Location, Outer.BurrowerPawn.Rotation, Outer.BurrowerPawn, Outer.BurrowerPawn.Mesh, none);
        Outer.PawnLookAtActor(EnemyForAttack);
        Outer.PawnZeroVelocity();
        Outer.Sleep(Outer.BurrowerPawn.TuneDataBurrower.TimeStrikeAnnounce);
        Outer.FlushPersistentDebugLines();
    }
    DamageReceivedSinceUnderground = 0;
    StrikeCmd = Outer.CmdBurrowerJumpBiteStrikePof(EnemyForAttack);
    GotoState('MovingToFormation');
    stop;                    
}

defaultproperties
{
    MinDistanceToDestinationDontJump=700.0000000
}