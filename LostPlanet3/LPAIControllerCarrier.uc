class LPAIControllerCarrier extends LPAIControllerAkridLarge
    config(AI)
    hidecategories(AnimDependency,Navigation);

enum eLaunchDefendersState
{
    eLaunchDefendersState_None,     // 0
    eLaunchDefendersState_MovingInForLaunch,// 1
    eLaunchDefendersState_RisingIntoLaunchPosition,// 2
    eLaunchDefendersState_RisingDoneWaitingToLoopLaunch,// 3
    eLaunchDefendersState_LoopingLaunch,// 4
    eLaunchDefendersState_LoopingDoneWaitingToEndLaunch,// 5
    eLaunchDefendersState_LoweringOutOfLaunchPos,// 6
    eLaunchDefendersState_LoweringDoneWaitingToEnd,// 7
    eLaunchDefendersState_StrikingOutOfLaunch,// 8
    eLaunchDefendersState_StrikingDoneWaitingToEnd,// 9
    eLaunchDefendersState_StoppingLaunchBecauseTookGrenInHiveCore,// 10
    eLaunchDefendersState_StartedArbitraryLaunchSpawning,// 11
    eLaunchDefendersState_DoneWithArbitraryLaunchSpawning,// 12
    eLaunchDefendersState_StartedArbitraryLaunching,// 13
    eLaunchDefendersState_MAX       // 14
};

enum eCarrierMacroCombatState
{
    eCarrierMacroCombatState_None,  // 0
    eCarrierMacroCombatState_Passive,// 1
    eCarrierMacroCombatState_Aggitated,// 2
    eCarrierMacroCombatState_Aggressive,// 3
    eCarrierMacroCombatState_Berserk,// 4
    eCarrierMacroCombatState_MAX    // 5
};

