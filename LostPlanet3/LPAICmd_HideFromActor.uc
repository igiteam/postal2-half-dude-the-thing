class LPAICmd_HideFromActor extends LPAICmd_Objective within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array HideFrom[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDistanceToSearchForHidingPlace[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HidingTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFoundHidingPlace[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DummyBot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Traversal[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HidingPlace[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL fleeCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionCmd[536870913];

function SetActors()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array InHideFrom[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    HideFrom.Length = 0;
    I = 0;
    J0x17:

    // End:0x110 [Loop If]
    if(I < InHideFrom.Length)
    {
        // End:0x102
        if(InHideFrom[I] != none)
        {
            // End:0xE2
            if(Controller(InHideFrom[I]) != none)
            {
                // End:0xDF
                if(Controller(InHideFrom[I]).Pawn != none)
                {
                    HideFrom.AddItem(Controller(InHideFrom[I]).Pawn);                    
                }                
            }
            else
            {
                HideFrom.AddItem(InHideFrom[I]);                
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function SetHidingTime()
{
    local /*0x97E50000-0x00000000*/ private float InHidingTime[8388609];

    HidingTime = InHidingTime;
    //return;    
}

function SetMaxSearchDistance()
{
    local /*0x97E50000-0x00000000*/ private float InMaxDistanceToSearchForHidingPlace[8388609];

    MaxDistanceToSearchForHidingPlace = InMaxDistanceToSearchForHidingPlace;
    //return;    
}

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Traversal.Stop();
    Traversal = none;
    DummyBot = none;
    Outer.ClearTimer('FinishTimer');
    //return;    
}

function StartTraversal()
{
    // End:0x56
    if(DummyBot == none)
    {
        DummyBot = Class'SPAIKynapse.SPKyDummyBot'.static.CreateFromPawn(Outer.myAIPawn);
    }
    // End:0x19F
    if(DummyBot != none)
    {
        // End:0xA7
        if(Traversal == none)
        {
            Traversal = LPKyTraversalFindHideSpot(Class'LPKyTraversalFindHideSpot'.static.Create());
        }
        bFoundHidingPlace = false;
        Traversal.SetActors(HideFrom);
        Traversal.SetLosFunction(IsVisible);
        Traversal.SetFinishCallBack(TraversalFinished);
        Traversal.StartAndBindToDummyBot(DummyBot, Outer.myAIPawn.Location, MaxDistanceToSearchForHidingPlace);
    }
    //return;    
}

function IsVisible()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[8388609], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bCanSee;

    bCanSee = Outer.LineOfSightTo(TestActor, FromLocation, false);
    return bCanSee;
    //return ReturnValue;    
}

function TraversalFinished()
{
    bFoundHidingPlace = Traversal.GetBestPoint(HidingPlace);
    // End:0x91
    if(bFoundHidingPlace)
    {
        // End:0x83
        if(fleeCmd != none)
        {
            Outer.AbortCommand(fleeCmd);
            fleeCmd = none;
        }
        GotoState('MoveToHidingPlace');
    }
    //return;    
}

event LPCommandTick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(LPAICommand).LPCommandTick(DeltaTime);
    //return;    
}

function ShouldAbortFlee()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bFoundHidingPlace;
    //return ReturnValue;    
}

function FleeFromEnemy()
{
    local /*0x97E50000-0x00000000*/ private float FleeDistance;

    FleeDistance = MaxDistanceToSearchForHidingPlace * 0.5000000;
    fleeCmd = Outer.CmdFlee(60.0000000, FleeDistance * float(10), FleeDistance, HideFrom, 1);
    fleeCmd.__FleeAbortDelegate__Delegate = ShouldAbortFlee;
    //return;    
}

function AmIExposed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x63 [Loop If]
    if(I < HideFrom.Length)
    {
        // End:0x55
        if(Outer.LineOfSightTo(HideFrom[I]))
        {
            return true;
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

function FinishTimer()
{
    Outer.PopCommand(self);
    //return;    
}

state StateCmdActive
{Begin:

    Outer.SetTimer(HidingTime, false, 'FinishTimer', self);
    GotoState('StartHiding');
    stop;        
}

state StartHiding
{Begin:

    Outer.Focus = none;
    J0x20:

    // End:0x73 [Loop If]
    if(true)
    {
        StartTraversal();
        J0x2E:

        // End:0x70 [Loop If]
        if(Traversal.IsRunning())
        {
            Outer.Sleep(0.0010000);
            // [Loop Continue]
            goto J0x2E;
        }
        // [Loop Continue]
        goto J0x20;
    }
    Outer.PopCommand(self);
    stop;                    
}

state MoveToHidingPlace
{
    function MoveToPos()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Position[8388609];

        // End:0x1CD
        if(VSizeSq(Position - Outer.myAIPawn.Location) > (Outer.MyKynapseRadius * Outer.MyKynapseRadius))
        {
            Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 0;
            Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
            MoveToPositionCmd = Outer.CmdMoveToPosition(Position,, Outer.MyKynapseRadius, Outer.CmdStatus_MoveToPosition, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfMoveToHidingPlace);
            MoveToPositionCmd.bZeroVelocityOnFinish = true;
        }
        //return;        
    }
Begin:

    MoveToPos(HidingPlace);
    J0x13:

    // End:0x71 [Loop If]
    if(int(Outer.CmdStatus_MoveToPosition.Cmd_Move_Error) != int(2))
    {
        Outer.Sleep(0.0010000);
        // [Loop Continue]
        goto J0x13;
    }
    MoveToPositionCmd = none;
    GotoState('InHiding');
    stop;        
}

state InHiding
{Begin:

    Outer.Focus = HideFrom[0];
    J0x2A:

    // End:0x59 [Loop If]
    if(!AmIExposed())
    {
        Outer.Sleep(0.0010000);
        // [Loop Continue]
        goto J0x2A;
    }
    GotoState('StartHiding');
    stop;                    
}

defaultproperties
{
    MaxDistanceToSearchForHidingPlace=10000.0000000
    HidingTime=120.0000000
}