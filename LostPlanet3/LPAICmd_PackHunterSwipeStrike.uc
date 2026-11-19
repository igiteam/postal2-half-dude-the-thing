class LPAICmd_PackHunterSwipeStrike extends LPAICmd_PackHunterStaticStrikeBase within LPAIControllerPackHunter;

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

function StartStrikePoF()
{
    //return;    
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

    // End:0xC5
    if(Class'SPEngine.SPUtil'.static.IsToRight(Outer.PHPawn, EnemyForStrike))
    {
        Outer.CmdSpecialMove(Class'LPSM_PackHunterSwipeRightStrike', true, 0.0000000, Outer.PHPawn.TuneDataPackHunter.MaxTimeForForFastSwipe);        
    }
    else
    {
        Outer.CmdSpecialMove(Class'LPSM_PackHunterSwipeLeftStrike', true, 0.0000000, Outer.PHPawn.TuneDataPackHunter.MaxTimeForForFastSwipe);
    }
    Outer.PopCommand(self);
    stop;        
}
