class LPAIPawnPhadyr extends LPAIPawnAkridSmall
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataPhadyr[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ContinuousAttackSuperAggressiveAnimations;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LowPosContinuousAttackSuperAggressiveAnimations;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LowPostureAnimations;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUsingLowPosture;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerformingSpitBurst;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_StrikeWarningRattle_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_StrikeWarningRattle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeGrenadeGlued[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrenCurrentlyDealingWith[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array HitPhysMaterials[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte NumAcidSpitPellets;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int HorizontalAcidPelletSpread;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int VerticalAcidPelletSpread;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AcidBlobTracerProjectileSpeed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AcidBlobTracerProjectileMaxSpeed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentSpitBurstFireFromLoc;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentSpitBurstFireRot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AcidBlobTracerSmokeTrailEffect;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TracerCounter;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class AcidBlobTracerSmokeEmitterSpawnableClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AcidSpitTracerScale;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class AcidSpitProjectile;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize export array PustuleGrowthStatuses;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class RangedIndirectFireProjtileClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinLongRangeLobDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxLongRangeLobDistance;

// Export ULPAIPawnPhadyr::execIsValidCoreTagType(FFrame&, void* const)
native simulated function IsValidCoreTagType()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x3A
    if(VarName == 'KnockDownMeleeInfo')
    {
        // End:0x37
        if(KnockDownMeleeInfo.bActive)
        {
        }        
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataPhadyr = LPTuneDataPhadyr(TuneData);
    NumAcidSpitPellets = byte(TuneDataPhadyr.NumAcidSpitPellets.GetValue());
    HorizontalAcidPelletSpread = TuneDataPhadyr.AcidPelletSpreadHorizontal;
    VerticalAcidPelletSpread = TuneDataPhadyr.AcidPelletSpreadVertical;
    AcidSpitTracerScale = TuneDataPhadyr.AcidSpitTracerScale;
    AcidBlobTracerProjectileSpeed = TuneDataPhadyr.AcidBlobTracerProjectileSpeed;
    AcidBlobTracerProjectileMaxSpeed = TuneDataPhadyr.AcidBlobTracerProjectileMaxSpeed;
    AcidBlobTracerSmokeTrailEffect = TuneDataPhadyr.AcidBlobTracerSmokeTrailEffect;
    AcidBlobTracerSmokeEmitterSpawnableClass = TuneDataPhadyr.AcidBlobTracerSmokeEmitterSpawnableClass;
    BuildPustuleSystem();
    bDoneBlowingUpWhileDying = false;
    GrenCurrentlyDealingWith = none;
    super.InitTuneData(TuneData);
    // End:0x1D8
    if(LightEnvironment != none)
    {
        LightEnvironment.bDynamic = false;
    }
    MinLongRangeLobDistance = TuneDataPhadyr.MaxSeperationForMedRangeSlowPreyDownAttack.GetValue();
    MaxLongRangeLobDistance = MinLongRangeLobDistance + 1.0000000;
    // End:0x2B3
    if(TuneDataPhadyr.RangedLobStrikeInfoByZone.Length > 0)
    {
        MaxLongRangeLobDistance = TuneDataPhadyr.RangedLobStrikeInfoByZone[TuneDataPhadyr.RangedLobStrikeInfoByZone.Length - 1].XY_DistanceFromTargetForLobRangedStrikeInUU;
    }
    //return;    
}

simulated function BuildPustuleSystem()
{
    local /*0x97E50000-0x00000000*/ private int iterPus;
    local /*0x97E50000-0x00000000*/ private @NULL NewStatus;
    local /*0x97E50000-0x00000000*/ private float swapGrowthPercent, swapBurstPercent;
    local /*0x97E50000-0x00000000*/ private int randLoc;

    // End:0x292
    if(TuneDataPhadyr != none)
    {
        iterPus = 0;
        J0x1A:

        // End:0x292 [Loop If]
        if(iterPus < TuneDataPhadyr.PustuleGrowthDataList.Length)
        {
            NewStatus.PustuleGrowthData = TuneDataPhadyr.PustuleGrowthDataList[iterPus];
            NewStatus.bStartedPustule = false;
            NewStatus.bBurstPustule = false;
            NewStatus.DamagePustuleSkelControl = LPSkelControlSingleBone(Mesh.FindSkelControl(NewStatus.PustuleGrowthData.DamagePustuleSkelControlName));
            // End:0x160
            if(NewStatus.DamagePustuleSkelControl == none)
            {
            }
            // End:0x1E7
            if(NewStatus.PustuleGrowthData.SkelCtrlStrength < 0.0000000)
            {
                NewStatus.PustuleGrowthData.SkelCtrlStrength = TuneDataPhadyr.DamagePustuleDefaultSkelCtrlStrength;
            }
            // End:0x26E
            if(NewStatus.PustuleGrowthData.SkelCtrlBlendInTime < 0.0000000)
            {
                NewStatus.PustuleGrowthData.SkelCtrlBlendInTime = TuneDataPhadyr.DamagePustuleDefaultSkelCtrlBlendInTime;
            }
            PustuleGrowthStatuses.AddItem(NewStatus);            
            ++iterPus;
            // [Loop Continue]
            goto J0x1A;
        }
    }
    // End:0x504
    if(TuneDataPhadyr.bRandomizePustuleGrowth)
    {
        iterPus = 0;
        J0x2BF:

        // End:0x504 [Loop If]
        if(iterPus < PustuleGrowthStatuses.Length)
        {
            randLoc = Rand(PustuleGrowthStatuses.Length);
            // End:0x4F6
            if(iterPus != randLoc)
            {
                swapGrowthPercent = PustuleGrowthStatuses[iterPus].PustuleGrowthData.HealthPercentToGrowPustule;
                swapBurstPercent = PustuleGrowthStatuses[iterPus].PustuleGrowthData.HealthPercentToBurstPustule;
                PustuleGrowthStatuses[iterPus].PustuleGrowthData.HealthPercentToGrowPustule = PustuleGrowthStatuses[randLoc].PustuleGrowthData.HealthPercentToGrowPustule;
                PustuleGrowthStatuses[iterPus].PustuleGrowthData.HealthPercentToBurstPustule = PustuleGrowthStatuses[randLoc].PustuleGrowthData.HealthPercentToBurstPustule;
                PustuleGrowthStatuses[randLoc].PustuleGrowthData.HealthPercentToGrowPustule = swapGrowthPercent;
                PustuleGrowthStatuses[randLoc].PustuleGrowthData.HealthPercentToBurstPustule = swapBurstPercent;
            }
            ++iterPus;
            // [Loop Continue]
            goto J0x2BF;
        }
    }
    //return;    
}

simulated function InitAnimTemplates()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array MoveNames, MoveNodes;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x92
    if(AttackAnimTree != none)
    {
        MoveNames.AddItem(AnimTemplateLogic_StrikeWarningRattle_Name);        
        AttackAnimTree.FindAnimNodes(MoveNames, MoveNodes, Class'LPAnimNodeTemplateLogicNamedRoot');
        I = 0;
        AnimTemplateLogic_StrikeWarningRattle = LPAnimNodeTemplateLogicNamedRoot(MoveNodes[I++]);
    }
    super(LPPawn).InitAnimTemplates();
    //return;    
}

simulated event @NULL PostInitAnimTree()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelComp[8388609];

    super(SPPawn).PostInitAnimTree(SkelComp);
    //return;    
}

simulated event Destroyed()
{
    local /*0x97E50000-0x00000000*/ private int iterPus;

    super(LPAIPawnAkrid).Destroyed();
    iterPus = 0;
    J0x15:

    // End:0x77 [Loop If]
    if(iterPus < PustuleGrowthStatuses.Length)
    {
        PustuleGrowthStatuses[iterPus].DamagePustuleSkelControl = none;
        TurnOffDamagePustuleComponent(iterPus, true);
        ++iterPus;
        // [Loop Continue]
        goto J0x15;
    }
    ClearTimer('FireAllAcidBalls', self);
    //return;    
}

simulated function TurnOnDamagePustuleComponent()
{
    local /*0x97E50000-0x00000000*/ private int IndexOfPustuleToTurnOn[8388609];

    // End:0x2E0
    if(IndexOfPustuleToTurnOn < PustuleGrowthStatuses.Length)
    {
        // End:0x2A2
        if(PustuleGrowthStatuses[IndexOfPustuleToTurnOn].DamagePustuleParticleComponent == none)
        {
            PustuleGrowthStatuses[IndexOfPustuleToTurnOn].DamagePustuleParticleComponent = TuneDataPawnFXEventBindings.PlayEventFX(PustuleGrowthStatuses[IndexOfPustuleToTurnOn].PustuleGrowthData.GrowthParticleEffectEventName, self, Mesh, none);
            // End:0x29F
            if(PustuleGrowthStatuses[IndexOfPustuleToTurnOn].DamagePustuleParticleComponent != none)
            {
                PustuleGrowthStatuses[IndexOfPustuleToTurnOn].DamagePustuleParticleComponent.SetTickGroup(3);
                PustuleGrowthStatuses[IndexOfPustuleToTurnOn].DamagePustuleParticleComponent.__OnSystemFinished__Delegate = None;
                PustuleGrowthStatuses[IndexOfPustuleToTurnOn].DamagePustuleParticleComponent.bAutoActivate = false;
                PustuleGrowthStatuses[IndexOfPustuleToTurnOn].DamagePustuleParticleComponent.SetActive(true);
                PustuleGrowthStatuses[IndexOfPustuleToTurnOn].DamagePustuleParticleComponent.SetScale(PustuleGrowthStatuses[IndexOfPustuleToTurnOn].PustuleGrowthData.ScaleOfGrowPustule);
                PustuleGrowthStatuses[IndexOfPustuleToTurnOn].bStartedPustule = true;
            }            
        }
        else
        {
            PustuleGrowthStatuses[IndexOfPustuleToTurnOn].DamagePustuleParticleComponent.SetActive(true);
        }
    }
    //return;    
}

simulated function TurnOffDamagePustuleComponent()
{
    local /*0x97E50000-0x00000000*/ private int IndexOfPustuleToTurnOff[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDestroy[8388609];

    // End:0x18E
    if(IndexOfPustuleToTurnOff < PustuleGrowthStatuses.Length)
    {
        // End:0x18E
        if(PustuleGrowthStatuses[IndexOfPustuleToTurnOff].DamagePustuleParticleComponent != none)
        {
            // End:0x150
            if(bDestroy)
            {
                WorldInfo.MyEmitterPool.OnParticleSystemFinished(PustuleGrowthStatuses[IndexOfPustuleToTurnOff].DamagePustuleParticleComponent);
                PustuleGrowthStatuses[IndexOfPustuleToTurnOff].DamagePustuleParticleComponent.DetachFromAny();
                PustuleGrowthStatuses[IndexOfPustuleToTurnOff].DamagePustuleParticleComponent.SetActive(false);
                PustuleGrowthStatuses[IndexOfPustuleToTurnOff].DamagePustuleParticleComponent = none;                
            }
            else
            {
                PustuleGrowthStatuses[IndexOfPustuleToTurnOff].DamagePustuleParticleComponent.SetActive(false);
            }
        }
    }
    //return;    
}

simulated function CanTakeNonCoreDamage()
{
    local /*0x97E50000-0x00000000*/ private class inDamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function AllowedToProcessTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(LPAIPawn).AllowedToProcessTakeDamage();
    //return ReturnValue;    
}

simulated function GetCoreGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000;
    //return ReturnValue;    
}

function EnableAnnounceGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    //return;    
}

function PlayWithdrawingScaredSound()
{
    //return;    
}

simulated function IsValidTargetForGrenadeAssist()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function GetNameOfBoneToAttackGrenadeToBasedOnPhysicalMaterial()
{
    local /*0x97E50000-0x00000000*/ private @NULL PhysMatToTest[8388609];
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL hitCoreTag;
    local /*0x97E50000-0x00000000*/ private int coreIdOn, iter;

    // End:0x140
    if(PhysMatToTest != none)
    {
        hitCoreTag = LPPhysMatPropTag_CoreId(PhysMatToTest.GetTag(Class'LPPhysMatPropTag_CoreId'));
        coreIdOn = hitCoreTag.GetCoreId();
        iter = 0;
        J0x7E:

        // End:0x140 [Loop If]
        if(iter < TuneDataPhadyr.BoneAttachPointByCore.Length)
        {
            // End:0x132
            if(int(TuneDataPhadyr.BoneAttachPointByCore[iter].CoreID) == coreIdOn)
            {
                return TuneDataPhadyr.BoneAttachPointByCore[iter].BoneName;
            }
            iter++;
            // [Loop Continue]
            goto J0x7E;
        }
    }
    //return ReturnValue;    
}

static simulated function PassThroughDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((!HitActor.bBlockActors && HitActor.IsA('Trigger') || HitActor.IsA('TriggerVolume')) || HitActor.IsA('InteractiveFoliageActor')) || HitActor.IsA('LPBreadcrumb');
    //return ReturnValue;    
}

