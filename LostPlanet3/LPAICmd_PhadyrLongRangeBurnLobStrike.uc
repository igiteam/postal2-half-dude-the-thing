class LPAICmd_PhadyrLongRangeBurnLobStrike extends LPAICmd_PhadyrRangedStrikeBase within LPAIControllerPhadyr;

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

    // End:0x44
    if(Outer.PhadyrPawn.bUsingLowPosture)
    {
        return Class'LPSM_PhadyrLongRangeLobStrikeLow';        
    }
    else
    {
        return Class'LPSM_PhadyrLongRangeLobStrikeHigh';
    }
    //return ReturnValue;    
}

function GetMaxStrikeAnimationTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x6D
    if(Outer.PhadyrPawn != none)
    {
        return Outer.PhadyrPawn.TuneDataPhadyr.MaxTimeForJumpBackBeforeDamageAssessment;
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
