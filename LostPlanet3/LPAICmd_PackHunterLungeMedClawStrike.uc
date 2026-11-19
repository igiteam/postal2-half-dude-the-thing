class LPAICmd_PackHunterLungeMedClawStrike extends LPAICmd_PackHunterStaticStrikeBase within LPAIControllerPackHunter;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.NotifyCombatManagerOfStrikeCompleted(18);
    //return;    
}

function GetStaticStrikeSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x19
    if(FRand() > 0.5000000)
    {
        return Class'LPSM_PackHunterLungeClawAttackMed';        
    }
    else
    {
        return Class'LPSM_PackHunterLungeClawAttackMedLeft';
    }
    //return ReturnValue;    
}

function GetMaxStrikeAnimationTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.PHPawn.TuneDataPackHunter.MaxTimeForMedLungeClawStrikeAnimation;
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
