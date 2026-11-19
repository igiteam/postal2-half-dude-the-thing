class LPAICmd_MedFlyerDirectAttack extends LPAICmd_LeychAttack within LPAIControllerMedFlyer;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PointToStrikeFrom[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LoactionStartedAttackFrom[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedMoveBackAfterStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTimeDeltaForMoveBackAfterStrike[536870913];

function Pushed()
{
    super.Pushed();
    Outer.SetNotAllowedToPerformReactiveAttack();
    LoactionStartedAttackFrom = Outer.MedFlyerPawn.Location;
    TimeStartedMoveBackAfterStrike = -1.0000000;
    MaxTimeDeltaForMoveBackAfterStrike = 2.0000000;
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.NotifyCombatManagerOfAttackCompleted(13, false, false, false);
    // End:0xF3
    if(Outer.myAIPawn.Health > 0)
    {
        Outer.SetTimer(Outer.myAIPawn.TuneDataAIPawn.DelayAfterPhysicalAttackToResetReactiveAttackFlag.GetValue(), false, 'ResetReactiveAttackFlag', Outer);        
    }
    else
    {
        Outer.ResetReactiveAttackFlag();
    }
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

function ShouldZeroVelocityBeforeAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
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

function FlyerPhysicalAttackMoveStrikeAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function MoveBackAfterStrikeAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float TimeDelta;

    TimeDelta = Outer.WorldInfo.TimeSeconds - TimeStartedMoveBackAfterStrike;
    // End:0x61
    if(TimeDelta >= MaxTimeDeltaForMoveBackAfterStrike)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function EndOfAttackCleanUp()
{
    // End:0x4A
    if(Outer.MedFlyerPawn.Health > 0)
    {
        GotoState('ReturnToStartOfAttackLocation');        
    }
    //return;    
}

function GetPauseBetweenStrikesSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_MedFlyerPauseBetweenStrikes';
    //return ReturnValue;    
}

function HandlePossibleNeedToChangeMaxSpeedForDirectAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
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

    // End:0x3B0
    if(IsMyEnemyAlive())
    {
        Seperation = EnemySeperation();
        minSeperationToRequireMoveBeforeStrike = GetMinSeperationToRequireMoveBeforeStrike();
        // End:0x3B0
        if(Seperation > minSeperationToRequireMoveBeforeStrike)
        {
            HandlePossibleNeedToChangeMaxSpeedForDirectAttack();
            Outer.Focus = none;
            CurMoveToActorCmd = Outer.CmdMoveToActorFly(EnemyForAttack, none, Outer.MedFlyerPawn.TuneDataMedFlyer.DistanceFromTargetForBasicStrikeInUU, Outer.MedFlyerPawn.TuneDataMedFlyer.PitchAngleFromTargetForBasicStrikeInDegrees, 50.0000000, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfMoveToStrike);
            CurMoveToActorCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
            CurMoveToActorCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
            CurMoveToActorCmd.__MoveAbortDelegate__Delegate = FlyerPhysicalAttackMoveStrikeAbortCondition;
            CurMoveToActorCmd.bZeroVelocityOnFinish = true;
            // End:0x3AD
            if(Outer.myAIPawn.TuneDataAIPawn.bUseMovementProgressMonitorForAllAttackRunInsBeforeStrike)
            {
                CurMoveToActorCmd.SetMovementMonitorParameters(true, Outer.myAIPawn.TuneDataAIPawn.DurationBetweenMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.MinMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.DelayAfterStartOfAttackRunInBeforeStrikeBeforeMonitorStarts, NotifyOfFailedMovementToStrikePoint);
            }            
        }
    }
    //return;    
}

function MoveToStartOfAttackLocationAfterStrike()
{
    local /*0x97E50000-0x00000000*/ private float rangeToLoactionStartedAttackFrom;
    local /*0x97E50000-0x00000000*/ private @NULL locToMoveBackTo, dirTowardsStartOfAttack;

    dirTowardsStartOfAttack = LoactionStartedAttackFrom - Outer.MedFlyerPawn.Location;
    rangeToLoactionStartedAttackFrom = VSize(dirTowardsStartOfAttack);
    // End:0x533
    if(rangeToLoactionStartedAttackFrom > Outer.MedFlyerPawn.TuneDataMedFlyer.MaxRangeForLobFirePointBeforeAllowedToFire)
    {
        Outer.Focus = EnemyForAttack;
        // End:0x21A
        if(rangeToLoactionStartedAttackFrom > Outer.MedFlyerPawn.TuneDataMedFlyer.MaxRangeForMovementTowardsStartOfAttackLocationAfterSwoopStingStrike.GetValue())
        {
            dirTowardsStartOfAttack = Normal(dirTowardsStartOfAttack);
            dirTowardsStartOfAttack = dirTowardsStartOfAttack * Outer.MedFlyerPawn.TuneDataMedFlyer.MaxRangeForMovementTowardsStartOfAttackLocationAfterSwoopStingStrike.GetValue();
            locToMoveBackTo = dirTowardsStartOfAttack + Outer.MedFlyerPawn.Location;            
        }
        else
        {
            locToMoveBackTo = LoactionStartedAttackFrom;
        }
        locToMoveBackTo = LoactionStartedAttackFrom;
        MoveToPositionCmd = Outer.CmdMoveToPositionFly(locToMoveBackTo,, Outer.MedFlyerPawn.TuneDataMedFlyer.MaxRangeForLobFirePointBeforeAllowedToFire - float(10), Outer.CmdStatus_MoveToPosition, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfWithdraw);
        MoveToPositionCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
        MoveToPositionCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
        MoveToPositionCmd.__MoveAbortDelegate__Delegate = MoveBackAfterStrikeAbortCondition;
        MoveToPositionCmd.bZeroVelocityOnFinish = true;
        // End:0x530
        if(Outer.MedFlyerPawn.TuneDataMedFlyer.bUseMovementProgressMonitorForMovementTowardsStartOfAttackLocationAfterSwoopStingStrike)
        {
            MoveToPositionCmd.SetMovementMonitorParameters(true, Outer.MedFlyerPawn.TuneDataMedFlyer.DurationBetweenMovementDeltaForMovementTowardsStartOfAttackLocationAfterSwoopStingStrike, Outer.MedFlyerPawn.TuneDataMedFlyer.MinMovementDeltaForMovementTowardsStartOfAttackLocationAfterSwoopStingStrike, Outer.MedFlyerPawn.TuneDataMedFlyer.DelayAfterStartOfMovementTowardsStartOfAttackLocationAfterSwoopStingStrike, NotifyOfFailedMovementToStrikePoint);
        }        
    }
    else
    {
        Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 0;
        Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
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

        super.EndState(NextStateName);
        //return;        
    }

    event NotifyOfCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return NotifyOfNonCoreHit(AmountOfDamage, TypeOfDamage);
        //return ReturnValue;        
    }
    stop;    
}

state ReturnToStartOfAttackLocation
{
    ignores BeginState, PushedState, PoppedState, EndState;

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

    Outer.Focus = EnemyForAttack;
    CurSpecialMoveCmd = none;
    TimeStartedMoveBackAfterStrike = Outer.WorldInfo.TimeSeconds;
    MaxTimeDeltaForMoveBackAfterStrike = Outer.MedFlyerPawn.TuneDataMedFlyer.MaxTimeDeltaForMovementTowardsStartOfAttackLocationAfterSwoopStingStrike;
    MoveToStartOfAttackLocationAfterStrike();
    MoveToPositionCmd = none;
    Outer.PopCommand(self);
    stop;                    
}
