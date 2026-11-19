class LPAIControllerMedFlyer extends LPAIControllerAkrid
    config(AI)
    hidecategories(AnimDependency,Navigation);

enum FlyerCombatBehaviorType
{
    FlyerCombatBehavior_None,       // 0
    FlyerCombatBehavior_CloseQuatersBattle,// 1
    FlyerCombatBehavior_RangedAttack,// 2
    FlyerCombatBehavior_MAX         // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MedFlyerPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL GrenCurrentlyDealingWith[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeGrenadeGlued;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DefaultMaxNodeDistanceForFlyCanReachCheck[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ClosestEnemyFoundForReactiveAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CmdStatus_Orbit[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OrbitAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentOrbitFormationResourceRef;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name OrbitResourceName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOrbitPointMoved[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOrbitSlotsDisabled[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanDoDirectFireProjectileAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNeedToBringTheHammerDownForHighRateOfFlyFormationInvalidations[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bReactingToBeingOnFire[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBonzi[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInPursiutMode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxNumOfAttemptsToFindDirectFireStrikeLocationDuringAnUpdate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RangedFireLocationToStrikeFrom[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private export @NULL DirectFireStrikeLaneBlockageImpactInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinRangedStrikeZoneDistance[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinRangedStrikeZoneDistanceSq[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxRangedStrikeZoneDistance[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxRangedStrikeZoneDistanceSq[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TotalNumberOfPossibileLobFireLocationsPerOrbitSlot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TotalNumberOfPossibileDirectFireLocationsPerOrbitSlot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeToldAtInvalidOrbitPosition[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CountOfHighRateFormationInvalidations[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name OrbitCombatMgrResourceName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentOrbitCombatMgrAccess[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentOrbitCombatMgrResourceRef[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastProjectileAttackTime[536870913];

// Export ULPAIControllerMedFlyer::execIsDestinationInsideAiMesh(FFrame&, void* const)
native function IsDestinationInsideAiMesh()
{
    local /*0x97E50000-0x00000000*/ private @NULL InDestination[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIControllerMedFlyer::execNotifyCombatManagerToRetractAllOptionsForThisPublisher(FFrame&, void* const)
native function NotifyCombatManagerToRetractAllOptionsForThisPublisher();

// Export ULPAIControllerMedFlyer::execIsFlyerInTightMovementArea(FFrame&, void* const)
native function IsFlyerInTightMovementArea()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIControllerMedFlyer::execProcessForPossibleHammerTheAttackerOnFlyFormationInvalidation(FFrame&, void* const)
native final function ProcessForPossibleHammerTheAttackerOnFlyFormationInvalidation()
{
    local /*0x97E50000-0x00000000*/ private bool bNeedToIncrementCounter[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AttackingPawn[8388609];


}

// Export ULPAIControllerMedFlyer::execGetHowOfftenToRestartSearchingForValidAttackOptions(FFrame&, void* const)
native function GetHowOfftenToRestartSearchingForValidAttackOptions()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIControllerMedFlyer::execIsPawnInsideMaxRangedStrikeZone(FFrame&, void* const)
native final function IsPawnInsideMaxRangedStrikeZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function SetAttackResourceNames()
{
    OrbitResourceName = 'MedFlyerOrbitFormation';
    StrikeResourceName = 'strike';
    //return;    
}

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL newLocData;
    local /*0x97E50000-0x00000000*/ private int maxNumberOfAltArcs;

    super.Possess(inPawn, bVehicleTransition);
    MedFlyerPawn = LPAIPawnMedFlyer(inPawn);
    GrenCurrentlyDealingWith = none;
    ClosestEnemyFoundForReactiveAttack = none;
    bReactingToBeingOnFire = false;
    bBonzi = false;
    bInPursiutMode = false;
    LastTimeToldAtInvalidOrbitPosition = -1.0000000;
    CountOfHighRateFormationInvalidations = 0;
    bNeedToBringTheHammerDownForHighRateOfFlyFormationInvalidations = false;
    // End:0xF9
    if(MedFlyerPawn.TuneDataMedFlyer.bCanDoDirectFireProjectileAttack.GetValue() == float(0))
    {
        bCanDoDirectFireProjectileAttack = false;        
    }
    else
    {
        bCanDoDirectFireProjectileAttack = true;
    }
    MaxNumOfAttemptsToFindDirectFireStrikeLocationDuringAnUpdate = int(MedFlyerPawn.TuneDataMedFlyer.MaxNumOfAttemptsToFindDirectFireStrikeLocationDuringAnUpdate.GetValue());
    DefaultMaxNodeDistanceForFlyCanReachCheck = MedFlyerPawn.TuneDataMedFlyer.DefaultMaxNodeDistanceForFlyCanReachCheck.GetValue();
    MinRangedStrikeZoneDistance = MedFlyerPawn.TuneDataMedFlyer.MinRangedStrikeZoneDistance.GetValue();
    MaxRangedStrikeZoneDistance = MedFlyerPawn.TuneDataMedFlyer.MaxRangedStrikeZoneDistance.GetValue();
    MinRangedStrikeZoneDistanceSq = MinRangedStrikeZoneDistance * MinRangedStrikeZoneDistance;
    MaxRangedStrikeZoneDistanceSq = MaxRangedStrikeZoneDistance * MaxRangedStrikeZoneDistance;
    TotalNumberOfPossibileDirectFireLocationsPerOrbitSlot = int(MedFlyerPawn.TuneDataMedFlyer.NumOfDirectFireStrikeLocationsToLookForAtEachRange * float(MedFlyerPawn.TuneDataMedFlyer.RangedDirectFireStrikeInfoByTier.Length));
    TotalNumberOfPossibileLobFireLocationsPerOrbitSlot = int(MedFlyerPawn.TuneDataMedFlyer.NumOfLobStrikeLocationsToLookForAtEachRange * float(MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByTier.Length));
    iter = 0;
    J0x388:

    // End:0x3D8 [Loop If]
    if(iter < TotalNumberOfPossibileLobFireLocationsPerOrbitSlot)
    {
        MedFlyerPawn.LobStrikeLocValidationInfoList.AddItem(newLocData);        
        ++iter;
        // [Loop Continue]
        goto J0x388;
    }
    maxNumberOfAltArcs = 0;
    iter = 0;
    J0x3EE:

    // End:0x4F8 [Loop If]
    if(iter < MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByZone.Length)
    {
        // End:0x4EA
        if(maxNumberOfAltArcs < MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByZone[iter].AltDesiredZPercentOfLobList.Length)
        {
            maxNumberOfAltArcs = MedFlyerPawn.TuneDataMedFlyer.RangedLobStrikeInfoByZone[iter].AltDesiredZPercentOfLobList.Length;
        }
        ++iter;
        // [Loop Continue]
        goto J0x3EE;
    }
    iter = 0;
    J0x503:

    // End:0x553 [Loop If]
    if(iter < maxNumberOfAltArcs)
    {
        MedFlyerPawn.LobStrikeLocValidationInfoList.AddItem(newLocData);        
        ++iter;
        // [Loop Continue]
        goto J0x503;
    }
    iter = 0;
    J0x55E:

    // End:0x5AE [Loop If]
    if(iter < TotalNumberOfPossibileDirectFireLocationsPerOrbitSlot)
    {
        MedFlyerPawn.DirectFireStrikeLocValidationInfoList.AddItem(newLocData);        
        ++iter;
        // [Loop Continue]
        goto J0x55E;
    }
    //return;    
}

event UnPossess()
{
    // End:0x19
    if(CurrentOrbitCombatMgrResourceRef != none)
    {
        ReleaseOrbitEngagementAccess();
    }
    super(LPAIController).UnPossess();
    //return;    
}

event Destroyed()
{
    super(LPAIController).Destroyed();
    // End:0x23
    if(CurrentOrbitCombatMgrResourceRef != none)
    {
        ReleaseOrbitEngagementAccess();
    }
    //return;    
}

function CleanUpForBeingPutBackIntoPoolOnDeath()
{
    super.CleanUpForBeingPutBackIntoPoolOnDeath();
    GrenCurrentlyDealingWith = none;
    ClosestEnemyFoundForReactiveAttack = none;
    bReactingToBeingOnFire = false;
    bBonzi = false;
    bInPursiutMode = false;
    LastTimeToldAtInvalidOrbitPosition = -1.0000000;
    CountOfHighRateFormationInvalidations = 0;
    bNeedToBringTheHammerDownForHighRateOfFlyFormationInvalidations = false;
    // End:0x83
    if(CurrentOrbitCombatMgrResourceRef != none)
    {
        ReleaseOrbitEngagementAccess();
    }
    //return;    
}

function UseAnimationAggressive()
{
    //return;    
}

function UseAnimationNormal()
{
    //return;    
}

function HaveOrbitAccess()
{
    local /*0x97E50000-0x00000000*/ private bool bLogReasonForNoAccess[9437185], ReturnValue;

    false
    // End:0x41
    if(IsValidResourceAccessForEnemy(OrbitAccess))
    {
        // End:0x2F
        if(!bOrbitPointMoved)
        {
            return true;            
        }
        else
        {
            // End:0x3C
            if(bLogReasonForNoAccess)
            {
            }
            return false;
        }        
    }
    else
    {
        // End:0x4E
        if(bLogReasonForNoAccess)
        {
        }
        return false;
    }
    return false;
    //return ReturnValue;    
}

function ShouldUseOrbitResource()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return OrbitResourceName != 'None';
    //return ReturnValue;    
}

function CanHaveOrbitAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xCD
    if((((ShouldUseOrbitResource()) && TheEnemy != none) && TheEnemy.AIResourceManager != none) && TheEnemy.AIResourceManager.HasResource(OrbitResourceName))
    {
        return TheEnemy.AIResourceManager.IsAccessPossible(OrbitResourceName, myAIPawn);
    }
    return false;
    //return ReturnValue;    
}

function GetOrbitAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];

    -1.0000000
    // End:0x233
    if((!bOrbitSlotsDisabled && ShouldUseOrbitResource()) && !HaveOrbitAccess())
    {
        // End:0xFA
        if(ShouldUseLeadersOrbitSlotLocation())
        {
            // End:0xF7
            if((TheEnemy != none) && TheEnemy.AIResourceManager != none)
            {
                OrbitAccess = GetLeadersOrbitSlotLocationAccess(TheEnemy);
                // End:0xF7
                if(OrbitAccess != none)
                {
                    CurrentOrbitFormationResourceRef = LPAIResSurroundFlyFormation(TheEnemy.AIResourceManager.GetResourceGroup(OrbitResourceName));
                }
            }            
        }
        else
        {
            // End:0x233
            if(((TheEnemy != none) && TheEnemy.AIResourceManager != none) && TheEnemy.AIResourceManager.IsUsable(OrbitResourceName, myAIPawn))
            {
                OrbitAccess = TheEnemy.AIResourceManager.GetAccess(OrbitResourceName, myAIPawn, RevokeTolerance);
                // End:0x233
                if(OrbitAccess != none)
                {
                    CurrentOrbitFormationResourceRef = LPAIResSurroundFlyFormation(TheEnemy.AIResourceManager.GetResourceGroup(OrbitResourceName));
                }
            }
        }
    }
    bOrbitPointMoved = false;
    //return;    
}

