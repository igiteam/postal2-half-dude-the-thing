class LPAICmd_ContinuousAttack extends LPAICmd_Attack within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmountOfDamageReceivedSoFarThisAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmountOfDamageToStopTheAttackThisAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAmountOfDamageRequiredToStopAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAmountOfDamageRequiredToStopAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentSeperationToEnemySq[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurMoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurTurnToFaceCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ResSurroundLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedAnnounce[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerformingAnnounce[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLastStrikeWarningRattle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DeltaTimeForNextStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DeltaTimeForNextMustStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DeltaTimeForNextStrikeWarningRattle[536870913];

function Pushed()
{
    super.Pushed();
    AmountOfDamageReceivedSoFarThisAttack = 0.0000000;
    AmountOfDamageToStopTheAttackThisAttack = float(2147483647);
    MinAmountOfDamageRequiredToStopAttack = float(2147483647);
    MaxAmountOfDamageRequiredToStopAttack = float(2147483647);
    TimeLastStrikeWarningRattle = -1.0000000;
    DeltaTimeForNextStrikeWarningRattle = 2.0000000;
    CurrentSeperationToEnemySq = -1.0000000;
    bPerformingAnnounce = false;
    CurMoveToActorCmd = none;
    MoveToPositionCmd = none;
    CurTurnToFaceCmd = none;
    //return;    
}

function Popped()
{
    StopProcessCanStrikeNowMonitorTimer();
    AbortAnyRunningChildCommand();
    ResetStrikeWaitTimer();
    Outer.EnableAnnounceEffects(false);
    Outer.myAIPawn.SetCurrentlyNotValidTargetForGrenadeAssist();
    Outer.LockStrikeAccess(false);
    Outer.ReleaseStrikeAccessForFailedAttack();
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
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

function SetResSurroundLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609];

    ResSurroundLocation = ResourceForFormation;
    //return;    
}

private final function AbortAnyRunningChildCommand()
{
    // End:0x38
    if(CurMoveToActorCmd != none)
    {
        Outer.AbortCommand(CurMoveToActorCmd);
    }
    // End:0x70
    if(MoveToPositionCmd != none)
    {
        Outer.AbortCommand(MoveToPositionCmd);
    }
    // End:0xA8
    if(CurTurnToFaceCmd != none)
    {
        Outer.AbortCommand(CurTurnToFaceCmd);
    }
    //return;    
}

function HandlePossibilityTookEnoughDamageToCauseBehaviorChange()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x69
    if(AmountOfDamageReceivedSoFarThisAttack >= AmountOfDamageToStopTheAttackThisAttack)
    {
        AbortAnyRunningChildCommand();
        // End:0x44
        if(bPerformingAnnounce)
        {
            ForceEndAnnounceSpecialMove();
            bPerformingAnnounce = false;
        }
        Outer.PopCommand(self);
        return true;        
    }
    else
    {
        // End:0x8C
        if(bPerformingAnnounce)
        {
            ForceEndAnnounceSpecialMove();
            bPerformingAnnounce = false;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetMinSeperationToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return ConvertRangeToSeperation2D(Outer.myAIPawn.TuneDataAIPawn.MaxSeperationForDirectPhysicalStrike);
    //return ReturnValue;    
}

function MoveToEnemyForStrike()
{
    local /*0x97E50000-0x00000000*/ private float Seperation, minSeperationToRequireMoveBeforeStrike;

    // End:0x32A
    if(IsMyEnemyAlive())
    {
        Seperation = EnemySeperation2D();
        minSeperationToRequireMoveBeforeStrike = GetMinSeperationToRequireMoveBeforeStrike();
        // End:0x32A
        if(Seperation > minSeperationToRequireMoveBeforeStrike)
        {
            Outer.Focus = none;
            CurMoveToActorCmd = Outer.CmdMoveToActor(EnemyForAttack, none, minSeperationToRequireMoveBeforeStrike, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfMoveToStrike);
            CurMoveToActorCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
            CurMoveToActorCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
            // End:0x1B1
            if(AbortMoveInForStrikeIfStrikeAccessLost())
            {
                CurMoveToActorCmd.__MoveAbortDelegate__Delegate = MoveStrikeAbortCondition;
            }
            CurMoveToActorCmd.bZeroVelocityOnFinish = true;
            // End:0x327
            if(Outer.myAIPawn.TuneDataAIPawn.bUseMovementProgressMonitorForAllAttackRunInsBeforeStrike)
            {
                CurMoveToActorCmd.SetMovementMonitorParameters(true, Outer.myAIPawn.TuneDataAIPawn.DurationBetweenMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.MinMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.DelayAfterStartOfAttackRunInBeforeStrikeBeforeMonitorStarts, NotifyOfFailedMovementToStrikePoint);
            }            
        }
    }
    //return;    
}

function NotifyOfFailedMovementToStrikePoint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(CurMoveToActorCmd != none)
    {
        Outer.AbortCommand(CurMoveToActorCmd);
    }
    Outer.PopCommand(self);
    return true;
    //return ReturnValue;    
}

function DoesStillNeedToMoveCloserToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function PerformBestStikeBasedOnDistanceToTarget()
{
    TimeOfLastStrike = Outer.WorldInfo.TimeSeconds;
    DeltaTimeForNextStrike = GetDelayBetweenStrikeAttempts();
    DeltaTimeForNextMustStrike = GetDelayBetweenMustStrikeAttempts();
    //return;    
}

function GetDelayBetweenStrikeAttempts()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(Outer.myAIPawn.TuneDataAIPawn.MinDelayBetweenContinuousAttackStrikeAttempts.GetValue(), Outer.myAIPawn.TuneDataAIPawn.MaxDelayBetweenContinuousAttackStrikeAttempts.GetValue());
    //return ReturnValue;    
}

function GetDelayBetweenMustStrikeAttempts()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(Outer.myAIPawn.TuneDataAIPawn.MinDelayBetweenContinuousAttackMustStrikeAttempts.GetValue(), Outer.myAIPawn.TuneDataAIPawn.MaxDelayBetweenContinuousAttackMustStrikeAttempts.GetValue());
    //return ReturnValue;    
}

