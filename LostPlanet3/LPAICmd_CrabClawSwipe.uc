class LPAICmd_CrabClawSwipe extends LPAICmd_CrabBaseStrike within LPAIControllerBaseSnowCrab;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWaitingForSpecialMove[536870913];

function Pushed()
{
    super.Pushed();
    Outer.SetWantsNewEnemy(true);
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.ResetSwipeAttackWaitTimer();
    Outer.ResetRotationRate();
    //return;    
}

function SpecialMoveFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

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
        super(SPStateObject).PushedState();
        //return;        
    }

    event PausedState()
    {
        super(SPStateObject).PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function SpecialMoveFinished()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

        bWaitingForSpecialMove = false;
        //return;        
    }

    function StartSwipe()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bLeftDismembered, bRightDismembered;

        bLeftDismembered = Outer.CrabPawn.IsClawLeftDismembered();
        bRightDismembered = Outer.CrabPawn.IsClawRightDismembered();
        // End:0x9C
        if(bLeftDismembered && bRightDismembered)
        {
            return false;
        }
        // End:0x17F
        if(bLeftDismembered == bRightDismembered)
        {
            // End:0x129
            if(RandRange(0.0000000, 1.0000000) < 0.5000000)
            {
                Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabSwipeLeft', true, true, SpecialMoveFinished);
                return true;                
            }
            else
            {
                Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabSwipeRight', true, true, SpecialMoveFinished);
                return true;
            }            
        }
        else
        {
            // End:0x1E1
            if(!bLeftDismembered)
            {
                Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabSwipeLeft', true, false, SpecialMoveFinished);
                return true;
            }
            Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabSwipeRight', true, false, SpecialMoveFinished);
            return true;
        }
        //return ReturnValue;        
    }

    function SetFocus()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ClosestEnemy;

        // End:0xB9
        if(Outer.GetNumOtherEnemiesWithinRange(Outer.CrabPawn.TuneDataIceCrab.MaxDistToEnemiesForSwipeAttack.GetValue(), none, ClosestEnemy) > 0)
        {
            Outer.Focus = ClosestEnemy;            
        }
        else
        {
            Outer.Focus = EnemyForStrike;
        }
        //return;        
    }
Begin:

    SetFocus();
    // End:0xDD
    if(StartSwipe())
    {
        bWaitingForSpecialMove = true;
        J0x23:

        // End:0xDA [Loop If]
        if(bWaitingForSpecialMove)
        {
            Outer.HandlePossibleNeedToPushAwayPawnWhileNotMoving();
            Outer.Sleep(0.1000000);
            // End:0xD7
            if(Outer.CrabPawn.TuneDataIceCrab.bAllowHastyPincerBashDuringClawIn)
            {
                Outer.HandleHastyPincerBashBehavior();
            }
            // [Loop Continue]
            goto J0x23;
        }        
    }
    else
    {
        Outer.CmdCrabPincerStrikePof(EnemyForStrike,, 1);
    }
    J0x108:

    Outer.Focus = none;
    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    bInterruptible=false
}