class LPAICmd_TurnToFaceFocus extends LPAICommand within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte TurnOption;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bClearFocusOnFinish;

function Pushed()
{
    super.Pushed();
    TurnOption = 1;
    //return;    
}

function Popped()
{
    OnExitTurnToFaceFocus();
    super.Popped();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function OnExitTurnToFaceFocus()
{
    // End:0x189
    if(Outer.myAIPawn != none)
    {
        // End:0x50
        if(bClearFocusOnFinish)
        {
            Outer.PawnDontLook();
        }
        Outer.myAIPawn.AllowedYawError = Outer.myAIPawn.default.AllowedYawError;
        // End:0x189
        if((Outer.myAIPawn.TransitionComponent != none) && Outer.myAIPawn.TransitionComponent.IsDoingTransition())
        {
            Outer.myAIPawn.TransitionComponent.StopTransition(true, true);
        }
    }
    //return;    
}

function SetTurnOption()
{
    local /*0x97E50000-0x00000000*/ private byte InTurnOption[8388609];

    TurnOption = InTurnOption;
    //return;    
}

function SetAllowedYawError()
{
    local /*0x97E50000-0x00000000*/ private int InAllowedYawError[8388609];

    Outer.myAIPawn.AllowedYawError = InAllowedYawError;
    //return;    
}

function SetClearFocusOnFinish()
{
    local /*0x97E50000-0x00000000*/ private bool InClearFocusOnFinish[8388609];

    bClearFocusOnFinish = InClearFocusOnFinish;
    //return;    
}

function TurnFinishedCB()
{
    local /*0x97E50000-0x00000000*/ private bool bInAborted[8388609];

    Outer.PopCommand(self);
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

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    // End:0x44
    if(Outer.Focus == none)
    {
        Outer.PopCommand(self);
    }
    // End:0x13C
    if((MyPawn.TransitionComponent != none) && MyPawn.TransitionComponent.NeedsTurnInPlaceToActor(Outer.Focus, true))
    {
        Outer.MySPPawn.TransitionComponent.DoTurnInPlaceToActor(Outer.Focus, true, TurnFinishedCB);        
    }
    else
    {
        // End:0x33B
        if((int(TurnOption) == int(0)) || MyPawn.TransitionComponent == none)
        {
            // End:0x278
            if(int(Outer.myAIPawn.Physics) == int(7))
            {
                J0x1B4:

                // End:0x244 [Loop If]
                if(Outer.myAIPawn.IsDoingASpecialMove() || Outer.myAIPawn.bIsUnderMatineeControl)
                {
                    Outer.Sleep(0.0000000);
                    // [Loop Continue]
                    goto J0x1B4;
                }
                Outer.myAIPawn.SetMovementPhysics();
            }
            // End:0x318
            if(Outer.myAIPawn.RotationRate.Yaw > 0)
            {
                J0x2C4:

                Outer.Sleep(0.0000000);
                // End:0x2C4
                if(!(Outer.myAIPawn.ReachedDesiredRotation()))
                    goto J0x2C4;
            }
            Outer.PopCommand(self);            
        }
        else
        {
            Outer.PopCommand(self);
        }
    }
    stop;                    
}
