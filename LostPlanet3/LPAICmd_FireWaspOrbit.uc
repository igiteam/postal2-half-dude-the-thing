class LPAICmd_FireWaspOrbit extends LPAICmd_Orbit within LPAIControllerFireWasp;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AirSpeedAtStartOfManeuveringForAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AccelRateAtStartOfManeuveringForAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AirSpeedAtStartOfMoveToOrbitSlot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AccelRateAtStartOfMoveToOrbitSlot[536870913];

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function GetMinAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetDefaultAttackRange();
    //return ReturnValue;    
}

function GetMaxAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetDefaultAttackRange();
    //return ReturnValue;    
}

function GetDefaultAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.FireWaspPawn.TuneDataFireWasp.DefaultStrikeRange;
    //return ReturnValue;    
}

function GetStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];

    -1.0000000
    false
    super(LPAICommand).GetStrikeAccess(TheEnemy, RevokeTolerance, bForced);
    Outer.LockStrikeAccess(false);
    //return;    
}

function SetOrbitExtents()
{
    // End:0xBE
    if(Outer.ShouldUseOrbitResource())
    {
        // End:0xBB
        if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
        {
            EnemyForAttack.AIResourceManager.GetResourceLocationExtents(Outer.OrbitResourceName, OrbitPatternCenter, OrbitPatternRadius);
        }        
    }
    else
    {
        super.SetOrbitExtents();
    }
    //return;    
}

