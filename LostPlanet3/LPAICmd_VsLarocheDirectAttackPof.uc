class LPAICmd_VsLarocheDirectAttackPof extends LPAICmd_LeychAttack within LPAIControllerVsLaroche;

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

event SPAborted()
{
    super(LPAICmd_Attack).SPAborted();
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

function HaveRequiredAccessForForStrikingDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldTurnToFaceFocusBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
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
    if(Outer.VsLarochePawn != none)
    {
        return ConvertRangeToSeperation2D(Outer.VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartSrightSawingStrikeVs.GetValue());
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
    // End:0xB5
    if(FRand() > 0.3000000)
    {
        // End:0x51
        if(FRand() > 0.7000000)
        {
            Outer.VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;            
        }
        else
        {
            Outer.VsLarochePawn.bPerformComboMeleeMoveThisStrike = false;
        }
        Outer.CmdVsLarocheArmSweepStrikePof(EnemyForAttack,, 1);        
    }
    else
    {
        Outer.CmdVsLarocheStrightSawingStrikePof(EnemyForAttack,, 1);
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

    return Class'LPSM_VsLarochePauseBetweenStrikes';
    //return ReturnValue;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    bGettingKnockedDown = false;
    // End:0x53
    if(Outer.VsLarochePawn != none)
    {
        AmountOfDamageReceivedSoFarThisAttack += AmountOfDamage;
        // End:0x53
        if(HandlePossibilityTookEnoughDamageToCauseBehaviorChange())
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

event NotifyOfNonCoreHit()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldFaceEnemyWhileMovingToSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

state StateCmdActive
{DamageAssessment:

    Outer.LockStrikeAccess(false);
    // End:0x11E
    if(NeedToPerformDamageAssessment())
    {
        // End:0x73
        if(ShouldTurnToFaceFocusBeforeDamageAssessment())
        {
            CurTurnToFaceCmd = Outer.CmdTurnToFaceFocus(0);
            CurTurnToFaceCmd = none;
        }
        CurDamageAssessmentCmd = Outer.CmdDamageAssessment(EnemyForAttack, 5.0000000, 5.0000000,, 1);
        CurDamageAssessmentCmd = none;
        CurDamageAssessmentCmd = none;
        NumberOfStrikesDoneSoFarThisAttack = 0;
        NumberOfStrikesToDoThisAttack = GetNumberOfStrikesToDoThisAttack();
        // End:0x11E
        if(HaveRequiredAccessForMoveToEnemyForStrikeDuringAttack())
        {
            Outer.EnableAnnounceEffects(true);
            goto 'MoveCloserToTarget';
        }
    }
    goto 'EndCommand';
    stop;                
}
