class LPAICmd_Orbit extends LPAICmd_Attack within LPAIControllerMedFlyer
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OuterFlyerCtrl[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool IsManeuvering[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldStalk[537001985];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseAIResourceForEngagement[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool MovingToActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool StaticStalkStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseTightAreaStalk[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanStrikeBeforeReachingOrbitSlot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasStrikeDataBeenResetYetForThisThisEngagement[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNeedsToMoveBackToOrbitSlot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWasLastLobAttackCheckValid[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWasLastDiectFireAttackCheckValid[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWasLastFullPhysicalAttackCheckValid[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWasLastRamAttackCheckValid[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ACosHorizAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ACosVertAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinAttackRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAttackRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HorizAngRangeInDegrees;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float VertAngRangeInDegrees;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OrbitPatternCenter;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OrbitPatternRadius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WaitPoint;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class TightAreaFlyerStalkSmClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class OpenAreaFlyerStalkSmClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte AiAttackTypeProcessingAnotherAttackRequestFor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte TypeOfAttackToldToPerform[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionFlyCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurMoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentAttackCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedMoveTimer[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OrbitSlotPosition[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PointToAttackFrom[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToGiveUpTryingToStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToKeepTryingForStrike[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfAttemptsToFindAltLobStrikeArcThisEngagement[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfAttemptsToFindPreCalcedLobStrikeLocationThisEngagement[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TotalNumOfAttemptsToFindLobStrikeArcThisEngagement[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TotalNumOfAttemptsToFindDirectFireStrikeLaneThisEngagement[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeFoundValidEngagementRangeLobAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeFoundValidEngagementRangeDirectFireAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeFoundValidEngagementFullPhysicalAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeFoundValidEngagementRamAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeArrivedAtOrbitSlot[536870913];

// Export ULPAICmd_Orbit::execProcessLookForAttackOpportunity(FFrame&, void* const)
native function ProcessLookForAttackOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAICmd_Orbit::execDoCurrentConditionsAllowLookingForAttackOpportunities(FFrame&, void* const)
native final function DoCurrentConditionsAllowLookingForAttackOpportunities()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAICmd_Orbit::execIsFlyerStillInOrGoingToValidOrbitZone(FFrame&, void* const)
native final function IsFlyerStillInOrGoingToValidOrbitZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTestAgainst[8388609];
    local /*0x97E50000-0x00000000*/ private float DistanceErrorBuffer[9437185], HeightErrorBuffer, PitchErrorBufferInDegrees;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    -1.0000000
    -1.0000000
    -1.0000000                        
}

// Export ULPAICmd_Orbit::execHasToMuchTimePassedWithNoAggressiveActivity(FFrame&, void* const)
native final function HasToMuchTimePassedWithNoAggressiveActivity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAICmd_Orbit::execResetFindRangedFireCounters(FFrame&, void* const)
native final function ResetFindRangedFireCounters();

// Export ULPAICmd_Orbit::execProcessLookForReactiveAttackOpportunity(FFrame&, void* const)
native final function ProcessLookForReactiveAttackOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAICmd_Orbit::execProcessLookForRangeDirectFireAttackOpportunity(FFrame&, void* const)
native final function ProcessLookForRangeDirectFireAttackOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAICmd_Orbit::execShouldTryRangeDirectFireAttack(FFrame&, void* const)
native final function ShouldTryRangeDirectFireAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAICmd_Orbit::execStopAreaDependentStalk(FFrame&, void* const)
native final function StopAreaDependentStalk();

// Export ULPAICmd_Orbit::execGetMaxNumberOfPosibleDirectFireStrikeCalcsForThisSlotAndZone(FFrame&, void* const)
native final function GetMaxNumberOfPosibleDirectFireStrikeCalcsForThisSlotAndZone()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

event NotifyAIResourceChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess;

    super.NotifyAIResourceChanged(ResAccess);
    ResourceAccess = SPAIResourceAccess(ResAccess);
    // End:0x107
    if((ResourceAccess != none) && ResourceAccess == Outer.OrbitAccess)
    {
        // End:0xAA
        if(CurrentAttackCmd != none)
        {
            // End:0xAA
            if(!CurrentAttackCmd.DoesThisAttackCommandCareIfItsFormationAccessHasChanged(ResAccess))
            {
                return true;
            }
        }
        Outer.bOrbitPointMoved = true;
        LastTimeFoundValidEngagementRangeLobAttack = -1.0000000;
        LastTimeFoundValidEngagementRangeDirectFireAttack = -1.0000000;
        LastTimeFoundValidEngagementFullPhysicalAttack = -1.0000000;
        LastTimeFoundValidEngagementRamAttack = -1.0000000;
    }
    return false;
    //return ReturnValue;    
}

function SetCanStrikeBeforeReachingOrbitSlot()
{
    local /*0x97E50000-0x00000000*/ private bool bCan[8388609];

    bCanStrikeBeforeReachingOrbitSlot = bCan;
    //return;    
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

function SetOrbitExtents()
{
    OrbitPatternCenter = EnemyForAttack.Location;
    OrbitPatternRadius = MyEnemyRadius * float(2);
    //return;    
}

function Pushed()
{
    OuterFlyerCtrl = Outer;
    super.Pushed();
    Outer.ResetTimeOfLastAttackStarted();
    Class'SPEngine.SPUtil'.static.SetHalfACosAngRange(HorizAngRangeInDegrees, ACosHorizAngRange);
    Class'SPEngine.SPUtil'.static.SetHalfACosAngRange(VertAngRangeInDegrees, ACosVertAngRange);
    bUseAIResourceForEngagement = true;
    LastTimeFoundValidEngagementRangeLobAttack = -1.0000000;
    LastTimeFoundValidEngagementRangeDirectFireAttack = -1.0000000;
    LastTimeFoundValidEngagementFullPhysicalAttack = -1.0000000;
    LastTimeFoundValidEngagementRamAttack = -1.0000000;
    ResetFindRangedFireCounters();
    CurrentAttackCmd = none;
    bUseTightAreaStalk = false;
    bNeedsToMoveBackToOrbitSlot = false;
    AiAttackTypeProcessingAnotherAttackRequestFor = 0;
    TypeOfAttackToldToPerform = 0;
    TimeArrivedAtOrbitSlot = -1.0000000;
    bWasLastLobAttackCheckValid = false;
    bWasLastDiectFireAttackCheckValid = false;
    bWasLastFullPhysicalAttackCheckValid = false;
    bWasLastRamAttackCheckValid = false;
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.ResetTimeOfLastAttackEnded();
    Outer.UseAnimationNormal();
    Outer.EnableAggressiveGlow(false);
    // End:0x7F
    if(StaticStalkStarted)
    {
        StopAreaDependentStalk();
    }
    StopPocessLookForAttackOpportunityTimer();
    Outer.myAIPawn.SetRangedLobStrikeZoneInfo(-1, -1);
    Outer.NotifyCombatManagerToRetractAllOptionsForThisPublisher();
    Outer.ReleaseStrikeAccess();
    Outer.ReleaseOrbitAccess();
    Outer.ReleaseOrbitEngagementAccess();
    Outer.ResetAccumulatorsHammeringTheAttackerOnFlyFormationInvalidations();
    CleanUpPursiutVelocityWhenManeuveringForAttack();
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
        StaticOrbitStalk_StartSM();
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
    StopAbortAllOwnedCommands();
    Outer.ReleaseAllAttackAccess();
    ResetAttackWaitTimer();
    Outer.PawnZeroVelocity();
    //return;    
}

event StopAbortAllOwnedCommands()
{
    // End:0x43
    if(MoveToPositionFlyCmd != none)
    {
        Outer.AbortCommand(MoveToPositionFlyCmd);
        MoveToPositionFlyCmd = none;
    }
    // End:0x86
    if(CurMoveToActorCmd != none)
    {
        Outer.AbortCommand(CurMoveToActorCmd);
        CurMoveToActorCmd = none;
    }
    // End:0xC9
    if(CurrentAttackCmd != none)
    {
        Outer.AbortCommand(CurrentAttackCmd);
        CurrentAttackCmd = none;
    }
    //return;    
}

event NotifyAIResourceAccessLost()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], battackCmdIsGoingToHandle;

    battackCmdIsGoingToHandle = false;
    // End:0x143
    if((Outer.OrbitAccess != none) && ResourceAccess == Outer.OrbitAccess)
    {
        // End:0xC4
        if(CurrentAttackCmd != none)
        {
            // End:0xC4
            if(!CurrentAttackCmd.IsInterruptible())
            {
                battackCmdIsGoingToHandle = CurrentAttackCmd.NotifyAIResourceAccessLost(ResourceAccess);
            }
        }
        // End:0x143
        if(!battackCmdIsGoingToHandle)
        {
            StopAbortAllOwnedCommands();
            Outer.OrbitAccess = none;
            LastTimeFoundValidEngagementRangeLobAttack = -1.0000000;
            LastTimeFoundValidEngagementRangeDirectFireAttack = -1.0000000;
            LastTimeFoundValidEngagementFullPhysicalAttack = -1.0000000;
            LastTimeFoundValidEngagementRamAttack = -1.0000000;
            ResetFindRangedFireCounters();
        }
    }
    // End:0x18F
    if(ResourceAccess == Outer.FeintAccess)
    {
        Outer.FeintAccess = none;
    }
    // End:0x1DB
    if(ResourceAccess == Outer.StruggleAccess)
    {
        Outer.StruggleAccess = none;
    }
    return false;
    //return ReturnValue;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super.SetDesiredEnemy(InEnemy);
    Outer.GetOrbitEngagementAccess(InEnemy);
    //return;    
}

function IsEnemyInAngularRange()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function AttackEnemyFromOrbitSlot()
{
    StopPocessLookForAttackOpportunityTimer();
    //return;    
}

function AltMortarAttackEnemyFromOrbitSlot()
{
    StopPocessLookForAttackOpportunityTimer();
    //return;    
}

function FlyAttackEnemyFromHere()
{
    StopPocessLookForAttackOpportunityTimer();
    Outer.MedFlyerPawn.ResetRangedLobStrikeTierForCurrentAttack();
    //return;    
}

function FlyAttackHammerTheEnemyWithStruggleModeFromHere()
{
    StopPocessLookForAttackOpportunityTimer();
    //return;    
}

function FlyAttackHammerTheEnemyWithPhysicalAttackFromHere()
{
    StopPocessLookForAttackOpportunityTimer();
    //return;    
}

function FlyAttackHammerTheEnemyWithLobFromHere()
{
    StopPocessLookForAttackOpportunityTimer();
    //return;    
}

function SetReturnCmdStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnStatus[8388609];

    super.SetReturnCmdStatus(ReturnStatus);
    //return;    
}

function CanStillAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x109
    if((IsMyEnemyAlive()) && !Outer.MedFlyerPawn.TuneDataMedFlyer.bForceFlyerNotToAttack)
    {
        GetStrikeAccessIfRequiredBeforeAttack();
        // End:0x106
        if(HasAccessToStartAttackFromOrbitSlot())
        {
            // End:0xD1
            if((int(TypeOfAttackToldToPerform) == int(2)) || int(TypeOfAttackToldToPerform) == int(5))
            {
                // End:0xCE
                if(Outer.IsPawnInsideMaxRangedStrikeZone(EnemyForAttack))
                {
                    return true;                    
                }                
            }
            else
            {
                // End:0xEA
                if(int(TypeOfAttackToldToPerform) == int(13))
                {
                    return true;                    
                }
                else
                {
                    // End:0x103
                    if(int(TypeOfAttackToldToPerform) == int(21))
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

function CanStillAltMortarAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x89
    if((IsMyEnemyAlive()) && !Outer.MedFlyerPawn.TuneDataMedFlyer.bForceFlyerNotToAttack)
    {
        // End:0x86
        if(Outer.AltToFormationLocPointToStrikeFromIndexInManager >= 0)
        {
            return true;            
        }        
    }
    return false;
    //return ReturnValue;    
}

function HandleFailureToStartAttack()
{
    Outer.NotifyCombatManagerOfAttackCompleted(TypeOfAttackToldToPerform, true, false, false);
    ResetFindRangedFireCounters();
    LastTimeFoundValidEngagementFullPhysicalAttack = -1.0000000;
    LastTimeFoundValidEngagementRamAttack = -1.0000000;
    //return;    
}

function HandleFailureToStartAltMortarAttack()
{
    Outer.NotifyCombatManagerOfAttackCompleted(TypeOfAttackToldToPerform, true, false, false);
    LastTimeFoundValidEngagementFullPhysicalAttack = -1.0000000;
    LastTimeFoundValidEngagementRamAttack = -1.0000000;
    //return;    
}

function IsThereClearLobAttackLaneFromGivenLoc()
{
    local /*0x97E50000-0x00000000*/ private @NULL PointToStrikeFrom[8388609];
    local /*0x97E50000-0x00000000*/ private int CurrentTierToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL targetsOffsetForCals, displacementToTarget, pointToCalcLaunchFrom, QRot, fireVel;

    local /*0x97E50000-0x00000000*/ private bool bfoundArc;

    // End:0x11
    if(CurrentTierToTest < 0)
    {
        return false;
    }
    fireVel.X = 0.0000000;
    fireVel.Y = 0.0000000;
    fireVel.Z = 0.0000000;
    targetsOffsetForCals = EnemyForAttack.Location;
    targetsOffsetForCals.Z += Outer.MedFlyerPawn.TuneDataMedFlyer.HieghtOffTargetPointForEndOfLobFireArc;
    Outer.MedFlyerPawn.LobStrikeLocValidationInfoList[TotalNumOfAttemptsToFindLobStrikeArcThisEngagement].LogAlgosSegmentValiditys.Length = 0;
    Outer.MedFlyerPawn.LobStrikeLocValidationInfoList[TotalNumOfAttemptsToFindLobStrikeArcThisEngagement].LogAlgosSegmentEnds.Length = 0;
    displacementToTarget = targetsOffsetForCals - PointToStrikeFrom;
    QRot = QuatFromRotator(Rotator(displacementToTarget));
    pointToCalcLaunchFrom = QuatRotateVector(QRot, Outer.MedFlyerPawn.TuneDataMedFlyer.OffsetForCalcOfLobFirStrike);
    pointToCalcLaunchFrom = pointToCalcLaunchFrom + PointToStrikeFrom;
    Outer.MedFlyerPawn.LobStrikeLocValidationInfoList[TotalNumOfAttemptsToFindLobStrikeArcThisEngagement].LobFireLastPointToStrikeFrom = pointToCalcLaunchFrom;
    bfoundArc = Outer.MedFlyerPawn.FindTossVelocity(fireVel, targetsOffsetForCals, pointToCalcLaunchFrom, Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByTier[CurrentTierToTest].RangedLobFireIdealSpeed, Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByTier[CurrentTierToTest].RangedLobFireMinSpeed, Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByTier[CurrentTierToTest].RangedLobFireMaxSpeed, 0.0000000, Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByTier[CurrentTierToTest].DesiredZPercentOfLob, Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByTier[CurrentTierToTest].ShapeOfProjectileForLobCalc,,, true, Outer.MedFlyerPawn.GetBestCurrentVelocityForThisTarget(EnemyForAttack),, false, true, TotalNumOfAttemptsToFindLobStrikeArcThisEngagement);
    // End:0x57C
    if(bfoundArc)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function IsThereAClearLobAttackLaneFromCurrentLocation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL targetsOffsetForCals, displacementToTarget, pointToCalcLaunchFrom, baseLaunchLoc;
    local /*0x97E50000-0x00000000*/ private int currentZoneIn, currentZonesAltArc;
    local /*0x97E50000-0x00000000*/ private @NULL QRot, fireVel;
    local /*0x97E50000-0x00000000*/ private bool bfoundArc;
    local /*0x97E50000-0x00000000*/ private float desiredZPercentOfArc, distanceFromTarget;

    fireVel.X = 0.0000000;
    fireVel.Y = 0.0000000;
    fireVel.Z = 0.0000000;
    targetsOffsetForCals = EnemyForAttack.Location;
    targetsOffsetForCals.Z += Outer.MedFlyerPawn.TuneDataMedFlyer.HieghtOffTargetPointForEndOfLobFireArc;
    // End:0x10E
    if(TotalNumOfAttemptsToFindLobStrikeArcThisEngagement < 0)
    {
        TotalNumOfAttemptsToFindLobStrikeArcThisEngagement = 0;
    }
    Outer.MedFlyerPawn.LobStrikeLocValidationInfoList[TotalNumOfAttemptsToFindLobStrikeArcThisEngagement].LogAlgosSegmentValiditys.Length = 0;
    Outer.MedFlyerPawn.LobStrikeLocValidationInfoList[TotalNumOfAttemptsToFindLobStrikeArcThisEngagement].LogAlgosSegmentEnds.Length = 0;
    displacementToTarget = targetsOffsetForCals - Outer.MedFlyerPawn.Location;
    QRot = QuatFromRotator(Rotator(displacementToTarget));
    pointToCalcLaunchFrom = QuatRotateVector(QRot, Outer.MedFlyerPawn.TuneDataMedFlyer.OffsetForCalcOfLobFirStrike);
    // End:0x645
    if(Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZone >= 0)
    {
        distanceFromTarget = Outer.MedFlyerPawn.GetRangedLobFireMidZoneRangeForThisZone(Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZone);
        baseLaunchLoc = Outer.MedFlyerPawn.Location - EnemyForAttack.Location;
        baseLaunchLoc = Normal(baseLaunchLoc);
        baseLaunchLoc = baseLaunchLoc * distanceFromTarget;
        baseLaunchLoc = EnemyForAttack.Location + baseLaunchLoc;
        currentZoneIn = Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZone;
        // End:0x5C4
        if(Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZonesAltArc >= 0)
        {
            currentZonesAltArc = Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZonesAltArc;
            desiredZPercentOfArc = Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByZone[currentZoneIn].AltDesiredZPercentOfLobList[Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZonesAltArc];            
        }
        else
        {
            currentZonesAltArc = -1;
            desiredZPercentOfArc = Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByZone[currentZoneIn].DesiredZPercentOfLob;
        }        
    }
    else
    {
        currentZoneIn = Outer.MedFlyerPawn.FindCurrentLobFromAnywhereZone(EnemyForAttack);
        // End:0x74B
        if(currentZoneIn < 0)
        {
            // End:0x715
            if(TotalNumOfAttemptsToFindLobStrikeArcThisEngagement <= 0)
            {
                Outer.MedFlyerPawn.ResetRangedLobStrikeZoneForCurrentAttack();
                Outer.MedFlyerPawn.ResetRangedLobStrikeZonesAtlArcForCurrentAttack();                
            }
            else
            {
                Outer.MedFlyerPawn.ResetRangedLobStrikeZonesAtlArcForCurrentAttack();
            }
            return false;
        }
        baseLaunchLoc = Outer.MedFlyerPawn.Location;
        currentZonesAltArc = NumOfAttemptsToFindAltLobStrikeArcThisEngagement;
        // End:0x826
        if(currentZonesAltArc >= 0)
        {
            desiredZPercentOfArc = Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByZone[currentZoneIn].AltDesiredZPercentOfLobList[currentZonesAltArc];            
        }
        else
        {
            desiredZPercentOfArc = Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByZone[currentZoneIn].DesiredZPercentOfLob;
        }
    }
    pointToCalcLaunchFrom = pointToCalcLaunchFrom + baseLaunchLoc;
    Outer.MedFlyerPawn.LobStrikeLocValidationInfoList[TotalNumOfAttemptsToFindLobStrikeArcThisEngagement].LobFireLastPointToStrikeFrom = baseLaunchLoc;
    bfoundArc = Outer.MedFlyerPawn.FindTossVelocity(fireVel, targetsOffsetForCals, pointToCalcLaunchFrom, Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByZone[currentZoneIn].RangedLobFireIdealSpeed, Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByZone[currentZoneIn].RangedLobFireMinSpeed, Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByZone[currentZoneIn].RangedLobFireMaxSpeed, 0.0000000, desiredZPercentOfArc, Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByZone[currentZoneIn].ShapeOfProjectileForLobCalc,,, true, Outer.MedFlyerPawn.GetBestCurrentVelocityForThisTarget(EnemyForAttack),, false, true, TotalNumOfAttemptsToFindLobStrikeArcThisEngagement);
    // End:0xBAE
    if(bfoundArc)
    {
        Outer.MedFlyerPawn.SetRangedLobStrikeZoneInfo(currentZoneIn, currentZonesAltArc);
        return true;        
    }
    else
    {
        // End:0xC28
        if(TotalNumOfAttemptsToFindLobStrikeArcThisEngagement <= 0)
        {
            Outer.MedFlyerPawn.ResetRangedLobStrikeZoneForCurrentAttack();
            Outer.MedFlyerPawn.ResetRangedLobStrikeZonesAtlArcForCurrentAttack();            
        }
        else
        {
            Outer.MedFlyerPawn.ResetRangedLobStrikeZonesAtlArcForCurrentAttack();
        }
        return false;
    }
    return false;
    //return ReturnValue;    
}

function ValidateThisAsLobStrikeLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocationToTest[8388609];
    local /*0x97E50000-0x00000000*/ private int HeightTierToTest[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL outPossibleLobFirePointToStrikeFrom[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bableToFlyToStrikeLocation, bisThereAClearLobAttackLane;

    Outer.MedFlyerPawn.LobStrikeLocValidationInfoList[TotalNumOfAttemptsToFindLobStrikeArcThisEngagement].bCalulatedThisEngagement = true;
    bableToFlyToStrikeLocation = Outer.CalculateRangedLobPointToStrikeFrom(outPossibleLobFirePointToStrikeFrom, LocationToTest, EnemyForAttack, Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByTier[HeightTierToTest].HeightAboveTargetForLobRangedStrikeInUU, Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByTier[HeightTierToTest].XY_DistanceFromTargetForLobRangedStrikeInUU, Outer.MedFlyerPawn.TuneDataMedFlyer.MaxRangeForMovementNodeToFindForLobStrike.GetValue(), Outer.MedFlyerPawn.TuneDataMedFlyer.bCheckIfCanMoveToStrikeLocationBeforeTestingForLobLane);
    // End:0x48F
    if((bableToFlyToStrikeLocation && Outer.MedFlyerPawn.TuneDataMedFlyer.bCheckIfCanMoveToStrikeLocationBeforeTestingForLobLane) || !Outer.MedFlyerPawn.TuneDataMedFlyer.bCheckIfCanMoveToStrikeLocationBeforeTestingForLobLane)
    {
        bisThereAClearLobAttackLane = IsThereClearLobAttackLaneFromGivenLoc(outPossibleLobFirePointToStrikeFrom, HeightTierToTest);
        // End:0x3C9
        if(!Outer.MedFlyerPawn.TuneDataMedFlyer.bCheckIfCanMoveToStrikeLocationBeforeTestingForLobLane && bisThereAClearLobAttackLane)
        {
            bisThereAClearLobAttackLane = Outer.CanFlyToThisLocation(outPossibleLobFirePointToStrikeFrom, Outer.MedFlyerPawn.TuneDataMedFlyer.MaxRangeForMovementNodeToFindForLobStrike.GetValue());
        }
        // End:0x48C
        if(bisThereAClearLobAttackLane)
        {
            Outer.MedFlyerPawn.SetAimInfoForRangedLobStrike(EnemyForAttack.Location, EnemyForAttack, HeightTierToTest, -1, Outer.MedFlyerPawn.TuneDataMedFlyer.HieghtOffTargetPointForEndOfLobFireArc);
            return true;            
        }        
    }
    return false;
    //return ReturnValue;    
}

function ValidateThisAsDirectFireStrikeLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocationToTest[8388609];
    local /*0x97E50000-0x00000000*/ private int HeightTierToTest[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL outPossibleLobFirePointToStrikeFrom[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bableToFlyToStrikeLocation, bisThereAClearLobAttackLane;

    Outer.MedFlyerPawn.DirectFireStrikeLocValidationInfoList[TotalNumOfAttemptsToFindDirectFireStrikeLaneThisEngagement].bCalulatedThisEngagement = true;
    bableToFlyToStrikeLocation = Outer.CalculateRangedLobPointToStrikeFrom(outPossibleLobFirePointToStrikeFrom, LocationToTest, EnemyForAttack, Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByTier[HeightTierToTest].HeightAboveTargetForLobRangedStrikeInUU, Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByTier[HeightTierToTest].XY_DistanceFromTargetForLobRangedStrikeInUU, Outer.MedFlyerPawn.TuneDataMedFlyer.MaxRangeForMovementNodeToFindForLobStrike.GetValue(), Outer.MedFlyerPawn.TuneDataMedFlyer.bCheckIfCanMoveToStrikeLocationBeforeTestingForLobLane);
    // End:0x48F
    if((bableToFlyToStrikeLocation && Outer.MedFlyerPawn.TuneDataMedFlyer.bCheckIfCanMoveToStrikeLocationBeforeTestingForLobLane) || !Outer.MedFlyerPawn.TuneDataMedFlyer.bCheckIfCanMoveToStrikeLocationBeforeTestingForLobLane)
    {
        bisThereAClearLobAttackLane = IsThereClearDirectFireAttackLaneFromGivenLoc(outPossibleLobFirePointToStrikeFrom, HeightTierToTest);
        // End:0x3C9
        if(!Outer.MedFlyerPawn.TuneDataMedFlyer.bCheckIfCanMoveToStrikeLocationBeforeTestingForLobLane && bisThereAClearLobAttackLane)
        {
            bisThereAClearLobAttackLane = Outer.CanFlyToThisLocation(outPossibleLobFirePointToStrikeFrom, Outer.MedFlyerPawn.TuneDataMedFlyer.MaxRangeForMovementNodeToFindForLobStrike.GetValue());
        }
        // End:0x48C
        if(bisThereAClearLobAttackLane)
        {
            Outer.MedFlyerPawn.SetAimInfoForDirectFireStrike(EnemyForAttack.Location, EnemyForAttack, HeightTierToTest, -1, Outer.MedFlyerPawn.TuneDataMedFlyer.HieghtOffTargetPointForDirectFire);
            return true;            
        }        
    }
    return false;
    //return ReturnValue;    
}

function IsThereClearDirectFireAttackLaneFromGivenLoc()
{
    local /*0x97E50000-0x00000000*/ private @NULL PointToStrikeFrom[8388609];
    local /*0x97E50000-0x00000000*/ private int CurrentTierToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL targetsOffsetForCals, displacementToTarget, pointToCalcLaunchFrom, locationOfBlockage, QRot;

    local /*0x97E50000-0x00000000*/ private editfixedsize array losIgnoreActors, losIgnoreActorsClasses;
    local /*0x97E50000-0x00000000*/ private bool bfoundLane;

    // End:0x11
    if(CurrentTierToTest < 0)
    {
        return false;
    }
    targetsOffsetForCals = EnemyForAttack.Location;
    targetsOffsetForCals.Z += Outer.MedFlyerPawn.TuneDataMedFlyer.HieghtOffTargetPointForDirectFire;
    Outer.MedFlyerPawn.DirectFireStrikeLocValidationInfoList[TotalNumOfAttemptsToFindDirectFireStrikeLaneThisEngagement].bCalulatedThisEngagement = true;
    Outer.MedFlyerPawn.DirectFireStrikeLocValidationInfoList[TotalNumOfAttemptsToFindDirectFireStrikeLaneThisEngagement].LogAlgosSegmentValiditys.Length = 0;
    Outer.MedFlyerPawn.DirectFireStrikeLocValidationInfoList[TotalNumOfAttemptsToFindDirectFireStrikeLaneThisEngagement].LogAlgosSegmentEnds.Length = 0;
    displacementToTarget = targetsOffsetForCals - PointToStrikeFrom;
    QRot = QuatFromRotator(Rotator(displacementToTarget));
    pointToCalcLaunchFrom = QuatRotateVector(QRot, Outer.MedFlyerPawn.TuneDataMedFlyer.OffsetForCalcOfDiectFireForStrike);
    pointToCalcLaunchFrom = pointToCalcLaunchFrom + PointToStrikeFrom;
    Outer.MedFlyerPawn.DirectFireStrikeLocValidationInfoList[TotalNumOfAttemptsToFindDirectFireStrikeLaneThisEngagement].LobFireLastPointToStrikeFrom = pointToCalcLaunchFrom;
    losIgnoreActors.AddItem(Outer.MedFlyerPawn);    
    losIgnoreActors.AddItem(EnemyForAttack);    
    losIgnoreActorsClasses.AddItem(Class'LPAIPawnMedFlyer');    
    bfoundLane = Outer.LosTestForAttackLane(pointToCalcLaunchFrom, targetsOffsetForCals, 0.0000000, 0.0000000, locationOfBlockage, losIgnoreActors, losIgnoreActorsClasses, Outer.DirectFireStrikeLaneBlockageImpactInfo);
    Outer.MedFlyerPawn.DirectFireStrikeLocValidationInfoList[TotalNumOfAttemptsToFindDirectFireStrikeLaneThisEngagement].LogAlgosSegmentEnds.AddItem(targetsOffsetForCals);    
    Outer.MedFlyerPawn.DirectFireStrikeLocValidationInfoList[TotalNumOfAttemptsToFindDirectFireStrikeLaneThisEngagement].LobFireLastLocOfBlockage = locationOfBlockage;
    // End:0x4A6
    if(bfoundLane)
    {
        Outer.MedFlyerPawn.DirectFireStrikeLocValidationInfoList[TotalNumOfAttemptsToFindDirectFireStrikeLaneThisEngagement].LogAlgosSegmentValiditys.AddItem(true);        
        return true;        
    }
    else
    {
        Outer.MedFlyerPawn.DirectFireStrikeLocValidationInfoList[TotalNumOfAttemptsToFindDirectFireStrikeLaneThisEngagement].LogAlgosSegmentValiditys.AddItem(false);        
        return false;
    }
    //return ReturnValue;    
}

function IsThereAClearDirectFireAttackLaneFromCurrentLocation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL targetsOffsetForCals, displacementToTarget, pointToCalcLaunchFrom, baseLaunchLoc;
    local /*0x97E50000-0x00000000*/ private int currentZoneIn;
    local /*0x97E50000-0x00000000*/ private @NULL QRot;
    local /*0x97E50000-0x00000000*/ private float distanceFromTarget;
    local /*0x97E50000-0x00000000*/ private bool bisThereAClearDirectFireAttackLane;

    targetsOffsetForCals = EnemyForAttack.Location;
    targetsOffsetForCals.Z += Outer.MedFlyerPawn.TuneDataMedFlyer.HieghtOffTargetPointForDirectFire;
    Outer.MedFlyerPawn.DirectFireStrikeLocValidationInfoList[TotalNumOfAttemptsToFindDirectFireStrikeLaneThisEngagement].LogAlgosSegmentValiditys.Length = 0;
    Outer.MedFlyerPawn.DirectFireStrikeLocValidationInfoList[TotalNumOfAttemptsToFindDirectFireStrikeLaneThisEngagement].LogAlgosSegmentEnds.Length = 0;
    displacementToTarget = targetsOffsetForCals - Outer.MedFlyerPawn.Location;
    QRot = QuatFromRotator(Rotator(displacementToTarget));
    pointToCalcLaunchFrom = QuatRotateVector(QRot, Outer.MedFlyerPawn.TuneDataMedFlyer.OffsetForCalcOfDiectFireForStrike);
    // End:0x3EC
    if(Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZone >= 0)
    {
        distanceFromTarget = Outer.MedFlyerPawn.GetRangedLobFireMidZoneRangeForThisZone(Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZone);
        baseLaunchLoc = Outer.MedFlyerPawn.Location - EnemyForAttack.Location;
        baseLaunchLoc = Normal(baseLaunchLoc);
        baseLaunchLoc = baseLaunchLoc * distanceFromTarget;
        baseLaunchLoc = EnemyForAttack.Location + baseLaunchLoc;
        currentZoneIn = Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZone;        
    }
    else
    {
        currentZoneIn = Outer.MedFlyerPawn.FindCurrentDirectFireFromAnywhereZone(EnemyForAttack);
        baseLaunchLoc = Outer.MedFlyerPawn.Location;
    }
    pointToCalcLaunchFrom = pointToCalcLaunchFrom + baseLaunchLoc;
    Outer.MedFlyerPawn.DirectFireStrikeLocValidationInfoList[TotalNumOfAttemptsToFindDirectFireStrikeLaneThisEngagement].LobFireLastPointToStrikeFrom = baseLaunchLoc;
    bisThereAClearDirectFireAttackLane = IsThereClearDirectFireAttackLaneFromGivenLoc(pointToCalcLaunchFrom, 0);
    // End:0x5C6
    if(bisThereAClearDirectFireAttackLane)
    {
        Outer.MedFlyerPawn.SetAimInfoForDirectFireStrike(EnemyForAttack.Location, EnemyForAttack, 0, currentZoneIn, Outer.MedFlyerPawn.TuneDataMedFlyer.HieghtOffTargetPointForDirectFire);
        return true;        
    }
    else
    {
        // End:0x609
        if(TotalNumOfAttemptsToFindDirectFireStrikeLaneThisEngagement <= 0)
        {
            Outer.MedFlyerPawn.ResetRangedDirectFireStrikeZoneForCurrentAttack();
        }
        return false;
    }
    return false;
    //return ReturnValue;    
}

function FindValidLobStrikeLocation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x219
    if((TotalNumOfAttemptsToFindLobStrikeArcThisEngagement == 0) || Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZone >= 0)
    {
        // End:0x201
        if(IsThereAClearLobAttackLaneFromCurrentLocation())
        {
            // End:0xEA
            if(Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZone < 0)
            {
                ++TotalNumOfAttemptsToFindLobStrikeArcThisEngagement;
                ++NumOfAttemptsToFindAltLobStrikeArcThisEngagement;
                // End:0xEA
                if(!IsThereAClearLobAttackLaneFromCurrentLocation())
                {
                    ++NumOfAttemptsToFindAltLobStrikeArcThisEngagement;
                }
            }
            // End:0x1AA
            if(Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZone >= 0)
            {
                Outer.RangedFireLocationToStrikeFrom = Outer.MedFlyerPawn.LobStrikeLocValidationInfoList[TotalNumOfAttemptsToFindLobStrikeArcThisEngagement].LobFireLastPointToStrikeFrom;                
            }
            else
            {
                Outer.RangedFireLocationToStrikeFrom = Outer.MedFlyerPawn.Location;
            }
            return true;            
        }
        ++TotalNumOfAttemptsToFindLobStrikeArcThisEngagement;
        ++NumOfAttemptsToFindAltLobStrikeArcThisEngagement;
        return false;
    }
    // End:0x339
    if(NumOfAttemptsToFindAltLobStrikeArcThisEngagement < (GetMaxNumberOfPosibleAltLobStrikeCalcsForThisZone()))
    {
        // End:0x292
        if(IsThereAClearLobAttackLaneFromCurrentLocation())
        {
            Outer.RangedFireLocationToStrikeFrom = Outer.MedFlyerPawn.Location;
            return true;
        }
        ++TotalNumOfAttemptsToFindLobStrikeArcThisEngagement;
        ++NumOfAttemptsToFindAltLobStrikeArcThisEngagement;
        // End:0x339
        if(NumOfAttemptsToFindAltLobStrikeArcThisEngagement < (GetMaxNumberOfPosibleAltLobStrikeCalcsForThisZone()))
        {
            // End:0x321
            if(IsThereAClearLobAttackLaneFromCurrentLocation())
            {
                Outer.RangedFireLocationToStrikeFrom = Outer.MedFlyerPawn.Location;
                return true;
            }
            ++TotalNumOfAttemptsToFindLobStrikeArcThisEngagement;
            ++NumOfAttemptsToFindAltLobStrikeArcThisEngagement;
            return false;
        }
    }
    return FindValidTierOffsetFromOrbitSlotLobStrikeLocation();
    //return ReturnValue;    
}

function FindValidTierOffsetFromOrbitSlotLobStrikeLocation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL sideVecOffset, locToTestAsStartOfAttackLoc;
    local /*0x97E50000-0x00000000*/ private int ScaleFactor;
    local /*0x97E50000-0x00000000*/ private bool shiftUp;
    local /*0x97E50000-0x00000000*/ private float ammountToScale;
    local /*0x97E50000-0x00000000*/ private int horizontalShiftNo, verticalShiftNo;
    local /*0x97E50000-0x00000000*/ private @NULL locToUseAsTestCloseEnoughToOrbitToLookForTierOffsets, displacementToLocationForRangeToOrbitCheck;
    local /*0x97E50000-0x00000000*/ private float rangeToLocationForRangeToOrbitCheck;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceLocation;

    // End:0xD1
    if(Outer.OrbitAccess != none)
    {
        ResourceLocation = SPAIResFlyLocation(Outer.OrbitAccess.GetResource());
        // End:0xA6
        if(ResourceLocation != none)
        {
            locToUseAsTestCloseEnoughToOrbitToLookForTierOffsets = ResourceLocation.GetWorldPosition();            
        }
        else
        {
            locToUseAsTestCloseEnoughToOrbitToLookForTierOffsets = EnemyForAttack.Location;
        }        
    }
    else
    {
        locToUseAsTestCloseEnoughToOrbitToLookForTierOffsets = EnemyForAttack.Location;
    }
    displacementToLocationForRangeToOrbitCheck = locToUseAsTestCloseEnoughToOrbitToLookForTierOffsets - Outer.MedFlyerPawn.Location;
    rangeToLocationForRangeToOrbitCheck = VSize(displacementToLocationForRangeToOrbitCheck);
    // End:0x1B8
    if(rangeToLocationForRangeToOrbitCheck > Outer.MedFlyerPawn.TuneDataMedFlyer.MinRangeFromOrbitBeforeLookingForTierOffsetStrikeLocations)
    {
        ResetFindRangedFireCounters();
        return false;
    }
    shiftUp = false;
    // End:0x1E3
    if((NumOfAttemptsToFindPreCalcedLobStrikeLocationThisEngagement % 2) == 0)
    {
        shiftUp = true;
    }
    horizontalShiftNo = int(float(NumOfAttemptsToFindPreCalcedLobStrikeLocationThisEngagement) % Outer.MedFlyerPawn.TuneDataMedFlyer.NumOfLobStrikeLocationsToLookForAtEachRange);
    verticalShiftNo = int((float(NumOfAttemptsToFindPreCalcedLobStrikeLocationThisEngagement) / Outer.MedFlyerPawn.TuneDataMedFlyer.NumOfLobStrikeLocationsToLookForAtEachRange) % float(Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByTier.Length));
    // End:0x392
    if(Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisTier >= 0)
    {
        verticalShiftNo = Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisTier;
    }
    ScaleFactor = (horizontalShiftNo + 1) / 2;
    ammountToScale = float(ScaleFactor) * Outer.MedFlyerPawn.TuneDataMedFlyer.HorizontalSeperationBetweenPointsForLobStrike;
    ammountToScale = ((shiftUp) ? ammountToScale : -ammountToScale);
    // End:0x4AE
    if(ammountToScale != float(0))
    {
        sideVecOffset = Class'SPEngine.SPUtil'.static.GetRightVector(Outer.MedFlyerPawn);
        sideVecOffset = sideVecOffset * ammountToScale;
    }
    locToTestAsStartOfAttackLoc = Outer.MedFlyerPawn.Location + sideVecOffset;
    // End:0x535
    if(ValidateThisAsLobStrikeLocation(locToTestAsStartOfAttackLoc, verticalShiftNo, Outer.RangedFireLocationToStrikeFrom))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

event FindValidDirectFireStrikeLocation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL sideVecOffset, locToTestAsStartOfAttackLoc;
    local /*0x97E50000-0x00000000*/ private int ScaleFactor;
    local /*0x97E50000-0x00000000*/ private bool shiftUp;
    local /*0x97E50000-0x00000000*/ private float ammountToScale;
    local /*0x97E50000-0x00000000*/ private int horizontalShiftNo, verticalShiftNo;

    shiftUp = false;
    // End:0x1F0
    if((TotalNumOfAttemptsToFindDirectFireStrikeLaneThisEngagement == 0) || Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZone >= 0)
    {
        // End:0x1E5
        if(IsThereAClearDirectFireAttackLaneFromCurrentLocation())
        {
            // End:0xD1
            if(Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZone < 0)
            {
                ++TotalNumOfAttemptsToFindDirectFireStrikeLaneThisEngagement;
            }
            // End:0x191
            if(Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZone >= 0)
            {
                Outer.RangedFireLocationToStrikeFrom = Outer.MedFlyerPawn.DirectFireStrikeLocValidationInfoList[TotalNumOfAttemptsToFindDirectFireStrikeLaneThisEngagement].LobFireLastPointToStrikeFrom;                
            }
            else
            {
                Outer.RangedFireLocationToStrikeFrom = Outer.MedFlyerPawn.Location;
            }
            return true;
        }
        ++TotalNumOfAttemptsToFindDirectFireStrikeLaneThisEngagement;
    }
    // End:0x20F
    if((NumOfAttemptsToFindPreCalcedLobStrikeLocationThisEngagement % 2) == 0)
    {
        shiftUp = true;
    }
    horizontalShiftNo = int(float(NumOfAttemptsToFindPreCalcedLobStrikeLocationThisEngagement) % Outer.MedFlyerPawn.TuneDataMedFlyer.NumOfLobStrikeLocationsToLookForAtEachRange);
    verticalShiftNo = int((float(NumOfAttemptsToFindPreCalcedLobStrikeLocationThisEngagement) / Outer.MedFlyerPawn.TuneDataMedFlyer.NumOfLobStrikeLocationsToLookForAtEachRange) % float(Outer.MedFlyerPawn.TuneDataMedFlyer.RangedDirectFireStrikeInfoByTier.Length));
    // End:0x3BE
    if(Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisTier >= 0)
    {
        verticalShiftNo = Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisTier;
    }
    ScaleFactor = (horizontalShiftNo + 1) / 2;
    ammountToScale = float(ScaleFactor) * Outer.MedFlyerPawn.TuneDataMedFlyer.HorizontalSeperationBetweenPointsForLobStrike;
    ammountToScale = ((shiftUp) ? ammountToScale : -ammountToScale);
    // End:0x4DA
    if(ammountToScale != float(0))
    {
        sideVecOffset = Class'SPEngine.SPUtil'.static.GetRightVector(Outer.MedFlyerPawn);
        sideVecOffset = sideVecOffset * ammountToScale;
    }
    locToTestAsStartOfAttackLoc = Outer.MedFlyerPawn.Location + sideVecOffset;
    // End:0x561
    if(ValidateThisAsDirectFireStrikeLocation(locToTestAsStartOfAttackLoc, verticalShiftNo, Outer.RangedFireLocationToStrikeFrom))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

event GetMaxNumberOfPosibleLobStrikeCalcsForThisSlotAndZone()
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
        currentZoneIn = Outer.MedFlyerPawn.FindCurrentLobFromAnywhereZone(EnemyForAttack);
    }
    // End:0x14C
    if(currentZoneIn >= 0)
    {
        numOfAltArcForThisZone = Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByZone[currentZoneIn].AltDesiredZPercentOfLobList.Length;
    }
    return (Outer.TotalNumberOfPossibileLobFireLocationsPerOrbitSlot + numOfAltArcForThisZone) - 1;
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
        currentZoneIn = Outer.MedFlyerPawn.FindCurrentLobFromAnywhereZone(EnemyForAttack);
    }
    // End:0x14C
    if(currentZoneIn >= 0)
    {
        numOfAltArcForThisZone = Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByZone[currentZoneIn].AltDesiredZPercentOfLobList.Length;
    }
    return numOfAltArcForThisZone;
    //return ReturnValue;    
}

function ShouldTryRangeLobAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private float timeSinceFindingValidLobAttackOption, howOfftenToRestartSearchingForValidAttackOptions;

    // End:0x51
    if(Outer.MedFlyerPawn.TuneDataMedFlyer.bNotAllowedToRangeLobAttack)
    {
        return false;        
    }
    else
    {
        // End:0x199
        if(Outer.MedFlyerPawn.TuneDataMedFlyer.bDoOnlyForcedRangeLobAttack)
        {
            Outer.RangedFireLocationToStrikeFrom = Outer.MedFlyerPawn.Location;
            Outer.MedFlyerPawn.SetAimInfoForRangedLobStrike(EnemyForAttack.Location, EnemyForAttack, 0, 0, Outer.MedFlyerPawn.TuneDataMedFlyer.HieghtOffTargetPointForEndOfLobFireArc);
            return true;            
        }
        else
        {
            // End:0x1C0
            if(Outer.bBonzi)
            {
                return false;                
            }
            else
            {
                // End:0x211
                if(Outer.MedFlyerPawn.TuneDataMedFlyer.bDoOnlyForcedFullPhysicalAttack)
                {
                    return false;                    
                }
                else
                {
                    // End:0x262
                    if(Outer.MedFlyerPawn.TuneDataMedFlyer.bDoOnlyForcedRamAttack)
                    {
                        return false;                        
                    }
                    else
                    {
                        // End:0x292
                        if(Outer.WantsToDoStruggleMode(EnemyForAttack))
                        {
                            return false;                            
                        }
                        else
                        {
                            // End:0x2E3
                            if(Outer.MedFlyerPawn.TuneDataMedFlyer.bForceFlyerNotToAttack)
                            {
                                return false;                                
                            }
                            else
                            {
                                // End:0x34B
                                if(Outer.MedFlyerPawn.TuneDataMedFlyer.bCanDoLobProjectileAttack.GetValue() == float(0))
                                {
                                    return false;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    howOfftenToRestartSearchingForValidAttackOptions = Outer.GetHowOfftenToRestartSearchingForValidAttackOptions();
    timeSinceFindingValidLobAttackOption = Outer.WorldInfo.TimeSeconds - LastTimeFoundValidEngagementRangeLobAttack;
    // End:0x556
    if(timeSinceFindingValidLobAttackOption > howOfftenToRestartSearchingForValidAttackOptions)
    {
        // End:0x3EC
        if(!bHasStrikeDataBeenResetYetForThisThisEngagement)
        {
            ResetFindRangedFireCounters();
        }
        // End:0x553
        if(Outer.IsPawnInsideMaxRangedStrikeZone(EnemyForAttack))
        {
            // End:0x439
            if(TotalNumOfAttemptsToFindLobStrikeArcThisEngagement >= (GetMaxNumberOfPosibleLobStrikeCalcsForThisSlotAndZone()))
            {
                ResetFindRangedFireCounters();
            }
            iter = 0;
            J0x444:

            // End:0x550 [Loop If]
            if(float(iter) < Outer.MedFlyerPawn.TuneDataMedFlyer.MaxNumOfAttemptsToFindLobStrikeLocationDuringAnUpdate.GetValue())
            {
                ++TotalNumOfAttemptsToFindLobStrikeArcThisEngagement;
                ++NumOfAttemptsToFindPreCalcedLobStrikeLocationThisEngagement;
                // End:0x520
                if(FindValidLobStrikeLocation())
                {
                    LastTimeFoundValidEngagementRangeLobAttack = Outer.WorldInfo.TimeSeconds;
                    bHasStrikeDataBeenResetYetForThisThisEngagement = false;
                    return true;
                }
                // End:0x542
                if(TotalNumOfAttemptsToFindLobStrikeArcThisEngagement >= (GetMaxNumberOfPosibleLobStrikeCalcsForThisSlotAndZone()))
                {
                    ResetFindRangedFireCounters();
                }
                ++iter;
                // [Loop Continue]
                goto J0x444;
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

function ShouldTryFullPhysicalAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float timeSinceFindingValidPhysicalAttackOption, howOfftenToRestartSearchingForValidAttackOptions;
    local /*0x97E50000-0x00000000*/ private @NULL targetsLocation;

    // End:0x51
    if(Outer.MedFlyerPawn.TuneDataMedFlyer.bDoOnlyForcedFullPhysicalAttack)
    {
        return true;        
    }
    else
    {
        // End:0x78
        if(Outer.bBonzi)
        {
            return false;            
        }
        else
        {
            // End:0xC9
            if(Outer.MedFlyerPawn.TuneDataMedFlyer.bDoOnlyForcedRangeLobAttack)
            {
                return false;                
            }
            else
            {
                // End:0x11A
                if(Outer.MedFlyerPawn.TuneDataMedFlyer.bDoOnlyForcedRamAttack)
                {
                    return false;                    
                }
                else
                {
                    // End:0x16A
                    if(Outer.WantsToDoStruggleMode(EnemyForAttack))
                    {
                        Outer.EnableStruggleAttackGlow(true);
                        return true;                        
                    }
                    else
                    {
                        // End:0x1BB
                        if(Outer.MedFlyerPawn.TuneDataMedFlyer.bForceFlyerNotToAttack)
                        {
                            return false;                            
                        }
                        else
                        {
                            // End:0x223
                            if(Outer.MedFlyerPawn.TuneDataMedFlyer.bCanDoDirectPhysicalAttack.GetValue() == float(0))
                            {
                                return false;
                            }
                        }
                    }
                }
            }
        }
    }
    // End:0x325
    if((EnemyForAttack != none) && EnemyForAttack.IsInCover())
    {
        // End:0x2C1
        if(Outer.MedFlyerPawn.TuneDataMedFlyer.bCanNotDoDirectPhysicalAttackToTargetInCoverEver.GetValue() != float(0))
        {
            return false;            
        }
        else
        {
            // End:0x325
            if(EnemyForAttack.IsHiddenByCover(Normal(EnemyForAttack.Location - MyPawn.Location)))
            {
                return false;
            }
        }
    }
    howOfftenToRestartSearchingForValidAttackOptions = Outer.GetHowOfftenToRestartSearchingForValidAttackOptions();
    timeSinceFindingValidPhysicalAttackOption = Outer.WorldInfo.TimeSeconds - LastTimeFoundValidEngagementFullPhysicalAttack;
    // End:0x4C9
    if(timeSinceFindingValidPhysicalAttackOption > howOfftenToRestartSearchingForValidAttackOptions)
    {
        targetsLocation = EnemyForAttack.Location;
        // End:0x4C6
        if(Outer.IsFullPhysicalAttackAllowed())
        {
            // End:0x4C3
            if(Outer.CanFlyToThisLocation(targetsLocation, Outer.MedFlyerPawn.TuneDataMedFlyer.MaxRangeForMovementNodeToFindForSwoopStingStrike.GetValue()))
            {
                LastTimeFoundValidEngagementFullPhysicalAttack = Outer.WorldInfo.TimeSeconds;
                return true;                
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

function ShouldTryRamAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

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
    // End:0x41
    if(EnemyForAttack.InStruggleMode)
    {
        return false;
    }
    // End:0x7B
    if(Outer.AmAdHocSquadLeader())
    {
        // End:0x7B
        if(GiveThisAttackToFollower(TypeOfAttack))
        {
            return true;
        }
    }
    // End:0x9D
    if(int(TypeOfAttack) == int(2))
    {
        return OnEngagementAttackOptionMedRangeLobAttackApproved();        
    }
    else
    {
        // End:0xBF
        if(int(TypeOfAttack) == int(13))
        {
            return OnEngagementAttackOptionFullPhysicalAttackApproved();            
        }
        else
        {
            // End:0xE1
            if(int(TypeOfAttack) == int(5))
            {
                return OnEngagementAttackOptionMedRangeDirectFireAttackApproved();                
            }
            else
            {
                // End:0x100
                if(int(TypeOfAttack) == int(21))
                {
                    return OnEngagementAttackOptionRamAttackApproved();
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function GiveThisAttackToFollower()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    // End:0x2E1
    if((Outer.MyAdHocSquadMemberData != none) && Outer.MyAdHocSquadMemberData.CurrentSquadIn != none)
    {
        iter = 0;
        J0x6A:

        // End:0x2E1 [Loop If]
        if(iter < Outer.MyAdHocSquadMemberData.CurrentSquadIn.SquadMembers.Length)
        {
            // End:0x2D3
            if(Outer.MyAdHocSquadMemberData.CurrentSquadIn.SquadMembers[iter].AiCtrlOwner != Outer)
            {
                // End:0x2D3
                if(Outer.MyAdHocSquadMemberData.CurrentSquadIn.SquadMembers[iter].AiCtrlOwner.CanFollowerBeGivingThisTypeOfAttack(TypeOfAttack))
                {
                    PrepFollowerForThisTypeOfAttack(LPAIControllerMedFlyer(Outer.MyAdHocSquadMemberData.CurrentSquadIn.SquadMembers[iter].AiCtrlOwner), TypeOfAttack);
                    // End:0x2D0
                    if(Outer.MyAdHocSquadMemberData.CurrentSquadIn.SquadMembers[iter].AiCtrlOwner.OnEngagementAttackOptionApproved(TypeOfAttack))
                    {
                        return true;                        
                    }                    
                }
            }
            ++iter;
            // [Loop Continue]
            goto J0x6A;
        }
    }
    return false;
    //return ReturnValue;    
}

function CanFollowerBeGivingThisTypeOfAttack()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(CurrentAttackCmd != none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function PrepFollowerForThisTypeOfAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL FollowerCtrl[8388609];
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x39
    if(int(TypeOfAttack) == int(2))
    {
        LastTimeFoundValidEngagementRangeLobAttack = -1.0000000;
        PrepFollowerForMedRangeLobAttack(FollowerCtrl);        
    }
    else
    {
        // End:0x72
        if(int(TypeOfAttack) == int(13))
        {
            LastTimeFoundValidEngagementFullPhysicalAttack = -1.0000000;
            PrepFollowerForFullPhysicalAttack(FollowerCtrl);            
        }
        else
        {
            // End:0xAB
            if(int(TypeOfAttack) == int(5))
            {
                LastTimeFoundValidEngagementRangeDirectFireAttack = -1.0000000;
                PrepFollowerForMedRangeDirectFireAttack(FollowerCtrl);                
            }
            else
            {
                // End:0xE4
                if(int(TypeOfAttack) == int(21))
                {
                    LastTimeFoundValidEngagementRamAttack = -1.0000000;
                    PrepFollowerForRamAttack(FollowerCtrl);                    
                }
                else
                {
                    return false;
                }
            }
        }
    }
    return true;
    //return ReturnValue;    
}

function IsCurrentlyEngagedInAltMortarAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3E
    if(LPAICmd_MortarAttackBase(CurrentAttackCmd) != none)
    {
        // End:0x3E
        if(Outer.AltToFormationLocPointToStrikeFromIndexInManager >= 0)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function OnEngagementAttackOptionMedRangeLobAttackApproved()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x19
    if(!HasAccessToStartAttackFromOrbitSlot())
    {
        GetStrikeAccessIfRequiredBeforeAttack();
    }
    // End:0x1CB
    if(HasAccessToStartAttackFromOrbitSlot())
    {
        // End:0x35
        if(IsCurrentlyEngagedInAltMortarAttack())
        {
            return false;
        }
        // End:0x1C4
        if(Outer.myAIPawn.GetRangedLobStrikeZoneForCurrentAttack() >= 0)
        {
            StopAbortAllOwnedCommands();
            // End:0x90
            if(StaticStalkStarted)
            {
                StopAreaDependentStalk();
            }
            TypeOfAttackToldToPerform = 2;
            // End:0x15C
            if(Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZone >= 0)
            {
                Outer.RangedFireLocationToStrikeFrom = Outer.MedFlyerPawn.LobStrikeLocValidationInfoList[TotalNumOfAttemptsToFindLobStrikeArcThisEngagement].LobFireLastPointToStrikeFrom;                
            }
            else
            {
                Outer.RangedFireLocationToStrikeFrom = Outer.MedFlyerPawn.Location;
            }
            GotoStateWithEnemyCheck('TryAttackFromHere');            
        }
        else
        {
            return false;
        }
        return true;        
    }
    return false;
    //return ReturnValue;    
}

function PrepFollowerForMedRangeLobAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL FollowerCtrl[8388609];

    // End:0x1CE
    if(((Outer.myAIPawn.GetRangedLobStrikeZoneForCurrentAttack() >= 0) && FollowerCtrl != none) && FollowerCtrl.MedFlyerPawn != none)
    {
        FollowerCtrl.RangedFireLocationToStrikeFrom = FollowerCtrl.MedFlyerPawn.Location;
        FollowerCtrl.MedFlyerPawn.SetAimInfoForRangedLobStrike(EnemyForAttack.Location, EnemyForAttack, Outer.MedFlyerPawn.GetRangedLobStrikeTierForCurrentAttack(), Outer.MedFlyerPawn.GetRangedLobStrikeZoneForCurrentAttack(), Outer.MedFlyerPawn.TuneDataMedFlyer.HieghtOffTargetPointForEndOfLobFireArc);
    }
    //return;    
}

function OnEngagementAttackOptionFullPhysicalAttackApproved()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x19
    if(!HasAccessToStartAttackFromOrbitSlot())
    {
        GetStrikeAccessIfRequiredBeforeAttack();
    }
    // End:0x91
    if(HasAccessToStartAttackFromOrbitSlot())
    {
        StopAbortAllOwnedCommands();
        // End:0x47
        if(StaticStalkStarted)
        {
            StopAreaDependentStalk();
        }
        TypeOfAttackToldToPerform = 13;
        // End:0x79
        if(IsInState('MoveToOrbitSlot'))
        {
            GotoStateWithEnemyCheck('TryAttackFromHere');            
        }
        else
        {
            GotoStateWithEnemyCheck('StartAttackFromOrbitSlot');
        }
        return true;        
    }
    return false;
    //return ReturnValue;    
}

function PrepFollowerForFullPhysicalAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL FollowerCtrl[8388609];

    return;
    //return;    
}

function OnEngagementAttackOptionRamAttackApproved()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x19
    if(!HasAccessToStartAttackFromOrbitSlot())
    {
        GetStrikeAccessIfRequiredBeforeAttack();
    }
    // End:0x91
    if(HasAccessToStartAttackFromOrbitSlot())
    {
        StopAbortAllOwnedCommands();
        // End:0x47
        if(StaticStalkStarted)
        {
            StopAreaDependentStalk();
        }
        TypeOfAttackToldToPerform = 21;
        // End:0x79
        if(IsInState('MoveToOrbitSlot'))
        {
            GotoStateWithEnemyCheck('TryAttackFromHere');            
        }
        else
        {
            GotoStateWithEnemyCheck('StartAttackFromOrbitSlot');
        }
        return true;        
    }
    return false;
    //return ReturnValue;    
}

function PrepFollowerForRamAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL FollowerCtrl[8388609];

    //return;    
}

function OnEngagementAttackOptionMedRangeDirectFireAttackApproved()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x19
    if(!HasAccessToStartAttackFromOrbitSlot())
    {
        GetStrikeAccessIfRequiredBeforeAttack();
    }
    // End:0x1CD
    if(HasAccessToStartAttackFromOrbitSlot())
    {
        StopAbortAllOwnedCommands();
        // End:0x47
        if(StaticStalkStarted)
        {
            StopAreaDependentStalk();
        }
        TypeOfAttackToldToPerform = 5;
        // End:0x1B5
        if(Outer.myAIPawn.GetDirectFireStrikeZoneForCurrentAttack() >= 0)
        {
            // End:0x14D
            if(Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZone >= 0)
            {
                Outer.RangedFireLocationToStrikeFrom = Outer.MedFlyerPawn.DirectFireStrikeLocValidationInfoList[TotalNumOfAttemptsToFindDirectFireStrikeLaneThisEngagement].LobFireLastPointToStrikeFrom;                
            }
            else
            {
                Outer.RangedFireLocationToStrikeFrom = Outer.MedFlyerPawn.Location;
            }
            GotoStateWithEnemyCheck('TryAttackFromHere');            
        }
        else
        {
            GotoStateWithEnemyCheck('StartAttackFromOrbitSlot');
        }
        return true;        
    }
    return false;
    //return ReturnValue;    
}

function PrepFollowerForMedRangeDirectFireAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL FollowerCtrl[8388609];

    // End:0x2D9
    if(((Outer.myAIPawn.GetDirectFireStrikeZoneForCurrentAttack() >= 0) && FollowerCtrl != none) && FollowerCtrl.MedFlyerPawn != none)
    {
        FollowerCtrl.RangedFireLocationToStrikeFrom = FollowerCtrl.MedFlyerPawn.Location;
        FollowerCtrl.MedFlyerPawn.SetAimInfoForRangedLobStrike(EnemyForAttack.Location, EnemyForAttack, Outer.MedFlyerPawn.GetRangedLobStrikeTierForCurrentAttack(), Outer.MedFlyerPawn.GetDirectFireStrikeZoneForCurrentAttack(), Outer.MedFlyerPawn.TuneDataMedFlyer.HieghtOffTargetPointForEndOfLobFireArc);
        FollowerCtrl.MedFlyerPawn.SetAimInfoForDirectFireStrike(EnemyForAttack.Location, EnemyForAttack, Outer.MedFlyerPawn.GetRangedLobStrikeTierForCurrentAttack(), Outer.MedFlyerPawn.GetDirectFireStrikeZoneForCurrentAttack(), Outer.MedFlyerPawn.TuneDataMedFlyer.HieghtOffTargetPointForDirectFire);
    }
    return;
    //return;    
}

function OnEngagementAttackOptionPurged()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];

    ResetFindRangedFireCounters();
    LastTimeFoundValidEngagementFullPhysicalAttack = -1.0000000;
    LastTimeFoundValidEngagementRamAttack = -1.0000000;
    //return;    
}

function ShouldAttackInsteadOfMovingToOrbitSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldStillAttackEvenAfterLosingOrbitAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ProcessLookForAnotherRangeLobAttackOpportunityFromCurrentLocation()
{
    local /*0x97E50000-0x00000000*/ private bool bForceChoice[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private float reAttackScaler;
    local /*0x97E50000-0x00000000*/ private bool bshouldAttackAgain;

    // End:0x166
    if(!Outer.IsFullPhysicalAttackAllowed() && IsThereClearLobAttackLaneFromGivenLoc(Outer.MedFlyerPawn.Location, Outer.MedFlyerPawn.GetRangedLobStrikeTierForCurrentAttack()))
    {
        reAttackScaler += Outer.MedFlyerPawn.TuneDataMedFlyer.ReattackDesirabilityOfAttackScaler.GetValue();
        AiAttackTypeProcessingAnotherAttackRequestFor = 2;
        bshouldAttackAgain = Outer.PublishNewAttackOptionToCombatManager(2, reAttackScaler, bForceChoice);
        AiAttackTypeProcessingAnotherAttackRequestFor = 0;
        return bshouldAttackAgain;
    }
    return false;
    //return ReturnValue;    
}

event ProcessLookForRangeLobAttackOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if(ShouldTryRangeLobAttack())
    {
        bWasLastLobAttackCheckValid = true;
        return Outer.PublishNewAttackOptionToCombatManager(2,, false);        
    }
    else
    {
        bWasLastLobAttackCheckValid = false;
    }
    return false;
    //return ReturnValue;    
}

function ProcessLookForAnotherRangeDirectFireAttackOpportunityFromCurrentLocation()
{
    local /*0x97E50000-0x00000000*/ private bool bForceChoice[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private float reAttackScaler;
    local /*0x97E50000-0x00000000*/ private bool bshouldAttackAgain;

    // End:0xFF
    if(!Outer.IsFullPhysicalAttackAllowed() && IsThereAClearDirectFireAttackLaneFromCurrentLocation())
    {
        reAttackScaler += Outer.MedFlyerPawn.TuneDataMedFlyer.ReattackDesirabilityOfAttackScaler.GetValue();
        AiAttackTypeProcessingAnotherAttackRequestFor = 5;
        bshouldAttackAgain = Outer.PublishNewAttackOptionToCombatManager(5, reAttackScaler, bForceChoice);
        AiAttackTypeProcessingAnotherAttackRequestFor = 0;
        return bshouldAttackAgain;
    }
    return false;
    //return ReturnValue;    
}

event ProcessLookForFullPhysicalAttackOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if(ShouldTryFullPhysicalAttack())
    {
        bWasLastFullPhysicalAttackCheckValid = true;
        return Outer.PublishNewAttackOptionToCombatManager(13,, false);        
    }
    else
    {
        bWasLastFullPhysicalAttackCheckValid = false;
    }
    return false;
    //return ReturnValue;    
}

function ProcessLookForFullPhysicalAttackOpportunityFromCurrentLocation()
{
    local /*0x97E50000-0x00000000*/ private bool bForceChoice[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private float reAttackScaler;
    local /*0x97E50000-0x00000000*/ private bool bshouldAttackAgain;

    // End:0xD8
    if(ShouldTryFullPhysicalAttack())
    {
        reAttackScaler += Outer.MedFlyerPawn.TuneDataMedFlyer.ReattackDesirabilityOfAttackScaler.GetValue();
        AiAttackTypeProcessingAnotherAttackRequestFor = 13;
        bshouldAttackAgain = Outer.PublishNewAttackOptionToCombatManager(13, reAttackScaler, bForceChoice);
        AiAttackTypeProcessingAnotherAttackRequestFor = 0;
        return bshouldAttackAgain;
    }
    return false;
    //return ReturnValue;    
}

event ProcessLookForRamAttackOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if(ShouldTryRamAttack())
    {
        bWasLastRamAttackCheckValid = true;
        return Outer.PublishNewAttackOptionToCombatManager(21,, false);        
    }
    else
    {
        bWasLastRamAttackCheckValid = false;
    }
    return false;
    //return ReturnValue;    
}

function ProcessLookForRamAttackOpportunityFromCurrentLocation()
{
    local /*0x97E50000-0x00000000*/ private bool bForceChoice[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private float reAttackScaler;
    local /*0x97E50000-0x00000000*/ private bool bshouldAttackAgain;

    // End:0xD8
    if(ShouldTryRamAttack())
    {
        reAttackScaler += Outer.MedFlyerPawn.TuneDataMedFlyer.ReattackDesirabilityOfAttackScaler.GetValue();
        AiAttackTypeProcessingAnotherAttackRequestFor = 21;
        bshouldAttackAgain = Outer.PublishNewAttackOptionToCombatManager(21, reAttackScaler, bForceChoice);
        AiAttackTypeProcessingAnotherAttackRequestFor = 0;
        return bshouldAttackAgain;
    }
    return false;
    //return ReturnValue;    
}

event RespondToTooMuchTimePassedWithNoAggressiveActivity()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResourceLocation;

    // End:0x1D4
    if((IsInState('FlyAttackFromHere') || IsInState('AttackFromOrbitWithClearence')) || IsInState('StalkFromOrbit'))
    {
        // End:0x1D4
        if((Outer.CurrentOrbitFormationResourceRef != none) && Outer.OrbitAccess != none)
        {
            ResourceLocation = SPAIResFlyLocation(Outer.OrbitAccess.GetResource());
            // End:0x1D4
            if(Outer.CurrentOrbitFormationResourceRef.NotifyFoundNotCombatViable(ResourceLocation, Outer.MedFlyerPawn, Outer, Outer.OrbitAccess))
            {
                Outer.ReleaseOrbitAccess();
                Outer.ResetTimeOfLastAttackEnded();
                StopPocessLookForAttackOpportunityTimer();
                Outer.NotifyCombatManagerToRetractAllOptionsForThisPublisher();
                TimeArrivedAtOrbitSlot = -1.0000000;
                GotoStateWithEnemyCheck('GetOrbitFormationClearence');
            }
        }
    }
    //return;    
}

function NotifyFormationLocationBecomingInvalid()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocBecomingInvalid[8388609];

    // End:0x11
    if(CurrentAttackCmd != none)
    {
        return;
    }
    Outer.ReleaseOrbitAccess();
    StopPocessLookForAttackOpportunityTimer();
    Outer.NotifyCombatManagerToRetractAllOptionsForThisPublisher();
    TimeArrivedAtOrbitSlot = -1.0000000;
    GotoStateWithEnemyCheck('GetOrbitFormationClearence');
    //return;    
}

function HandleNeedingToTellFormationMgrAboutFailedMoveToFlyLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResourceLocation;

    // End:0x134
    if(int(Outer.CmdStatus_MoveToPosition.Cmd_Move_Error) == int(4))
    {
        // End:0x134
        if((Outer.CurrentOrbitFormationResourceRef != none) && Outer.OrbitAccess != none)
        {
            ResourceLocation = SPAIResFlyLocation(Outer.OrbitAccess.GetResource());
            Outer.CurrentOrbitFormationResourceRef.NotifyNoPathToFlyLocation(ResourceLocation, Outer.MedFlyerPawn, Outer);
        }
    }
    //return;    
}

function NotifyReachedOrbitSlot()
{
    // End:0x4F
    if(!bNeedsToMoveBackToOrbitSlot)
    {
        TimeArrivedAtOrbitSlot = Outer.WorldInfo.TimeSeconds;        
    }
    else
    {
        bNeedsToMoveBackToOrbitSlot = false;
    }
    //return;    
}

function NotifyReachedAltToFormationLocPointToStrikeFrom()
{
    //return;    
}

function NofifyStartedMovingToOrbitSlot()
{
    // End:0x21
    if(!bNeedsToMoveBackToOrbitSlot)
    {
        TimeArrivedAtOrbitSlot = -1.0000000;        
    }
    //return;    
}

function MoveAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !IsMyEnemyAlive();
    //return ReturnValue;    
}

function MoveStrikeAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (MoveAbortCondition()) || !HasAccessToStartAttackFromOrbitSlot();
    //return ReturnValue;    
}

function MoveToOrbitSlotAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ResourceLocation;

    // End:0x0F
    if(MoveAbortCondition())
    {
        return true;
    }
    // End:0x130
    if((Outer.bOrbitPointMoved && MoveToPositionFlyCmd != none) && Outer.OrbitAccess != none)
    {
        ResourceLocation = SPAIResFlyLocation(Outer.OrbitAccess.GetResource());
        // End:0x130
        if(ResourceLocation != none)
        {
            OrbitSlotPosition = ResourceLocation.GetWorldPosition();
            MoveToPositionFlyCmd.SetDesiredDestination(OrbitSlotPosition);
            Outer.bOrbitPointMoved = false;
        }
    }
    // End:0x157
    if(!Outer.HaveOrbitAccess(true))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function MoveAltMortarLocAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(MoveAbortCondition())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HasMoveToStartOfAttackPointFailed()
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

function HasMoveToSlotFailed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if(int(Outer.CmdStatus_MoveToPosition.Cmd_Move_Error) >= int(3))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function WasMoveToSlotAborted()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if(int(Outer.CmdStatus_MoveToPosition.Cmd_Move_Error) >= int(5))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HasMoveToSlotSucceeded()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !IsManeuvering || int(Outer.CmdStatus_MoveToPosition.Cmd_Move_Error) == int(2);
    //return ReturnValue;    
}

function PopCommandWithMoveFaliure()
{
    LPAICmd_Attack_Status(3);
    Outer.PopCommand(self);
    //return;    
}

function PopCommandWithFaliure()
{
    LPAICmd_Attack_Status(1);
    Outer.PopCommand(self);
    //return;    
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

function NotifyOfFailedMovementToAttackPoint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x43
    if(MoveToPositionFlyCmd != none)
    {
        Outer.AbortCommand(MoveToPositionFlyCmd);
        MoveToPositionFlyCmd = none;
    }
    return true;
    //return ReturnValue;    
}

function CalculatePointToAttackFrom()
{
    local /*0x97E50000-0x00000000*/ private float AttackStartDistance[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL displacementToAttackPoint;

    displacementToAttackPoint = Outer.myAIPawn.Location - EnemyForAttack.Location;
    displacementToAttackPoint.Z = 0.0000000;
    displacementToAttackPoint = Normal(displacementToAttackPoint);
    displacementToAttackPoint = displacementToAttackPoint * AttackStartDistance;
    displacementToAttackPoint.Z = Outer.MedFlyerPawn.TuneDataMedFlyer.HeightFromGroundTargetIsOnForStartOfAttackInUU;
    PointToAttackFrom = displacementToAttackPoint + EnemyForAttack.Location;
    return false;
    //return ReturnValue;    
}

function HandlePossibleNeedToUsePursiutVelocityWhenManeuveringForAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function CleanUpPursiutVelocityWhenManeuveringForAttack()
{
    //return;    
}

function ManeuverForAttack()
{
    local /*0x97E50000-0x00000000*/ private float AttackSeperationMin[8388609], AttackSeperationMax, PitchAngleFromTargetForManeuverInDegrees;
    local /*0x97E50000-0x00000000*/ private bool CheckForStrikeAccess[9437185];
    local /*0x97E50000-0x00000000*/ private float Seperation;

    false
    // End:0x37E
    if(IsMyEnemyAlive())
    {
        Seperation = EnemySeperation2D();
        // End:0x312
        if(Seperation > AttackSeperationMax)
        {
            CalculatePointToAttackFrom(AttackSeperationMin);
            HandlePossibleNeedToUsePursiutVelocityWhenManeuveringForAttack();
            Outer.Focus = none;
            CurMoveToActorCmd = Outer.CmdMoveToActorFly(EnemyForAttack, none, AttackSeperationMin, PitchAngleFromTargetForManeuverInDegrees, 10.0000000, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfMoveToStrike);
            CurMoveToActorCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
            CurMoveToActorCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
            CurMoveToActorCmd.bZeroVelocityOnFinish = true;
            // End:0x303
            if(Outer.myAIPawn.TuneDataAIPawn.bUseMovementProgressMonitorForAllAttackRunInsBeforeStrike)
            {
                CurMoveToActorCmd.SetMovementMonitorParameters(true, Outer.myAIPawn.TuneDataAIPawn.DurationBetweenMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.MinMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.DelayAfterStartOfAttackRunInBeforeStrikeBeforeMonitorStarts, NotifyOfFailedMovementToAttackPoint);
            }
            IsManeuvering = true;            
        }
        else
        {
            Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 0;
            Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
        }
    }
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

function GetStopTypeForMoveToOrbitSlot()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return Outer.myAIPawn.TuneDataAIPawn.StopTypeForMoveToMeleeSlot;
    //return ReturnValue;    
}

function GetRangeToOrbitSlot()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ResourceMultiLocation, ResourceLocation;

    // End:0x199
    if(Outer.OrbitAccess != none)
    {
        ResourceLocation = SPAIResLocation(Outer.OrbitAccess.GetResource());
        // End:0x12F
        if(ResourceLocation == none)
        {
            ResourceMultiLocation = LPAIResMultiLocation(Outer.OrbitAccess.GetResource());
            // End:0x12C
            if(ResourceMultiLocation != none)
            {
                OrbitSlotPosition = ResourceMultiLocation.GetNearestWorldPosition(Outer.myAIPawn.Location);
            }            
        }
        else
        {
            OrbitSlotPosition = ResourceLocation.GetWorldPosition();
        }
        return VSize(OrbitSlotPosition - Outer.MedFlyerPawn.Location);
    }
    return float(2147483647);
    //return ReturnValue;    
}

function HandlePossibleNeedToUsePursiutVelocityWhenMovingToOrbitSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function CleanUpPursiutVelocityWhenMovingToOrbitSlot()
{
    //return;    
}

function ManeuverToSlot()
{
    local /*0x97E50000-0x00000000*/ private @NULL Access[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedSubPos[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ResourceLocation;
    local /*0x97E50000-0x00000000*/ private float ReachDistance;
    local /*0x97E50000-0x00000000*/ private bool bCanMove;

    -1
    bCanMove = false;
    Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 0;
    Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
    // End:0xC4
    if(MoveToPositionFlyCmd != none)
    {
        Outer.AbortCommand(MoveToPositionFlyCmd);
        MoveToPositionFlyCmd = none;
    }
    // End:0x172
    if(Access != none)
    {
        ResourceLocation = SPAIResFlyLocation(Access.GetResource());
        // End:0x172
        if(ResourceLocation != none)
        {
            ReachDistance = ResourceLocation.ReachDistance();
            OrbitSlotPosition = ResourceLocation.GetWorldPosition();
            bCanMove = true;
        }
    }
    // End:0x34E
    if(bCanMove)
    {
        MovingToActor = false;
        // End:0x33F
        if(IsMyEnemyAlive())
        {
            // End:0x333
            if(!ShouldAttackInsteadOfMovingToOrbitSlot())
            {
                HandlePossibleNeedToUsePursiutVelocityWhenMovingToOrbitSlot();
                NofifyStartedMovingToOrbitSlot();
                MoveToPositionFlyCmd = Outer.CmdMoveToPositionFly(OrbitSlotPosition, EnemyForAttack, ReachDistance, Outer.CmdStatus_MoveToPosition, 1, GetStopTypeForMoveToOrbitSlot());
                MoveToPositionFlyCmd.__MoveAbortDelegate__Delegate = MoveToOrbitSlotAbortCondition;
                MoveToPositionFlyCmd.bZeroVelocityOnFinish = false;
                MoveToPositionFlyCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
                MoveToPositionFlyCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
                // End:0x313
                if(ShouldFaceEnemyWhileMovingToSlot())
                {
                    Outer.Focus = EnemyForAttack;                    
                }
                else
                {
                    Outer.Focus = none;
                }
            }
            IsManeuvering = true;
        }
        IsManeuvering = false;        
    }
    else
    {
        Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
        Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 2;
    }
    StartPocessLookForAttackOpportunityTimer();
    //return;    
}

function MoveToMortarAsAlternateAttackLocation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float rangeToAttackLoc, maxRangeFormRangedFirePointBeforeAllowedToFire;

    // End:0x3CD
    if((EnemyForAttack != none) && Outer.AltToFormationLocPointToStrikeFromIndexInManager >= 0)
    {
        rangeToAttackLoc = VSize(Outer.AltToFormationLocMotarPointToStrikeFrom - Outer.MedFlyerPawn.Location);
        maxRangeFormRangedFirePointBeforeAllowedToFire = Outer.GetMaxRangeFromMortarAlternateRangedFirePointBeforeAllowedToFire();
        // End:0x35F
        if(rangeToAttackLoc > maxRangeFormRangedFirePointBeforeAllowedToFire)
        {
            MoveToPositionFlyCmd = Outer.CmdMoveToPositionFly(Outer.AltToFormationLocMotarPointToStrikeFrom,, maxRangeFormRangedFirePointBeforeAllowedToFire - float(10), Outer.CmdStatus_MoveToPosition, 1, GetStopTypeForMoveToOrbitSlot());
            MoveToPositionFlyCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
            MoveToPositionFlyCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
            MoveToPositionFlyCmd.__MoveAbortDelegate__Delegate = MoveAltMortarLocAbortCondition;
            MoveToPositionFlyCmd.bZeroVelocityOnFinish = true;
            // End:0x35C
            if(Outer.myAIPawn.TuneDataAIPawn.bUseMovementProgressMonitorForAllAttackRunInsBeforeStrike)
            {
                MoveToPositionFlyCmd.SetMovementMonitorParameters(true, Outer.myAIPawn.TuneDataAIPawn.DurationBetweenMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.MinMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.DelayAfterStartOfAttackRunInBeforeStrikeBeforeMonitorStarts, NotifyOfFailedMoveToMortarAsAlternateAttackLocation);
            }            
        }
        else
        {
            Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 0;
            Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

function NotifyOfFailedMoveToMortarAsAlternateAttackLocation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x43
    if(MoveToPositionFlyCmd != none)
    {
        Outer.AbortCommand(MoveToPositionFlyCmd);
        MoveToPositionFlyCmd = none;
    }
    return true;
    //return ReturnValue;    
}

final function StartPocessLookForAttackOpportunityTimer()
{
    local /*0x97E50000-0x00000000*/ private bool isTimerAlreadyRunning;

    isTimerAlreadyRunning = IsPocessLookForAttackOpportunityTimerActive();
    // End:0xE0
    if(!Outer.bDisableAI && !isTimerAlreadyRunning)
    {
        // End:0xDD
        if(!ProcessLookForAttackOpportunity())
        {
            Outer.SetTimer(Outer.MedFlyerPawn.TuneDataMedFlyer.UpdateRateForTacticalOrbitsPocessLookForAttackOpportunity.GetValue(), true, 'PocessLookForAttackOpportunityTimer', self);            
        }        
    }
    //return;    
}

final event StopPocessLookForAttackOpportunityTimer()
{
    Outer.ClearTimer('PocessLookForAttackOpportunityTimer', self);
    // End:0x55
    if(Outer.IsTimerActive('PocessLookForAttackOpportunityTimer', self))
    {
    }
    //return;    
}

function PausePocessLookForAttackOpportunityTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopPocessLookForAttackOpportunityTimer();        
    }
    else
    {
        StartPocessLookForAttackOpportunityTimer();
    }
    //return;    
}

final function IsPocessLookForAttackOpportunityTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('PocessLookForAttackOpportunityTimer', self);
    //return ReturnValue;    
}

private final function PocessLookForAttackOpportunityTimer()
{
    ProcessLookForAttackOpportunity();
    //return;    
}

function HasAccessToStartAttackFromOrbitSlot()
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

function HandlePassingToCloseToEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL Access[8388609];

    //return;    
}

function StartAreaDependentStalk()
{
    StaticStalkStarted = true;
    // End:0x33
    if(LPAIPawnVSISS(EnemyForAttack) != none)
    {
        bUseTightAreaStalk = true;        
    }
    else
    {
        // End:0xA8
        if(Outer.AmInAdHocSquad() && !Outer.AmAdHocSquadLeader())
        {
            bUseTightAreaStalk = Outer.GetIfLeaderThinksInTightMovementArea();            
        }
        else
        {
            bUseTightAreaStalk = Outer.IsFlyerInTightMovementArea();
        }
    }
    // End:0x133
    if(bUseTightAreaStalk)
    {
        Outer.MedFlyerPawn.DoSpecialMove(TightAreaFlyerStalkSmClass, true, false, None, none);        
    }
    else
    {
        Outer.MedFlyerPawn.DoSpecialMove(OpenAreaFlyerStalkSmClass, true, false, None, none);
    }
    //return;    
}

function StaticOrbitStalk_StartSM()
{
    // End:0x19
    if(!StaticStalkStarted)
    {
        StartAreaDependentStalk();
    }
    //return;    
}

function StaticOrbitStalk_StopSM()
{
    // End:0x17
    if(StaticStalkStarted)
    {
        StopAreaDependentStalk();
    }
    //return;    
}

function PerformFlyerReactionPhysicalAttackCmd()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToPerformRactiveAttackOn[8388609];

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
    SetOrbitExtents();
    J0x29:

    // End:0x47 [Loop If]
    if(IsMyEnemyAlive())
    {
        GotoState('MoveCloserToEnemysOrbit');
        // [Loop Continue]
        goto J0x29;
    }
    Outer.PopCommand(self);
    stop;                    
}

state MoveToActor
{
    event NotifyAIResourceAccessLost()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x56
        if(ResourceAccess == Outer.OrbitAccess)
        {
            StopAbortAllOwnedCommands();
            Outer.OrbitAccess = none;
        }
        return false;
        //return ReturnValue;        
    }
    stop;    
}

state MoveCloserToEnemysOrbit extends MoveToActor
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        CleanUpPursiutVelocityWhenManeuveringForAttack();
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    event PoppedState()
    {
        CleanUpPursiutVelocityWhenManeuveringForAttack();
        super(SPStateObject).PoppedState();
        //return;        
    }
Begin:

    // End:0x37
    if(bCanStrikeBeforeReachingOrbitSlot)
    {
        GetStrikeAccessIfRequiredBeforeAttack();
        // End:0x37
        if(HasAccessToStartAttackFromOrbitSlot())
        {
            GotoStateWithEnemyCheck('BeginAttackFromOrbit');
        }
    }
    ManeuverForAttack((OrbitPatternRadius + Outer.MedFlyerPawn.TuneDataMedFlyer.RangeFromOrbitForStartOfAttackInUU) + (Outer.MyKynapseRadius * float(3)), (OrbitPatternRadius + Outer.MedFlyerPawn.TuneDataMedFlyer.RangeFromOrbitForStartOfAttackInUU) + (Outer.MyKynapseRadius * float(4)), Outer.MedFlyerPawn.TuneDataMedFlyer.PitchAngleFromTargetForStartOfAttackInDegrees);
    CleanUpPursiutVelocityWhenManeuveringForAttack();
    // End:0x19D
    if(HasMoveToStartOfAttackPointFailed())
    {
        PopCommandWithMoveFaliure();
    }
    // End:0x1D4
    if(bCanStrikeBeforeReachingOrbitSlot)
    {
        GetStrikeAccessIfRequiredBeforeAttack();
        // End:0x1D4
        if(HasAccessToStartAttackFromOrbitSlot())
        {
            GotoStateWithEnemyCheck('BeginAttackFromOrbit');
        }
    }
    GotoStateWithEnemyCheck('GetOrbitFormationClearence');
    stop;                    
}

state GetOrbitFormationClearence
{
    function GotoOrbitSlot()
    {
        GotoStateWithEnemyCheck('MoveToOrbitSlot');
        //return;        
    }

    function GotoMoveToAltToFormationLocPointToStrikeFrom()
    {
        GotoStateWithEnemyCheck('MoveToAltToFormationLocPointToStrikeFrom');
        //return;        
    }

    function GotoWaitForOrbitSlot()
    {
        GotoStateWithEnemyCheck('WaitForOrbitClearence');
        //return;        
    }
Begin:

    Outer.ReleaseStrikeAccess();
    Outer.ReleaseFeintAccess();
    // End:0x99
    if(!Outer.HaveOrbitAccess())
    {
        Outer.GetOrbitAccess(EnemyForAttack);
        SetOrbitExtents();        
    }
    // End:0xE6
    if(Outer.HaveOrbitAccess())
    {
        Outer.Sleep(0.0000000);
        GotoOrbitSlot();        
    }
    else
    {
        // End:0x134
        if(Outer.AltToFormationLocPointToStrikeFromIndexInManager >= 0)
        {
            Outer.Sleep(0.0000000);
            GotoMoveToAltToFormationLocPointToStrikeFrom();            
        }
        else
        {
            GotoWaitForOrbitSlot();
        }
    }
    stop;        
}

state GetOrbitFormationClearenceOnFormationChange extends GetOrbitFormationClearence
{
    function GotoOrbitSlot()
    {
        GotoStateWithEnemyCheck('MoveToOrbitSlotOnFormationChange');
        //return;        
    }

    function GotoWaitForOrbitSlot()
    {
        GotoStateWithEnemyCheck('WaitForOrbitClearence');
        //return;        
    }
    stop;    
}

state MoveToOrbitSlot extends MoveToActor
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function AttemptStrikeAccess()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x26
        if(bCanStrikeBeforeReachingOrbitSlot)
        {
            GetStrikeAccessIfRequiredBeforeAttack();
            // End:0x26
            if(HasAccessToStartAttackFromOrbitSlot())
            {
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }

    function ReGetOrbitAccess()
    {
        GotoStateWithEnemyCheck('GetOrbitFormationClearence');
        //return;        
    }

    function DoneWithManeuverToSlot()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        MoveToPositionFlyCmd = none;
        CleanUpPursiutVelocityWhenMovingToOrbitSlot();
        return true;
        //return ReturnValue;        
    }
Begin:

    Outer.Sleep(0.0100000);
    // End:0x4C
    if(!Outer.HaveOrbitAccess())
    {
        ReGetOrbitAccess();
    }
    // End:0x185
    if(!AttemptStrikeAccess())
    {
        ManeuverToSlot(Outer.OrbitAccess);
        // End:0x178
        if(DoneWithManeuverToSlot())
        {
            // End:0xED
            if(!Outer.HaveOrbitAccess())
            {
                // End:0xE0
                if(WasMoveToSlotAborted())
                {
                    StopPocessLookForAttackOpportunityTimer();
                    GotoStateWithEnemyCheck('GetOrbitFormationClearence');
                }
                ReGetOrbitAccess();                
            }
            else
            {
                // End:0x162
                if(HasMoveToSlotFailed())
                {
                    HandleNeedingToTellFormationMgrAboutFailedMoveToFlyLocation();
                    // End:0x136
                    if(!Outer.HaveOrbitAccess())
                    {
                        ReGetOrbitAccess();                        
                    }
                    else
                    {
                        Outer.ReleaseOrbitAccess();
                        ReGetOrbitAccess();
                    }                    
                }
            }
            GotoStateWithEnemyCheck('ReachedOrbitSlot');            
        }
        else
        {
            goto 'Begin';
        }        
    }
    else
    {
        GotoStateWithEnemyCheck('BeginAttackFromOrbit');
    }
    stop;                
}

state MoveToAltToFormationLocPointToStrikeFrom extends MoveToActor
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function DoneWithMoveToMortarAsAlternateAttackLocation()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        MoveToPositionFlyCmd = none;
        CleanUpPursiutVelocityWhenMovingToOrbitSlot();
        return true;
        //return ReturnValue;        
    }
Begin:

    Outer.Sleep(0.0100000);
    // End:0xB5
    if(Outer.AltToFormationLocPointToStrikeFromIndexInManager >= 0)
    {
        MoveToMortarAsAlternateAttackLocation();
        // End:0xA8
        if(DoneWithMoveToMortarAsAlternateAttackLocation())
        {
            // End:0x92
            if(Outer.AltToFormationLocPointToStrikeFromIndexInManager < 0)
            {
                GotoStateWithEnemyCheck('GetOrbitFormationClearence');                
            }
            GotoStateWithEnemyCheck('ReachedAltToFormationLocPointToStrikeFrom');            
        }
        else
        {
            goto 'Begin';
        }        
    }
    else
    {
        GotoStateWithEnemyCheck('GetOrbitFormationClearence');
    }
    stop;                
}

state MoveToOrbitSlotOnFormationChange extends MoveToOrbitSlot
{
    function GetStopTypeForMoveToOrbitSlot()
    {
        local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

        return Outer.myAIPawn.TuneDataAIPawn.StopTypeForMoveToMeleeSlotOnFormationChange;
        //return ReturnValue;        
    }

    function ReGetOrbitAccess()
    {
        GotoStateWithEnemyCheck('GetOrbitFormationClearenceOnFormationChange');
        //return;        
    }
    stop;    
}

state ReachedOrbitSlot
{Begin:

    NotifyReachedOrbitSlot();
    Outer.UseAnimationAggressive();
    Outer.EnableAggressiveGlow(true);
    Outer.PawnZeroVelocity();
    Outer.Sleep(0.0100000);
    // End:0xA8
    if(bShouldStalk)
    {
        GotoStateWithEnemyCheck('StalkFromOrbit');        
    }
    else
    {
        GotoStateWithEnemyCheck('StartAttackFromOrbitSlot');
    }
    stop;                    
}

state ReachedAltToFormationLocPointToStrikeFrom
{Begin:

    NotifyReachedAltToFormationLocPointToStrikeFrom();
    Outer.UseAnimationAggressive();
    Outer.EnableAggressiveGlow(true);
    Outer.PawnZeroVelocity();
    Outer.Sleep(0.0100000);
    GotoStateWithEnemyCheck('StartAltMortarAttackFromOrbitSlot');
    stop;                
}

state StalkFromOrbit
{
    ignores PreMove;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        StaticOrbitStalk_StopSM();
        super(SPStateObject).EndState(NextStateName);
        Outer.NotifyCombatManagerToRetractAllOptionsForThisPublisher();
        // End:0x53
        if(StaticStalkStarted)
        {
            StopAreaDependentStalk();
        }
        Outer.PawnZeroVelocity();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        StaticOrbitStalk_StopSM();
        Outer.NotifyCombatManagerToRetractAllOptionsForThisPublisher();
        // End:0x4A
        if(StaticStalkStarted)
        {
            StopAreaDependentStalk();
        }
        Outer.PawnZeroVelocity();
        //return;        
    }

    event PausedState()
    {
        // End:0x17
        if(StaticStalkStarted)
        {
            StopAreaDependentStalk();
        }
        //return;        
    }

    function ContinuedState()
    {
        // End:0x17
        if(StaticStalkStarted)
        {
            StaticOrbitStalk_StartSM();
        }
        //return;        
    }

    function StaticOrbitStalk_CanContinue()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float rangeToOrbitSlot, maxRangeToOrbitSlotAllowed;

        rangeToOrbitSlot = GetRangeToOrbitSlot();
        maxRangeToOrbitSlotAllowed = Outer.MedFlyerPawn.TuneDataMedFlyer.MaxRangeAllowedToDriftDuringStalk.GetValue();
        // End:0xA1
        if(rangeToOrbitSlot > maxRangeToOrbitSlotAllowed)
        {
            bNeedsToMoveBackToOrbitSlot = true;
            return false;
        }
        return Outer.HaveOrbitAccess();
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

    function GotoPostOrbitStalkState()
    {
        // End:0x3B
        if(!Outer.HaveOrbitAccess())
        {
            GotoStateWithEnemyCheck('GetOrbitFormationClearenceOnFormationChange');            
        }
        else
        {
            // End:0x5E
            if(bNeedsToMoveBackToOrbitSlot)
            {
                GotoStateWithEnemyCheck('MoveToOrbitSlot');                
            }
            else
            {
                GotoStateWithEnemyCheck('StartAttackFromOrbitSlot');
            }
        }
        //return;        
    }

    function CanStartStalk()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x14
        if(!bShouldStalk)
        {
            return false;            
        }
        else
        {
            // End:0x3B
            if(!Outer.HaveOrbitAccess())
            {
                return false;
            }
        }
        return true;
        //return ReturnValue;        
    }

    event NotifyAIResourceChanged()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess, Res;
        local /*0x97E50000-0x00000000*/ private bool bHandled, ReturnVal;

        ReturnVal = false;
        ResourceAccess = SPAIResourceAccess(ResAccess);
        bHandled = false;
        // End:0x10A
        if((ResourceAccess != none) && ResourceAccess == Outer.OrbitAccess)
        {
            Res = LPAIResMultiLocation(ResourceAccess.GetResource());
            // End:0x10A
            if(Res != none)
            {
                // End:0x10A
                if(Res.HasPosition(OrbitSlotPosition))
                {
                    Outer.bOrbitPointMoved = false;
                    bHandled = true;
                }
            }
        }
        // End:0x14A
        if(!bHandled)
        {
            ReturnVal = super(LPAICmd_Orbit).NotifyAIResourceChanged(ResAccess);
            GotoStateWithEnemyCheck('GetOrbitFormationClearence');
        }
        return ReturnVal;
        //return ReturnValue;        
    }

    event NotifyAIResourceAccessLost()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bOrbitAccessLost;

        bOrbitAccessLost = ResourceAccess == Outer.OrbitAccess;
        super(LPAICmd_Orbit).NotifyAIResourceAccessLost(ResourceAccess);
        // End:0x67
        if(bOrbitAccessLost)
        {
            GotoStateWithEnemyCheck('GetOrbitFormationClearence');
        }
        return false;
        //return ReturnValue;        
    }

    function GetStopTypeForMoveToOrbitSlot()
    {
        local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

        return Outer.myAIPawn.TuneDataAIPawn.StopTypeForMoveToMeleeSlotWhileStalking;
        //return ReturnValue;        
    }
Begin:

    // End:0x22
    if(!CanStartStalk())
    {
        GotoStateWithEnemyCheck('StartAttackFromOrbitSlot');
    }
    // End:0x5A
    if(!Outer.HaveOrbitAccess())
    {
        GotoStateWithEnemyCheck('GetOrbitFormationClearenceOnFormationChange');
    }
    goto 'BeginStaticOrbitStalk';
    J0x64:

    // End:0x91 [Loop If]
    if(StaticStalk_ShouldWait())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x64;
    }
    StaticOrbitStalk_StartSM();
    J0x9B:

    // End:0xC8 [Loop If]
    if(StaticOrbitStalk_CanContinue())
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x9B;
    }
    StaticOrbitStalk_StopSM();
    J0xD2:

    // End:0xFF [Loop If]
    if(StaticStalk_ShouldWaitBeforeExitState())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0xD2;
    }
    GotoPostOrbitStalkState();
    J0x109:

    // End:0x12D [Loop If]
    if(true)
    {
        Outer.Sleep(1.0000000);
        // [Loop Continue]
        goto J0x109;
    }
    stop;            
}

state StartAttackFromOrbitSlot
{
    function StartAttackBehavior()
    {
        GotoStateWithEnemyCheck('BeginAttackFromOrbit');
        //return;        
    }
Begin:

    TimeToGiveUpTryingToStrike = Outer.WorldInfo.TimeSeconds + TimeToKeepTryingForStrike;
    // End:0x9B
    if(!Outer.HaveOrbitAccess() && !ShouldStillAttackEvenAfterLosingOrbitAccess())
    {
        HandleFailureToStartAttack();
        GotoStateWithEnemyCheck('GetOrbitFormationClearenceOnFormationChange');
    }
    J0x9B:

    // End:0x132 [Loop If]
    if(!HasAccessToStartAttackFromOrbitSlot())
    {
        // End:0xEC
        if(!Outer.HaveOrbitAccess())
        {
            HandleFailureToStartAttack();
            GotoStateWithEnemyCheck('GetOrbitFormationClearenceOnFormationChange');
        }
        // End:0x103
        if(HasAttackWaitTimerExpired())
        {
            GetStrikeAccessIfRequiredBeforeAttack();
        }
        // End:0x12F
        if(!HasAccessToStartAttackFromOrbitSlot())
        {
            Outer.Sleep(0.0100000);
        }
        // [Loop Continue]
        goto J0x9B;
    }
    StartAttackBehavior();
    stop;                
}

state StartAltMortarAttackFromOrbitSlot
{
    function StartAttackBehavior()
    {
        GotoStateWithEnemyCheck('BeginAltMortarAttackFromOrbit');
        //return;        
    }
Begin:

    StartAttackBehavior();
    stop;        
}

state TryAttackFromHere
{
    function StartAttackBehavior()
    {
        GotoStateWithEnemyCheck('FlyAttackFromHere');
        //return;        
    }
Begin:

    StartAttackBehavior();
    stop;        
}

state BeginAttackFromOrbit
{Begin:

    // End:0x2C
    if(!HasAccessToStartAttackFromOrbitSlot())
    {
        HandleFailureToStartAttack();
        GotoStateWithEnemyCheck('GetOrbitFormationClearence');
    }
    GotoStateWithEnemyCheck('AttackFromOrbitWithClearence');
    stop;                    
}

state BeginAltMortarAttackFromOrbit
{Begin:

    GotoStateWithEnemyCheck('AltMortarAttackFromOrbitWithClearence');
    stop;                    
}

state ContinueToAttackFromOrbit
{Begin:

    // End:0x2C
    if(!HasAccessToStartAttackFromOrbitSlot())
    {
        HandleFailureToStartAttack();
        GotoStateWithEnemyCheck('GetOrbitFormationClearence');
    }
    GotoStateWithEnemyCheck('AttackFromOrbitWithClearence');
    stop;                    
}

state AttackFromOrbitWithClearence
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

    function PostAttackFromOrbitSlot()
    {
        Outer.LockStrikeAccess(false);
        ResetAttackWaitTimer();
        ResetFindRangedFireCounters();
        CurrentAttackCmd = none;
        // End:0x84
        if(Outer.MedFlyerPawn.Health > 0)
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }

    function RetreatToOrbitSlot()
    {
        GotoStateWithEnemyCheck('GetOrbitFormationClearence');
        //return;        
    }
Begin:

    // End:0x2F
    if(!HasAccessToStartAttackFromOrbitSlot())
    {
        HandleFailureToStartAttack();
        GotoStateWithEnemyCheck('GetOrbitFormationClearence');        
    }
    else
    {
        // End:0xB2
        if(!HasMoveToStartOfAttackPointFailed())
        {
            // End:0x86
            if(CanStillAttack())
            {
                // End:0x79
                if(HasAttackWaitTimerExpired())
                {
                    PreAttack();
                    AttackEnemyFromOrbitSlot();
                    PostAttackFromOrbitSlot();                    
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
        }
        else
        {
            HandleFailureToStartAttack();
        }
        Outer.Sleep(0.0000000);
        Outer.ReleaseStrikeAccess();
        RetreatToOrbitSlot();
    }
    stop;        
}

state AltMortarAttackFromOrbitWithClearence
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        Outer.LockStrikeAccess(false);
        //return;        
    }

    function PreAltMortarAttack()
    {
        Outer.NotifyCombatManagerToRetractAllOptionsForThisPublisher();
        Outer.LockStrikeAccess(true);
        //return;        
    }

    function PostAltMortarAttackFromOrbitSlot()
    {
        Outer.LockStrikeAccess(false);
        ResetAttackWaitTimer();
        CurrentAttackCmd = none;
        // End:0x7A
        if(Outer.MedFlyerPawn.Health > 0)
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }

    function RetreatToOrbitSlot()
    {
        GotoStateWithEnemyCheck('GetOrbitFormationClearence');
        //return;        
    }
Begin:

    // End:0x44
    if(Outer.AltToFormationLocPointToStrikeFromIndexInManager < 0)
    {
        HandleFailureToStartAltMortarAttack();
        GotoStateWithEnemyCheck('GetOrbitFormationClearence');        
    }
    else
    {
        // End:0xAD
        if(!HasMoveToStartOfAttackPointFailed())
        {
            // End:0x81
            if(CanStillAltMortarAttack())
            {
                PreAltMortarAttack();
                AltMortarAttackEnemyFromOrbitSlot();
                PostAltMortarAttackFromOrbitSlot();                
            }
            else
            {
                Outer.ReleaseStrikeAccess();
                HandleFailureToStartAltMortarAttack();
            }            
        }
        else
        {
            HandleFailureToStartAltMortarAttack();
        }
        Outer.Sleep(0.0000000);
        Outer.ReleaseStrikeAccess();
        RetreatToOrbitSlot();
    }
    stop;            
}

state FlyAttackFromHere
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        Outer.LockStrikeAccess(false);
        //return;        
    }

    function PreFlyAttackFromHere()
    {
        Outer.LockStrikeAccess(true);
        //return;        
    }

    function PostFlyAttackFromHere()
    {
        Outer.LockStrikeAccess(false);
        ResetAttackWaitTimer();
        ResetFindRangedFireCounters();
        CurrentAttackCmd = none;
        Outer.MedFlyerPawn.ResetRangedLobStrikeZoneForCurrentAttack();
        Outer.MedFlyerPawn.ResetRangedDirectFireStrikeZoneForCurrentAttack();
        Outer.MedFlyerPawn.ResetRangedLobStrikeZonesAtlArcForCurrentAttack();
        // End:0x133
        if(Outer.ClosestEnemyFoundForReactiveAttack != none)
        {
            Outer.NotifyCombatManagerToRetractAllOptionsForThisPublisher();
            GotoStateWithEnemyCheck('FlyerReactionPhysicalAttack');
        }
        //return;        
    }

    function RetreatToOrbitSlot()
    {
        GotoStateWithEnemyCheck('GetOrbitFormationClearence');
        //return;        
    }
Begin:

    Outer.PawnZeroVelocity();
    // End:0x67
    if(CanStillAttack())
    {
        // End:0x5A
        if(HasAttackWaitTimerExpired())
        {
            PreFlyAttackFromHere();
            FlyAttackEnemyFromHere();
            PostFlyAttackFromHere();            
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
    RetreatToOrbitSlot();
    stop;        
}

state WaitForOrbitClearence extends MoveToActor
{Begin:

    PopCommandWithFaliure();
    stop;        
}

state FlyerReactionPhysicalAttack
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        PostPerformFlyerReactionPhysicalAttackCmd();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        PostPerformFlyerReactionPhysicalAttackCmd();
        //return;        
    }

    function PostPerformFlyerReactionPhysicalAttackCmd()
    {
        CurrentAttackCmd = none;
        // End:0x4E
        if(Outer.MedFlyerPawn.Health > 0)
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }
Begin:

    StopPocessLookForAttackOpportunityTimer();
    PerformFlyerReactionPhysicalAttackCmd(Outer.ClosestEnemyFoundForReactiveAttack);
    GotoStateWithEnemyCheck('GetOrbitFormationClearence');
    stop;            
}

