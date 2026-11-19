class LPAICmd_MedFlyerReactiveAttack extends LPAICmd_ReactiveAttack within LPAIControllerMedFlyer;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PointToStrikeFrom[536870913];

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    Outer.ClosestEnemyFoundForReactiveAttack = none;
    super.Popped();
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
    Outer.GetOrbitEngagementAccess(InEnemy);
    //return;    
}

function HaveRequiredAccessForAnnounceDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldPerformAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldTurnToFaceBeforeAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function IsValidGrenadeAssistTargetDurringAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldPerformDamageAssessmentIfCanNotStrikeAfterMoveToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function HaveRequiredAccessForMoveToEnemyForStrikeDuringAttack()
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

function SetBeSuperAggressive()
{
    local /*0x97E50000-0x00000000*/ private bool bAggressive[8388609];

    Outer.bBeSuperAggressive = bAggressive;
    //return;    
}

function HaveRequiredAccessForForStrikingDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function DoesStillNeedToMoveCloserToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if((EnemyForAttack != none) && !Outer.IsPawnInDirectStrikeZone(EnemyForAttack))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function PerformBestStikeBasedOnDistanceToTarget()
{
    Outer.CmdMedFlyerBasicPhysicalStrikePof(EnemyForAttack,, 1);
    //return;    
}

function NeedToPerformDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function AbortMoveInForStrikeIfStrikeAccessLost()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function HandlePostStrikeBehavior()
{
    Outer.NotifyCombatManagerOfAttackCompleted(13, false, false, false);
    //return;    
}

function GetPauseBetweenStrikesSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_MedFlyerPauseBetweenStrikes';
    //return ReturnValue;    
}

function CalculatePointToStrikeFrom()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL displacementToStrikePoint, rotToStrikePoint;
    local /*0x97E50000-0x00000000*/ private int pitchToPointInUU;

    pitchToPointInUU = int(float(65535) * (Outer.MedFlyerPawn.TuneDataMedFlyer.PitchAngleFromTargetForBasicStrikeInDegrees / 360.0000000));
    displacementToStrikePoint = Outer.myAIPawn.Location - EnemyForAttack.Location;
    rotToStrikePoint = Rotator(displacementToStrikePoint);
    rotToStrikePoint.Pitch = pitchToPointInUU;
    displacementToStrikePoint = Vector(rotToStrikePoint);
    displacementToStrikePoint = Normal(displacementToStrikePoint);
    displacementToStrikePoint = displacementToStrikePoint * Outer.MedFlyerPawn.TuneDataMedFlyer.DistanceFromTargetForBasicStrikeInUU;
    PointToStrikeFrom = displacementToStrikePoint + EnemyForAttack.Location;
    return false;
    //return ReturnValue;    
}

function MoveToEnemyForStrike()
{
    local /*0x97E50000-0x00000000*/ private float Seperation, minSeperationToRequireMoveBeforeStrike;

    // End:0x3B3
    if(IsMyEnemyAlive())
    {
        Seperation = EnemySeperation();
        minSeperationToRequireMoveBeforeStrike = GetMinSeperationToRequireMoveBeforeStrike();
        // End:0x3B3
        if(Seperation > minSeperationToRequireMoveBeforeStrike)
        {
            Outer.Focus = none;
            CurMoveToActorCmd = Outer.CmdMoveToActorFly(EnemyForAttack, none, Outer.MedFlyerPawn.TuneDataMedFlyer.DistanceFromTargetForBasicStrikeInUU, Outer.MedFlyerPawn.TuneDataMedFlyer.PitchAngleFromTargetForBasicStrikeInDegrees, 50.0000000, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfMoveToStrike);
            CurMoveToActorCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
            CurMoveToActorCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
            // End:0x23A
            if(AbortMoveInForStrikeIfStrikeAccessLost())
            {
                CurMoveToActorCmd.__MoveAbortDelegate__Delegate = MoveStrikeAbortCondition;
            }
            CurMoveToActorCmd.bZeroVelocityOnFinish = true;
            // End:0x3B0
            if(Outer.myAIPawn.TuneDataAIPawn.bUseMovementProgressMonitorForAllAttackRunInsBeforeStrike)
            {
                CurMoveToActorCmd.SetMovementMonitorParameters(true, Outer.myAIPawn.TuneDataAIPawn.DurationBetweenMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.MinMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.DelayAfterStartOfAttackRunInBeforeStrikeBeforeMonitorStarts, NotifyOfFailedMovementToStrikePoint);
            }            
        }
    }
    //return;    
}
