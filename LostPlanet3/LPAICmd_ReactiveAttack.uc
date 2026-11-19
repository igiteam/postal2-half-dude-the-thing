class LPAICmd_ReactiveAttack extends LPAICmd_Attack within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumberOfStrikesDoneSoFarThisAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumberOfStrikesToDoThisAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmountOfDamageReceivedSoFarThisAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmountOfDamageToStopTheAttackThisAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurSpecialMoveCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurWaitCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurMoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurTurnToFaceCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurDamageAssessmentCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurJumpBackCmd[536870913];
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
    AmountOfDamageReceivedSoFarThisAttack = 0.0000000;
    AmountOfDamageToStopTheAttackThisAttack = float(2147483647);
    bPerformingAnnounce = false;
    bGettingKnockedDown = false;
    bTookGrenadeInMouth = false;
    bShouldUseShortAnnounce = false;
    CurSpecialMoveCmd = none;
    CurWaitCmd = none;
    CurMoveToActorCmd = none;
    MoveToPositionCmd = none;
    CurTurnToFaceCmd = none;
    CurDamageAssessmentCmd = none;
    CurJumpBackCmd = none;
    Outer.SetPerformingReactiveAttack();
    Outer.SetNotAllowedToPerformReactiveAttack();
    //return;    
}

function Popped()
{
    StopProcessWidthdrawFromFightMonitorTimer();
    AbortAnyRunningChildCommand();
    Outer.EnableAnnounceEffects(false);
    Outer.myAIPawn.SetCurrentlyNotValidTargetForGrenadeAssist();
    Outer.LockStrikeAccess(false);
    Outer.ReleaseStrikeAccessForFailedAttack();
    // End:0x169
    if(Outer.myAIPawn.Health > 0)
    {
        Outer.SetTimer(Outer.myAIPawn.TuneDataAIPawn.DelayAfterReactiveAttackToResetReactiveAttackFlag.GetValue(), false, 'ResetReactiveAttackFlag', Outer);
    }
    Outer.SetNotPerformingReactiveAttack();
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function SetResSurroundLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609];

    ResSurroundLocation = ResourceForFormation;
    //return;    
}

function GetNumberOfStrikesToDoThisAttack()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return int(float(Rand(int(Outer.myAIPawn.TuneDataAIPawn.MaxNumberOfStrikesToAttemptPerReactiveAttack.GetValue() - Outer.myAIPawn.TuneDataAIPawn.MinNumberOfStrikesToAttemptPerReactiveAttack.GetValue()))) + Outer.myAIPawn.TuneDataAIPawn.MinNumberOfStrikesToAttemptPerReactiveAttack.GetValue());
    //return ReturnValue;    
}

function GetAmountOfDamageToStopTheAttackThisAttack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(Outer.myAIPawn.TuneDataAIPawn.MinAmountOfDamageRequiredToStopReactiveAttack.GetValue(), Outer.myAIPawn.TuneDataAIPawn.MaxAmountOfDamageRequiredToStopReactiveAttack.GetValue());
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
    // End:0xB3
    if(CurMoveToActorCmd != none)
    {
        Outer.AbortCommand(CurMoveToActorCmd);
    }
    // End:0xEB
    if(MoveToPositionCmd != none)
    {
        Outer.AbortCommand(MoveToPositionCmd);
    }
    // End:0x123
    if(CurDamageAssessmentCmd != none)
    {
        Outer.AbortCommand(CurDamageAssessmentCmd);
    }
    // End:0x15B
    if(CurJumpBackCmd != none)
    {
        Outer.AbortCommand(CurJumpBackCmd);
    }
    // End:0x193
    if(CurTurnToFaceCmd != none)
    {
        Outer.AbortCommand(CurTurnToFaceCmd);
    }
    //return;    
}

