class LPAICmd_PeekFromCover extends LPAICommand within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTimePeek[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLeftToPeek[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForceEndPeek[536870913];

function Pushed()
{
    bForceEndPeek = false;
    super.Pushed();
    //return;    
}

function Popped()
{
    GotoState('None');
    bForceEndPeek = false;
    super.Popped();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function SetPeekTime()
{
    local /*0x97E50000-0x00000000*/ private float inPeekTime[8388609];

    MaxTimePeek = inPeekTime;
    //return;    
}

function ForceEndPeekInXSeconds()
{
    local /*0x97E50000-0x00000000*/ private float X[8388609];

    bForceEndPeek = true;
    TimeLeftToPeek = X;
    MaxTimePeek = X;
    //return;    
}

state StateCmdActive
{Begin:

    GotoState('Peeking');
    stop;        
}

state Peeking
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    private final function SelectAnyCoverAction()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL RandomFireLink;
        local /*0x97E50000-0x00000000*/ private byte RandomCoverAction;

        // End:0x99
        if(Outer.CoverActionRandom(Outer.CoverGoal, RandomCoverAction))
        {
            RandomFireLink.SrcAction = RandomCoverAction;
            Outer.AISetCoverAction(RandomFireLink);
            return true;
        }
        return false;
        //return ReturnValue;        
    }
    J0x00:
    // End:0x44 [Loop If]
    if(!Outer.CoverIsIn())
    {
        Outer.Sleep(0.1000000);
        // [Loop Continue]
        goto J0x00;
    }
PreparePeek:


    // End:0xCC
    if(int(Outer.FireTargetCoverAction.SrcAction) == int(0))
    {
        // End:0xCC
        if(!SelectAnyCoverAction())
        {
            Outer.Sleep(1.0000000);
            Outer.PopCommand(self);
        }
    }
    Outer.LastAnimTransitionTime = Outer.WorldInfo.TimeSeconds;
    J0x11E:

    Outer.Sleep(0.2500000);
    // End:0x11E
    if(!(!Outer.IsTransitioning()))
        goto J0x11E;
    // End:0x245
    if(Outer.ShouldWaitForTransition(Outer.FireTargetCoverAction.SrcAction))
    {
        Outer.LastAnimTransitionTime = Outer.WorldInfo.TimeSeconds;
        J0x204:

        Outer.Sleep(0.2500000);
        // End:0x204
        if(!(!Outer.IsTransitioning()))
            goto J0x204;
    }
    // End:0x2F7
    if(int(Outer.FireTargetCoverAction.SrcAction) == int(0))
    {
        // End:0x2F4
        if(int(Outer.MyCoverPawn.CoverType) == int(2))
        {
            Outer.MyCoverPawn.ShouldCrouch(true);
        }        
    }
    else
    {
        Outer.AISetPeeking(true);
        Outer.CoverSetAction(Outer.FireTargetCoverAction.SrcAction);
    }
    Outer.LastAnimTransitionTime = Outer.WorldInfo.TimeSeconds;
    J0x3B9:

    Outer.Sleep(0.2500000);
    // End:0x3B9
    if(!(!Outer.IsTransitioning()))
        goto J0x3B9;
    goto 'Peek';
Peek:


    TimeLeftToPeek = MaxTimePeek;
    J0x417:

    // End:0x48F [Loop If]
    if(Outer.CoverActionIsDoing() && (MaxTimePeek <= float(0)) || TimeLeftToPeek > float(0))
    {
        Outer.Sleep(0.1000000);
        TimeLeftToPeek -= 0.1000000;
        // [Loop Continue]
        goto J0x417;
    }
ReturnToCover:


    Outer.CoverResetAction();
    J0x4AE:

    // End:0x4F0 [Loop If]
    if(Outer.IsTransitioning())
    {
        Outer.Sleep(0.1000000);
        // [Loop Continue]
        goto J0x4AE;
    }
Finish:


    Outer.PopCommand(self);
    stop;                
}
