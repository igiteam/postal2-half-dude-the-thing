class LPAICmd_HSStaticRangedAttack extends LPAICmd_Attack within LPAIControllerHumanSoldier;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackFromCoverCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackFromOpenCommand[536870913];

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

function WantsToAttackFromCover()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(Outer.CoverIsIn())
    {
        return true;
    }
    return Outer.AIWantsToAttackFromCover();
    //return ReturnValue;    
}

state StateCmdActive
{Begin:

    // End:0x1E
    if(WantsToAttackFromCover())
    {
        GotoState('StaticAttackFromCover');        
    }
    else
    {
        GotoState('StaticAttackFromOpen');
    }
    stop;                
}

state StaticAttackFromOpen
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ClearTimer('TimerTransitions', self);
        Outer.AbortCommand(AttackFromOpenCommand);
        AttackFromOpenCommand = none;
        //return;        
    }

    function TimerTransitions()
    {
        // End:0x1B
        if(WantsToAttackFromCover())
        {
            GotoState('StaticAttackFromCover');
        }
        //return;        
    }
Begin:

    // End:0x87
    if(Outer.WeaponHasAmmo())
    {
        Outer.SetTimer(0.4000000, true, 'TimerTransitions', self);
        AttackFromOpenCommand = LPAICmd_HSStaticAttackFromOpen(Outer.CmdStaticAttackFromOpen(EnemyForAttack));
    }
    Outer.PopCommand(self);
    stop;                    
}

state StaticAttackFromCover
{
    ignores TimerTransitions;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ClearTimer('TimerTransitions', self);
        Outer.AbortCommand(AttackFromCoverCommand);
        AttackFromCoverCommand = none;
        //return;        
    }
Begin:

    // End:0x7F
    if(Outer.WeaponHasAmmo())
    {
        Outer.SetTimer(0.4000000, true, 'TimerTransitions', self);
        AttackFromCoverCommand = Outer.CmdStaticAttackFromCover(EnemyForAttack);
    }
    Outer.PopCommand(self);
    stop;                    
}
