class LPAIPawnDefenderHive extends LPAIPawnCarrier
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataDefenderHive[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyProxy;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyDefHiveController[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayAfterLastLaunchToAllowAnotherLaunch[536870913];
var(0.25_Pct) /*0x1B5A0000-0x00000000*/ private float BaseEyeForwardOffSet[65537];

// Export ULPAIPawnDefenderHive::execIsValidCoreTagType(FFrame&, void* const)
native simulated function IsValidCoreTagType()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    SetPhysics(0);
    //return;    
}

simulated function ReceivedInventoryItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewItem[8388609], TE;

    TE = LPThermalEnergy(NewItem);
    // End:0xBB
    if(TE != none)
    {
        TE.MaxEnergy = TuneDataDefenderHive.ThermalEnergyPoolAllowedForDefenders.GetValue();
        TE.SetEnergyCount(TE.MaxEnergy);
    }
    //return;    
}

function PossessedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.PossessedBy(C, bVehicleTransition);
    MyDefHiveController = LPAIControllerDefenderHive(C);
    //return;    
}

function UnPossessed()
{
    super.UnPossessed();
    MyDefHiveController = none;
    //return;    
}

simulated event Destroyed()
{
    MyProxy = none;
    super.Destroyed();
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataDefenderHive = LPTuneDataDefenderHive(TuneData);
    super.InitTuneData(TuneData);
    DelayAfterLastLaunchToAllowAnotherLaunch = TuneDataDefenderHive.DelayAfterLastLaunchToAllowAnotherLaunch.GetValue();
    //return;    
}

function SetMovementPhysics()
{
    SetPhysics(0);
    //return;    
}

function SetDyingPhysics()
{
    SetPhysics(0);
    //return;    
}

simulated function GetCell0GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetCoreDamageFactor(0);
    //return ReturnValue;    
}

simulated function GetCell1GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetCoreDamageFactor(1);
    //return ReturnValue;    
}

simulated function GetCell2GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetCoreDamageFactor(2);
    //return ReturnValue;    
}

simulated function GetCell3GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetCoreDamageFactor(3);
    //return ReturnValue;    
}

simulated function GetCell4GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetCoreDamageFactor(4);
    //return ReturnValue;    
}

simulated function GetCell5GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetCoreDamageFactor(5);
    //return ReturnValue;    
}

simulated function GetCell6GlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetCoreDamageFactor(6);
    //return ReturnValue;    
}

simulated function CanTakeNonCoreDamage()
{
    local /*0x97E50000-0x00000000*/ private class inDamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated event DestroyAllHiveCells()
{
    local /*0x97E50000-0x00000000*/ private @NULL curCoreDestroying;
    local /*0x97E50000-0x00000000*/ private int iter;

    curCoreDestroying = new Class'LPPhysMatPropTag_DefenderHiveCoreId';
    iter = 0;
    J0x23:

    // End:0x90 [Loop If]
    if(iter < HiveCellStatusList.Length)
    {
        curCoreDestroying.CoreID = byte(iter);
        CoreDestroyed(curCoreDestroying, iter, true);
        ++iter;
        // [Loop Continue]
        goto J0x23;
    }
    curCoreDestroying = none;
    //return;    
}

function GetDefaultHiveLaunchTypeToPerform()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x2E
    if(TuneDataDefenderHive != none)
    {
        return TuneDataDefenderHive.DefaultDefenderLaunchType;
    }
    return 2;
    //return ReturnValue;    
}

function DrawDefenderHiveCellStatus()
{
    //return;    
}

