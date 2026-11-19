class LPAIControllerSentinel extends LPAIControllerAkridStationary
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SentinelPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CmdStatus_SepiaAttack[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrenttSentinelCombatManagerAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentSentinelCombatManagerResourceRef;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerformingAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCurrentlyAllowedToTurtle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLaserScanRight;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFinishedSearch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool DesignerForceTurtle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool DesignerForceBlockTurtle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool DesignerForceSearch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool DesignerForceBlockSearch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool DesignerInStealthMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeLaunchedMedRangeStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeCheckedForMedRangeStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeAllowedNextMedRangeStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeLaunchedLongRangeStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeCheckedForLongRangeStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeAllowedNextLongRangeStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentTurtleState[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmountOfDamageToTakeBeforeNextTurtle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmountOfDamageTakingSinceLastTurtle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentLaserAimLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RandomAimLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LaserScanSpeed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SweepAngle;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL PSCompSearchBeam[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL DecalComp[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DistanceForCloseRangeAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CloseAttackChance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NormalAttackChance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CoverAttackChance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentSearchTarget;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SearchArc;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SearchDistance;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SearchImpactParticle[524289];

// Export ULPAIControllerSentinel::execProcessStimulus(FFrame&, void* const)
native function ProcessStimulus()
{
    local /*0x97E50000-0x00000000*/ private @NULL E[8388609];
    local /*0x97E50000-0x00000000*/ private byte Type[8388609];
    local /*0x97E50000-0x00000000*/ private name EventName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated event @NULL SpawnParticle()
{
    local /*0x97E50000-0x00000400*/ private @NULL PSC[8388609], CustomParticleComp;

    // End:0xA3
    if((PSC != none) && int(WorldInfo.NetMode) != int(NM_DedicatedServer))
    {
        CustomParticleComp = new (self) PSC.Class (PSC);
        AttachComponent(CustomParticleComp);
        CustomParticleComp.SetActive(true);
    }
    //return;    
}

function OnSetSentinelTurtleState()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x43
    if(Action.InputLinks[0].bHasImpulse)
    {
        DesignerForceTurtle = true;
    }
    // End:0x86
    if(Action.InputLinks[1].bHasImpulse)
    {
        DesignerForceTurtle = false;
    }
    // End:0xCA
    if(Action.InputLinks[2].bHasImpulse)
    {
        DesignerForceBlockTurtle = true;
    }
    // End:0x10E
    if(Action.InputLinks[3].bHasImpulse)
    {
        DesignerForceBlockTurtle = false;
    }
    // End:0x15D
    if(Action.InputLinks[4].bHasImpulse)
    {
        DesignerInStealthMode = !DesignerInStealthMode;
    }
    // End:0x1AD
    if(Action.InputLinks[5].bHasImpulse)
    {
        DesignerForceSearch = true;
        DesignerForceBlockSearch = false;
    }
    // End:0x1F1
    if(Action.InputLinks[6].bHasImpulse)
    {
        DesignerForceSearch = false;
    }
    // End:0x241
    if(Action.InputLinks[7].bHasImpulse)
    {
        DesignerForceBlockSearch = true;
        DesignerForceSearch = false;
    }
    // End:0x285
    if(Action.InputLinks[8].bHasImpulse)
    {
        DesignerForceBlockSearch = false;
    }
    //return;    
}

function OnSetSentinelCombatMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x4A
    if(Action.UpdateCloseRange)
    {
        CloseAttackChance = Action.CloseRangeChance;
    }
    // End:0x94
    if(Action.UpdateNormalAttacks)
    {
        NormalAttackChance = Action.NormalChance;
    }
    // End:0xDE
    if(Action.UpdateCover)
    {
        CoverAttackChance = Action.CoverChance;
    }
    // End:0x128
    if(Action.UpdateCloseRangeAttackDistance)
    {
        DistanceForCloseRangeAttack = Action.CloseRangeAttackDistance;
    }
    //return;    
}

function SelectCurrentAttackType()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float AttackChance, CurProb, rangeToTarget;

    AttackChance = FRand();
    // End:0xE6
    if(int(LPPawn(TargetOfAttack).CoverType) != int(0))
    {
        CurProb = 1.0000000;
        CurProb = CurProb - CoverAttackChance.SingleShotChance;
        // End:0x98
        if(AttackChance > CurProb)
        {
            return 5;
        }
        CurProb = CurProb - CoverAttackChance.BurstChance;
        // End:0xE3
        if(AttackChance > CurProb)
        {
            return 8;
        }
        return 2;
    }
    rangeToTarget = VSize(TargetOfAttack.Location - Pawn.Location);
    // End:0x1EF
    if(rangeToTarget < DistanceForCloseRangeAttack)
    {
        CurProb = 1.0000000;
        CurProb = CurProb - CloseAttackChance.SingleShotChance;
        // End:0x1A1
        if(AttackChance > CurProb)
        {
            return 5;
        }
        CurProb = CurProb - CloseAttackChance.BurstChance;
        // End:0x1EC
        if(AttackChance > CurProb)
        {
            return 8;
        }
        return 2;
    }
    CurProb = 1.0000000;
    CurProb = CurProb - NormalAttackChance.SingleShotChance;
    // End:0x249
    if(AttackChance > CurProb)
    {
        return 5;
    }
    CurProb = CurProb - NormalAttackChance.BurstChance;
    // End:0x294
    if(AttackChance > CurProb)
    {
        return 8;
    }
    return 2;
    //return ReturnValue;    
}

function GetCurrentAttackDesirabilityScaler()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], rangeToTarget;
    local /*0x97E50000-0x00000000*/ private @NULL possibleEnemy;

    possibleEnemy = LPPawn(TargetOfAttack);
    // End:0x44
    if(possibleEnemy.InStruggleMode)
    {
        return -1.0000000;
    }
    // End:0xFB
    if(int(LPPawn(TargetOfAttack).CoverType) != int(0))
    {
        // End:0xAA
        if(int(TypeOfAttack) == int(5))
        {
            return CoverAttackChance.SingleShotChance;            
        }
        else
        {
            // End:0xDE
            if(int(TypeOfAttack) == int(8))
            {
                return CoverAttackChance.BurstChance;                
            }
            else
            {
                return CoverAttackChance.MortarChance;
            }
        }
    }
    rangeToTarget = VSize(TargetOfAttack.Location - Pawn.Location);
    // End:0x1E1
    if(rangeToTarget < DistanceForCloseRangeAttack)
    {
        // End:0x190
        if(int(TypeOfAttack) == int(5))
        {
            return CloseAttackChance.SingleShotChance;            
        }
        else
        {
            // End:0x1C4
            if(int(TypeOfAttack) == int(8))
            {
                return CloseAttackChance.BurstChance;                
            }
            else
            {
                return CloseAttackChance.MortarChance;
            }
        }
    }
    // End:0x215
    if(int(TypeOfAttack) == int(5))
    {
        return NormalAttackChance.SingleShotChance;        
    }
    else
    {
        // End:0x249
        if(int(TypeOfAttack) == int(8))
        {
            return NormalAttackChance.BurstChance;            
        }
        else
        {
            return NormalAttackChance.MortarChance;
        }
    }
    //return ReturnValue;    
}

