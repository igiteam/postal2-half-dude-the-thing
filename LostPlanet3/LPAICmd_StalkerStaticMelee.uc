class LPAICmd_StalkerStaticMelee extends LPAICmd_CoverAIStaticMelee within LPAIControllerStalker;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StrikeAttackCommand[536870913];

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
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

function GetMinTimeTimer()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'StalkerMinTimeNoAttack';
    //return ReturnValue;    
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
    GotoState('WaitingForMelee');
    stop;            
}