function GetDelayBetweenStrikeWarningRattle()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(Outer.myAIPawn.TuneDataAIPawn.MinDelayBetweenContinuousAttackStrikeWarningRattles.GetValue(), Outer.myAIPawn.TuneDataAIPawn.MaxDelayBetweenContinuousAttackStrikeWarningRattles.GetValue());
    //return ReturnValue;    
}

function PerformStrikeWarningRattle()
{
    TimeLastStrikeWarningRattle = Outer.WorldInfo.TimeSeconds;
    DeltaTimeForNextStrikeWarningRattle = GetDelayBetweenStrikeWarningRattle();
    //return;    
}

function GetPauseBetweenStrikesSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_AIBasePlayFullBodyAnimSeq';
    //return ReturnValue;    
}

function GetCanNotStrikeAfterMoveToEnemyAndGoingToDamageAssessmentSnapTurnSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_AIBasePlayFullBodyAnimSeq';
    //return ReturnValue;    
}

function NeedToPerformDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldPerformAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function HaveRequiredAccessForAnnounceDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.HaveStrikeAccess();
    //return ReturnValue;    
}

function IsValidGrenadeAssistTargetDurringAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldPerformDamageAssessmentIfCanNotStrikeAfterMoveToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldPerformSnapTurnBeforeMovingToDamageAssessmentIfCanNotStrikeAfterMoveToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function HaveRequiredAccessForMoveToEnemyForStrikeDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.HaveStrikeAccess();
    //return ReturnValue;    
}

function HaveRequiredAccessForForStrikingDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.HaveStrikeAccess();
    //return ReturnValue;    
}