function DisableMeleeAccess()
{
    local /*0x97E50000-0x00000000*/ private bool bDisable[8388609];

    // End:0x45
    if(bDisable != bOrbitSlotsDisabled)
    {
        // End:0x30
        if(bDisable)
        {
            ReleaseOrbitAccess();
        }
        bOrbitSlotsDisabled = bDisable;
    }
    //return;    
}

event NotifyAIResourceAccessLost()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4F
    if(((OrbitAccess != none) && ResourceAccess == OrbitAccess) && OrbitAccess.GetResource() != none)
    {
    }
    return super(LPAIController).NotifyAIResourceAccessLost(ResourceAccess);
    //return ReturnValue;    
}

event ReleaseOrbitAccess()
{
    // End:0x5B
    if(OrbitAccess != none)
    {
        // End:0x26
        if(AmAdHocSquadLeader())
        {
            TellAllFollowersThatLeaderIsReleasingOrbitAccess();
        }
        OrbitAccess.Destroy();
        OrbitAccess = none;
        CurrentOrbitFormationResourceRef = none;
    }
    //return;    
}

function HaveOrbitEngagementAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (CanBeMyEnemy(InEnemy)) && IsCurrentOrbitCombatMgrAccessForThisEnemy(InEnemy);
    //return ReturnValue;    
}

