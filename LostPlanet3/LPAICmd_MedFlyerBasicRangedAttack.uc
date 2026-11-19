class LPAICmd_MedFlyerBasicRangedAttack extends LPAICmd_RangedLobAttack within LPAIControllerMedFlyer;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PointToStrikeFrom[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllreadyToldAttackManagerCurrentAttackIsDone[536870913];

function Pushed()
{
    super.Pushed();
    bAllreadyToldAttackManagerCurrentAttackIsDone = false;
    Outer.UseAnimationAggressive();
    Outer.EnableRangedBodyAttackGlow(true);
    Outer.EnableRangedWingAttackGlow(true);
    //return;    
}

function Popped()
{
    Outer.EnableRangedBodyAttackGlow(false);
    Outer.EnableRangedWingAttackGlow(false);
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

event NotifyAIResourceChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4F
    if(!Outer.IsPawnInBasicRangedStrikeZone(EnemyForAttack))
    {
        Outer.PopCommand(self);
        return true;
    }
    return false;
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

    return false;
    //return ReturnValue;    
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

function ShouldEndRangedAttackAfterStrikes()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x39
    if(Outer.IsFlyerStillInValidOrbitZone(EnemyForAttack))
    {
        return super(LPAICmd_RangedBaseAttack).ShouldEndRangedAttackAfterStrikes();
    }
    return true;
    //return ReturnValue;    
}

function HasFailedToReachRandgedAttackPointToManyTimes()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x73
    if(HasMoveToStartOfRangedAttackPointFailed())
    {
        ++NumOfTimesMoveToStartOfAttackPointHasFailed;
        // End:0x70
        if(NumOfTimesMoveToStartOfAttackPointHasFailed > Outer.MedFlyerPawn.TuneDataMedFlyer.MaxNumberOfTimesMoveToStartOfAttackPointIsAllowedToFail)
        {
            return true;
        }        
    }
    else
    {
        ++NumOfTimesMoveToStartOfAttackPointHasNotFailedButStillNotGottenThere;
        // End:0xD6
        if(NumOfTimesMoveToStartOfAttackPointHasNotFailedButStillNotGottenThere > Outer.MedFlyerPawn.TuneDataMedFlyer.MaxNumberOfTimesMoveToStartOfAttackPointHasNotFailedButStillNotGottenThereIsAllowedToHappen)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetPauseBetweenRangedStrikesSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_MedFlyerPauseBetweenStrikes';
    //return ReturnValue;    
}

function GetMinSeperationToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return ConvertRangeToSeperation(Outer.MedFlyerPawn.TuneDataMedFlyer.MinRangeForBasicRangedStrike);
    //return ReturnValue;    
}

function GetMaxRangeFormRangedFirePointBeforeAllowedToFire()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 200.0000000;
    //return ReturnValue;    
}

function MoveToEnemyForRangedStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float rangeToStrikeLoc, maxRangeFormRangedFirePointBeforeAllowedToFire;

    // End:0x403
    if(IsMyEnemyAlive())
    {
        rangeToStrikeLoc = VSize(Outer.RangedFireLocationToStrikeFrom - Outer.MedFlyerPawn.Location);
        maxRangeFormRangedFirePointBeforeAllowedToFire = GetMaxRangeFormRangedFirePointBeforeAllowedToFire();
        // End:0x395
        if(rangeToStrikeLoc > maxRangeFormRangedFirePointBeforeAllowedToFire)
        {
            Outer.Focus = EnemyForAttack;
            MoveToPositionFlyCmd = Outer.CmdMoveToPositionFly(Outer.RangedFireLocationToStrikeFrom,, maxRangeFormRangedFirePointBeforeAllowedToFire - float(10), Outer.CmdStatus_MoveToPosition, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfWithdraw);
            MoveToPositionFlyCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
            MoveToPositionFlyCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
            // End:0x21C
            if(AbortMoveInForRangedStrikeIfStrikeAccessLost())
            {
                MoveToPositionFlyCmd.__MoveAbortDelegate__Delegate = MoveStrikeAbortCondition;
            }
            MoveToPositionFlyCmd.bZeroVelocityOnFinish = true;
            // End:0x392
            if(Outer.myAIPawn.TuneDataAIPawn.bUseMovementProgressMonitorForAllAttackRunInsBeforeStrike)
            {
                MoveToPositionFlyCmd.SetMovementMonitorParameters(true, Outer.myAIPawn.TuneDataAIPawn.DurationBetweenMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.MinMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.DelayAfterStartOfAttackRunInBeforeStrikeBeforeMonitorStarts, NotifyOfFailedMovementToRangedStrikePoint);
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

function RangedStikeLaneStillValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x90
    if(IsThereClearRangedAttackLaneDelegate != none)
    {
        // End:0x8E
        if(OnIsThereClearRangedAttackLaneDelegate(Outer.MedFlyerPawn.Location, Outer.MedFlyerPawn.GetRangedLobStrikeTierForCurrentAttack()))
        {
            return true;
        }
        return false;
    }
    return true;
    //return ReturnValue;    
}

function ProcessWidthdrawFromFightMonitor()
{
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
