class LPAICmd_TurnToFacePosition extends LPAICommand within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte TurnOption;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PointToFace;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowMovingToStationaryTurns;

function Pushed()
{
    super.Pushed();
    TurnOption = 1;
    //return;    
}

function Popped()
{
    OnExitTurnToFacePosition();
    super.Popped();
    //return;    
}

event SPAborted()
{
    OnExitTurnToFacePosition();
    super.SPAborted();
    //return;    
}

function OnExitTurnToFacePosition()
{
    // End:0x193
    if(Outer.myAIPawn != none)
    {
        Outer.myAIPawn.LockDesiredRotation(false);
        Outer.myAIPawn.AllowedYawError = Outer.myAIPawn.default.AllowedYawError;
        // End:0x193
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

function SetPointToFace()
{
    local /*0x97E50000-0x00000000*/ private @NULL InPoint[25296897];

    PointToFace = InPoint;
    //return;    
}

function SetAllowedYawError()
{
    local /*0x97E50000-0x00000000*/ private int InAllowedYawError[8388609];

    Outer.myAIPawn.AllowedYawError = InAllowedYawError;
    //return;    
}

function SetAllowMovingToStationaryTurns()
{
    local /*0x97E50000-0x00000000*/ private bool InAllowMovingToStationaryTurns[8388609];

    bAllowMovingToStationaryTurns = InAllowMovingToStationaryTurns;
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

    Outer.PawnLookAtActor(none);
    // End:0x125
    if((MyPawn.TransitionComponent != none) && MyPawn.TransitionComponent.NeedsTurnInPlaceToPoint(PointToFace, bAllowMovingToStationaryTurns))
    {
        // End:0x122
        if(!Outer.MySPPawn.TransitionComponent.DoTurnInPlaceToPoint(PointToFace, bAllowMovingToStationaryTurns, TurnFinishedCB))
        {
            Outer.PopCommand(self);
        }        
    }
    else
    {
        // End:0x29E
        if((int(TurnOption) == int(0)) || MyPawn.TransitionComponent == none)
        {
            Outer.myAIPawn.SetDesiredRotation(Rotator(PointToFace - Outer.myAIPawn.Location), true, true, -1.0000000, false);
            // End:0x27B
            if(Outer.myAIPawn.RotationRate.Yaw > 0)
            {
                J0x227:

                Outer.Sleep(0.0000000);
                // End:0x227
                if(!(Outer.myAIPawn.ReachedDesiredRotation()))
                    goto J0x227;
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
