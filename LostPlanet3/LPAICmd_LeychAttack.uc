class LPAICmd_LeychAttack extends LPAICmd_Attack within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MinNumberOfStrikesToAttemptPerAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxNumberOfStrikesToAttemptPerAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumberOfStrikesDoneSoFarThisAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumberOfStrikesToDoThisAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmountOfDamageReceivedSoFarThisAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmountOfDamageToStopTheAttackThisAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentSeperationToEnemySq[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmountOfDamageToCausePlowInThisAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAmountOfDamageRequiredToStopAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAmountOfDamageRequiredToStopAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurStrikeCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurSpecialMoveCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurWaitCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurMoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurTurnToFaceCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurDamageAssessmentCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurJumpBackCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ResSurroundMultiLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ResSurroundLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerformingAnnounce[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGettingKnockedDown[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTookGrenadeInMouth[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldUseShortAnnounce[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedAnnounce[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SoloAggressiveIndicatorValue[536870913];

function Pushed()
{
    super.Pushed();
    MinNumberOfStrikesToAttemptPerAttack = 2147483647;
    MaxNumberOfStrikesToAttemptPerAttack = 2147483647;
    AmountOfDamageToCausePlowInThisAttack = float(2147483647);
    NumberOfStrikesToDoThisAttack = 0;
    NumberOfStrikesDoneSoFarThisAttack = 0;
    AmountOfDamageReceivedSoFarThisAttack = 0.0000000;
    AmountOfDamageToStopTheAttackThisAttack = float(2147483647);
    CurrentSeperationToEnemySq = -1.0000000;
    MinAmountOfDamageRequiredToStopAttack = float(2147483647);
    MaxAmountOfDamageRequiredToStopAttack = float(2147483647);
    bPerformingAnnounce = false;
    bGettingKnockedDown = false;
    bTookGrenadeInMouth = false;
    bShouldUseShortAnnounce = false;
    CurStrikeCmd = none;
    CurSpecialMoveCmd = none;
    CurWaitCmd = none;
    CurMoveToActorCmd = none;
    MoveToPositionCmd = none;
    CurTurnToFaceCmd = none;
    CurDamageAssessmentCmd = none;
    CurJumpBackCmd = none;
    //return;    
}

function Popped()
{
    StopProcessWidthdrawFromFightMonitorTimer();
    // End:0x3B
    if(Outer.bBeSuperAggressive)
    {
        SoloAggressiveIndicatorValue = 0.0000000;
    }
    AbortAnyRunningChildCommand();
    ResetStrikeWaitTimer();
    Outer.EnableAnnounceEffects(false);
    Outer.myAIPawn.SetCurrentlyNotValidTargetForGrenadeAssist();
    Outer.LockStrikeAccess(false);
    Outer.ReleaseStrikeAccessForFailedAttack();
    Outer.bRetreatingToMeleePoint = false;
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

    MinNumberOfStrikesToAttemptPerAttack = NumOfAttempts;
    //return;    
}

function SetMaxNumberOfStrikesToAttemptPerAttack()
{
    local /*0x97E50000-0x00000000*/ private int NumOfAttempts[8388609];

    MaxNumberOfStrikesToAttemptPerAttack = NumOfAttempts;
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

function GetAmountOfDamageToCausePlowInThisAttack()
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

function ShouldJumpBackBeforeWithDrawToMeleePoint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

protected function AbortAnyRunningChildCommand()
{
    // End:0x43
    if(CurSpecialMoveCmd != none)
    {
        Outer.AbortCommand(CurSpecialMoveCmd);
        CurSpecialMoveCmd = none;
    }
    // End:0x86
    if(CurWaitCmd != none)
    {
        Outer.AbortCommand(CurWaitCmd);
        CurWaitCmd = none;
    }
    // End:0xC9
    if(CurMoveToActorCmd != none)
    {
        Outer.AbortCommand(CurMoveToActorCmd);
        CurMoveToActorCmd = none;
    }
    // End:0x10C
    if(MoveToPositionCmd != none)
    {
        Outer.AbortCommand(MoveToPositionCmd);
        MoveToPositionCmd = none;
    }
    // End:0x14F
    if(CurDamageAssessmentCmd != none)
    {
        Outer.AbortCommand(CurDamageAssessmentCmd);
        CurDamageAssessmentCmd = none;
    }
    // End:0x192
    if(CurJumpBackCmd != none)
    {
        Outer.AbortCommand(CurJumpBackCmd);
        CurJumpBackCmd = none;
    }
    // End:0x1D5
    if(CurTurnToFaceCmd != none)
    {
        Outer.AbortCommand(CurTurnToFaceCmd);
        CurTurnToFaceCmd = none;
    }
    // End:0x218
    if(CurStrikeCmd != none)
    {
        Outer.AbortCommand(CurStrikeCmd);
        CurStrikeCmd = none;
    }
    //return;    
}

function HandlePossibilityTookEnoughDamageToCauseBehaviorChange()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xC2
    if(((CurMoveToActorCmd != none) || MoveToPositionCmd != none) && Outer.myAIPawn != none)
    {
        // End:0xC2
        if(AmountOfDamageReceivedSoFarThisAttack >= AmountOfDamageToCausePlowInThisAttack)
        {
            // End:0xA0
            if(Outer.myAIPawn.IsMovingFastEnoughToTripAndPlowIn())
            {
                bGettingKnockedDown = true;
            }
            Outer.NotifyKnockedOutOfAttackByTakingToMuchDamage();            
        }
    }
    // End:0x1BF
    if((AmountOfDamageReceivedSoFarThisAttack >= AmountOfDamageToStopTheAttackThisAttack) && !bGettingKnockedDown)
    {
        NumOfAttemptsToFindWithDrawPointThisAttack = 0;
        AbortAnyRunningChildCommand();
        // End:0x1A2
        if(bPerformingAnnounce)
        {
            // End:0x159
            if(bShouldUseShortAnnounce)
            {
                Outer.myAIPawn.EndSpecialMove(Class'LPSM_PackHunterAttackAnnounce');                
            }
            else
            {
                Outer.myAIPawn.EndSpecialMove(Class'LPSM_PackHunterAttackAnnounceLonger');
            }
            bPerformingAnnounce = false;
        }
        StartTryingToFindingWithDrawPoint();
        GotoState('RetreatToMeleePoint');
        return true;        
    }
    else
    {
        // End:0x28C
        if(bGettingKnockedDown)
        {
            AbortAnyRunningChildCommand();
            // End:0x279
            if(bPerformingAnnounce)
            {
                // End:0x230
                if(bShouldUseShortAnnounce)
                {
                    Outer.myAIPawn.EndSpecialMove(Class'LPSM_PackHunterAttackAnnounce');                    
                }
                else
                {
                    Outer.myAIPawn.EndSpecialMove(Class'LPSM_PackHunterAttackAnnounceLonger');
                }
                bPerformingAnnounce = false;
            }
            GotoState('StopRunInFallDownOrPlowIn');
            return true;            
        }
        else
        {
            // End:0x2CF
            if(CurSpecialMoveCmd != none)
            {
                Outer.AbortCommand(CurSpecialMoveCmd);
                CurSpecialMoveCmd = none;
            }
            // End:0x312
            if(CurWaitCmd != none)
            {
                Outer.AbortCommand(CurWaitCmd);
                CurWaitCmd = none;
            }
            // End:0x3B5
            if(bPerformingAnnounce)
            {
                // End:0x36C
                if(bShouldUseShortAnnounce)
                {
                    Outer.myAIPawn.EndSpecialMove(Class'LPSM_PackHunterAttackAnnounce');                    
                }
                else
                {
                    Outer.myAIPawn.EndSpecialMove(Class'LPSM_PackHunterAttackAnnounceLonger');
                }
                bPerformingAnnounce = false;
            }
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

function GetStopTypeForEndOfMoveToStrike()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfMoveToStrike;
    //return ReturnValue;    
}

function GetMinZDistanceToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 100000.0000000;
    //return ReturnValue;    
}

function ShouldZeroVelocityOnFinishOfMoveToEnemyForStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function MoveToEnemyForStrike()
{
    local /*0x97E50000-0x00000000*/ private float Seperation, minSeperationToRequireMoveBeforeStrike, MinZDistanceToRequireMoveBeforeStrike;

    // End:0x323
    if(IsMyEnemyAlive())
    {
        Seperation = EnemySeperation2D();
        minSeperationToRequireMoveBeforeStrike = GetMinSeperationToRequireMoveBeforeStrike();
        MinZDistanceToRequireMoveBeforeStrike = GetMinZDistanceToRequireMoveBeforeStrike();
        // End:0x323
        if((Seperation > minSeperationToRequireMoveBeforeStrike) || (EnemyZDistance()) >= MinZDistanceToRequireMoveBeforeStrike)
        {
            Outer.Focus = none;
            CurMoveToActorCmd = Outer.CmdMoveToActor(EnemyForAttack, none, minSeperationToRequireMoveBeforeStrike, Outer.CmdStatus_MoveToActor, 1, GetStopTypeForEndOfMoveToStrike());
            CurMoveToActorCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
            CurMoveToActorCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
            // End:0x1A1
            if(AbortMoveInForStrikeIfStrikeAccessLost())
            {
                CurMoveToActorCmd.__MoveAbortDelegate__Delegate = MoveStrikeAbortCondition;
            }
            CurMoveToActorCmd.bZeroVelocityOnFinish = ShouldZeroVelocityOnFinishOfMoveToEnemyForStrike();
            // End:0x320
            if(Outer.myAIPawn.TuneDataAIPawn.bUseMovementProgressMonitorForAllAttackRunInsBeforeStrike)
            {
                CurMoveToActorCmd.SetMovementMonitorParameters(true, Outer.myAIPawn.TuneDataAIPawn.DurationBetweenMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.MinMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.DelayAfterStartOfAttackRunInBeforeStrikeBeforeMonitorStarts, NotifyOfFailedMovementToStrikePoint);
            }            
        }
    }
    //return;    
}

function HandleDoneWithMoveToEnemyForStrikeCleanUp()
{
    //return;    
}

function HandleEffectsForJustForStartOfStrikeCommands()
{
    Outer.EnableAnnounceEffects(true);
    //return;    
}

function HandleEffectsForEndOfDamageAssessment()
{
    Outer.EnableAnnounceEffects(true);
    //return;    
}

function NotifyOfFailedMovementToStrikePoint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x43
    if(CurMoveToActorCmd != none)
    {
        Outer.AbortCommand(CurMoveToActorCmd);
        CurMoveToActorCmd = none;
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

function IfNeededChoosePreMoveInStrikeToAttempt()
{
    //return;    
}

function IfNeededChooseInStrikeLoopPreMoveInStrikeToAttempt()
{
    //return;    
}

function PerformBestStikeBasedOnDistanceToTarget()
{
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

function GetGoingToDamageAssessmentSnapTurnSpecialMove()
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

function PreMoveToEnemyForStrike()
{
    //return;    
}

function PostMoveToEnemyForStrike()
{
    //return;    
}

function ShouldZeroVelocityBeforeAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldTurnToFaceBeforeAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldTurnToFaceBeforeMoveCloserToTarget()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function MaxRandomLagJumpBack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 0.0000000;
    //return ReturnValue;    
}

function StartAnnounceSpecialMove()
{
    // End:0xAD
    if(Outer.myAIPawn.Mesh.bRecentlyRendered)
    {
        bShouldUseShortAnnounce = true;
        Outer.myAIPawn.DoSpecialMove(GetShortAnnounceSpecialMove(), true, true, On_LPSM_AttackAnnounce_Finished);        
    }
    else
    {
        bShouldUseShortAnnounce = false;
        Outer.myAIPawn.DoSpecialMove(GetLongAnnounceSpecialMove(), true, true, On_LPSM_AttackAnnounce_Finished);
    }
    //return;    
}

function GetShortAnnounceSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_AIBasePlayFullBodyAnimSeq';
    //return ReturnValue;    
}

function GetLongAnnounceSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_AIBasePlayFullBodyAnimSeq';
    //return ReturnValue;    
}

function EndAnnounceSpecialMove()
{
    // End:0x4E
    if(bShouldUseShortAnnounce)
    {
        Outer.myAIPawn.EndSpecialMove(GetShortAnnounceSpecialMove());        
    }
    else
    {
        Outer.myAIPawn.EndSpecialMove(GetLongAnnounceSpecialMove());
    }
    //return;    
}

function HandlePostAnnouncePremovementLockingOfStrikeAccess()
{
    //return;    
}

function HandleStartOfMoveCloserToTargetSubState()
{
    Outer.EnableAnnounceEffects(true);
    //return;    
}

function HandleStartOfPerformStrikesSubState()
{
    //return;    
}

function HandleStartOfDamageAssessmentSubState()
{
    //return;    
}

function HaveRequiredAccessForAnnounceDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.HaveStrikeAccess();
    //return ReturnValue;    
}

function HandlePreAnnounceFocusSetting()
{
    Outer.Focus = Outer.MyLPEnemy;
    //return;    
}

function On_LPSM_AttackAnnounce_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bPerformingAnnounce = false;
    //return;    
}

function HandlePreAnnounceTurnToFaceEnemyFocusSetting()
{
    //return;    
}

function HandlePostAnnounceTurnToFaceEnemyFocusSetting()
{
    //return;    
}

function EndOfAttackCleanUp()
{
    //return;    
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

function ShouldPerformSnapTurnBeforeMovingToDamageAssessmentAfterStrikes()
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

function ResetStrikeWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    //return;    
}

function ShouldFaceEnemyWhileMovingToSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
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

function GetDelayBetweenStrikeAttempts()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(Outer.myAIPawn.TuneDataAIPawn.MinDelayBetweenStrikeAttempts.GetValue(), Outer.myAIPawn.TuneDataAIPawn.MaxDelayBetweenStrikeAttempts.GetValue());
    //return ReturnValue;    
}

function HandleWaitingBetweenStrikesCommands()
{
    CurWaitCmd = Outer.CmdWaitBetweenStrikes(GetPauseBetweenStrikesSpecialMoveClass(), GetDelayBetweenStrikeAttempts(), ShouldFaceEnemyBetweenStrikes());
    //return;    
}

function HandleWaitingBetweenStrikesCommandDoneCleanUp()
{
    CurWaitCmd = none;
    //return;    
}

function ShouldFaceEnemyBetweenStrikes()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function CanProcessWidthdrawFromFightMonitor()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(ResSurroundLocation != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetFormationCenterAndRadius()
{
    local /*0x97E50000-0x00000000*/ private @NULL FormationCenter[25165825];
    local /*0x97E50000-0x00000000*/ private float FormationRadius[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x63
    if(ResSurroundLocation != none)
    {
        FormationCenter = ResSurroundLocation.GetFormationCenter();
        FormationRadius = ResSurroundLocation.GetFormationRadius();
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ProcessWidthdrawFromFightMonitor()
{
    local /*0x97E50000-0x00000000*/ private @NULL FormationCenter;
    local /*0x97E50000-0x00000000*/ private float FormationRadius;
    local /*0x97E50000-0x00000000*/ private @NULL displacementFromFormationCenter;
    local /*0x97E50000-0x00000000*/ private float distanceFromFormationCenter;

    // End:0x131
    if(CanProcessWidthdrawFromFightMonitor())
    {
        GetFormationCenterAndRadius(FormationCenter, FormationRadius);
        displacementFromFormationCenter = Outer.myAIPawn.Location - FormationCenter;
        distanceFromFormationCenter = VSize2D(displacementFromFormationCenter);
        // End:0x12E
        if(distanceFromFormationCenter > (FormationRadius * Outer.myAIPawn.TuneDataAIPawn.PercentageOfFormationRadiusToRunawayBeforeStrikeAccessIsReleased.GetValue()))
        {
            Outer.ReleaseStrikeAccess();
            StopProcessWidthdrawFromFightMonitorTimer();
        }        
    }
    else
    {
        Outer.ReleaseStrikeAccess();
        StopProcessWidthdrawFromFightMonitorTimer();
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

        Outer.ClearTimer('ReactToStartMelee', self);
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function NotifyPlayerStartMelee()
    {
        local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x4C
        if(LPAICmd_LeechStrikeBase(ChildCommand) == none)
        {
            Outer.SetTimer(FRand() * (MaxRandomLagJumpBack()), false, 'ReactToStartMelee', self);            
        }
        return true;
        //return ReturnValue;        
    }

    function ReactToStartMelee()
    {
        AbortAnyRunningChildCommand();
        GotoState('StateCmdActive', 'DamageAssessment');
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

    function CanMoveCloserToTarget()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x4D
        if(!Outer.CanReachToMelee(EnemyForAttack.Location, EnemyForAttack))
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }
Begin:

    Outer.LockStrikeAccess(false);
    NumberOfStrikesDoneSoFarThisAttack = 0;
    AmountOfDamageReceivedSoFarThisAttack = 0.0000000;
    AmountOfDamageToStopTheAttackThisAttack = GetAmountOfDamageToStopTheAttackThisAttack();
    AmountOfDamageToCausePlowInThisAttack = GetAmountOfDamageToCausePlowInThisAttack();
    NumberOfStrikesToDoThisAttack = GetNumberOfStrikesToDoThisAttack();
    IfNeededChoosePreMoveInStrikeToAttempt();
    goto 'Announce';
Announce:


    Outer.LockStrikeAccess(true);
    // End:0x352
    if((ShouldPerformAnnounce()) && HaveRequiredAccessForAnnounceDuringAttack())
    {
        Outer.LockStrikeAccess(true);
        // End:0x112
        if(ShouldZeroVelocityBeforeAnnounce())
        {
            Outer.PawnZeroVelocity();
        }
        HandlePreAnnounceFocusSetting();
        Outer.EnableAnnounceEffects(true);
        // End:0x17D
        if(IsValidGrenadeAssistTargetDurringAnnounce())
        {
            Outer.myAIPawn.SetCurrentlyValidTargetForGrenadeAssist();
        }
        // End:0x352
        if(!Outer.HasEnemyGottenToCloseDurringAssessmentOrAnnounce(CurrentSeperationToEnemySq))
        {
            // End:0x204
            if(ShouldTurnToFaceBeforeAnnounce())
            {
                HandlePreAnnounceTurnToFaceEnemyFocusSetting();
                CurTurnToFaceCmd = Outer.CmdTurnToFaceFocus(0);
                CurTurnToFaceCmd = none;
                HandlePostAnnounceTurnToFaceEnemyFocusSetting();
            }
            // End:0x352
            if(Outer.CanPerformAnnounce(Outer.MyLPEnemy))
            {
                TimeStartedAnnounce = Outer.WorldInfo.TimeSeconds;
                bPerformingAnnounce = true;
                Outer.myAIPawn.SetRadarIconState(2);
                StartAnnounceSpecialMove();
                J0x2CD:

                // End:0x33D [Loop If]
                if(!IsAnnounceFinished())
                {
                    // End:0x31D
                    if(Outer.HasEnemyGottenToCloseDurringAssessmentOrAnnounce(CurrentSeperationToEnemySq))
                    {
                        EndAnnounceSpecialMove();
                        bPerformingAnnounce = false;
                    }
                    Outer.Sleep(0.0100000);
                    // [Loop Continue]
                    goto J0x2CD;
                }
                CurSpecialMoveCmd = none;
                SetDesiredVelocityOutOfAnnounce();
            }
        }
    }
    HandlePostAnnouncePremovementLockingOfStrikeAccess();
MoveCloserToTarget:


    HandleStartOfMoveCloserToTargetSubState();
    // End:0x3E4
    if(HaveRequiredAccessForMoveToEnemyForStrikeDuringAttack())
    {
        // End:0x3B9
        if(ShouldTurnToFaceBeforeMoveCloserToTarget())
        {
            CurTurnToFaceCmd = Outer.CmdTurnToFaceFocus(0);
            CurTurnToFaceCmd = none;
        }
        PreMoveToEnemyForStrike();
        MoveToEnemyForStrike();
        PostMoveToEnemyForStrike();
        HandleDoneWithMoveToEnemyForStrikeCleanUp();        
    }
    else
    {
        goto 'EndCommand';
    }
    J0x3EE:

    HandleStartOfPerformStrikesSubState();
    // End:0x59C
    if(HaveRequiredAccessForForStrikingDuringAttack())
    {
        Outer.LockStrikeAccess(true);
        Outer.Sleep(0.0100000);
        // End:0x48F
        if(DoesStillNeedToMoveCloserToEnemy())
        {
            Outer.ReleaseStrikeAccessForNeedingToReattemptMoveInToStrike();
            // End:0x485
            if(CanMoveCloserToTarget())
            {
                goto 'MoveCloserToTarget';
            }
            goto 'EndCommand';
        }
        J0x48F:

        // End:0x570 [Loop If]
        if((NumberOfStrikesDoneSoFarThisAttack < NumberOfStrikesToDoThisAttack) && HaveRequiredAccessForForStrikingDuringAttack())
        {
            HandleEffectsForJustForStartOfStrikeCommands();
            PerformBestStikeBasedOnDistanceToTarget();
            CurStrikeCmd = none;
            ResetStrikeWaitTimer();
            NumberOfStrikesDoneSoFarThisAttack++;
            // End:0x56D
            if(NumberOfStrikesDoneSoFarThisAttack < NumberOfStrikesToDoThisAttack)
            {
                HandleWaitingBetweenStrikesCommands();
                HandleWaitingBetweenStrikesCommandDoneCleanUp();
                IfNeededChooseInStrikeLoopPreMoveInStrikeToAttempt();
                // End:0x56D
                if(DoesStillNeedToMoveCloserToEnemy())
                {
                    Outer.ReleaseStrikeAccessForFailedAttack();
                    // End:0x563
                    if(CanMoveCloserToTarget())
                    {
                        goto 'MoveCloserToTarget';
                    }
                    goto 'EndCommand';
                }
            }
            // [Loop Continue]
            goto J0x48F;
        }
        Outer.ReleaseStrikeAccessAtTheEndOfStrikesBeforeDamageAssessment();
        goto 'DamageAssessment';        
    }
    else
    {
        // End:0x5ED
        if(ShouldPerformDamageAssessmentIfCanNotStrikeAfterMoveToEnemy())
        {
            // End:0x5E0
            if(ShouldPerformSnapTurnBeforeMovingToDamageAssessmentIfCanNotStrikeAfterMoveToEnemy())
            {
                Outer.CmdSnapTurn(GetCanNotStrikeAfterMoveToEnemyAndGoingToDamageAssessmentSnapTurnSpecialMove());
            }
            goto 'DamageAssessment';            
        }
        else
        {
            goto 'EndCommand';
        }
    }
    J0x5F7:

    HandleStartOfDamageAssessmentSubState();
    Outer.LockStrikeAccess(false);
    // End:0x773
    if(NeedToPerformDamageAssessment())
    {
        // End:0x6AE
        if(ShouldTurnToFaceFocusBeforeDamageAssessment())
        {
            // End:0x675
            if(ShouldPerformSnapTurnBeforeMovingToDamageAssessmentAfterStrikes())
            {
                Outer.CmdSnapTurn(GetGoingToDamageAssessmentSnapTurnSpecialMove());                
            }
            else
            {
                CurTurnToFaceCmd = Outer.CmdTurnToFaceFocus(0);
                CurTurnToFaceCmd = none;
            }
        }
        CurDamageAssessmentCmd = Outer.CmdDamageAssessment(EnemyForAttack, 5.0000000, 5.0000000,, 1);
        CurDamageAssessmentCmd = none;
        NumberOfStrikesDoneSoFarThisAttack = 0;
        NumberOfStrikesToDoThisAttack = GetNumberOfStrikesToDoThisAttack();
        // End:0x773
        if(HaveRequiredAccessForMoveToEnemyForStrikeDuringAttack())
        {
            IfNeededChoosePreMoveInStrikeToAttempt();
            HandleEffectsForEndOfDamageAssessment();
            // End:0x769
            if(DoesStillNeedToMoveCloserToEnemy())
            {
                // End:0x75C
                if(CanMoveCloserToTarget())
                {
                    goto 'MoveCloserToTarget';
                }
                goto 'EndCommand';                
            }
            else
            {
                goto 'PerformStrikes';
            }
        }
    }
    J0x773:

    EndOfAttackCleanUp();
    Outer.PopCommand(self);
    stop;            
}

state RetreatToMeleePoint
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.bRetreatingToMeleePoint = true;
        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        Outer.bRetreatingToMeleePoint = true;
        super(SPStateObject).PushedState();
        //return;        
    }

    event PoppedState()
    {
        Outer.bRetreatingToMeleePoint = false;
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.bRetreatingToMeleePoint = false;
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function StartMovingToWithdrawpoint()
    {
        Outer.myAIPawn.PlayWithdrawingScaredSound();
        MoveToPositionCmd = Outer.CmdMoveToPosition(Outer.PositionToWithdrawTo,, -1.0000000, Outer.CmdStatus_MoveToPosition, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfWithdraw);
        MoveToPositionCmd.SetMovementMonitorParameters(true, Outer.myAIPawn.TuneDataAIPawn.DurationBetweenMovementDeltaDuringWithdraw, Outer.myAIPawn.TuneDataAIPawn.MinMovementDeltaDuringWithdraw, Outer.myAIPawn.TuneDataAIPawn.DelayAfterStartOfWithdrawBeforeMonitorStarts, NotifyOfFailedMovementToWithdrawPoint);
        //return;        
    }

    function NotifyOfFailedMovementToWithdrawPoint()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x43
        if(MoveToPositionCmd != none)
        {
            Outer.AbortCommand(MoveToPositionCmd);
            MoveToPositionCmd = none;
        }
        return true;
        //return ReturnValue;        
    }
Begin:

    // End:0x38
    if(ShouldFaceEnemyWhileMovingToSlot())
    {
        Outer.Focus = EnemyForAttack;        
    }
    else
    {
        Outer.Focus = none;
    }
    // End:0xD1
    if(ShouldJumpBackBeforeWithDrawToMeleePoint())
    {
        // End:0xC6
        if(Outer.IsThereSpaceToJumpBack())
        {
            CurJumpBackCmd = Outer.CmdJumpBack(EnemyForAttack, bTookGrenadeInMouth,, 1);
        }
        CurJumpBackCmd = none;
    }
    J0xD1:

    // End:0x157 [Loop If]
    if(!Outer.HasValidWithdrawToPositionBeenFound())
    {
        // End:0x137
        if(Outer.HasFindWithdrawToSpotTraversalRanToLongOrBeenAborted())
        {
            Outer.PopCommand(self);
        }
        Outer.Sleep(0.0500000);
        // [Loop Continue]
        goto J0xD1;
    }
    StartProcessWidthdrawFromFightMonitorTimer();
    Outer.myAIPawn.DesiredSpeed = Outer.myAIPawn.MaxDesiredSpeed;
    // End:0x202
    if(Outer.PositionToWithdrawTo != vect(0.0000000, 0.0000000, 0.0000000))
    {
        StartMovingToWithdrawpoint();
    }
    StopProcessWidthdrawFromFightMonitorTimer();
    Outer.PopCommand(self);
    stop;                
}

state StopRunInFallDownOrPlowIn
{
    ignores BeginState, PushedState, PoppedState, EndState;
Begin:

    Outer.PopCommand(self);
    stop;                
}
