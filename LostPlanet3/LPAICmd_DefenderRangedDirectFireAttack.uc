class LPAICmd_DefenderRangedDirectFireAttack extends LPAICmd_DefenderRangedAttack within LPAIControllerDefender;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.NotifyCombatManagerOfAttackCompleted(5, !(NumberOfStrikesDoneSoFarThisAttack > 0) || CurStrikeCmd != none, false, false);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function HaveRequiredAccessForForStrikingDuringRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x26
    if(Outer.HasEnoughTimeExpiredBetweenStrikes(5))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function DoesStillNeedToMoveCloserToEnemyForRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float rangeToStrikeLoc;

    // End:0xC4
    if(IsMyEnemyAlive())
    {
        rangeToStrikeLoc = VSize(Outer.RangedFireLocationToStrikeFrom - Outer.MedFlyerPawn.Location);
        // End:0xC4
        if(rangeToStrikeLoc > Outer.MedFlyerPawn.TuneDataMedFlyer.MaxRangeForDirectFirePointBeforeAllowedToFire)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function PerformBestRangedStikeBasedOnDistanceToTarget()
{
    CurStrikeCmd = Outer.CmdMedFlyerBasicDirectFireStrike(EnemyForAttack,, 1);
    //return;    
}

function ShouldEndRangedAttackAfterStrikes()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bcombatMgrReadyToSting;

    bcombatMgrReadyToSting = Outer.IsFullPhysicalAttackAllowed(true);
    bAllreadyToldAttackManagerCurrentAttackIsDone = true;
    // End:0x54
    if(!bcombatMgrReadyToSting)
    {
        return super(LPAICmd_MedFlyerBasicRangedAttack).ShouldEndRangedAttackAfterStrikes();        
    }
    else
    {
        // End:0x77
        if(ProcessLookForAlternateAttackOpportunityDelegate != none)
        {
            OnProcessLookForAnotherAttackOpportunity(false);
        }
    }
    return true;
    //return ReturnValue;    
}

function GetMaxRangeFormRangedFirePointBeforeAllowedToFire()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.MedFlyerPawn.TuneDataMedFlyer.MaxRangeForDirectFirePointBeforeAllowedToFire;
    //return ReturnValue;    
}

function OnEngagementAttackOptionPurged()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];

    // End:0x43
    if(CurStrikeCmd != none)
    {
        Outer.AbortCommand(CurStrikeCmd);
        CurStrikeCmd = none;
    }
    Outer.PopCommand(self);
    //return;    
}
