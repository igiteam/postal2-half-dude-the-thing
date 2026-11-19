class LPAICmd_LeechInvertedJumpingBiteStrike extends LPAICmd_LeechStaticStrikeBase within LPAIControllerLeech;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    HandleAnimNotifyMeleeStrikeEnd(Outer.ArrayOfMeleeGroupClassToTurnOffAtTheEndOffAllStrikes);
    super.Popped();
    Outer.LeechPawn.SetNotInverted();
    Outer.UseAnimationNormal();
    Outer.Focus = none;
    //return;    
}

function GetStaticStrikeSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_LeechInvertedJumpingBiteStrike';
    //return ReturnValue;    
}

function GetMaxStrikeAnimationTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x58
    if(Outer.LeechPawn != none)
    {
        return Outer.LeechPawn.MaxTimeForInvertedJumpingBiteStrikeAnimation;
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
