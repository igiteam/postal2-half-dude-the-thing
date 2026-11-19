class LPAICmd_StationaryEngagement extends LPAICmd_Attack within LPAIControllerAkridStationary
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldFixedPlacementStalk[537001985];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseAIResourceForEngagement[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool StaticStalkStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseTightAreaStalk[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasStrikeDataBeenResetYetForThisThisEngagement[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ACosHorizAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ACosVertAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAttackRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAttackRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HorizAngRangeInDegrees;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float VertAngRangeInDegrees;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToGiveUpTryingToStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToKeepTryingForStrike[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfAttemptsToFindAltLobStrikeArcThisEngagement[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfAttemptsToFindPreCalcedLobStrikeLocationThisEngagement[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TotalNumOfAttemptsToFindLobStrikeArcThisEngagement[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeFoundValidEngagementRangeLobAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte TypeOfAttackToldToPerform[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte AiAttackTypeProcessingAnotherAttackRequestFor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentAttackCmd[536870913];

event NotifyAIResourceChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super.NotifyAIResourceChanged(ResAccess);
    //return ReturnValue;    
}

function HasAttackWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ResetAttackWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    //return;    
}

function Pushed()
{
    super.Pushed();
    Class'SPEngine.SPUtil'.static.SetHalfACosAngRange(HorizAngRangeInDegrees, ACosHorizAngRange);
    Class'SPEngine.SPUtil'.static.SetHalfACosAngRange(VertAngRangeInDegrees, ACosVertAngRange);
    bUseAIResourceForEngagement = true;
    LastTimeFoundValidEngagementRangeLobAttack = -1.0000000;
    ResetFindLobFireCounters();
    CurrentAttackCmd = none;
    bUseTightAreaStalk = false;
    AiAttackTypeProcessingAnotherAttackRequestFor = 0;
    TypeOfAttackToldToPerform = 0;
    //return;    
}

function Popped()
{
    super.Popped();
    // End:0x21
    if(StaticStalkStarted)
    {
        StopAreaDependentFixedPlacementStalk();
    }
    StopPocessLookForFixPlaceAttackOpportunityTimer();
    Outer.myAIPawn.SetRangedLobStrikeZoneInfo(-1, -1);
    // End:0xCA
    if(Outer.CurrentPubSubCombatManagerResourceRef != none)
    {
        Outer.CurrentPubSubCombatManagerResourceRef.RetractAllOptionsForThisPublisher(Outer);
    }
    Outer.ReleaseStrikeAccess();
    Outer.ReleaseCombatManagerAccess();
    OnExit();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    // End:0x36
    if(StaticStalkStarted)
    {
        StaticStalkStarted = false;
        StaticFixedPlacementStalk_StartSM();
    }
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    super(LPAICommand).Paused(NewCommand);
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    OnExit();
    //return;    
}

function OnExit()
{
    Outer.ReleaseAllAttackAccess();
    ResetAttackWaitTimer();
    Outer.PawnZeroVelocity();
    //return;    
}

event NotifyAIResourceAccessLost()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super.SetDesiredEnemy(InEnemy);
    Outer.GetCombatManagerEngagementAccess(InEnemy);
    //return;    
}

function FixedPlacementAttackEnemy()
{
    StopPocessLookForFixPlaceAttackOpportunityTimer();
    //return;    
}

function CanStillAttackFromFixedPlacement()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xC5
    if((IsMyEnemyAlive()) && !Outer.AkridStationaryPawn.TuneDataAkridStationary.bForceAkridStationaryNotToAttack)
    {
        GetStrikeAccessIfRequiredBeforeAttack();
        // End:0xC2
        if(HasAccessToStartAttackFromFixedPlacement())
        {
            // End:0x8D
            if(int(TypeOfAttackToldToPerform) == int(2))
            {
                return true;                
            }
            else
            {
                // End:0xA6
                if(int(TypeOfAttackToldToPerform) == int(8))
                {
                    return true;                    
                }
                else
                {
                    // End:0xBF
                    if(int(TypeOfAttackToldToPerform) == int(5))
                    {
                        return true;                        
                    }
                }
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

function HandleFailureToStartAttack()
{
    // End:0x74
    if(Outer.CurrentPubSubCombatManagerResourceRef != none)
    {
        Outer.CurrentPubSubCombatManagerResourceRef.NotifyOfAttackFailedToStart(Outer, TypeOfAttackToldToPerform);
        ResetFindLobFireCounters();
    }
    //return;    
}

function ValidateThisAsLobStrikeLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocationToTest[8388609];
    local /*0x97E50000-0x00000000*/ private int HeightTierToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bableToFlyToStrikeLocation, bisThereAClearLobAttackLane;
    local /*0x97E50000-0x00000000*/ private @NULL outPossibleLobFirePointToStrikeFrom;
    local /*0x97E50000-0x00000000*/ private int currentLobZoneIn;

    Outer.AkridStationaryPawn.LobStrikeLocValidationInfoList[TotalNumOfAttemptsToFindLobStrikeArcThisEngagement].bCalulatedThisEngagement = true;
    bableToFlyToStrikeLocation = Outer.CalculateRangedLobPointToStrikeFrom(outPossibleLobFirePointToStrikeFrom, LocationToTest, EnemyForAttack, Outer.AkridStationaryPawn.TuneDataAkridStationary.RangedLobStrikeInfoByTier[HeightTierToTest].HeightAboveTargetForLobRangedStrikeInUU, Outer.AkridStationaryPawn.TuneDataAkridStationary.RangedLobStrikeInfoByTier[HeightTierToTest].XY_DistanceFromTargetForLobRangedStrikeInUU, 100.0000000, Outer.AkridStationaryPawn.TuneDataAkridStationary.bCheckIfCanMoveToStrikeLocationBeforeTestingForLobLane);
    // End:0x374
    if((bableToFlyToStrikeLocation && Outer.AkridStationaryPawn.TuneDataAkridStationary.bCheckIfCanMoveToStrikeLocationBeforeTestingForLobLane) || !Outer.AkridStationaryPawn.TuneDataAkridStationary.bCheckIfCanMoveToStrikeLocationBeforeTestingForLobLane)
    {
        bisThereAClearLobAttackLane = Outer.IsThereClearLobAttackLaneFromGivenLoc(outPossibleLobFirePointToStrikeFrom, EnemyForAttack, HeightTierToTest, TotalNumOfAttemptsToFindLobStrikeArcThisEngagement, currentLobZoneIn);
        // End:0x371
        if(bisThereAClearLobAttackLane)
        {
            Outer.AkridStationaryPawn.SetAimInfoForRangedLobStrike(EnemyForAttack.Location, EnemyForAttack, HeightTierToTest,, Outer.AkridStationaryPawn.TuneDataAkridStationary.HieghtOffTargetPointForEndOfLobFireArc);
            return true;            
        }        
    }
    return false;
    //return ReturnValue;    
}

function IsTherLosToTargetForDirectFireBurstAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL locationOfBlockage;
    local /*0x97E50000-0x00000000*/ private editfixedsize array LosIgnoreActor;
    local /*0x97E50000-0x00000000*/ private bool bhasMedRgLos;
    local /*0x97E50000-0x00000000*/ private @NULL projLoc;

    Outer.AkridStationaryPawn.SetAimInfoForBurstFireStrike(EnemyForAttack.Location, EnemyForAttack, 0, 0, Outer.AkridStationaryPawn.TuneDataAkridStationary.HeightOffTargetPointForBurstFire);
    LosIgnoreActor.AddItem(Outer.AkridStationaryPawn);    
    LosIgnoreActor.AddItem(EnemyForAttack);    
    projLoc = Outer.AkridStationaryPawn.GetBurstFireStartTraceLocation();
    bhasMedRgLos = Outer.LosTestForAttackLane(projLoc, Outer.AkridStationaryPawn.GetAimTargetPositionForBurstFireStrike(), Outer.AkridStationaryPawn.TuneDataAkridStationary.RadiusOfCheckForDirectBurstFireRangeAttack.GetValue(), Outer.AkridStationaryPawn.TuneDataAkridStationary.RadiusOfCheckForDirectBurstFireRangeAttack.GetValue(), locationOfBlockage, LosIgnoreActor);
    return bhasMedRgLos;
    //return ReturnValue;    
}

function FindValidLobStrikeLocation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL sideVecOffset, locToTestAsStartOfAttackLoc;
    local /*0x97E50000-0x00000000*/ private int ScaleFactor;
    local /*0x97E50000-0x00000000*/ private bool shiftUp;
    local /*0x97E50000-0x00000000*/ private float ammountToScale;
    local /*0x97E50000-0x00000000*/ private int horizontalShiftNo, verticalShiftNo, currentLobZoneIn;

    shiftUp = false;
    // End:0x323
    if((TotalNumOfAttemptsToFindLobStrikeArcThisEngagement == 0) || Outer.AkridStationaryPawn.TuneDataAIPawn.ForceAllLobAttacksFromThisZone >= 0)
    {
        // End:0x30D
        if(Outer.IsThereClearLobAttackLaneFromGivenLoc(Outer.AkridStationaryPawn.Location, EnemyForAttack, 0, TotalNumOfAttemptsToFindLobStrikeArcThisEngagement, currentLobZoneIn))
        {
            Outer.AkridStationaryPawn.SetAimInfoForRangedLobStrike(EnemyForAttack.Location, EnemyForAttack, 0, 0, Outer.AkridStationaryPawn.TuneDataAkridStationary.HieghtOffTargetPointForEndOfLobFireArc);
            // End:0x30B
            if(Outer.AkridStationaryPawn.TuneDataAIPawn.ForceAllLobAttacksFromThisZone < 0)
            {
                ++TotalNumOfAttemptsToFindLobStrikeArcThisEngagement;
                ++NumOfAttemptsToFindAltLobStrikeArcThisEngagement;
                // End:0x266
                if(!Outer.IsThereClearLobAttackLaneFromGivenLoc(Outer.AkridStationaryPawn.Location, EnemyForAttack, 0, TotalNumOfAttemptsToFindLobStrikeArcThisEngagement, currentLobZoneIn))
                {
                    ++NumOfAttemptsToFindAltLobStrikeArcThisEngagement;                    
                }
                else
                {
                    Outer.AkridStationaryPawn.SetAimInfoForRangedLobStrike(EnemyForAttack.Location, EnemyForAttack, 0, 0, Outer.AkridStationaryPawn.TuneDataAkridStationary.HieghtOffTargetPointForEndOfLobFireArc);
                }
            }
            return true;
        }
        ++TotalNumOfAttemptsToFindLobStrikeArcThisEngagement;
        ++NumOfAttemptsToFindAltLobStrikeArcThisEngagement;
    }
    // End:0x5B5
    if(NumOfAttemptsToFindAltLobStrikeArcThisEngagement < (GetMaxNumberOfPosibleAltLobStrikeCalcsForThisZone()))
    {
        // End:0x453
        if(Outer.IsThereClearLobAttackLaneFromGivenLoc(Outer.AkridStationaryPawn.Location, EnemyForAttack, 0, TotalNumOfAttemptsToFindLobStrikeArcThisEngagement, currentLobZoneIn))
        {
            Outer.AkridStationaryPawn.SetAimInfoForRangedLobStrike(EnemyForAttack.Location, EnemyForAttack, 0, 0, Outer.AkridStationaryPawn.TuneDataAkridStationary.HieghtOffTargetPointForEndOfLobFireArc);
            return true;
        }
        ++TotalNumOfAttemptsToFindLobStrikeArcThisEngagement;
        ++NumOfAttemptsToFindAltLobStrikeArcThisEngagement;
        // End:0x5B5
        if(NumOfAttemptsToFindAltLobStrikeArcThisEngagement < (GetMaxNumberOfPosibleAltLobStrikeCalcsForThisZone()))
        {
            // End:0x59D
            if(Outer.IsThereClearLobAttackLaneFromGivenLoc(Outer.AkridStationaryPawn.Location, EnemyForAttack, -1, TotalNumOfAttemptsToFindLobStrikeArcThisEngagement, currentLobZoneIn))
            {
                Outer.AkridStationaryPawn.SetAimInfoForRangedLobStrike(EnemyForAttack.Location, EnemyForAttack, 0, 0, Outer.AkridStationaryPawn.TuneDataAkridStationary.HieghtOffTargetPointForEndOfLobFireArc);
                return true;
            }
            ++TotalNumOfAttemptsToFindLobStrikeArcThisEngagement;
            ++NumOfAttemptsToFindAltLobStrikeArcThisEngagement;
            return false;
        }
    }
    // End:0x5D4
    if((NumOfAttemptsToFindPreCalcedLobStrikeLocationThisEngagement % 2) == 0)
    {
        shiftUp = true;
    }
    horizontalShiftNo = int(float(NumOfAttemptsToFindPreCalcedLobStrikeLocationThisEngagement) % Outer.AkridStationaryPawn.TuneDataAkridStationary.NumOfLobStrikeLocationsToLookForAtEachRange);
    verticalShiftNo = int((float(NumOfAttemptsToFindPreCalcedLobStrikeLocationThisEngagement) / Outer.AkridStationaryPawn.TuneDataAkridStationary.NumOfLobStrikeLocationsToLookForAtEachRange) % float(Outer.AkridStationaryPawn.TuneDataAkridStationary.RangedLobStrikeInfoByTier.Length));
    // End:0x783
    if(Outer.AkridStationaryPawn.TuneDataAkridStationary.ForceAllLobAttacksFromThisTier >= 0)
    {
        verticalShiftNo = Outer.AkridStationaryPawn.TuneDataAkridStationary.ForceAllLobAttacksFromThisTier;
    }
    ScaleFactor = (horizontalShiftNo + 1) / 2;
    ammountToScale = float(ScaleFactor) * Outer.AkridStationaryPawn.TuneDataAkridStationary.HorizontalSeperationBetweenPointsForLobStrike;
    ammountToScale = ((shiftUp) ? ammountToScale : -ammountToScale);
    // End:0x89F
    if(ammountToScale != float(0))
    {
        sideVecOffset = Class'SPEngine.SPUtil'.static.GetRightVector(Outer.AkridStationaryPawn);
        sideVecOffset = sideVecOffset * ammountToScale;
    }
    locToTestAsStartOfAttackLoc = Outer.AkridStationaryPawn.Location + sideVecOffset;
    // End:0x908
    if(ValidateThisAsLobStrikeLocation(locToTestAsStartOfAttackLoc, verticalShiftNo))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ResetFindLobFireCounters()
{
    local /*0x97E50000-0x00000000*/ private int iter;

    NumOfAttemptsToFindAltLobStrikeArcThisEngagement = -1;
    NumOfAttemptsToFindPreCalcedLobStrikeLocationThisEngagement = -1;
    TotalNumOfAttemptsToFindLobStrikeArcThisEngagement = -1;
    LastTimeFoundValidEngagementRangeLobAttack = -1.0000000;
    bHasStrikeDataBeenResetYetForThisThisEngagement = true;
    iter = 0;
    J0x53:

    // End:0x1F4 [Loop If]
    if(iter < Outer.AkridStationaryPawn.LobStrikeLocValidationInfoList.Length)
    {
        // End:0xED
        if(!Outer.AkridStationaryPawn.LobStrikeLocValidationInfoList[iter].bCalulatedThisEngagement)
        {
            return;
        }
        Outer.AkridStationaryPawn.LobStrikeLocValidationInfoList[iter].bCalulatedThisEngagement = false;
        Outer.AkridStationaryPawn.LobStrikeLocValidationInfoList[iter].LogAlgosSegmentValiditys.Length = 0;
        Outer.AkridStationaryPawn.LobStrikeLocValidationInfoList[iter].LogAlgosSegmentEnds.Length = 0;
        ++iter;
        // [Loop Continue]
        goto J0x53;
    }
    //return;    
}

function GetMaxNumberOfPosibleLobStrikeCalcsForThisSlotAndZone()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], numOfAltArcForThisZone, currentZoneIn;

    numOfAltArcForThisZone = 0;
    // End:0x86
    if(Outer.myAIPawn.GetRangedLobStrikeZoneForCurrentAttack() >= 0)
    {
        currentZoneIn = Outer.myAIPawn.GetRangedLobStrikeZoneForCurrentAttack();        
    }
    else
    {
        currentZoneIn = Outer.AkridStationaryPawn.FindCurrentLobFromAnywhereZone(EnemyForAttack);
    }
    // End:0x14C
    if(currentZoneIn >= 0)
    {
        numOfAltArcForThisZone = Outer.AkridStationaryPawn.TuneDataAkridStationary.RangedLobStrikeInfoByZone[currentZoneIn].AltDesiredZPercentOfLobList.Length;
    }
    return (Outer.TotalNumberOfPossibileLobFireLocationsPerEvolution + numOfAltArcForThisZone) - 1;
    //return ReturnValue;    
}

function GetMaxNumberOfPosibleAltLobStrikeCalcsForThisZone()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], numOfAltArcForThisZone, currentZoneIn;

    numOfAltArcForThisZone = 0;
    // End:0x86
    if(Outer.myAIPawn.GetRangedLobStrikeZoneForCurrentAttack() >= 0)
    {
        currentZoneIn = Outer.myAIPawn.GetRangedLobStrikeZoneForCurrentAttack();        
    }
    else
    {
        currentZoneIn = Outer.AkridStationaryPawn.FindCurrentLobFromAnywhereZone(EnemyForAttack);
    }
    // End:0x14C
    if(currentZoneIn >= 0)
    {
        numOfAltArcForThisZone = Outer.AkridStationaryPawn.TuneDataAkridStationary.RangedLobStrikeInfoByZone[currentZoneIn].AltDesiredZPercentOfLobList.Length;
    }
    return numOfAltArcForThisZone;
    //return ReturnValue;    
}

function ShouldTryRangeLobAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private float timeSinceFindingValidLobAttackOption, howOfftenToRestartSearchingForValidAttackOptions;

    // End:0x64
    if(Outer.CurrentPubSubCombatManagerResourceRef != none)
    {
        howOfftenToRestartSearchingForValidAttackOptions = Outer.CurrentPubSubCombatManagerResourceRef.HowOfftenToCleanOutOldOptions;        
    }
    else
    {
        howOfftenToRestartSearchingForValidAttackOptions = 5.0000000;
    }
    timeSinceFindingValidLobAttackOption = Outer.WorldInfo.TimeSeconds - LastTimeFoundValidEngagementRangeLobAttack;
    // End:0x227
    if(timeSinceFindingValidLobAttackOption > howOfftenToRestartSearchingForValidAttackOptions)
    {
        // End:0xEB
        if(!bHasStrikeDataBeenResetYetForThisThisEngagement)
        {
            ResetFindLobFireCounters();
        }
        // End:0x10D
        if(TotalNumOfAttemptsToFindLobStrikeArcThisEngagement >= (GetMaxNumberOfPosibleLobStrikeCalcsForThisSlotAndZone()))
        {
            ResetFindLobFireCounters();
        }
        iter = 0;
        J0x118:

        // End:0x224 [Loop If]
        if(float(iter) < Outer.AkridStationaryPawn.TuneDataAkridStationary.MaxNumOfAttemptsToFindLobFireRangeStrikeLocationDuringAnUpdate.GetValue())
        {
            ++TotalNumOfAttemptsToFindLobStrikeArcThisEngagement;
            ++NumOfAttemptsToFindPreCalcedLobStrikeLocationThisEngagement;
            // End:0x1F4
            if(FindValidLobStrikeLocation())
            {
                LastTimeFoundValidEngagementRangeLobAttack = Outer.WorldInfo.TimeSeconds;
                bHasStrikeDataBeenResetYetForThisThisEngagement = false;
                return true;
            }
            // End:0x216
            if(TotalNumOfAttemptsToFindLobStrikeArcThisEngagement >= (GetMaxNumberOfPosibleLobStrikeCalcsForThisSlotAndZone()))
            {
                ResetFindLobFireCounters();
            }
            ++iter;
            // [Loop Continue]
            goto J0x118;
        }        
    }
    return false;
    //return ReturnValue;    
}

function ShouldTryDirectFireBurstAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Seperation;

    Seperation = EnemySeperation();
    // End:0x1A6
    if((Seperation < Outer.AkridStationaryPawn.TuneDataAkridStationary.MaxSeperationForDirectBurstFireRangeAttack.GetValue()) && Seperation > Outer.AkridStationaryPawn.TuneDataAkridStationary.MinSeperationForDirectBurstFireRangeAttack.GetValue())
    {
        // End:0x1A6
        if(IsTherLosToTargetForDirectFireBurstAttack())
        {
            Outer.AkridStationaryPawn.SetAimInfoForBurstFireStrike(EnemyForAttack.Location, EnemyForAttack, -1, 0, Outer.AkridStationaryPawn.TuneDataAkridStationary.HeightOffTargetPointForBurstFire);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function OnEngagementAttackOptionApproved()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1D
    if(int(AiAttackTypeProcessingAnotherAttackRequestFor) == int(TypeOfAttack))
    {
        return true;
    }
    // End:0x128
    if(int(TypeOfAttack) == int(2))
    {
        // End:0x4A
        if(!HasAccessToStartAttackFromFixedPlacement())
        {
            GetStrikeAccessIfRequiredBeforeAttack();
        }
        // End:0x125
        if(HasAccessToStartAttackFromFixedPlacement())
        {
            // End:0x9A
            if(CurrentAttackCmd != none)
            {
                Outer.AbortCommand(CurrentAttackCmd);
                CurrentAttackCmd = none;
            }
            // End:0xB1
            if(StaticStalkStarted)
            {
                StopAreaDependentFixedPlacementStalk();
            }
            TypeOfAttackToldToPerform = 2;
            // End:0x10D
            if(Outer.myAIPawn.GetRangedLobStrikeZoneForCurrentAttack() >= 0)
            {
                GotoStateWithEnemyCheck('StartAttackFromFixedPlacement');                
            }
            else
            {
                GotoStateWithEnemyCheck('StartAttackFromFixedPlacement');
            }
            return true;            
        }        
    }
    else
    {
        // End:0x233
        if(int(TypeOfAttack) == int(8))
        {
            // End:0x155
            if(!HasAccessToStartAttackFromFixedPlacement())
            {
                GetStrikeAccessIfRequiredBeforeAttack();
            }
            // End:0x230
            if(HasAccessToStartAttackFromFixedPlacement())
            {
                // End:0x1A5
                if(CurrentAttackCmd != none)
                {
                    Outer.AbortCommand(CurrentAttackCmd);
                    CurrentAttackCmd = none;
                }
                // End:0x1BC
                if(StaticStalkStarted)
                {
                    StopAreaDependentFixedPlacementStalk();
                }
                TypeOfAttackToldToPerform = 8;
                // End:0x218
                if(Outer.myAIPawn.GetRangedLobStrikeZoneForCurrentAttack() >= 0)
                {
                    GotoStateWithEnemyCheck('StartAttackFromFixedPlacement');                    
                }
                else
                {
                    GotoStateWithEnemyCheck('StartAttackFromFixedPlacement');
                }
                return true;                
            }            
        }
        else
        {
            // End:0x2D1
            if(int(TypeOfAttack) == int(5))
            {
                // End:0x260
                if(!HasAccessToStartAttackFromFixedPlacement())
                {
                    GetStrikeAccessIfRequiredBeforeAttack();
                }
                // End:0x2D1
                if(HasAccessToStartAttackFromFixedPlacement())
                {
                    // End:0x2B0
                    if(CurrentAttackCmd != none)
                    {
                        Outer.AbortCommand(CurrentAttackCmd);
                        CurrentAttackCmd = none;
                    }
                    TypeOfAttackToldToPerform = 5;
                    GotoStateWithEnemyCheck('StartAttackFromFixedPlacement');
                    return true;
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function OnEngagementAttackOptionPurged()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];

    ResetFindLobFireCounters();
    ProcessLookForFixPlaceAttackOpportunity();
    //return;    
}

function StartAreaDependentFixedPlacementStalk()
{
    StaticStalkStarted = true;
    //return;    
}

function StopAreaDependentFixedPlacementStalk()
{
    StaticStalkStarted = false;
    //return;    
}

function StaticFixedPlacementStalk_StartSM()
{
    // End:0x19
    if(!StaticStalkStarted)
    {
        StartAreaDependentFixedPlacementStalk();
    }
    //return;    
}

function StaticFixedPlacementStalk_StopSM()
{
    // End:0x17
    if(StaticStalkStarted)
    {
        StopAreaDependentFixedPlacementStalk();
    }
    //return;    
}

function ProcessLookForAnotherRangeLobAttackOpportunityFromCurrentLocation()
{
    local /*0x97E50000-0x00000000*/ private bool bForceChoice[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private float inAttackArcScaler;
    local /*0x97E50000-0x00000000*/ private bool bshouldAttackAgain;
    local /*0x97E50000-0x00000000*/ private int currentLobZoneIn;

    // End:0x256
    if(Outer.IsThereClearLobAttackLaneFromGivenLoc(Outer.AkridStationaryPawn.Location, EnemyForAttack, Outer.AkridStationaryPawn.GetRangedLobStrikeTierForCurrentAttack(), TotalNumOfAttemptsToFindLobStrikeArcThisEngagement, currentLobZoneIn))
    {
        Outer.AkridStationaryPawn.SetAimInfoForRangedLobStrike(EnemyForAttack.Location, EnemyForAttack, 0, 0, Outer.AkridStationaryPawn.TuneDataAkridStationary.HieghtOffTargetPointForEndOfLobFireArc);
        // End:0x256
        if(Outer.CurrentPubSubCombatManagerResourceRef != none)
        {
            inAttackArcScaler += Outer.AkridStationaryPawn.TuneDataAkridStationary.ReattackDesirabilityOfAttackScaler.GetValue();
            AiAttackTypeProcessingAnotherAttackRequestFor = 2;
            bshouldAttackAgain = Outer.CurrentPubSubCombatManagerResourceRef.PublishNewAttackOption(Outer, 2, inAttackArcScaler, bForceChoice);
            AiAttackTypeProcessingAnotherAttackRequestFor = 0;
            return bshouldAttackAgain;
        }
    }
    return false;
    //return ReturnValue;    
}

function ProcessLookForRangeLobAttackOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float inAttackArcScaler;

    // End:0x8D
    if(ShouldTryRangeLobAttack())
    {
        inAttackArcScaler = 1.0000000;
        // End:0x8A
        if(Outer.CurrentPubSubCombatManagerResourceRef != none)
        {
            return Outer.CurrentPubSubCombatManagerResourceRef.PublishNewAttackOption(Outer, 2, inAttackArcScaler, false);
        }        
    }
    return false;
    //return ReturnValue;    
}

function ProcessLookForDirectFireBurstAttackOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x7A
    if(ShouldTryDirectFireBurstAttack())
    {
        // End:0x77
        if(Outer.CurrentPubSubCombatManagerResourceRef != none)
        {
            return Outer.CurrentPubSubCombatManagerResourceRef.PublishNewAttackOption(Outer, 8, 1.0000000, false);
        }        
    }
    return false;
    //return ReturnValue;    
}

function ProcessLookForDirectFireSniperAttackOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x7A
    if(ShouldTryDirectFireBurstAttack())
    {
        // End:0x77
        if(Outer.CurrentPubSubCombatManagerResourceRef != none)
        {
            return Outer.CurrentPubSubCombatManagerResourceRef.PublishNewAttackOption(Outer, 5, 1.0000000, false);
        }        
    }
    return false;
    //return ReturnValue;    
}

function ProcessLookForFixPlaceAttackOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bshoudldLobAttackImmediately, bshoudldDirectFireBurstAttackImmediately, bshoudldDirectFireSniperAttackImmediately;

    bshoudldLobAttackImmediately = false;
    bshoudldDirectFireBurstAttackImmediately = false;
    bshoudldDirectFireSniperAttackImmediately = false;
    // End:0xA1
    if(Outer.AkridStationaryPawn.TuneDataAkridStationary.bAllowedToPerformIndirectFireLobAttacks.GetValue() != 0.0000000)
    {
        bshoudldLobAttackImmediately = ProcessLookForRangeLobAttackOpportunity();
    }
    // End:0x11E
    if(Outer.AkridStationaryPawn.TuneDataAkridStationary.bAllowedToPerformDirectFireBurstAttacks.GetValue() != 0.0000000)
    {
        bshoudldDirectFireBurstAttackImmediately = ProcessLookForDirectFireBurstAttackOpportunity();
    }
    // End:0x19B
    if(Outer.AkridStationaryPawn.TuneDataAkridStationary.bAllowedToPerformDirectFireSniperAttacks.GetValue() != 0.0000000)
    {
        bshoudldDirectFireSniperAttackImmediately = ProcessLookForDirectFireSniperAttackOpportunity();
    }
    return (bshoudldLobAttackImmediately || bshoudldDirectFireBurstAttackImmediately) || bshoudldDirectFireSniperAttackImmediately;
    //return ReturnValue;    
}

function PopCommandWithFaliure()
{
    LPAICmd_Attack_Status(1);
    Outer.PopCommand(self);
    //return;    
}

function IsMyEnemyInRange()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.CheckValidRangeToEnemy();
    //return ReturnValue;    
}

event GotoStateWithEnemyCheck()
{
    local /*0x97E50000-0x00000000*/ private name StateName[8388609];

    // End:0x26
    if(IsMyEnemyAlive())
    {
        GotoState(StateName, 'Begin');        
    }
    else
    {
        Outer.PopCommand(self);
    }
    //return;    
}

function GetMinAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return MinAttackRange;
    //return ReturnValue;    
}

function GetMaxAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return MaxAttackRange;
    //return ReturnValue;    
}

function StartStandOffAnimation()
{
    //return;    
}

function EndStandOffAnimation()
{
    //return;    
}

function PerformReactionToVsBump()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheVs[8388609];

    //return;    
}

function ShouldFaceEnemyWhileMovingToSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

final function StartPocessLookForFixPlaceAttackOpportunityTimer()
{
    local /*0x97E50000-0x00000000*/ private bool isTimerAlreadyRunning;

    isTimerAlreadyRunning = IsPocessLookForFixPlaceAttackOpportunityTimerActive();
    // End:0xE0
    if(!Outer.bDisableAI && !isTimerAlreadyRunning)
    {
        // End:0xDD
        if(!ProcessLookForFixPlaceAttackOpportunity())
        {
            Outer.SetTimer(Outer.AkridStationaryPawn.TuneDataAkridStationary.UpdateRateForStationaryEngagementPocessLookForAttackOpportunity.GetValue(), true, 'PocessLookForFixPlaceAttackOpportunityTimer', self);            
        }        
    }
    //return;    
}

final function StopPocessLookForFixPlaceAttackOpportunityTimer()
{
    Outer.ClearTimer('PocessLookForFixPlaceAttackOpportunityTimer', self);
    //return;    
}