function IsThereClearLobAttackLaneFromGivenLoc()
{
    local /*0x97E50000-0x00000000*/ private @NULL PointToStrikeFrom[25296897], TargetOfAttack;
    local /*0x97E50000-0x00000000*/ private int CurrentTierToTest[8388609], TotalNumOfAttemptsToFindLobStrikeArcThisEngagement, ZoneCurrentlyIn;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function SetAttackResourceNames()
{
    MeleeResourceName = 'SentinelMeleeFormation';
    // End:0x36
    if(DesignerInStealthMode)
    {
        StrikeResourceName = 'SentinelStealthStrike';        
    }
    else
    {
        StrikeResourceName = 'strike';
    }
    //return;    
}

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(inPawn, bVehicleTransition);
    SentinelPawn = LPAIPawnSentinel(inPawn);
    bPerformingAttack = false;
    LastTimeLaunchedMedRangeStrike = -1.0000000;
    LastTimeCheckedForMedRangeStrike = -1.0000000;
    TimeAllowedNextMedRangeStrike = -1.0000000;
    LastTimeLaunchedLongRangeStrike = -1.0000000;
    LastTimeCheckedForLongRangeStrike = -1.0000000;
    TimeAllowedNextLongRangeStrike = -1.0000000;
    ResetTurtleStatusVars();
    bCurrentlyAllowedToTurtle = true;
    SearchImpactParticle.SetTemplate(SentinelPawn.TuneDataSentinel.SearchImpactParticle);
    CloseAttackChance = SentinelPawn.TuneDataSentinel.CloseAttackSelection;
    NormalAttackChance = SentinelPawn.TuneDataSentinel.StandardAttackSelection;
    CoverAttackChance = SentinelPawn.TuneDataSentinel.CoverAttackSelection;
    DistanceForCloseRangeAttack = SentinelPawn.TuneDataSentinel.CloseRangeAttackRange.GetValue();
    //return;    
}

event UnPossess()
{
    // End:0x39
    if(CurrentSentinelCombatManagerResourceRef != none)
    {
        CurrentSentinelCombatManagerResourceRef.RetractAllOptionsForThisPublisher(self);
        ReleaseCombatManagerAccess();
    }
    super.UnPossess();
    //return;    
}

event Destroyed()
{
    // End:0x39
    if(CurrentSentinelCombatManagerResourceRef != none)
    {
        CurrentSentinelCombatManagerResourceRef.RetractAllOptionsForThisPublisher(self);
        ReleaseCombatManagerAccess();
    }
    CleanUpSearch();
    super.Destroyed();
    //return;    
}

function HasCombatManagerEngagementAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (CanBeMyEnemy(InEnemy)) && IsCurrenttSentinelCombatManagerAccessForThisEnemy(InEnemy);
    //return ReturnValue;    
}

function ReleaseCombatManagerAccess()
{
    // End:0x4E
    if(CurrenttSentinelCombatManagerAccess != none)
    {
        CurrenttSentinelCombatManagerAccess.Destroy();
        CurrenttSentinelCombatManagerAccess = none;
        CurrentSentinelCombatManagerResourceRef = none;
        super.ReleaseCombatManagerAccess();
    }
    //return;    
}

