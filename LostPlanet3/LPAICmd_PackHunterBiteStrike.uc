class LPAICmd_PackHunterBiteStrike extends LPAICmd_PackHunterStaticStrikeBase within LPAIControllerPackHunter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte BiteDirection[536870913];

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.NotifyCombatManagerOfStrikeCompleted(20);
    Outer.Focus = none;
    //return;    
}

function SetStrikeDirection()
{
    local /*0x97E50000-0x00000000*/ private byte DirectionToBite[8388609];

    BiteDirection = DirectionToBite;
    //return;    
}

function GetStaticStrikeSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x21
    if(int(BiteDirection) == int(4))
    {
        return Class'LPSM_PackHunterShortDistanceBiteLeft';        
    }
    else
    {
        // End:0x3F
        if(int(BiteDirection) == int(5))
        {
            return Class'LPSM_PackHunterShortDistanceBiteRight';
        }
    }
    return Class'LPSM_PackHunterShortDistanceBite';
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