function PausePocessLookForFixPlaceAttackOpportunityTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopPocessLookForFixPlaceAttackOpportunityTimer();        
    }
    else
    {
        StartPocessLookForFixPlaceAttackOpportunityTimer();
    }
    //return;    
}

final function IsPocessLookForFixPlaceAttackOpportunityTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('PocessLookForFixPlaceAttackOpportunityTimer', self);
    //return ReturnValue;    
}

private final function PocessLookForFixPlaceAttackOpportunityTimer()
{
    ProcessLookForFixPlaceAttackOpportunity();
    //return;    
}

function HasAccessToStartAttackFromFixedPlacement()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function GetStrikeAccessIfRequiredBeforeAttack()
{
    GetStrikeAccess(EnemyForAttack);
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super.BeginState(PreviousState);
        //return;        
    }
Begin:

    Outer.SetAttackResourceNames();
    J0x1F:

    // End:0x65 [Loop If]
    if(IsMyEnemyAlive())
    {
        // End:0x4F
        if(bShouldFixedPlacementStalk)
        {
            GotoStateWithEnemyCheck('StalkFromFixedPlacement');            
        }
        else
        {
            GotoStateWithEnemyCheck('StartAttackFromFixedPlacement');
        }
        // [Loop Continue]
        goto J0x1F;
    }
    Outer.PopCommand(self);
    stop;            
}

