class LPAICmd_RangedBaseAttack extends LPAICmd_Attack within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MinNumberOfStrikesToAttemptPerAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxNumberOfStrikesToAttemptPerAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumberOfStrikesDoneSoFarThisAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumberOfStrikesToDoThisAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmountOfDamageReceivedSoFarThisAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmountOfDamageToStopTheAttackThisAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAmountOfDamageRequiredToStopAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAmountOfDamageRequiredToStopAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDurationOfDamageAssessmentInSecs[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDurationOfDamageAssessmentInSecs[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentSeperationToEnemySq[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurSpecialMoveCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurWaitCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionFlyCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurTurnToFaceCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurDamageAssessmentCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurStrikeCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCheckToSeeIfAnyEnemyHasGottenToCloseAndNeedsToQuitAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerformingAnnounce[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldUseShortAnnounce[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RangeToAnyEnemyToQuitAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedAnnounce[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfTimesMoveToStartOfAttackPointHasFailed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfTimesMoveToStartOfAttackPointHasNotFailedButStillNotGottenThere[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> ProcessLookForAnotherAttackOpportunityDelegate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> ProcessLookForAlternateAttackOpportunityDelegate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> IsThereClearRangedAttackLaneDelegate;

function Pushed()
{
    super.Pushed();
    MinNumberOfStrikesToAttemptPerAttack = 2147483647;
    MaxNumberOfStrikesToAttemptPerAttack = 2147483647;
    NumberOfStrikesToDoThisAttack = 0;
    NumberOfStrikesDoneSoFarThisAttack = 0;
    NumOfTimesMoveToStartOfAttackPointHasFailed = 0;
    NumOfTimesMoveToStartOfAttackPointHasNotFailedButStillNotGottenThere = 0;
    AmountOfDamageReceivedSoFarThisAttack = 0.0000000;
    AmountOfDamageToStopTheAttackThisAttack = float(2147483647);
    CurrentSeperationToEnemySq = -1.0000000;
    MinAmountOfDamageRequiredToStopAttack = float(2147483647);
    MaxAmountOfDamageRequiredToStopAttack = float(2147483647);
    MinDurationOfDamageAssessmentInSecs = 5.0000000;
    MaxDurationOfDamageAssessmentInSecs = 5.0000000;
    bPerformingAnnounce = false;
    bShouldUseShortAnnounce = false;
    CurSpecialMoveCmd = none;
    CurWaitCmd = none;
    MoveToPositionFlyCmd = none;
    MoveToActorCmd = none;
    MoveToPositionCmd = none;
    CurStrikeCmd = none;
    CurTurnToFaceCmd = none;
    CurDamageAssessmentCmd = none;
    //return;    
}

function Popped()
{
    StopProcessWidthdrawFromFightMonitorTimer();
    // End:0x21
    if(bCheckToSeeIfAnyEnemyHasGottenToCloseAndNeedsToQuitAttack)
    {
        StopHasAnyEnemyGottenTooCloseTimer();
    }
    AbortAnyRunningChildCommand();
    Outer.EnableAnnounceEffects(false);
    Outer.myAIPawn.SetCurrentlyNotValidTargetForGrenadeAssist();
    Outer.LockStrikeAccess(false);
    Outer.ReleaseRangedStrikeAccessForFailedAttack();
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function SetMinNumberOfStrikesToAttemptPerAttack()
{
    local /*0x97E50000-0x00000000*/ private int NumOfAttempts[8388609];

    // End:0x7C
    if(NumOfAttempts <= 0)
    {
        NumOfAttempts = int(Outer.myAIPawn.TuneDataAIPawn.DefaultMinNumberOfRangedStrikesPerAttack.GetValue());        
    }
    else
    {
        MinNumberOfStrikesToAttemptPerAttack = NumOfAttempts;
    }
    //return;    
}

function SetMaxNumberOfStrikesToAttemptPerAttack()
{
    local /*0x97E50000-0x00000000*/ private int NumOfAttempts[8388609];

    // End:0x7C
    if(NumOfAttempts <= 0)
    {
        NumOfAttempts = int(Outer.myAIPawn.TuneDataAIPawn.DefaultMaxNumberOfRangedStrikesPerAttack.GetValue());        
    }
    else
    {
        MaxNumberOfStrikesToAttemptPerAttack = NumOfAttempts;
    }
    //return;    
}

function SetMinAmountOfDamageRequiredToStopAttack()
{
    local /*0x97E50000-0x00000000*/ private int NumOfHits[8388609];

    MinAmountOfDamageRequiredToStopAttack = float(NumOfHits);
    //return;    
}

function SetMaxAmountOfDamageRequiredToStopAttack()
{
    local /*0x97E50000-0x00000000*/ private int NumOfHits[8388609];

    MaxAmountOfDamageRequiredToStopAttack = float(NumOfHits);
    //return;    
}

function SetMinDurationOfDamageAssessmentInSecs()
{
    local /*0x97E50000-0x00000000*/ private float InMinDurationOfDamageAssessmentInSecs[8388609];

    MinDurationOfDamageAssessmentInSecs = InMinDurationOfDamageAssessmentInSecs;
    //return;    
}

function SetMaxDurationOfDamageAssessmentInSecs()
{
    local /*0x97E50000-0x00000000*/ private float InMaxDurationOfDamageAssessmentInSecs[8388609];

    MaxDurationOfDamageAssessmentInSecs = InMaxDurationOfDamageAssessmentInSecs;
    //return;    
}

function SetProcessLookForAnotherAttackOpportunityDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAnotherAttackOpportunityDel[8388609];

    ProcessLookForAnotherAttackOpportunityDelegate = InProcessLookForAnotherAttackOpportunityDel;
    //return;    
}

function SetProcessLookForAlternateAttackOpportunityDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAlternateAttackOpportunityDel[8388609];

    ProcessLookForAlternateAttackOpportunityDelegate = InProcessLookForAlternateAttackOpportunityDel;
    //return;    
}

function SetIsThereClearRangedAttackLaneDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InIsThereAClearAttackLaneDel[8388609];

    IsThereClearRangedAttackLaneDelegate = InIsThereAClearAttackLaneDel;
    //return;    
}

function SetRangeToAnyEnemyToQuitAttackData()
{
    local /*0x97E50000-0x00000000*/ private bool inCheckToSeeIfAnyEnemyHasGottenToCloseAndNeedsToQuitAttack[8388609];
    local /*0x97E50000-0x00000000*/ private float inRangeToAnyEnemyToQuitAttack[8388609];

    bCheckToSeeIfAnyEnemyHasGottenToCloseAndNeedsToQuitAttack = inCheckToSeeIfAnyEnemyHasGottenToCloseAndNeedsToQuitAttack;
    RangeToAnyEnemyToQuitAttack = inRangeToAnyEnemyToQuitAttack;
    //return;    
}

function GetAmountOfDamageToStopTheAttackThisAttack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x2D
    if(Outer.bBeSuperAggressive)
    {
        return float(2147483647);        
    }
    else
    {
        return RandRange(Outer.myAIPawn.TuneDataAIPawn.MinAmountOfDamageForTripAndPlowIn.GetValue(), Outer.myAIPawn.TuneDataAIPawn.MaxAmountOfDamageForTripAndPlowIn.GetValue());
    }
    //return ReturnValue;    
}

private final function AbortAnyRunningChildCommand()
{
    // End:0x38
    if(CurSpecialMoveCmd != none)
    {
        Outer.AbortCommand(CurSpecialMoveCmd);
    }
    // End:0x7B
    if(CurWaitCmd != none)
    {
        Outer.AbortCommand(CurWaitCmd);
        CurWaitCmd = none;
    }
    // End:0xBE
    if(MoveToPositionFlyCmd != none)
    {
        Outer.AbortCommand(MoveToPositionFlyCmd);
        MoveToPositionFlyCmd = none;
    }
    // End:0x101
    if(MoveToActorCmd != none)
    {
        Outer.AbortCommand(MoveToActorCmd);
        MoveToActorCmd = none;
    }
    // End:0x144
    if(MoveToPositionCmd != none)
    {
        Outer.AbortCommand(MoveToPositionCmd);
        MoveToPositionCmd = none;
    }
    // End:0x187
    if(CurStrikeCmd != none)
    {
        Outer.AbortCommand(CurStrikeCmd);
        CurStrikeCmd = none;
    }
    // End:0x1BF
    if(CurDamageAssessmentCmd != none)
    {
        Outer.AbortCommand(CurDamageAssessmentCmd);
    }
    // End:0x1F7
    if(CurTurnToFaceCmd != none)
    {
        Outer.AbortCommand(CurTurnToFaceCmd);
    }
    //return;    
}

event NotifyOfNonCoreHit()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    AmountOfDamageReceivedSoFarThisAttack += AmountOfDamage;
    return HandlePossibilityTookEnoughDamageToCauseBehaviorChangeDuringRangedAttack();
    //return ReturnValue;    
}

function HandlePossibilityTookEnoughDamageToCauseBehaviorChangeDuringRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x6B
    if((MoveToPositionFlyCmd != none) && Outer.myAIPawn != none)
    {
        // End:0x6B
        if(AmountOfDamageReceivedSoFarThisAttack >= AmountOfDamageToStopTheAttackThisAttack)
        {
            Outer.NotifyKnockedOutOfAttackByTakingToMuchDamage();
        }
    }
    // End:0x157
    if(AmountOfDamageReceivedSoFarThisAttack >= AmountOfDamageToStopTheAttackThisAttack)
    {
        NumOfAttemptsToFindWithDrawPointThisAttack = 0;
        AbortAnyRunningChildCommand();
        // End:0x13A
        if(bPerformingAnnounce)
        {
            // End:0xF1
            if(bShouldUseShortAnnounce)
            {
                Outer.myAIPawn.EndSpecialMove(Class'LPSM_AttackAnnounce');                
            }
            else
            {
                Outer.myAIPawn.EndSpecialMove(Class'LPSM_AttackAnnounce');
            }
            bPerformingAnnounce = false;
        }
        StartTryingToFindingWithDrawPoint();
        GotoState('RetreatToAttackPoint');
        return true;        
    }
    else
    {
        // End:0x18F
        if(CurSpecialMoveCmd != none)
        {
            Outer.AbortCommand(CurSpecialMoveCmd);
        }
        // End:0x1C7
        if(CurWaitCmd != none)
        {
            Outer.AbortCommand(CurWaitCmd);
        }
        // End:0x26A
        if(bPerformingAnnounce)
        {
            // End:0x221
            if(bShouldUseShortAnnounce)
            {
                Outer.myAIPawn.EndSpecialMove(Class'LPSM_AttackAnnounce');                
            }
            else
            {
                Outer.myAIPawn.EndSpecialMove(Class'LPSM_AttackAnnounce');
            }
            bPerformingAnnounce = false;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetMinSeperationToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return ConvertRangeToSeperation(Outer.myAIPawn.TuneDataAIPawn.MaxSeperationForDirectPhysicalStrike);
    //return ReturnValue;    
}

function MoveToEnemyForRangedStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function HandleDoneWithMoveToEnemyForRangedStrikeCleanUp()
{
    //return;    
}

function HandleDoneWithRangedStrikeCleanUp()
{
    //return;    
}

function IsThisControllerAllowedToStayInAttackCommandWithOutHavingRequiredAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsThisControllerAllowedToStayInAttackCommandWithOutHavingRequiredAccess();
    //return ReturnValue;    
}

function NotifyOfFailedMovementToRangedStrikePoint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x43
    if(MoveToPositionFlyCmd != none)
    {
        Outer.AbortCommand(MoveToPositionFlyCmd);
        MoveToPositionFlyCmd = none;
    }
    Outer.PopCommand(self);
    return true;
    //return ReturnValue;    
}

function DoesStillNeedToMoveCloserToEnemyForRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function AfterStrikeDoesStillNeedToMoveCloserToEnemyForRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return DoesStillNeedToMoveCloserToEnemyForRangedAttack();
    //return ReturnValue;    
}

function PerformBestRangedStikeBasedOnDistanceToTarget()
{
    //return;    
}

function GetPauseBetweenRangedStrikesSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_AIBasePlayFullBodyAnimSeq';
    //return ReturnValue;    
}

