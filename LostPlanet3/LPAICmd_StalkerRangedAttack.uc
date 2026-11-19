class LPAICmd_StalkerRangedAttack extends LPAICmd_Attack within LPAIControllerStalker;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackFromCoverCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AmbushCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MeleeAttackCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToCoverCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StartMovingToFormation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampStartedAmbush[536870913];

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

function WantsToMelee()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float separation;

    separation = EnemySeperation();
    // End:0x6C
    if(separation < Outer.StalkerPawn.TuneDataStalker.MeleeMinPlayerDistance)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

state StateCmdActive
{Begin:

    GotoState('MovingToEnemy');
    stop;        
}

state MovingToEnemy
{
    function IsAtMovingToFormationDistance()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return VSize(EnemyForAttack.Location - Outer.Pawn.Location) < StartMovingToFormation;
        //return ReturnValue;        
    }
    J0x00:
    // End:0xB3 [Loop If]
    if(true)
    {
        // End:0x83
        if(!IsAtMovingToFormationDistance())
        {
            MoveToActorCmd = Outer.CmdMoveToActor(EnemyForAttack, none, StartMovingToFormation, Outer.CmdStatus_MoveToActor, 1, 1);
            MoveToActorCmd = none;            
        }
        else
        {
            Outer.PawnZeroVelocity();
        }
        GotoState('AttackFromCover');
        // [Loop Continue]
        goto J0x00;
    }
    stop;                    
}

state Ambush
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ClearTimer('TimerTransitions', self);
        Outer.AbortCommand(AmbushCommand);
        AmbushCommand = none;
        //return;        
    }

    function TimerTransitions()
    {
        // End:0x1E
        if(WantsToMelee())
        {
            GotoState('MeleeAttack');            
        }
        else
        {
            // End:0x74
            if((Outer.WorldInfo.TimeSeconds - TimeStampStartedAmbush) > 20.0000000)
            {
                GotoState('AttackFromCover');
            }
        }
        //return;        
    }
Begin:

    TimeStampStartedAmbush = Outer.WorldInfo.TimeSeconds;
    Outer.SetTimer(0.2500000, true, 'TimerTransitions', self);
    AmbushCommand = Outer.CmdAmbush(EnemyForAttack);
    Outer.PopCommand(self);
    stop;            
}

state MeleeAttack
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AbortCommand(MeleeAttackCommand);
        MeleeAttackCommand = none;
        Outer.AbortCommand(MoveToCoverCmd);
        MoveToCoverCmd = none;
        //return;        
    }
Begin:

    MeleeAttackCommand = Outer.CmdCoverAIMelee(EnemyForAttack);
    // End:0xD5
    if(Outer.CoverExplorer.GetAmbushCover(Outer.PotentialCoverGoal))
    {
        MoveToCoverCmd = Outer.CmdMoveToCover(Outer.PotentialCoverGoal);
    }
    GotoState('Ambush');
    stop;                    
}

state AttackFromCover
{
    ignores TimerTransitionToAttackFromOpen;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ClearTimer('TimerTransitionToAttackFromOpen', self);
        Outer.AbortCommand(AttackFromCoverCommand);
        AttackFromCoverCommand = none;
        //return;        
    }
Begin:

    Outer.SetTimer(0.4000000, true, 'TimerTransitionToAttackFromOpen', self);
    AttackFromCoverCommand = Outer.CmdAttackFromCover(EnemyForAttack);
    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    StartMovingToFormation=4000.0000000
}