simulated function BlowMeUpAfterSwallowingGreande()
{
    // End:0xB0
    if(TuneDataPhadyr.bUseTimeDelayAfterGrenadeGluedBeforeExplosion)
    {
        // End:0xAD
        if((WorldInfo.TimeSeconds - TimeGrenadeGlued) > TuneDataPhadyr.DelayBetweenHitAndBoomWhenGoingThroughMassiveGrenadeExplosion)
        {
            bShouldRagdoll = false;
            GrenCurrentlyDealingWith.DoExplosion();
            ClearTimer('BlowMeUpAfterSwallowingGreande', self);
        }        
    }
    else
    {
        // End:0x132
        if((DrawScale * TuneDataPhadyr.HowMuchToIncreaseSizePerUpdateWhenGoingThroughMassiveGrenadeExplosion) < TuneDataPhadyr.MaxSizeToIncreaseSizeByWhenGoingThroughMassiveGrenadeExplosion)
        {
            SetDrawScale(DrawScale * TuneDataPhadyr.HowMuchToIncreaseSizePerUpdateWhenGoingThroughMassiveGrenadeExplosion);            
        }
        else
        {
            bShouldRagdoll = false;
            GrenCurrentlyDealingWith.DoExplosion();
            ClearTimer('BlowMeUpAfterSwallowingGreande', self);
        }
    }
    return;
    //return;    
}