function GetCanNotDoRangedStrikeAfterMoveToEnemyAndGoingToDamageAssessmentSnapTurnSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_AIBasePlayFullBodyAnimSeq';
    //return ReturnValue;    
}

function NeedToPerformRangedAttackDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldPerformAnnounceBeforeRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldTurnToFaceBeforeStartOfRangedStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function SetFocusForTurnToFaceBeforeRangedStriking()
{
    Outer.Focus = EnemyForAttack;
    //return;    
}

function HaveRequiredAccessForAnnounceDuringRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.HaveStrikeAccess();
    //return ReturnValue;    
}

function IsValidGrenadeAssistTargetDurringRangedAttackAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldPerformDamageAssessmentIfCanNotRangeStrikeAfterMoveToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldPerformSnapTurnBeforeMovingToDamageAssessmentIfCanNotRangedStrikeAfterMoveToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function HaveRequiredAccessForMoveToEnemyForStrikeDuringRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.HaveStrikeAccess();
    //return ReturnValue;    
}

function HaveRequiredAccessForForStrikingDuringRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.HaveStrikeAccess();
    //return ReturnValue;    
}

function CanStillPerformRangedStrikeAgainstCurrentTarget()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function IsAttackOpertunityStillValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function AbortMoveInForRangedStrikeIfStrikeAccessLost()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldTurnToFaceFocusBeforeDamageAssessmentDuringRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldEndRangedAttackAfterStrikes()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x63
    if(Outer.NumberOfAttackersFor(EnemyForAttack) > 0)
    {
        // End:0x61
        if(ProcessLookForAnotherAttackOpportunityDelegate != none)
        {
            // End:0x61
            if(OnProcessLookForAnotherAttackOpportunity(true))
            {
                NumberOfStrikesDoneSoFarThisAttack = 0;
                return false;
            }
        }
        return true;
    }
    NumberOfStrikesDoneSoFarThisAttack = 0;
    return false;
    //return ReturnValue;    
}

