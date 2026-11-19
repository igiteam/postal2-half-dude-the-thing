class LPAICmd_MortarAttackBase extends LPAICmd_RangedLobAttack within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TheTarget[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TheTargetLocationAtTimeOfStartMovementToLobLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PointToStrikeFrom[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PointToStrikeFromIndexInManager[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LocationToLaunchFrom[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MortarAttackSetupInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeLaunchedLobStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextTimeToLaunchLobStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFoundValidLobStrikeLocationWhenNonGiven[536870913];

function Pushed()
{
    super.Pushed();
    bFoundValidLobStrikeLocationWhenNonGiven = false;
    NextTimeToLaunchLobStrike = -1.0000000;
    PointToStrikeFromIndexInManager = -1;
    //return;    
}

function Popped()
{
    super.Popped();
    // End:0xAD
    if(Outer.AltToFormationLocPointToStrikeFromIndexInManager >= 0)
    {
        // End:0xAD
        if(PointToStrikeFromIndexInManager == Outer.AltToFormationLocPointToStrikeFromIndexInManager)
        {
            Outer.AltToFormationLocMotarPointToStrikeFrom = vect(0.0000000, 0.0000000, 0.0000000);
            Outer.AltToFormationLocPointToStrikeFromIndexInManager = -1;            
        }
    }
    Outer.ReleaseMortarLocaion(PointToStrikeFrom, PointToStrikeFromIndexInManager);
    //return;    
}

event SPAborted()
{
    super(LPAICmd_Attack).SPAborted();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super(LPAICmd_Attack).SetDesiredEnemy(InEnemy);
    //return;    
}

function SetTheTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL GivenTarget[8388609];

    // End:0x34
    if(LPPawn(GivenTarget) != none)
    {
        SetDesiredEnemy(LPPawn(GivenTarget));
    }
    TheTarget = GivenTarget;
    // End:0x75
    if(Outer.AltToFormationLocPointToStrikeFromIndexInManager >= 0)
    {
        SetUpLobSpotPointToStrikeFromDataFromAltToFormationLocInfo();
    }
    //return;    
}

function ResetTheTarget()
{
    SetDesiredEnemy(none);
    TheTarget = none;
    //return;    
}

function SetLocationToLaunchFrom()
{
    local /*0x97E50000-0x00000000*/ private @NULL LaunchFromActor[8388609];

    LocationToLaunchFrom = LaunchFromActor;
    //return;    
}

function SetMortarAttackSetupInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL inMortarAttackSetupInfo[25296897];

    MortarAttackSetupInfo = inMortarAttackSetupInfo;
    SetMinNumberOfStrikesToAttemptPerAttack(MortarAttackSetupInfo.MinLobStrikesBetweenDamageAssessments);
    SetMaxNumberOfStrikesToAttemptPerAttack(MortarAttackSetupInfo.MaxLobStrikesBetweenDamageAssessments);
    SetMinDurationOfDamageAssessmentInSecs(MortarAttackSetupInfo.MinDurationOfDamageAssessmentInSecs);
    SetMaxDurationOfDamageAssessmentInSecs(MortarAttackSetupInfo.MaxDurationOfDamageAssessmentInSecs);
    SetRangeToAnyEnemyToQuitAttackData(MortarAttackSetupInfo.bCheckToSeeIfAnyEnemyHasGottenToCloseAndNeedsToQuitAttack, MortarAttackSetupInfo.RangeToAnyEnemyToQuitAttack);
    //return;    
}

function SetMinNumberOfStrikesToAttemptPerAttack()
{
    local /*0x97E50000-0x00000000*/ private int NumOfAttempts[8388609];

    // End:0x7C
    if(NumOfAttempts <= 0)
    {
        NumOfAttempts = int(Outer.myAIPawn.TuneDataAIPawn.DefaultMinNumberOfRangedStrikesPerMortarAttack.GetValue());        
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
        NumOfAttempts = int(Outer.myAIPawn.TuneDataAIPawn.DefaultMaxNumberOfRangedStrikesPerMortarAttack.GetValue());        
    }
    else
    {
        MaxNumberOfStrikesToAttemptPerAttack = NumOfAttempts;
    }
    //return;    
}

event NotifyAIResourceChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function NotifyEnemyGottenToClose()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyThatGotToClose[8388609];
    local /*0x97E50000-0x00000000*/ private float RangeToClosestEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    Outer.PopCommand(self);
    return true;
    //return ReturnValue;    
}

function SetBeSuperAggressive()
{
    local /*0x97E50000-0x00000000*/ private bool bAggressive[8388609];

    Outer.bBeSuperAggressive = bAggressive;
    //return;    
}

function HaveRequiredAccessForAnnounceDuringRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldPerformAnnounceBeforeRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldTurnToFaceBeforeStartOfRangedStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x80
    if(TheTarget != none)
    {
        return Outer.IsTurnToFaceTargetCommandNeeded(TheTarget, Outer.myAIPawn.TuneDataAIPawn.MinAngleNeededForTurnToFaceCommandBeforeMortar);
    }
    return false;
    //return ReturnValue;    
}

