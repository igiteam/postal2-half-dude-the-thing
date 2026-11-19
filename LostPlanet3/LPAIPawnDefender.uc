class LPAIPawnDefender extends LPAIPawnMedFlyer
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

struct native DefenderHoverPosition
{
    var(0.25_Pct) /*0x44500000-0x00000000*/ private int AttackGroupNumber[65537];
    var(0.25_Pct) /*0x44500000-0x00000000*/ private name SocketName[65537];
    var(0.25_Pct) /*0x44500000-0x00000000*/ private float HoverRadius[65537];

    structdefaultproperties
    {
        AttackGroupNumber=0
        SocketName="None"
        HoverRadius=0.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataDefender[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyDefenderController[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInRammingMode[538968065];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRamAggressiveOnFlag[538968065];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNeedsLaunchedFromCarrierCell[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPostLaunchDieInAFire[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPostLaunchDieTazed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLaunchedIntentionally[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasDecrementedLaunchedDefendersAlive[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToEndRamNoMatterWhat[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AggressiveAnimations;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SuicideRamAnimations;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL RamAggressiveParticleComponentMain[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL RamAggressiveParticleComponentLeft[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL RamAggressiveParticleComponentRight[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name LeftWingRamEffectName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name RightWingRamEffectName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmountToScaleStingAnnounceEffect[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TargetActorGivenByLauncher[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TargetPawnGivenByLauncher[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PawnThatLaunchedMe[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LauncherTEnergyPool[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CellIdLaunchedFrom[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte DefenderHiveLaunchTypeToPerform[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LocOfSocketLaunchedFrom[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RotOfSocketLaunchedFrom[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LandOnVsAttackSlotSocketIdx[538968065];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpawnLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TEnergyDropAmount[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HoverPositionInfo[536870913];

// Export ULPAIPawnDefender::execNotifyNewGibTypeRegisteredForPool(FFrame&, void* const)
native function NotifyNewGibTypeRegisteredForPool()
{
    local /*0x97E50000-0x00000000*/ private name NameOfGibType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawnDefender::execSetMaxAgeOfGibsInThisPoolIfNeeded(FFrame&, void* const)
native function SetMaxAgeOfGibsInThisPoolIfNeeded()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewGib[8388609], InGibInfoToSpawn, PoolInfo;


}

// Export ULPAIPawnDefender::execHandleRamEffects(FFrame&, void* const)
native simulated function HandleRamEffects();

// Export ULPAIPawnDefender::execTurnOnRamAggressiveParticleComponent(FFrame&, void* const)
native simulated function TurnOnRamAggressiveParticleComponent();

// Export ULPAIPawnDefender::execTurnOffRamAggressiveParticleComponent(FFrame&, void* const)
native simulated function TurnOffRamAggressiveParticleComponent();

simulated event PostBeginPlay()
{
    PawnThatLaunchedMe = none;
    bLaunchedIntentionally = true;
    bInRammingMode = false;
    TimeToEndRamNoMatterWhat = -1.0000000;
    TargetActorGivenByLauncher = none;
    TargetPawnGivenByLauncher = none;
    DefenderHiveLaunchTypeToPerform = 0;
    super.PostBeginPlay();
    SetPhysics(4);
    SpawnLocation = Location;
    // End:0xA4
    if(TuneDataDefender.bNoWorldCollisionAtLaunch)
    {
        bCollideWorld = false;
    }
    DetachComponent(LightEnvironment);
    LightEnvironment = none;
    DetachComponent(TransitionComponent);
    TransitionComponent = none;
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataDefender = LPTuneDataDefender(TuneData);
    super.InitTuneData(TuneData);
    AmountToScaleStingAnnounceEffect = TuneDataDefender.AmountToScaleStingAnnounceEffect.GetValue();
    //return;    
}

simulated event Destroyed()
{
    // End:0x2F
    if(PawnThatLaunchedMe != none)
    {
        PawnThatLaunchedMe.NotifyLaunchedPawnDown(self);
    }
    super.Destroyed();
    PawnThatLaunchedMe = none;
    TargetActorGivenByLauncher = none;
    TargetPawnGivenByLauncher = none;
    DestroyRamAggressiveParticleComponent(true);
    //return;    
}

function PossessedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.PossessedBy(C, bVehicleTransition);
    MyDefenderController = LPAIControllerDefender(C);
    //return;    
}

function UnPossessed()
{
    super.UnPossessed();
    MyDefenderController = none;
    //return;    
}

simulated function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class SpecialMove[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], MyAnimTree;

    MyAnimTree = super(SPPawn).GetAnimTemplateTreeForSpecialMove(SpecialMove);
    // End:0x36
    if(MyAnimTree != none)
    {
        return MyAnimTree;
    }
    return AttackAnimTree;
    //return ReturnValue;    
}

simulated function InitAnimTemplates()
{
    super(LPPawn).InitAnimTemplates();
    //return;    
}

function PutInCellForPrepForLaunch()
{
    local /*0x97E50000-0x00000000*/ private @NULL locToSpawnDefender[25296897], rotOfSpawnedDefender;
    local /*0x97E50000-0x00000000*/ private bool bIntendedLaunch[8388609];
    local /*0x97E50000-0x00000000*/ private int CellToSpawnAt[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PawnSpawningIn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bOnFire[9437185], bTazed, ReturnValue;

    false
    false
    // End:0x29A
    if(PawnSpawningIn != none)
    {
        Health = HealthMax;
        bGibbed = false;
        Mesh.bPauseAnims = false;
        ResetStatusOfDeathExplosions();
        PawnThatLaunchedMe = PawnSpawningIn;
        // End:0xD6
        if(LauncherTEnergyPool == none)
        {
            LauncherTEnergyPool = LPThermalEnergy(PawnThatLaunchedMe.InvManager.FindInventoryType(Class'LPThermalEnergy', true));
        }
        // End:0x189
        if(((TEnergyDropAmount < float(0)) && PawnThatLaunchedMe != none) && LauncherTEnergyPool != none)
        {
            TEnergyDropAmount = 0.0000000;
            // End:0x189
            if(LauncherTEnergyPool != none)
            {
                TEnergyDropAmount = LauncherTEnergyPool.GetDropEnergy(self);
                TEnergyDropAmount = -LauncherTEnergyPool.AddEnergy(-TEnergyDropAmount, false);
            }
        }
        TargetActorGivenByLauncher = none;
        TargetPawnGivenByLauncher = none;
        SetLocation(locToSpawnDefender);
        SetRotation(rotOfSpawnedDefender);
        LocOfSocketLaunchedFrom = locToSpawnDefender;
        RotOfSocketLaunchedFrom = rotOfSpawnedDefender;
        CellIdLaunchedFrom = CellToSpawnAt;
        bLaunchedIntentionally = bIntendedLaunch;
        bPostLaunchDieInAFire = bOnFire;
        bPostLaunchDieTazed = bTazed;
        SetCollision(false, false);
        SetHidden(true);
        Mesh.SetHidden(true);
        GotoState('WaitingToLaunch');
        Controller.GotoState('WaitingToLaunch');
        return true;
    }
    return false;
    //return ReturnValue;    
}

function NotifyGettingLaunched()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocToLaunchDefenderFrom[25296897], rotOfDefenderAtLaunch;
    local /*0x97E50000-0x00000000*/ private bool bIntendedLaunch[8388609];
    local /*0x97E50000-0x00000000*/ private int CellToLaunchFrom[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PawnLaunchingFrom[8388609], PawnToLauchAt;
    local /*0x97E50000-0x00000000*/ private byte LaunchType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x29D
    if(PawnLaunchingFrom != none)
    {
        PawnThatLaunchedMe = PawnLaunchingFrom;
        TargetActorGivenByLauncher = PawnToLauchAt;
        TargetPawnGivenByLauncher = PawnToLauchAt;
        CellIdLaunchedFrom = CellToLaunchFrom;
        DefenderHiveLaunchTypeToPerform = LaunchType;
        SetRotation(rotOfDefenderAtLaunch);
        SetLocation(LocToLaunchDefenderFrom);
        AirSpeed = TuneDataBasePawn.GroundSpeed_Tunable.GetValue();
        bLaunchedIntentionally = bIntendedLaunch;
        HoverPositionInfo = GetHoverPositionForMyCell();
        GotoState('Auto');
        Controller.GotoState('Auto');
        bNeedsLaunchedFromCarrierCell = true;
        bUseMultipleExtent = false;
        bHasDecrementedLaunchedDefendersAlive = false;
        MyDefenderController.AddTarget(PawnToLauchAt);
        MyDefenderController.AIObjectiveManager.EnableTicking(true);
        // End:0x1FE
        if(MyDefenderController.CurrentObjective != none)
        {
            MyDefenderController.CurrentObjective.Abort();
        }
        MyDefenderController.AIObjectiveManager.ResetAllNonKismetTimesToNextGenerate(0.0000000);
        MyDefenderController.AIObjectiveManager.CallObjectiveGenerators(1.0000000);
        SetHidden(false);
        Mesh.SetHidden(false);
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetAttackGroup()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x73
    if((PawnThatLaunchedMe != none) && CellIdLaunchedFrom >= 0)
    {
        return PawnThatLaunchedMe.TuneDataCarrier.HiveCellDataForDefenders[CellIdLaunchedFrom].AttackGroupNumber;
    }
    return -1;
    //return ReturnValue;    
}

simulated function GetHoverPositionForMyCell()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Retval;
    local /*0x97E50000-0x00000000*/ private int Idx, AttackGroup;

    // End:0x11A
    if(PawnThatLaunchedMe != none)
    {
        AttackGroup = GetAttackGroup();
        Idx = 0;
        J0x2E:

        // End:0x11A [Loop If]
        if(Idx < PawnThatLaunchedMe.TuneDataCarrier.DefenderHoverPositions.Length)
        {
            // End:0x10C
            if(PawnThatLaunchedMe.TuneDataCarrier.DefenderHoverPositions[Idx].AttackGroupNumber == AttackGroup)
            {
                return PawnThatLaunchedMe.TuneDataCarrier.DefenderHoverPositions[Idx];
            }
            Idx++;
            // [Loop Continue]
            goto J0x2E;
        }
    }
    return Retval;
    //return ReturnValue;    
}

function CheckStartDieDoT()
{
    local /*0x97E50000-0x00000000*/ private @NULL DOTInfo;

    // End:0x5C
    if(bPostLaunchDieInAFire)
    {
        DOTInfo.CausedByDamageType = Class'LPDamageTypeVSWelder';
        DOTInfo.DamageType = Class'LPDamageTypeVSWelderDOT';        
    }
    else
    {
        // End:0xB8
        if(bPostLaunchDieTazed)
        {
            DOTInfo.CausedByDamageType = Class'LPDamageTypeElectrical';
            DOTInfo.DamageType = Class'LPDamageTypeElectricDOT';            
        }
        else
        {
            return;
        }
    }
    // End:0x1A8
    if(MyDefenderController.LocalEnemyList.Length > 0)
    {
        LPDamageReactionManagerMedFlyer(DamageReactionManager).LastPawnToCauseBurnDamage = LPPawn(MyDefenderController.LocalEnemyList[0].Pawn);
        DOTInfo.DamageCauser = MyDefenderController.LocalEnemyList[0].Pawn.Controller;
    }
    DOTInfo.DamagePerHit = float(FCeil(1.0000000 / GetNonCorePassThroughFactor(DOTInfo.CausedByDamageType)));
    DOTInfo.DamageDuration = 5.0000000;
    DOTInfo.DamagePerSecond = (DOTInfo.DamagePerHit * float(Health)) / DOTInfo.DamageDuration;
    DOTInfo.HitComponent = Mesh;
    DOTInfo.EffectBoneName = 'JO_hip';
    DOTInfo.EffectPhysicalMaterial = SPPhysicalMaterial(NonCorePhysMat);
    ForceActivateDOT(DOTInfo);
    //return;    
}

function AllowedToProcessTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xCC
    if(LPVSPlayerPawn(Base) != none)
    {
        // End:0xCC
        if(((ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeVSWelder') || ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeVSMelee')) || ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeVSDrill')) || ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeVSWinch'))
        {
            return false;
        }
    }
    // End:0xF9
    if(ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeCarrierMelee'))
    {
        return false;
    }
    return super.AllowedToProcessTakeDamage();
    //return ReturnValue;    
}

simulated function CanTakeNonCoreDamage()
{
    local /*0x97E50000-0x00000000*/ private class inDamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function GetCoreGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000;
    //return ReturnValue;    
}

simulated event Landed()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], FloorActor;

    // End:0x40
    if(MyDefenderController != none)
    {
        MyDefenderController.Landed(HitNormal, FloorActor);
    }
    super(LPAIPawn).Landed(HitNormal, FloorActor);
    //return;    
}

simulated event BumpLevel()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609], HitNormal;

    HitWall(HitNormal, none, none);
    //return;    
}

simulated function @NULL HitWall()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], Wall, WallComp;

    // End:0x49
    if(MyDefenderController != none)
    {
        MyDefenderController.HitWall(HitNormal, Wall, WallComp);
    }
    super(Actor).HitWall(HitNormal, Wall, WallComp);
    //return;    
}

simulated event @NULL RigidBodyCollision()
{
    local /*0x97E50000-0x00000400*/ private @NULL HitComponent[8388609], OtherComponent, RigidCollisionData;
    local /*0x97E50000-0x00000000*/ private int ContactIndex[8388609];

    // End:0x52
    if(MyDefenderController != none)
    {
        MyDefenderController.RigidBodyCollision(HitComponent, OtherComponent, RigidCollisionData, ContactIndex);
    }
    super(LPPawn).RigidBodyCollision(HitComponent, OtherComponent, RigidCollisionData, ContactIndex);
    //return;    
}

simulated function ProcessWingsForStartOfRamStrike()
{
    local /*0x97E50000-0x00000000*/ private int iterDis;

    // End:0xB1
    if(TuneDataDefender.bHideWingsOnRam)
    {
        iterDis = 0;
        J0x2D:

        // End:0xB1 [Loop If]
        if(iterDis < TuneDataDefender.WingNamesToHideOnRam.Length)
        {
            Mesh.HideBoneByName(TuneDataDefender.WingNamesToHideOnRam[iterDis], 1);
            ++iterDis;
            // [Loop Continue]
            goto J0x2D;
        }
    }
    //return;    
}

simulated function DestroyRamAggressiveParticleComponent()
{
    local /*0x97E50000-0x00000000*/ private bool bDeleteFromPool[8388609];

    // End:0xA4
    if(RamAggressiveParticleComponentMain != none)
    {
        // End:0x59
        if(bDeleteFromPool)
        {
            WorldInfo.MyEmitterPool.OnParticleSystemFinished(RamAggressiveParticleComponentMain);
        }
        RamAggressiveParticleComponentMain.DetachFromAny();
        RamAggressiveParticleComponentMain.SetActive(false);
        RamAggressiveParticleComponentMain = none;
    }
    // End:0x148
    if(RamAggressiveParticleComponentLeft != none)
    {
        // End:0xFD
        if(bDeleteFromPool)
        {
            WorldInfo.MyEmitterPool.OnParticleSystemFinished(RamAggressiveParticleComponentLeft);
        }
        RamAggressiveParticleComponentLeft.DetachFromAny();
        RamAggressiveParticleComponentLeft.SetActive(false);
        RamAggressiveParticleComponentLeft = none;
    }
    // End:0x1EC
    if(RamAggressiveParticleComponentRight != none)
    {
        // End:0x1A1
        if(bDeleteFromPool)
        {
            WorldInfo.MyEmitterPool.OnParticleSystemFinished(RamAggressiveParticleComponentRight);
        }
        RamAggressiveParticleComponentRight.DetachFromAny();
        RamAggressiveParticleComponentRight.SetActive(false);
        RamAggressiveParticleComponentRight = none;
    }
    //return;    
}

function DropThermalEnergy()
{
    local /*0x97E50000-0x00000000*/ private float DropAmount[9437185];
    local /*0x97E50000-0x00000000*/ private int DropCount[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL DropOffset[9437185], DropVelocity, EnergyPool;

    0.0000000
    0
    vect(0.0000000, 0.0000000, 0.0000000)
    vect(0.0000000, 0.0000000, 0.0000000)
    none
    // End:0x7D
    if(TEnergyDropAmount > float(0))
    {
        super(LPPawn).DropThermalEnergy(TEnergyDropAmount, DropCount, DropOffset, DropVelocity, EnergyPool);
    }
    //return;    
}

simulated function NotifyStartOfRangedLobFire()
{
    // End:0x1D
    if(Health > 0)
    {
        StartOfRangedDirectFire();        
    }
    //return;    
}

simulated function NotifyStartOfRangedDirectFire()
{
    // End:0x1D
    if(Health > 0)
    {
        StartOfRangedDirectFire(true);        
    }
    //return;    
}

simulated function GetProjectileFirePositionAndRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL out_ProjLoc[25165825], out_ProjDir, out_ProjRot;

    Instigator.Mesh.GetSocketWorldLocationAndRotation('DirectFireStartLoc', out_ProjLoc, out_ProjRot);
    out_ProjDir = Vector(out_ProjRot);
    //return;    
}

simulated function NotifyLaunchedPawnLauncherIsDown()
{
    // End:0x2E
    if(MyDefenderController != none)
    {
        MyDefenderController.NotifyLaunchedPawnLauncherIsDown();
    }
    PawnThatLaunchedMe = none;
    TargetActorGivenByLauncher = none;
    TargetPawnGivenByLauncher = none;
    //return;    
}

simulated function NotifyLaunchedPawnYouAreFree()
{
    // End:0x2E
    if(MyDefenderController != none)
    {
        MyDefenderController.NotifyLaunchedPawnYouAreFree();
    }
    //return;    
}

function PlayWithdrawingScaredSound()
{
    //return;    
}

function IsGhost()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function PlayDying()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];

    // End:0x2E
    if(PawnThatLaunchedMe == none)
    {
        super(LPPawn).PlayDying(DamageType, HitLoc);        
    }
    else
    {
        // End:0xAE
        if(ShouldGib(DamageType))
        {
            SpawnDeathGibs(TakeDamageParams.InstigatedByPawn, class<SPDamageType>(TakeDamageParams.DamageType), TakeDamageParams.HitLocation);            
        }
        else
        {
            TurnOffPawn();
        }
    }
    //return;    
}

simulated function TurnOffPawn()
{
    // End:0x1C
    if(PawnThatLaunchedMe == none)
    {
        super(SPPawn).TurnOffPawn();        
    }
    else
    {
        // End:0x7A
        if(int(Physics) == int(10))
        {
            Mesh.SetHasPhysicsAssetInstance(false);
            Mesh.PhysicsWeight = 0.0000000;
            SetPhysics(0);
        }
        // End:0x10B
        if(!IsInState('WaitingToBePutInCell'))
        {
            GotoState('WaitingToBePutInCell');
            Controller.GotoState('WaitingToBePutInCell');
            // End:0x10B
            if(PawnThatLaunchedMe != none)
            {
                MyDefenderController.CleanUpForBeingPutBackIntoPoolOnDeath();
                PawnThatLaunchedMe.NotifyLaunchedPawnDown(self);
            }
        }
        SetLocation(vect(0.0000000, 0.0000000, 0.0000000));
        SetPhysics(0);
        SetCollision(false, false);
        Mesh.bPauseAnims = true;
        ZeroMovementVariables();
        bIgnoreForces = true;
        Mesh.SetHidden(true);
    }
    //return;    
}

state WaitingToLaunch
{
    ignores Tick;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
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
    ignores Tick;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    stop;                
}

simulated state Dying
{
    ignores EndState, EncroachedBy, Timer;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    function HasFreezeFXAction()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function StartFreezePawn()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    event @NULL Bump()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

        StartBlowMeUpWhileDying();
        //return;        
    }

    simulated event @NULL Touch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

        // End:0x97
        if(((((!bDoneBlowingUpWhileDying && Other != none) && !Other.bHidden) && LPAIPawnMedFlyer(Other) == none) && LPThermalEnergyPickup(Other) == none) && !bMeleeDeath)
        {
            StartBlowMeUpWhileDying();
        }
        //return;        
    }

    simulated function @NULL HitWall()
    {
        local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], Wall, WallComp;

        // End:0x1B
        if(!bMeleeDeath)
        {
            StartBlowMeUpWhileDying();
        }
        //return;        
    }

    event Landed()
    {
        local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], FloorActor;

        // End:0x1B
        if(!bMeleeDeath)
        {
            StartBlowMeUpWhileDying();
        }
        super.Landed(HitNormal, FloorActor);
        //return;        
    }

    simulated event @NULL RigidBodyCollision()
    {
        local /*0x97E50000-0x00000400*/ private @NULL HitComponent[8388609], OtherComponent, RigidCollisionData;
        local /*0x97E50000-0x00000000*/ private int ContactIndex[8388609];

        // End:0x5D
        if(((!bDoneBlowingUpWhileDying && OtherComponent != HitComponent) && IsOtherAValidExplodeAgainstTarget(OtherComponent)) && !bMeleeDeath)
        {
            StartBlowMeUpWhileDying();
        }
        super.RigidBodyCollision(HitComponent, OtherComponent, RigidCollisionData, ContactIndex);
        //return;        
    }

    function IsItTimeToDestoryPawn()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float timeSinceDeath;

        // End:0x0F
        if(bDoneBlowingUpWhileDying)
        {
            return true;
        }
        timeSinceDeath = WorldInfo.TimeSeconds - TimeDied;
        // End:0x93
        if(bMeleeDeath)
        {
            // End:0x93
            if(timeSinceDeath > TuneDataMedFlyer.MeleeHitTimeAfterHitBeforeDestory.GetValue())
            {
                return true;
            }
        }
        // End:0xC1
        if(timeSinceDeath > TuneDataAIPawn.TimeBetweenDeathAndDelete)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    SetLifeCycleState(2);
    // End:0x27
    if(!bDoneBlowingUpWhileDying)
    {
        StartBlowMeUpWhileDying();
    }
    Mesh.SetHidden(true);
    Sleep(TuneDataMedFlyer.TimeAfterDeathExplosionBeforeDestory.GetValue());
    Destroy();
    stop;            
}

defaultproperties
{
    LeftWingRamEffectName="DefenderRamAnnounceLeft"
    RightWingRamEffectName="DefenderRamAnnounceRight"
    CellIdLaunchedFrom=-1
    LandOnVsAttackSlotSocketIdx=-1
    TEnergyDropAmount=-1.0000000
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnDefender.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnDefender.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnDefender.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnDefender.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnDefender.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnDefender.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnDefender.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnDefender.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnDefender.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnDefender.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=none
    Components[1]=CollisionCylinder
    Components[2]=none
    Components[3]=myKynapseBodyHandle
    Components[4]=MyLightEnvironment
    Components[5]=SPPawnMesh
    Components[6]=FaceAudioComponent
    Components[7]=SPDamageOverTimeComponentObj
    Components[8]=SMTC
    Components[9]=FXActionManagerDefObj0
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnDefender.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}