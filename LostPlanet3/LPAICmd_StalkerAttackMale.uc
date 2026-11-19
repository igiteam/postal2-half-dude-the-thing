class LPAICmd_StalkerAttackMale extends LPAICmd_Attack within LPAIControllerStalker;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AmbushCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StrikeAttackCommand[536870913];
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
    // End:0xEF [Loop If]
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
        // End:0xDE
        if(Outer.AIWantsReactiveAttack(EnemyForAttack))
        {
            GotoState('ReactiveAttack');            
        }
        else
        {
            GotoState('Ambush');
        }
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
        // End:0x39
        if(Outer.AIWantsReactiveAttack(EnemyForAttack))
        {
            GotoState('ReactiveAttack');
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
    GotoState('Ambush');
    stop;            
}

defaultproperties
{
    StartMovingToFormation=4000.0000000
}