function IsCurrenttSentinelCombatManagerAccessForThisEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xA5
    if(CurrenttSentinelCombatManagerAccess != none)
    {
        // End:0x65
        if(CurrenttSentinelCombatManagerAccess.GetOuterActor() == InEnemy)
        {
            // End:0x62
            if(!CurrenttSentinelCombatManagerAccess.IsDestroyed())
            {
                return true;
            }            
        }
        else
        {
            CurrenttSentinelCombatManagerAccess.Destroy();
            CurrenttSentinelCombatManagerAccess = none;
            CurrentSentinelCombatManagerResourceRef = none;
            CurrentPubSubCombatManagerResourceRef = none;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetCombatManagerEngagementAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    // End:0xBE
    if(!HasCombatManagerEngagementAccess(InEnemy))
    {
        CurrenttSentinelCombatManagerAccess = InEnemy.AIResourceManager.GetAccess('SentinelCombatManager', myAIPawn);
        // End:0xBE
        if(CurrenttSentinelCombatManagerAccess != none)
        {
            CurrentSentinelCombatManagerResourceRef = LPAIResSentinelCombatManager(CurrenttSentinelCombatManagerAccess.GetResource());
            CurrentPubSubCombatManagerResourceRef = CurrentSentinelCombatManagerResourceRef;
        }
    }
    //return;    
}

function EnableAnnounceEffects()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(SentinelPawn != none)
    {
        SentinelPawn.EnableAnnounceGlow(bEnable);
    }
    //return;    
}

function IsMeleeAttackFinished()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function CheckValidRangeToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float DistToEnemy;

    // End:0x11
    if(Enemy == none)
    {
        return false;
    }
    DistToEnemy = VSize(Enemy.Location - SentinelPawn.Location);
    // End:0x9E
    if(SentinelPawn.TuneDataSentinel.DisengageSightRadius < DistToEnemy)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function IsPawnInDirectStrikeZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float seperationToEnemy2D;

    seperationToEnemy2D = SeperationToPawn2D(PawnToTest);
    // End:0x79
    if(seperationToEnemy2D < SentinelPawn.TuneDataSentinel.MinRangeForDirectBurstFireProjectileStrike.GetValue())
    {
        return true;        
    }
    return false;
    //return ReturnValue;    
}

function NotifyPlayerMeleeHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function StartAdditiveStrikeWarningRattleAnimation()
{
    local /*0x97E50000-0x00000000*/ private float RateOfAnimation[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    AnimSeqTemplate = SentinelPawn.AnimTemplateLogic_StrikeWarningRattle.GetBestSequenceTemplate(self);
    SentinelPawn.ReplicatePlayAdditiveAnimationSequence(AnimSeqTemplate, None, 0, RateOfAnimation, 0.2000000, 0.0000000, false, false);
    //return;    
}

function HasStruggleModeWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawnToCheck[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x76
    if((EnemyPawnToCheck != none) && EnemyPawnToCheck.AIResourceManager != none)
    {
        return EnemyPawnToCheck.AIResourceManager.HasTimerExpired('SentinelStruggleModeTimer');        
    }
    else
    {
        // End:0x8A
        if(EnemyPawnToCheck == none)
        {
            return false;            
        }
        else
        {
            return true;
        }
    }
    return true;
    //return ReturnValue;    
}

function ResetStruggleModeWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawnToCheck[8388609];
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    // End:0x99
    if((EnemyPawnToCheck != none) && EnemyPawnToCheck.AIResourceManager != none)
    {
        EnemyPawnToCheck.AIResourceManager.ResetTimerRange('SentinelStruggleModeTimer', MinTime, MaxTime);        
    }
    else
    {
        // End:0xAB
        if(EnemyPawnToCheck == none)
        {            
        }
    }
    //return;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;
    local /*0x97E50000-0x00000000*/ private bool bCommandWantsToOverridePawnsBasicHitReation;

    bCommandWantsToOverridePawnsBasicHitReation = false;
    curCommand = LPAICommand(CommandList);
    J0x28:

    // End:0xB4 [Loop If]
    if(curCommand != none)
    {
        // End:0x80
        if(curCommand.NotifyOfCoreHit(HitCoreIndex, AmountOfDamage, TypeOfDamage))
        {
            bCommandWantsToOverridePawnsBasicHitReation = true;
        }
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x28;
    }
    // End:0x199
    if(!bCommandWantsToOverridePawnsBasicHitReation && HitCoreIndex >= 0)
    {
        // End:0x199
        if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
        {
            SentinelPawn.GrenCurrentlyDealingWith = SentinelPawn.GetGrenadeAkridShouldHaveStuckToThisCore(HitCoreIndex);
            SentinelPawn.TimeGrenadeGlued = WorldInfo.TimeSeconds;
            DealWithGreandeJustGluedToMe(SentinelPawn.GrenCurrentlyDealingWith);
            return;
        }
    }
    //return;    
}

function SpitGrenadeBackOutTimer()
{
    SpitGrenadeBackOut(SentinelPawn.GrenCurrentlyDealingWith);
    //return;    
}

