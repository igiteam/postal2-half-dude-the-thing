class LPAICmd_SepiaDirectAttackVs extends LPAICmd_LeychAttack within LPAIControllerSepia;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.ReleaseAttackAccess();
    //return;    
}

event SPAborted()
{
    super(LPAICmd_Attack).SPAborted();
    Outer.ReleaseAttackAccess();
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
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x8D
    if(Outer.SepiaPawn != none)
    {
        return ConvertRangeToSeperation2D(Outer.SepiaPawn.TuneDataSepia.MaxRangeForDirectPhysicalStrikeAgainstVS.GetValue());
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
    Outer.CmdSepiaSuicideLongJumpBiteStrikeVs(EnemyForAttack,, 1);
    //return;    
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
