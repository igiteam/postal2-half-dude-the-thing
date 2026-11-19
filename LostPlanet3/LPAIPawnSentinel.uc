class LPAIPawnSentinel extends LPAIPawnAkridStationary
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataSentinel[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_StrikeWarningRattle_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_StrikeWarningRattle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeGrenadeGlued[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrenCurrentlyDealingWith[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TracerCounter;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinLongRangeLobDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxLongRangeLobDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HeadTrackingLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name StemSkelControlName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StemSkelControl;

// Export ULPAIPawnSentinel::execIsValidCoreTagType(FFrame&, void* const)
native simulated function IsValidCoreTagType()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataSentinel = LPTuneDataSentinel(TuneData);
    bDoneBlowingUpWhileDying = false;
    GrenCurrentlyDealingWith = none;
    super.InitTuneData(TuneData);
    // End:0x76
    if(LightEnvironment != none)
    {
        LightEnvironment.bDynamic = false;
    }
    MinLongRangeLobDistance = TuneDataSentinel.MaxSeperationForDirectBurstFireRangeAttack.GetValue();
    MaxLongRangeLobDistance = MinLongRangeLobDistance + 1.0000000;
    // End:0x151
    if(TuneDataSentinel.RangedLobStrikeInfoByZone.Length > 0)
    {
        MaxLongRangeLobDistance = TuneDataSentinel.RangedLobStrikeInfoByZone[TuneDataSentinel.RangedLobStrikeInfoByZone.Length - 1].XY_DistanceFromTargetForLobRangedStrikeInUU;
    }
    //return;    
}

simulated function PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL RotDir, TempRot;

    super.PostBeginPlay();
    // End:0x80
    if(StemSkelControlName != 'None')
    {
        StemSkelControl = SkelControlSingleBone(Mesh.FindSkelControl(StemSkelControlName));
        StemSkelControl.ControlStrength = 0.0000000;
    }
    SetLocation(Location - Mesh.Translation);
    TempRot = Rotation;
    TempRot.Pitch -= 16384;
    RotDir = Vector(TempRot);
    SetLocation(Location - (RotDir * Mesh.Translation));
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
    super(LPAIPawnAkrid).Destroyed();
    ClearTimer('FireAllAcidBalls', self);
    //return;    
}

simulated function CanTakeNonCoreDamage()
{
    local /*0x97E50000-0x00000000*/ private class inDamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
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
        if(iter < TuneDataSentinel.BoneAttachPointByCore.Length)
        {
            // End:0x132
            if(int(TuneDataSentinel.BoneAttachPointByCore[iter].CoreID) == coreIdOn)
            {
                return TuneDataSentinel.BoneAttachPointByCore[iter].BoneName;
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
    if(TuneDataSentinel.bUseTimeDelayAfterGrenadeGluedBeforeExplosion)
    {
        // End:0xAD
        if((WorldInfo.TimeSeconds - TimeGrenadeGlued) > TuneDataSentinel.DelayBetweenHitAndBoomWhenGoingThroughMassiveGrenadeExplosion)
        {
            bShouldRagdoll = false;
            GrenCurrentlyDealingWith.DoExplosion();
            ClearTimer('BlowMeUpAfterSwallowingGreande', self);
        }        
    }
    else
    {
        // End:0x132
        if((DrawScale * TuneDataSentinel.HowMuchToIncreaseSizePerUpdateWhenGoingThroughMassiveGrenadeExplosion) < TuneDataSentinel.MaxSizeToIncreaseSizeByWhenGoingThroughMassiveGrenadeExplosion)
        {
            SetDrawScale(DrawScale * TuneDataSentinel.HowMuchToIncreaseSizePerUpdateWhenGoingThroughMassiveGrenadeExplosion);            
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

simulated function BlowMeUpWhileDying()
{
    local /*0x97E50000-0x00000000*/ private float bloomDelta, bloomUpdateDelta, currentScaleRate, CurrentScale, NewScale;

    bloomDelta = WorldInfo.TimeSeconds - DeathBloomStartTime;
    bloomUpdateDelta = WorldInfo.TimeSeconds - LastDeathBloomUpdateTime;
    LastDeathBloomUpdateTime = WorldInfo.TimeSeconds;
    currentScaleRate = Class'SPEngine.SPCurveFloat'.static.ApplyCurve(bloomDelta, TuneDataSentinel.HowMuchToIncreaseSizePerSecWhenGoingThroughMassiveDeathExplosionCurve);
    CurrentScale = currentScaleRate * bloomUpdateDelta;
    CurrentScale += 1.0000000;
    NewScale = DrawScale * CurrentScale;
    // End:0x178
    if(NewScale < TuneDataSentinel.MaxSizeToIncreaseSizeByWhenGoingThroughMassiveDeathExplosion)
    {
        SetDrawScale(DrawScale * CurrentScale);        
    }
    else
    {
        bShouldRagdoll = false;
        bDoneBlowingUpWhileDying = true;
        // End:0x1B4
        if(!TuneDataSentinel.bDoRipApartExplosionAtSameTimeAsGibThrowOut)
        {
        }
        ClearTimer('BlowMeUpWhileDying', self);
        Destroy();
    }
    return;
    //return;    
}

simulated function NotifyStartOfRangedLobFire()
{
    StartOfRangedLobFire();
    //return;    
}

simulated function NotifyStartOfRangedDirectFire()
{
    StartOfRangedDirectFire();
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

simulated event HandleAnimNotifyAkridRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609];

    // End:0x25
    if(LPAnimNotify_SentinelDirectFire(Notify) != none)
    {
        NotifyStartOfRangedDirectFire();        
    }
    else
    {
        // End:0x4A
        if(LPAnimNotify_SentinelBurstFire(Notify) != none)
        {
            NotifyStartOfRangedBurstFire();            
        }
        else
        {
            // End:0x6F
            if(LPAnimNotify_SentinelLobFire(Notify) != none)
            {
                NotifyStartOfRangedLobFire();                
            }
            else
            {
                // End:0x93
                if(LPAnimNotify_SentinelBurstFireEnd(Notify) != none)
                {
                    bPerformingBurstFire = false;
                }
            }
        }
    }
    //return;    
}

simulated function StartOfRangedDirectFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL projLoc, projDir, projRot, SpawnedProjectile, aimPositionForThisLobStrike, fireVel;

    // End:0x27B
    if(int(WorldInfo.NetMode) != int(NM_Client))
    {
        GetDirectFireProjectileFirePositionAndRotation(projLoc, projDir, projRot);
        SpawnedProjectile = Spawn(RangedDirectFireProjtileClass, self,, projLoc, projRot);
        // End:0x27B
        if((SpawnedProjectile != none) && !SpawnedProjectile.bDeleteMe)
        {
            // End:0x140
            if(TuneDataSentinel.bUseTargetsCurrentLocAtLobRelease)
            {
                aimPositionForThisLobStrike = AimTargetActorForDirectFireStrike.Location;
                aimPositionForThisLobStrike.Z += TuneDataSentinel.HieghtOffTargetPointForEndOfLobFireArc;                
            }
            else
            {
                aimPositionForThisLobStrike = AimTargetPositionForDirectFireStrike;
            }
            projDir = aimPositionForThisLobStrike - projLoc;
            projDir = Normal(projDir);
            fireVel = projDir * (GetRangedLobFireIdealSpeedForCurrentLob());
            SpawnedProjectile.Init(projDir);
            projRot = Rotator(projDir);
            SpawnedProjectile.Velocity = fireVel;
            SpawnedProjectile.LifeSpan = (VSize(aimPositionForThisLobStrike - projLoc) / VSize(fireVel)) * 2.0000000;
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
    local /*0x97E50000-0x00000000*/ private float VelTune, AltZTune;

    bFireSolotionPossible = false;
    // End:0x3E9
    if(int(WorldInfo.NetMode) != int(NM_Client))
    {
        GetLobProjectileFirePositionAndRotation(projLoc, projDir, projRot);
        SpawnedProjectile = Spawn(LobFireProjtileClass, self,, projLoc, projRot);
        // End:0x3E9
        if((SpawnedProjectile != none) && !SpawnedProjectile.bDeleteMe)
        {
            // End:0x14C
            if(TuneDataSentinel.bUseTargetsCurrentLocAtLobRelease)
            {
                aimPositionForThisLobStrike = AimTargetActorForRangedLobStrike.Location;
                aimPositionForThisLobStrike.Z += TuneDataSentinel.HieghtOffTargetPointForEndOfLobFireArc;                
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
            if(TuneDataSentinel.bShowLobFireAttackDebug)
            {
                LogAlgosSegmentValiditys.Length = 0;
                LogAlgosSegmentEnds.Length = 0;
            }
            VelTune = TuneDataSentinel.FactorToIncreaseLongRageLobBy;
            AltZTune = GetDesiredZPercentOfLobForCurrentLob();
            // End:0x2B6
            if(int(LPPawn(Controller.Enemy).CoverType) != int(0))
            {
                VelTune = VelTune * 0.5000000;
                AltZTune *= 1.2500000;
            }
            bFireSolotionPossible = FindTossVelocity(fireVel, aimPositionForThisLobStrike, projLoc, (GetRangedLobFireIdealSpeedForCurrentLob()) * VelTune, (GetRangedLobFireMinSpeedForCurrentLob()) * VelTune, (GetRangedLobFireMaxSpeedForCurrentLob()) * VelTune, 0.0000000, AltZTune, GetShapeOfProjectileForLobCalcForCurrentLob(),, WorldInfo.WorldGravityZ * SpawnedProjectile.CustomGravityScale, true, GetBestCurrentVelocityForThisTarget(AimTargetActorForRangedLobStrike),, true, false, -1);
            LobProjStartLocation = SpawnedProjectile.Location;
            SpawnedProjectile.Velocity = fireVel;
        }
    }
    return bFireSolotionPossible;
    //return ReturnValue;    
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

    MeleeHitHorizantalImpulse = TuneDataSentinel.MeleeHitHorizontalImpulse.GetValue();
    MeleeHitUpwardImpulse = TuneDataSentinel.MeleeHitUpwardImpulse.GetValue();
    HitDirection = Location - TakeDamageParams.DamageCauser.Location;
    HitDirection.Z = 0.0000000;
    HitDirection = Normal(HitDirection);
    CombinedImpulse = HitDirection * MeleeHitHorizantalImpulse;
    CombinedImpulse.Z = MeleeHitUpwardImpulse;
    HitImpulseForce = CombinedImpulse * TuneDataSentinel.MeleeHitImpulseSizeFactor.GetValue();
    //return;    
}

function StartBlowMeUpWhileDying()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[9437185];

    Class'LPDamageType'
    Location
    // End:0x8C
    if(!bDoneBlowingUpWhileDying)
    {
        DeathBloomStartTime = WorldInfo.TimeSeconds;
        LastDeathBloomUpdateTime = WorldInfo.TimeSeconds;
        SetTimer(0.0300000, true, 'BlowMeUpWhileDying', self);
    }
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
        // End:0x181
        if(!bDoneBlowingUpWhileDying && TuneDataSentinel.bPerformDeathBloom.GetValue() != float(0))
        {
            // End:0xC0
            if(WantsToPlayDieAnim(DamageType))
            {
                PlayDyingSpecialMove(Class'LPSM_SentinelDie');
            }
            LocationAtStartOfDeathBloom = Location;
            LocationAtStartOfDeathBloomForRipExplosion = Mesh.GetBoneLocation(TuneDataSentinel.NameOfBoneForDeathRipapartExplosion);
            DeathBloomStartTime = WorldInfo.TimeSeconds;
            LastDeathBloomUpdateTime = WorldInfo.TimeSeconds;
            SetTimer(0.0400000, false, 'StartBlowMeUpWhileDying', self);            
        }
        else
        {
            super(LPAIPawn).StartDie(DamageType, HitLoc);
        }
    }
    //return;    
}

simulated function HideFromRadar()
{
    local /*0x97E50000-0x00000000*/ private @NULL RadarController[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x26
    if(self.IsDoingSpecialMove_OF_Class(Class'LPSM_SentinelTurtleLoop'))
    {
        return true;
    }
    return super(LPPawn).HideFromRadar(RadarController);
    //return ReturnValue;    
}

simulated event DoAILookAt()
{
    local /*0x97E50000-0x00000000*/ private @NULL whereToLook[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    whereToLook = HeadTrackingLocation;
    return true;
    //return ReturnValue;    
}

defaultproperties
{
    StemSkelControlName="Stem_A"
    bShouldRagdoll=true
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnSentinel.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnSentinel.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnSentinel.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: LPHeadTrackComponent'Default__LPAIPawnSentinel.HeadTrackComponent0'
    begin object name=HeadTrackComponent0 class=Class'LPHeadTrackComponent'
    end object
    HeadTrackComponent=HeadTrackComponent0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnSentinel.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnSentinel.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnSentinel.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnSentinel.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnSentinel.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnSentinel.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnSentinel.FaceAudioComponent'
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
    Components[10]=HeadTrackComponent0
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnSentinel.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}