function ShouldAbortFlee()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x58
    if(!Outer.HaveOrbitAccess())
    {
        Outer.GetOrbitAccess(EnemyForAttack);
        SetOrbitExtents();
    }
    // End:0x7D
    if(Outer.HaveOrbitAccess())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ShouldStillAttackEvenAfterLosingOrbitAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function HandlePossibleNeedToUsePursiutVelocityWhenManeuveringForAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL displacementToTargetOnTraker;
    local /*0x97E50000-0x00000000*/ private float distanceToTargetOnTracker;
    local /*0x97E50000-0x00000000*/ private @NULL tackerTargetOn;
    local /*0x97E50000-0x00000000*/ private float speedOfTracker, minRangeNeedsToBeAway, minSpeedNeedsToBeMoreThan;

    tackerTargetOn = LPPathTrackerBase(EnemyForAttack.Base);
    // End:0x462
    if(tackerTargetOn != none)
    {
        displacementToTargetOnTraker = tackerTargetOn.Location - Outer.FireWaspPawn.Location;
        distanceToTargetOnTracker = VSize(displacementToTargetOnTraker);
        minRangeNeedsToBeAway = Outer.FireWaspPawn.TuneDataFireWasp.PursuitModeMinRangeToNewLocWhenTargetIsOnPathTrackerToUseSpeedBoost.GetValue();
        // End:0x462
        if(distanceToTargetOnTracker >= minRangeNeedsToBeAway)
        {
            speedOfTracker = Abs(tackerTargetOn.CurrentSpeed);
            minSpeedNeedsToBeMoreThan = Outer.FireWaspPawn.TuneDataFireWasp.PursuitModeMinSpeedOfPathTrackerToUseSpeedBoost.GetValue();
            // End:0x462
            if(speedOfTracker >= minSpeedNeedsToBeMoreThan)
            {
                Outer.bInPursiutMode = true;
                AirSpeedAtStartOfManeuveringForAttack = Outer.FireWaspPawn.AirSpeed;
                AccelRateAtStartOfManeuveringForAttack = Outer.FireWaspPawn.AccelRate;
                Outer.FireWaspPawn.SetMaxSpeedScale(Outer.FireWaspPawn.TuneDataFireWasp.PursuitModeAgainstTargetOnPathTrackerMaxSpeedScale.GetValue());
                Outer.FireWaspPawn.AirSpeed = Outer.FireWaspPawn.AirSpeed * Outer.FireWaspPawn.TuneDataFireWasp.PursuitModeAgainstTargetOnPathTrackerMaxSpeedScale.GetValue();
                Outer.FireWaspPawn.AccelRate = Outer.FireWaspPawn.TuneDataFireWasp.PursuitModeAgainstTargetOnPathTrackerAccelRate.GetValue();
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function CleanUpPursiutVelocityWhenManeuveringForAttack()
{
    // End:0x158
    if(Outer.bInPursiutMode)
    {
        Outer.bInPursiutMode = false;
        Outer.FireWaspPawn.SetMaxSpeedScale(Outer.FireWaspPawn.TuneDataFireWasp.GetNormalMaxSpeedScale(Outer.FireWaspPawn));
        Outer.FireWaspPawn.AirSpeed = AirSpeedAtStartOfManeuveringForAttack;
        Outer.FireWaspPawn.AccelRate = AccelRateAtStartOfManeuveringForAttack;
    }
    //return;    
}

function HandlePossibleNeedToUsePursiutVelocityWhenMovingToOrbitSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL displacementToTargetOnTraker;
    local /*0x97E50000-0x00000000*/ private float distanceToTargetOnTracker;
    local /*0x97E50000-0x00000000*/ private @NULL tackerTargetOn;
    local /*0x97E50000-0x00000000*/ private float speedOfTracker, minRangeNeedsToBeAway, minSpeedNeedsToBeMoreThan;

    tackerTargetOn = LPPathTrackerBase(EnemyForAttack.Base);
    // End:0x462
    if(tackerTargetOn != none)
    {
        displacementToTargetOnTraker = tackerTargetOn.Location - Outer.FireWaspPawn.Location;
        distanceToTargetOnTracker = VSize(displacementToTargetOnTraker);
        minRangeNeedsToBeAway = Outer.FireWaspPawn.TuneDataFireWasp.PursuitModeMinRangeToNewLocWhenTargetIsOnPathTrackerToUseSpeedBoost.GetValue();
        // End:0x462
        if(distanceToTargetOnTracker >= minRangeNeedsToBeAway)
        {
            speedOfTracker = Abs(tackerTargetOn.CurrentSpeed);
            minSpeedNeedsToBeMoreThan = Outer.FireWaspPawn.TuneDataFireWasp.PursuitModeMinSpeedOfPathTrackerToUseSpeedBoost.GetValue();
            // End:0x462
            if(speedOfTracker >= minSpeedNeedsToBeMoreThan)
            {
                Outer.bInPursiutMode = true;
                AirSpeedAtStartOfMoveToOrbitSlot = Outer.FireWaspPawn.AirSpeed;
                AccelRateAtStartOfMoveToOrbitSlot = Outer.FireWaspPawn.AccelRate;
                Outer.FireWaspPawn.SetMaxSpeedScale(Outer.FireWaspPawn.TuneDataFireWasp.PursuitModeAgainstTargetOnPathTrackerMaxSpeedScale.GetValue());
                Outer.FireWaspPawn.AirSpeed = Outer.FireWaspPawn.AirSpeed * Outer.FireWaspPawn.TuneDataFireWasp.PursuitModeAgainstTargetOnPathTrackerMaxSpeedScale.GetValue();
                Outer.FireWaspPawn.AccelRate = Outer.FireWaspPawn.TuneDataFireWasp.PursuitModeAgainstTargetOnPathTrackerAccelRate.GetValue();
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function CleanUpPursiutVelocityWhenMovingToOrbitSlot()
{
    // End:0x158
    if(Outer.bInPursiutMode)
    {
        Outer.bInPursiutMode = false;
        Outer.FireWaspPawn.SetMaxSpeedScale(Outer.FireWaspPawn.TuneDataFireWasp.GetNormalMaxSpeedScale(Outer.FireWaspPawn));
        Outer.FireWaspPawn.AirSpeed = AirSpeedAtStartOfMoveToOrbitSlot;
        Outer.FireWaspPawn.AccelRate = AccelRateAtStartOfMoveToOrbitSlot;
    }
    //return;    
}

function FleeFromEnemy()
{
    local /*0x97E50000-0x00000000*/ private float DurationOfFlee[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array fleeFromList;
    local /*0x97E50000-0x00000000*/ private @NULL fleeCmd;
    local /*0x97E50000-0x00000000*/ private float FleeDistance;

    FleeDistance = Outer.FireWaspPawn.TuneDataFireWasp.FleeDistance.GetValue();
    fleeFromList.AddItem(EnemyForAttack);    
    fleeCmd = Outer.CmdFlee(DurationOfFlee, FleeDistance * float(10), FleeDistance, fleeFromList, 1);
    fleeCmd.__FleeAbortDelegate__Delegate = ShouldAbortFlee;
    //return;    
}

function FleeFromEnemyWhileWaitingForOrbitClearence()
{
    local /*0x97E50000-0x00000000*/ private float DurationOfFlee[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array fleeFromList;
    local /*0x97E50000-0x00000000*/ private @NULL fleeCmd;
    local /*0x97E50000-0x00000000*/ private float FleeDistance, maxRangeToLookForFleeLocs;
    local /*0x97E50000-0x00000000*/ private bool bfinishFleeWhenSafe;

    FleeDistance = Outer.FireWaspPawn.TuneDataFireWasp.FleeDistanceWhileWaitingForOrbitClearence.GetValue();
    maxRangeToLookForFleeLocs = Outer.FireWaspPawn.TuneDataFireWasp.MaxRangeToLookForFleeLocsWhileWaitingForOrbitClearence.GetValue();
    bfinishFleeWhenSafe = ((Outer.FireWaspPawn.TuneDataFireWasp.bFinishFleeWhenSafeWhileWaitingForOrbitClearence.GetValue() != float(0)) ? true : false);
    fleeFromList.AddItem(EnemyForAttack);    
    fleeCmd = Outer.CmdFlee(DurationOfFlee, maxRangeToLookForFleeLocs, FleeDistance, fleeFromList, 1, bfinishFleeWhenSafe);
    fleeCmd.__FleeAbortDelegate__Delegate = ShouldAbortFlee;
    //return;    
}

state WaitForOrbitClearence
{Begin:

    Outer.PawnZeroVelocity();
    Outer.SetWantsNewEnemy(true);
    FleeFromEnemyWhileWaitingForOrbitClearence(Outer.FireWaspPawn.TuneDataFireWasp.FleeDurationWhileWaitingForOrbitClearence.GetValue());
    GotoStateWithEnemyCheck('GetOrbitFormationClearence');
    stop;        
}

defaultproperties
{
    MinAttackRange=100.0000000
    MaxAttackRange=150.0000000
}