function AbortMoveInForStrikeIfStrikeAccessLost()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldTurnToFaceFocusBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function On_LPSM_AttackAnnounce_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bPerformingAnnounce = false;
    //return;    
}

function StartAnnounceSpecialMove()
{
    Outer.myAIPawn.DoSpecialMove(Class'LPSM_AttackAnnounce', true, true, On_LPSM_AttackAnnounce_Finished);
    //return;    
}

function ForceEndAnnounceSpecialMove()
{
    Outer.myAIPawn.EndSpecialMove(Class'LPSM_AttackAnnounce');
    //return;    
}

function IsEnemyInMustStrikeRange()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3E
    if((EnemyForAttack != none) && Outer.IsPawnInMustStrikeZone(EnemyForAttack))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsEnemyToFarAwayToEvenTryContinuousStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3E
    if((EnemyForAttack == none) || Outer.IsPawnToFarAwayToEvenTryContinuousStrike(EnemyForAttack))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsEnemyFarEnoughAwayToEndContinuousAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3E
    if((EnemyForAttack == none) || Outer.IsPawnFarEnoughAwayToEndContinuousAttack(EnemyForAttack))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetTimeSinceLastStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], timeToCompareTo, TimePassed;

    timeToCompareTo = TimeStartedAttack;
    // End:0x3D
    if(TimeOfLastStrike > TimeStartedAttack)
    {
        timeToCompareTo = TimeOfLastStrike;
    }
    TimePassed = Outer.WorldInfo.TimeSeconds - timeToCompareTo;
    return TimePassed;
    //return ReturnValue;    
}

function HasEnoughTimePassedToDoNormalStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float TimePassed;

    TimePassed = GetTimeSinceLastStrike();
    // End:0x2D
    if(TimePassed > DeltaTimeForNextStrike)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HasEnoughTimePassedToDoMustStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float TimePassed;

    TimePassed = GetTimeSinceLastStrike();
    // End:0x2D
    if(TimePassed > DeltaTimeForNextMustStrike)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsItTimeForStrikeWarningRattle()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float TimePassed;

    TimePassed = Outer.WorldInfo.TimeSeconds - TimeLastStrikeWarningRattle;
    // End:0x61
    if(TimePassed > DeltaTimeForNextStrikeWarningRattle)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HasStrikeWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ResetStrikeWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    //return;    
}

final function StartProcessCanStrikeNowMonitorTimer()
{
    // End:0x5D
    if(!Outer.bDisableAI && !IsProcessCanStrikeNowMonitorTimerActive())
    {
        Outer.SetTimer(0.1000000, true, 'ProcessCanStrikeNowMonitorTimer', self);
    }
    //return;    
}

final function StopProcessCanStrikeNowMonitorTimer()
{
    Outer.ClearTimer('ProcessCanStrikeNowMonitorTimer', self);
    //return;    
}

function PauseProcessCanStrikeNowMonitorTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopProcessCanStrikeNowMonitorTimer();        
    }
    else
    {
        StartProcessCanStrikeNowMonitorTimer();
    }
    //return;    
}

final function IsProcessCanStrikeNowMonitorTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('ProcessCanStrikeNowMonitorTimer', self);
    //return ReturnValue;    
}

private final function ProcessCanStrikeNowMonitorTimer()
{
    ProcessCanStrikeNowMonitor();
    //return;    
}

