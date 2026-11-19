class LPAICmd_DefenderRamAttackBase extends LPAICmd_MedFlyerDirectAttack within LPAIControllerDefender;

function Pushed()
{
    super.Pushed();
    Outer.ReleaseAdHocSquadMgrAccess();
    Outer.UseAnimationAggressive();
    //return;    
}

function Popped()
{
    Outer.DefenderPawn.bRamAggressiveOnFlag = false;
    // End:0xCF
    if((EnemyForAttack != none) && LPPlayerController(EnemyForAttack.Controller) != none)
    {
        LPPlayerController(EnemyForAttack.Controller).NotifyOfAttentionDrawingAttackEnded(Outer.DefenderPawn);
    }
    Outer.NotifyCombatManagerOfAttackCompleted(21, NumberOfStrikesDoneSoFarThisAttack <= 0, false, false);
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function ShouldPerformAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
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
    Outer.CmdStatus_RamAttack.StartingRamAttack(InEnemy);
    // End:0xE9
    if((InEnemy != none) && LPPlayerController(InEnemy.Controller) != none)
    {
        LPPlayerController(InEnemy.Controller).NotifyOfAttentionDrawingAttackStarted(Outer.DefenderPawn);
    }
    //return;    
}

function GetMinSeperationToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return ConvertRangeToSeperation2D(Outer.DefenderPawn.TuneDataDefender.MaxDistanceAwayToTryRamAttackPof.GetValue());
    //return ReturnValue;    
}

function DoesStillNeedToMoveCloserToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function StartAnnounceSpecialMove()
{
    Outer.CmdStatus_RamAttack.StartingAttackAnnounce();
    super(LPAICmd_LeychAttack).StartAnnounceSpecialMove();
    //return;    
}

function GetShortAnnounceSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_DefenderRamStartPof';
    //return ReturnValue;    
}

function GetLongAnnounceSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_DefenderRamStartPof';
    //return ReturnValue;    
}

function DoesThisAttackCommandCareIfItsFormationAccessHasChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

event NotifyAIResourceChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function NotifyFormationLocationBecomingInvalid()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocBecomingInvalid[8388609];

    //return;    
}

function OnEngagementAttackOptionApproved()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function NotifyAIResourceAccessLost()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function PerformBestStikeBasedOnDistanceToTarget()
{
    ++NumberOfStrikesDoneSoFarThisAttack;
    //return;    
}

defaultproperties
{
    bInterruptible=false
}