function ReleaseOrbitEngagementAccess()
{
    // End:0x73
    if(CurrentOrbitCombatMgrAccess != none)
    {
        // End:0x3E
        if(CurrentOrbitCombatMgrResourceRef != none)
        {
            CurrentOrbitCombatMgrResourceRef.RetractAllOptionsForThisPublisher(self);
        }
        CurrentOrbitCombatMgrAccess.Destroy();
        CurrentOrbitCombatMgrAccess = none;
        CurrentOrbitCombatMgrResourceRef = none;
    }
    //return;    
}

function IsCurrentOrbitCombatMgrAccessForThisEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x9A
    if(CurrentOrbitCombatMgrAccess != none)
    {
        // End:0x65
        if(CurrentOrbitCombatMgrAccess.GetOuterActor() == InEnemy)
        {
            // End:0x62
            if(!CurrentOrbitCombatMgrAccess.IsDestroyed())
            {
                return true;
            }            
        }
        else
        {
            CurrentOrbitCombatMgrAccess.Destroy();
            CurrentOrbitCombatMgrAccess = none;
            CurrentOrbitCombatMgrResourceRef = none;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetOrbitEngagementAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    // End:0x11
    if(InEnemy == none)
    {
        return;
    }
    // End:0xCB
    if(!HaveOrbitEngagementAccess(InEnemy))
    {
        CurrentOrbitCombatMgrAccess = InEnemy.AIResourceManager.GetAccess(OrbitCombatMgrResourceName, myAIPawn);
        // End:0xCB
        if(CurrentOrbitCombatMgrAccess != none)
        {
            CurrentOrbitCombatMgrResourceRef = LPAIResMedFlyerFromOrbitSlotEngagement(CurrentOrbitCombatMgrAccess.GetResource());
            // End:0xCB
            if(CurrentOrbitCombatMgrResourceRef == none)
            {
            }
        }
    }
    //return;    
}

function ReleaseStrikeAccessAtTheEndOfStrikesBeforeDamageAssessment()
{
    //return;    
}

function ReleaseRangedStrikeAccessAtTheEndOfStrikesBeforeDamageAssessment()
{
    //return;    
}

function ReleaseStrikeAccessForNeedingToReattemptMoveInToStrike()
{
    //return;    
}

function ReleaseRangedStrikeAccessForNeedingToReattemptMoveInToStrike()
{
    //return;    
}

function EnableAnnounceEffects()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(MedFlyerPawn != none)
    {
        MedFlyerPawn.EnableAnnounceGlow(bEnable);
    }
    //return;    
}

function EnableStingAttackGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(MedFlyerPawn != none)
    {
        MedFlyerPawn.EnableStingAttackGlow(bEnable);
    }
    //return;    
}

function EnableStruggleAttackGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(MedFlyerPawn != none)
    {
        MedFlyerPawn.EnableStruggleAttackGlow(bEnable);
    }
    //return;    
}

function EnableAggressiveGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(MedFlyerPawn != none)
    {
        MedFlyerPawn.EnableAggressiveGlow(bEnable);
    }
    //return;    
}

function EnableRangedBodyAttackGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(MedFlyerPawn != none)
    {
        MedFlyerPawn.EnableRangedBodyAttackGlow(bEnable);
    }
    //return;    
}

function EnableRangedWingAttackGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(MedFlyerPawn != none)
    {
        MedFlyerPawn.EnableRangedWingAttackGlow(bEnable);
    }
    //return;    
}

function NotifyKnockedOutOfAttackByTakingToMuchDamage()
{
    //return;    
}

function IsOrbitAttackFinished()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

event NumberOfAttackersFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL PotentialEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], orbitCount, baseCount, totalCount;

    // End:0x144
    if(PotentialEnemy != none)
    {
        // End:0x144
        if((PotentialEnemy != none) && PotentialEnemy.AIResourceManager != none)
        {
            baseCount = super(LPAIController).NumberOfAttackersFor(PotentialEnemy);
            orbitCount = PotentialEnemy.AIResourceManager.NumUsers(OrbitResourceName);
            // End:0x10D
            if((orbitCount > 0) && PotentialEnemy.AIResourceManager.DoesResourceHaveUser(OrbitResourceName, myAIPawn))
            {
                --orbitCount;
            }
            totalCount = orbitCount + baseCount;
            // End:0x144
            if(totalCount > 0)
            {
                return totalCount;
            }
        }
    }
    return 0;
    //return ReturnValue;    
}

function HasStruggleModeWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawnToCheck[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x76
    if((EnemyPawnToCheck != none) && EnemyPawnToCheck.AIResourceManager != none)
    {
        return EnemyPawnToCheck.AIResourceManager.HasTimerExpired('MedFlyerStruggleModeTimer');        
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
        EnemyPawnToCheck.AIResourceManager.ResetTimerRange('MedFlyerStruggleModeTimer', MinTime, MaxTime);        
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

function HasCurrentOrbitCombatMgrResourceRef()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(CurrentOrbitCombatMgrResourceRef != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

event PublishNewAttackOptionToCombatManager()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private float PublishersDesirabilityOfAttackScaler[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForceChoice[9437185], ReturnValue;

    1.0000000
    false
    // End:0x5A
    if(CurrentOrbitCombatMgrResourceRef != none)
    {
        return CurrentOrbitCombatMgrResourceRef.PublishNewAttackOption(self, TypeOfAttack, PublishersDesirabilityOfAttackScaler, bForceChoice);
    }
    return false;
    //return ReturnValue;    
}

function NotifyThisCombatManagerOfAttackCompleted()
{
    local /*0x97E50000-0x00000000*/ private @NULL CombatMgr[8388609];
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFailedToStart[8388609], bAllreadyAssumedCurrentAttackIsDone, bCleanOutAllAttackOptions;
    local /*0x97E50000-0x00000000*/ private @NULL ctrlThatPublishedAttack;

    false
    false
    // End:0xF2
    if(CombatMgr != none)
    {
        // End:0x3F
        if(!AmAdHocSquadLeader())
        {
            ctrlThatPublishedAttack = GetAdHocSquadLeader();            
        }
        else
        {
            ctrlThatPublishedAttack = self;
        }
        // End:0x8B
        if(bFailedToStart)
        {
            CombatMgr.NotifyOfAttackFailedToStart(ctrlThatPublishedAttack, TypeOfAttack);            
        }
        else
        {
            CombatMgr.NotifyOfAttackCompleted(ctrlThatPublishedAttack, TypeOfAttack, bAllreadyAssumedCurrentAttackIsDone);
        }
        // End:0xF2
        if(bCleanOutAllAttackOptions)
        {
            CombatMgr.CleanOutAllAttackOptions();
        }
    }
    //return;    
}

function NotifyCombatManagerOfAttackCompleted()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFailedToStart[8388609], bAllreadyAssumedCurrentAttackIsDone, bCleanOutAllAttackOptions;

    false
    false
    // End:0x53
    if(CurrentOrbitCombatMgrResourceRef != none)
    {
        NotifyThisCombatManagerOfAttackCompleted(CurrentOrbitCombatMgrResourceRef, TypeOfAttack, bFailedToStart, bAllreadyAssumedCurrentAttackIsDone, bCleanOutAllAttackOptions);
    }
    //return;    
}

function NotifyThisCombatManagerOfStrikeCompleted()
{
    local /*0x97E50000-0x00000000*/ private @NULL CombatMgr[8388609];
    local /*0x97E50000-0x00000000*/ private byte TypeOfStrike[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ctrlThatPublishedAttack;

    // End:0x80
    if(CombatMgr != none)
    {
        // End:0x35
        if(!AmAdHocSquadLeader())
        {
            ctrlThatPublishedAttack = GetAdHocSquadLeader();            
        }
        else
        {
            ctrlThatPublishedAttack = self;
        }
        // End:0x80
        if(CombatMgr != none)
        {
            CombatMgr.NotifyOfStrikeActionCompleted(ctrlThatPublishedAttack, TypeOfStrike);
        }
    }
    //return;    
}

function NotifyCombatManagerOfStrikeCompleted()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];

    // End:0x2B
    if(CurrentOrbitCombatMgrResourceRef != none)
    {
        NotifyThisCombatManagerOfStrikeCompleted(CurrentOrbitCombatMgrResourceRef, TypeOfAttack);
    }
    //return;    
}

function AskThisCombatManagerHasEnoughTimeExpiredBetweenStrikes()
{
    local /*0x97E50000-0x00000000*/ private @NULL CombatMgr[8388609];
    local /*0x97E50000-0x00000000*/ private byte TypeOfStrike[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ctrlThatPublishedAttack;

    // End:0x81
    if(CombatMgr != none)
    {
        // End:0x35
        if(!AmAdHocSquadLeader())
        {
            ctrlThatPublishedAttack = GetAdHocSquadLeader();            
        }
        else
        {
            ctrlThatPublishedAttack = self;
        }
        // End:0x81
        if(CombatMgr != none)
        {
            return CombatMgr.HasEnoughTimeExpiredBetweenStrikes(ctrlThatPublishedAttack, TypeOfStrike);
        }
    }
    return false;
    //return ReturnValue;    
}

function HasEnoughTimeExpiredBetweenStrikes()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfStrike[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2C
    if(CurrentOrbitCombatMgrResourceRef != none)
    {
        return AskThisCombatManagerHasEnoughTimeExpiredBetweenStrikes(CurrentOrbitCombatMgrResourceRef, TypeOfStrike);
    }
    return true;
    //return ReturnValue;    
}

function IsThisControllerAllowedToStayInAttackCommandWithOutHavingRequiredAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return DoesThisControllerStillHaveAnActiveAttackOption();
    //return ReturnValue;    
}

function DoesThisControllerStillHaveAnActiveAttackOption()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x30
    if(CurrentOrbitCombatMgrResourceRef != none)
    {
        return CurrentOrbitCombatMgrResourceRef.DoesPublisherHaveActiveOption(self);
    }
    return true;
    //return ReturnValue;    
}

