class LPAICmd_FireWaspRangedDirectAttack extends LPAICmd_FireWaspRangedAttack within LPAIControllerFireWasp;

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

    // End:0x4A
    if(Outer.bNeedToBringTheHammerDownForHighRateOfFlyFormationInvalidations || Outer.HasEnoughTimeExpiredBetweenStrikes(5))
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
        if(rangeToStrikeLoc > Outer.MedFlyerPawn.TuneDataMedFlyer.MaxRangeForLobFirePointBeforeAllowedToFire)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function PerformBestRangedStikeBasedOnDistanceToTarget()
{
    CurStrikeCmd = Outer.CmdFireWaspBurstStrike(EnemyForAttack,, 1);
    //return;    
}

function ShouldEndRangedAttackAfterStrikes()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bcombatMgrReadyToSting;
    local /*0x97E50000-0x00000000*/ private float rangeToTarget;

    Outer.ClosestEnemyFoundForReactiveAttack = none;
    // End:0xCA
    if(Outer.IsAnyEnemyTooClose(Outer.MedFlyerPawn.TuneDataMedFlyer.MaxSeperationToTriggerReactiveAttack.GetValue(), false, Outer.ClosestEnemyFoundForReactiveAttack, rangeToTarget))
    {
        return true;
    }
    bcombatMgrReadyToSting = Outer.IsFullPhysicalAttackAllowed(true);
    bAllreadyToldAttackManagerCurrentAttackIsDone = true;
    // End:0x11E
    if(!bcombatMgrReadyToSting)
    {
        return super.ShouldEndRangedAttackAfterStrikes();        
    }
    else
    {
        // End:0x141
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

    return Outer.MedFlyerPawn.TuneDataMedFlyer.MaxRangeForLobFirePointBeforeAllowedToFire;
    //return ReturnValue;    
}