simulated function NotifyStartOfRangedLobFire()
{
    StartOfRangedDirectFire();
    //return;    
}

simulated function NotifyStartOfRangedDirectFire()
{
    StartOfRangedDirectFire();
    //return;    
}

simulated function GetProjectileFirePositionAndRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL out_ProjLoc[25165825], out_ProjDir, out_ProjRot;

    Instigator.Mesh.GetSocketWorldLocationAndRotation('LobFire', out_ProjLoc, out_ProjRot);
    out_ProjDir = Vector(out_ProjRot);
    //return;    
}

simulated function GetMaxLongRangeLobStrikeRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return MaxLongRangeLobDistance;
    //return ReturnValue;    
}

simulated function GetMinLongRangeLobStrikeRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return MinLongRangeLobDistance;
    //return ReturnValue;    
}

simulated function StartOfRangedDirectFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL projLoc, projDir, projRot, SpawnedProjectile, aimPositionForThisLobStrike, fireVel;

    // End:0x232
    if(int(WorldInfo.NetMode) != int(NM_Client))
    {
        GetProjectileFirePositionAndRotation(projLoc, projDir, projRot);
        SpawnedProjectile = Spawn(RangedDirectFireProjtileClass, self,, projLoc, projRot);
        // End:0x232
        if((SpawnedProjectile != none) && !SpawnedProjectile.bDeleteMe)
        {
            // End:0x140
            if(TuneDataPhadyr.bUseTargetsCurrentLocAtLobRelease)
            {
                aimPositionForThisLobStrike = AimTargetActorForRangedLobStrike.Location;
                aimPositionForThisLobStrike.Z += TuneDataPhadyr.HieghtOffTargetPointForEndOfLobFireArc;                
            }
            else
            {
                aimPositionForThisLobStrike = AimTargetPositionForRangedLobStrike;
            }
            projDir = aimPositionForThisLobStrike - projLoc;
            projDir = Normal(projDir);
            fireVel = projDir * (GetRangedLobFireIdealSpeedForCurrentLob());
            SpawnedProjectile.Init(projDir);
            projRot = Rotator(projDir);
            SpawnedProjectile.Velocity = fireVel;
            LobProjStartLocation = SpawnedProjectile.Location;
        }
    }
    //return;    
}