function GetHiveLaunchTypeToPerformForThisCell()
{
    local /*0x97E50000-0x00000000*/ private int CellToLaunchFrom[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LaunchingDefender[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x116
    if((MyProxy != none) && CellToLaunchFrom < MyProxy.ProxyDefenderHiveCellDataList.Length)
    {
        // End:0xDA
        if((int(MyProxy.ProxyDefenderHiveCellDataList[CellToLaunchFrom].DefenderLaunchType) == int(0)) || int(MyProxy.ProxyDefenderHiveCellDataList[CellToLaunchFrom].DefenderLaunchType) == int(1))
        {
            return GetDefaultHiveLaunchTypeToPerform();            
        }
        else
        {
            return MyProxy.ProxyDefenderHiveCellDataList[CellToLaunchFrom].DefenderLaunchType;
        }
    }
    return GetDefaultHiveLaunchTypeToPerform();
    //return ReturnValue;    
}

function AdjustDamage()
{
    local /*0x97E50000-0x00000000*/ private int InDamage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[25165825], InstigatedBy, HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser;

    super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    //return;    
}

simulated function @NULL LaunchedPawnCreateParticleSystem()
{
    local /*0x97E50000-0x00000000*/ private int CellIdx[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ThePool, PSComp, partSysFromTuneData, locToSpawnDefenderLaunchEffect, rotOfSpawnedDefenderEffect;

    Mesh.GetSocketWorldLocationAndRotation(TuneDataDefenderHive.HiveCellDataForDefenders[CellIdx].EffectSocketNameForDefenderLaunch, locToSpawnDefenderLaunchEffect, rotOfSpawnedDefenderEffect);
    PSComp = none;
    partSysFromTuneData = TuneDataDefenderHive.EffectForDefenderLaunchOnCarrierAtCell;
    // End:0x189
    if(partSysFromTuneData != none)
    {
        ThePool = SPEmitterPool(WorldInfo.MyEmitterPool);
        PSComp = ThePool.SPSpawnEmitter(partSysFromTuneData, locToSpawnDefenderLaunchEffect, rotOfSpawnedDefenderEffect, self, self);
        // End:0x159
        if(PSComp != none)
        {
            PSComp.ActivateSystem();
        }
        PSComp.__OnSystemFinished__Delegate = OnLaunchedPawnCreateParticleSystemFinished;
    }
    return;
    //return;    
}

simulated function EnableWinchPoints()
{
    local /*0x97E50000-0x00000000*/ private bool inEnable[8388609];

    //return;    
}

simulated function PlayGrenadeInInternalGrenadeExplosionEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL grenExplosionLoc, grenExplosionRot;

    GetLocationAndRotationForExplosionForGrenadeStuckToThisCore(CurrentCoreGrenadeExplodingAttachedTo, grenExplosionLoc, grenExplosionRot);
    TuneDataPawnFXEventBindings.PlayEventFXAtLoc('GrenadeInHiveExplosion', grenExplosionLoc, grenExplosionRot, self, none, none);
    TuneDataPawnSoundEventBindings.PlayEventSoundLocally('GrenadeInHiveExplosion', 'None', self, none, none);
    //return;    
}

simulated function ProcessInternalGrenadeExplosionForDamageOnThisCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenExploding[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreAttachedTo[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CoreLocation[25296897];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage, minHealthThatInternalGrenadeExplosionCanNotTakeLessThen;
    local /*0x97E50000-0x00000000*/ private int numOfCellsToDestoryUp, numOfCellsToDestoryDown, iter;

    // End:0x2C5
    if(GrenExploding != none)
    {
        AmountOfDamage = RandRange(TuneDataCarrier.MinDamageForInternalGrenadeExplosionInMouth.GetValue(), TuneDataCarrier.MaxDamageForInternalGrenadeExplosionInMouth.GetValue());
        minHealthThatInternalGrenadeExplosionCanNotTakeLessThen = TuneDataCarrier.minHealthThatInternalGrenadeExplosionCanNotTakeLessThen.GetValue();
        // End:0x112
        if((float(Health) - AmountOfDamage) > minHealthThatInternalGrenadeExplosionCanNotTakeLessThen)
        {
            Health = int(float(Health) - AmountOfDamage);            
        }
        ForceKillThisCore(CoreAttachedTo);
        numOfCellsToDestoryUp = int(TuneDataCarrier.NumOfNeighboringCellsToDestoryWhenGrenadeExplodesInsideHiveCell.GetValue() / float(2));
        numOfCellsToDestoryDown = numOfCellsToDestoryUp;
        // End:0x1CB
        if((TuneDataDefenderHive.NumOfNeighboringCellsToDestoryWhenGrenadeExplodesInsideHiveCell.GetValue() % float(2)) != float(0))
        {
            ++numOfCellsToDestoryDown;
        }
        iter = 0;
        J0x1D6:

        // End:0x256 [Loop If]
        if(iter < numOfCellsToDestoryUp)
        {
            // End:0x248
            if(((CoreAttachedTo + iter) + 1) < TuneDataDefenderHive.HiveMaxNumOfCells)
            {
                ForceKillThisCore((CoreAttachedTo + iter) + 1);
            }
            ++iter;
            // [Loop Continue]
            goto J0x1D6;
        }
        iter = 0;
        J0x261:

        // End:0x2C5 [Loop If]
        if(iter < numOfCellsToDestoryDown)
        {
            // End:0x2B7
            if(((CoreAttachedTo - iter) - 1) >= 2)
            {
                ForceKillThisCore((CoreAttachedTo - iter) - 1);
            }
            ++iter;
            // [Loop Continue]
            goto J0x261;
        }
    }
    //return;    
}

function ForceKillThisCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreKilling[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curCoreDestroying;
    local /*0x97E50000-0x00000000*/ private float CoreHealth;

    curCoreDestroying = new Class'LPPhysMatPropTag_DefenderHiveCoreId';
    curCoreDestroying.CoreID = byte(CoreKilling);
    DamageReactionManagerAI.HitCoreIndex = GetCoreIndexFromTag(curCoreDestroying);
    CoreHealth = GetCoreHealth(CoreKilling);
    TakeDamageParams.Damage = int(CoreHealth + float(2));
    DamageReactionManagerAI.hitCoreTag = curCoreDestroying;
    DamageReactionManagerAI.CoreTakeDamage(curCoreDestroying, 1);
    DamageReactionManagerAI.ExecuteDamageReaction();
    CoreDestroyed(curCoreDestroying, CoreKilling, true);
    //return;    
}

function StartDie()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];

    // End:0x16
    if(WantsToPlayDieAnim(DamageType))
    {
    }
    //return;    
}

function IsThisCoreNotVulnerableByBehavioralState()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function AllowedToProcessTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(super.AllowedToProcessTakeDamage())
    {
        return true;
    }
    // End:0x4F
    if(class<LPDamageType>(TakeDamageParams.DamageType).default.bCausesExplosiveReactions)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    super(LPAIPawnAkridLarge).TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    //return;    
}

simulated function ShowOrientationDebug()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

simulated function HandleInternalGrenadeCoreExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenExploding[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreAttachedTo[8388609];

    //return;    
}

defaultproperties
{
    BaseEyeForwardOffSet=200.0000000
    // Reference: LPActorFactoryAI'Default__LPAIPawnDefenderHive.DefaultActorFactory'
    begin object name=DefaultActorFactory
    end object
    DefenderFactoryAI=DefaultActorFactory
    // Reference: LPSeqAct_ActorFactory'Default__LPAIPawnDefenderHive.DefenderFactoryDataD0'
    begin object name=DefenderFactoryDataD0
    end object
    DefenderFactoryData=DefenderFactoryDataD0
    bAlwaysValidTargetForWinchAssist=true
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnDefenderHive.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnDefenderHive.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnDefenderHive.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnDefenderHive.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnDefenderHive.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnDefenderHive.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnDefenderHive.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnDefenderHive.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnDefenderHive.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnDefenderHive.FaceAudioComponent'
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
    // Reference: SPDamageStateComponent'Default__LPAIPawnDefenderHive.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj
    end object
    Components[10]=DamageStateComponentDefObj
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnDefenderHive.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}