class LPAICmd_FireWaspDirectAttackPoF extends LPAICmd_MedFlyerDirectAttack within LPAIControllerFireWasp;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAbortedAttackBecauseTargetWentIntoCover[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMovingTowardEnemyForStruggleMove[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AirSpeedAtStartOfAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AccelRateAtStartOfAttack[536870913];

function Pushed()
{
    super.Pushed();
    Outer.UseSwoopStingAnimations();
    Outer.FireWaspPawn.bStingerAggressiveOnFlag = true;
    Outer.EnableStingAttackGlow(true);
    bAbortedAttackBecauseTargetWentIntoCover = false;
    bMovingTowardEnemyForStruggleMove = false;
    AirSpeedAtStartOfAttack = Outer.FireWaspPawn.AirSpeed;
    AccelRateAtStartOfAttack = Outer.FireWaspPawn.AccelRate;
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.UseAnimationAggressive();
    Outer.EnableAggressiveGlow(true);
    Outer.EnableStingAttackGlow(false);
    Outer.FireWaspPawn.SetMaxSpeedScale(Outer.FireWaspPawn.TuneDataFireWasp.GetNormalMaxSpeedScale(Outer.FireWaspPawn));
    Outer.FireWaspPawn.AirSpeed = AirSpeedAtStartOfAttack;
    Outer.FireWaspPawn.AccelRate = AccelRateAtStartOfAttack;
    Outer.FireWaspPawn.bStingerAggressiveOnFlag = false;
    // End:0x24D
    if((EnemyForAttack != none) && LPPlayerController(EnemyForAttack.Controller) != none)
    {
        LPPlayerController(EnemyForAttack.Controller).NotifyOfAttentionDrawingAttackEnded(Outer.FireWaspPawn);
    }
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function ShouldPerformAnnounceBeforeRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super.SetDesiredEnemy(InEnemy);
    // End:0xAC
    if((InEnemy != none) && LPPlayerController(InEnemy.Controller) != none)
    {
        LPPlayerController(InEnemy.Controller).NotifyOfAttentionDrawingAttackStarted(Outer.FireWaspPawn);
    }
    // End:0xE6
    if(Outer.WantsToDoStruggleMode(EnemyForAttack))
    {
        bMovingTowardEnemyForStruggleMove = true;        
    }
    else
    {
        bMovingTowardEnemyForStruggleMove = false;
    }
    //return;    
}

function GetShortAnnounceSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_FireWaspSwoopStingStart';
    //return ReturnValue;    
}

function GetLongAnnounceSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_FireWaspSwoopStingStart';
    //return ReturnValue;    
}

function FlyerPhysicalAttackMoveStrikeAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x52
    if(((EnemyForAttack != none) && !bMovingTowardEnemyForStruggleMove) && EnemyForAttack.IsInCover())
    {
        bAbortedAttackBecauseTargetWentIntoCover = true;
        return true;
    }
    return super.FlyerPhysicalAttackMoveStrikeAbortCondition();
    //return ReturnValue;    
}

function HandleDoneWithMoveToEnemyForStrikeCleanUp()
{
    // End:0x2E
    if(bAbortedAttackBecauseTargetWentIntoCover)
    {
        Outer.AbortCommand(self);
    }
    //return;    
}

function HandlePossibleNeedToChangeMaxSpeedForDirectAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL displacementToTargetOnTraker;
    local /*0x97E50000-0x00000000*/ private float distanceToTargetOnTracker;
    local /*0x97E50000-0x00000000*/ private @NULL tackerTargetOn;
    local /*0x97E50000-0x00000000*/ private float speedOfTracker, minRangeNeedsToBeAway, minSpeedNeedsToBeMoreThan;

    tackerTargetOn = LPPathTrackerBase(EnemyForAttack.Base);
    // End:0x3C7
    if(tackerTargetOn != none)
    {
        displacementToTargetOnTraker = tackerTargetOn.Location - Outer.FireWaspPawn.Location;
        distanceToTargetOnTracker = VSize(displacementToTargetOnTraker);
        minRangeNeedsToBeAway = Outer.FireWaspPawn.TuneDataFireWasp.StingAttackMinRangeToTargetOnPathTrackerToUseSpeedBoost.GetValue();
        // End:0x3C7
        if(distanceToTargetOnTracker >= minRangeNeedsToBeAway)
        {
            speedOfTracker = Abs(tackerTargetOn.CurrentSpeed);
            minSpeedNeedsToBeMoreThan = Outer.FireWaspPawn.TuneDataFireWasp.StingAttackMinSpeedOfPathTrackerToUseSpeedBoost.GetValue();
            // End:0x3C7
            if(speedOfTracker >= minSpeedNeedsToBeMoreThan)
            {
                Outer.FireWaspPawn.SetMaxSpeedScale(Outer.FireWaspPawn.TuneDataFireWasp.StingAttackAgainstTargetOnPathTrackerMaxSpeedScale.GetValue());
                Outer.FireWaspPawn.AirSpeed = Outer.FireWaspPawn.AirSpeed * Outer.FireWaspPawn.TuneDataFireWasp.StingAttackAgainstTargetOnPathTrackerMaxSpeedScale.GetValue();
                Outer.FireWaspPawn.AccelRate = Outer.FireWaspPawn.TuneDataFireWasp.StingAttackAgainstTargetOnPathTrackerAccelRate.GetValue();
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function PerformBestStikeBasedOnDistanceToTarget()
{
    // End:0x79
    if(Outer.WantsToDoStruggleMode(EnemyForAttack))
    {
        Outer.EnableStruggleAttackGlow(true);
        Outer.CmdFireWaspStrugglePofStrike(EnemyForAttack,, 1);
        return;
    }
    Outer.CmdFireWaspSwoopStingStrike(EnemyForAttack,, 1);
    //return;    
}

state ReturnToStartOfAttackLocation
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.UseAnimationAggressive();
        Outer.EnableAggressiveGlow(true);
        //return;        
    }

    event PushedState()
    {
        Outer.UseAnimationAggressive();
        Outer.EnableAggressiveGlow(true);
        //return;        
    }
    stop;    
}
