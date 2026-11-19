class LPAICmd_FireWaspMortarAttack extends LPAICmd_MortarAttackBase within LPAIControllerFireWasp;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCombatMangerToldMeToAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeCombatMangerToldMeToAttack[536870913];

function Pushed()
{
    super.Pushed();
    Outer.UseAnimationAggressive();
    Outer.EnableRangedBodyAttackGlow(true);
    Outer.EnableRangedWingAttackGlow(true);
    bCombatMangerToldMeToAttack = false;
    LastTimeCombatMangerToldMeToAttack = -1.0000000;
    //return;    
}

function Popped()
{
    // End:0x2A
    if(MortarAttackSetupInfo.bUseCombatManager)
    {
        StopPocessLookForAttackOpportunityTimer();
    }
    Outer.EnableRangedBodyAttackGlow(false);
    Outer.EnableRangedWingAttackGlow(false);
    super.Popped();
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super.SetDesiredEnemy(InEnemy);
    Outer.GetOrbitEngagementAccess(InEnemy);
    //return;    
}

function IsValidLobStrikePositionInValidArea()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[25296897], TestActor;
    local /*0x97E50000-0x00000000*/ private bool bUseErrorBuffer[8388609], ReturnValue;

    // End:0xE5
    if(super.IsValidLobStrikePositionInValidArea(FromLocation, TestActor, bUseErrorBuffer))
    {
        // End:0xB6
        if(MortarAttackSetupInfo.bUseHeightInsteadOfPitchForEvaluations)
        {
            // End:0xB3
            if(!IsThisValidLobStrikeHeightDelta(FromLocation.Z - TheTarget.Location.Z, bUseErrorBuffer))
            {
                return false;
            }            
        }
        else
        {
            // End:0xE3
            if(!IsThisValidLobStrikePitch(FromLocation, TestActor, bUseErrorBuffer))
            {
                return false;
            }
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsThisValidLobStrikeHeightDelta()
{
    local /*0x97E50000-0x00000000*/ private float HeightDeltaToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUseErrorBuffer[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private float MinHeightDelta, MaxHeightDelta;

    // End:0x54
    if(bUseErrorBuffer)
    {
        MinHeightDelta = MortarAttackSetupInfo.MinHeightDelta - MortarAttackSetupInfo.HeightErrorBuffer;        
    }
    else
    {
        MinHeightDelta = MortarAttackSetupInfo.MinHeightDelta;
    }
    // End:0xCE
    if(bUseErrorBuffer)
    {
        MaxHeightDelta = MortarAttackSetupInfo.MaxHeightDelta + MortarAttackSetupInfo.HeightErrorBuffer;        
    }
    else
    {
        MaxHeightDelta = MortarAttackSetupInfo.MaxHeightDelta;
    }
    // End:0x126
    if((HeightDeltaToTest < MinHeightDelta) || HeightDeltaToTest > MaxHeightDelta)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function IsThisValidLobStrikePitch()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[25296897], TestActor;
    local /*0x97E50000-0x00000000*/ private bool bUseErrorBuffer[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL vecToTargetsLoc, rotToTargetsLoc;
    local /*0x97E50000-0x00000000*/ private int pitchToLocationInUU;
    local /*0x97E50000-0x00000000*/ private float pitchToLocationInDegrees, minPitchToLocationWithErrorInDegrees, maxPitchToLocationWithErrorInDegrees;

    vecToTargetsLoc = FromLocation - TestActor.Location;
    rotToTargetsLoc = Rotator(vecToTargetsLoc);
    pitchToLocationInUU = rotToTargetsLoc.Pitch;
    pitchToLocationInDegrees = float(pitchToLocationInUU) * 0.0054932;
    pitchToLocationInDegrees = ((pitchToLocationInDegrees > 180.0000000) ? pitchToLocationInDegrees - 360.0000000 : ((pitchToLocationInDegrees < float(-180)) ? pitchToLocationInDegrees + 180.0000000 : pitchToLocationInDegrees));
    // End:0x181
    if(bUseErrorBuffer)
    {
        minPitchToLocationWithErrorInDegrees = MortarAttackSetupInfo.MinPitchAllowedInDegrees - MortarAttackSetupInfo.PitchErrorBufferInDegrees;
        maxPitchToLocationWithErrorInDegrees = MortarAttackSetupInfo.MaxPitchAllowedInDegrees + MortarAttackSetupInfo.PitchErrorBufferInDegrees;        
    }
    else
    {
        minPitchToLocationWithErrorInDegrees = MortarAttackSetupInfo.MinPitchAllowedInDegrees;
        maxPitchToLocationWithErrorInDegrees = MortarAttackSetupInfo.MaxPitchAllowedInDegrees;
    }
    // End:0x1FF
    if((pitchToLocationInDegrees > maxPitchToLocationWithErrorInDegrees) || pitchToLocationInDegrees < minPitchToLocationWithErrorInDegrees)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function IsThisControllerAllowedToStayInAttackCommandWithOutHavingRequiredAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function DoesFireHaveAccessToLobStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL TestyPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x12
    if(bCombatMangerToldMeToAttack)
    {
        return true;        
    }
    else
    {
        // End:0x38
        if(Outer.AltToFormationLocPointToStrikeFromIndexInManager >= 0)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function HaveRequiredAccessForForStrikingDuringRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x63
    if(MortarAttackSetupInfo.bUseCombatManager && LPPawn(TheTarget) != none)
    {
        // End:0x5E
        if(DoesFireHaveAccessToLobStrike(LPPawn(TheTarget)))
        {
            return true;            
        }
        else
        {
            return false;
        }        
    }
    else
    {
        // End:0xCD
        if(TheTarget != none)
        {
            // End:0xCB
            if((NextTimeToLaunchLobStrike < float(0)) || NextTimeToLaunchLobStrike < Outer.WorldInfo.TimeSeconds)
            {
                return true;                
            }
            else
            {
                return false;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function HandleDoneWithMoveToEnemyForRangedStrikeCleanUp()
{
    // End:0x6A
    if(Outer.AltToFormationLocPointToStrikeFromIndexInManager < 0)
    {
        // End:0x51
        if(MortarAttackSetupInfo.bUseCombatManager)
        {
            StartPocessLookForAttackOpportunityTimer();            
        }
        else
        {
            // End:0x6A
            if(TheTarget == none)
            {
                StartPocessLookForAttackOpportunityTimer();
            }
        }
    }
    //return;    
}

function HandleDoneWithRangedStrikeCleanUp()
{
    Outer.NotifyCombatManagerOfAttackCompleted(2, false, false, false);
    // End:0x52
    if(Outer.AltToFormationLocPointToStrikeFromIndexInManager < 0)
    {
        StartPocessLookForAttackOpportunityTimer();
    }
    //return;    
}

function IsAttackOpertunityStillValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(Outer.AltToFormationLocPointToStrikeFromIndexInManager < 0)
    {
        return super(LPAICmd_RangedLobAttack).IsAttackOpertunityStillValid();
    }
    // End:0x7A
    if(IsValidLobStrikePosition(Outer.FireWaspPawn.Location, TheTarget))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function PerformBestRangedStikeBasedOnDistanceToTarget()
{
    CurStrikeCmd = Outer.CmdMedFlyerBasicLobStrike(EnemyForAttack,, 1);
    // End:0x7A
    if(MortarAttackSetupInfo.bUseCombatManager)
    {
        StopPocessLookForAttackOpportunityTimer();
        bCombatMangerToldMeToAttack = false;
        LastTimeCombatMangerToldMeToAttack = -1.0000000;
    }
    super.PerformBestRangedStikeBasedOnDistanceToTarget();
    //return;    
}

function GetPauseBetweenRangedStrikesSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_MedFlyerPauseBetweenStrikes';
    //return ReturnValue;    
}

function GetMaxRangeFormRangedFirePointBeforeAllowedToFire()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.MedFlyerPawn.TuneDataMedFlyer.MaxRangeForLobFirePointBeforeAllowedToFire;
    //return ReturnValue;    
}

function MoveToEnemyForRangedStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float rangeToStrikeLoc, maxRangeFormRangedFirePointBeforeAllowedToFire, PitchAngleFromTargetForManeuverInDegrees;

    // End:0x74D
    if((TheTarget != none) || LocationToLaunchFrom != none)
    {
        // End:0x68
        if(((LocationToLaunchFrom == none) && !bFoundValidLobStrikeLocationWhenNonGiven) && Outer.AltToFormationLocPointToStrikeFromIndexInManager < 0)
        {
            return false;
        }
        // End:0x74B
        if((LocationToLaunchFrom != none) || bFoundValidLobStrikeLocationWhenNonGiven)
        {
            // End:0xE0
            if(bFoundValidLobStrikeLocationWhenNonGiven)
            {
                rangeToStrikeLoc = VSize(PointToStrikeFrom - Outer.FireWaspPawn.Location);                
            }
            else
            {
                rangeToStrikeLoc = VSize(LocationToLaunchFrom.Location - Outer.FireWaspPawn.Location);
            }
            maxRangeFormRangedFirePointBeforeAllowedToFire = GetMaxRangeFormRangedFirePointBeforeAllowedToFire();
            // End:0x6DF
            if(rangeToStrikeLoc > maxRangeFormRangedFirePointBeforeAllowedToFire)
            {
                // End:0x42B
                if(bFoundValidLobStrikeLocationWhenNonGiven)
                {
                    MoveToPositionFlyCmd = Outer.CmdMoveToPositionFly(PointToStrikeFrom,, maxRangeFormRangedFirePointBeforeAllowedToFire - float(10), Outer.CmdStatus_MoveToPosition, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfWithdraw);
                    MoveToPositionFlyCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
                    MoveToPositionFlyCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
                    MoveToPositionFlyCmd.__MoveAbortDelegate__Delegate = MoveStrikeAbortCondition;
                    MoveToPositionFlyCmd.bZeroVelocityOnFinish = true;
                    // End:0x428
                    if(Outer.myAIPawn.TuneDataAIPawn.bUseMovementProgressMonitorForAllAttackRunInsBeforeStrike)
                    {
                        MoveToPositionFlyCmd.SetMovementMonitorParameters(true, Outer.myAIPawn.TuneDataAIPawn.DurationBetweenMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.MinMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.DelayAfterStartOfAttackRunInBeforeStrikeBeforeMonitorStarts, NotifyOfFailedMovementToRangedStrikePoint);
                    }                    
                }
                else
                {
                    PitchAngleFromTargetForManeuverInDegrees = Outer.MedFlyerPawn.TuneDataMedFlyer.PitchAngleFromTargetForStartOfAttackInDegrees;
                    MoveToActorCmd = Outer.CmdMoveToActorFly(LocationToLaunchFrom, none, maxRangeFormRangedFirePointBeforeAllowedToFire - float(10), PitchAngleFromTargetForManeuverInDegrees, 40.0000000, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfMoveToStrike);
                    MoveToActorCmd.__MoveAbortDelegate__Delegate = MoveStrikeAbortCondition;
                    MoveToActorCmd.bZeroVelocityOnFinish = true;
                    // End:0x6DC
                    if(Outer.myAIPawn.TuneDataAIPawn.bUseMovementProgressMonitorForAllAttackRunInsBeforeStrike)
                    {
                        MoveToActorCmd.SetMovementMonitorParameters(true, Outer.myAIPawn.TuneDataAIPawn.DurationBetweenMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.MinMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.DelayAfterStartOfAttackRunInBeforeStrikeBeforeMonitorStarts, NotifyOfFailedMovementToRangedStrikePoint);
                    }
                }                
            }
            else
            {
                Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 0;
                Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
            }
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

function OnEngagementAttackOptionApproved()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(EnemyForAttack.InStruggleMode)
    {
        return false;
    }
    // End:0x83
    if(int(TypeOfAttack) == int(2))
    {
        bCombatMangerToldMeToAttack = true;
        LastTimeCombatMangerToldMeToAttack = Outer.WorldInfo.TimeSeconds;
        return true;
    }
    return false;
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

final function StopPocessLookForAttackOpportunityTimer()
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

function ProcessLookForAttackOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    HandlePosibilityOfNeedForTargetDropAndSwitch();
    ProcessPossibilityTargetAppeared();
    // End:0x48
    if(ShouldTryRangeLobAttack())
    {
        return Outer.PublishNewAttackOptionToCombatManager(2,, false);        
    }
    return false;
    //return ReturnValue;    
}

function ShouldTryRangeLobAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x61
    if(IsThereAClearLobAttackLaneFromCurrentLocation())
    {
        Outer.RangedFireLocationToStrikeFrom = Outer.MedFlyerPawn.Location;
        return true;
    }
    return false;
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

    // End:0x11
    if(TheTarget == none)
    {
        return false;
    }
    fireVel.X = 0.0000000;
    fireVel.Y = 0.0000000;
    fireVel.Z = 0.0000000;
    targetsOffsetForCals = TheTarget.Location;
    targetsOffsetForCals.Z += Outer.MedFlyerPawn.TuneDataMedFlyer.HieghtOffTargetPointForEndOfLobFireArc;
    Outer.MedFlyerPawn.LobStrikeLocValidationInfoList[0].LogAlgosSegmentValiditys.Length = 0;
    Outer.MedFlyerPawn.LobStrikeLocValidationInfoList[0].LogAlgosSegmentEnds.Length = 0;
    displacementToTarget = targetsOffsetForCals - Outer.MedFlyerPawn.Location;
    QRot = QuatFromRotator(Rotator(displacementToTarget));
    pointToCalcLaunchFrom = QuatRotateVector(QRot, Outer.MedFlyerPawn.TuneDataMedFlyer.OffsetForCalcOfLobFirStrike);
    // End:0x62C
    if(Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZone >= 0)
    {
        distanceFromTarget = Outer.MedFlyerPawn.GetRangedLobFireMidZoneRangeForThisZone(Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZone);
        baseLaunchLoc = Outer.MedFlyerPawn.Location - TheTarget.Location;
        baseLaunchLoc = Normal(baseLaunchLoc);
        baseLaunchLoc = baseLaunchLoc * distanceFromTarget;
        baseLaunchLoc = TheTarget.Location + baseLaunchLoc;
        currentZoneIn = Outer.MedFlyerPawn.TuneDataMedFlyer.ForceAllLobAttacksFromThisZone;
        // End:0x5AB
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
        currentZoneIn = Outer.MedFlyerPawn.FindCurrentLobFromAnywhereZone(TheTarget);
        // End:0x684
        if(currentZoneIn < 0)
        {
            return false;
        }
        baseLaunchLoc = Outer.MedFlyerPawn.Location;
        currentZonesAltArc = 0;
        // End:0x757
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
    Outer.MedFlyerPawn.LobStrikeLocValidationInfoList[0].LobFireLastPointToStrikeFrom = baseLaunchLoc;
    bfoundArc = Outer.MedFlyerPawn.FindTossVelocity(fireVel, targetsOffsetForCals, pointToCalcLaunchFrom, Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByZone[currentZoneIn].RangedLobFireIdealSpeed, Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByZone[currentZoneIn].RangedLobFireMinSpeed, Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByZone[currentZoneIn].RangedLobFireMaxSpeed, 0.0000000, desiredZPercentOfArc, Outer.MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByZone[currentZoneIn].ShapeOfProjectileForLobCalc,,, true, Outer.MedFlyerPawn.GetBestCurrentVelocityForThisTarget(TheTarget),, false, true, 0);
    // End:0xACF
    if(bfoundArc)
    {
        Outer.MedFlyerPawn.SetRangedLobStrikeZoneInfo(currentZoneIn, currentZonesAltArc);
        return true;        
    }
    else
    {
        Outer.MedFlyerPawn.ResetRangedLobStrikeZonesAtlArcForCurrentAttack();
        return false;
    }
    //return ReturnValue;    
}