function HasMoveToStartOfRangedAttackPointFailed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x7E
    if(int(Outer.CmdStatus_MoveToPosition.Cmd_Move_Error) >= int(3))
    {
        // End:0x7E
        if(int(Outer.CmdStatus_MoveToPosition.Cmd_Move_Error) != int(6))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function HasFailedToReachRandgedAttackPointToManyTimes()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function On_LPSM_AttackAnnounce_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bPerformingAnnounce = false;
    //return;    
}

function PerformDamageAssessment()
{
    //return;    
}

function RangedStikeLaneStillValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function GetDelayBetweenStrikeAttempts()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(Outer.myAIPawn.TuneDataAIPawn.MinDelayBetweenStrikeAttempts.GetValue(), Outer.myAIPawn.TuneDataAIPawn.MaxDelayBetweenStrikeAttempts.GetValue());
    //return ReturnValue;    
}

final function StartHasAnyEnemyGottenTooCloseTimer()
{
    // End:0x5D
    if(!Outer.bDisableAI && !IsHasAnyEnemyGottenTooCloseTimerActive())
    {
        Outer.SetTimer(0.1000000, true, 'HasAnyEnemyGottenTooCloseTimer', self);
    }
    //return;    
}

final function StopHasAnyEnemyGottenTooCloseTimer()
{
    Outer.ClearTimer('HasAnyEnemyGottenTooCloseTimer', self);
    //return;    
}