function HandlePossibilityTookEnoughDamageToCauseBehaviorChange()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xFD
    if((AmountOfDamageReceivedSoFarThisAttack >= AmountOfDamageToStopTheAttackThisAttack) && !bGettingKnockedDown)
    {
        NumOfAttemptsToFindWithDrawPointThisAttack = 0;
        AbortAnyRunningChildCommand();
        // End:0xE0
        if(bPerformingAnnounce)
        {
            // End:0x97
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
        GotoState('WithdrawFromEnemy');
        return true;        
    }
    else
    {
        // End:0x1CA
        if(bGettingKnockedDown)
        {
            AbortAnyRunningChildCommand();
            // End:0x1B7
            if(bPerformingAnnounce)
            {
                // End:0x16E
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
            // End:0x202
            if(CurSpecialMoveCmd != none)
            {
                Outer.AbortCommand(CurSpecialMoveCmd);
            }
            // End:0x23A
            if(CurWaitCmd != none)
            {
                Outer.AbortCommand(CurWaitCmd);
            }
            // End:0x2DD
            if(bPerformingAnnounce)
            {
                // End:0x294
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
    //return;    
}

function HandlePostStrikeBehavior()
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

function ShouldTurnToFaceBeforeAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
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

function ProcessWidthdrawFromFightMonitor()
{
    local /*0x97E50000-0x00000000*/ private @NULL FormationCenter;
    local /*0x97E50000-0x00000000*/ private float FormationRadius;
    local /*0x97E50000-0x00000000*/ private @NULL displacementFromFormationCenter;
    local /*0x97E50000-0x00000000*/ private float distanceFromFormationCenter;

    // End:0x169
    if(ResSurroundLocation != none)
    {
        FormationCenter = ResSurroundLocation.GetFormationCenter();
        FormationRadius = ResSurroundLocation.GetFormationRadius();
        displacementFromFormationCenter = Outer.myAIPawn.Location - FormationCenter;
        distanceFromFormationCenter = VSize2D(displacementFromFormationCenter);
        // End:0x166
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

function On_LPSM_AttackAnnounce_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bPerformingAnnounce = false;
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

    function GetDelayBetweenStrikeAttempts()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

        return RandRange(Outer.myAIPawn.TuneDataAIPawn.MinDelayBetweenStrikeAttempts.GetValue(), Outer.myAIPawn.TuneDataAIPawn.MaxDelayBetweenStrikeAttempts.GetValue());
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
    // End:0x9D
    if(!Outer.IsEnemyInReactiveAttackArc(EnemyForAttack))
    {
        GotoState('WithdrawFromEnemy');
    }
MoveCloserToTarget:


    MoveToEnemyForStrike();
PerformStrikes:


    Outer.Sleep(0.0100000);
    // End:0xDB
    if(DoesStillNeedToMoveCloserToEnemy())
    {
        goto 'MoveCloserToTarget';
    }
    Outer.EnableAnnounceEffects(true);
    StartTryingToFindingWithDrawPoint();
    J0x105:

    // End:0x1D5 [Loop If]
    if(NumberOfStrikesDoneSoFarThisAttack < NumberOfStrikesToDoThisAttack)
    {
        PerformBestStikeBasedOnDistanceToTarget();
        HandlePostStrikeBehavior();
        NumberOfStrikesDoneSoFarThisAttack++;
        // End:0x1D2
        if(NumberOfStrikesDoneSoFarThisAttack < NumberOfStrikesToDoThisAttack)
        {
            CurWaitCmd = Outer.CmdWaitBetweenStrikes(GetPauseBetweenStrikesSpecialMoveClass(), GetDelayBetweenStrikeAttempts());
            CurWaitCmd = none;
            // End:0x1D2
            if(DoesStillNeedToMoveCloserToEnemy())
            {
                Outer.ReleaseStrikeAccessForFailedAttack();
                goto 'MoveCloserToTarget';
            }
        }
        // [Loop Continue]
        goto J0x105;
    }
    GotoState('WithdrawFromEnemy');
EndCommand:


    Outer.PopCommand(self);
    stop;                    
}

state WithdrawFromEnemy
{
    ignores BeginState, PushedState, PoppedState, EndState;

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

        // End:0x38
        if(MoveToPositionCmd != none)
        {
            Outer.AbortCommand(MoveToPositionCmd);
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
    Outer.myAIPawn.DesiredSpeed = Outer.myAIPawn.MaxDesiredSpeed;
    // End:0x152
    if(Outer.PositionToWithdrawTo != vect(0.0000000, 0.0000000, 0.0000000))
    {
        StartMovingToWithdrawpoint();
    }
    Outer.PopCommand(self);
    stop;        
}
