class LPAICmd_AlphaPackHunterBiteStrike extends LPAICmd_PackHunterBiteStrike within LPAIControllerAlphaPackHunter;

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

function GetStaticStrikeSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Chance;

    Chance = Outer.APHPawn.TuneDataPackHunter.PercentChanceOfTailStingAttackShortRange;
    // End:0x75
    if(Chance < float(0))
    {
        Chance = 0.0000000;        
    }
    else
    {
        // End:0x96
        if(Chance > float(100))
        {
            Chance = 100.0000000;
        }
    }
    // End:0xC5
    if(RandRange(0.0000000, 100.0000000) < Chance)
    {
        return Class'LPSM_PackHunterTailStingShortRange';        
    }
    else
    {
        // End:0xE6
        if(int(BiteDirection) == int(4))
        {
            return Class'LPSM_PackHunterShortDistanceRamLeft';            
        }
        else
        {
            // End:0x104
            if(int(BiteDirection) == int(5))
            {
                return Class'LPSM_PackHunterShortDistanceRamRight';
            }
        }
        return Class'LPSM_PackHunterShortDistanceRam';
    }
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
