class LPAICmd_SnapTurn extends LPAICommand within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerformingSnapTurn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedSnapTurn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class SnapTurnSpecialMove[536870913];

function Pushed()
{
    super.Pushed();
    bPerformingSnapTurn = false;
    TimeStartedSnapTurn = -1.0000000;
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function SetSnapTurnSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class InSpecialMove[8388609];

    SnapTurnSpecialMove = InSpecialMove;
    //return;    
}

function On_LPSM_SnapTurn_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bPerformingSnapTurn = false;
    //return;    
}

function IsSnapTurnFinished()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float durationOfAction;

    // End:0x11
    if(!bPerformingSnapTurn)
    {
        return true;
    }
    durationOfAction = Outer.WorldInfo.TimeSeconds - TimeStartedSnapTurn;
    // End:0x6E
    if(durationOfAction > 5.0000000)
    {
        return true;
    }
    return false;
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

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    Outer.Focus = none;
    bPerformingSnapTurn = true;
    TimeStartedSnapTurn = Outer.WorldInfo.TimeSeconds;
    Outer.myAIPawn.DoSpecialMove(SnapTurnSpecialMove, true, true, On_LPSM_SnapTurn_Finished);
    J0xBA:

    // End:0xE9 [Loop If]
    if(!IsSnapTurnFinished())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0xBA;
    }
    Outer.PopCommand(self);
    stop;            
}
