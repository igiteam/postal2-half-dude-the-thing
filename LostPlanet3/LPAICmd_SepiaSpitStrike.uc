class LPAICmd_SepiaSpitStrike extends LPAICmd_SepiaRangedStrikeBase within LPAIControllerSepia;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.Focus = none;
    //return;    
}

function GetStaticStrikeSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_SepiaBasicLobStrike';
    //return ReturnValue;    
}

function GetMaxStrikeAnimationTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x6D
    if(Outer.SepiaPawn != none)
    {
        return Outer.SepiaPawn.TuneDataSepia.MaxTimeForJumpBackBeforeDamageAssessment;
    }
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