state StalkFromFixedPlacement
{
    ignores PreMove;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        StaticFixedPlacementStalk_StopSM();
        super(SPStateObject).EndState(NextStateName);
        // End:0x7E
        if(Outer.CurrentPubSubCombatManagerResourceRef != none)
        {
            Outer.CurrentPubSubCombatManagerResourceRef.RetractAllOptionsForThisPublisher(Outer);
        }
        // End:0x95
        if(StaticStalkStarted)
        {
            StopAreaDependentFixedPlacementStalk();
        }
        Outer.PawnZeroVelocity();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        StaticFixedPlacementStalk_StopSM();
        // End:0x75
        if(Outer.CurrentPubSubCombatManagerResourceRef != none)
        {
            Outer.CurrentPubSubCombatManagerResourceRef.RetractAllOptionsForThisPublisher(Outer);
        }
        // End:0x8C
        if(StaticStalkStarted)
        {
            StopAreaDependentFixedPlacementStalk();
        }
        Outer.PawnZeroVelocity();
        //return;        
    }

    event PausedState()
    {
        // End:0x17
        if(StaticStalkStarted)
        {
            StaticFixedPlacementStalk_StopSM();
        }
        //return;        
    }

    function ContinuedState()
    {
        // End:0x17
        if(StaticStalkStarted)
        {
            StaticFixedPlacementStalk_StartSM();
        }
        //return;        
    }

    function StaticFixedPlacementStalk_CanContinue()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function StaticStalk_ShouldWait()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function StaticStalk_ShouldWaitBeforeExitState()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function GotoPostFixedPlacementStalkState()
    {
        GotoStateWithEnemyCheck('StartAttackFromFixedPlacement');
        //return;        
    }

    function CanStartStalk()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x14
        if(!bShouldFixedPlacementStalk)
        {
            return false;            
        }
        else
        {
            // End:0x43
            if(!Outer.HasFixedPlacementAttackAccess(EnemyForAttack))
            {
                return false;
            }
        }
        return true;
        //return ReturnValue;        
    }
