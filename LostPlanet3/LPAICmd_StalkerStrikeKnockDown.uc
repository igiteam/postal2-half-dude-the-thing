class LPAICmd_StalkerStrikeKnockDown extends LPAICmd_AkridMediumStaticStrikeBase within LPAIControllerStalker;

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
    local /*0x97E50000-0x00000000*/ private float Seperation;

    Seperation = EnemySeperation2D();
    // End:0x40
    if(Outer.bForcedPushBounce)
    {
        return Class'LPSM_StalkerMeleeStrike';
    }
    // End:0x6C
    if(Outer.bForcedPush)
    {
        return Class'LPSM_StalkerStaticMeleeStrike';
    }
    // End:0x98
    if(Outer.bForcedPunch)
    {
        return Class'LPSM_StalkerStaticMeleeStrike02';
    }
    // End:0xC4
    if(EnemyForStrike.IsInCover())
    {
        return Class'LPSM_StalkerMeleeStrike';
    }
    // End:0x127
    if(Seperation <= Outer.StalkerPawn.TuneDataStalker.MinDistanceStandardStrike)
    {
        return Class'LPSM_StalkerStaticMeleeStrike';        
    }
    else
    {
        return Class'LPSM_StalkerStaticMeleeStrike02';
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