event HandlePossiblityOfNeedingToTurtle()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyCausingDamage[8388609];
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xD7
    if(((SentinelPawn.TuneDataSentinel.bAllowedToTurtle.GetValue() != float(0)) && (int(CurrentTurtleState) == int(0)) || int(CurrentTurtleState) == int(6)) && bCurrentlyAllowedToTurtle)
    {
        AmountOfDamageTakingSinceLastTurtle += AmountOfDamage;
        // End:0xD7
        if(AmountOfDamageTakingSinceLastTurtle > AmountOfDamageToTakeBeforeNextTurtle)
        {
            CmdTurtle(EnemyCausingDamage, CmdStatus_Strike, 1,, true);
        }
    }
    return false;
    //return ReturnValue;    
}

function ResetTurtleStatusVars()
{
    CurrentTurtleState = 0;
    AmountOfDamageTakingSinceLastTurtle = 0.0000000;
    AmountOfDamageToTakeBeforeNextTurtle = RandRange(SentinelPawn.TuneDataSentinel.MinAmountOfDamageToCauseTurtle.GetValue(), SentinelPawn.TuneDataSentinel.MaxAmountOfDamageToCauseTurtle.GetValue());
    //return;    
}

function CmdMedRangeDirectFireAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAnotherAttackOpportunityDel[9437185], InProcessLookForAlternateAttackOpportunityDel;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    None
    None
    CmdStatus_Strike
    0
    // End:0x65
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelMedRangeDirectFireAttack'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelMedRangeDirectFireAttack(GetActiveCommand());
    // End:0x1F5
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetProcessLookForAnotherAttackOpportunityDelegate(InProcessLookForAnotherAttackOpportunityDel);
        myCommand.SetProcessLookForAlternateAttackOpportunityDelegate(InProcessLookForAlternateAttackOpportunityDel);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMedRangeDirectFireStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelMedRangeDirectFireStrike'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelMedRangeDirectFireStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMedRangeDirectFireAttackFvs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAnotherAttackOpportunityDel[9437185], InProcessLookForAlternateAttackOpportunityDel;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    None
    None
    CmdStatus_Strike
    0
    // End:0x65
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelMedRangeDirectFireAttackFvs'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelMedRangeDirectFireAttackFvs(GetActiveCommand());
    // End:0x1F5
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetProcessLookForAnotherAttackOpportunityDelegate(InProcessLookForAnotherAttackOpportunityDel);
        myCommand.SetProcessLookForAlternateAttackOpportunityDelegate(InProcessLookForAlternateAttackOpportunityDel);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMedRangeDirectFireStrikeFvs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelMedRangeDirectFireStrikeFvs'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelMedRangeDirectFireStrikeFvs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMedRangeDirectFireAttackVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAnotherAttackOpportunityDel[9437185], InProcessLookForAlternateAttackOpportunityDel;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    None
    None
    CmdStatus_Strike
    0
    // End:0x65
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelMedRangeDirectFireAttackVs'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelMedRangeDirectFireAttackVs(GetActiveCommand());
    // End:0x1F5
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetProcessLookForAnotherAttackOpportunityDelegate(InProcessLookForAnotherAttackOpportunityDel);
        myCommand.SetProcessLookForAlternateAttackOpportunityDelegate(InProcessLookForAlternateAttackOpportunityDel);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMedRangeDirectFireStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelMedRangeDirectFireStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelMedRangeDirectFireStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdLongRangeLobAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAnotherAttackOpportunityDel[9437185], InProcessLookForAlternateAttackOpportunityDel;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    None
    None
    CmdStatus_Strike
    0
    // End:0x65
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelLongRangeLobAttack'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelLongRangeLobAttack(GetActiveCommand());
    // End:0x1F5
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetProcessLookForAnotherAttackOpportunityDelegate(InProcessLookForAnotherAttackOpportunityDel);
        myCommand.SetProcessLookForAlternateAttackOpportunityDelegate(InProcessLookForAlternateAttackOpportunityDel);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdLongRangeLobFireStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelLongRangeLobStrike'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelLongRangeLobStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdLongRangeLobAttackFvs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAnotherAttackOpportunityDel[9437185], InProcessLookForAlternateAttackOpportunityDel;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    None
    None
    CmdStatus_Strike
    0
    // End:0x65
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelLongRangeLobAttackFvs'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelLongRangeLobAttackFvs(GetActiveCommand());
    // End:0x1F5
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetProcessLookForAnotherAttackOpportunityDelegate(InProcessLookForAnotherAttackOpportunityDel);
        myCommand.SetProcessLookForAlternateAttackOpportunityDelegate(InProcessLookForAlternateAttackOpportunityDel);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdLongRangeLobFireStrikeFvs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelLongRangeLobStrikeFvs'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelLongRangeLobStrikeFvs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdLongRangeLobAttackVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAnotherAttackOpportunityDel[9437185], InProcessLookForAlternateAttackOpportunityDel;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    None
    None
    CmdStatus_Strike
    0
    // End:0x65
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelLongRangeLobAttackVs'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelLongRangeLobAttackVs(GetActiveCommand());
    // End:0x1F5
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetProcessLookForAnotherAttackOpportunityDelegate(InProcessLookForAnotherAttackOpportunityDel);
        myCommand.SetProcessLookForAlternateAttackOpportunityDelegate(InProcessLookForAlternateAttackOpportunityDel);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdLongRangeLobFireStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelLongRangeLobStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelLongRangeLobStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMedRangeBurstFireAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAnotherAttackOpportunityDel[9437185], InProcessLookForAlternateAttackOpportunityDel;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    None
    None
    CmdStatus_Strike
    0
    // End:0x65
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelBurstDirectFireAttack'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelBurstDirectFireAttack(GetActiveCommand());
    // End:0x1F5
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetProcessLookForAnotherAttackOpportunityDelegate(InProcessLookForAnotherAttackOpportunityDel);
        myCommand.SetProcessLookForAlternateAttackOpportunityDelegate(InProcessLookForAlternateAttackOpportunityDel);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMedRangeBurstFireStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelBurstDirectFireStrike'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelBurstDirectFireStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMedRangeBurstFireAttackFvs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAnotherAttackOpportunityDel[9437185], InProcessLookForAlternateAttackOpportunityDel;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    None
    None
    CmdStatus_Strike
    0
    // End:0x65
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelBurstDirectFireAttackFvs'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelBurstDirectFireAttackFvs(GetActiveCommand());
    // End:0x1F5
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetProcessLookForAnotherAttackOpportunityDelegate(InProcessLookForAnotherAttackOpportunityDel);
        myCommand.SetProcessLookForAlternateAttackOpportunityDelegate(InProcessLookForAlternateAttackOpportunityDel);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMedRangeBurstFireStrikeFvs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelBurstDirectFireStrikeFvs'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelBurstDirectFireStrikeFvs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMedRangeBurstFireAttackVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAnotherAttackOpportunityDel[9437185], InProcessLookForAlternateAttackOpportunityDel;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    None
    None
    CmdStatus_Strike
    0
    // End:0x65
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelBurstDirectFireAttackVs'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelBurstDirectFireAttackVs(GetActiveCommand());
    // End:0x1F5
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetProcessLookForAnotherAttackOpportunityDelegate(InProcessLookForAnotherAttackOpportunityDel);
        myCommand.SetProcessLookForAlternateAttackOpportunityDelegate(InProcessLookForAlternateAttackOpportunityDel);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMedRangeBurstFireStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelBurstDirectFireStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelBurstDirectFireStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Ass[8388609];
    local /*0x97E50000-0x00000000*/ private float InMinTimeOfThisDamageAssessment[8388609], InMaxTimeOfThisDamageAssessment;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelDamageAssessment'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelDamageAssessment(GetActiveCommand());
    // End:0x14F
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetActorToCareAboutWhileAssessing(Enemy2Ass);
        myCommand.SetMinTimeOfThisDamageAssessment(InMinTimeOfThisDamageAssessment);
        myCommand.SetMaxTimeOfThisDamageAssessment(InMaxTimeOfThisDamageAssessment);
        myCommand.SetAssessmentSpecialMove(Class'LPSM_SentinelDamageAssessment');
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdTurtle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Ass[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private bool IgnoreTurtleTimeRestrictions[9437185], bTurtleCausedByDamage;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    false    
    // End:0x41
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelTurtle'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelTurtle(GetActiveCommand());
    // End:0x109
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.bIgnoreTurtleTimeRestrictions = IgnoreTurtleTimeRestrictions;
        myCommand.bTurtleCausedByDamage = bTurtleCausedByDamage;
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSearchTurtle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Ass[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private bool IgnoreTurtleTimeRestrictions[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    false
    // End:0x40
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelSearchTurtle'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelSearchTurtle(GetActiveCommand());
    // End:0xB4
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSearch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Ass[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SentinelSearch'.static.InitCommand(self);
    myCommand = LPAICmd_SentinelSearch(GetActiveCommand());
    // End:0xAF
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
    }
    return myCommand;
    //return ReturnValue;    
}

function SetUpTargetLaser()
{
    //return;    
}

function FindIdealTargetLaserLocation()
{
    //return;    
}

function ShouldLaserSnapToTarget()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated event @NULL TargetBeamCreateParticleSystem()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609], ReturnValue, ThePool, PS;
    local /*0x97E50000-0x00000000*/ private int I;

    PS = SentinelPawn.TuneDataSentinel.LaserParticle;
    // End:0x1CC
    if(PS != none)
    {
        ThePool = SPEmitterPool(WorldInfo.MyEmitterPool);
        PSCompSearchBeam = ThePool.SPSpawnEmitterMeshAttachment(PS, SentinelPawn.Mesh, 'Laser', true);
        // End:0x1CC
        if(PSCompSearchBeam != none)
        {
            PSCompSearchBeam.ActivateSystem();
            PSCompSearchBeam.SetScale(1.0000000);
            I = 0;
            J0x137:

            // End:0x1CC [Loop If]
            if(I < PSCompSearchBeam.EmitterInstances.Length)
            {
                PSCompSearchBeam.SetBeamEndPoint(I, Target);
                PSCompSearchBeam.SetKillOnDeactivate(I, true);
                ++I;
                // [Loop Continue]
                goto J0x137;
            }
        }
    }
    // End:0x309
    if(SentinelPawn.TuneDataSentinel.LaserDecal != none)
    {
        DecalComp = WorldInfo.MyDecalManager.SpawnDecal(SentinelPawn.TuneDataSentinel.LaserDecal, Target, Rotator(vect(0.0000000, 0.0000000, 1.0000000)), SentinelPawn.TuneDataSentinel.DecalWidth, SentinelPawn.TuneDataSentinel.DecalHeight, 10.0000000, true,,,,,,,, 0.0000000);
    }
    return PSCompSearchBeam;
    //return ReturnValue;    
}