Begin:

    // End:0x22
    if(!CanStartStalk())
    {
        GotoStateWithEnemyCheck('StartAttackFromFixedPlacement');
    }
    goto 'BeginStaticFixedPlacementStalk';
BeginStaticFixedPlacementStalk:


    StartPocessLookForFixPlaceAttackOpportunityTimer();
    J0x36:

    // End:0x63 [Loop If]
    if(StaticStalk_ShouldWait())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x36;
    }
    StaticFixedPlacementStalk_StartSM();
    J0x6D:

    // End:0x9A [Loop If]
    if(StaticFixedPlacementStalk_CanContinue())
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x6D;
    }
    StaticFixedPlacementStalk_StopSM();
    J0xA4:

    // End:0xD1 [Loop If]
    if(StaticStalk_ShouldWaitBeforeExitState())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0xA4;
    }
    GotoPostFixedPlacementStalkState();
    J0xDB:

    // End:0xFF [Loop If]
    if(true)
    {
        Outer.Sleep(1.0000000);
        // [Loop Continue]
        goto J0xDB;
    }
    stop;                    
}

state StartAttackFromFixedPlacement
{
    function StartAttackBehavior()
    {
        GotoStateWithEnemyCheck('BeginAttackFromFixedPlacement');
        //return;        
    }
Begin:

    TimeToGiveUpTryingToStrike = Outer.WorldInfo.TimeSeconds + TimeToKeepTryingForStrike;
    J0x48:

    // End:0xE7 [Loop If]
    if(!HasAccessToStartAttackFromFixedPlacement())
    {
        // End:0xA1
        if(!Outer.HasFixedPlacementAttackAccess(EnemyForAttack))
        {
            HandleFailureToStartAttack();
            GotoStateWithEnemyCheck('GetFixedPlacementFormationClearenceOnFormationChange');
        }
        // End:0xB8
        if(HasAttackWaitTimerExpired())
        {
            GetStrikeAccessIfRequiredBeforeAttack();
        }
        // End:0xE4
        if(!HasAccessToStartAttackFromFixedPlacement())
        {
            Outer.Sleep(0.0100000);
        }
        // [Loop Continue]
        goto J0x48;
    }
    StartAttackBehavior();
    stop;            
}