function IsFullPhysicalAttackAllowed()
{
    local /*0x97E50000-0x00000000*/ private bool bAssumeCurrentAttackIsDone[9437185], ReturnValue;

    false
    // End:0x3F
    if(CurrentOrbitCombatMgrResourceRef != none)
    {
        return CurrentOrbitCombatMgrResourceRef.IsFullPhysicalAttackAllowed(self, bAssumeCurrentAttackIsDone);
    }
    return false;
    //return ReturnValue;    
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
    // End:0x171
    if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
    {
        J0x3F:

        // End:0xCB [Loop If]
        if(curCommand != none)
        {
            // End:0x97
            if(curCommand.NotifyOfCoreHit(HitCoreIndex, AmountOfDamage, TypeOfDamage))
            {
                bCommandWantsToOverridePawnsBasicHitReation = true;
            }
            curCommand = LPAICommand(curCommand.ChildCommand);
            // [Loop Continue]
            goto J0x3F;
        }
        // End:0x171
        if(!bCommandWantsToOverridePawnsBasicHitReation && HitCoreIndex >= 0)
        {
            // End:0x171
            if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
            {
                GrenCurrentlyDealingWith = MedFlyerPawn.GetGrenadeAkridShouldHaveStuckToThisCore(HitCoreIndex);
                TimeGrenadeGlued = WorldInfo.TimeSeconds;
                DealWithGreandeJustGluedToMe(GrenCurrentlyDealingWith);
                return;
            }
        }
    }
    //return;    
}

function NotifyPlayerMeleeHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bcommandHandleing;

    bcommandHandleing = false;
    // End:0x60
    if(CommandList != none)
    {
        bcommandHandleing = LPAICommand(CommandList).NotifyPlayerMeleeHit(PlayerPawn, ImpactLocation);
    }
    // End:0xB1
    if((MedFlyerPawn != none) && !bcommandHandleing)
    {
        MedFlyerPawn.ServerKillMelee(PlayerPawn, ImpactLocation);
    }
    return true;
    //return ReturnValue;    
}

function OnEngagementAttackOptionApproved()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;
    local /*0x97E50000-0x00000000*/ private bool attackShouldStart;

    curCommand = LPAICommand(CommandList);
    attackShouldStart = false;
    J0x28:

    // End:0xA2 [Loop If]
    if(curCommand != none)
    {
        // End:0x6E
        if(curCommand.OnEngagementAttackOptionApproved(TypeOfAttack))
        {
            attackShouldStart = true;
        }
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x28;
    }
    return attackShouldStart;
    //return ReturnValue;    
}

