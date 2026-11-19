class LPAICmd_BurrowerJump extends LPAICmd_SpecialMove within LPAIControllerBurrower;

function Pushed()
{
    super.Pushed();
    // End:0xA8
    if(Outer.BurrowerPawn.TuneDataBurrower.bEnableAnnounce)
    {
        PreSMPauseTime = Outer.BurrowerPawn.TuneDataBurrower.TimeJumpAnnounce;
    }
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

state PrePause
{
    ignores TimerDebugAnnounce;

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        Outer.SetTimer(0.0100000, true, 'TimerDebugAnnounce', self);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ClearTimer('TimerDebugAnnounce', self);
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
    stop;    
}

defaultproperties
{
    SpecialMoveClass=Class'LPSM_BurrowerJump'
    MaxSpecialMoveTime=4.0000000
}