function ProcessCanStrikeNowMonitor()
{
    local /*0x97E50000-0x00000000*/ private bool bneedToStrike;

    bneedToStrike = false;
    // End:0xB3
    if((IsMyEnemyAlive()) && !IsEnemyFarEnoughAwayToEndContinuousAttack())
    {
        // End:0x57
        if((HasEnoughTimePassedToDoNormalStrike()) && !IsEnemyToFarAwayToEvenTryContinuousStrike())
        {
            bneedToStrike = true;            
        }
        else
        {
            // End:0x7F
            if((IsEnemyInMustStrikeRange()) && HasEnoughTimePassedToDoMustStrike())
            {
                bneedToStrike = true;
            }
        }
        // End:0x99
        if(bneedToStrike)
        {
            PerformBestStikeBasedOnDistanceToTarget();            
        }
        else
        {
            // End:0xB0
            if(IsItTimeForStrikeWarningRattle())
            {
                PerformStrikeWarningRattle();
            }
        }        
    }
    else
    {
        StopProcessCanStrikeNowMonitorTimer();
        AbortAnyRunningChildCommand();
        Outer.PopCommand(self);
    }
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

    event NotifyOfNonCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        AmountOfDamageReceivedSoFarThisAttack += AmountOfDamage;
        return HandlePossibilityTookEnoughDamageToCauseBehaviorChange();
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
    AmountOfDamageReceivedSoFarThisAttack = 0.0000000;
    AmountOfDamageToStopTheAttackThisAttack = GetAmountOfDamageToStopTheAttackThisAttack();
    DeltaTimeForNextStrike = GetDelayBetweenStrikeAttempts();
    DeltaTimeForNextMustStrike = GetDelayBetweenMustStrikeAttempts();
    DeltaTimeForNextStrikeWarningRattle = GetDelayBetweenStrikeWarningRattle();
Announce:


    // End:0x2A2
    if((ShouldPerformAnnounce()) && HaveRequiredAccessForAnnounceDuringAttack())
    {
        Outer.Focus = Outer.MyLPEnemy;
        Outer.EnableAnnounceEffects(true);
        // End:0x139
        if(IsValidGrenadeAssistTargetDurringAnnounce())
        {
            Outer.myAIPawn.SetCurrentlyValidTargetForGrenadeAssist();
        }
        // End:0x2A2
        if(!Outer.HasEnemyGottenToCloseDurringAssessmentOrAnnounce(CurrentSeperationToEnemySq))
        {
            CurTurnToFaceCmd = Outer.CmdTurnToFaceFocus(0);
            CurTurnToFaceCmd = none;
            TimeStartedAnnounce = Outer.WorldInfo.TimeSeconds;
            bPerformingAnnounce = true;
            Outer.myAIPawn.SetRadarIconState(2);
            StartAnnounceSpecialMove();
            J0x228:

            // End:0x298 [Loop If]
            if(!IsAnnounceFinished())
            {
                // End:0x278
                if(Outer.HasEnemyGottenToCloseDurringAssessmentOrAnnounce(CurrentSeperationToEnemySq))
                {
                    ForceEndAnnounceSpecialMove();
                    bPerformingAnnounce = false;
                }
                Outer.Sleep(0.0100000);
                // [Loop Continue]
                goto J0x228;
            }
            SetDesiredVelocityOutOfAnnounce();
        }
    }
    Outer.LockStrikeAccess(false);
    TimeOfLastStrike = -1.0000000;
    TimeStartedAttack = Outer.WorldInfo.TimeSeconds;
    Outer.EnableAnnounceEffects(true);
    StartProcessCanStrikeNowMonitorTimer();
MoveCloserToTarget:


    // End:0x371
    if(HaveRequiredAccessForMoveToEnemyForStrikeDuringAttack())
    {
        MoveToEnemyForStrike();
        Outer.PawnZeroVelocity();        
    }
    else
    {
        goto 'EndCommand';
    }
    J0x37B:

    // End:0x394
    if(!IsMyEnemyAlive())
    {
        goto 'EndCommand';
    }
    J0x394:

    // End:0x3E2 [Loop If]
    if(!DoesStillNeedToMoveCloserToEnemy())
    {
        Outer.PawnZeroVelocity();
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x394;
    }
    // End:0x3FB
    if(!IsMyEnemyAlive())
    {
        goto 'EndCommand';
    }
    goto 'MoveCloserToTarget';
    StopProcessCanStrikeNowMonitorTimer();
EndCommand:


    Outer.PopCommand(self);
    stop;                    
}