function OnEngagementAttackOptionPurged()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x87 [Loop If]
    if(curCommand != none)
    {
        curCommand.OnEngagementAttackOptionPurged(TypeOfAttack);
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

function IsThisAnActorThatCanCauseBehaviorChangeOnBump()
{
    local /*0x97E50000-0x00000000*/ private @NULL ActorRunningInto[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4E
    if(((Pawn(ActorRunningInto) != none) && LPAIPawnCarrier(ActorRunningInto) == none) && LPAIPawnMedFlyer(ActorRunningInto) == none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ResetReactiveAttackFlag()
{
    SetAllowedToPerformReactiveAttack();
    //return;    
}

function ResetAccumulatorsHammeringTheAttackerOnFlyFormationInvalidations()
{
    LastTimeToldAtInvalidOrbitPosition = -1.0000000;
    CountOfHighRateFormationInvalidations = 0;
    bNeedToBringTheHammerDownForHighRateOfFlyFormationInvalidations = false;
    //return;    
}

function GetMaxRangeFromMortarAlternateRangedFirePointBeforeAllowedToFire()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return MedFlyerPawn.TuneDataMedFlyer.MaxRangeForLobFirePointBeforeAllowedToFire;
    //return ReturnValue;    
}

function SpitGrenadeBackOutTimer()
{
    SpitGrenadeBackOut(GrenCurrentlyDealingWith);
    //return;    
}

function BlowMeUpAfterSwallowingGreande()
{
    // End:0xEF
    if(MedFlyerPawn.TuneDataMedFlyer.bUseTimeDelayAfterGrenadeGluedBeforeExplosion)
    {
        // End:0xEC
        if((WorldInfo.TimeSeconds - TimeGrenadeGlued) > MedFlyerPawn.TuneDataMedFlyer.DelayBetweenHitAndBoomWhenGoingThroughMassiveGrenadeExplosion)
        {
            MedFlyerPawn.bShouldRagdoll = false;
            GrenCurrentlyDealingWith.DoExplosion();
            ClearTimer('BlowMeUpAfterSwallowingGreande', self);
        }        
    }
    else
    {
        // End:0x1EF
        if((MedFlyerPawn.DrawScale * MedFlyerPawn.TuneDataMedFlyer.HowMuchToIncreaseSizePerUpdateWhenGoingThroughMassiveGrenadeExplosion) < MedFlyerPawn.TuneDataMedFlyer.MaxSizeToIncreaseSizeByWhenGoingThroughMassiveGrenadeExplosion)
        {
            MedFlyerPawn.SetDrawScale(MedFlyerPawn.DrawScale * MedFlyerPawn.TuneDataMedFlyer.HowMuchToIncreaseSizePerUpdateWhenGoingThroughMassiveGrenadeExplosion);            
        }
        else
        {
            MedFlyerPawn.bShouldRagdoll = false;
            GrenCurrentlyDealingWith.DoExplosion();
            ClearTimer('BlowMeUpAfterSwallowingGreande', self);
        }
    }
    return;
    //return;    
}

function CalculateRangedLobPointToStrikeFrom()
{
    local /*0x97E50000-0x00000000*/ private @NULL outPossibleLobFirePointToStrikeFrom[25165825], LocationToStartAttackFrom, PawnAttacking;
    local /*0x97E50000-0x00000000*/ private float HeightAboveTargetForLobRangedStrikeInUU[8388609], XY_DistanceFromTargetForLobRangedStrikeInUU, RangeToLookForMovementNode;
    local /*0x97E50000-0x00000000*/ private bool bCheckIfCanMoveToThisLocation[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL displacementToStrikePoint;

    displacementToStrikePoint = LocationToStartAttackFrom - PawnAttacking.Location;
    displacementToStrikePoint.Z = 0.0000000;
    displacementToStrikePoint = Normal(displacementToStrikePoint);
    displacementToStrikePoint = displacementToStrikePoint * XY_DistanceFromTargetForLobRangedStrikeInUU;
    displacementToStrikePoint.Z = HeightAboveTargetForLobRangedStrikeInUU;
    outPossibleLobFirePointToStrikeFrom = displacementToStrikePoint + PawnAttacking.Location;
    // End:0x111
    if(bCheckIfCanMoveToThisLocation)
    {
        // End:0x10F
        if(CanFlyToThisLocation(outPossibleLobFirePointToStrikeFrom, RangeToLookForMovementNode))
        {
            return true;
        }
        return false;
    }
    return true;
    //return ReturnValue;    
}

function @NULL CanFlyToThisLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL Flt2Pos[25296897];
    local /*0x97E50000-0x00000000*/ private float MaxNodeRange[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000400*/ private @NULL BotHandle;

    BotHandle = SPKynapseFlyingBotHandle(myAIPawn.myKynapseHandle);
    // End:0x70
    if(BotHandle.PathFinder_FlyCanReach(Flt2Pos, MaxNodeRange, MyKynapseRadius))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

event IsOnNavMesh()
{
    local /*0x97E50000-0x00000000*/ private @NULL DesiredPos[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return CanFlyToThisLocation(DesiredPos, MedFlyerPawn.TuneDataMedFlyer.DefaultMaxNodeDistanceForFlyCanReachCheck.GetValue());
    //return ReturnValue;    
}

function GetCurrentAttackDesirabilityScaler()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL possibleEnemy;
    local /*0x97E50000-0x00000000*/ private float attackScaler;

    possibleEnemy = LPPawn(TargetOfAttack);
    attackScaler = 1.0000000;
    // End:0x177
    if(possibleEnemy != none)
    {
        // End:0xA6
        if(IsEnemyInAttackArc(possibleEnemy))
        {
            attackScaler = MedFlyerPawn.TuneDataMedFlyer.InAttackArcDesirabilityOfAttackScaler.GetValue();            
        }
        else
        {
            // End:0x110
            if(int(TypeOfAttack) == int(13))
            {
                attackScaler = MedFlyerPawn.TuneDataMedFlyer.StingNotInAttackArcDesirabilityOfAttackScaler.GetValue();                
            }
            else
            {
                // End:0x177
                if(int(TypeOfAttack) == int(21))
                {
                    attackScaler = MedFlyerPawn.TuneDataMedFlyer.RamNotInAttackArcDesirabilityOfAttackScaler.GetValue();
                }
            }
        }
    }
    return attackScaler;
    //return ReturnValue;    
}

function IsDoingRamAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function IsPawnInBasicRangedStrikeZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float rangeToEnemy;

    rangeToEnemy = RangeToPawn(PawnToTest);
    // End:0xA6
    if((rangeToEnemy < MedFlyerPawn.TuneDataMedFlyer.MaxRangeForBasicRangedStrike) && rangeToEnemy > MedFlyerPawn.TuneDataMedFlyer.MinRangeForBasicRangedStrike)
    {
        return true;        
    }
    return false;
    //return ReturnValue;    
}

function IsFlyerStillInValidOrbitZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTestAgainst[8388609];
    local /*0x97E50000-0x00000000*/ private float DistanceErrorBuffer[9437185], HeightErrorBuffer, PitchErrorBufferInDegrees;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    -1.0000000
    -1.0000000
    -1.0000000
    // End:0x7C
    if(CurrentOrbitFormationResourceRef != none)
    {
        // End:0x7C
        if(CurrentOrbitFormationResourceRef.IsMyLocationInGoodOrbitLocForThisTarget(MedFlyerPawn, PawnToTestAgainst, DistanceErrorBuffer, HeightErrorBuffer, PitchErrorBufferInDegrees, self))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function ShouldUseLeadersOrbitSlotLocation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetLeadersOrbitSlotLocationAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609], ReturnValue, newAccess;

    // End:0xDD
    if((MyAdHocSquadMemberData != none) && MyAdHocSquadMemberData.CurrentSquadIn != none)
    {
        // End:0xDD
        if(MyAdHocSquadMemberData.CurrentSquadIn.CurrentLeader != none)
        {
            newAccess = MyAdHocSquadMemberData.CurrentSquadIn.CurrentLeader.GiveFollowerFormationSlotLocationAccess(TheEnemy, self);
            // End:0xDD
            if(newAccess != none)
            {                
            }
        }
    }
    return newAccess;
    //return ReturnValue;    
}

function GiveFollowerFormationSlotLocationAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609], FollowerAskingTheQ, ReturnValue, newAccess;

    // End:0xEE
    if(OrbitAccess != none)
    {
        // End:0xEB
        if((MyAdHocSquadMemberData != none) && MyAdHocSquadMemberData.CurrentSquadIn != none)
        {
            // End:0xE8
            if(MyAdHocSquadMemberData.CurrentSquadIn.CurrentLeader == self)
            {
                // End:0xE5
                if(TheEnemy == MyLPEnemy)
                {
                    newAccess = CurrentOrbitFormationResourceRef.GiveFollowerFormationSlotLocationAccess(self, FollowerAskingTheQ, OrbitAccess);
                    // End:0xE2
                    if(newAccess != none)
                    {                        
                    }                    
                }                
            }            
        }        
    }
    return newAccess;
    //return ReturnValue;    
}

function TellAllFollowersThatLeaderIsReleasingOrbitAccess()
{
    local /*0x97E50000-0x00000000*/ private int iter;

    // End:0x182
    if((MyAdHocSquadMemberData != none) && MyAdHocSquadMemberData.CurrentSquadIn != none)
    {
        iter = 0;
        J0x40:

        // End:0x182 [Loop If]
        if(iter < MyAdHocSquadMemberData.CurrentSquadIn.SquadMembers.Length)
        {
            // End:0x174
            if(MyAdHocSquadMemberData.CurrentSquadIn.SquadMembers[iter].AiCtrlOwner != self)
            {
                MyAdHocSquadMemberData.CurrentSquadIn.SquadMembers[iter].AiCtrlOwner.NotifyToFollowerLeaderIsReleasingFormationAccess(self, OrbitAccess, SPAIResFlyLocation(OrbitAccess.GetResource()));
            }
            ++iter;
            // [Loop Continue]
            goto J0x40;
        }
    }
    //return;    
}

function NotifyToFollowerLeaderIsReleasingFormationAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL LeaderGivingUp[8388609], AccessGettingReleased, LocationReleasing;

    // End:0x94
    if(((MyAdHocSquadMemberData != none) && MyAdHocSquadMemberData.CurrentSquadIn != none) && MyAdHocSquadMemberData.CurrentSquadIn.CurrentLeader == LeaderGivingUp)
    {
        // End:0x94
        if(OrbitAccess != none)
        {
            ReleaseOrbitAccess();            
        }
    }
    //return;    
}