function PauseHasAnyEnemyGottenTooCloseTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopHasAnyEnemyGottenTooCloseTimer();        
    }
    else
    {
        StartHasAnyEnemyGottenTooCloseTimer();
    }
    //return;    
}

final function IsHasAnyEnemyGottenTooCloseTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('HasAnyEnemyGottenTooCloseTimer', self);
    //return ReturnValue;    
}

private final function HasAnyEnemyGottenTooCloseTimer()
{
    HasAnyEnemyGottenTooClose();
    //return;    
}

function HasAnyEnemyGottenTooClose()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ClosestEnemy;
    local /*0x97E50000-0x00000000*/ private float RangeToClosestEnemy;

    // End:0x69
    if(Outer.IsAnyEnemyTooClose(RangeToAnyEnemyToQuitAttack, false, ClosestEnemy, RangeToClosestEnemy))
    {
        // End:0x69
        if(NotifyEnemyGottenToClose(ClosestEnemy, RangeToClosestEnemy))
        {
            StopHasAnyEnemyGottenTooCloseTimer();
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function NotifyEnemyGottenToClose()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyThatGotToClose[8388609];
    local /*0x97E50000-0x00000000*/ private float RangeToClosestEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

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

    function GetNumberOfStrikesToDoThisAttack()
    {
        local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

        return Rand(MaxNumberOfStrikesToAttemptPerAttack - MinNumberOfStrikesToAttemptPerAttack) + MinNumberOfStrikesToAttemptPerAttack;
        //return ReturnValue;        
    }

    function GetAmountOfDamageToStopTheAttackThisAttack()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

        return RandRange(MinAmountOfDamageRequiredToStopAttack, MaxAmountOfDamageRequiredToStopAttack);
        //return ReturnValue;        
    }

    function SetDesiredVelocityOutOfAnnounce()
    {
        local /*0x97E50000-0x00000000*/ private @NULL moveDir;

        moveDir = Normal(Outer.myAIPawn.Velocity);
        Outer.myAIPawn.DesiredSpeed = Outer.myAIPawn.TuneDataAIPawn.DesiredSpeedCommingOutOfTheAnnounce;
        Outer.myAIPawn.Velocity = (moveDir * Outer.myAIPawn.DesiredSpeed) * Outer.myAIPawn.GroundSpeed;
        //return;        
    }

    function IsAnnounceFinished()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float durationOfAction;

        // End:0x11
        if(!bPerformingAnnounce)
        {
            return true;
        }
        durationOfAction = Outer.WorldInfo.TimeSeconds - TimeStartedAnnounce;
        // End:0xB1
        if(durationOfAction > Outer.myAIPawn.TuneDataAIPawn.MaxTimeForAttackAnnounce)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    Outer.LockStrikeAccess(false);
    NumberOfStrikesDoneSoFarThisAttack = 0;
    AmountOfDamageReceivedSoFarThisAttack = 0.0000000;
    AmountOfDamageToStopTheAttackThisAttack = GetAmountOfDamageToStopTheAttackThisAttack();
    NumberOfStrikesToDoThisAttack = GetNumberOfStrikesToDoThisAttack();
    // End:0x79
    if(bCheckToSeeIfAnyEnemyHasGottenToCloseAndNeedsToQuitAttack)
    {
        StartHasAnyEnemyGottenTooCloseTimer();
    }
Announce:


    // End:0x40D
    if((ShouldPerformAnnounceBeforeRangedAttack()) && HaveRequiredAccessForAnnounceDuringRangedAttack())
    {
        Outer.LockStrikeAccess(true);
        Outer.Focus = Outer.MyLPEnemy;
        Outer.EnableAnnounceEffects(true);
        // End:0x153
        if(IsValidGrenadeAssistTargetDurringRangedAttackAnnounce())
        {
            Outer.myAIPawn.SetCurrentlyValidTargetForGrenadeAssist();
        }
        // End:0x40D
        if(!Outer.HasEnemyGottenToCloseDurringAssessmentOrAnnounce(CurrentSeperationToEnemySq))
        {
            TimeStartedAnnounce = Outer.WorldInfo.TimeSeconds;
            bPerformingAnnounce = true;
            Outer.myAIPawn.SetRadarIconState(2);
            // End:0x2AB
            if(Outer.myAIPawn.Mesh.bRecentlyRendered)
            {
                bShouldUseShortAnnounce = true;
                Outer.myAIPawn.DoSpecialMove(Class'LPSM_AttackAnnounce', true, true, On_LPSM_AttackAnnounce_Finished);                
            }
            else
            {
                bShouldUseShortAnnounce = false;
                Outer.myAIPawn.DoSpecialMove(Class'LPSM_AttackAnnounce', true, true, On_LPSM_AttackAnnounce_Finished);
            }
            J0x308:

            // End:0x3F8 [Loop If]
            if(!IsAnnounceFinished())
            {
                // End:0x3D8
                if(Outer.HasEnemyGottenToCloseDurringAssessmentOrAnnounce(CurrentSeperationToEnemySq))
                {
                    // End:0x38F
                    if(bShouldUseShortAnnounce)
                    {
                        Outer.myAIPawn.EndSpecialMove(Class'LPSM_AttackAnnounce');                        
                    }
                    else
                    {
                        Outer.myAIPawn.EndSpecialMove(Class'LPSM_AttackAnnounce');
                    }
                    bPerformingAnnounce = false;
                }
                Outer.Sleep(0.0100000);
                // [Loop Continue]
                goto J0x308;
            }
            CurSpecialMoveCmd = none;
            SetDesiredVelocityOutOfAnnounce();
        }
    }
    Outer.LockStrikeAccess(false);
MoveCloserToTarget:


    Outer.LockStrikeAccess(false);
    Outer.EnableAnnounceEffects(true);
    // End:0x4A0
    if(HaveRequiredAccessForMoveToEnemyForStrikeDuringRangedAttack())
    {
        // End:0x493
        if(!MoveToEnemyForRangedStrike())
        {
            goto 'LookingForValidLobStrikeLocation';
        }
        HandleDoneWithMoveToEnemyForRangedStrikeCleanUp();        
    }
    else
    {
        goto 'EndCommand';
    }
    J0x4AA:

    // End:0x74A
    if((CanStillPerformRangedStrikeAgainstCurrentTarget()) && HaveRequiredAccessForForStrikingDuringRangedAttack())
    {
        Outer.LockStrikeAccess(true);
        Outer.Sleep(0.0100000);
        // End:0x56F
        if(DoesStillNeedToMoveCloserToEnemyForRangedAttack())
        {
            // End:0x546
            if(HasFailedToReachRandgedAttackPointToManyTimes())
            {
                Outer.ReleaseRangedStrikeAccessForNeedingToReattemptMoveInToStrike();
                goto 'EndCommand';
            }
            Outer.ReleaseRangedStrikeAccessForNeedingToReattemptMoveInToStrike();
            goto 'MoveCloserToTarget';
        }
        J0x56F:

        // End:0x711 [Loop If]
        if(((NumberOfStrikesDoneSoFarThisAttack < NumberOfStrikesToDoThisAttack) && CanStillPerformRangedStrikeAgainstCurrentTarget()) && HaveRequiredAccessForForStrikingDuringRangedAttack())
        {
            // End:0x6E5
            if(IsAttackOpertunityStillValid())
            {
                // End:0x601
                if(ShouldTurnToFaceBeforeStartOfRangedStrike())
                {
                    SetFocusForTurnToFaceBeforeRangedStriking();
                    CurTurnToFaceCmd = Outer.CmdTurnToFaceFocus(0);
                    CurTurnToFaceCmd = none;
                }
                Outer.EnableAnnounceEffects(true);
                PerformBestRangedStikeBasedOnDistanceToTarget();
                NumberOfStrikesDoneSoFarThisAttack++;
                HandleDoneWithRangedStrikeCleanUp();
                CurStrikeCmd = none;
                // End:0x6E2
                if(NumberOfStrikesDoneSoFarThisAttack < NumberOfStrikesToDoThisAttack)
                {
                    CurWaitCmd = Outer.CmdWaitBetweenStrikes(GetPauseBetweenRangedStrikesSpecialMoveClass(), GetDelayBetweenStrikeAttempts());
                    CurWaitCmd = none;
                    // End:0x6E2
                    if(AfterStrikeDoesStillNeedToMoveCloserToEnemyForRangedAttack())
                    {
                        Outer.ReleaseRangedStrikeAccessForFailedAttack();
                        goto 'MoveCloserToTarget';
                    }
                }                
            }
            else
            {
                Outer.ReleaseRangedStrikeAccessForFailedAttack();
                goto 'EndCommand';
            }
            // [Loop Continue]
            goto J0x56F;
        }
        Outer.ReleaseRangedStrikeAccessAtTheEndOfStrikesBeforeDamageAssessment();
        // End:0x747
        if(ShouldEndRangedAttackAfterStrikes())
        {
            goto 'EndCommand';
        }        
    }
    else
    {
        // End:0x7B5
        if(IsThisControllerAllowedToStayInAttackCommandWithOutHavingRequiredAccess())
        {
            // End:0x7A8
            if(ShouldPerformDamageAssessmentIfCanNotRangeStrikeAfterMoveToEnemy())
            {
                // End:0x79B
                if(ShouldPerformSnapTurnBeforeMovingToDamageAssessmentIfCanNotRangedStrikeAfterMoveToEnemy())
                {
                    Outer.CmdSnapTurn(GetCanNotDoRangedStrikeAfterMoveToEnemyAndGoingToDamageAssessmentSnapTurnSpecialMove());
                }
                goto 'DamageAssessment';                
            }
            else
            {
                goto 'EndCommand';
            }            
        }
        else
        {
            goto 'EndCommand';
        }
    }
    J0x7BF:

    Outer.LockStrikeAccess(false);
    // End:0x936
    if(NeedToPerformRangedAttackDamageAssessment())
    {
        // End:0x832
        if(ShouldTurnToFaceFocusBeforeDamageAssessmentDuringRangedAttack())
        {
            CurTurnToFaceCmd = Outer.CmdTurnToFaceFocus(0);
            CurTurnToFaceCmd = none;
        }
        PerformDamageAssessment();
        CurDamageAssessmentCmd = none;
        Outer.Sleep(Outer.myAIPawn.TuneDataAIPawn.SleepTimeDuringRangeAttackDamageAssessment);
        NumberOfStrikesDoneSoFarThisAttack = 0;
        NumberOfStrikesToDoThisAttack = GetNumberOfStrikesToDoThisAttack();
        // End:0x936
        if(HaveRequiredAccessForMoveToEnemyForStrikeDuringRangedAttack())
        {
            Outer.EnableAnnounceEffects(true);
            // End:0x92C
            if(DoesStillNeedToMoveCloserToEnemyForRangedAttack())
            {
                Outer.ReleaseRangedStrikeAccessForFailedAttack();
                goto 'MoveCloserToTarget';                
            }
            else
            {
                goto 'PerformStrikes';
            }
        }
    }
    J0x936:

    Outer.PopCommand(self);
    stop;        
}

