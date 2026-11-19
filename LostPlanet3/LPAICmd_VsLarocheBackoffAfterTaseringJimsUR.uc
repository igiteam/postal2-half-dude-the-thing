class LPAICmd_VsLarocheBackoffAfterTaseringJimsUR extends LPAICmd_BasicDamageAssessment within LPAIControllerVsLaroche
    config(AI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLastSpecialMoveStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDurationOfOpportunity[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDistanceToBeAwayForDialog[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayAfterOpportunityCleanUpBeforeEndingCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoneWithDialog[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte EventToFireAtStartOfOpportunity[536870913];

function Pushed()
{
    super.Pushed();
    TimeLastSpecialMoveStarted = -1.0000000;
    MaxDurationOfOpportunity = 10.0000000;
    MinDistanceToBeAwayForDialog = 1000.0000000;
    EventToFireAtStartOfOpportunity = 41;
    DelayAfterOpportunityCleanUpBeforeEndingCommand = 1.0000000;
    bDoneWithDialog = false;
    Outer.MyLPEnemy.TriggerEventClass(Class'LPSeqEvent_VitalSuitLaRocheCriticalDialog', Outer.VsLarochePawn, 8);
    //return;    
}

function Popped()
{
    local /*0x97E50000-0x00000000*/ private float commHealth;

    Outer.MyLPEnemy.TriggerEventClass(Class'LPSeqEvent_VitalSuitLaRocheCriticalDialog', Outer.VsLarochePawn, 9);
    Outer.WaitingToNextOpportunityToHandleThisBossPhaseEvent = 41;
    // End:0x12F
    if(int(Outer.GetCurrentLarocheMacroCombatState()) == int(3))
    {
        commHealth = Outer.VsLarochePawn.GetCoreHealth(3);
        // End:0x12F
        if(commHealth > float(0))
        {
            Outer.VsLarochePawn.StartTaser();
        }
    }
    super.Popped();
    Outer.VsLarochePawn.SetMaxSpeedScale(Outer.VsLarochePawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.VsLarochePawn));
    //return;    
}

function SetMinDistanceToBeAwayForDialog()
{
    local /*0x97E50000-0x00000000*/ private float MinDistanceNeeded[8388609];

    MinDistanceToBeAwayForDialog = MinDistanceNeeded;
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

function ShouldJumpBackBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldDoFastSprintToDamageAssessmentPosition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
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

function GetJumpBackSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_VsLarocheMoveBackBeforeDamageAssessment';
    //return ReturnValue;    
}

function On_LPSM_Dialog_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bDoneWithDialog = true;
    //return;    
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

function GetSmForDialog()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_VsLarocheDialog';
    //return ReturnValue;    
}

function FinishDialogSpecialMove()
{
    Outer.VsLarochePawn.EndSpecialMove(GetSmForDialog());
    //return;    
}

function StartDialogSpecialMove()
{
    TimeStartedAssessingDamage = Outer.WorldInfo.TimeSeconds;
    TimeLastSpecialMoveStarted = TimeStartedAssessingDamage;
    // End:0xAA
    if(int(EventToFireAtStartOfOpportunity) != int(41))
    {
        Outer.HandleBossFightPhaseEventMessage(Outer.MyLPEnemy, EventToFireAtStartOfOpportunity);
    }
    bDoneWithDialog = false;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.VsLarochePawn.DoSpecialMove(GetSmForDialog(), true, true, On_LPSM_Dialog_Finished);
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

        super.EndState(NextStateName);
        //return;        
    }

    function IsDoneWithDialog()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float durationOfAction;

        // End:0x0F
        if(bDoneWithDialog)
        {
            return true;
        }
        durationOfAction = Outer.WorldInfo.TimeSeconds - TimeLastSpecialMoveStarted;
        // End:0x7A
        if(durationOfAction > MaxDurationOfOpportunity)
        {
            FinishDialogSpecialMove();
            return true;
        }
        return false;
        //return ReturnValue;        
    }
DamageAssessment:

    Outer.myAIPawn.SetMaxSpeedScale(MaxSpeedScaleBeforeJumpBack);
    Outer.myAIPawn.AccelRate = Outer.myAIPawn.TuneDataBasePawn.AccelerationRate_Tunable.GetValue();
    // End:0x1E1
    if(!HasEnemyGottenToCloseDurringAssessmentOrAnnounce(CurrentSeperationToEnemySq))
    {
        Outer.EnableAnnounceEffects(true);
        bAssessingDamage = true;
        Outer.Focus = Outer.MyLPEnemy;
        StartDialogSpecialMove();
        J0x15A:

        // End:0x1B3 [Loop If]
        if(!IsDoneWithDialog())
        {
            // End:0x193
            if(HasEnemyGottenToCloseDurringAssessmentOrAnnounce(CurrentSeperationToEnemySq))
            {
                FinishDialogSpecialMove();
                goto 'EndCommand';
            }
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0x15A;
        }
        HandleDoneWithDialogSpecialMoveProcessing();
        Outer.Sleep(DelayAfterOpportunityCleanUpBeforeEndingCommand);        
    }
    J0x1E1:

    Outer.Sleep(0.0100000);
    Outer.PopCommand(self);
    stop;        
}

defaultproperties
{
    bInterruptible=false
}