simulated function StartOfRangedLobFire()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL projLoc, projDir, projRot, SpawnedProjectile, aimPositionForThisLobStrike, fireVel;

    local /*0x97E50000-0x00000000*/ private bool bFireSolotionPossible;

    bFireSolotionPossible = false;
    // End:0x33C
    if(int(WorldInfo.NetMode) != int(NM_Client))
    {
        GetProjectileFirePositionAndRotation(projLoc, projDir, projRot);
        SpawnedProjectile = Spawn(RangedIndirectFireProjtileClass, self,, projLoc, projRot);
        // End:0x33C
        if((SpawnedProjectile != none) && !SpawnedProjectile.bDeleteMe)
        {
            // End:0x14C
            if(TuneDataPhadyr.bUseTargetsCurrentLocAtLobRelease)
            {
                aimPositionForThisLobStrike = AimTargetActorForRangedLobStrike.Location;
                aimPositionForThisLobStrike.Z += TuneDataPhadyr.HieghtOffTargetPointForEndOfLobFireArc;                
            }
            else
            {
                aimPositionForThisLobStrike = AimTargetPositionForRangedLobStrike;
            }
            projDir = aimPositionForThisLobStrike - projLoc;
            projDir = Normal(projDir);
            SpawnedProjectile.Init(projDir);
            projRot = Rotator(projDir);
            // End:0x209
            if(TuneDataPhadyr.bShowLobFireAttackDebug)
            {
                LogAlgosSegmentValiditys.Length = 0;
                LogAlgosSegmentEnds.Length = 0;
            }
            bFireSolotionPossible = FindTossVelocity(fireVel, aimPositionForThisLobStrike, projLoc, GetRangedLobFireIdealSpeedForCurrentLob(), GetRangedLobFireMinSpeedForCurrentLob(), GetRangedLobFireMaxSpeedForCurrentLob(), 0.0000000, GetDesiredZPercentOfLobForCurrentLob(), GetShapeOfProjectileForLobCalcForCurrentLob(),, WorldInfo.WorldGravityZ * SpawnedProjectile.CustomGravityScale, true, GetBestCurrentVelocityForThisTarget(AimTargetActorForRangedLobStrike),, true, false, -1);
            LobProjStartLocation = SpawnedProjectile.Location;
            SpawnedProjectile.Velocity = fireVel * TuneDataPhadyr.FactorToIncreaseLongRageLobBy;
        }
    }
    return bFireSolotionPossible;
    //return ReturnValue;    
}