state BeginAttackFromFixedPlacement
{Begin:

    // End:0x2C
    if(!HasAccessToStartAttackFromFixedPlacement())
    {
        HandleFailureToStartAttack();
        GotoStateWithEnemyCheck('GetFixedPlacementFormationClearence');
    }
    GotoStateWithEnemyCheck('AttackFromFixedPlacementWithClearence');
    stop;                    
}

state ContinueToAttackFromFixedPlacement
{Begin:

    // End:0x2C
    if(!HasAccessToStartAttackFromFixedPlacement())
    {
        HandleFailureToStartAttack();
        GotoStateWithEnemyCheck('GetFixedPlacementFormationClearence');
    }
    GotoStateWithEnemyCheck('AttackFromFixedPlacementWithClearence');
    stop;                    
}

state AttackFromFixedPlacementWithClearence
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        Outer.LockStrikeAccess(false);
        //return;        
    }

    function PreAttack()
    {
        Outer.LockStrikeAccess(true);
        //return;        
    }

    function PostAttackFromFixedPlacement()
    {
        Outer.LockStrikeAccess(false);
        ResetAttackWaitTimer();
        ResetFindLobFireCounters();
        CurrentAttackCmd = none;
        StartPocessLookForFixPlaceAttackOpportunityTimer();
        //return;        
    }
