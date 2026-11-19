class LPAIPawnSepia extends LPAIPawnAkridSmall
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataSepia[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPawnAlwaysInfluencedByDominantDirectionalLight[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HeadGlowFactor[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScriptedHeadGlowFactor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EffectiveScriptedHeadGlowFactor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScriptedHeadGlowRampRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleNPH;

// Export ULPAIPawnSepia::execIsValidCoreTagType(FFrame&, void* const)
native simulated function IsValidCoreTagType()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawnSepia::execGetHeadGlowFactor(FFrame&, void* const)
native final simulated function GetHeadGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


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

    TuneDataSepia = LPTuneDataSepia(TuneData);
    bDoneBlowingUpWhileDying = false;
    super.InitTuneData(TuneData);
    // End:0x74
    if(LightEnvironment != none)
    {
        LightEnvironment.bAlwaysInfluencedByDominantDirectionalLight = bPawnAlwaysInfluencedByDominantDirectionalLight;
    }
    //return;    
}

simulated function InitAnimTemplates()
{
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
    // End:0x0F
    if(Health > 0)
    {
    }
    super(LPAIPawnAkrid).Destroyed();
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

    // End:0x2D
    if(ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeSepiaMelee'))
    {
        return false;
    }
    return super(LPAIPawn).AllowedToProcessTakeDamage();
    //return ReturnValue;    
}

function PlayWithdrawingScaredSound()
{
    //return;    
}

simulated function IsValidTargetForGrenadeAssist()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function OnSetPackHunterHeadGlow()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    ScriptedHeadGlowFactor = inAction.GlowValue;
    ScriptedHeadGlowRampRate = inAction.RampRate;
    //return;    
}

function EnableAnnounceHeadGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    HeadGlowFactor = ((bEnable) ? TuneDataSepia.AttackMouthGlow.GetValue() : TuneDataSepia.IdleMouthGlow.GetValue());
    //return;    
}

static simulated function PassThroughDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((!HitActor.bBlockActors && HitActor.IsA('Trigger') || HitActor.IsA('TriggerVolume')) || HitActor.IsA('InteractiveFoliageActor')) || HitActor.IsA('LPBreadcrumb');
    //return ReturnValue;    
}

simulated event IsSameTeam()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(LPAIPawnAkridLarge(Other) != none)
    {
        return false;
    }
    return ((Other != none) && Other.GetTeam() != none) && Other.GetTeam() == (GetTeam());
    //return ReturnValue;    
}

