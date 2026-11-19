class LPAICmd_VsLarocheBackoffForDramaticDialogOpportunity extends LPAICommand within LPAIControllerVsLaroche;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOpportunityStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDurationOfOpportunity[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayAfterOpportunityCleanUpBeforeEndingCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoneWithOpportunity[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte EventToFireAtStartOfOpportunity[536870913];

function Pushed()
{
    super.Pushed();
    TimeOpportunityStarted = -1.0000000;
    MaxDurationOfOpportunity = 10.0000000;
    EventToFireAtStartOfOpportunity = 41;
    DelayAfterOpportunityCleanUpBeforeEndingCommand = -1.0000000;
    bDoneWithOpportunity = false;
    Outer.MyLPEnemy.TriggerEventClass(Class'LPSeqEvent_VitalSuitLaRocheCriticalDialog', Outer.VsLarochePawn, 0);
    //return;    
}

function Popped()
{
    Outer.MyLPEnemy.TriggerEventClass(Class'LPSeqEvent_VitalSuitLaRocheCriticalDialog', Outer.VsLarochePawn, 1);
    Outer.WaitingToNextOpportunityToHandleThisBossPhaseEvent = 41;
    super.Popped();
    //return;    
}

function SetEventToFireAtStartOfOpportunity()
{
    local /*0x97E50000-0x00000000*/ private byte InEventToFireAtStartOfOpportunity[8388609];

    EventToFireAtStartOfOpportunity = InEventToFireAtStartOfOpportunity;
    //return;    
}

function SetMaxDurationOfOpportunity()
{
    local /*0x97E50000-0x00000000*/ private float InMaxDurationOfOpportunity[8388609];

    MaxDurationOfOpportunity = InMaxDurationOfOpportunity;
    //return;    
}

function SetDelayAfterOpportunityCleanUpBeforeEndingCommand()
{
    local /*0x97E50000-0x00000000*/ private float InDelayAfterOpportunityCleanUpBeforeEndingCommand[8388609];

    DelayAfterOpportunityCleanUpBeforeEndingCommand = InDelayAfterOpportunityCleanUpBeforeEndingCommand;
    //return;    
}

simulated function IsLeftArmGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsLeftShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsRightShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsRightBicepGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsCockpitCrossBarForShieldGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsCockpitCrossBarGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsRightInnerShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function StartOpportunity()
{
    TimeOpportunityStarted = Outer.WorldInfo.TimeSeconds;
    // End:0x97
    if(int(EventToFireAtStartOfOpportunity) != int(41))
    {
        Outer.HandleBossFightPhaseEventMessage(Outer.MyLPEnemy, EventToFireAtStartOfOpportunity);
    }
    bDoneWithOpportunity = false;
    //return;    
}

function HandleDoneWithDialogSpecialMoveProcessing()
{
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

    function IsDoneWithScene()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float durationOfAction;

        // End:0x0F
        if(bDoneWithOpportunity)
        {
            return true;
        }
        // End:0x3B
        if(int(Outer.GetCurrentLarocheMacroCombatState()) == int(8))
        {
            return true;
        }
        durationOfAction = Outer.WorldInfo.TimeSeconds - TimeOpportunityStarted;
        // End:0x9C
        if(durationOfAction > MaxDurationOfOpportunity)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    StartOpportunity();
    J0x0A:

    // End:0x39 [Loop If]
    if(!IsDoneWithScene())
    {
        Outer.Sleep(0.0330000);
        // [Loop Continue]
        goto J0x0A;
    }
    Outer.Sleep(DelayAfterOpportunityCleanUpBeforeEndingCommand);
    Outer.PopCommand(self);
    stop;        
}

defaultproperties
{
    bInterruptible=false
}