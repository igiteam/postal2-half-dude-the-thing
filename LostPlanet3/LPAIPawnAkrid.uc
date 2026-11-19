class LPAIPawnAkrid extends LPAIPawn
    abstract
    nativereplication
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

enum ECheckCanDamageCore
{
    eCAN_DAMAGE_CORE_CHECK,         // 0
    eSKIP_CAN_DAMAGE_CHECK,         // 1
    ECheckCanDamageCore_MAX         // 2
};

struct native ReplicatedTossInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TossPawn;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TossVelocity;

    structdefaultproperties
    {
        TossPawn=none
        TossVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

struct native GrenadeStuckToAndCoreIdPair
{
    var(0.25_Pct) /*0x63C30000-0x00000000*/ private @NULL GrenadeStuck[65537];
    var(0.25_Pct) /*0x63C30000-0x00000000*/ private int CoreID[65537];

    structdefaultproperties
    {
        GrenadeStuck=none
        CoreID=0
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataAkrid[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private ReplicatedTossInfoStruct ReplicatedTossInfo[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DamageReactionManagerAkrid;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array GrenadesStuckToCores[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NonCorePhysMat;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentGrenExploding[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentCoreGrenadeExplodingAttachedTo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUsesAkridProceduralMovementSounds[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AkridMovementSoundEventName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL AkridProceduralMovementAudioComponent[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinSpeedToPlayAkridProceduralMovementSoundSq[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastUpdateTimeForProceduralMovementSound[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class RangedDirectFireProjtileClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LobFireProjtileClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class BurstFireProjtileClass;

// Export ULPAIPawnAkrid::execUpdateAkridNormalMovementSound(FFrame&, void* const)
native final simulated function UpdateAkridNormalMovementSound();

// Export ULPAIPawnAkrid::execShouldPlayAkridProceduralMovementAudio(FFrame&, void* const)
native simulated function ShouldPlayAkridProceduralMovementAudio()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawnAkrid::execTurnOffAkridProceduralMovementAudioComponent(FFrame&, void* const)
native final simulated function TurnOffAkridProceduralMovementAudioComponent();

// Export ULPAIPawnAkrid::execHandleWeaponFiring(FFrame&, void* const)
native simulated function HandleWeaponFiring();

// Export ULPAIPawnAkrid::execGetPawnViewLocation(FFrame&, void* const)
native simulated function GetPawnViewLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super.InitTuneData(TuneData);
    TuneDataAkrid = LPTuneDataAkrid(TuneData);
    bPerformingBurstFire = false;
    bIntentionalLobMiss = false;
    NumOfPelletSpitSoFarThisBurst = -1;
    HorizontalBurstFireSpread = TuneDataAkrid.BurstFireSpreadHorizontal;
    VerticalBurstFireSpread = TuneDataAkrid.BurstFireSpreadVertical;
    MinSpeedToPlayAkridProceduralMovementSoundSq = TuneDataAIPawn.MinSpeedToPlayProceduralMovementSound * TuneDataAIPawn.MinSpeedToPlayProceduralMovementSound;
    LastUpdateTimeForProceduralMovementSound = -1.0000000;
    bAbleToAdjustLobAimPositionForGameplay = TuneDataAkrid.bAbleToAdjustLobAimPositionForGameplay;
    bAbleToAdjustDirectFireAimPositionForGameplay = TuneDataAkrid.bAbleToAdjustDirectFireAimPositionForGameplay;
    // End:0x199
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        FloorConformInfo.ConformType = 1;
    }
    //return;    
}

simulated event CanUseFootPlacementControllers()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return false;
    }
    return super(SPPawn).CanUseFootPlacementControllers();
    //return ReturnValue;    
}

simulated event @NULL Attach()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private int AttachIdx;
    local /*0x97E50000-0x00000000*/ private @NULL LPCS, LPCS_Skeletal, FSM, DLE;

    super(Actor).Attach(Other);
    DLE = DynamicLightEnvironmentComponent(Mesh.LightEnvironment);
    FSM = FracturedStaticMeshActor(Other);
    // End:0x1D8
    if(FSM != none)
    {
        // End:0x9F
        if(DLE != none)
        {
            DLE.bSynthesizeSHLight = false;
        }
        // End:0xF7
        if(FSM.KynapseObstacleComponent != none)
        {
            FSM.KynapseObstacleComponent.DetachFromAny();
        }
        FSM.FracturedStaticMeshComponent.SetShadowParent(Mesh);
        FSM.FracturedStaticMeshComponent.SetLightingChannels(Mesh.LightingChannels);
        FSM.FracturedStaticMeshComponent.SetLightEnvironment(Mesh.LightEnvironment);
    }
    LPCS = LPCoreShield(Other);
    // End:0x50D
    if(LPCS != none)
    {
        // End:0x233
        if(DLE != none)
        {
            DLE.bSynthesizeSHLight = false;
        }
        LPCS.StaticMeshComponent.SetShadowParent(Mesh);
        LPCS.StaticMeshComponent.SetLightingChannels(Mesh.LightingChannels);
        LPCS.StaticMeshComponent.SetLightEnvironment(Mesh.LightEnvironment);
        AttachIdx = 0;
        J0x31F:

        // End:0x50D [Loop If]
        if(AttachIdx < LPCS.Attached.Length)
        {
            FSM = FracturedStaticMeshActor(LPCS.Attached[AttachIdx]);
            // End:0x4FF
            if(FSM != none)
            {
                // End:0x3C6
                if(DLE != none)
                {
                    DLE.bSynthesizeSHLight = false;
                }
                // End:0x41E
                if(FSM.KynapseObstacleComponent != none)
                {
                    FSM.KynapseObstacleComponent.DetachFromAny();
                }
                FSM.FracturedStaticMeshComponent.SetShadowParent(Mesh);
                FSM.FracturedStaticMeshComponent.SetLightingChannels(Mesh.LightingChannels);
                FSM.FracturedStaticMeshComponent.SetLightEnvironment(Mesh.LightEnvironment);
            }
            AttachIdx++;
            // [Loop Continue]
            goto J0x31F;
        }
    }
    LPCS_Skeletal = LPCoreShieldSkeletal(Other);
    // End:0x842
    if(LPCS_Skeletal != none)
    {
        // End:0x568
        if(DLE != none)
        {
            DLE.bSynthesizeSHLight = false;
        }
        LPCS_Skeletal.SkeletalMeshComponent.SetShadowParent(Mesh);
        LPCS_Skeletal.SkeletalMeshComponent.SetLightingChannels(Mesh.LightingChannels);
        LPCS_Skeletal.SkeletalMeshComponent.SetLightEnvironment(Mesh.LightEnvironment);
        AttachIdx = 0;
        J0x654:

        // End:0x842 [Loop If]
        if(AttachIdx < LPCS.Attached.Length)
        {
            FSM = FracturedStaticMeshActor(LPCS_Skeletal.Attached[AttachIdx]);
            // End:0x834
            if(FSM != none)
            {
                // End:0x6FB
                if(DLE != none)
                {
                    DLE.bSynthesizeSHLight = false;
                }
                // End:0x753
                if(FSM.KynapseObstacleComponent != none)
                {
                    FSM.KynapseObstacleComponent.DetachFromAny();
                }
                FSM.FracturedStaticMeshComponent.SetShadowParent(Mesh);
                FSM.FracturedStaticMeshComponent.SetLightingChannels(Mesh.LightingChannels);
                FSM.FracturedStaticMeshComponent.SetLightEnvironment(Mesh.LightEnvironment);
            }
            AttachIdx++;
            // [Loop Continue]
            goto J0x654;
        }
    }
    //return;    
}

simulated event Detach()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private int AttachIdx;
    local /*0x97E50000-0x00000000*/ private @NULL LPCS, LPCS_Skeletal, FSM;

    super(Actor).Detach(Other);
    FSM = FracturedStaticMeshActor(Other);
    // End:0x203
    if((FSM != none) && !FSM.IsPendingKill())
    {
        // End:0x100
        if((FSM.KynapseObstacleComponent != none) && !FSM.KynapseObstacleComponent.bAttached)
        {
            FSM.AttachComponent(FSM.KynapseObstacleComponent);
        }
        FSM.FracturedStaticMeshComponent.SetShadowParent(none);
        FSM.FracturedStaticMeshComponent.SetLightingChannels(FSM.FracturedStaticMeshComponent.LightingChannels);
        FSM.FracturedStaticMeshComponent.SetLightEnvironment(FSM.FracturedStaticMeshComponent.LightEnvironment);
    }
    LPCS = LPCoreShield(Other);
    // End:0x5AC
    if((LPCS != none) && !LPCS.IsPendingKill())
    {
        LPCS.StaticMeshComponent.SetShadowParent(none);
        LPCS.StaticMeshComponent.SetLightingChannels(LPCS.StaticMeshComponent.LightingChannels);
        LPCS.StaticMeshComponent.SetLightEnvironment(LPCS.StaticMeshComponent.LightEnvironment);
        AttachIdx = 0;
        J0x362:

        // End:0x5AC [Loop If]
        if(AttachIdx < LPCS.Attached.Length)
        {
            FSM = FracturedStaticMeshActor(LPCS.Attached[AttachIdx]);
            // End:0x59E
            if((FSM != none) && !FSM.IsPendingKill())
            {
                // End:0x49B
                if((FSM.KynapseObstacleComponent != none) && !FSM.KynapseObstacleComponent.bAttached)
                {
                    FSM.AttachComponent(FSM.KynapseObstacleComponent);
                }
                FSM.FracturedStaticMeshComponent.SetShadowParent(none);
                FSM.FracturedStaticMeshComponent.SetLightingChannels(FSM.FracturedStaticMeshComponent.LightingChannels);
                FSM.FracturedStaticMeshComponent.SetLightEnvironment(FSM.FracturedStaticMeshComponent.LightEnvironment);
            }
            AttachIdx++;
            // [Loop Continue]
            goto J0x362;
        }
    }
    LPCS_Skeletal = LPCoreShieldSkeletal(Other);
    // End:0x955
    if((LPCS_Skeletal != none) && !LPCS_Skeletal.IsPendingKill())
    {
        LPCS_Skeletal.SkeletalMeshComponent.SetShadowParent(none);
        LPCS_Skeletal.SkeletalMeshComponent.SetLightingChannels(LPCS.StaticMeshComponent.LightingChannels);
        LPCS_Skeletal.SkeletalMeshComponent.SetLightEnvironment(LPCS.StaticMeshComponent.LightEnvironment);
        AttachIdx = 0;
        J0x70B:

        // End:0x955 [Loop If]
        if(AttachIdx < LPCS_Skeletal.Attached.Length)
        {
            FSM = FracturedStaticMeshActor(LPCS.Attached[AttachIdx]);
            // End:0x947
            if((FSM != none) && !FSM.IsPendingKill())
            {
                // End:0x844
                if((FSM.KynapseObstacleComponent != none) && !FSM.KynapseObstacleComponent.bAttached)
                {
                    FSM.AttachComponent(FSM.KynapseObstacleComponent);
                }
                FSM.FracturedStaticMeshComponent.SetShadowParent(none);
                FSM.FracturedStaticMeshComponent.SetLightingChannels(FSM.FracturedStaticMeshComponent.LightingChannels);
                FSM.FracturedStaticMeshComponent.SetLightEnvironment(FSM.FracturedStaticMeshComponent.LightEnvironment);
            }
            AttachIdx++;
            // [Loop Continue]
            goto J0x70B;
        }
    }
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    RemoveAllGrenades();
    TurnOffAkridProceduralMovementAudioComponent();
    //return;    
}

simulated function FindPhysMat_FromCoreID()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL OutTagCoreId[26214401];
    local /*0x97E50000-0x00000000*/ private class InFindTagClass[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL OutTagOfClass[26214401], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL Body, PhysMat;

    Idx = 0;
    J0x0E:

    // End:0x1D5 [Loop If]
    if(Idx < Mesh.PhysicsAssetInstance.Bodies.Length)
    {
        Body = Mesh.PhysicsAssetInstance.Bodies[Idx];
        // End:0x1C7
        if(Body != none)
        {
            PhysMat = LPPhysicalMaterial(Body.GetPhysicalMaterial());
            // End:0x1C7
            if(PhysMat != none)
            {
                OutTagCoreId = LPPhysMatPropTag_CoreId(PhysMat.GetTag(Class'LPPhysMatPropTag_CoreId'));
                // End:0x1C7
                if((OutTagCoreId != none) && OutTagCoreId.GetCoreId() == CoreID)
                {
                    // End:0x1BD
                    if(InFindTagClass != none)
                    {
                        OutTagOfClass = PhysMat.GetTag(InFindTagClass);
                        // End:0x1BA
                        if(OutTagOfClass != none)
                        {
                            return PhysMat;
                        }                        
                    }
                    else
                    {
                        return PhysMat;
                    }
                }
            }
        }
        Idx++;
        // [Loop Continue]
        goto J0x0E;
    }
    OutTagCoreId = none;
    OutTagOfClass = none;
    return none;
    //return ReturnValue;    
}

simulated function FindPhysMatPropTag_CoreIdFromCoreID()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], TagCoreId;

    FindPhysMat_FromCoreID(CoreID, TagCoreId);
    return TagCoreId;
    //return ReturnValue;    
}

simulated function FindPhysMatPropTag_GrenadeGlueFromCoreID()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], matchTag, tagGlue;

    // End:0x48
    if((FindPhysMat_FromCoreID(CoreID,, Class'LPPhysMatPropTag_GrenadeGlue', matchTag)) != none)
    {
        tagGlue = LPPhysMatPropTag_GrenadeGlue(matchTag);
    }
    return tagGlue;
    //return ReturnValue;    
}

simulated function TakeRadiusDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609];
    local /*0x97E50000-0x00000000*/ private float BaseDamage[8388609], DamageRadius;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private float Momentum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HurtOrigin[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFullDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x97E50000-0x00000000*/ private float DamageFalloffExponent[9437185];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private float DamageScale, Dist, ScaledDamage;
    local /*0x97E50000-0x00000000*/ private @NULL Dir, CoreLocation;
    local /*0x97E50000-0x00000000*/ private name CoreBoneName;
    local /*0x97E50000-0x00000000*/ private @NULL PhysMat, HitInfo, PawnLeftEdge, GrenadeRightEdge;
    local /*0x97E50000-0x00000000*/ private float OverlapDistance, SmallerDiameter;

    1.0000000
    I = 0;
    J0x14:

    // End:0x244 [Loop If]
    if(I < MyCoreData.Length)
    {
        CoreBoneName = FindBoneNameFromCoreID(MyCoreData[I].CoreID, PhysMat);
        CoreLocation = Mesh.GetBoneLocation(CoreBoneName);
        Dir = CoreLocation - HurtOrigin;
        Dist = VSize(Dir);
        Dir = Normal(Dir);
        // End:0x109
        if(bFullDamage)
        {
            DamageScale = 1.0000000;            
        }
        else
        {
            DamageScale = FClamp(1.0000000 - (Dist / DamageRadius), 0.0000000, 1.0000000);
            DamageScale = DamageScale ** DamageFalloffExponent;
        }
        // End:0x236
        if(DamageScale > 0.0000000)
        {
            HitInfo.PhysMaterial = PhysMat;
            HitInfo.BoneName = CoreBoneName;
            ScaledDamage = DamageScale * BaseDamage;
            TakeDamage(int(ScaledDamage), InstigatedBy, CoreLocation, (DamageScale * Momentum) * Dir, DamageType, HitInfo, DamageCauser);
        }
        I++;
        // [Loop Continue]
        goto J0x14;
    }
    Dir = Location - HurtOrigin;
    Dist = VSize(Dir);
    Dir = Normal(Dir);
    // End:0x2BC
    if(bFullDamage || IsZero(Dir))
    {
        DamageScale = 1.0000000;        
    }
    else
    {
        PawnLeftEdge = Location - (CylinderComponent.CollisionRadius * Dir);
        GrenadeRightEdge = HurtOrigin + (DamageRadius * Dir);
        OverlapDistance = (GrenadeRightEdge - PawnLeftEdge) Dot Dir;
        SmallerDiameter = ((DamageRadius < CylinderComponent.CollisionRadius) ? 2.0000000 * DamageRadius : 2.0000000 * CylinderComponent.CollisionRadius);
        DamageScale = FClamp(OverlapDistance / SmallerDiameter, 0.0000000, 1.0000000);
        DamageScale = DamageScale ** DamageFalloffExponent;
    }
    HitInfo.PhysMaterial = NonCorePhysMat;
    HitInfo.BoneName = 'None';
    ScaledDamage = DamageScale * BaseDamage;
    // End:0x4DF
    if(DamageScale > 0.0000000)
    {
        TakeDamage(int(ScaledDamage), InstigatedBy, Location, (DamageScale * Momentum) * Dir, DamageType, HitInfo, DamageCauser);
    }
    //return;    
}

