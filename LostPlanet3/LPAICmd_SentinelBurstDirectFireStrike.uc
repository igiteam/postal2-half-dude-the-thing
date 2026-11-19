class LPAICmd_SentinelBurstDirectFireStrike extends LPAICmd_SentinelRangedStrikeBase within LPAIControllerSentinel;

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

    return Class'LPSM_SentinelBurstFireStrike';
    //return ReturnValue;    
}

function GetMaxStrikeAnimationTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x6D
    if(Outer.SentinelPawn != none)
    {
        return Outer.SentinelPawn.TuneDataSentinel.MaxTimeForJumpBackBeforeDamageAssessment;
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
Begin:

    StartStaticStrikeSpecialMove();
    Outer.Sleep(0.0100000);
    J0x27:

    // End:0x7E [Loop If]
    if(Outer.SentinelPawn.bPerformingBurstFire)
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x27;
    }
    Outer.PopCommand(self);
    stop;        
}
