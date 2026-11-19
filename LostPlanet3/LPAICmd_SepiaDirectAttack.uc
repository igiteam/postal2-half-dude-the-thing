class LPAICmd_SepiaDirectAttack extends LPAICmd_LeychAttack within LPAIControllerSepia;

function Pushed()
{
    super.Pushed();
    // End:0x90
    if(Outer.SepiaPawn.TuneDataSepia.bTurnOnAttackMouthGlowAtStartOfTheAttack.GetValue() != float(0))
    {
        Outer.EnableSepiaHeadGlowEffects(true);
    }
    //return;    
}

function Popped()
{
    super.Popped();
    // End:0x90
    if(Outer.SepiaPawn.TuneDataSepia.bTurnOnAttackMouthGlowAtStartOfTheAttack.GetValue() != float(0))
    {
        Outer.EnableSepiaHeadGlowEffects(false);
    }
    Outer.MeleeFinished();
    Outer.ReleaseAttackAccess();
    //return;    
}

event SPAborted()
{
    super(LPAICmd_Attack).SPAborted();
    Outer.ReleaseAttackAccess();
    // End:0xAF
    if(Outer.SepiaPawn.TuneDataSepia.bTurnOnAttackMouthGlowAtStartOfTheAttack.GetValue() != float(0))
    {
        Outer.EnableSepiaHeadGlowEffects(false);
    }
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
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

function ShouldPerformSnapTurnBeforeMovingToDamageAssessmentIfCanNotStrikeAfterMoveToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function HaveRequiredAccessForMoveToEnemyForStrikeDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function GetCanNotStrikeAfterMoveToEnemyAndGoingToDamageAssessmentSnapTurnSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_SepiaTurnLeft180';
    //return ReturnValue;    
}

function HaveRequiredAccessForForStrikingDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.DoesSepiaHaveAccessToStrike(EnemyForAttack);
    //return ReturnValue;    
}

function ShouldTurnToFaceFocusBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function HasStrikeWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x14
    if(EnemyForAttack == none)
    {
        return false;        
    }
    else
    {
        return true;
    }
    //return ReturnValue;    
}

function ResetStrikeWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    // End:0x24
    if(EnemyForAttack == none)
    {        
    }
    //return;    
}

function GetMinSeperationToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], MinRange, MaxRange, rangeToTryFor;

    // End:0x4EF
    if(Outer.SepiaPawn != none)
    {
        MinRange = Outer.SepiaPawn.TuneDataSepia.LowEndOfRandomDesriedRangeFromTargetForDirectAttack.GetValue();
        MaxRange = Outer.SepiaPawn.TuneDataSepia.HighEndOfRandomDesriedRangeFromTargetForDirectAttack.GetValue();
        // End:0x1AB
        if(Outer.SepiaPawn.TuneDataSepia.bToggleOnlySuicideStrike)
        {
            MinRange = Outer.SepiaPawn.TuneDataSepia.HighEndOfRandomDesriedRangeFromTargetForDirectAttack.GetValue();            
        }
        else
        {
            // End:0x262
            if(Outer.SepiaPawn.TuneDataSepia.bToggleOnlyCloseRangeBitStrike)
            {
                MaxRange = Outer.SepiaPawn.TuneDataSepia.LowEndOfRandomDesriedRangeFromTargetForDirectAttack.GetValue();                
            }
            else
            {
                // End:0x38D
                if(Outer.SepiaPawn.TuneDataSepia.bToggleOnlyFastJumpBiteStrike)
                {
                    MinRange = Outer.SepiaPawn.TuneDataSepia.MaxRangeToTargetForJumpBiteStrike.GetValue() - float(75);
                    MaxRange = Outer.SepiaPawn.TuneDataSepia.MaxRangeToTargetForJumpBiteStrike.GetValue() - float(50);                    
                }
                else
                {
                    // End:0x4B5
                    if(Outer.SepiaPawn.TuneDataSepia.bToggleOnlyJumpBiteWithTellStrike)
                    {
                        MinRange = Outer.SepiaPawn.TuneDataSepia.MaxRangeToTargetForJumpBiteStrike.GetValue() - float(75);
                        MaxRange = Outer.SepiaPawn.TuneDataSepia.MaxRangeToTargetForJumpBiteStrike.GetValue() - float(50);
                    }
                }
            }
        }
        rangeToTryFor = RandRange(MinRange, MaxRange);
        return ConvertRangeToSeperation2D(rangeToTryFor);
    }
    return 200.0000000;
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
    local /*0x97E50000-0x00000000*/ private float rangeToEnemy;

    rangeToEnemy = EnemyRange();
    // End:0x90
    if(Outer.SepiaPawn.TuneDataSepia.bToggleOnlySuicideStrike)
    {
        Outer.CmdSepiaSuicideLongJumpBiteStrikePof(EnemyForAttack,, 1);
        return;        
    }
    else
    {
        // End:0x10C
        if(Outer.SepiaPawn.TuneDataSepia.bToggleOnlyCloseRangeBitStrike)
        {
            Outer.CmdSepiaBiteStrikePof(EnemyForAttack,, 1);
            return;            
        }
        else
        {
            // End:0x188
            if(Outer.SepiaPawn.TuneDataSepia.bToggleOnlyFastJumpBiteStrike)
            {
                Outer.CmdSepiaJumpBiteStrikePof(EnemyForAttack,, 1);
                return;                
            }
            else
            {
                // End:0x201
                if(Outer.SepiaPawn.TuneDataSepia.bToggleOnlyJumpBiteWithTellStrike)
                {
                    Outer.CmdSepiaJumpBiteStrikePof(EnemyForAttack,, 1);
                    return;
                }
            }
        }
    }
    // End:0x29B
    if(rangeToEnemy <= Outer.SepiaPawn.TuneDataSepia.MaxRangeToTargetForBiteStrike.GetValue())
    {
        Outer.CmdSepiaBiteStrikePof(EnemyForAttack,, 1);        
    }
    else
    {
        // End:0x335
        if(rangeToEnemy <= Outer.SepiaPawn.TuneDataSepia.MaxRangeToTargetForJumpBiteStrike.GetValue())
        {
            Outer.CmdSepiaJumpBiteStrikePof(EnemyForAttack,, 1);            
        }
        else
        {
            // End:0x3CC
            if(rangeToEnemy <= Outer.SepiaPawn.TuneDataSepia.MaxRangeToTargetForLongRangeJumpBiteStrike.GetValue())
            {
                Outer.CmdSepiaSuicideLongJumpBiteStrikePof(EnemyForAttack,, 1);
            }
        }
    }
    //return;    
}

function NeedToPerformDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function AbortMoveInForStrikeIfStrikeAccessLost()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetPauseBetweenStrikesSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_SepiaPauseBetweenStrikes';
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