simulated function NotifyStartOfAcidSpitFire()
{
    // End:0x19
    if(!bPerformingSpitBurst)
    {
        StartOfAcidSpitFire();
    }
    //return;    
}

simulated function CalcBioProjectileFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartTrace[8388609], EndTrace;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ImpactList[26214401];
    local /*0x97E50000-0x00000000*/ private @NULL Extent[9437185], ReturnValue, HitLocation, HitNormal, Dir, HitActor,
	    HitInfo, CurrentImpact, Portal;

    local /*0x97E50000-0x00000000*/ private float HitDist;

    // End:0x2DE
    foreach TraceActors(Class'Engine.Actor', HitActor, HitLocation, HitNormal, EndTrace, StartTrace, Extent, HitInfo, 1)
    {
        CurrentImpact.HitActor = HitActor;
        CurrentImpact.HitLocation = HitLocation;
        CurrentImpact.HitNormal = HitNormal;
        CurrentImpact.RayDir = Normal(EndTrace - StartTrace);
        CurrentImpact.StartTrace = StartTrace;
        CurrentImpact.HitInfo = HitInfo;
        ImpactList[ImpactList.Length] = CurrentImpact;
        // End:0x2DD
        if(HitActor != none)
        {
            // End:0x195
            if(!PassThroughDamage(HitActor))
            {                
                return CurrentImpact;
                // End:0x2DD
                continue;
            }
            Portal = PortalTeleporter(HitActor);
            // End:0x2DD
            if((Portal != none) && Portal.SisterPortal != none)
            {
                Dir = EndTrace - StartTrace;
                HitDist = VSize(HitLocation - StartTrace);
                StartTrace = Portal.TransformHitLocation(HitLocation);
                EndTrace = StartTrace + Portal.TransformVectorDir(Normal(Dir) * (VSize(Dir) - HitDist));                
                return CalcBioProjectileFire(StartTrace, EndTrace, ImpactList, Extent);
            }
        }        
    }    
    CurrentImpact.HitLocation = EndTrace;
    return CurrentImpact;
    //return ReturnValue;    
}

