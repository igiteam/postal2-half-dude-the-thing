class LPAICmd_SepiaJumpBiteStrike extends LPAICmd_SepiaStaticStrikeBase within LPAIControllerSepia;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    HandleAnimNotifyMeleeStrikeEnd(Outer.ArrayOfMeleeGroupClassToTurnOffAtTheEndOffAllStrikes);
    Outer.Focus = none;
    //return;    
}

function GetStaticStrikeSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float randChanceDraw;

    // End:0x59
    if(Outer.SepiaPawn.TuneDataSepia.bToggleOnlyFastJumpBiteStrike)
    {
        return Class'LPSM_SepiaJumpBiteStrikeFast';        
    }
    else
    {
        // End:0xAF
        if(Outer.SepiaPawn.TuneDataSepia.bToggleOnlyJumpBiteWithTellStrike)
        {
            return Class'LPSM_SepiaJumpBiteStrike';
        }
    }
    randChanceDraw = FRand();
    // End:0x134
    if(randChanceDraw <= Outer.SepiaPawn.TuneDataSepia.PercentChangeToPerformTheFastJumpBiteStrike.GetValue())
    {
        return Class'LPSM_SepiaJumpBiteStrikeFast';        
    }
    else
    {
        return Class'LPSM_SepiaJumpBiteStrike';
    }
    return Class'LPSM_SepiaJumpBiteStrike';
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