enum eCarrierStrikeTypes
{
    eCarrierStrikeTypes_None,       // 0
    eCarrierStrikeTypes_LaunchingDefenders,// 1
    eCarrierStrikeTypes_KnockDownStrikeLeft,// 2
    eCarrierStrikeTypes_KnockDownStrikeRight,// 3
    eCarrierStrikeTypes_TalonFlurryPof,// 4
    eCarrierStrikeTypes_TalonFlurryFvs,// 5
    eCarrierStrikeTypes_ComboBashVs,// 6
    eCarrierStrikeTypes_ComboBashFvs,// 7
    eCarrierStrikeTypes_PushBackPof,// 8
    eCarrierStrikeTypes_PushBackVs, // 9
    eCarrierStrikeTypes_PushBackFvs,// 10
    eCarrierStrikeTypes_SingleTalonThrustVs,// 11
    eCarrierStrikeTypes_MAX         // 12
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CarrierPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentLaunchDefendersState[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentCarrierMacroCombatState[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentCarrierStrikeAttempting[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentTauntState[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumberOfArbitraryLaunchDefenderToLaunch[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMakeArbitraryDefenderLaunchEvenLeftToRight[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMakeArbitraryDefenderLaunchBiasTowardsTop[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLastArbitraryDefenderSpawnedOnLeft[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLaunchOnFire[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLaunchTazed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLastPofKnockDownStrikeFromRight[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLastVsTalonFlurryStrikeFromRight[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bKnockedDownTargetOnLastTalonSweepStrikePof[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerformededIntialLaunchOnPrimaryTargetDetection[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJustPerformedTauntRightOutOfStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNeedsToReactAndSwellWhenBecauseAllCellsDestroyedOnEndOfCommittedBehavior[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGoodLoiterAttackLandAtLastCheck[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLoiterFormationPointMoved[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLastNotInTightArea[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLastDebugNotInTightArea[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayBeforeArbitraryDefenderLaunchSelfLaunch[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeNotifiedOfArbitraryDefenderLaunchNeeded[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDelayBeforeArbitraryDefenderLaunchCellBecomesProtected[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDelayBeforeArbitraryDefenderLaunchCellBecomesProtected[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDelayBeforeArbitraryDefenderLaunchCellBecomesUnclaimed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDelayBeforeArbitraryDefenderLaunchCellBecomesUnclaimed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDelayBeforeProtectingCellsAfterNormalDefenderLaunch[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDelayBeforeProtectingCellsAfterNormalDefenderLaunch[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ListOfCellIdxRequestsForArbitraryLaunch[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnemyForArbitraryDefenderLaunch[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumAtteptedToSpawnSoFarThisArbitraryDefenderLaunchEvolution[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumLaunchedSoFarThisArbitraryDefenderLaunchEvolution[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentCarrierAttackCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AngleToSideStepVsCosAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeKnockedPlayerDown[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeTalonBashedVs[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeEndedDirrectAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetweenDefenderElementLaunches[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RandomRangeForDefenderElementLaunchTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentDelayBetweenDefenderElementLaunches[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastDefenderElementLaunch[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastDefenderElementDestroyed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeSetFlightOfDefendersFree[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayAfterLaunchingDefendersBeforeSettingThemFree[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CarrierReactAndSwellWhenAllCellsDestroyedCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MinNumForForcedRandomArbitraryDefendersLaunch[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxNumForForcedRandomArbitraryDefendersLaunch[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ChangeToMakeEvenLeftToRightForForcedRandomArbitraryDefendersLaunch[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ChangeToBiasTowardsTopForForcedRandomArbitraryDefendersLaunch[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDelayBeforeSelfLaunchForForcedRandomArbitraryDefendersLaunch[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDelayBeforeSelfLaunchForForcedRandomArbitraryDefendersLaunch[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDelayBeforeProtectingCellsForForcedRandomArbitraryDefendersLaunch[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDelayBeforeProtectingCellsForForcedRandomArbitraryDefendersLaunch[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDelayBeforeUnclaimingCellsForForcedRandomArbitraryDefendersLaunch[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDelayBeforeUnclaimingCellsForForcedRandomArbitraryDefendersLaunch[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ChangeToLaunchOnFireForForcedRandomArbitraryDefendersLaunch[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ChangeToLaunchTazedForForcedRandomArbitraryDefendersLaunch[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StartOfLastLoiterLane[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EndOfLastLoiterLane[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LocationOfLoiterLaneBlockage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private export @NULL LoiterLaneBlockageImpactInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LoiterFormationAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name LoiterFormationResourceName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastRotation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastDebugTimeTightAreaChecked[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumLaunchSequencesTodo[536870913];

// Export ULPAIControllerCarrier::execGetCurrentCarrierMacroCombatState(FFrame&, void* const)
native final function GetCurrentCarrierMacroCombatState()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];


}

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    SetCurrentCarrierMacroCombatState(2);
    CurrentTauntState = 0;
    bNeedsToPerformGettingGrenadeInTheMouthAction = false;
    LastTimeKnockedPlayerDown = -1.0000000;
    LastTimeTalonBashedVs = -1.0000000;
    LastTimeEndedDirrectAttack = -1.0000000;
    super.Possess(inPawn, bVehicleTransition);
    CarrierPawn = LPAIPawnCarrier(inPawn);
    CurrentCarrierStrikeAttempting = 0;
    bLastPofKnockDownStrikeFromRight = false;
    bLastVsTalonFlurryStrikeFromRight = false;
    bKnockedDownTargetOnLastTalonSweepStrikePof = false;
    bJustPerformedTauntRightOutOfStrike = false;
    bPerformededIntialLaunchOnPrimaryTargetDetection = false;
    NumberOfArbitraryLaunchDefenderToLaunch = -1;
    bMakeArbitraryDefenderLaunchEvenLeftToRight = true;
    bLastArbitraryDefenderSpawnedOnLeft = true;
    bMakeArbitraryDefenderLaunchBiasTowardsTop = true;
    DelayBeforeArbitraryDefenderLaunchSelfLaunch = 3.2000000;
    TimeNotifiedOfArbitraryDefenderLaunchNeeded = -1.0000000;
    MinDelayBeforeArbitraryDefenderLaunchCellBecomesProtected = -1.0000000;
    MaxDelayBeforeArbitraryDefenderLaunchCellBecomesProtected = -1.0000000;
    MinDelayBeforeArbitraryDefenderLaunchCellBecomesUnclaimed = 2.0000000;
    MaxDelayBeforeArbitraryDefenderLaunchCellBecomesUnclaimed = 2.0000000;
    TimeOfLastDefenderElementLaunch = -1.0000000;
    TimeOfLastDefenderElementDestroyed = -1.0000000;
    CurrentDelayBetweenDefenderElementLaunches = 5.0000000;
    TimeBetweenDefenderElementLaunches = CarrierPawn.TuneDataCarrier.TimeBetweenDefenderElementLaunches.GetValue();
    RandomRangeForDefenderElementLaunchTime = CarrierPawn.TuneDataCarrier.RandomRangeForDefenderElementLaunchTime.GetValue();
    MinDelayBeforeProtectingCellsAfterNormalDefenderLaunch = CarrierPawn.TuneDataCarrier.MinDelayBeforeProtectingCellsAfterNormalDefenderLaunch.GetValue();
    MaxDelayBeforeProtectingCellsAfterNormalDefenderLaunch = CarrierPawn.TuneDataCarrier.MaxDelayBeforeProtectingCellsAfterNormalDefenderLaunch.GetValue();
    LastTimeSetFlightOfDefendersFree = -1.0000000;
    EnemyForArbitraryDefenderLaunch = none;
    CurrentCarrierAttackCmd = none;
    NumAtteptedToSpawnSoFarThisArbitraryDefenderLaunchEvolution = -1;
    NumLaunchedSoFarThisArbitraryDefenderLaunchEvolution = -1;
    bNeedsToReactAndSwellWhenBecauseAllCellsDestroyedOnEndOfCommittedBehavior = false;
    CarrierReactAndSwellWhenAllCellsDestroyedCmd = none;
    DelayAfterLaunchingDefendersBeforeSettingThemFree = CarrierPawn.TuneDataCarrier.DelayAfterLaunchingDefendersBeforeSettingThemFree.GetValue();
    Class'SPEngine.SPUtil'.static.SetHalfCosAngRange(CarrierPawn.TuneDataCarrier.AngleToSideStepVsDuringNormalMovement.GetValue(), AngleToSideStepVsCosAngRange);
    //return;    
}

event UnPossess()
{
    super(LPAIController).UnPossess();
    //return;    
}

event Destroyed()
{
    super(LPAIController).Destroyed();
    //return;    
}

function SetAttackResourceNames()
{
    MeleeResourceName = 'IceCrabMelee';
    LoiterFormationResourceName = 'CarrierLoiterFormation';
    StrikeResourceName = 'strike';
    //return;    
}

function ReleaseAllAttackAccess()
{
    super(LPAIController).ReleaseAllAttackAccess();
    ReleaseLoiterFormationAccess();
    //return;    
}

function ReleaseLoiterFormationAccess()
{
    // End:0x39
    if(LoiterFormationAccess != none)
    {
        LoiterFormationAccess.Destroy();
        LoiterFormationAccess = none;
    }
    //return;    
}

function ShouldUseLoiterFormationResource()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return LoiterFormationResourceName != 'None';
    //return ReturnValue;    
}

function HaveLoiterFormationAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !ShouldUseLoiterFormationResource() || (IsValidResourceAccessForEnemy(LoiterFormationAccess)) && !bLoiterFormationPointMoved;
    //return ReturnValue;    
}

function GetLoiterFormationAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];

    -1.0000000
    // End:0x101
    if((ShouldUseLoiterFormationResource()) && !HaveLoiterFormationAccess())
    {
        // End:0x101
        if(((TheEnemy != none) && TheEnemy.AIResourceManager != none) && TheEnemy.AIResourceManager.IsUsable(LoiterFormationResourceName, myAIPawn))
        {
            LoiterFormationAccess = TheEnemy.AIResourceManager.GetAccess(LoiterFormationResourceName, myAIPawn, RevokeTolerance);
        }
    }
    bLoiterFormationPointMoved = false;
    //return;    
}

event NumberOfAttackersFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL PotentialEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], loiterCount, parentCount;

    loiterCount = 0;
    parentCount = 0;
    // End:0x123
    if(PotentialEnemy != none)
    {
        parentCount = super(LPAIController).NumberOfAttackersFor(PotentialEnemy);
        // End:0x123
        if((PotentialEnemy != none) && PotentialEnemy.AIResourceManager != none)
        {
            loiterCount = PotentialEnemy.AIResourceManager.NumUsers(LoiterFormationResourceName);
            // End:0x123
            if((loiterCount > 0) && PotentialEnemy.AIResourceManager.DoesResourceHaveUser(LoiterFormationResourceName, myAIPawn))
            {
                --loiterCount;
            }
        }
    }
    return parentCount + loiterCount;
    //return ReturnValue;    
}

event DelegateCarrierMovingToEngageEnemyAvoidance()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bAvoid;
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest;

    bAvoid = true;
    PawnToTest = Pawn(Obstacle);
    // End:0x4E
    if(PawnToTest == MyLPEnemy)
    {
        bAvoid = false;        
    }
    else
    {
        // End:0x86
        if(IsThisActorTheVsAndInGivenAvoidanceZone(PawnToTest, AngleToSideStepVsCosAngRange, MyLPEnemy))
        {
            bAvoid = true;            
        }
        else
        {
            // End:0xAA
            if(LPBaseVSPlayerPawn(Obstacle) != none)
            {
                bAvoid = false;
            }
        }
    }
    return bAvoid;
    //return ReturnValue;    
}

function HandlePossibleNeedToPushAwayPawnWhileNotMoving()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function SetCurrentCarrierMacroCombatState()
{
    local /*0x97E50000-0x00000000*/ private byte NewCurrentState[8388609];

    // End:0x2F
    if((int(CurrentCarrierMacroCombatState) == int(4)) && int(NewCurrentState) != int(0))
    {
        return;        
    }
    else
    {
        CurrentCarrierMacroCombatState = NewCurrentState;
    }
    // End:0x18F
    if(int(CurrentCarrierMacroCombatState) == int(4))
    {
        // End:0x18F
        if(CarrierPawn != none)
        {
            CarrierPawn.SetHiveDeflation(0.0000000);
            CarrierPawn.bDeflationStateLocked = true;
            // End:0x18F
            if((CarrierPawn.TuneDataCarrier.MaxHealthForBerserkPhase > 0) && CarrierPawn.Health > CarrierPawn.TuneDataCarrier.MaxHealthForBerserkPhase)
            {
                CarrierPawn.Health = CarrierPawn.TuneDataCarrier.MaxHealthForBerserkPhase;
            }
        }
    }
    //return;    
}

function NotifyPlayersOnly()
{
    super(LPAIController).NotifyPlayersOnly();
    //return;    
}

function ReceivedDamage()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DamageInstigator[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    super(SPGFCoverAIController).ReceivedDamage(Damage, DamageType, DamageInstigator);
    return false;
    //return ReturnValue;    
}

function NotifyLaunchedPawnDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL DefenderGoingDown[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPawnJustRemovedFromLaunchedList[8388609];

    // End:0x65
    if(!DefenderGoingDown.bHasDecrementedLaunchedDefendersAlive)
    {
        --CarrierPawn.CurrentNumberOfLaunchedDefendersAlive;
        DefenderGoingDown.bHasDecrementedLaunchedDefendersAlive = true;
    }
    // End:0x1E5
    if(DefenderGoingDown.bLaunchedIntentionally)
    {
        // End:0x1AC
        if((CarrierPawn.IntendedDefendersLaunched.Length == 0) && bPawnJustRemovedFromLaunchedList)
        {
            TimeOfLastDefenderElementDestroyed = WorldInfo.TimeSeconds;
            // End:0x1A9
            if(LastTimeSetFlightOfDefendersFree < float(0))
            {
                CurrentDelayBetweenDefenderElementLaunches = RandRange(TimeBetweenDefenderElementLaunches - RandomRangeForDefenderElementLaunchTime, TimeBetweenDefenderElementLaunches + RandomRangeForDefenderElementLaunchTime);
                // End:0x1A6
                if((int(GetCurrentCarrierMacroCombatState()) == int(2)) && !CarrierPawn.TuneDataCarrier.bOnlyProactivelyLaunchDefendersAndNothingElse)
                {
                    NumLaunchSequencesTodo--;
                    // End:0x1A6
                    if(NumLaunchSequencesTodo <= 0)
                    {
                        SetCurrentCarrierMacroCombatState(3);
                    }
                }                
            }            
        }
        else
        {
            // End:0x1E2
            if(!bPawnJustRemovedFromLaunchedList && CarrierPawn.IntendedDefendersLaunched.Length == 0)
            {
            }
        }        
    }
    //return;    
}

function HasFlightOfDefenderBeenLaunchedSinceLastDirectAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return TimeOfLastDefenderElementLaunch > LastTimeEndedDirrectAttack;
    //return ReturnValue;    
}

event NotifyThatSpecialDodgeActorDodged()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];
    local /*0x97E50000-0x00000000*/ private class DodgePerforming[8388609];

    // End:0x43
    if(CarrierPawn.IsUsingChoreography(false))
    {
        CarrierPawn.StopPawnChoreography();
    }
    super(LPAIController).NotifyThatSpecialDodgeActorDodged(Dodger, DodgePerforming);
    //return;    
}

function NotifyNeedToSetLaunchedPawnsFree()
{
    // End:0x56
    if(CarrierPawn != none)
    {
        CarrierPawn.TellLaunchedPawnsYouAreFree();
        LastTimeSetFlightOfDefendersFree = WorldInfo.TimeSeconds;
    }
    //return;    
}

function HasEnoughTimePassedBetweenDefenderLaunchs()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float timeAfterWhichNextLaunchIsAllowed;

    timeAfterWhichNextLaunchIsAllowed = TimeOfLastDefenderElementDestroyed + CurrentDelayBetweenDefenderElementLaunches;
    // End:0x4F
    if(WorldInfo.TimeSeconds > timeAfterWhichNextLaunchIsAllowed)
    {
        return true;        
    }
    return false;
    //return ReturnValue;    
}

function ForceIntentionalAllPossibleDefendersLaunch()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToLauchAt[8388609];

    CmdLaunchDefendersPof(PawnToLauchAt, CmdStatus_Strike, 0);
    //return;    
}

function ForceRandomArbitraryDefendersLaunch()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToLauchAt[8388609];
    local /*0x97E50000-0x00000000*/ private int numberToLaunch;
    local /*0x97E50000-0x00000000*/ private bool bmakeEvenLeftToRight, bbiasTowardsTop;
    local /*0x97E50000-0x00000000*/ private float delayBeforeSelfLaunch;
    local /*0x97E50000-0x00000000*/ private bool bshouldLaunchOnFire, bshouldLaunchTazed;

    numberToLaunch = Rand(MaxNumForForcedRandomArbitraryDefendersLaunch - MinNumForForcedRandomArbitraryDefendersLaunch) + MinNumForForcedRandomArbitraryDefendersLaunch;
    // End:0x5C
    if(RandRange(0.0000000, 1.0000000) < ChangeToMakeEvenLeftToRightForForcedRandomArbitraryDefendersLaunch)
    {
        bmakeEvenLeftToRight = true;        
    }
    else
    {
        bmakeEvenLeftToRight = false;
    }
    // End:0x99
    if(RandRange(0.0000000, 1.0000000) < ChangeToBiasTowardsTopForForcedRandomArbitraryDefendersLaunch)
    {
        bbiasTowardsTop = true;        
    }
    else
    {
        bbiasTowardsTop = false;
    }
    delayBeforeSelfLaunch = RandRange(MinDelayBeforeSelfLaunchForForcedRandomArbitraryDefendersLaunch, MaxDelayBeforeSelfLaunchForForcedRandomArbitraryDefendersLaunch);
    // End:0xFC
    if(RandRange(0.0000000, 1.0000000) < ChangeToLaunchOnFireForForcedRandomArbitraryDefendersLaunch)
    {
        bshouldLaunchOnFire = true;        
    }
    else
    {
        bshouldLaunchOnFire = false;
    }
    // End:0x139
    if(RandRange(0.0000000, 1.0000000) < ChangeToLaunchTazedForForcedRandomArbitraryDefendersLaunch)
    {
        bshouldLaunchTazed = true;        
    }
    else
    {
        bshouldLaunchTazed = false;
    }
    StartArbitraryDefenderLaunch(numberToLaunch, PawnToLauchAt, bmakeEvenLeftToRight, bbiasTowardsTop, delayBeforeSelfLaunch, MinDelayBeforeProtectingCellsForForcedRandomArbitraryDefendersLaunch, MaxDelayBeforeProtectingCellsForForcedRandomArbitraryDefendersLaunch, MinDelayBeforeUnclaimingCellsForForcedRandomArbitraryDefendersLaunch, MaxDelayBeforeUnclaimingCellsForForcedRandomArbitraryDefendersLaunch, -1, bshouldLaunchOnFire, bshouldLaunchTazed);
    //return;    
}

function KillAllDefendersLaunched()
{
    local /*0x97E50000-0x00000000*/ private @NULL KillerPawn[8388609];

    KillAllIntendedDefendersLaunched(KillerPawn);
    KillAllArbitraryDefendersLaunched(KillerPawn);
    //return;    
}

function KillAllIntendedDefendersLaunched()
{
    local /*0x97E50000-0x00000000*/ private @NULL KillerPawn[8388609];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private editfixedsize array defendersLaunched;

    defendersLaunched = CarrierPawn.IntendedDefendersLaunched;
    iter = 0;
    J0x33:

    // End:0x12C [Loop If]
    if(iter < defendersLaunched.Length)
    {
        defendersLaunched[iter].TakeDamage(defendersLaunched[iter].HealthMax + 1000, KillerPawn.Controller, defendersLaunched[iter].Location, Normal(defendersLaunched[iter].Velocity), Class'LPDamageTypeForced');
        ++iter;
        // [Loop Continue]
        goto J0x33;
    }
    defendersLaunched.Length = 0;
    //return;    
}

function KillAllArbitraryDefendersLaunched()
{
    local /*0x97E50000-0x00000000*/ private @NULL KillerPawn[8388609];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private editfixedsize array defendersLaunched;

    defendersLaunched = CarrierPawn.ArbitraryDefendersLaunched;
    iter = 0;
    J0x33:

    // End:0x12C [Loop If]
    if(iter < defendersLaunched.Length)
    {
        defendersLaunched[iter].TakeDamage(defendersLaunched[iter].HealthMax + 1000, KillerPawn.Controller, defendersLaunched[iter].Location, Normal(defendersLaunched[iter].Velocity), Class'LPDamageTypeForced');
        ++iter;
        // [Loop Continue]
        goto J0x33;
    }
    defendersLaunched.Length = 0;
    //return;    
}

function SpawnDefenderAtCell()
{
    local /*0x97E50000-0x00000000*/ private bool bIntendedLaunch[8388609];
    local /*0x97E50000-0x00000000*/ private int CellToSpawnAt[8388609];
    local /*0x97E50000-0x00000000*/ private bool bOnFire[9437185], bTazed, ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL locToSpawnDefender, rotOfSpawnedDefender, newDefender;

    // End:0x45
    if(CarrierPawn.CurrentNumberOfLaunchedDefendersAlive >= CarrierPawn.AbsoluteMaxNumberOfLaunchedDefendersAllowedToHaveAliveAtOnce)
    {
        return false;
    }
    // End:0x1C8
    if((CarrierPawn != none) && CarrierPawn.IsThisCellStillValidForLaunchingDefenders(CellToSpawnAt))
    {
        CarrierPawn.Mesh.GetSocketWorldLocationAndRotation(CarrierPawn.TuneDataCarrier.HiveCellDataForDefenders[CellToSpawnAt].SocketNameForDefenderLaunch, locToSpawnDefender, rotOfSpawnedDefender);
        newDefender = CarrierPawn.GetDefenderLarvaFromPoolForPuttingInCell(bIntendedLaunch, CellToSpawnAt);
        // End:0x1C8
        if(newDefender != none)
        {
            newDefender.PutInCellForPrepForLaunch(locToSpawnDefender, rotOfSpawnedDefender, bIntendedLaunch, CellToSpawnAt, CarrierPawn, bOnFire, bTazed);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function LaunchDefenderFromCell()
{
    local /*0x97E50000-0x00000000*/ private bool bIntendedLaunch[8388609];
    local /*0x97E50000-0x00000000*/ private int IndexOfDefenderToLaunch[8388609], CellToLaunchFrom;
    local /*0x97E50000-0x00000000*/ private float MinDelayBeforeProtecting[8388609], MaxDelayBeforeProtecting;
    local /*0x97E50000-0x00000000*/ private @NULL PawnToLauchAt[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xD7
    if((bIntendedLaunch && IndexOfDefenderToLaunch < CarrierPawn.IntendedDefendersWaitingToLaunch.Length) || !bIntendedLaunch && IndexOfDefenderToLaunch < CarrierPawn.ArbitraryDefendersWaitingToLaunch.Length)
    {
        CarrierPawn.super(LPAIControllerCarrier).LaunchDefenderFromCell(bIntendedLaunch, IndexOfDefenderToLaunch, CellToLaunchFrom, MinDelayBeforeProtecting, MaxDelayBeforeProtecting, PawnToLauchAt);
        return true;        
    }
    else
    {
        // End:0xE7
        if(bIntendedLaunch)
        {            
        }
    }
    return false;
    //return ReturnValue;    
}

function StartArbitraryDefenderLaunch()
{
    local /*0x97E50000-0x00000000*/ private int numberToLaunch[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForDefenderLaunch[8388609];
    local /*0x97E50000-0x00000000*/ private bool bmakeEvenLeftToRight[8388609], bbiasTowardsTop;
    local /*0x97E50000-0x00000000*/ private float delayBeforeSelfLaunch[8388609], MinDelayBeforeProtecting, MaxDelayBeforeProtecting, MinDelayBeforeUnclaiming, MaxDelayBeforeUnclaiming;

    local /*0x97E50000-0x00000000*/ private int PreferredCell[9437185];
    local /*0x97E50000-0x00000000*/ private bool bshouldLaunchOnFire[9437185], bshouldLaunchTazed;

    5.0000000
    5.0000000
    -1        
    BuildAndReserveListOfCellsForArbitraryDefenderLaunchSpawning(numberToLaunch, bmakeEvenLeftToRight, bbiasTowardsTop, MinDelayBeforeUnclaiming, MaxDelayBeforeUnclaiming, PreferredCell);
    // End:0x19F
    if(ListOfCellIdxRequestsForArbitraryLaunch.Length > 0)
    {
        CurrentLaunchDefendersState = 11;
        NumberOfArbitraryLaunchDefenderToLaunch = ListOfCellIdxRequestsForArbitraryLaunch.Length;
        bMakeArbitraryDefenderLaunchEvenLeftToRight = bmakeEvenLeftToRight;
        bMakeArbitraryDefenderLaunchBiasTowardsTop = bbiasTowardsTop;
        DelayBeforeArbitraryDefenderLaunchSelfLaunch = delayBeforeSelfLaunch;
        TimeNotifiedOfArbitraryDefenderLaunchNeeded = WorldInfo.TimeSeconds;
        MinDelayBeforeArbitraryDefenderLaunchCellBecomesProtected = MinDelayBeforeProtecting;
        MaxDelayBeforeArbitraryDefenderLaunchCellBecomesProtected = MaxDelayBeforeProtecting;
        MinDelayBeforeArbitraryDefenderLaunchCellBecomesUnclaimed = MinDelayBeforeUnclaiming;
        MaxDelayBeforeArbitraryDefenderLaunchCellBecomesUnclaimed = MaxDelayBeforeUnclaiming;
        EnemyForArbitraryDefenderLaunch = EnemyForDefenderLaunch;
        bLastArbitraryDefenderSpawnedOnLeft = true;
        NumAtteptedToSpawnSoFarThisArbitraryDefenderLaunchEvolution = 0;
        NumLaunchedSoFarThisArbitraryDefenderLaunchEvolution = 0;
        bLaunchOnFire = bshouldLaunchOnFire;
        bLaunchTazed = bshouldLaunchTazed;
    }
    //return;    
}

function HandleArbitraryDefenderLaunchProcessing()
{
    // End:0x1E
    if(int(CurrentLaunchDefendersState) == int(11))
    {
        HandleArbitraryDefenderLaunchSpawning();
    }
    // End:0x3D
    if(int(CurrentLaunchDefendersState) == int(12))
    {
        HandleArbitraryDefenderLaunching(false);
    }
    //return;    
}

function BuildAndReserveListOfCellsForArbitraryDefenderLaunchSpawning()
{
    local /*0x97E50000-0x00000000*/ private int numberToLaunch[8388609];
    local /*0x97E50000-0x00000000*/ private bool bmakeEvenLeftToRight[8388609], bbiasTowardsTop;
    local /*0x97E50000-0x00000000*/ private float MinDelayBeforeUnclaiming[8388609], MaxDelayBeforeUnclaiming;
    local /*0x97E50000-0x00000000*/ private int PreferredCell[9437185], indexForCurrentSpawnCell;
    local /*0x97E50000-0x00000000*/ private bool bfoundLastCellOnLeftSide;
    local /*0x97E50000-0x00000000*/ private int iter, cellIdxOfCurrentCellForSpawning, cellIdxOnLeftSideOfCurrentCellForSpawning, cellIdxOnRightSideOfCurrentCellForSpawning;

    -1
    bfoundLastCellOnLeftSide = true;
    // End:0x3A
    if(PreferredCell >= 0)
    {
        indexForCurrentSpawnCell = PreferredCell;        
    }
    else
    {
        // End:0x7D
        if(bMakeArbitraryDefenderLaunchBiasTowardsTop)
        {
            cellIdxOnLeftSideOfCurrentCellForSpawning = 0;
            cellIdxOnRightSideOfCurrentCellForSpawning = CarrierPawn.NumOfCellsPerSideOfHive;            
        }
        else
        {
            cellIdxOnLeftSideOfCurrentCellForSpawning = Rand(CarrierPawn.NumOfCellsPerSideOfHive);
            cellIdxOnRightSideOfCurrentCellForSpawning = Rand(CarrierPawn.NumOfCellsPerSideOfHive) + CarrierPawn.NumOfCellsPerSideOfHive;
        }
    }
    iter = 0;
    J0xFC:

    // End:0x314 [Loop If]
    if(iter < numberToLaunch)
    {
        // End:0x161
        if(PreferredCell >= 0)
        {
            // End:0x15E
            if(!CarrierPawn.IsThisCellStillValidForLaunchingDefenders(indexForCurrentSpawnCell))
            {
                indexForCurrentSpawnCell = -1;
            }            
        }
        else
        {
            // End:0x252
            if(bMakeArbitraryDefenderLaunchEvenLeftToRight)
            {
                // End:0x1DB
                if(bfoundLastCellOnLeftSide)
                {
                    cellIdxOnRightSideOfCurrentCellForSpawning = CarrierPawn.FindNextValidForSpawnAndLaunchCellOnSideFromThisIndex(!bfoundLastCellOnLeftSide, cellIdxOnRightSideOfCurrentCellForSpawning, !bbiasTowardsTop);
                    indexForCurrentSpawnCell = cellIdxOnRightSideOfCurrentCellForSpawning;                    
                }
                else
                {
                    cellIdxOnLeftSideOfCurrentCellForSpawning = CarrierPawn.FindNextValidForSpawnAndLaunchCellOnSideFromThisIndex(!bfoundLastCellOnLeftSide, cellIdxOnLeftSideOfCurrentCellForSpawning, !bbiasTowardsTop);
                    indexForCurrentSpawnCell = cellIdxOnLeftSideOfCurrentCellForSpawning;
                }
                bfoundLastCellOnLeftSide = !bfoundLastCellOnLeftSide;                
            }
            else
            {
                cellIdxOfCurrentCellForSpawning = CarrierPawn.FindNextProtectedAndNotClaimedCellFromThisIndex(indexForCurrentSpawnCell, false);
                indexForCurrentSpawnCell = cellIdxOfCurrentCellForSpawning;
            }
        }
        // End:0x2BD
        if(indexForCurrentSpawnCell >= 0)
        {
            ListOfCellIdxRequestsForArbitraryLaunch.AddItem(indexForCurrentSpawnCell);            
        }
        // End:0x306
        if(indexForCurrentSpawnCell >= 0)
        {
            CarrierPawn.SetThisCellToClaimedForLaunchIfNotDestroyedAndNotClaimed(indexForCurrentSpawnCell, MinDelayBeforeUnclaiming, MaxDelayBeforeUnclaiming);
        }
        ++iter;
        // [Loop Continue]
        goto J0xFC;
    }
    //return;    
}

function HandleArbitraryDefenderLaunchSpawning()
{
    local /*0x97E50000-0x00000000*/ private int indexForCurrentSpawnCell;

    // End:0x180
    if(int(CurrentLaunchDefendersState) == int(11))
    {
        // End:0x5E
        if((ListOfCellIdxRequestsForArbitraryLaunch.Length > 0) && NumAtteptedToSpawnSoFarThisArbitraryDefenderLaunchEvolution < ListOfCellIdxRequestsForArbitraryLaunch.Length)
        {
            indexForCurrentSpawnCell = ListOfCellIdxRequestsForArbitraryLaunch[NumAtteptedToSpawnSoFarThisArbitraryDefenderLaunchEvolution];            
        }
        else
        {
            BuildAndReserveListOfCellsForArbitraryDefenderLaunchSpawning(NumberOfArbitraryLaunchDefenderToLaunch - NumAtteptedToSpawnSoFarThisArbitraryDefenderLaunchEvolution, bMakeArbitraryDefenderLaunchEvenLeftToRight, bMakeArbitraryDefenderLaunchBiasTowardsTop, MinDelayBeforeArbitraryDefenderLaunchCellBecomesUnclaimed, MaxDelayBeforeArbitraryDefenderLaunchCellBecomesUnclaimed, -1);
            // End:0xF1
            if((ListOfCellIdxRequestsForArbitraryLaunch.Length > 0) && NumAtteptedToSpawnSoFarThisArbitraryDefenderLaunchEvolution < ListOfCellIdxRequestsForArbitraryLaunch.Length)
            {
                indexForCurrentSpawnCell = ListOfCellIdxRequestsForArbitraryLaunch[NumAtteptedToSpawnSoFarThisArbitraryDefenderLaunchEvolution];                
            }
            else
            {
                NumAtteptedToSpawnSoFarThisArbitraryDefenderLaunchEvolution = NumberOfArbitraryLaunchDefenderToLaunch;
                CurrentLaunchDefendersState = 12;
                ListOfCellIdxRequestsForArbitraryLaunch.Length = 0;
                return;
            }
        }
        SpawnDefenderAtCell(false, indexForCurrentSpawnCell, bLaunchOnFire, bLaunchTazed);
        ++NumAtteptedToSpawnSoFarThisArbitraryDefenderLaunchEvolution;
        // End:0x180
        if(NumAtteptedToSpawnSoFarThisArbitraryDefenderLaunchEvolution >= NumberOfArbitraryLaunchDefenderToLaunch)
        {
            CurrentLaunchDefendersState = 12;
            ListOfCellIdxRequestsForArbitraryLaunch.Length = 0;
        }
    }
    //return;    
}

function HandleArbitraryDefenderLaunching()
{
    local /*0x97E50000-0x00000000*/ private bool bForceLaunch[8388609];
    local /*0x97E50000-0x00000000*/ private int indexOfWhereDefenderWasSpawned;
    local /*0x97E50000-0x00000000*/ private float timeSinceNotifiedOfArbitraryDefenderLaunchNeeded;

    // End:0x16C
    if(bForceLaunch || int(CurrentLaunchDefendersState) == int(12))
    {
        // End:0x16C
        if(bForceLaunch || HasEnoughtTimePassedToAllowLaunchOfArbitraryDefenders(timeSinceNotifiedOfArbitraryDefenderLaunchNeeded) && AreAllArbitraryDefendersReadyForLaunch())
        {
            CurrentLaunchDefendersState = 13;
            J0x63:

            // End:0x13C [Loop If]
            if(NumLaunchedSoFarThisArbitraryDefenderLaunchEvolution < NumberOfArbitraryLaunchDefenderToLaunch)
            {
                // End:0x12E
                if(NumLaunchedSoFarThisArbitraryDefenderLaunchEvolution < CarrierPawn.ArbitraryDefendersWaitingToLaunch.Length)
                {
                    indexOfWhereDefenderWasSpawned = CarrierPawn.ArbitraryDefendersWaitingToLaunch[NumLaunchedSoFarThisArbitraryDefenderLaunchEvolution].CellIdLaunchedFrom;
                    // End:0x12B
                    if(!LaunchDefenderFromCell(false, NumLaunchedSoFarThisArbitraryDefenderLaunchEvolution, indexOfWhereDefenderWasSpawned, MinDelayBeforeArbitraryDefenderLaunchCellBecomesProtected, MaxDelayBeforeArbitraryDefenderLaunchCellBecomesProtected, EnemyForArbitraryDefenderLaunch))
                    {
                    }                    
                }
                ++NumLaunchedSoFarThisArbitraryDefenderLaunchEvolution;
                // [Loop Continue]
                goto J0x63;
            }
            CarrierPawn.ArbitraryDefendersWaitingToLaunch.Length = 0;
            CurrentLaunchDefendersState = 0;            
        }
    }
    //return;    
}

final function AreAllArbitraryDefendersReadyForLaunch()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x8B [Loop If]
    if(iter < CarrierPawn.ArbitraryDefendersWaitingToLaunch.Length)
    {
        // End:0x7D
        if(CarrierPawn.ArbitraryDefendersWaitingToLaunch[iter].MyDefenderController == none)
        {
            return false;
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    return true;
    //return ReturnValue;    
}

final function HasEnoughtTimePassedToAllowLaunchOfArbitraryDefenders()
{
    local /*0x97E50000-0x00000000*/ private float timeSinceNotifiedOfArbitraryDefenderLaunchNeeded[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    timeSinceNotifiedOfArbitraryDefenderLaunchNeeded = WorldInfo.TimeSeconds - TimeNotifiedOfArbitraryDefenderLaunchNeeded;
    // End:0x5F
    if((DelayBeforeArbitraryDefenderLaunchSelfLaunch >= float(0)) && timeSinceNotifiedOfArbitraryDefenderLaunchNeeded >= DelayBeforeArbitraryDefenderLaunchSelfLaunch)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final function GetNumOfDefenderToSquirtOutWhenTakingGrenInHive()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], numToSquirt, minNumToSquirt, maxNumToSquirt;

    minNumToSquirt = int(CarrierPawn.TuneDataCarrier.MinNumOfDefenderToSquirtOutWhenTakingGrenInHive.GetValue());
    maxNumToSquirt = int(CarrierPawn.TuneDataCarrier.MaxNumOfDefenderToSquirtOutWhenTakingGrenInHive.GetValue());
    numToSquirt = Rand(maxNumToSquirt - minNumToSquirt) + minNumToSquirt;
    return numToSquirt;
    //return ReturnValue;    
}

final function GetIfShouldSpreadLaunchedDefendersEvenlyOverBothSidesOfHiveWhenTakingGrenInHive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.bShouldSpreadLaunchedDefendersEvenlyOverBothSidesOfHiveWhenTakingGrenInHive;
    //return ReturnValue;    
}

final function GetIfShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInHive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x53
    if(CarrierPawn.TuneDataCarrier.bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInHive.GetValue() != float(0))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final function GetMinDelayBeforeProtectingTheCellsWhenTakingGrenInHive()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHive.GetValue();
    //return ReturnValue;    
}

final function GetMaxDelayBeforeProtectingTheCellsWhenTakingGrenInHive()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInHive.GetValue();
    //return ReturnValue;    
}

final function GetMinDelayBeforeUnclaimingCellsWhenTakingGrenInHive()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHive.GetValue();
    //return ReturnValue;    
}

final function GetMaxDelayBeforeUnclaimingCellsWhenTakingGrenInHive()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInHive.GetValue();
    //return ReturnValue;    
}

final function GetMinDelayBeforeProtectingTheCellsWhenTakingGrenInMouth()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouth.GetValue();
    //return ReturnValue;    
}

final function GetMaxDelayBeforeProtectingTheCellsWhenTakingGrenInMouth()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingGrenInMouth.GetValue();
    //return ReturnValue;    
}

final function GetMinDelayBeforeUnclaimingCellsWhenTakingGrenInMouth()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouth.GetValue();
    //return ReturnValue;    
}

final function GetMaxDelayBeforeUnclaimingCellsWhenTakingGrenInMouth()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingGrenInMouth.GetValue();
    //return ReturnValue;    
}

final function GetMinDelayBeforeProtectingTheCellsWhenTripping()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTripping.GetValue();
    //return ReturnValue;    
}

final function GetMaxDelayBeforeProtectingTheCellsWhenTripping()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTripping.GetValue();
    //return ReturnValue;    
}

final function GetMinDelayBeforeUnclaimingCellsWhenTripping()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTripping.GetValue();
    //return ReturnValue;    
}

final function GetMaxDelayBeforeUnclaimingCellsWhenTripping()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTripping.GetValue();
    //return ReturnValue;    
}

final function GetNumOfDefenderToSquirtOutWhenTripping()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], numToSquirt, minNumToSquirt, maxNumToSquirt;

    minNumToSquirt = int(CarrierPawn.TuneDataCarrier.MinNumOfDefenderToSquirtOutWhenTripping.GetValue());
    maxNumToSquirt = int(CarrierPawn.TuneDataCarrier.MaxNumOfDefenderToSquirtOutWhenTripping.GetValue());
    numToSquirt = Rand(maxNumToSquirt - minNumToSquirt) + minNumToSquirt;
    return numToSquirt;
    //return ReturnValue;    
}

final function GetMinDelayBeforeProtectingTheCellsWhenTazing()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazing.GetValue();
    //return ReturnValue;    
}

final function GetMaxDelayBeforeProtectingTheCellsWhenTazing()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTazing.GetValue();
    //return ReturnValue;    
}

final function GetMinDelayBeforeUnclaimingCellsWhenTazing()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazing.GetValue();
    //return ReturnValue;    
}

final function GetMaxDelayBeforeUnclaimingCellsWhenTazing()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTazing.GetValue();
    //return ReturnValue;    
}

final function GetNumOfDefenderToSquirtOutWhenTazing()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], numToSquirt, minNumToSquirt, maxNumToSquirt;

    minNumToSquirt = int(CarrierPawn.TuneDataCarrier.MinNumOfDefenderToSquirtOutWhenTazing.GetValue());
    maxNumToSquirt = int(CarrierPawn.TuneDataCarrier.MaxNumOfDefenderToSquirtOutWhenTazing.GetValue());
    numToSquirt = Rand(maxNumToSquirt - minNumToSquirt) + minNumToSquirt;
    return numToSquirt;
    //return ReturnValue;    
}

final function GetMinDelayBeforeProtectingCellsAfterNormalDefenderLaunch()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return MinDelayBeforeProtectingCellsAfterNormalDefenderLaunch;
    //return ReturnValue;    
}

final function GetMaxDelayBeforeProtectingCellsAfterNormalDefenderLaunch()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return MaxDelayBeforeProtectingCellsAfterNormalDefenderLaunch;
    //return ReturnValue;    
}

final function GetMinDelayBeforeUnclaimingCellsAfterNormalDefenderLaunch()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MinDelayBeforeUnclaimingCellsAfterNormalDefenderLaunch.GetValue();
    //return ReturnValue;    
}

final function GetMaxDelayBeforeUnclaimingCellsAfterNormalDefenderLaunch()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MaxDelayBeforeUnclaimingCellsAfterNormalDefenderLaunch.GetValue();
    //return ReturnValue;    
}

final function GetNumOfDefenderToSquirtOutWhenTakingGrenInMouth()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], numToSquirt, minNumToSquirt, maxNumToSquirt;

    minNumToSquirt = int(CarrierPawn.TuneDataCarrier.MinNumOfDefenderToSquirtOutWhenTakingGrenInMouth.GetValue());
    maxNumToSquirt = int(CarrierPawn.TuneDataCarrier.MaxNumOfDefenderToSquirtOutWhenTakingGrenInMouth.GetValue());
    numToSquirt = Rand(maxNumToSquirt - minNumToSquirt) + minNumToSquirt;
    return numToSquirt;
    //return ReturnValue;    
}

final function GetIfShouldSpreadLaunchedDefendersEvenlyOverBothSidesOfHiveWhenTakingGrenInMouth()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.bShouldSpreadLaunchedDefendersEvenlyOverBothSidesOfHiveWhenTakingGrenInMouth;
    //return ReturnValue;    
}

final function GetIfShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInMouth()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x53
    if(CarrierPawn.TuneDataCarrier.bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingGrenInMouth.GetValue() != float(0))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final function GetNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoom()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], numToSquirt, minNumToSquirt, maxNumToSquirt;

    minNumToSquirt = int(CarrierPawn.TuneDataCarrier.MinNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoom.GetValue());
    maxNumToSquirt = int(CarrierPawn.TuneDataCarrier.MaxNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoom.GetValue());
    numToSquirt = Rand(maxNumToSquirt - minNumToSquirt) + minNumToSquirt;
    return numToSquirt;
    //return ReturnValue;    
}

final function GetIfShouldSpreadLaunchedDefendersEvenlyOverBothSidesOfHiveWhenGettingStunByCloseGrenBoom()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.bShouldSpreadLaunchedDefendersEvenlyOverBothSidesOfHiveWhenGettingStunByCloseGrenBoom;
    //return ReturnValue;    
}

final function GetIfShouldBiasLaunchedDefendersTowardsTopOfHiveWhenGettingStunByCloseGrenBoom()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x53
    if(CarrierPawn.TuneDataCarrier.bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenGettingStunByCloseGrenBoom.GetValue() != float(0))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final function GetDelayBeforeLaunchingWhenGettingStunByCloseGrenBoom()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.DelayBeforeLaunchingWhenGettingStunByCloseGrenBoom;
    //return ReturnValue;    
}

final function GetMinDelayBeforeProtectingTheCellsWhenGettingStunByCloseGrenBoom()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoom.GetValue();
    //return ReturnValue;    
}

final function GetMaxDelayBeforeProtectingTheCellsWhenGettingStunByCloseGrenBoom()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoom.GetValue();
    //return ReturnValue;    
}

final function GetMinDelayBeforeUnclaimingCellsWhenGettingStunByCloseGrenBoom()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoom.GetValue();
    //return ReturnValue;    
}

final function GetMaxDelayBeforeUnclaimingCellsWhenGettingStunByCloseGrenBoom()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CarrierPawn.TuneDataCarrier.MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenGettingStunByCloseGrenBoom.GetValue();
    //return ReturnValue;    
}

function ReactToGrenadeGettingStuckToThisCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreGettingHit[8388609];

    // End:0xC5
    if(CoreGettingHit == 1)
    {
        CmdCarrierTakeGrenadeInMouth(CarrierPawn.TuneDataCarrier.DurationOfStunAfterGettingGrenadeInMouth.GetValue(), LPPawn(CarrierPawn.TakeDamageParams.InstigatedByPawn), Class'LPSM_CarrierSwallowGrenadeReaction', Class'LPSM_CarrierGrenadeInMouthToStun', Class'LPSM_CarrierGrenadeInMouthStun', Class'LPSM_CarrierRecoverFromGrenadeInMouthStun', 0);        
    }
    else
    {
        // End:0x1A6
        if((CoreGettingHit >= 2) && CoreGettingHit <= 19)
        {
            bIgnoreStunCommands = false;
            CmdCarrierTakeGrenadeInHive(CarrierPawn.TuneDataCarrier.DurationOfStunAfterGettingGrenadeInHive.GetValue(), LPPawn(CarrierPawn.TakeDamageParams.InstigatedByPawn), Class'LPSM_CarrierTakeGrenadeInHiveReaction', Class'LPSM_CarrierGrenadeInHiveToStun', Class'LPSM_CarrierGrenadeInHiveStun', Class'LPSM_CarrierRecoverFromGrenadeInHiveStun', 0);
        }
    }
    //return;    
}

function ShouldEngageInMeleeInsteadOfDefenderLauncher()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float seperationToEnemy, rangeToEnemy;

    rangeToEnemy = VSize(myAIPawn.Location - EnemyPawn.Location);
    seperationToEnemy = ConvertRangeToSeperation(rangeToEnemy, EnemyPawn);
    // End:0x87
    if(seperationToEnemy < float(500))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsPawnInDirectStrikeZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float seperationToEnemy2D;

    seperationToEnemy2D = SeperationToPawn2D(PawnToTest);
    // End:0x464
    if(CarrierPawn != none)
    {
        // End:0xB7
        if((int(CurrentCarrierStrikeAttempting) == int(2)) || int(CurrentCarrierStrikeAttempting) == int(3))
        {
            // End:0xB2
            if(seperationToEnemy2D <= CarrierPawn.TuneDataCarrier.SeperationRquiredAtEndOfMoveToStartKnockdownStrikePof.GetValue())
            {
                return true;                
            }
            else
            {
                return false;
            }            
        }
        else
        {
            // End:0x12C
            if(int(CurrentCarrierStrikeAttempting) == int(4))
            {
                // End:0x127
                if(seperationToEnemy2D <= CarrierPawn.TuneDataCarrier.SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikePof.GetValue())
                {
                    return true;                    
                }
                else
                {
                    return false;
                }                
            }
            else
            {
                // End:0x1A1
                if(int(CurrentCarrierStrikeAttempting) == int(5))
                {
                    // End:0x19C
                    if(seperationToEnemy2D <= CarrierPawn.TuneDataCarrier.SeperationRquiredAtEndOfMoveToStartTalonFlurryStrikeFvs.GetValue())
                    {
                        return true;                        
                    }
                    else
                    {
                        return false;
                    }                    
                }
                else
                {
                    // End:0x216
                    if(int(CurrentCarrierStrikeAttempting) == int(11))
                    {
                        // End:0x211
                        if(seperationToEnemy2D <= CarrierPawn.TuneDataCarrier.SeperationRquiredAtEndOfMoveToStartSingleTalonThrustStrikeVs.GetValue())
                        {
                            return true;                            
                        }
                        else
                        {
                            return false;
                        }                        
                    }
                    else
                    {
                        // End:0x28B
                        if(int(CurrentCarrierStrikeAttempting) == int(6))
                        {
                            // End:0x286
                            if(seperationToEnemy2D <= CarrierPawn.TuneDataCarrier.SeperationRquiredAtEndOfMoveToStartComboBashStrikeVs.GetValue())
                            {
                                return true;                                
                            }
                            else
                            {
                                return false;
                            }                            
                        }
                        else
                        {
                            // End:0x300
                            if(int(CurrentCarrierStrikeAttempting) == int(7))
                            {
                                // End:0x2FB
                                if(seperationToEnemy2D <= CarrierPawn.TuneDataCarrier.SeperationRquiredAtEndOfMoveToStartComboBashStrikeFvs.GetValue())
                                {
                                    return true;                                    
                                }
                                else
                                {
                                    return false;
                                }                                
                            }
                            else
                            {
                                // End:0x375
                                if(int(CurrentCarrierStrikeAttempting) == int(8))
                                {
                                    // End:0x370
                                    if(seperationToEnemy2D <= CarrierPawn.TuneDataCarrier.SeperationRquiredAtEndOfMoveToStartPushBackStrikePof.GetValue())
                                    {
                                        return true;                                        
                                    }
                                    else
                                    {
                                        return false;
                                    }                                    
                                }
                                else
                                {
                                    // End:0x3EA
                                    if(int(CurrentCarrierStrikeAttempting) == int(9))
                                    {
                                        // End:0x3E5
                                        if(seperationToEnemy2D <= CarrierPawn.TuneDataCarrier.SeperationRquiredAtEndOfMoveToStartPushBackStrikeVs.GetValue())
                                        {
                                            return true;                                            
                                        }
                                        else
                                        {
                                            return false;
                                        }                                        
                                    }
                                    else
                                    {
                                        // End:0x45F
                                        if(int(CurrentCarrierStrikeAttempting) == int(10))
                                        {
                                            // End:0x45A
                                            if(seperationToEnemy2D <= CarrierPawn.TuneDataCarrier.SeperationRquiredAtEndOfMoveToStartPushBackStrikeFvs.GetValue())
                                            {
                                                return true;                                                
                                            }
                                            else
                                            {
                                                return false;
                                            }                                            
                                        }
                                        else
                                        {
                                            return false;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }        
    }
    else
    {
        return false;
    }
    return false;
    //return ReturnValue;    
}

function GetLoiterArea()
{
    local /*0x97E50000-0x00000000*/ private @NULL FwdLeft[25165825], FwdRight, RearLeft, RearRight, PawnLocation, PawnRotation;

    local /*0x97E50000-0x00000000*/ private float AddDistance[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL dRight, dLeft, dFwd, dRear, rightVec, fwdVec,
	    Z;

    0.0000000
    GetAxes(PawnRotation, fwdVec, rightVec, Z);
    dRight = rightVec * (AddDistance + CarrierPawn.TuneDataCarrier.MinSizeLoiterArea.ToRight);
    dLeft = rightVec * -AddDistance + CarrierPawn.TuneDataCarrier.MinSizeLoiterArea.ToLeft;
    dFwd = fwdVec * (AddDistance + CarrierPawn.TuneDataCarrier.MinSizeLoiterArea.InFront);
    dRear = fwdVec * -AddDistance + CarrierPawn.TuneDataCarrier.MinSizeLoiterArea.Behind;
    FwdRight = (dFwd + dRight) + PawnLocation;
    FwdLeft = (dFwd + dLeft) + PawnLocation;
    RearRight = (dRear + dRight) + PawnLocation;
    RearLeft = (dRear + dLeft) + PawnLocation;
    //return;    
}

function IsInTightStalkOrLoiterArea()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL FwdLeft, FwdRight, RearLeft, RearRight;
    local /*0x97E50000-0x00000000*/ private bool bnotInTightArea;
    local /*0x97E50000-0x00000000*/ private @NULL locationOfBlockage;
    local /*0x97E50000-0x00000000*/ private float Radius, Height;
    local /*0x97E50000-0x00000000*/ private editfixedsize array LosIgnoreActor, LosIgnoreClass;

    // End:0x84
    if(CarrierPawn != none)
    {
        // End:0x4B
        if(CarrierPawn.TuneDataCarrier.bForceTightAreaStalk)
        {
            return true;            
        }
        else
        {
            // End:0x84
            if(CarrierPawn.TuneDataCarrier.bForceOpenAreaStalk)
            {
                return false;
            }
        }
    }
    GetLoiterArea(FwdLeft, FwdRight, RearLeft, RearRight, CarrierPawn.Location, CarrierPawn.Rotation);
    CarrierPawn.GetBoundingCylinder(Radius, Height);
    LosIgnoreActor.AddItem(CarrierPawn);    
    LosIgnoreClass.AddItem(Class'LPAIPawnDefender');    
    bnotInTightArea = (((LosTestForAttackLane(FwdLeft, RearLeft, Radius, Height, locationOfBlockage, LosIgnoreActor, LosIgnoreClass)) && LosTestForAttackLane(RearLeft, RearRight, Radius, Height, locationOfBlockage, LosIgnoreActor, LosIgnoreClass)) && LosTestForAttackLane(RearRight, FwdRight, Radius, Height, locationOfBlockage, LosIgnoreActor, LosIgnoreClass)) && LosTestForAttackLane(FwdRight, FwdLeft, Radius, Height, locationOfBlockage, LosIgnoreActor, LosIgnoreClass);
    return !bnotInTightArea;
    //return ReturnValue;    
}

function DrawAttackArcs()
{
    //return;    
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

function HandleIncomingPotentialDamageForCombatStateChange()
{
    local /*0x97E50000-0x00000000*/ private int InDamage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[25165825], InstigatedBy, HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser;

    CarrierPawn.AddToDamageTracking(float(InDamage), true);
    // End:0x58
    if(CarrierPawn.HaveAccumulatedDamageForSwitchingFromPassiveToAgitatedState())
    {
        NotifyOfDangerousAmountOfDamage();
    }
    //return;    
}

function NotifyOfDoneLaunchingDefendersForThisEvolution()
{
    TimeOfLastDefenderElementLaunch = WorldInfo.TimeSeconds;
    LastTimeSetFlightOfDefendersFree = -1.0000000;
    TimeOfLastDefenderElementDestroyed = -1.0000000;
    //return;    
}

function NotifyAnimReadyToLaunchDefenders()
{
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x9F [Loop If]
    if(curCommand != none)
    {
        // End:0x6B
        if(LPAICmd_CarrierLaunchDefenders(curCommand) != none)
        {
            LPAICmd_CarrierLaunchDefenders(curCommand).NotifyAnimReadyToLaunchDefenders();
        }
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;
    local /*0x97E50000-0x00000000*/ private bool bcommandSaysItWillHandleThisCoreHit, bgrenadeActualHandled;

    // End:0x82
    if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
    {
        bgrenadeActualHandled = false;
        CarrierPawn.LastHiveCellToHaveGrenadeStuckToIt = byte(CarrierPawn.MyCoreData[HitCoreIndex].CoreID);        
    }
    else
    {
        bgrenadeActualHandled = true;
    }
    // End:0x155
    if((HitCoreIndex == 0) && CarrierPawn.AutoDeflateDamageAmount > float(0))
    {
        CarrierPawn.CurrentDeflateDamageAmount += AmountOfDamage;
        // End:0x155
        if(CarrierPawn.CurrentDeflateDamageAmount > CarrierPawn.AutoDeflateDamageAmount)
        {
            CarrierPawn.SetHiveDeflation(1.0000000);
        }
    }
    bcommandSaysItWillHandleThisCoreHit = false;
    curCommand = LPAICommand(CommandList);
    J0x17D:

    // End:0x22C [Loop If]
    if(curCommand != none)
    {
        // End:0x1F8
        if(curCommand.NotifyOfCoreHit(HitCoreIndex, AmountOfDamage, TypeOfDamage))
        {
            // End:0x1EC
            if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
            {
                bgrenadeActualHandled = true;
            }
            bcommandSaysItWillHandleThisCoreHit = true;
        }
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x17D;
    }
    // End:0x32F
    if(!bcommandSaysItWillHandleThisCoreHit && TypeOfDamage == Class'LPDamageTypeGrenadeActual')
    {
        // End:0x32F
        if(CarrierPawn.MyCoreData.Length >= HitCoreIndex)
        {
            // End:0x32F
            if(CarrierPawn.IsThisCoreAStickGrenadeToCore(CarrierPawn.MyCoreData[HitCoreIndex].CoreID))
            {
                bgrenadeActualHandled = true;
                ReactToGrenadeGettingStuckToThisCore(CarrierPawn.MyCoreData[HitCoreIndex].CoreID);
            }
        }
    }
    // End:0x39D
    if(!bgrenadeActualHandled)
    {
        curCommand = LPAICommand(CommandList);
        J0x35A:

        // End:0x39D [Loop If]
        if(curCommand != none)
        {
            curCommand = LPAICommand(curCommand.ChildCommand);
            // [Loop Continue]
            goto J0x35A;
        }
    }
    //return;    
}

function NotfiyAllCellsDestoryedAndNeedsToExplosePrimaryCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnKilledLastCell[8388609];
    local /*0x97E50000-0x00000000*/ private bool bengagedInCommittedBehavior;

    bengagedInCommittedBehavior = EngagedInCommittedBehavior();
    // End:0x3D
    if(!bengagedInCommittedBehavior)
    {
        CmdPerformReactAndSwellWhenAllCellsDestroyedPof(PawnKilledLastCell,, 1);        
    }
    else
    {
        bNeedsToReactAndSwellWhenBecauseAllCellsDestroyedOnEndOfCommittedBehavior = true;
    }
    //return;    
}

function CmdBecomeStunned()
{
    local /*0x97E50000-0x00000000*/ private float StunnedDuration[8388609];
    local /*0x97E50000-0x00000000*/ private class SpecialMoveToUse[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsThisStunInterruptible[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    false
    CmdStatus_Stunned
    0
    // End:0x13C
    if(!bIgnoreStunCommands)
    {
        // End:0x4F
        if(int(CmdOption) == int(0))
        {
            AbortCommand(CommandList);
        }
        Class'LPAICmd_CarrierStunned'.static.InitCommand(self);
        myCommand = LPAICmd_CarrierStunned(GetActiveCommand());
        // End:0x13C
        if(myCommand != none)
        {
            myCommand.SetReturnCmdStatus(CmdStatus);
            myCommand.SetStunnedDuration(StunnedDuration);
            myCommand.SetSunnedSpecialMove(SpecialMoveToUse);
            myCommand.SetStunInterruptible(bIsThisStunInterruptible);
        }
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdHitReaction()
{
    local /*0x97E50000-0x00000000*/ private float PostReactionPauseTime[8388609];
    local /*0x97E50000-0x00000000*/ private class HitReactionSpecialMove[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    none
    0
    // End:0x40
    if(!bNeedsToPerformGettingGrenadeInTheMouthAction)
    {
        return super(LPAIController).CmdHitReaction(PostReactionPauseTime, HitReactionSpecialMove, CmdOption);
    }
    return none;
    //return ReturnValue;    
}

function CmdHitReactionToStun()
{
    local /*0x97E50000-0x00000000*/ private float StunnedDuration[8388609];
    local /*0x97E50000-0x00000000*/ private class StunSpecialMove[8388609], HitReactionSpecialMove, RecoverFromStunSpecialMove;
    local /*0x97E50000-0x00000000*/ private @NULL InPawnCausingStun[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    none
    0
    myCommand = none;
    // End:0x1D3
    if(!bIgnoreStunCommands && !bNeedsToPerformGettingGrenadeInTheMouthAction)
    {
        // End:0x1D3
        if(!CarrierPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_CarrierStunStart') && !CarrierPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_CarrierStunHold'))
        {
            // End:0xBC
            if(int(CmdOption) == int(0))
            {
                AbortCommand(CommandList);
            }
            Class'LPAICmd_CarrierHitReactionToStun'.static.InitCommand(self);
            myCommand = LPAICmd_CarrierHitReactionToStun(GetActiveCommand());
            // End:0x1D0
            if(myCommand != none)
            {
                myCommand.SetStunnedDuration(StunnedDuration);
                myCommand.SetSunnedSpecialMove(StunSpecialMove);
                myCommand.SetHitReactionSpecialMove(HitReactionSpecialMove);
                myCommand.SetRecoverSpecialMove(RecoverFromStunSpecialMove);
                myCommand.SetPawnCausingStun(InPawnCausingStun);
            }            
        }
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdLaunchDefendersPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierLaunchDefenders'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierLaunchDefenders(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdCarrierReactionPhysicalAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierReactionPhysicalAttackPof'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierReactionPhysicalAttackPof(GetActiveCommand());
    // End:0x1A3
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

function CmdCarrierReactionPhysicalAttackVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierReactionPhysicalAttackVs'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierReactionPhysicalAttackVs(GetActiveCommand());
    // End:0x1A3
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

function CmdCarrierReactionPhysicalAttackFvs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierReactionPhysicalAttackFvs'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierReactionPhysicalAttackFvs(GetActiveCommand());
    // End:0x1A3
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

function CmdCarrierPushBackStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierPushAwayStrikePof'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierPushAwayStrikePof(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdCarrierPushBackStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierPushAwayStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierPushAwayStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdCarrierPushBackStrikeFvs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierPushAwayStrikeFvs'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierPushAwayStrikeFvs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdCarrierComboBashStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierComboBashStrikePof'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierComboBashStrikePof(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdCarrierComboBashStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierComboBashStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierComboBashStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdCarrierComboBashStrikeFvs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierComboBashStrikeFvs'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierComboBashStrikeFvs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdCarrierDirectAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierDirectAttackPof'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierDirectAttackPof(GetActiveCommand());
    // End:0x1A3
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

function CmdCarrierDirectAttackVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierDirectAttackVs'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierDirectAttackVs(GetActiveCommand());
    // End:0x1A3
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

function CmdCarrierBerserkAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierBerserkAttackPof'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierBerserkAttackPof(GetActiveCommand());
    // End:0x1A3
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

function CmdCarrierBerserkAttackVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierBerserkAttackVs'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierBerserkAttackVs(GetActiveCommand());
    // End:0x1A3
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

function CmdCarrierTalonFlurryStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierTalonFlurryStrikePof'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierTalonFlurryStrikePof(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdCarrierTalonFlurryStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierTalonFlurryStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierTalonFlurryStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdCarrierTalonThrustStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierTalonThrustStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierTalonThrustStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdCarrierTalonSweepStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierTalonSweepStrikePof'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierTalonSweepStrikePof(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdCarrierTalonSweepStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierTalonSweepStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierTalonSweepStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformTauntPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Taunt[8388609];
    local /*0x97E50000-0x00000000*/ private float MinTime[8388609], MaxTime, DamageToCauseEndOfTaunt, MinDistanceNeeded;
    local /*0x97E50000-0x00000000*/ private bool bTauntingRightOutOfStrike[8388609];
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
    Class'LPAICmd_CarrierTauntPof'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierTauntPof(GetActiveCommand());
    // End:0x1A0
    if(myCommand != none)
    {
        myCommand.SetActorToCareAboutWhileAssessing(Enemy2Taunt);
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetMinTauntLoopTime(MinTime);
        myCommand.SetMaxTauntLoopTime(MaxTime);
        myCommand.SetDamageAmountToCauseEndOfTaunt(DamageToCauseEndOfTaunt);
        myCommand.SetMinDistanceToBeAwayForThisTaunt(MinDistanceNeeded);
        myCommand.SetTauntingRightOutOfStrike(bTauntingRightOutOfStrike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformTauntVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Taunt[8388609];
    local /*0x97E50000-0x00000000*/ private float MinTime[8388609], MaxTime, DamageToCauseEndOfTaunt, MinDistanceNeeded;
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
    Class'LPAICmd_CarrierTauntVs'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierTauntVs(GetActiveCommand());
    // End:0x177
    if(myCommand != none)
    {
        myCommand.SetActorToCareAboutWhileAssessing(Enemy2Taunt);
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetMinTauntLoopTime(MinTime);
        myCommand.SetMaxTauntLoopTime(MaxTime);
        myCommand.SetDamageAmountToCauseEndOfTaunt(DamageToCauseEndOfTaunt);
        myCommand.SetMinDistanceToBeAwayForThisTaunt(MinDistanceNeeded);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformTauntFvs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Taunt[8388609];
    local /*0x97E50000-0x00000000*/ private float MinTime[8388609], MaxTime, DamageToCauseEndOfTaunt, MinDistanceNeeded;
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
    Class'LPAICmd_CarrierTauntFvs'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierTauntFvs(GetActiveCommand());
    // End:0x177
    if(myCommand != none)
    {
        myCommand.SetActorToCareAboutWhileAssessing(Enemy2Taunt);
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetMinTauntLoopTime(MinTime);
        myCommand.SetMaxTauntLoopTime(MaxTime);
        myCommand.SetDamageAmountToCauseEndOfTaunt(DamageToCauseEndOfTaunt);
        myCommand.SetMinDistanceToBeAwayForThisTaunt(MinDistanceNeeded);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformReactAndSwellWhenAllCellsDestroyedPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2ReactTo[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    CmdStatus_Strike
    0
    CarrierReactAndSwellWhenAllCellsDestroyedCmd = none;
    // End:0x46
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierReactAndSwellWhenAllCellsDestroyedPof'.static.InitCommand(self);
    CarrierReactAndSwellWhenAllCellsDestroyedCmd = LPAICmd_CarrierReactAndSwellWhenAllCellsDestroyedPof(GetActiveCommand());
    // End:0xE2
    if(CarrierReactAndSwellWhenAllCellsDestroyedCmd != none)
    {
        CarrierReactAndSwellWhenAllCellsDestroyedCmd.SetActorToCareAboutWhileAssessing(Enemy2ReactTo);
        CarrierReactAndSwellWhenAllCellsDestroyedCmd.SetReturnCmdStatus(CmdStatus);
    }
    return CarrierReactAndSwellWhenAllCellsDestroyedCmd;
    //return ReturnValue;    
}

function CmdPerformReactAndSwellWhenAllCellsDestroyedVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2ReactTo[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    CmdStatus_Strike
    0
    CarrierReactAndSwellWhenAllCellsDestroyedCmd = none;
    // End:0x46
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierReactAndSwellWhenAllCellsDestroyedVs'.static.InitCommand(self);
    CarrierReactAndSwellWhenAllCellsDestroyedCmd = LPAICmd_CarrierReactAndSwellWhenAllCellsDestroyedVs(GetActiveCommand());
    // End:0xE2
    if(CarrierReactAndSwellWhenAllCellsDestroyedCmd != none)
    {
        CarrierReactAndSwellWhenAllCellsDestroyedCmd.SetActorToCareAboutWhileAssessing(Enemy2ReactTo);
        CarrierReactAndSwellWhenAllCellsDestroyedCmd.SetReturnCmdStatus(CmdStatus);
    }
    return CarrierReactAndSwellWhenAllCellsDestroyedCmd;
    //return ReturnValue;    
}

function CmdPerformReactAndSwellWhenAllCellsDestroyedFvs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2ReactTo[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    CmdStatus_Strike
    0
    CarrierReactAndSwellWhenAllCellsDestroyedCmd = none;
    // End:0x46
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierReactAndSwellWhenAllCellsDestroyedFvs'.static.InitCommand(self);
    CarrierReactAndSwellWhenAllCellsDestroyedCmd = LPAICmd_CarrierReactAndSwellWhenAllCellsDestroyedFvs(GetActiveCommand());
    // End:0xE2
    if(CarrierReactAndSwellWhenAllCellsDestroyedCmd != none)
    {
        CarrierReactAndSwellWhenAllCellsDestroyedCmd.SetActorToCareAboutWhileAssessing(Enemy2ReactTo);
        CarrierReactAndSwellWhenAllCellsDestroyedCmd.SetReturnCmdStatus(CmdStatus);
    }
    return CarrierReactAndSwellWhenAllCellsDestroyedCmd;
    //return ReturnValue;    
}

function CmdCarrierTakeGrenadeInMouth()
{
    local /*0x97E50000-0x00000000*/ private float StunnedDuration[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InGrenadeThrower[8388609];
    local /*0x97E50000-0x00000000*/ private class GrenInMouthSpecialMove[9437185], HitReactionSpecialMove, StunSpecialMove, RecoverFromStunSpecialMove;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    Class'LPSM_CarrierSwallowGrenadeReaction'
    Class'LPSM_CarrierGrenadeInMouthToStun'
    Class'LPSM_CarrierGrenadeInMouthStun'
    Class'LPSM_CarrierRecoverFromGrenadeInMouthStun'
    0
    // End:0x1AD
    if(!bIgnoreStunCommands)
    {
        // End:0x71
        if(int(CmdOption) == int(0))
        {
            AbortCommand(CommandList);
        }
        Class'LPAICmd_CarrierTakeGrenadeInMouth'.static.InitCommand(self);
        myCommand = LPAICmd_CarrierTakeGrenadeInMouth(GetActiveCommand());
        // End:0x1AD
        if(myCommand != none)
        {
            myCommand.SetStunnedDuration(StunnedDuration);
            myCommand.SetGrenInMouthSpecialMove(GrenInMouthSpecialMove);
            myCommand.SetHitReactionSpecialMove(HitReactionSpecialMove);
            myCommand.SetSunnedSpecialMove(StunSpecialMove);
            myCommand.SetRecoverSpecialMove(RecoverFromStunSpecialMove);
            myCommand.SetGrenadeThrower(InGrenadeThrower);
        }
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdCarrierTakeGrenadeInHive()
{
    local /*0x97E50000-0x00000000*/ private float StunnedDuration[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InGrenadeThrower[8388609];
    local /*0x97E50000-0x00000000*/ private class GrenInSpecialMove[9437185], HitReactionSpecialMove, StunSpecialMove, RecoverFromStunSpecialMove;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    Class'LPSM_CarrierSwallowGrenadeReaction'
    Class'LPSM_CarrierGrenadeInMouthToStun'
    Class'LPSM_CarrierGrenadeInMouthStun'
    Class'LPSM_CarrierRecoverFromGrenadeInMouthStun'
    0
    // End:0x1AD
    if(!bIgnoreStunCommands)
    {
        // End:0x71
        if(int(CmdOption) == int(0))
        {
            AbortCommand(CommandList);
        }
        Class'LPAICmd_CarrierTakeGrenadeInHive'.static.InitCommand(self);
        myCommand = LPAICmd_CarrierTakeGrenadeInHive(GetActiveCommand());
        // End:0x1AD
        if(myCommand != none)
        {
            myCommand.SetStunnedDuration(StunnedDuration);
            myCommand.SetGrenInHiveSpecialMove(GrenInSpecialMove);
            myCommand.SetHitReactionSpecialMove(HitReactionSpecialMove);
            myCommand.SetSunnedSpecialMove(StunSpecialMove);
            myCommand.SetRecoverSpecialMove(RecoverFromStunSpecialMove);
            myCommand.SetGrenadeThrower(InGrenadeThrower);
        }
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdTakeBigShotInTheMouth()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyThatTookTheShot[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_CarrierTakeBigShotInTheMouth'.static.InitCommand(self);
    myCommand = LPAICmd_CarrierTakeBigShotInTheMouth(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(EnemyThatTookTheShot);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdAttackUsingAttackVolume()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn[8388609], InObjective, CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    myCommand = LPAICmd_CarrierAttackViaAttackVolume(Class'LPAICmd_CarrierAttackViaAttackVolume'.static.InitObjectiveCommand(self, InObjective));
    // End:0x16E
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(EnemyPawn);
        myCommand.SetSPAIObjective(InObjective);
        // End:0x16B
        if(EnemyPawn.Controller != none)
        {
            EnemyPawn.Controller.TriggerEventClass(Class'LPSeqEvent_PlayerHasAggro', myAIPawn);
        }        
    }
    else
    {
        // End:0x1D1
        if(CmdStatus != none)
        {
            LPAICmdStatus_Attack(CmdStatus).Cmd_Attack_Error = 2;
            LPAICmdStatus_Attack(CmdStatus).Cmd_Error = 1;
        }
    }
    return myCommand;
    //return ReturnValue;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], timeSinceLastFlightLaunched;

    super(Actor).Tick(DeltaTime);
    // End:0x9C
    if(((TimeOfLastDefenderElementLaunch > float(0)) && LastTimeSetFlightOfDefendersFree < float(0)) && CarrierPawn != none)
    {
        timeSinceLastFlightLaunched = WorldInfo.TimeSeconds - TimeOfLastDefenderElementLaunch;
        // End:0x9C
        if(timeSinceLastFlightLaunched >= DelayAfterLaunchingDefendersBeforeSettingThemFree)
        {
            NotifyNeedToSetLaunchedPawnsFree();
        }
    }
    HandleArbitraryDefenderLaunchProcessing();
    //return;    
}

defaultproperties
{
    MinNumForForcedRandomArbitraryDefendersLaunch=4
    MaxNumForForcedRandomArbitraryDefendersLaunch=10
    ChangeToMakeEvenLeftToRightForForcedRandomArbitraryDefendersLaunch=0.7000000
    ChangeToBiasTowardsTopForForcedRandomArbitraryDefendersLaunch=0.2000000
    MinDelayBeforeSelfLaunchForForcedRandomArbitraryDefendersLaunch=1.0000000
    MaxDelayBeforeSelfLaunchForForcedRandomArbitraryDefendersLaunch=3.5000000
    MinDelayBeforeProtectingCellsForForcedRandomArbitraryDefendersLaunch=10.0000000
    MaxDelayBeforeProtectingCellsForForcedRandomArbitraryDefendersLaunch=20.0000000
    MinDelayBeforeUnclaimingCellsForForcedRandomArbitraryDefendersLaunch=2.0000000
    MaxDelayBeforeUnclaimingCellsForForcedRandomArbitraryDefendersLaunch=2.0000000
    ChangeToLaunchOnFireForForcedRandomArbitraryDefendersLaunch=0.1000000
    ChangeToLaunchTazedForForcedRandomArbitraryDefendersLaunch=0.1000000
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerCarrier.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerCarrier.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerCarrier.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerCarrier.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerCarrier.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerCarrier.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    HitReactionToStunCmdClass=Class'LPAICmd_CarrierHitReactionToStun'
    // Reference: SPAIReactionManager'Default__LPAIControllerCarrier.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerCarrier.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}