state RetreatToAttackPoint
{
    ignores BeginState, PushedState, PoppedState, EndState;

    function StartMovingToWithdrawpoint()
    {
        Outer.myAIPawn.PlayWithdrawingScaredSound();
        MoveToPositionFlyCmd = Outer.CmdMoveToPositionFly(Outer.PositionToWithdrawTo,, -1.0000000, Outer.CmdStatus_MoveToPosition, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfWithdraw);
        MoveToPositionFlyCmd.SetMovementMonitorParameters(true, Outer.myAIPawn.TuneDataAIPawn.DurationBetweenMovementDeltaDuringWithdraw, Outer.myAIPawn.TuneDataAIPawn.MinMovementDeltaDuringWithdraw, Outer.myAIPawn.TuneDataAIPawn.DelayAfterStartOfWithdrawBeforeMonitorStarts, NotifyOfFailedMovementToWithdrawPoint);
        //return;        
    }

    function NotifyOfFailedMovementToWithdrawPoint()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x38
        if(MoveToPositionFlyCmd != none)
        {
            Outer.AbortCommand(MoveToPositionFlyCmd);
        }
        return true;
        //return ReturnValue;        
    }
Begin:

    Outer.Focus = none;
    CurSpecialMoveCmd = none;
    J0x2B:

    // End:0xB1 [Loop If]
    if(!Outer.HasValidWithdrawToPositionBeenFound())
    {
        // End:0x91
        if(Outer.HasFindWithdrawToSpotTraversalRanToLongOrBeenAborted())
        {
            Outer.PopCommand(self);
        }
        Outer.Sleep(0.1000000);
        // [Loop Continue]
        goto J0x2B;
    }
    StartProcessWidthdrawFromFightMonitorTimer();
    Outer.myAIPawn.DesiredSpeed = Outer.myAIPawn.MaxDesiredSpeed;
    // End:0x15C
    if(Outer.PositionToWithdrawTo != vect(0.0000000, 0.0000000, 0.0000000))
    {
        StartMovingToWithdrawpoint();
    }
    StopProcessWidthdrawFromFightMonitorTimer();
    Outer.PopCommand(self);
    stop;        
}