protected simulated function DOFTrace()
{
    local /*0x97E50000-0x00000000*/ private @NULL TraceOwner[8388609], StartTrace, EndTrace, ReturnValue, HitLocation, HitNormal,
	    HitActor;

    HitActor = TraceOwner.Trace(HitLocation, HitNormal, EndTrace, StartTrace, true,,, TraceOwner.1);
    // End:0x81
    if(HitActor == none)
    {
        HitLocation = EndTrace;
    }
    // End:0x16F
    if(HitActor != none)
    {
        // End:0x16F
        if(!HitActor.bBlockActors && HitActor.IsA('Trigger') || HitActor.IsA('TriggerVolume'))
        {
            HitActor.bProjTarget = false;
            HitLocation = DOFTrace(TraceOwner, HitLocation, EndTrace);
            HitActor.bProjTarget = true;
        }
    }
    return HitLocation;
    //return ReturnValue;    
}

function FindLaserStartPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL LaserDestinationPoint[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private float DistToEnemy, DesiredAngle;
    local /*0x97E50000-0x00000000*/ private @NULL DirToEnemy, LaserLoc;

    SweepAngle = SentinelPawn.TuneDataSentinel.SweepAngle;
    bLaserScanRight = RandRange(-1.0000000, 1.0000000) > float(0);
    DirToEnemy = LaserDestinationPoint - Pawn.Location;
    DistToEnemy = VSize(DirToEnemy);
    DirToEnemy = Normal(DirToEnemy);
    DesiredAngle = RandRange(-SweepAngle, SweepAngle);
    LaserLoc = DirToEnemy;
    LaserLoc *= (DistToEnemy * SentinelPawn.TuneDataSentinel.InitialDistToEnemy);
    LaserLoc.Z -= Pawn.GetCollisionHeight();
    LaserLoc = Class'SPAI.SPAIController'.static.RotateMe(LaserLoc, DesiredAngle);
    LaserLoc += Pawn.Location;
    return LaserLoc;
    //return ReturnValue;    
}

function SetCurrentLaserAimLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL newAimLoc[8388609];

    CurrentLaserAimLocation = newAimLoc;
    //return;    
}

function StartTargetLaser()
{
    local /*0x97E50000-0x00000000*/ private @NULL LaserDestPoint[8388609], ReturnValue;

    CurrentLaserAimLocation = FindLaserStartPoint(LaserDestPoint);
    TargetBeamCreateParticleSystem(CurrentLaserAimLocation);
    // End:0x12D
    if(myAIPawn.HeadTrackComponent != none)
    {
        SentinelPawn.HeadTrackingLocation = CurrentLaserAimLocation;
        myAIPawn.HeadTrackComponent.EnableSpecifiedLookAt(myAIPawn.HeadTrackComponent.HeadLookAt, true);
        myAIPawn.HeadTrackComponent.LookInfo.Mode = 1;
    }
    return CurrentLaserAimLocation;
    //return ReturnValue;    
}

function UpdateLaserPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL SearchTargetLoc[8388609], ReturnValue, LaserDir, EnemyDir, PawnToEnemy, PawnToLaser,
	    OffsetEnemyLoc, StartTraceLocation, EndTraceLocation, HitLocation, LaserLoc,
	    DirAiming, CrossProd;

    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private bool switchedDir;

    switchedDir = false;
    OffsetEnemyLoc = SearchTargetLoc;
    // End:0x6B
    if(Enemy != none)
    {
        OffsetEnemyLoc.Z -= Enemy.GetCollisionHeight();
    }
    PawnToEnemy = Normal(OffsetEnemyLoc - Pawn.Location);
    PawnToLaser = Normal(CurrentLaserAimLocation - Pawn.Location);
    // End:0x168
    if((PawnToEnemy Dot PawnToLaser) < Cos(SweepAngle * 0.0174533))
    {
        CrossProd = Normal(PawnToEnemy Cross PawnToLaser);
        bLaserScanRight = true;
        // End:0x15C
        if(CrossProd.Z > float(0))
        {
            bLaserScanRight = false;
        }
        switchedDir = true;
    }
    LaserLoc = CurrentLaserAimLocation;
    EnemyDir = Normal(OffsetEnemyLoc - LaserLoc);
    LaserDir = (Class'SPAI.SPAIController'.static.RotateMe(EnemyDir, float(((bLaserScanRight) ? 90 : -90))) * SentinelPawn.TuneDataSentinel.LaserScanSpeed) * ((switchedDir) ? 2.0000000 : 1.0000000);
    LaserDir += ((EnemyDir * SentinelPawn.TuneDataSentinel.LaserScanSpeed) * SentinelPawn.TuneDataSentinel.LaserForwardMoveFraction);
    LaserLoc += LaserDir;
    StartTraceLocation = Pawn.GetWeaponStartTraceLocation();
    DirAiming = Normal(LaserLoc - StartTraceLocation);
    EndTraceLocation = StartTraceLocation + (DirAiming * SentinelPawn.TuneDataSentinel.LaserMaxLength);
    HitLocation = DOFTrace(SentinelPawn, StartTraceLocation, EndTraceLocation);
    // End:0x3EF
    if(HitLocation == EndTraceLocation)
    {
        HitLocation = EndTraceLocation;
        // End:0x3EC
        if(DecalComp != none)
        {
            DecalComp.SetHidden(true);
        }        
    }
    SentinelPawn.HeadTrackingLocation = HitLocation + vect(0.0000000, 0.0000000, 95.0000000);
    // End:0x4BB
    if((SearchImpactParticle != none) && SearchImpactParticle.Template != none)
    {
        WorldInfo.MyEmitterPool.SpawnEmitter(SearchImpactParticle.Template, HitLocation);
    }
    // End:0x5D7
    if(PSCompSearchBeam != none)
    {
        I = 0;
        J0x4D5:

        // End:0x5D7 [Loop If]
        if(I < PSCompSearchBeam.EmitterInstances.Length)
        {
            PSCompSearchBeam.SetBeamSourcePoint(I, StartTraceLocation, 0);
            HitLocation.X += RandRange(-10.0000000, 10.0000000);
            HitLocation.Y += RandRange(-10.0000000, 10.0000000);
            PSCompSearchBeam.SetBeamEndPoint(I, HitLocation);
            ++I;
            // [Loop Continue]
            goto J0x4D5;
        }
    }
    // End:0x66D
    if(HasLaserFinished(HitLocation, SearchTargetLoc))
    {
        LaserLoc = SearchTargetLoc;
        MySPPawn.EndSpecialMove(Class'LPSM_SentinelSearch');
        // End:0x66A
        if((Enemy != none) && !self.DesignerInStealthMode)
        {
            bFinishedSearch = true;
        }        
    }
    SetCurrentLaserAimLocation(LaserLoc);
    return CurrentLaserAimLocation;
    //return ReturnValue;    
}

