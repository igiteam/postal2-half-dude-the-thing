class LPAICmd_SentinelMedRangeDirectFireAttack extends LPAICmd_RangedDirectFireAttack within LPAIControllerSentinel;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PointToStrikeFrom[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllreadyToldAttackManagerCurrentAttackIsDone[536870913];

function Pushed()
{
    super.Pushed();
    Outer.bPerformingAttack = true;
    //return;    
}

function Popped()
{
    Outer.TimeAllowedNextMedRangeStrike = RandRange(Outer.SentinelPawn.TuneDataSentinel.MinDelayBetweenChecksForDirectBurstFireRangeAttack.GetValue(), Outer.SentinelPawn.TuneDataSentinel.MaxDelayBetweenChecksForDirectBurstFireRangeAttack.GetValue());
    Outer.TimeAllowedNextMedRangeStrike += Outer.WorldInfo.TimeSeconds;
    Outer.bPerformingAttack = false;
    // End:0x228
    if(Outer.CurrentSentinelCombatManagerResourceRef != none)
    {
        // End:0x1E9
        if((NumberOfStrikesDoneSoFarThisAttack > 0) || CurStrikeCmd != none)
        {
            Outer.CurrentSentinelCombatManagerResourceRef.NotifyOfAttackCompleted(Outer, 5, bAllreadyToldAttackManagerCurrentAttackIsDone);            
        }
        else
        {
            Outer.CurrentSentinelCombatManagerResourceRef.NotifyOfAttackFailedToStart(Outer, 5);
        }
    }
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
    Outer.SentinelPawn.SetAimInfoForDirectFireStrike(InEnemy.Location, InEnemy, -1, -1, Outer.SentinelPawn.TuneDataSentinel.HieghtOffTargetPointForDirectFire);
    //return;    
}

event NotifyAIResourceChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

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

function HaveRequiredAccessForForStrikingDuringRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function DoesStillNeedToMoveCloserToEnemyForRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function PerformBestRangedStikeBasedOnDistanceToTarget()
{
    CurStrikeCmd = Outer.CmdMedRangeDirectFireStrike(EnemyForAttack,, 1);
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

    return Class'LPSM_SentinelPauseBetweenStrikes';
    //return ReturnValue;    
}

function ShouldEndRangedAttackAfterStrikes()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function MoveToEnemyForRangedStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function StikeLaneStillValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
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