simulated function BlowMeUpWhileDying()
{
    local /*0x97E50000-0x00000000*/ private float bloomDelta, bloomUpdateDelta, currentScaleRate, CurrentScale, NewScale;

    bloomDelta = WorldInfo.TimeSeconds - DeathBloomStartTime;
    bloomUpdateDelta = WorldInfo.TimeSeconds - LastDeathBloomUpdateTime;
    LastDeathBloomUpdateTime = WorldInfo.TimeSeconds;
    currentScaleRate = Class'SPEngine.SPCurveFloat'.static.ApplyCurve(bloomDelta, TuneDataSepia.HowMuchToIncreaseSizePerSecWhenGoingThroughMassiveDeathExplosionCurve);
    CurrentScale = currentScaleRate * bloomUpdateDelta;
    CurrentScale += 1.0000000;
    NewScale = DrawScale * CurrentScale;
    // End:0x178
    if(NewScale < TuneDataSepia.MaxSizeToIncreaseSizeByWhenGoingThroughMassiveDeathExplosion)
    {
        SetDrawScale(DrawScale * CurrentScale);        
    }
    else
    {
        bShouldRagdoll = false;
        bDoneBlowingUpWhileDying = true;
        // End:0x1B4
        if(!TuneDataSepia.bDoRipApartExplosionAtSameTimeAsGibThrowOut)
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

simulated function ShouldFireLobProjectileEvenWithNoValidFireSolution()
{
    local /*0x97E50000-0x00000000*/ private @NULL AimPositionForLob[25296897], LobFireLocOfBlockage;
    local /*0x97E50000-0x00000000*/ private bool bIntentionallyMissing[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private float distanceFromPawnToBlockage, distanceFromTargetToBlockage, distanceFromPawnToBlockageThatMustBeGreaterThan, distanceFromTargetToBlockageThatMustBeLessThan;

    distanceFromPawnToBlockage = VSize(Location - LobFireLocOfBlockage);
    distanceFromPawnToBlockageThatMustBeGreaterThan = TuneDataSepia.ForLobStrikeDistanceFromPawnToBlockageThatMustBeGreaterThanToStillLaunch.GetValue();
    // End:0xF2
    if(distanceFromPawnToBlockage >= distanceFromPawnToBlockageThatMustBeGreaterThan)
    {
        distanceFromTargetToBlockage = VSize(AimPositionForLob - LobFireLocOfBlockage);
        distanceFromTargetToBlockageThatMustBeLessThan = TuneDataSepia.ForLobStrikeDistanceFromTargetOfLobToBlockageThatMustBeLessThanToStillLaunch.GetValue();
        // End:0xEF
        if(distanceFromTargetToBlockage <= distanceFromTargetToBlockageThatMustBeLessThan)
        {
            return true;            
        }        
    }
    return false;
    //return ReturnValue;    
}

simulated function GetProjectileFirePositionAndRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL out_ProjLoc[25165825], out_ProjDir, out_ProjRot;

    Instigator.Mesh.GetSocketWorldLocationAndRotation('LobFire', out_ProjLoc, out_ProjRot);
    out_ProjDir = Vector(out_ProjRot);
    //return;    
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
            if(TuneDataSepia.bUseTargetsCurrentLocAtLobRelease)
            {
                aimPositionForThisLobStrike = AimTargetActorForRangedLobStrike.Location;
                aimPositionForThisLobStrike.Z += TuneDataSepia.HieghtOffTargetPointForEndOfLobFireArc;                
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

    MeleeHitHorizantalImpulse = TuneDataSepia.MeleeHitHorizontalImpulse.GetValue();
    MeleeHitUpwardImpulse = TuneDataSepia.MeleeHitUpwardImpulse.GetValue();
    HitDirection = Location - TakeDamageParams.DamageCauser.Location;
    HitDirection.Z = 0.0000000;
    HitDirection = Normal(HitDirection);
    CombinedImpulse = HitDirection * MeleeHitHorizantalImpulse;
    CombinedImpulse.Z = MeleeHitUpwardImpulse;
    HitImpulseForce = CombinedImpulse * TuneDataSepia.MeleeHitImpulseSizeFactor.GetValue();
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

    // End:0x15
    if(!bShouldRagdoll)
    {
        Destroy();        
    }
    else
    {
        // End:0x10E
        if(!bDoneBlowingUpWhileDying)
        {
            // End:0x4D
            if(WantsToPlayDieAnim(DamageType))
            {
                PlayDyingSpecialMove(Class'LPSM_SepiaDie');
            }
            LocationAtStartOfDeathBloom = Location;
            LocationAtStartOfDeathBloomForRipExplosion = Mesh.GetBoneLocation(TuneDataSepia.NameOfBoneForDeathRipapartExplosion);
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

simulated function ProcessForGibbing()
{
    local /*0x97E50000-0x00000000*/ private float PercentTotalHealth[8388609];

    // End:0x4F
    if(int(WorldInfo.NetMode) == int(NM_ListenServer))
    {
        // End:0x4F
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(NM_ListenServer))
        {
            return;
        }
    }
    super(SPPawn).ProcessForGibbing(PercentTotalHealth);
    //return;    
}

defaultproperties
{
    ScriptedHeadGlowRampRate=1.0000000
    bShouldRagdoll=true
    bShouldDeathBloom=true
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnSepia.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnSepia.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnSepia.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnSepia.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnSepia.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnSepia.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnSepia.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnSepia.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnSepia.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnSepia.FaceAudioComponent'
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
    // Reference: SPDamageStateComponent'Default__LPAIPawnSepia.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj class=Class'SPEngine.SPDamageStateComponent'
    end object
    Components[10]=DamageStateComponentDefObj
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnSepia.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}