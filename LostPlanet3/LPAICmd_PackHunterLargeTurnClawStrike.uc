class LPAICmd_PackHunterLargeTurnClawStrike extends LPAICmd_PackHunterStaticStrikeBase within LPAIControllerPackHunter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte StrikeDirection[536870913];

function SetStrikeDirection()
{
    local /*0x97E50000-0x00000000*/ private byte DirectionToStrike[8388609];

    StrikeDirection = DirectionToStrike;
    //return;    
}

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.NotifyCombatManagerOfStrikeCompleted(17);
    Outer.Focus = none;
    //return;    
}

function GetStaticStrikeSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x1E
    if(int(StrikeDirection) == int(9))
    {
        return Class'LPSM_PackHunterLargeTurnClawSwipeLeft';
    }
    return Class'LPSM_PackHunterLargeTurnClawSwipeRight';
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
