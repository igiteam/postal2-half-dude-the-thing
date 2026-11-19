class LPAICmd_MoveToActorKismet extends LPAICmd_MoveToActor within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DistanceFaceDestinationOnArrival;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFaceDestinationOnArrival;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOldShouldWalk;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldWalk;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bClearLatentAction;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL finalRotation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL KismetAction;

function SetShouldWalk()
{
    local /*0x97E50000-0x00000000*/ private bool bInShouldWalk[8388609];

    bShouldWalk = bInShouldWalk;
    //return;    
}

function SetFaceDestinationRotation()
{
    local /*0x97E50000-0x00000000*/ private bool bFaceDest[8388609];
    local /*0x97E50000-0x00000000*/ private float InDistanceStartLooking[8388609];

    bFaceDestinationOnArrival = bFaceDest;
    DistanceFaceDestinationOnArrival = InDistanceStartLooking;
    //return;    
}

function Pushed()
{
    bOldShouldWalk = Outer.myAIPawn.bIsWalking;
    KismetAction = none;
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.ScriptedFocus = none;
    Outer.myAIPawn.bIsWalking = bOldShouldWalk;
    //return;    
}

function SetKismetAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL InKismetAction[8388609];

    KismetAction = InKismetAction;
    bClearLatentAction = true;
    //return;    
}

function NotifyMoveAboutToStart()
{
    Outer.myAIPawn.bIsWalking = bShouldWalk;
    super.NotifyMoveAboutToStart();
    //return;    
}

function NotifyMoveEnded()
{
    finalRotation = TargetActor.Rotation;
    // End:0x5E
    if(bClearLatentAction)
    {
        Outer.ClearThisLatentAction(KismetAction, false);
    }
    super.NotifyMoveEnded();
    //return;    
}

function NotifyMoveAborted()
{
    // End:0x36
    if(bClearLatentAction)
    {
        Outer.ClearThisLatentAction(KismetAction, true);
    }
    super(LPAICmd_Move).NotifyMoveAborted();
    //return;    
}

function OnNewKismetAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL InKismetAction[8388609];

    // End:0x23
    if(InKismetAction == KismetAction)
    {
        bClearLatentAction = false;
    }
    //return;    
}

function UpdateDuringMove()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0xA7
    if(Outer.Kynapse_PathFinderGetDistanceLeft() < DistanceFaceDestinationOnArrival)
    {
        Outer.PawnLookAtPos(Outer.myAIPawn.Location + (Vector(TargetActor.Rotation) * float(100)));
    }
    return super(LPAICmd_Move).UpdateDuringMove();
    //return ReturnValue;    
}

state MoveEnded
{
    function AbortRotation()
    {
        Outer.PopCommand(self);
        //return;        
    }

    function OnEndOfMoveEndedState()
    {
        Outer.PopCommand(self);
        //return;        
    }
Begin:

    Outer.Sleep(0.0000000);
    // End:0x243
    if(bFaceDestinationOnArrival)
    {
        Outer.Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        Outer.Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Outer.Kynapse_ActivateBot(false);
        Outer.Focus = none;
        Outer.SetFocalPoint((Vector(finalRotation) * float(100)) + Outer.myAIPawn.Location);
        Outer.SetTimer(10.0000000, false, 'AbortRotation', self);
        // End:0x21A
        if(Outer.myAIPawn.RotationRate.Yaw > 0)
        {
            J0x1C6:

            Outer.Sleep(0.0000000);
            // End:0x1C6
            if(!(Outer.myAIPawn.ReachedDesiredRotation()))
                goto J0x1C6;
        }
        Outer.ClearTimer('AbortRotation');
    }
    OnEndOfMoveEndedState();
    stop;            
}