simulated function StartOfAcidSpitFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartTrace, EndTrace;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ImpactList;
    local /*0x97E50000-0x00000000*/ private @NULL AdjustedAimDir;

    Mesh.GetSocketWorldLocationAndRotation('MouthSpitAim', CurrentSpitBurstFireFromLoc, CurrentSpitBurstFireRot);
    StartTrace = CurrentSpitBurstFireFromLoc;
    AdjustedAimDir = Vector(CurrentSpitBurstFireRot);
    EndTrace = StartTrace + (AdjustedAimDir * TuneDataPhadyr.AcidSpitRange.GetValue());    
    CalcBioProjectileFire(StartTrace, EndTrace, ImpactList);
    TuneDataPawnFXEventBindings.PlayEventFX('MouthFlashAcidSpit', self, Mesh, none);
    bPerformingSpitBurst = true;
    NumOfPelletSpitSoFarThisBurst = 0;
    SetTimer(TuneDataPhadyr.FireAllAcidBallsUpdateRate.GetValue(), true, 'FireAllAcidBalls', self);
    //return;    
}

final simulated function FireAllAcidBalls()
{
    local /*0x97E50000-0x00000000*/ private @NULL EndTrace, AimDir, realTracerEndPoint;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ImpactList;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL AimRot;
    local /*0x97E50000-0x00000000*/ private float horizontalSpread, verticalSpread;

    HitPhysMaterials.Length = 0;
    // End:0x25B
    if(NumOfPelletSpitSoFarThisBurst < int(NumAcidSpitPellets))
    {
        ImpactList.Length = 0;
        AimRot = CurrentSpitBurstFireRot;
        horizontalSpread = float(((FRand() < 0.5000000) ? HorizontalAcidPelletSpread : -HorizontalAcidPelletSpread));
        verticalSpread = float(((FRand() < 0.5000000) ? VerticalAcidPelletSpread : -VerticalAcidPelletSpread));
        AimRot.Yaw += int(horizontalSpread * FRand());
        AimRot.Pitch += int(verticalSpread * FRand());
        AimDir = Vector(AimRot);
        EndTrace = CurrentSpitBurstFireFromLoc + (AimDir * TuneDataPhadyr.AcidSpitRange.GetValue());        
        CalcBioProjectileFire(CurrentSpitBurstFireFromLoc, EndTrace, ImpactList);
        realTracerEndPoint = ((ImpactList.Length > 0) ? ImpactList[0].HitLocation : EndTrace);
        SpawnTracerEffect(realTracerEndPoint, VSize(realTracerEndPoint - CurrentSpitBurstFireFromLoc));
        Idx = 0;
        J0x209:

        // End:0x24D [Loop If]
        if(Idx < ImpactList.Length)
        {
            ProcessInstantHit_Internal(ImpactList[Idx]);
            ++Idx;
            // [Loop Continue]
            goto J0x209;
        }
        ++NumOfPelletSpitSoFarThisBurst;        
    }
    else
    {
        ClearTimer('FireAllAcidBalls', self);
        bPerformingSpitBurst = false;
    }
    //return;    
}

simulated function SpawnTracerEffect()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x97E50000-0x00000000*/ private float HitDistance[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], SpawnLoc, SpawnedTracerEmitter, SpawnRot, SpawnedProjectile, FinalTracerScale,
	    Direction;

    local /*0x97E50000-0x00000000*/ private float Lifetime;

    Mesh.GetSocketWorldLocationAndRotation('MouthSpit', SpawnLoc, SpawnRot);
    // End:0x1C8
    if((AcidBlobTracerSmokeTrailEffect != none) && AcidBlobTracerSmokeEmitterSpawnableClass != none)
    {
        SpawnedTracerEmitter = Spawn(AcidBlobTracerSmokeEmitterSpawnableClass, self,, SpawnLoc, Rotator(HitLocation - SpawnLoc));
        SpawnedTracerEmitter.ParticleSystemComponent.SetTemplate(AcidBlobTracerSmokeTrailEffect);
        SpawnedTracerEmitter.ParticleSystemComponent.SetVectorParameter('SnipeEnd', HitLocation);
        SpawnedTracerEmitter.ParticleSystemComponent.SetFloatParameter('BeamLength', VSize(HitLocation - SpawnLoc));
        SpawnedTracerEmitter.bDestroyOnSystemFinish = true;
        SpawnedTracerEmitter.ParticleSystemComponent.ActivateSystem();
    }
    // End:0x3A2
    if(HitDistance > float(0))
    {
        SpawnedProjectile = GetTracer(SpawnLoc, SpawnRot);
        // End:0x3A2
        if((SpawnedProjectile != none) && !SpawnedProjectile.bDeleteMe)
        {
            SpawnedProjectile.Instigator = self;
            FinalTracerScale = AcidSpitTracerScale;
            SpawnedProjectile.SetDrawScale3D(FinalTracerScale);
            SpawnedProjectile.Speed = AcidBlobTracerProjectileSpeed;
            SpawnedProjectile.MaxSpeed = AcidBlobTracerProjectileMaxSpeed;
            Direction = HitLocation - SpawnLoc;
            Lifetime = (HitDistance / SpawnedProjectile.MaxSpeed) + TuneDataPhadyr.AcidBlobLifeTimeBuffer;
            SpawnedProjectile.Init(Normal(Direction));
            SpawnedProjectile.LifeSpan = Lifetime;
        }
    }
    return SpawnedProjectile;
    //return ReturnValue;    
}