function OnDamageApplied()
{
    local /*0x97E50000-0x00000000*/ private int actualDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    super(SPPawn).OnDamageApplied(actualDamage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    // End:0x14B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        // End:0xF8
        if(InstigatedBy != none)
        {
            LPPRI(PlayerReplicationInfo).ScoreHit(LPPRI(InstigatedBy.PlayerReplicationInfo), Health + actualDamage, actualDamage, DamageType);
        }
        // End:0x14B
        if(LPPlayerController(InstigatedBy) != none)
        {
            LPPlayerController(InstigatedBy).ModifyStat('Stat_DamageDealtToAkrid', actualDamage);
        }
    }
    //return;    
}

simulated function GetTakeDamageAmount()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x2F
    if(DamageReactionManagerAkrid != none)
    {
        return DamageReactionManagerAkrid.GetTakeDamageAmount();
    }
    return super(SPPawn).GetTakeDamageAmount();
    //return ReturnValue;    
}

simulated function GetDOTEffectSocketName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    // End:0x2F
    if(DamageReactionManagerAkrid != none)
    {
        return DamageReactionManagerAkrid.GetDOTEffectSocketName();
    }
    return super(SPPawn).GetDOTEffectSocketName();
    //return ReturnValue;    
}

simulated function @NULL NotifyOfGrenadeGettingStuckTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenGettingStuck[8388609], ComponentGrenOn, HitNormal, PhysMat;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL hitCoreTag;
    local /*0x97E50000-0x00000000*/ private int coreIdOn, CoreIndex;
    local /*0x97E50000-0x00000000*/ private @NULL AICtrl;

    // End:0x1DF
    if(super(LPPawn).NotifyOfGrenadeGettingStuckTo(GrenGettingStuck, ComponentGrenOn, HitNormal, PhysMat))
    {
        // End:0x1DD
        if(GrenGettingStuck != none)
        {
            // End:0x1DD
            if(PhysMat != none)
            {
                hitCoreTag = LPPhysMatPropTag_CoreId(PhysMat.GetTag(Class'LPPhysMatPropTag_CoreId'));
                coreIdOn = hitCoreTag.GetCoreId();
                AddGrenadeStuckToThisCore(coreIdOn, GrenGettingStuck);
                AICtrl = LPAIControllerAkrid(Controller);
                // End:0x1DD
                if(AICtrl != none)
                {
                    CoreIndex = GetCoreIndexForThisCoreId(coreIdOn);
                    TakeDamage_SetParams(1, GrenGettingStuck.InstigatorController, GrenGettingStuck.Location, GrenGettingStuck.Velocity, Class'LPDamageTypeGrenadeActual',,, GrenGettingStuck.InstigatorController, false, false);
                    AICtrl.NotifyOfCoreHit(CoreIndex, 0.0000000, Class'LPDamageTypeGrenadeActual');
                }
            }
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function AddGrenadeStuckToThisCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GrenGettingStuck[8388609];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL newStuckPair;

    iter = 0;
    J0x0B:

    // End:0x97 [Loop If]
    if(iter < GrenadesStuckToCores.Length)
    {
        // End:0x89
        if(GrenadesStuckToCores[iter].CoreID == CoreID)
        {
            GrenadesStuckToCores[iter].GrenadeStuck = GrenGettingStuck;
            return;
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    newStuckPair.CoreID = int(byte(CoreID));
    newStuckPair.GrenadeStuck = GrenGettingStuck;
    GrenadesStuckToCores.AddItem(newStuckPair);    
    //return;    
}

simulated function RemoveGrenadeStuckToThisCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x7C [Loop If]
    if(iter < GrenadesStuckToCores.Length)
    {
        // End:0x6E
        if(GrenadesStuckToCores[iter].CoreID == CoreID)
        {
            GrenadesStuckToCores.Remove(iter, 1);            
            return true;
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

simulated function RemoveAllGrenades()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x122 [Loop If]
    if(iter < GrenadesStuckToCores.Length)
    {
        // End:0xFF
        if(GrenadesStuckToCores[iter].GrenadeStuck != none)
        {
            GrenadesStuckToCores[iter].GrenadeStuck.SetBase(none);
            GrenadesStuckToCores[iter].GrenadeStuck.SetOwner(none);
            GrenadesStuckToCores[iter].GrenadeStuck.LifeSpan = 0.0001000;
        }
        GrenadesStuckToCores.Remove(iter, 1);        
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

simulated function DoesAkridHaveGrenadeStuckToThisCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x93 [Loop If]
    if(iter < GrenadesStuckToCores.Length)
    {
        // End:0x85
        if(GrenadesStuckToCores[iter].CoreID == CoreID)
        {
            // End:0x85
            if(GrenadesStuckToCores[iter].GrenadeStuck != none)
            {
                return true;
            }
        }
        iter++;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

simulated function IsThisCoreAStickGrenadeToCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreIdToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function PlayGrenadeInInternalGrenadeExplosionEffects()
{
    //return;    
}

simulated function HandleInternalGrenadeCoreExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenExploding[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreAttachedTo[8388609];

    //return;    
}

simulated function HandleInternalGrenadeCoreExplosionFromStoredData()
{
    HandleInternalGrenadeCoreExplosion(CurrentGrenExploding, CurrentCoreGrenadeExplodingAttachedTo);
    CurrentGrenExploding = none;
    CurrentCoreGrenadeExplodingAttachedTo = -1;
    //return;    
}

simulated function GetLocationForExplosionForGrenadeStuckToThisCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreIdToTest[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Location;
    //return ReturnValue;    
}

simulated function GetLocationAndRotationForExplosionForGrenadeStuckToThisCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreIdToTest[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL outExploLoc[25165825], outExploRot;

    outExploLoc = Location;
    outExploRot = Rotation;
    //return;    
}

simulated function AttachedGrenadeJustExploded()
{
    local /*0x97E50000-0x00000000*/ private int CoreAttachedTo[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GrenExploding, CoreLocation;

    GrenExploding = GetGrenadeAkridShouldHaveStuckToThisCore(CoreAttachedTo);
    SetTimer(TuneDataAIPawn.DelayAfterNotifyOfInternalExplosionBeforeFrontExplosionEffects, false, 'PlayGrenadeInInternalGrenadeExplosionEffects', self);
    ExplosionRadialBlur = new (self) Class'Engine.RadialBlurComponent' (TuneDataAIPawn.ExploRadialBlur);
    // End:0x103
    if(ExplosionRadialBlur != none)
    {
        AttachComponent(ExplosionRadialBlur);
        RadialBlurFadeTime = TuneDataAIPawn.ExploRadialBlurFadeOutTime;
        RadialBlurFadeTimeRemaining = RadialBlurFadeTime;
        RadialBlurMaxBlurAmount = TuneDataAIPawn.ExploRadialBlurMaxBlur;
    }
    J0x103:

    // End:0x232 [Loop If]
    if(GrenExploding != none)
    {
        CoreLocation = GetLocationForExplosionForGrenadeStuckToThisCore(CoreAttachedTo);
        ProcessInternalGrenadeExplosionForDamageOnThisCore(GrenExploding, CoreAttachedTo, CoreLocation);
        CurrentGrenExploding = GrenExploding;
        CurrentCoreGrenadeExplodingAttachedTo = CoreAttachedTo;
        SetTimer(TuneDataAIPawn.DelayAfterNotifyOfInternalExplosionBeforeBackExplosionEffects, false, 'HandleInternalGrenadeCoreExplosionFromStoredData', self);
        GrenExploding.LifeSpan = 0.0001000;
        RemoveGrenadeStuckToThisCore(CoreAttachedTo);
        GrenExploding.SetBase(none);
        GrenExploding.SetOwner(none);
        GrenExploding = GetGrenadeAkridShouldHaveStuckToThisCore(CoreAttachedTo);
        // [Loop Continue]
        goto J0x103;
    }
    //return;    
}

simulated function ProcessInternalGrenadeExplosionForDamageOnThisCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenExploding[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreAttachedTo[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CoreLocation[25296897];

    // End:0x1C9
    if(GrenExploding != none)
    {
        TakeRadiusDamage(((GrenExploding.Instigator != none) ? GrenExploding.Instigator.Controller : none), GrenExploding.ExplosionTemplate.Damage, GrenExploding.ExplosionTemplate.DamageRadius, GrenExploding.ExplosionTemplate.MyDamageType, GrenExploding.ExplosionTemplate.MomentumTransferScale, CoreLocation, false, ((GrenExploding.Owner != none) ? GrenExploding.Owner : GrenExploding), GrenExploding.ExplosionTemplate.DamageFalloffExponent);
    }
    //return;    
}

simulated function GetGrenadeAkridShouldHaveStuckToThisCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0xB8 [Loop If]
    if(iter < GrenadesStuckToCores.Length)
    {
        // End:0xAA
        if(GrenadesStuckToCores[iter].CoreID == CoreID)
        {
            // End:0xAA
            if(GrenadesStuckToCores[iter].GrenadeStuck != none)
            {
                return GrenadesStuckToCores[iter].GrenadeStuck;
            }
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    return none;
    //return ReturnValue;    
}

simulated function DoesAkridHaveThisGrenadeStuckToThisCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GrenToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x9B [Loop If]
    if(iter < GrenadesStuckToCores.Length)
    {
        // End:0x8D
        if(GrenadesStuckToCores[iter].CoreID == CoreID)
        {
            // End:0x8D
            if(GrenadesStuckToCores[iter].GrenadeStuck == GrenToTest)
            {
                return true;
            }
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

simulated function DoesAkridHaveThisGrenadeStuckToThisCoreIndex()
{
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GrenToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL grenWep, theBoom;
    local /*0x97E50000-0x00000000*/ private int coreIdTesting;

    coreIdTesting = GetCoreIdForThisCoreIndex(CoreIndex);
    // End:0xC7
    if(coreIdTesting > 0)
    {
        theBoom = LPExplosionActor(TakeDamageParams.DamageCauser);
        // End:0xC7
        if(theBoom != none)
        {
            grenWep = LPProj_Grenade(theBoom.TheWeaponThatSpawnedMe);
            // End:0xC7
            if(grenWep != none)
            {
                return DoesAkridHaveThisGrenadeStuckToThisCore(coreIdTesting, grenWep);
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function ReplicateTakeDamageEffects()
{
    super.ReplicateTakeDamageEffects();
    //return;    
}

simulated function PlayHitReactionAnimation()
{
    super.PlayHitReactionAnimation();
    // End:0x50
    if(((Controller != none) && DamageReactionManagerAkrid != none) && DamageReactionManagerAkrid.hitCoreTag != none)
    {
    }
    //return;    
}

simulated function CheckExitVSDangerousRange()
{
    local /*0x97E50000-0x00000000*/ private float inDistanceSq[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float dangerDistSq;

    dangerDistSq = TuneDataAkrid.ExitVSDangerDistance * TuneDataAkrid.ExitVSDangerDistance;
    return inDistanceSq < dangerDistSq;
    //return ReturnValue;    
}

simulated function AkridHandleWeaponFiring()
{
    HandleWeaponFiring();
    //return;    
}

simulated function GetAimTargetPositionForDirectFireStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return AimTargetPositionForDirectFireStrike;
    //return ReturnValue;    
}

function ClearAimTargetForDirectFireStrike()
{
    AimTargetActorForDirectFireStrike = none;
    //return;    
}

function GetAimTargetForDirectFireStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return AimTargetActorForDirectFireStrike;
    //return ReturnValue;    
}

simulated function SetAimInfoForBurstFireStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL AimPos[25296897], AimActor;
    local /*0x97E50000-0x00000000*/ private int TierId[9437185], ZoneId;
    local /*0x97E50000-0x00000000*/ private float AdditionPosZOffset[9437185];

    -1
    -1
    0.0000000
    AimTargetPositionForBurstFireStrike = AimPos;
    AimTargetActorForBurstFireStrike = AimActor;
    RangedLobStrikeTierForCurrentAttack = TierId;
    DirectFireStrikeZoneForCurrentAttack = ZoneId;
    AimTargetPositionForBurstFireStrike.Z += AdditionPosZOffset;
    //return;    
}

simulated function GetAimTargetPositionForBurstFireStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return AimTargetPositionForBurstFireStrike;
    //return ReturnValue;    
}

simulated function GetDirectFireStartRoationWithError()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentProjRot[25296897], ReturnValue, AimRot;
    local /*0x97E50000-0x00000000*/ private float horizontalSpread, verticalSpread;

    AimRot = CurrentProjRot;
    horizontalSpread = float(((FRand() < 0.5000000) ? HorizontalDirectFireSpread : -HorizontalDirectFireSpread));
    verticalSpread = float(((FRand() < 0.5000000) ? VerticalDirectFireSpread : -VerticalDirectFireSpread));
    AimRot.Yaw += int(horizontalSpread * FRand());
    AimRot.Pitch += int(verticalSpread * FRand());
    return AimRot;
    //return ReturnValue;    
}

simulated function GetLobProjectileFirePositionAndRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL out_ProjLoc[25165825], out_ProjDir, out_ProjRot;

    Instigator.Mesh.GetSocketWorldLocationAndRotation(TuneDataAkrid.LobFireProjectileFireFromSocketName, out_ProjLoc, out_ProjRot);
    out_ProjDir = Vector(out_ProjRot);
    //return;    
}

simulated function GetDirectFireProjectileFirePositionAndRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL out_ProjLoc[25165825], out_ProjDir, out_ProjRot;

    Instigator.Mesh.GetSocketWorldLocationAndRotation(TuneDataAkrid.DirectFireProjectileFireFromSocketName, out_ProjLoc, out_ProjRot);
    out_ProjDir = Vector(out_ProjRot);
    //return;    
}

simulated function GetBurstFireStartRoationWithError()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentProjRot[25296897], ReturnValue, AimRot;
    local /*0x97E50000-0x00000000*/ private float horizontalSpread, verticalSpread;

    AimRot = CurrentProjRot;
    horizontalSpread = float(((FRand() < 0.5000000) ? HorizontalBurstFireSpread : -HorizontalBurstFireSpread));
    verticalSpread = float(((FRand() < 0.5000000) ? VerticalBurstFireSpread : -VerticalBurstFireSpread));
    AimRot.Yaw += int(horizontalSpread * FRand());
    AimRot.Pitch += int(verticalSpread * FRand());
    return AimRot;
    //return ReturnValue;    
}

simulated function GetRangedBurstFireVelocity()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(TuneDataAkrid.BurstFireProjectileVelocityMin.GetValue(), TuneDataAkrid.BurstFireProjectileVelocityMax.GetValue());
    //return ReturnValue;    
}

simulated function GetBurstFireStartTraceLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], SocketRotation, SocketLocation;

    Instigator.Mesh.GetSocketWorldLocationAndRotation(TuneDataAkrid.BurstFireSocketName, SocketLocation, SocketRotation);
    return SocketLocation;
    //return ReturnValue;    
}

simulated event GetBurstFireBaseAimRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartLoc[8388609], ReturnValue, aimPositionForThisStrike, projDir, EnemyPawn;

    // End:0x105
    if(TuneDataAkrid.bUseTargetsCurrentLocAtLobRelease)
    {
        EnemyPawn = LPPawn(AimTargetActorForBurstFireStrike);
        // End:0x9E
        if((EnemyPawn != none) && EnemyPawn.IsInCover())
        {
            aimPositionForThisStrike = EnemyPawn.GetProjectileTargetPosition(self);            
        }
        else
        {
            aimPositionForThisStrike = AimTargetActorForBurstFireStrike.Location;
            aimPositionForThisStrike.Z += TuneDataAkrid.HeightOffTargetPointForBurstFire;
        }        
    }
    else
    {
        aimPositionForThisStrike = AimTargetPositionForBurstFireStrike;
    }
    projDir = aimPositionForThisStrike - StartLoc;
    projDir = Normal(projDir);
    return Rotator(projDir);
    //return ReturnValue;    
}

function GetDeadReckoningBurstFireBaseAimRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartLoc[8388609], ReturnValue, aimPositionForThisStrike, projDir;
    local /*0x97E50000-0x00000000*/ private float projectileSpeed;
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn;
    local /*0x97E50000-0x00000000*/ private float travelDist;
    local /*0x97E50000-0x00000000*/ private @NULL TargetVel;

    projectileSpeed = GetRangedBurstFireVelocity();
    aimPositionForThisStrike = AimTargetActorForBurstFireStrike.Location;
    EnemyPawn = LPPawn(AimTargetActorForBurstFireStrike);
    // End:0xB8
    if((EnemyPawn != none) && EnemyPawn.IsInCover())
    {
        aimPositionForThisStrike = EnemyPawn.GetProjectileTargetPosition(self);        
    }
    else
    {
        aimPositionForThisStrike.Z += TuneDataAkrid.HeightOffTargetPointForBurstFire;
    }
    // End:0x1B8
    if(VSize(AimTargetActorForBurstFireStrike.Velocity) > float(1))
    {
        travelDist = VSize2D(aimPositionForThisStrike - StartLoc);
        TargetVel = AimTargetActorForBurstFireStrike.Velocity;
        TargetVel.Z = 0.0000000;
        aimPositionForThisStrike += ((travelDist / projectileSpeed) * TargetVel);
    }
    projDir = aimPositionForThisStrike - StartLoc;
    projDir = Normal(projDir);
    return Rotator(projDir);
    //return ReturnValue;    
}

simulated event GetBurstFireAdjustedAim()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartLoc[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUseDeadReckoning[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], BaseAim, adjustedAim;

    false
    // End:0x32
    if(bUseDeadReckoning)
    {
        BaseAim = GetDeadReckoningBurstFireBaseAimRotation(StartLoc);        
    }
    else
    {
        BaseAim = GetBurstFireBaseAimRotation(StartLoc);
    }
    adjustedAim = GetBurstFireStartRoationWithError(BaseAim);
    return adjustedAim;
    //return ReturnValue;    
}

function FireOneBurstProjectile()
{
    local /*0x97E50000-0x00000000*/ private bool bUseDeadReckoning[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL projLoc, projDest, projDir, fireVel, projRot, SpawnedProjectile;

    false
    projLoc = GetBurstFireStartTraceLocation();
    projRot = GetBurstFireAdjustedAim(projLoc, bUseDeadReckoning);
    projDir = Vector(projRot);
    SpawnedProjectile = Spawn(BurstFireProjtileClass, self,, projLoc, projRot);
    // End:0x226
    if((SpawnedProjectile != none) && !SpawnedProjectile.bDeleteMe)
    {
        SpawnedProjectile.Init(projDir);
        fireVel = projDir * (GetRangedBurstFireVelocity());
        SpawnedProjectile.Velocity = fireVel;
        LobProjStartLocation = SpawnedProjectile.Location;
        projDest = LobProjStartLocation + (projDir * float(4000));
        // End:0x1DD
        if(Controller.Enemy != none)
        {
            projDest = Controller.Enemy.Location;
        }
        SpawnedProjectile.LifeSpan = (VSize(projDest - projLoc) / VSize(fireVel)) * 2.0000000;
    }
    //return;    
}

simulated function NotifyStartOfRangedBurstFire()
{
    // End:0x19
    if(!bPerformingBurstFire)
    {
        StartOfRangedBurstFire();
    }
    //return;    
}

function ShouldUseDeadReckoningForBurstFire()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function StartOfRangedBurstFire()
{
    local /*0x97E50000-0x00000000*/ private int Variance;

    FireOneBurstProjectile(ShouldUseDeadReckoningForBurstFire());
    TuneDataPawnFXEventBindings.PlayEventFX('MouthFlashAcidSpit', self, Mesh, none);
    bPerformingBurstFire = true;
    NumOfPelletSpitSoFarThisBurst = 1;
    NumProjectilesForCurrentBurst = byte(TuneDataAkrid.NumProjectilesPerBurst.GetValue());
    // End:0x16F
    if(TuneDataAkrid.NumProjectilesPerBurstVariance.GetValue() != float(0))
    {
        Variance = Round(RandRange(0.0000000, TuneDataAkrid.NumProjectilesPerBurstVariance.GetValue()));
        // End:0x159
        if(RandRange(0.0000000, 1.0000000) < 0.5000000)
        {
            Variance *= float(-1);
        }
        NumProjectilesForCurrentBurst += byte(Variance);
    }
    SetTimer(TuneDataAkrid.BurstFireFiringRate.GetValue(), true, 'BurstFireProjectilesUpdate', self);
    //return;    
}

simulated function StopRangedBurstFire()
{
    ClearTimer('BurstFireProjectilesUpdate', self);
    bPerformingBurstFire = false;
    //return;    
}

final simulated function BurstFireProjectilesUpdate()
{
    // End:0x3B
    if(NumOfPelletSpitSoFarThisBurst < int(NumProjectilesForCurrentBurst))
    {
        FireOneBurstProjectile(ShouldUseDeadReckoningForBurstFire());
        ++NumOfPelletSpitSoFarThisBurst;        
    }
    else
    {
        StopRangedBurstFire();
    }
    //return;    
}

simulated function ProjectileValid()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewProjectile[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFireSolotionPossible[8388609], ReturnValue;

    return true;
    //return ReturnValue;    
}

simulated function GetProjectileForThisLob()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return LobFireProjtileClass;
    //return ReturnValue;    
}

simulated function AdjustLobAimPositionForGameplay()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentAimLoc[25296897], ReturnValue, dirToFromTargetToAkrid2D, sideVec, forwardVec, offsetVec;

    local /*0x97E50000-0x00000000*/ private float randDraw, chanceToMiss;
    local /*0x97E50000-0x00000000*/ private @NULL TargetVelocity2D;
    local /*0x97E50000-0x00000000*/ private bool bMissToTheRight;

    // End:0x2AA
    if(bAbleToAdjustLobAimPositionForGameplay || bAbleToAdjustDirectFireAimPositionForGameplay)
    {
        randDraw = FRand();
        chanceToMiss = TuneDataAIPawn.IntentionalLobMissChance.GetValue();
        // End:0x93
        if(chanceToMiss >= 1.1000000)
        {
            chanceToMiss = chanceToMiss * 0.0100000;
        }
        // End:0x29E
        if(randDraw < chanceToMiss)
        {
            bIntentionalLobMiss = true;
            dirToFromTargetToAkrid2D = Location - CurrentAimLoc;
            dirToFromTargetToAkrid2D.Z = 0.0000000;
            dirToFromTargetToAkrid2D = Normal(dirToFromTargetToAkrid2D);
            forwardVec = dirToFromTargetToAkrid2D * (GetIntentionalLobMissFrontOffsetDistanceForCurrentLob());
            sideVec = Class'SPEngine.SPUtil'.static.GetRightVectorFromVector(dirToFromTargetToAkrid2D);
            TargetVelocity2D = AimTargetActorForRangedLobStrike.Velocity;
            TargetVelocity2D.Z = 0.0000000;
            // End:0x1CC
            if(IsZero(TargetVelocity2D))
            {
                bMissToTheRight = FRand() >= 0.5000000;                
            }
            else
            {
                bMissToTheRight = (sideVec Dot TargetVelocity2D) < float(0);
            }
            // End:0x21F
            if(bMissToTheRight)
            {
                sideVec = sideVec * (GetIntentionalLobMissSideOffsetDistanceForCurrentLob());                
            }
            else
            {
                sideVec = sideVec * -GetIntentionalLobMissSideOffsetDistanceForCurrentLob();
            }
            offsetVec = forwardVec + sideVec;
            offsetVec.Z += (GetIntentionalLobMissHeightOffsetDistanceForCurrentLob());
            return CurrentAimLoc + offsetVec;            
        }
        else
        {
            bIntentionalLobMiss = false;
        }
    }
    return CurrentAimLoc;
    //return ReturnValue;    
}

simulated function StartOfRangedLobFire()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL projLoc, projDir, projRot;
    local /*0x97E50000-0x00000000*/ private class projClass;
    local /*0x97E50000-0x00000000*/ private @NULL SpawnedProjectile, aimPositionForThisLobStrike, fireVel;
    local /*0x97E50000-0x00000000*/ private bool bFireSolutionPossible;
    local /*0x97E50000-0x00000000*/ private float OverrideGravityZ;

    bFireSolutionPossible = false;
    // End:0x47C
    if(int(WorldInfo.NetMode) != int(NM_Client))
    {
        GetLobProjectileFirePositionAndRotation(projLoc, projDir, projRot);
        projClass = GetProjectileForThisLob();
        // End:0xD2
        if(projClass.default.Proj_AkridBaseTuneData != none)
        {
            OverrideGravityZ = projClass.default.Proj_AkridBaseTuneData.AkridBaseProjGravityScale;            
        }
        else
        {
            OverrideGravityZ = 1.0000000;
        }
        OverrideGravityZ = OverrideGravityZ * WorldInfo.WorldGravityZ;
        // End:0x1C1
        if(TuneDataAkrid.bUseTargetsCurrentLocAtLobRelease && AimTargetActorForRangedLobStrike != none)
        {
            aimPositionForThisLobStrike = AimTargetActorForRangedLobStrike.Location;
            // End:0x1BE
            if(OverrideGravityZ != 0.0000000)
            {
                aimPositionForThisLobStrike.Z += TuneDataAkrid.HieghtOffTargetPointForEndOfLobFireArc;
            }            
        }
        else
        {
            aimPositionForThisLobStrike = AimTargetPositionForRangedLobStrike;
        }
        aimPositionForThisLobStrike = AdjustLobAimPositionForGameplay(aimPositionForThisLobStrike);
        projDir = aimPositionForThisLobStrike - projLoc;
        projDir = Normal(projDir);
        // End:0x25E
        if(TuneDataAkrid.bShowLobFireAttackDebug)
        {
            LogAlgosSegmentValiditys.Length = 0;
            LogAlgosSegmentEnds.Length = 0;
        }
        bFireSolutionPossible = FindTossVelocity(fireVel, aimPositionForThisLobStrike, projLoc, GetRangedLobFireIdealSpeedForCurrentLob(), GetRangedLobFireMinSpeedForCurrentLob(), GetRangedLobFireMaxSpeedForCurrentLob(), 0.0000000, GetDesiredZPercentOfLobForCurrentLob(), GetShapeOfProjectileForLobCalcForCurrentLob(),, OverrideGravityZ, true, GetBestCurrentVelocityForThisTarget(AimTargetActorForRangedLobStrike), ((bIntentionalLobMiss) ? true : false), true, false, -1, OverrideGravityZ == 0.0000000);
        // End:0x47C
        if(bFireSolutionPossible || !bFireSolutionPossible && ShouldFireLobProjectileEvenWithNoValidFireSolution(aimPositionForThisLobStrike, LobFireLastLocOfBlockage, bIntentionalLobMiss))
        {
            SpawnedProjectile = Spawn(projClass, self,, projLoc, projRot);
            SpawnedProjectile.Init(projDir);
            // End:0x443
            if(ProjectileValid(SpawnedProjectile, bFireSolutionPossible))
            {
                LobProjStartLocation = SpawnedProjectile.Location;
                SpawnedProjectile.Velocity = fireVel * TuneDataAkrid.FactorToIncreaseLongRageLobBy;                
            }
            else
            {
                SpawnedProjectile.KillSelf();
                SpawnedProjectile = none;
                bFireSolutionPossible = false;
            }            
        }
    }
    return bFireSolutionPossible;
    //return ReturnValue;    
}

simulated function ShouldFireLobProjectileEvenWithNoValidFireSolution()
{
    local /*0x97E50000-0x00000000*/ private @NULL AimPositionForLob[25296897], LobFireLocOfBlockage;
    local /*0x97E50000-0x00000000*/ private bool bIntentionallyMissing[8388609], ReturnValue;

    return true;
    //return ReturnValue;    
}

simulated event HandleAnimNotifyAkridRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609];

    //return;    
}

