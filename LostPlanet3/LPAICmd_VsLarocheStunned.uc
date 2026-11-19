class LPAICmd_VsLarocheStunned extends LPAICmd_Stunned within LPAIControllerVsLaroche;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowHastyPincerBash[536870913];

function SetAllowHastyPincerBash()
{
    local /*0x97E50000-0x00000000*/ private bool bBash[8388609];

    bAllowHastyPincerBash = bBash;
    //return;    
}

function Pushed()
{
    super.Pushed();
    Outer.myAIPawn.EnableLineSweepHitTester(true);
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.myAIPawn.EnableLineSweepHitTester(false);
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

    event PushedState()
    {
        super.PushedState();
        //return;        
    }

    event PoppedState()
    {
        super.PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }
Begin:

    Outer.Focus = none;
    StunnedStatus.Cmd_Stunned_Status = 1;
    TimeStartedStun = Outer.WorldInfo.TimeSeconds;
    MyPawn.DoSpecialMove(StunnedSpecialMove, true, false);
    J0xAA:

    // End:0xD7 [Loop If]
    if(StillStunned())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0xAA;
    }
    MyPawn.EndSpecialMove(StunnedSpecialMove);
    StunnedStatus.Cmd_Stunned_Status = 2;
    Outer.PopCommand(self);
    stop;                
}
