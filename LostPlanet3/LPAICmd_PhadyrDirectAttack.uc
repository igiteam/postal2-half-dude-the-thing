class LPAICmd_PhadyrDirectAttack extends LPAICmd_LeychAttack within LPAIControllerPhadyr;

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

function GetMinSeperationToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return ConvertRangeToSeperation2D(Outer.PhadyrPawn.TuneDataPhadyr.MinRangeForAcidSpitStrike.GetValue());
    //return ReturnValue;    
}

function HaveRequiredAccessForForStrikingDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x48
    if(HasStrikeWaitTimerExpired())
    {
        GetStrikeAccess(EnemyForAttack);
        // End:0x46
        if(Outer.HaveStrikeAccess())
        {
            return true;
        }
        return false;
    }
    return false;
    //return ReturnValue;    
}

function HasStrikeWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x76
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        return EnemyForAttack.AIResourceManager.HasTimerExpired('PhadyrStrikeTimer');        
    }
    else
    {
        // End:0x8A
        if(EnemyForAttack == none)
        {
            return false;            
        }
        else
        {
            return true;
        }
    }
    //return ReturnValue;    
}

function ResetStrikeWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    // End:0x99
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        EnemyForAttack.AIResourceManager.ResetTimerRange('PhadyrStrikeTimer', MinTime, MaxTime);        
    }
    else
    {
        // End:0xAB
        if(EnemyForAttack == none)
        {            
        }
    }
    //return;    
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
    Outer.CmdPhadyrAcidSpitStrikePof(EnemyForAttack,, 1);
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

    return Class'LPSM_PhadyrPauseBetweenStrikes';
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