simulated event HandleAnimNotifyAkridHiveFree()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609], H;

    // End:0xA6
    if(SpecialMoveState.CurSMInfo.InteractionActor != none)
    {
        H = LPHiveSpawnPoint(SpecialMoveState.CurSMInfo.InteractionActor);
        // End:0xA6
        if(H != none)
        {
            H.AkridIsFree(self);
        }
    }
    //return;    
}

simulated function SpawnDeathGibs()
{
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedByPawn[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[25296897], playCtrl, vsWindowLoc;

    // End:0x301
    if(!bGibbed)
    {
        super(SPPawn).SpawnDeathGibs(InstigatedByPawn, TypeOfDamage, HitLocation);
        // End:0x5F
        if(int(WorldInfo.NetMode) == int(NM_DedicatedServer))
        {
            return;
        }
        // End:0x2FD
        foreach LocalPlayerControllers(Class'LPPlayerController', playCtrl)
        {
            // End:0x2FC
            if(playCtrl.MyBasePlayerPawn != none)
            {
                // End:0x220
                if((LPVSPlayerPawn(playCtrl.MyBasePlayerPawn) != none) && TuneDataAkrid.AkridTooCloseToVsOnDeathCameraEffect != none)
                {
                    playCtrl.MyBasePlayerPawn.Mesh.GetSocketWorldLocationAndRotation(TuneDataAkrid.SocketOnVsToUseForDistanceForDeathCameraEffects, vsWindowLoc);
                    // End:0x21D
                    if(VSize(playCtrl.MyBasePlayerPawn.Location - Location) < TuneDataAkrid.MaxRangeForEmitCameraEffect_AkridTooCloseToVsOnDeath.GetValue())
                    {
                        playCtrl.ClientSpawnCameraLensEffect(TuneDataAkrid.AkridTooCloseToVsOnDeathCameraEffect);
                    }
                    // End:0x2FC
                    continue;
                }
                // End:0x2FC
                if((TuneDataAkrid.AkridTooCloseOnDeathCameraEffect != none) && VSize(playCtrl.MyBasePlayerPawn.Location - Location) < TuneDataAkrid.MaxRangeForEmitCameraEffect_AkridTooCloseOnDeath.GetValue())
                {
                    playCtrl.ClientSpawnCameraLensEffect(TuneDataAkrid.AkridTooCloseOnDeathCameraEffect);
                }
            }            
        }                
    }
    //return;    
}

simulated function CheckOnAppearChatterForLocalPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0xCE
    if(Mesh.bRecentlyRendered)
    {
        // End:0x45
        foreach LocalPlayerControllers(Class'LPPlayerController', LPPC)
        {
            // End:0x45
            break;            
        }        
        // End:0xCE
        if(((LPPC != none) && LPPC.Pawn != none) && LPPC.Pawn.FastTrace(Location))
        {
            BroadcastOnAppearChatter(LPPC);
            return;
        }
    }
    SetTimer(0.5000000, false, 'CheckOnAppearChatterForLocalPlayer');
    //return;    
}

simulated function BroadcastOnAppearChatter()
{
    local /*0x97E50000-0x00000000*/ private @NULL ChatterPlayer[8388609];

    //return;    
}

defaultproperties
{
    AkridMovementSoundEventName="AkridNormalMovement"
    bAllowAkridAsEnemies=false
    bITakeOverGrenadeExplosionWhenAttachedToMe=true
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnAkrid.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnAkrid.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnAkrid.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0 class=Class'LPFXActionManager'
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnAkrid.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnAkrid.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnAkrid.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnAkrid.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnAkrid.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnAkrid.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnAkrid.FaceAudioComponent'
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
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnAkrid.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}