function SetFocusForTurnToFaceBeforeRangedStriking()
{
    Outer.Focus = TheTarget;
    //return;    
}

function IsValidGrenadeAssistTargetDurringRangedAttackAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldPerformDamageAssessmentIfCanNotRangeStrikeAfterMoveToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function HaveRequiredAccessForMoveToEnemyForStrikeDuringRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldTurnToFaceFocusBeforeDamageAssessmentDuringRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x80
    if(TheTarget != none)
    {
        return Outer.IsTurnToFaceTargetCommandNeeded(TheTarget, Outer.myAIPawn.TuneDataAIPawn.MinAngleNeededForTurnToFaceCommandBeforeDamAssDuringMortar);
    }
    return false;
    //return ReturnValue;    
}

function HaveRequiredAccessForForStrikingDuringRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function DoesStillNeedToMoveCloserToEnemyForRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x22
    if((LocationToLaunchFrom == none) && !bFoundValidLobStrikeLocationWhenNonGiven)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function AfterStrikeDoesStillNeedToMoveCloserToEnemyForRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float distanceTargetHasMovedSinceLobMoveWasCalced, maxTargetMoveDeltaBeforeNewLobFromLocationMayBeNeeded;

    // End:0x106
    if((bFoundValidLobStrikeLocationWhenNonGiven && TheTarget != none) && Outer.AltToFormationLocPointToStrikeFromIndexInManager < 0)
    {
        distanceTargetHasMovedSinceLobMoveWasCalced = VSize(TheTargetLocationAtTimeOfStartMovementToLobLocation - TheTarget.Location);
        maxTargetMoveDeltaBeforeNewLobFromLocationMayBeNeeded = Outer.myAIPawn.TuneDataAIPawn.MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeeded.GetValue();
        // End:0x106
        if(distanceTargetHasMovedSinceLobMoveWasCalced >= maxTargetMoveDeltaBeforeNewLobFromLocationMayBeNeeded)
        {
            bFoundValidLobStrikeLocationWhenNonGiven = false;
            return true;
        }
    }
    return DoesStillNeedToMoveCloserToEnemyForRangedAttack();
    //return ReturnValue;    
}

function PerformBestRangedStikeBasedOnDistanceToTarget()
{
    local /*0x97E50000-0x00000000*/ private float delayUntilNextLob;

    // End:0x104
    if((CurStrikeCmd != none) && !MortarAttackSetupInfo.bUseCombatManager)
    {
        LastTimeLaunchedLobStrike = Outer.WorldInfo.TimeSeconds;
        delayUntilNextLob = RandRange(MortarAttackSetupInfo.MinDelayBetweenLobStrikes, MortarAttackSetupInfo.MaxDelayBetweenLobStrikes);
        NextTimeToLaunchLobStrike = Outer.WorldInfo.TimeSeconds + delayUntilNextLob;
    }
    //return;    
}

function NeedToPerformRangedAttackDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function AbortMoveInForRangedStrikeIfStrikeAccessLost()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetPauseBetweenRangedStrikesSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'SPEngine.SPSM_PlayAnimBase';
    //return ReturnValue;    
}

function ShouldEndRangedAttackAfterStrikes()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x22
    if((TheTarget == none) && LocationToLaunchFrom == none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetMaxRangeFormRangedFirePointBeforeAllowedToFire()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 200.0000000;
    //return ReturnValue;    
}

function GetDelayBetweenStrikeAttempts()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(Outer.myAIPawn.TuneDataAIPawn.MinDelayBetweenMortarLobStrikeAttempts.GetValue(), Outer.myAIPawn.TuneDataAIPawn.MaxDelayBetweenMortarLobStrikeAttempts.GetValue());
    //return ReturnValue;    
}

