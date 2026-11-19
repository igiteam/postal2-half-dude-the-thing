class LPAICmd_CrabStunned extends LPAICmd_Stunned within LPAIControllerBaseSnowCrab;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowHastyPincerBash[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsRecoveryFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class RecoverySpecialMove[536870913];

function SetAllowHastyPincerBash()
{
    local /*0x97E50000-0x00000000*/ private bool bBash[8388609];

    bAllowHastyPincerBash = bBash;
    //return;    
}

function SetRecoverySpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class NewSpecialMove[8388609];

    RecoverySpecialMove = NewSpecialMove;
    //return;    
}

function On_LPSM_SnowCrabStunRecovery_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bIsRecoveryFinished = true;
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
    // End:0x112
    if(StunnedSpecialMove != none)
    {
        TimeStartedStun = Outer.WorldInfo.TimeSeconds;
        MyPawn.DoSpecialMove(StunnedSpecialMove, true, false);
        J0xB9:

        // End:0x112 [Loop If]
        if(StillStunned())
        {
            // End:0xF2
            if(bAllowHastyPincerBash)
            {
                Outer.HandleHastyPincerBashBehavior();
            }
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0xB9;
        }
    }
    // End:0x18F
    if(RecoverySpecialMove != none)
    {
        MyPawn.DoSpecialMove(RecoverySpecialMove, true, false, On_LPSM_SnowCrabStunRecovery_Finished);
        J0x15D:

        // End:0x18C [Loop If]
        if(!bIsRecoveryFinished)
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0x15D;
        }        
    }
    else
    {
        // End:0x1C6
        if(StunnedSpecialMove != none)
        {
            MyPawn.EndSpecialMove(StunnedSpecialMove);
        }
    }
    StunnedStatus.Cmd_Stunned_Status = 2;
    Outer.PopCommand(self);
    stop;                    
}