function CleanUpSearch()
{
    // End:0x9E
    if(PSCompSearchBeam != none)
    {
        PSCompSearchBeam.DeactivateSystem();
        SentinelPawn.Mesh.DetachComponent(PSCompSearchBeam);
        Class'Engine.SPObject'.static.MarkObjectAsPendingKill(PSCompSearchBeam);
        PSCompSearchBeam = none;
    }
    // End:0xF7
    if(DecalComp != none)
    {
        DecalComp.SetHidden(true);
        DecalComp.DetachFromAny();
        DecalComp = none;
    }
    // End:0x11B
    if(myAIPawn.HeadTrackComponent != none)
    {
    }
    //return;    
}

function HasLaserFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL BeamEndPoint[8388609], VectTargetPoint;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ClosestPoint, StartLoc, PC;

    StartLoc = Pawn.GetWeaponStartTraceLocation();
    ClosestPoint = Class'SPEngine.SPUtil'.static.NearestPointOnLineSegment(StartLoc, BeamEndPoint, VectTargetPoint);
    // End:0xBE
    if(VSize(VectTargetPoint - ClosestPoint) < SentinelPawn.TuneDataSentinel.CloseEnoughDistance)
    {
        return true;
    }
    // End:0x1FF
    if(Enemy == none)
    {
        // End:0x1FE
        foreach LocalPlayerControllers(Class'LPPlayerController', PC)
        {
            ClosestPoint = Class'SPEngine.SPUtil'.static.NearestPointOnLineSegment(StartLoc, BeamEndPoint, PC.Pawn.Location);
            // End:0x1FD
            if(VSize(PC.Pawn.Location - ClosestPoint) < SentinelPawn.TuneDataSentinel.CloseEnoughDistance)
            {
                Enemy = PC.Pawn;                
                return true;
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

simulated function GetRandomAimLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCover[25296897], ReturnValue, StartTraceLocation, DirToAimLocation, SlotRotation, PotentialAimLocation;

    local /*0x97E50000-0x00000000*/ private bool bFoundGoodCandidate;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation, HitNormal, HitActor;

    bFoundGoodCandidate = false;
    Idx = 0;
    J0x17:

    // End:0x133 [Loop If]
    if(!bFoundGoodCandidate && Idx < 4)
    {
        StartTraceLocation = Pawn.GetWeaponStartTraceLocation();
        DirToAimLocation = Vector(SlotRotation);
        PotentialAimLocation = StartTraceLocation + (DirToAimLocation * 2000.0000000);
        HitActor = Pawn.Trace(HitLocation, HitNormal, PotentialAimLocation, StartTraceLocation, true,,, 1);
        // End:0x125
        if((HitActor == none) || VSize(HitLocation - StartTraceLocation) > float(400))
        {
            bFoundGoodCandidate = true;
        }
        Idx++;
        // [Loop Continue]
        goto J0x17;
    }
    return PotentialAimLocation;
    //return ReturnValue;    
}

simulated function GetRandomAim()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCover[25296897], ReturnValue, BaseRotation;
    local /*0x97E50000-0x00000000*/ private float horizontalSpread, verticalSpread, maxHorizontalDegrees, maxVerticalDegrees;
    local /*0x97E50000-0x00000000*/ private int RandomFireLinkIdx, RandomFireLinkInteractionIdx;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL RandomFireLink, DestViewPt;
    local /*0x97E50000-0x00000000*/ private byte SrcType, SrcAction, DestType, DestAction;
    local /*0x97E50000-0x00000000*/ private @NULL DestInfo;

    // End:0x292
    if(FireTarget == none)
    {
        RandomFireLinkIdx = Rand(InCover.Link.Slots[InCover.SlotIdx].FireLinks.Length);
        RandomFireLink = InCover.Link.Slots[InCover.SlotIdx].FireLinks[RandomFireLinkIdx];
        RandomFireLinkInteractionIdx = Rand(RandomFireLink.Interactions.Length);
        InCover.Link.GetFireLinkTargetCoverInfo(InCover.SlotIdx, RandomFireLinkIdx, DestInfo);
        InCover.Link.UnPackFireLinkInteractionInfo(RandomFireLink.Interactions[RandomFireLinkInteractionIdx], SrcType, SrcAction, DestType, DestAction);
        DestViewPt = DestInfo.Link.GetSlotViewPoint(DestInfo.SlotIdx, DestType, DestAction);
        return Rotator(Normal(DestViewPt - Pawn.GetWeaponStartTraceLocation()));
    }
    // End:0x2F2
    if(FireTarget != none)
    {
        BaseRotation = Rotator(Normal(GetEnemyLocation(SPPawn(FireTarget), 0) - Pawn.GetWeaponStartTraceLocation()));        
    }
    else
    {
        BaseRotation = CoverGoal.Link.GetSlotRotation(CoverGoal.SlotIdx);
    }
    maxHorizontalDegrees = 30.0000000;
    maxVerticalDegrees = 10.0000000;
    horizontalSpread = ((FRand() < 0.5000000) ? maxHorizontalDegrees * 182.0444000 : -maxHorizontalDegrees * 182.0444000);
    verticalSpread = ((FRand() < 0.5000000) ? maxVerticalDegrees * 182.0444000 : -maxVerticalDegrees * 182.0444000);
    BaseRotation.Yaw += int(horizontalSpread * FRand());
    BaseRotation.Pitch += int(verticalSpread * FRand());
    return BaseRotation;
    //return ReturnValue;    
}

simulated function FindInitialRandomSearchPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return vect(0.0000000, 0.0000000, 0.0000000);
    //return ReturnValue;    
}