function CanFireLobShotFromTargetLocation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int currentZoneIn;
    local /*0x97E50000-0x00000000*/ private @NULL locToUseForLobCalc;

    // End:0x17A
    if(TheTarget != none)
    {
        // End:0x49
        if(LocationToLaunchFrom != none)
        {
            locToUseForLobCalc = LocationToLaunchFrom.Location;            
        }
        else
        {
            locToUseForLobCalc = PointToStrikeFrom;
        }
        // End:0x17A
        if(Outer.IsThereClearLobAttackLaneFromGivenLoc(locToUseForLobCalc, TheTarget, -1, 0, currentZoneIn))
        {
            TheTargetLocationAtTimeOfStartMovementToLobLocation = TheTarget.Location;
            Outer.myAIPawn.SetAimInfoForRangedLobStrike(TheTarget.Location, TheTarget, -1, currentZoneIn, Outer.myAIPawn.TuneDataAIPawn.HieghtOffTargetPointForEndOfLobFireArc);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetRandKismetInputRangeToLookForLobStrikeLocation()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return ((MortarAttackSetupInfo.MaxRangeToLaunchFrom - MortarAttackSetupInfo.MinRangeToLaunchFrom) / float(2)) + MortarAttackSetupInfo.MinRangeToLaunchFrom;
    //return ReturnValue;    
}

function IsValidLobStrikePositionInValidArea()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[25296897], TestActor;
    local /*0x97E50000-0x00000000*/ private bool bUseErrorBuffer[8388609], ReturnValue;

    // End:0x4E
    if(!IsThisValidLobStrikeRange(VSize2D(FromLocation - TheTarget.Location), bUseErrorBuffer))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function IsThisValidLobStrikeRange()
{
    local /*0x97E50000-0x00000000*/ private float RangeToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUseErrorBuffer[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private float MinRange, MaxRange;

    // End:0x54
    if(bUseErrorBuffer)
    {
        MinRange = MortarAttackSetupInfo.MinRangeToLaunchFrom - MortarAttackSetupInfo.DistanceErrorBuffer;        
    }
    else
    {
        MinRange = MortarAttackSetupInfo.MinRangeToLaunchFrom;
    }
    // End:0xCE
    if(bUseErrorBuffer)
    {
        MaxRange = MortarAttackSetupInfo.MaxRangeToLaunchFrom + MortarAttackSetupInfo.DistanceErrorBuffer;        
    }
    else
    {
        MaxRange = MortarAttackSetupInfo.MaxRangeToLaunchFrom;
    }
    // End:0x126
    if((RangeToTest < MinRange) || RangeToTest > MaxRange)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function StartFindLobSpotTraversal()
{
    // End:0x26
    if(Outer.AltToFormationLocPointToStrikeFromIndexInManager >= 0)
    {
        return;
    }
    // End:0x69
    if(Outer.AIResMortarLocManagerRef == none)
    {
        Outer.AcquireAIResMortarLocManagerRef();
    }
    // End:0x184
    if(Outer.AIResMortarLocManagerRef != none)
    {
        // End:0xDC
        if(PointToStrikeFromIndexInManager >= 0)
        {
            Outer.ReleaseMortarLocaion(PointToStrikeFrom, PointToStrikeFromIndexInManager);
            PointToStrikeFromIndexInManager = -1;
        }
        Outer.StartSearchForBestMortarPosition(TheTarget, Outer.myAIPawn.TuneDataAIPawn.MaxFindLobStrikeLocTraversalDistance.GetValue(), IsValidLobStrikePosition, FindLobSpotTraversalFinished);
    }
    //return;    
}

function FindLobSpotTraversalFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocationFound[25296897];
    local /*0x97E50000-0x00000000*/ private int IndexOfMortarFromLocation[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SearchRequesterPawn[8388609], MortarLocationExplorerDone;

    // End:0xDB
    if(SearchRequesterPawn == Outer.myAIPawn)
    {
        PointToStrikeFrom = LocationFound;
        PointToStrikeFromIndexInManager = IndexOfMortarFromLocation;
        Outer.myAIPawn.LobStrikeLocValidationInfoList[0].LobFireLastPointToStrikeFrom = LocationFound;
        bFoundValidLobStrikeLocationWhenNonGiven = true;
        TheTargetLocationAtTimeOfStartMovementToLobLocation = TheTarget.Location;        
    }
    //return;    
}

function SetUpLobSpotPointToStrikeFromDataFromAltToFormationLocInfo()
{
    // End:0xFD
    if(Outer.AltToFormationLocPointToStrikeFromIndexInManager >= 0)
    {
        PointToStrikeFrom = Outer.AltToFormationLocMotarPointToStrikeFrom;
        PointToStrikeFromIndexInManager = Outer.AltToFormationLocPointToStrikeFromIndexInManager;
        Outer.myAIPawn.LobStrikeLocValidationInfoList[0].LobFireLastPointToStrikeFrom = PointToStrikeFrom;
        bFoundValidLobStrikeLocationWhenNonGiven = true;
        TheTargetLocationAtTimeOfStartMovementToLobLocation = TheTarget.Location;        
    }
    //return;    
}

function IsValidLobStrikePosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[25296897], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int currentZoneIn;

    // End:0x24
    if(!IsValidLobStrikePositionInValidArea(FromLocation, TestActor, false))
    {
        return false;
    }
    // End:0x11A
    if(Outer.IsThereClearLobAttackLaneFromGivenLoc(FromLocation, TestActor, -1, 0, currentZoneIn))
    {
        Outer.myAIPawn.SetAimInfoForRangedLobStrike(TestActor.Location, TestActor, -1, currentZoneIn, Outer.myAIPawn.TuneDataAIPawn.HieghtOffTargetPointForEndOfLobFireArc);
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HasValidLobStrikeLocationBeenFound()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bFoundValidLobStrikeLocationWhenNonGiven;
    //return ReturnValue;    
}

function MoveStrikeAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float distanceTargetHasMovedSinceLobMoveWasCalced, maxTargetMoveDeltaBeforeNewLobFromLocationMayBeNeeded;

    // End:0xE3
    if(bFoundValidLobStrikeLocationWhenNonGiven && TheTarget != none)
    {
        distanceTargetHasMovedSinceLobMoveWasCalced = VSize(TheTargetLocationAtTimeOfStartMovementToLobLocation - TheTarget.Location);
        maxTargetMoveDeltaBeforeNewLobFromLocationMayBeNeeded = Outer.myAIPawn.TuneDataAIPawn.MaxTargetMoveDeltaBeforeNewMortarFromLocationMayBeNeeded.GetValue();
        // End:0xE0
        if(distanceTargetHasMovedSinceLobMoveWasCalced >= maxTargetMoveDeltaBeforeNewLobFromLocationMayBeNeeded)
        {
            bFoundValidLobStrikeLocationWhenNonGiven = false;
            return true;
        }        
    }
    else
    {
        // End:0x103
        if(TheTarget == none)
        {
            // End:0x103
            if(LocationToLaunchFrom == none)
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function MoveToEnemyForRangedStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function PerformDamageAssessment()
{
    CurDamageAssessmentCmd = Outer.CmdMortarAttackDamageAssessment(TheTarget, MinDurationOfDamageAssessmentInSecs, MaxDurationOfDamageAssessmentInSecs, MortarAttackSetupInfo.MinRangeToLaunchFrom, MortarAttackSetupInfo.MaxRangeToLaunchFrom,, 1);
    //return;    
}

function ProcessPossibilityTargetAppeared()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL EnemyCandidate;

    // End:0xFC
    if((TheTarget == none) && LocationToLaunchFrom != none)
    {
        iter = 0;
        J0x2B:

        // End:0xFC [Loop If]
        if(iter < Outer.TargetList.Length)
        {
            EnemyCandidate = Outer.TargetList[iter].Actor;
            // End:0xEE
            if((EnemyCandidate != none) && Outer.CanBeMyEnemy(EnemyCandidate))
            {
                SetTheTarget(EnemyCandidate);
                return true;
            }
            ++iter;
            // [Loop Continue]
            goto J0x2B;
        }
    }
    return false;
    //return ReturnValue;    
}

function HandlePosibilityOfNeedForTargetDropAndSwitch()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PawnTarget;

    // End:0x3F
    if((TheTarget != none) && TheTarget.IsPendingKill())
    {
        ResetTheTarget();
        return true;
    }
    PawnTarget = Pawn(TheTarget);
    // End:0x9A
    if(PawnTarget != none)
    {
        // End:0x9A
        if(PawnTarget.Health <= 0)
        {
            ResetTheTarget();
            return true;
        }
    }
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

        super.EndState(NextStateName);
        //return;        
    }
LookingForValidLobStrikeLocation:

    StartFindLobSpotTraversal();
    J0x0A:

    // End:0x39 [Loop If]
    if(!HasValidLobStrikeLocationBeenFound())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x0A;
    }
    goto 'MoveCloserToTarget';
    stop;                    
}