state BringTheHammerDownForHighRateOfFlyFormationInvalidations
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ResetAccumulatorsHammeringTheAttackerOnFlyFormationInvalidations();
        Outer.bStruggleModeForced = false;
        super(SPStateObject).EndState(NextStateName);
        // End:0x96
        if(Outer.MedFlyerPawn.Health > 0)
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }

    event PoppedState()
    {
        Outer.ResetAccumulatorsHammeringTheAttackerOnFlyFormationInvalidations();
        Outer.bStruggleModeForced = false;
        super(SPStateObject).PoppedState();
        // End:0x8D
        if(Outer.MedFlyerPawn.Health > 0)
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }

    function ShouldTryRangeLobAttack()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        ResetFindRangedFireCounters();
        TotalNumOfAttemptsToFindLobStrikeArcThisEngagement = 0;
        // End:0x79
        if(IsThereAClearLobAttackLaneFromCurrentLocation())
        {
            Outer.RangedFireLocationToStrikeFrom = Outer.MedFlyerPawn.Location;
            return true;            
        }
        return false;
        //return ReturnValue;        
    }

    function IsStrugglePossibleAgainstTheNail()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x4E
        if(Outer.CanDoStruggleModeAgainst(EnemyForAttack))
        {
            Outer.bStruggleModeForced = true;
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    StopPocessLookForAttackOpportunityTimer();
    // End:0x8C
    if((Outer.MedFlyerPawn.TuneDataMedFlyer.bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceLobAttack.GetValue() != float(0)) && ShouldTryRangeLobAttack())
    {
        FlyAttackHammerTheEnemyWithLobFromHere();        
    }
    else
    {
        // End:0x10E
        if((Outer.MedFlyerPawn.TuneDataMedFlyer.bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceStruggleAttack.GetValue() != float(0)) && IsStrugglePossibleAgainstTheNail())
        {
            FlyAttackHammerTheEnemyWithStruggleModeFromHere();            
        }
        else
        {
            // End:0x18A
            if(Outer.MedFlyerPawn.TuneDataMedFlyer.bWhenBringinTheHammerDownForHighRateFormationInvalidationsForceReactiveAttack.GetValue() != float(0))
            {
                PerformFlyerReactionPhysicalAttackCmd(EnemyForAttack);                
            }
            else
            {
                FlyAttackHammerTheEnemyWithPhysicalAttackFromHere();
            }
        }
    }
    GotoStateWithEnemyCheck('GetOrbitFormationClearence');
    stop;                    
}

defaultproperties
{
    bShouldStalk=true
    MinAttackRange=50.0000000
    MaxAttackRange=100.0000000
    HorizAngRangeInDegrees=90.0000000
    VertAngRangeInDegrees=180.0000000
    TightAreaFlyerStalkSmClass=Class'LPSM_MedFlyerStalkTightAtOrbitPoint'
    OpenAreaFlyerStalkSmClass=Class'LPSM_MedFlyerStalkAtOrbitPoint'
    TimeToKeepTryingForStrike=5.0000000
}