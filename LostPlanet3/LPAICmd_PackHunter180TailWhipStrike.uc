class LPAICmd_PackHunter180TailWhipStrike extends LPAICmd_PackHunterStaticStrikeBase within LPAIControllerPackHunter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte StrikeDirection[536870913];

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.NotifyCombatManagerOfStrikeCompleted(22);
    Outer.Focus = none;
    //return;    
}

function SetStrikeDirection()
{
    local /*0x97E50000-0x00000000*/ private byte DirectionToStrike[8388609];

    StrikeDirection = DirectionToStrike;
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super(LPAICmd_PackHunterStrikeBase).SetDesiredEnemy(InEnemy);
    // End:0x74
    if(Outer.PHPawn != none)
    {
        Outer.PHPawn.CurrentStrikeTargetToIgnoreBlockingBy = InEnemy;
    }
    //return;    
}

function GetStaticStrikeSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x53
    if(Class'SPEngine.SPUtil'.static.IsToRight(Outer.PHPawn, EnemyForStrike))
    {
        return Class'LPSM_PackHunterTailWhip180Left';
    }
    return Class'LPSM_PackHunterTailWhip180Right';
    //return ReturnValue;    
}

function GetMaxStrikeAnimationTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 10.0000000;
    //return ReturnValue;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }
    stop;    
}