simulated function GetTracer()
{
    local /*0x97E50000-0x00000000*/ private @NULL SpawnLocation[8388609], SpawnRotation, ReturnValue, Tracer;
    local /*0x97E50000-0x00000000*/ private class TracerClass;

    TracerClass = GetProjectileClass();
    // End:0xAA
    if(TracerClass != none)
    {
        Tracer = Spawn(TracerClass, self);
        Tracer.SetLocation(SpawnLocation);
        Tracer.SetRotation(SpawnRotation);
        Tracer.SetPhysics(6);
    }
    return Tracer;
    //return ReturnValue;    
}

simulated function GetProjectileClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return AcidSpitProjectile;
    //return ReturnValue;    
}

private final simulated function @NULL ProcessInstantHit_Internal()
{
    local /*0x97E50000-0x00000000*/ private @NULL Impact[25165825];
    local /*0x97E50000-0x00000000*/ private int NumHits[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL NewKActor, HitStaticMesh;
    local /*0x97E50000-0x00000000*/ private class DamageTypeToUse;
    local /*0x97E50000-0x00000000*/ private bool bCanBecomeDynamicStaticMesh;

    DamageTypeToUse = Class'LPDamageTypeAcidBlob';
    // End:0xEE
    if((Impact.HitActor != none) && Impact.HitActor.bWorldGeometry)
    {
        HitStaticMesh = StaticMeshComponent(Impact.HitInfo.HitComponent);
        // End:0xEE
        if((HitStaticMesh != none) && HitStaticMesh.CanBecomeDynamic())
        {
            bCanBecomeDynamicStaticMesh = true;
        }
    }
    // End:0x296
    if(bCanBecomeDynamicStaticMesh || ShouldRegisterDamage(Impact.HitActor))
    {
        // End:0x19A
        if(bCanBecomeDynamicStaticMesh)
        {
            NewKActor = Class'Engine.KActorFromStatic'.static.MakeDynamic(HitStaticMesh);
            // End:0x19A
            if(NewKActor != none)
            {
                Impact.HitActor = NewKActor;
            }
        }
        Impact.HitActor.TakeDamage(int(TuneDataPhadyr.DamagePerAcidBlob.GetValue()), Controller, Impact.HitLocation, TuneDataPhadyr.MomentumPerAcidBlob * Normal(Impact.HitLocation - Location), DamageTypeToUse, Impact.HitInfo, self);
    }
    // End:0x2F0
    if((Trigger(Impact.HitActor) != none) || TriggerVolume(Impact.HitActor) != none)
    {
        return;
    }
    //return;    
}

simulated function ShouldRegisterDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn;

    // End:0xF3
    if(A != none)
    {
        // End:0x3A
        if(int(WorldInfo.NetMode) != int(NM_Client))
        {
            return true;
        }
        HitPawn = SPPawn(A);
        // End:0x8B
        if((HitPawn != none) && HitPawn.bTearOff)
        {
            return true;
        }
        // End:0xF3
        if((((FracturedStaticMeshActor(A) != none) || FluidSurfaceActor(A) != none) || KActorFromStatic(A) != none) || CrowdAgentBase(A) != none)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function UpdateDamagePustuleSystem()
{
    local /*0x97E50000-0x00000000*/ private int iterPus;
    local /*0x97E50000-0x00000000*/ private float currentPercentTotalHealth, SkelCtrlStrength, SkelCtrlBlendInTime;

    // End:0x34
    if(HealthMax != 0)
    {
        currentPercentTotalHealth = float(Health) / float(HealthMax);        
    }
    else
    {
        currentPercentTotalHealth = 1.0000000;
    }
    iterPus = 0;
    J0x4E:

    // End:0x36E [Loop If]
    if(iterPus < PustuleGrowthStatuses.Length)
    {
        // End:0x21F
        if((!PustuleGrowthStatuses[iterPus].bStartedPustule && !PustuleGrowthStatuses[iterPus].bBurstPustule) && currentPercentTotalHealth < PustuleGrowthStatuses[iterPus].PustuleGrowthData.HealthPercentToGrowPustule)
        {
            TurnOnDamagePustuleComponent(iterPus);
            // End:0x21C
            if(PustuleGrowthStatuses[iterPus].DamagePustuleSkelControl != none)
            {
                SkelCtrlStrength = PustuleGrowthStatuses[iterPus].PustuleGrowthData.SkelCtrlStrength;
                SkelCtrlBlendInTime = PustuleGrowthStatuses[iterPus].PustuleGrowthData.SkelCtrlBlendInTime;
                PustuleGrowthStatuses[iterPus].DamagePustuleSkelControl.SetSkelControlStrength(SkelCtrlStrength, SkelCtrlBlendInTime);
            }            
        }
        else
        {
            // End:0x360
            if((PustuleGrowthStatuses[iterPus].bStartedPustule && !PustuleGrowthStatuses[iterPus].bBurstPustule) && currentPercentTotalHealth < PustuleGrowthStatuses[iterPus].PustuleGrowthData.HealthPercentToBurstPustule)
            {
                PustuleGrowthStatuses[iterPus].bBurstPustule = true;
                TurnOffDamagePustuleComponent(iterPus, true);
                TuneDataPawnFXEventBindings.PlayEventFX(PustuleGrowthStatuses[iterPus].PustuleGrowthData.BurstParticleEffectEventName, self, Mesh, none);
            }
        }
        ++iterPus;
        // [Loop Continue]
        goto J0x4E;
    }
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(LPPawn).Tick(DeltaTime);
    //return;    
}

function GetMeleeHitReactionImpulseForce()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitImpulseForce[25165825], HitDirection, CombinedImpulse;
    local /*0x97E50000-0x00000000*/ private float MeleeHitHorizantalImpulse, MeleeHitUpwardImpulse;

    MeleeHitHorizantalImpulse = TuneDataPhadyr.MeleeHitHorizontalImpulse.GetValue();
    MeleeHitUpwardImpulse = TuneDataPhadyr.MeleeHitUpwardImpulse.GetValue();
    HitDirection = Location - TakeDamageParams.DamageCauser.Location;
    HitDirection.Z = 0.0000000;
    HitDirection = Normal(HitDirection);
    CombinedImpulse = HitDirection * MeleeHitHorizantalImpulse;
    CombinedImpulse.Z = MeleeHitUpwardImpulse;
    HitImpulseForce = CombinedImpulse * TuneDataPhadyr.MeleeHitImpulseSizeFactor.GetValue();
    //return;    
}

reliable server function ServerKnockBackMelee()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609], ImpactLocation, HitImpulseForce;

    GetMeleeHitReactionImpulseForce(HitImpulseForce);
    KnockDownMeleeInfo.bActive = true;
    KnockDownMeleeInfo.ImpulseLocation = ImpactLocation;
    KnockDownMeleeInfo.ImpulseSize = VSize(HitImpulseForce);
    KnockDownMeleeInfo.ReplicateMe++;
    TakeDamage(1, PlayerPawn.Controller, ImpactLocation, HitImpulseForce, Class'LPDamageTypeMelee');
    //return;    
}

function StartDie()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];

    TuneDataPawnSoundEventBindings.PlayEventSoundLocally('NormalDeath', 'None', self, none, none);
    // End:0x4A
    if(!bShouldRagdoll)
    {
        Destroy();        
    }
    else
    {
        super(LPAIPawn).StartDie(DamageType, HitLoc);
    }
    //return;    
}

defaultproperties
{
    bUsesAkridProceduralMovementSounds=true
    bShouldRagdoll=true
    bAlwaysValidTargetForGrenadeAssist=true
    bAlwaysValidTargetForWinchAssist=true
    bShouldDeathBloom=true
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnPhadyr.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnPhadyr.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnPhadyr.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnPhadyr.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnPhadyr.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnPhadyr.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnPhadyr.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnPhadyr.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnPhadyr.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnPhadyr.FaceAudioComponent'
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
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnPhadyr.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}