Begin:

    // End:0x2F
    if(!HasAccessToStartAttackFromFixedPlacement())
    {
        HandleFailureToStartAttack();
        GotoStateWithEnemyCheck('GetFixedPlacementFormationClearence');        
    }
    else
    {
        // End:0x77
        if(CanStillAttackFromFixedPlacement())
        {
            // End:0x6A
            if(HasAttackWaitTimerExpired())
            {
                PreAttack();
                FixedPlacementAttackEnemy();
                PostAttackFromFixedPlacement();                
            }
            else
            {
                HandleFailureToStartAttack();
            }            
        }
        else
        {
            Outer.ReleaseStrikeAccess();
            HandleFailureToStartAttack();
        }
        Outer.Sleep(0.0000000);
        Outer.ReleaseStrikeAccess();
        // End:0xFF
        if(bShouldFixedPlacementStalk)
        {
            GotoStateWithEnemyCheck('StalkFromFixedPlacement');            
        }
        else
        {
            GotoStateWithEnemyCheck('StartAttackFromFixedPlacement');
        }
    }
    stop;        
}

state WaitForFixedPlacementClearence
{Begin:

    PopCommandWithFaliure();
    stop;        
}

defaultproperties
{
    bShouldFixedPlacementStalk=true
    MinAttackRange=50.0000000
    MaxAttackRange=100.0000000
    HorizAngRangeInDegrees=90.0000000
    VertAngRangeInDegrees=180.0000000
    TimeToKeepTryingForStrike=5.0000000
}