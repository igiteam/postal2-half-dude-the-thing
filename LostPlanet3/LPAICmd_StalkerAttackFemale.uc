class LPAICmd_StalkerAttackFemale extends LPAICmd_Attack within LPAIControllerStalker;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackFromCoverCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackFromOpenCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StrikeAttackCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StartMovingToFormation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampStartedAmbush[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampStartedAttackFromOpen[536870913];

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    GotoState('None');
    super.Popped();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

state StateCmdActive
{Begin:

    GotoState('MovingToEnemy');
    stop;        
}

state MovingToEnemy
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        StopMoving();
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function StopMoving()
    {
        Outer.AbortCommand(MoveToActorCmd);
        MoveToActorCmd = none;
        //return;        
    }

    function IsAtMovingToFormationDistance()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return VSize(EnemyForAttack.Location - Outer.Pawn.Location) < StartMovingToFormation;
        //return ReturnValue;        
    }
Begin:

    // End:0xCF
    if(!Outer.CoverExplorer.CoverTraversal.HasDefendZones() && !IsAtMovingToFormationDistance())
    {
        MoveToActorCmd = Outer.CmdMoveToActor(EnemyForAttack, none, StartMovingToFormation, Outer.CmdStatus_MoveToActor, 1, 1);
        MoveToActorCmd = none;        
    }
    else
    {
        Outer.PawnZeroVelocity();
    }
    J0xEE:

    // End:0x147 [Loop If]
    if(!Outer.CoverExplorer.bFirstTraversalFinished)
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0xEE;
    }
    // End:0x183
    if(Outer.AIWantsReactiveAttack(EnemyForAttack))
    {
        GotoState('ReactiveAttack');        
    }
    else
    {
        GotoState('AttackFromCover');
    }
    stop;            
}

state ReactiveAttack
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.TimeStampReactiveAttack = Outer.WorldInfo.TimeSeconds;
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AbortCommand(StrikeAttackCommand);
        StrikeAttackCommand = none;
        //return;        
    }
Begin:

    StrikeAttackCommand = Outer.CmdStalkerStrikeKnockDown(EnemyForAttack);
    StrikeAttackCommand = none;
    GotoState('AttackFromCover');
    stop;            
}

state AttackFromCover
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.TimeStampReactiveAttack = Outer.WorldInfo.TimeSeconds;
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ClearTimer('TimerTransitionToAttackFromOpen', self);
        Outer.AbortCommand(AttackFromCoverCommand);
        AttackFromCoverCommand = none;
        //return;        
    }

    function NotifyPlayerStartMelee()
    {
        local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x26
        if(!Outer.bEnableReactiveAttack)
        {
            return false;
        }
        GotoState('ReactiveAttack');
        return true;
        //return ReturnValue;        
    }

    function TimerTransitionToAttackFromOpen()
    {
        // End:0x39
        if(Outer.AIWantsReactiveAttack(EnemyForAttack))
        {
            GotoState('ReactiveAttack');
        }
        //return;        
    }
Begin:

    Outer.SetTimer(0.4000000, true, 'TimerTransitionToAttackFromOpen', self);
    AttackFromCoverCommand = Outer.CmdAttackFromCover(EnemyForAttack);
    AttackFromCoverCommand = none;
    GotoState('AttackFromOpen');
    stop;            
}

state AttackFromOpen
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ClearTimer('TimerTransitionToAttackFromCover', self);
        Outer.ClearTimer('TimerClearCoverRatings', self);
        Outer.AbortCommand(AttackFromOpenCommand);
        AttackFromOpenCommand = none;
        //return;        
    }

    function TimerClearCoverRatings()
    {
        Outer.CoverExplorer.CoverTraversal.ClearRatingOverTime(5);
        Outer.CoverExplorer.CoverTraversal.ClearRatingOverTime(4);
        //return;        
    }

    function TimerTransitionToAttackFromCover()
    {
        // End:0x3B
        if(Outer.AIWantsReactiveAttack(EnemyForAttack))
        {
            GotoState('ReactiveAttack');
            return;
        }
        // End:0xC8
        if((Outer.WorldInfo.TimeSeconds - TimeStampStartedAttackFromOpen) < Outer.StalkerPawn.TuneDataStalker.MinTimeAttackFromOpen)
        {
            return;
        }
        // End:0x103
        if(Outer.AIWantsToMeleeWhenNoCover(EnemyForAttack))
        {
            GotoState('AttackFromCover');
            return;
        }
        // End:0x135
        if(Outer.AIWantsToAttackFromCover())
        {
            GotoState('AttackFromCover');
            return;
        }
        //return;        
    }
Begin:

    // End:0xEE
    if(Outer.WeaponHasAmmo())
    {
        Outer.SetTimer(0.5000000, true, 'TimerTransitionToAttackFromCover', self);
        Outer.SetTimer(10.0000000, false, 'TimerClearCoverRatings', self);
        TimeStampStartedAttackFromOpen = Outer.WorldInfo.TimeSeconds;
        AttackFromOpenCommand = Outer.CmdAttackFromOpen(EnemyForAttack);
        AttackFromOpenCommand = none;
    }
    Outer.PopCommand(self);
    stop;        
}

defaultproperties
{
    StartMovingToFormation=4000.0000000
}