function GetIfLeaderThinksInTightMovementArea()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xD8
    if((MyAdHocSquadMemberData != none) && MyAdHocSquadMemberData.CurrentSquadIn != none)
    {
        // End:0xD8
        if(MyAdHocSquadMemberData.CurrentSquadIn.CurrentLeader != none)
        {
            return !LPAIControllerMedFlyer(MyAdHocSquadMemberData.CurrentSquadIn.CurrentLeader).MedFlyerPawn.bAbleToPerformOpenAreaStalk;
        }
    }
    return false;
    //return ReturnValue;    
}

function NotifyFromSquadCurrentAttackerIsRemovedFromSquad()
{
    local /*0x97E50000-0x00000000*/ private @NULL SquadMemberLeaving[8388609];

    NotifyCombatManagerToRetractAllOptionsForThisPublisher();
    //return;    
}

function DrawAttackArcs()
{
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x109 [Loop If]
    if(iter < myAIPawn.TuneDataAIPawn.AttacksArcs.Length)
    {
        DrawThisAttackArc(myAIPawn.TuneDataAIPawn.AttacksArcs[iter], MedFlyerPawn.TuneDataMedFlyer.bUsePawnsAimDirInsteadOfRotation, MedFlyerPawn.TuneDataMedFlyer.DistanceFromPlayerToDrawAttackArcs);
        iter++;
        // [Loop Continue]
        goto J0x0B;
    }
    iter = 0;
    J0x114:

    // End:0x212 [Loop If]
    if(iter < myAIPawn.TuneDataAIPawn.ReactiveAttacksArcs.Length)
    {
        DrawThisAttackArc(myAIPawn.TuneDataAIPawn.ReactiveAttacksArcs[iter], MedFlyerPawn.TuneDataMedFlyer.bUsePawnsAimDirInsteadOfRotationForReactiveAttacks, MedFlyerPawn.TuneDataMedFlyer.DistanceFromPlayerToDrawReactiveAttacksArcs);
        iter++;
        // [Loop Continue]
        goto J0x114;
    }
    //return;    
}

function DrawThisAttackArc()
{
    local /*0x97E50000-0x00000000*/ private @NULL Arc2BeIn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUseAimDirInsteadOfRotation[8388609];
    local /*0x97E50000-0x00000000*/ private float DistanceFromTargetToDrawAttacksArcs[8388609];

    //return;    
}

function CmdDirectPhysicalAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[9437185], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[9437185], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    -1.0000000
    -1.0000000    
    CmdStatus_Strike
    0
    // End:0x4E
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_MedFlyerDirectAttack'.static.InitCommand(self);
    myCommand = LPAICmd_MedFlyerDirectAttack(GetActiveCommand());
    // End:0x1B6
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetResSurroundLocation(ResourceForFormation);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdBasicRangedAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAnotherAttackOpportunityDel[9437185], InProcessLookForAlternateAttackOpportunityDel, InIsThereClearRangedAttackLaneDelegate;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    None
    None
    None
    CmdStatus_Strike
    0
    // End:0x7A
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_MedFlyerBasicRangedAttack'.static.InitCommand(self);
    myCommand = LPAICmd_MedFlyerBasicRangedAttack(GetActiveCommand());
    // End:0x232
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
        myCommand.SetIsThereClearRangedAttackLaneDelegate(InIsThereClearRangedAttackLaneDelegate);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdBasicRangedDirectAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAnotherAttackOpportunityDel[9437185], InProcessLookForAlternateAttackOpportunityDel, InIsThereClearRangedAttackLaneDelegate;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    None
    None
    None
    CmdStatus_Strike
    0
    return none;
    //return ReturnValue;    
}

function CmdBasicRangedAttackVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAnotherAttackOpportunityDel[9437185], InProcessLookForAlternateAttackOpportunityDel, InIsThereClearRangedAttackLaneDelegate;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    None
    None
    None
    CmdStatus_Strike
    0
    // End:0x7A
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_MedFlyerRangedAttackVs'.static.InitCommand(self);
    myCommand = LPAICmd_MedFlyerRangedAttackVs(GetActiveCommand());
    // End:0x232
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
        myCommand.SetIsThereClearRangedAttackLaneDelegate(InIsThereClearRangedAttackLaneDelegate);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdBasicRangedAttackFvs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAnotherAttackOpportunityDel[9437185], InProcessLookForAlternateAttackOpportunityDel, InIsThereClearRangedAttackLaneDelegate;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    None
    None
    None
    CmdStatus_Strike
    0
    // End:0x7A
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_MedFlyerRangedAttackFvs'.static.InitCommand(self);
    myCommand = LPAICmd_MedFlyerRangedAttackFvs(GetActiveCommand());
    // End:0x232
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
        myCommand.SetIsThereClearRangedAttackLaneDelegate(InIsThereClearRangedAttackLaneDelegate);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMedFlyerBasicLobStrike()
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
    Class'LPAICmd_MedFlyerBasicLobStrike'.static.InitCommand(self);
    myCommand = LPAICmd_MedFlyerBasicLobStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMedFlyerBasicDirectFireStrike()
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
    Class'LPAICmd_MedFlyerBasicDirectFireStrike'.static.InitCommand(self);
    myCommand = LPAICmd_MedFlyerBasicDirectFireStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMedFlyerBasicPhysicalStrikePof()
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
    Class'LPAICmd_MedFlyerBasicPhysicalStrike'.static.InitCommand(self);
    myCommand = LPAICmd_MedFlyerBasicPhysicalStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMedFlyerOnFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL WhoSetMeOnFire[8388609], ReturnValue, myCommand;

    AbortCommand(CommandList);
    Class'LPAICmd_MedFlyerOnFire'.static.InitCommand(self);
    myCommand = LPAICmd_MedFlyerOnFire(GetActiveCommand());
    // End:0x88
    if(myCommand != none)
    {
        myCommand.SetPawnWhoSetMeOnFire(WhoSetMeOnFire);
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
    Class'LPAICmd_MedFlyerDamageAssessment'.static.InitCommand(self);
    myCommand = LPAICmd_MedFlyerDamageAssessment(GetActiveCommand());
    // End:0x14F
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetActorToCareAboutWhileAssessing(Enemy2Ass);
        myCommand.SetMinTimeOfThisDamageAssessment(InMinTimeOfThisDamageAssessment);
        myCommand.SetMaxTimeOfThisDamageAssessment(InMaxTimeOfThisDamageAssessment);
        myCommand.SetAssessmentSpecialMove(Class'LPSM_MedFlyerDamageAssessment');
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdReactiveAttackPoF()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2React2[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_MedFlyerReactiveAttack'.static.InitCommand(self);
    myCommand = LPAICmd_MedFlyerReactiveAttack(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2React2);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdReactiveAttackVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2React2[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_MedFlyerReactiveAttack'.static.InitCommand(self);
    myCommand = LPAICmd_MedFlyerReactiveAttack(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2React2);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdReactiveAttackFvs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2React2[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_MedFlyerReactiveAttack'.static.InitCommand(self);
    myCommand = LPAICmd_MedFlyerReactiveAttack(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2React2);
    }
    return myCommand;
    //return ReturnValue;    
}

defaultproperties
{
    DefaultMaxNodeDistanceForFlyCanReachCheck=300.0000000
    // Reference: LPAICmdStatus_Orbit'Default__LPAIControllerMedFlyer.LPAICmdStatus_Orbit0'
    begin object name=LPAICmdStatus_Orbit0 class=Class'LPAICmdStatus_Orbit'
    end object
    CmdStatus_Orbit=LPAICmdStatus_Orbit0
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerMedFlyer.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerMedFlyer.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerMedFlyer.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerMedFlyer.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerMedFlyer.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0 class=Class'LPAICmdStatus_Attack'
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    bAllowedToPerformReactiveAttack=true
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerMedFlyer.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerMedFlyer.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerMedFlyer.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}