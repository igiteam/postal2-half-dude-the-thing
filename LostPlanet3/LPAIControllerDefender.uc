class LPAIControllerDefender extends LPAIControllerMedFlyer
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DefenderPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CmdStatus_RamAttack[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CarrierDefenderCombatManagerAccess[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CarrierDefenderCombatManagerResourceRef[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name CarrierDefenderCombatManagerName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DefenderVsCarrierSupportCombatManagerAccess[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DefenderVsCarrierSupportCombatManagerResourceRef[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name DefenderVsCarrierSupportCombatManagerName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StartOfLastRamStrikeLane[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EndOfLastRamStrikeLane[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LocationOfRamStrikeLaneBlockage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private export @NULL RamStrikeLaneBlockageImpactInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAbleToPerformRameStrikeAtLastCheck[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFinalRamTargetLocCommitted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRamStrikeIntentionMissChanceMade[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAbleToPerformLandOnVsAtLastCheck[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HeightShiftForTargetForRamStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DistanceBeyondTargetForRamStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RamMaxSpeedScale[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AccelerationRateForRam[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TotalRamStrikeFlyDistanceEstimate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DistanceFromTargetEnemyToMakeRamStrikeIntentionMissDecision[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RamStrikeIntentionMissChance[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StartOfLastLandOnVsLane[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EndOfLastLandOnVsLane[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LocationOfLandOnVsLaneBlockage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private export @NULL LandOnVsLaneBlockageImpactInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeVsRanIntoMe[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumberOfTimesToldStuck[536870913];

// Export ULPAIControllerDefender::execNotifyCombatManagerToRetractAllOptionsForThisPublisher(FFrame&, void* const)
native function NotifyCombatManagerToRetractAllOptionsForThisPublisher();

// Export ULPAIControllerDefender::execWantsToDoStruggleMode(FFrame&, void* const)
native function WantsToDoStruggleMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIControllerDefender::execGetHowOfftenToRestartSearchingForValidAttackOptions(FFrame&, void* const)
native function GetHowOfftenToRestartSearchingForValidAttackOptions()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIControllerDefender::execUpdateMovingThroughEnenyForRamStrike(FFrame&, void* const)
native function UpdateMovingThroughEnenyForRamStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetRamming[8388609];


}

// Export ULPAIControllerDefender::execCanBeMyEnemy(FFrame&, void* const)
native event CanBeMyEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL PotentialEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

event @NULL Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];
    local /*0x97E50000-0x00000400*/ private @NULL BotHandle;

    super.Possess(inPawn, bVehicleTransition);
    DefenderPawn = LPAIPawnDefender(inPawn);
    GrenCurrentlyDealingWith = none;
    CmdStatus_RamAttack = new (self) Class'LPAICmdStatus_FlyRamAndExplodeAttack';
    CmdStatus_RamAttack.SetDefaults();
    bBonzi = false;
    NumberOfTimesToldStuck = 0;
    BotHandle = SPKynapseFlyingBotHandle(myAIPawn.myKynapseHandle);
    DistanceFromTargetEnemyToMakeRamStrikeIntentionMissDecision = DefenderPawn.TuneDataDefender.DistanceFromTargetEnemyToMakeRamStrikeIntentionMissDecision.GetValue();
    RamStrikeIntentionMissChance = DefenderPawn.TuneDataDefender.RamStrikeIntentionMissChance.GetValue();
    bRamStrikeIntentionMissChanceMade = false;
    // End:0x1A4
    if(BotHandle != none)
    {
        BotHandle.SetWhenFlyingAllowPitchTowardsGoal(true);
    }
    //return;    
}

event UnPossess()
{
    CmdStatus_RamAttack = none;
    ReleaseCombatManagerAccess();
    ReleaseAllAttackAccess();
    super.UnPossess();
    //return;    
}

event Destroyed()
{
    super.Destroyed();
    ReleaseCombatManagerAccess();
    ReleaseAllAttackAccess();
    //return;    
}

function CleanUpForBeingPutBackIntoPoolOnDeath()
{
    super.CleanUpForBeingPutBackIntoPoolOnDeath();
    GrenCurrentlyDealingWith = none;
    CmdStatus_RamAttack.SetDefaults();
    bBonzi = false;
    NumberOfTimesToldStuck = 0;
    ReleaseCombatManagerAccess();
    ReleaseAllAttackAccess();
    //return;    
}

function SetAttackResourceNames()
{
    super.SetAttackResourceNames();
    OrbitResourceName = 'DefenderOrbitFormation';
    AdHocSquadMgrName = 'AIResAdHocSquadMgr';
    StrikeResourceName = 'DefenderStrike';
    //return;    
}

function HasCombatManagerEngagementAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x90
    if(CanBeMyEnemy(InEnemy))
    {
        // End:0x56
        if((LPVSPlayerPawn(InEnemy) != none) && DefenderVsCarrierSupportCombatManagerResourceRef != none)
        {
            return IsDefenderVsCarrierSupportCombatManagerAccessForThisEnemy(InEnemy);            
        }
        else
        {
            // End:0x7C
            if(CarrierDefenderCombatManagerResourceRef != none)
            {
                return IsCarrierDefenderCombatManagerAccessForThisEnemy(InEnemy);                
            }
            else
            {
                return HaveOrbitEngagementAccess(InEnemy);
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function ReleaseCombatManagerAccess()
{
    ReleaseCarrierDefenderCombatManagerAccess();
    ReleaseDefenderVsCarrierSupportCombatManagerAccess();
    //return;    
}

function ReleaseCarrierDefenderCombatManagerAccess()
{
    // End:0x73
    if(CarrierDefenderCombatManagerAccess != none)
    {
        // End:0x3E
        if(CarrierDefenderCombatManagerResourceRef != none)
        {
            CarrierDefenderCombatManagerResourceRef.RetractAllOptionsForThisPublisher(self);
        }
        CarrierDefenderCombatManagerAccess.Destroy();
        CarrierDefenderCombatManagerAccess = none;
        CarrierDefenderCombatManagerResourceRef = none;
    }
    //return;    
}

function ReleaseDefenderVsCarrierSupportCombatManagerAccess()
{
    // End:0x73
    if(DefenderVsCarrierSupportCombatManagerAccess != none)
    {
        // End:0x3E
        if(DefenderVsCarrierSupportCombatManagerResourceRef != none)
        {
            DefenderVsCarrierSupportCombatManagerResourceRef.RetractAllOptionsForThisPublisher(self);
        }
        DefenderVsCarrierSupportCombatManagerAccess.Destroy();
        DefenderVsCarrierSupportCombatManagerAccess = none;
        DefenderVsCarrierSupportCombatManagerResourceRef = none;
    }
    //return;    
}

function IsCarrierDefenderCombatManagerAccessForThisEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x9A
    if(CarrierDefenderCombatManagerAccess != none)
    {
        // End:0x65
        if(CarrierDefenderCombatManagerAccess.GetOuterActor() == InEnemy)
        {
            // End:0x62
            if(!CarrierDefenderCombatManagerAccess.IsDestroyed())
            {
                return true;
            }            
        }
        else
        {
            CarrierDefenderCombatManagerAccess.Destroy();
            CarrierDefenderCombatManagerAccess = none;
            CarrierDefenderCombatManagerResourceRef = none;
        }
    }
    return false;
    //return ReturnValue;    
}

function IsDefenderVsCarrierSupportCombatManagerAccessForThisEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x9A
    if(DefenderVsCarrierSupportCombatManagerAccess != none)
    {
        // End:0x65
        if(DefenderVsCarrierSupportCombatManagerAccess.GetOuterActor() == InEnemy)
        {
            // End:0x62
            if(!DefenderVsCarrierSupportCombatManagerAccess.IsDestroyed())
            {
                return true;
            }            
        }
        else
        {
            DefenderVsCarrierSupportCombatManagerAccess.Destroy();
            DefenderVsCarrierSupportCombatManagerAccess = none;
            DefenderVsCarrierSupportCombatManagerResourceRef = none;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetCombatManagerEngagementAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    // End:0x16D
    if(!HasCombatManagerEngagementAccess(InEnemy))
    {
        // End:0xD0
        if(LPVSPlayerPawn(InEnemy) != none)
        {
            DefenderVsCarrierSupportCombatManagerAccess = InEnemy.AIResourceManager.GetAccess(DefenderVsCarrierSupportCombatManagerName, myAIPawn);
            // End:0xC3
            if(DefenderVsCarrierSupportCombatManagerAccess != none)
            {
                DefenderVsCarrierSupportCombatManagerResourceRef = LPAIResDefenderRogueFromOrbitSlotEngagement(DefenderVsCarrierSupportCombatManagerAccess.GetResource());
            }
            ReleaseCarrierDefenderCombatManagerAccess();            
        }
        else
        {
            CarrierDefenderCombatManagerAccess = InEnemy.AIResourceManager.GetAccess(CarrierDefenderCombatManagerName, myAIPawn);
            // End:0x163
            if(CarrierDefenderCombatManagerAccess != none)
            {
                CarrierDefenderCombatManagerResourceRef = LPAIResCarrierDefenderCombatManager(CarrierDefenderCombatManagerAccess.GetResource());
            }
            ReleaseDefenderVsCarrierSupportCombatManagerAccess();
        }
    }
    //return;    
}

function GetOrbitEngagementAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    // End:0x48
    if((DefenderPawn != none) && DefenderPawn.PawnThatLaunchedMe != none)
    {
        GetCombatManagerEngagementAccess(InEnemy);
    }
    // End:0x7B
    if((CarrierDefenderCombatManagerResourceRef == none) && DefenderVsCarrierSupportCombatManagerResourceRef == none)
    {
        super.GetOrbitEngagementAccess(InEnemy);
    }
    //return;    
}

function HasCurrentOrbitCombatMgrResourceRef()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x14
    if(CarrierDefenderCombatManagerResourceRef != none)
    {
        return true;        
    }
    else
    {
        // End:0x25
        if(DefenderVsCarrierSupportCombatManagerResourceRef != none)
        {
            return true;
        }
    }
    return super.HasCurrentOrbitCombatMgrResourceRef();
    //return ReturnValue;    
}

function IsLandOnAttackAsReplacementForFullPhysicalAttackAllowed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x33
    if(CarrierDefenderCombatManagerResourceRef != none)
    {
        return CarrierDefenderCombatManagerResourceRef.IsLandOnAttackAsReplacementForFullPhysicalAttackAllowed();        
    }
    else
    {
        // End:0x66
        if(DefenderVsCarrierSupportCombatManagerResourceRef != none)
        {
            return DefenderVsCarrierSupportCombatManagerResourceRef.IsLandOnAttackAsReplacementForFullPhysicalAttackAllowed();            
        }
        else
        {
            // End:0x96
            if(CurrentOrbitCombatMgrResourceRef != none)
            {
                return CurrentOrbitCombatMgrResourceRef.IsLandOnAttackAsReplacementForFullPhysicalAttackAllowed();
            }
        }
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
    // End:0x5D
    if(CarrierDefenderCombatManagerResourceRef != none)
    {
        return CarrierDefenderCombatManagerResourceRef.PublishNewAttackOption(self, TypeOfAttack, PublishersDesirabilityOfAttackScaler, bForceChoice);        
    }
    else
    {
        // End:0xA9
        if(DefenderVsCarrierSupportCombatManagerResourceRef != none)
        {
            return DefenderVsCarrierSupportCombatManagerResourceRef.PublishNewAttackOption(self, TypeOfAttack, PublishersDesirabilityOfAttackScaler, bForceChoice);
        }
    }
    return super.PublishNewAttackOptionToCombatManager(TypeOfAttack, PublishersDesirabilityOfAttackScaler, bForceChoice);
    //return ReturnValue;    
}

function NotifyCombatManagerOfAttackCompleted()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFailedToStart[8388609], bAllreadyAssumedCurrentAttackIsDone, bCleanOutAllAttackOptions;

    false
    false
    // End:0x56
    if(DefenderVsCarrierSupportCombatManagerResourceRef != none)
    {
        NotifyThisCombatManagerOfAttackCompleted(DefenderVsCarrierSupportCombatManagerResourceRef, TypeOfAttack, bFailedToStart, bAllreadyAssumedCurrentAttackIsDone, bCleanOutAllAttackOptions);        
    }
    else
    {
        // End:0x9F
        if(CarrierDefenderCombatManagerResourceRef != none)
        {
            NotifyThisCombatManagerOfAttackCompleted(CarrierDefenderCombatManagerResourceRef, TypeOfAttack, bFailedToStart, bAllreadyAssumedCurrentAttackIsDone, bCleanOutAllAttackOptions);
        }
    }
    super.NotifyCombatManagerOfAttackCompleted(TypeOfAttack, bAllreadyAssumedCurrentAttackIsDone, bCleanOutAllAttackOptions);
    //return;    
}

function NotifyCombatManagerOfStrikeCompleted()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];

    // End:0x2E
    if(DefenderVsCarrierSupportCombatManagerResourceRef != none)
    {
        NotifyThisCombatManagerOfStrikeCompleted(DefenderVsCarrierSupportCombatManagerResourceRef, TypeOfAttack);        
    }
    else
    {
        // End:0x59
        if(CarrierDefenderCombatManagerResourceRef != none)
        {
            NotifyThisCombatManagerOfStrikeCompleted(CarrierDefenderCombatManagerResourceRef, TypeOfAttack);
        }
    }
    super.NotifyCombatManagerOfStrikeCompleted(TypeOfAttack);
    //return;    
}

function HasEnoughTimeExpiredBetweenStrikes()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfStrike[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(DefenderVsCarrierSupportCombatManagerResourceRef != none)
    {
        return AskThisCombatManagerHasEnoughTimeExpiredBetweenStrikes(DefenderVsCarrierSupportCombatManagerResourceRef, TypeOfStrike);        
    }
    else
    {
        // End:0x5B
        if(CarrierDefenderCombatManagerResourceRef != none)
        {
            return AskThisCombatManagerHasEnoughTimeExpiredBetweenStrikes(CarrierDefenderCombatManagerResourceRef, TypeOfStrike);
        }
    }
    return super.HasEnoughTimeExpiredBetweenStrikes(TypeOfStrike);
    //return ReturnValue;    
}

function HasValidWithdrawToPositionBeenFound()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float deltaSinceVsRanIntoMe;

    deltaSinceVsRanIntoMe = WorldInfo.TimeSeconds - LastTimeVsRanIntoMe;
    // End:0x76
    if(deltaSinceVsRanIntoMe < DefenderPawn.TuneDataDefender.DelayAfterBumpingVsBeforeStartingOfWithdraw)
    {
        return false;
    }
    return super(LPAIController).HasValidWithdrawToPositionBeenFound();
    //return ReturnValue;    
}

function IsFullPhysicalAttackAllowed()
{
    local /*0x97E50000-0x00000000*/ private bool bAssumeCurrentAttackIsDone[9437185], ReturnValue;

    false
    // End:0x42
    if(CarrierDefenderCombatManagerResourceRef != none)
    {
        return CarrierDefenderCombatManagerResourceRef.IsFullPhysicalAttackAllowed(self, bAssumeCurrentAttackIsDone);        
    }
    else
    {
        // End:0x7C
        if(DefenderVsCarrierSupportCombatManagerResourceRef != none)
        {
            return DefenderVsCarrierSupportCombatManagerResourceRef.IsFullPhysicalAttackAllowed(self, bAssumeCurrentAttackIsDone);
        }
    }
    return super.IsFullPhysicalAttackAllowed(bAssumeCurrentAttackIsDone);
    //return ReturnValue;    
}

simulated function NotifyLaunchedPawnLauncherIsDown()
{
    bBonzi = true;
    //return;    
}

simulated function NotifyLaunchedPawnYouAreFree()
{
    bBonzi = true;
    //return;    
}

function NotifyStuckCollidingWithWorld()
{
    ++NumberOfTimesToldStuck;
    // End:0xE1
    if(float(NumberOfTimesToldStuck) >= DefenderPawn.TuneDataDefender.MaxNumberOfTimeToAllowMovementFailureBeforeSuicide.GetValue())
    {
        // End:0xE1
        if(DefenderPawn != none)
        {
            DefenderPawn.TakeDamage(10000000, self, DefenderPawn.Location, Normal(DefenderPawn.Velocity), Class'LPDamageTypeForced');
        }
    }
    //return;    
}

function NotifyStuckPathingFailed()
{
    ++NumberOfTimesToldStuck;
    // End:0xE1
    if(float(NumberOfTimesToldStuck) >= DefenderPawn.TuneDataDefender.MaxNumberOfTimeToAllowMovementFailureBeforeSuicide.GetValue())
    {
        // End:0xE1
        if(DefenderPawn != none)
        {
            DefenderPawn.TakeDamage(10000000, self, DefenderPawn.Location, Normal(DefenderPawn.Velocity), Class'LPDamageTypeForced');
        }
    }
    //return;    
}

function UseAnimationAggressive()
{
    DefenderPawn.UseContextSensitiveAnimObject(DefenderPawn.AggressiveAnimations, -1.0000000);
    //return;    
}

function UseSuicideRamAnimations()
{
    DefenderPawn.UseContextSensitiveAnimObject(DefenderPawn.SuicideRamAnimations, -1.0000000);
    //return;    
}

function UseAnimationNormal()
{
    DefenderPawn.UseContextSensitiveAnimObject(none, -1.0000000);
    //return;    
}

simulated function PlayCorrectEffectsForRamHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool bTargetOnRight;
    local /*0x97E50000-0x00000000*/ private @NULL displacementToTarget, sideVec, crabFacing;
    local /*0x97E50000-0x00000000*/ private float dotToTarget;
    local /*0x97E50000-0x00000000*/ private bool bhittingVs;

    bhittingVs = false;
    // End:0x30
    if(LPBaseVSPlayerPawn(PawnToTest) != none)
    {
        bhittingVs = true;
    }
    bTargetOnRight = Class'SPEngine.SPUtil'.static.IsToRightAndGetRightVec(DefenderPawn, PawnToTest, sideVec);
    displacementToTarget = PawnToTest.Location - DefenderPawn.Location;
    displacementToTarget = Normal(displacementToTarget);
    crabFacing = Vector(DefenderPawn.Rotation);
    dotToTarget = crabFacing Dot displacementToTarget;
    // End:0x1A2
    if(dotToTarget > 0.9000000)
    {
        // End:0x19F
        if(bhittingVs)
        {
            DefenderPawn.TuneDataPawnFXEventBindings.PlayEventFX('DefenderRamHitVsFrontCenter', DefenderPawn, DefenderPawn.Mesh, none);
        }        
    }
    else
    {
        // End:0x224
        if(bTargetOnRight)
        {
            // End:0x221
            if(bhittingVs)
            {
                DefenderPawn.TuneDataPawnFXEventBindings.PlayEventFX('DefenderRamHitVsFrontRight', DefenderPawn, DefenderPawn.Mesh, none);
            }            
        }
        else
        {
            // End:0x296
            if(bhittingVs)
            {
                DefenderPawn.TuneDataPawnFXEventBindings.PlayEventFX('DefenderRamHitVsFrontLeft', DefenderPawn, DefenderPawn.Mesh, none);
            }
        }
    }
    //return;    
}

function CanMemberJoinMyAdHocSquad()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewMember[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x63
    if(LPAIPawnDefender(NewMember.Pawn).GetAttackGroup() == DefenderPawn.GetAttackGroup())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ShouldUseLeadersOrbitSlotLocation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xA9
    if((MyAdHocSquadMemberData != none) && MyAdHocSquadMemberData.CurrentSquadIn != none)
    {
        // End:0xA9
        if(MyAdHocSquadMemberData.CurrentSquadIn.CurrentLeader != none)
        {
            // End:0xA9
            if(MyAdHocSquadMemberData.CurrentSquadIn.CurrentLeader != self)
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function NotfiyControllerOfPawnChange()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnSwitchingFrom[8388609], PawnSwitchingTo;

    // End:0x51
    if(DefenderPawn.Base == PawnSwitchingFrom)
    {
        // End:0x4E
        if(LPVSPlayerPawn(PawnSwitchingFrom) != none)
        {
            SwitchToPlayerOutsideRigSocket();
        }        
    }
    else
    {
        // End:0x9F
        if(DefenderPawn.Base == PawnSwitchingTo)
        {
            // End:0x9F
            if(LPVSPlayerPawn(PawnSwitchingTo) != none)
            {
                SwitchToPlayerInsideRigSocket();
            }
        }
    }
    super(LPAIController).NotfiyControllerOfPawnChange(PawnSwitchingFrom, PawnSwitchingTo);
    //return;    
}

function SwitchToPlayerOutsideRigSocket()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private name SocketName;
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    vsPawn = LPBaseVSPlayerPawn(DefenderPawn.Base);
    // End:0xFA
    if(vsPawn != none)
    {
        SocketName = vsPawn.TuneDataVSPlayerPawn.DefenderAttackSlotSockets[DefenderPawn.LandOnVsAttackSlotSocketIdx].PlayerOutsideRigSocketName;
        DefenderPawn.SetBase(vsPawn,, vsPawn.Mesh, SocketName);
        return true;
    }
    return false;
    //return ReturnValue;    
}

function SwitchToPlayerInsideRigSocket()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private name SocketName;
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    vsPawn = LPBaseVSPlayerPawn(DefenderPawn.Base);
    // End:0xFA
    if(vsPawn != none)
    {
        SocketName = vsPawn.TuneDataVSPlayerPawn.DefenderAttackSlotSockets[DefenderPawn.LandOnVsAttackSlotSocketIdx].EndSocketName;
        DefenderPawn.SetBase(vsPawn,, vsPawn.Mesh, SocketName);
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsDoingRamAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3D
    if((CmdStatus_RamAttack != none) && int(CmdStatus_RamAttack.GetCmd_Ram_Status()) != int(0))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function CanBecomeAdHocSquadLeader()
{
    local /*0x97E50000-0x00000000*/ private @NULL SquadAsking[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x12
    if(IsInState('WaitingToBePutInCell'))
    {
        return false;
    }
    // End:0x38
    if(DefenderPawn.Health <= 0)
    {
        return false;
    }
    // End:0x5E
    if(DefenderPawn.Base != none)
    {
        return false;
    }
    // End:0x6D
    if(IsDoingRamAttack())
    {
        return false;
    }
    return super(LPAIController).CanBecomeAdHocSquadLeader(SquadAsking);
    //return ReturnValue;    
}

simulated event Landed()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], FloorActor, myCommand;

    myCommand = LPAICommand(CommandList);
    // End:0x5C
    if(myCommand != none)
    {
        myCommand.Landed(HitNormal, FloorActor);
    }
    super(Actor).Landed(HitNormal, FloorActor);
    //return;    
}

simulated function @NULL HitWall()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], Wall, WallComp, myCommand;

    myCommand = LPAICommand(CommandList);
    // End:0x65
    if(myCommand != none)
    {
        myCommand.HitWall(HitNormal, Wall, WallComp);
    }
    super(Actor).HitWall(HitNormal, Wall, WallComp);
    //return;    
}

simulated event @NULL RigidBodyCollision()
{
    local /*0x97E50000-0x00000400*/ private @NULL HitComponent[8388609], OtherComponent, RigidCollisionData;
    local /*0x97E50000-0x00000000*/ private int ContactIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    myCommand = LPAICommand(CommandList);
    // End:0x6E
    if(myCommand != none)
    {
        myCommand.RigidBodyCollision(HitComponent, OtherComponent, RigidCollisionData, ContactIndex);
    }
    super(Actor).RigidBodyCollision(HitComponent, OtherComponent, RigidCollisionData, ContactIndex);
    //return;    
}

function IsThisValidWithdrawAfterEnemyBumpRange()
{
    local /*0x97E50000-0x00000000*/ private float RangeToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float MinRangeToLaunchFrom, MaxRangeToLaunchFrom;

    MinRangeToLaunchFrom = DefenderPawn.TuneDataDefender.MinDistanceAwayFromEnemyToLookForWitdrawPointWhenAfterBumpingEnemy.GetValue();
    MaxRangeToLaunchFrom = DefenderPawn.TuneDataDefender.MaxDistanceAwayFromEnemyToLookForWitdrawPointWhenAfterBumpingEnemy.GetValue();
    // End:0xD8
    if((RangeToTest < MinRangeToLaunchFrom) || RangeToTest > MaxRangeToLaunchFrom)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function IsValidWithdrawAfterEnemyBumpToPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocationToTest[8388609], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x61
    if(IsThisValidWithdrawAfterEnemyBumpRange(VSize2D(LocationToTest - TestActor.Location)))
    {
        PositionToWithdrawTo = LocationToTest;
        bFoundValidWithdrawToPosition = true;
        return true;
    }
    return false;
    //return ReturnValue;    
}

function FindWithdrawAfterEnemyBumpToSpotTraversalFinished()
{
    //return;    
}

function FindWithdrawAfterEnemyBumpToSpotTraversalAborted()
{
    TimeLastFindWithdrawToSpotTraversalStarted = -1.0000000;
    //return;    
}

function DrawAttackArcs()
{
    //return;    
}

function CmdMoveToActorFly()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetToMoveTo[8388609], LookAtActor;
    local /*0x97E50000-0x00000000*/ private float distanceFromTarget[8388609], PitchAngleFromTargetInDegrees, HowCloseToTheOffsetToHaveToGetTo;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185], StopType;
    local /*0x97E50000-0x00000000*/ private bool b2dDistanceChecks[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_MoveToActor
    0
    0
    true
    // End:0x46
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_DefenderMoveToActorFly'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderMoveToActorFly(GetActiveCommand());
    // End:0x1B4
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredTarget(TargetToMoveTo);
        myCommand.SetDesiredSeperation(HowCloseToTheOffsetToHaveToGetTo);
        myCommand.SetShouldUse2dDistanceChecks(b2dDistanceChecks);
        myCommand.SetDesiredPitchAngleFromTarget(PitchAngleFromTargetInDegrees);
        myCommand.SetDistanceFromMoveToTarget(distanceFromTarget);
        myCommand.SetStopAtDestinationType(StopType, LookAtActor);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMoveToPositionFly()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609], LookAt;
    local /*0x97E50000-0x00000000*/ private float reachDist[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185], StopType;
    local /*0x97E50000-0x00000000*/ private bool b2dDistanceChecks[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    none
    -1.0000000
    CmdStatus_MoveToPosition
    0
    0
    true
    // End:0x54
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_DefenderMoveToPositionFly'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderMoveToPositionFly(GetActiveCommand());
    // End:0x172
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredDestination(Target);
        myCommand.SetDesiredSeperation(reachDist);
        myCommand.SetShouldUse2dDistanceChecks(b2dDistanceChecks);
        myCommand.SetStopAtDestinationType(StopType, LookAt);
    }
    return myCommand;
    //return ReturnValue;    
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
    Class'LPAICmd_DefenderDirectAttackPoF'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderDirectAttackPoF(GetActiveCommand());
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
    Class'LPAICmd_DefenderRangedDirectFireAttack'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderRangedDirectFireAttack(GetActiveCommand());
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
    Class'LPAICmd_DefenderRangedDirectFireAttackVs'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderRangedDirectFireAttackVs(GetActiveCommand());
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
    Class'LPAICmd_DefenderRangedDirectFireAttackFvs'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderRangedDirectFireAttackFvs(GetActiveCommand());
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
    Class'LPAICmd_DefenderReactiveAttackPoF'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderReactiveAttackPoF(GetActiveCommand());
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
    Class'LPAICmd_DefenderReactiveAttackVs'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderReactiveAttackVs(GetActiveCommand());
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
    Class'LPAICmd_DefenderReactiveAttackFvs'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderReactiveAttackFvs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2React2);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdDefenderPlasmaStrikePof()
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
    Class'LPAICmd_DefenderPlasmaStrike'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderPlasmaStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdDefenderSwoopStingStrike()
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
    Class'LPAICmd_DefenderSwoopStingStrike'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderSwoopStingStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdDefenderReactiveStrikePoF()
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
    Class'LPAICmd_DefenderReactiveStrikePoF'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderReactiveStrikePoF(GetActiveCommand());
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
    Class'LPAICmd_DefenderThornDirectFireStrike'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderThornDirectFireStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdDefenderOrbitPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    0
    // End:0x2E
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_DefenderOrbitPof'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderOrbitPof(GetActiveCommand());
    // End:0xA2
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Attack);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdRamAttackPof()
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
    Class'LPAICmd_DefenderRamAttackPoF'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderRamAttackPoF(GetActiveCommand());
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

function CmdRamAttackVs()
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
    Class'LPAICmd_DefenderRamAttackVs'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderRamAttackVs(GetActiveCommand());
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

function CmdRamAttackFvs()
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
    Class'LPAICmd_DefenderRamAttackFvs'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderRamAttackFvs(GetActiveCommand());
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

function CmdRamStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_RamAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_DefenderRamStrikePof'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderRamStrikePof(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdRamStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_RamAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_DefenderRamStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderRamStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdRamStrikeFvs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_RamAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_DefenderRamStrikeFvs'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderRamStrikeFvs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdAttachToVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    0
    // End:0x2E
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_DefenderAttachToVS'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderAttachToVS(GetActiveCommand());
    // End:0xA2
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

state WaitingToLaunch
{
    ignores ThinkTimer;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        PauseThinkTimer(true);
        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x9C
        if((DefenderPawn.CellIdLaunchedFrom >= 0) && DefenderPawn.PawnThatLaunchedMe != none)
        {
            DefenderPawn.PawnThatLaunchedMe.SetThisCellToNotClaimedForLaunch(DefenderPawn.CellIdLaunchedFrom);
        }
        PauseThinkTimer(false);
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function NotfiyControllerOfPawnChange()
    {
        local /*0x97E50000-0x00000000*/ private @NULL PawnSwitchingFrom[8388609], PawnSwitchingTo;

        // End:0x3C
        if(IsTarget(PawnSwitchingFrom))
        {
            RemoveTarget(PawnSwitchingFrom);
            AddTarget(PawnSwitchingTo);
        }
        //return;        
    }
    J0x00:
    // End:0x0F [Loop If]
    if(true)
    {
        Sleep(0.1000000);
        // [Loop Continue]
        goto J0x00;
    }
    stop;                    
}

state WaitingToBePutInCell
{
    ignores ThinkTimer;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        PauseThinkTimer(true);
        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        PauseThinkTimer(false);
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function NotfiyControllerOfPawnChange()
    {
        local /*0x97E50000-0x00000000*/ private @NULL PawnSwitchingFrom[8388609], PawnSwitchingTo;

        // End:0x3C
        if(IsTarget(PawnSwitchingFrom))
        {
            RemoveTarget(PawnSwitchingFrom);
            AddTarget(PawnSwitchingTo);
        }
        //return;        
    }
    J0x00:
    // End:0x0F [Loop If]
    if(true)
    {
        Sleep(0.1000000);
        // [Loop Continue]
        goto J0x00;
    }
    stop;                    
}

auto state Alive
{
    function ContinuedState()
    {
        super.ContinuedState();
        // End:0x70
        if((DefenderPawn != none) && DefenderPawn.PawnThatLaunchedMe != none)
        {
            DefenderPawn.GotoState('WaitingToBePutInCell');
            GotoState('WaitingToBePutInCell');
        }
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super.BeginState(PreviousState);
        //return;        
    }

    function OnAliveDefaults()
    {
        super.OnAliveDefaults();
        // End:0x96
        if(((DefenderPawn != none) && DefenderPawn.PawnThatLaunchedMe != none) && DefenderPawn.Health <= 0)
        {
            DefenderPawn.GotoState('WaitingToBePutInCell');
            GotoState('WaitingToBePutInCell');
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    CarrierDefenderCombatManagerName="CarrierDefenderCombatManager"
    DefenderVsCarrierSupportCombatManagerName="DefenderVsCarrierSupportCombatManager"
    // Reference: LPAICmdStatus_Orbit'Default__LPAIControllerDefender.LPAICmdStatus_Orbit0'
    begin object name=LPAICmdStatus_Orbit0
    end object
    CmdStatus_Orbit=LPAICmdStatus_Orbit0
    OrbitCombatMgrResourceName="DefenderRogueOrbitEngagement"
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerDefender.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerDefender.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerDefender.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerDefender.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerDefender.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerDefender.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerDefender.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerDefender.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}