simulated function FindRandomSearchPointTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return vect(0.0000000, 0.0000000, 0.0000000);
    //return ReturnValue;    
}

function AssignRandomSearchNote()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], A, NewSearchTarget;
    local /*0x97E50000-0x00000000*/ private float SearchRange;
    local /*0x97E50000-0x00000000*/ private editfixedsize array TargetArray;
    local /*0x97E50000-0x00000000*/ private int Grabber;

    SearchRange = SentinelPawn.TuneDataSentinel.StealthSearchNoteDistance;
    // End:0x9B
    foreach OverlappingActors(Class'LPSentinelSearchTarget', A, SearchRange, Pawn.Location, false)
    {
        TargetArray.AddItem(A);                
    }    
    // End:0xF0
    if(TargetArray.Length == 0)
    {
        CurrentSearchTarget = none;
        MySPPawn.EndSpecialMove(Class'LPSM_SentinelSearch');
        return vect(0.0000000, 0.0000000, 0.0000000);        
    }
    else
    {
        // End:0x118
        if(TargetArray.Length == 1)
        {
            CurrentSearchTarget = TargetArray[0];            
        }
        else
        {
            Grabber = Rand(TargetArray.Length);
            CurrentSearchTarget = TargetArray[Grabber];
            NewSearchTarget = none;
            // End:0x16D
            if(CurrentSearchTarget == NewSearchTarget)
            {
            }
        }
    }
    return CurrentSearchTarget.Location;
    //return ReturnValue;    
}

function PawnDied()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    CleanUpSearch();
    super(SPGFCoverAIController).PawnDied(inPawn);
    //return;    
}

defaultproperties
{
    // Reference: ParticleSystemComponent'Default__LPAIControllerSentinel.EParticles2'
    begin object name=EParticles2 class=Class'Engine.ParticleSystemComponent'
    end object
    SearchImpactParticle=EParticles2
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerSentinel.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerSentinel.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerSentinel.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerSentinel.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerSentinel.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    bLookForAttackOpportunityWhileMovingToNonAttackLocations=true
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerSentinel.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerSentinel.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerSentinel.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    bUseVisibilityManagerComplexLOSChecks=true
    Components[0]=LPAIObjectiveManager0
}