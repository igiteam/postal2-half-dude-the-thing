class FracturedStaticMeshActor extends Actor
    placeable
    hidecategories(AnimDependency,Navigation)
    classgroup(StaticMeshes);

struct native DeferredPartToSpawn
{
    var(*) /*0x35EA0000-0x00000000*/ private int ChunkIndex;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL InitialVel;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL InitialAngVel;
    var(*) /*0x35EA0000-0x00000000*/ private float RelativeScale;
    var(*) /*0x35EA0000-0x00000000*/ private bool bExplosion;

    structdefaultproperties
    {
        ChunkIndex=0
        InitialVel=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        InitialAngVel=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        RelativeScale=0.0000000
        bExplosion=false
    }
};

struct CheckpointRecord
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsShutdown;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FragmentVis;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SavedGuid;
    var(*) /*0x35EA0000-0x00000000*/ private bool bReplicated;
    var(*) /*0x35EA0000-0x00000000*/ private bool bHidden;
    var(*) /*0x35EA0000-0x00000000*/ private byte CollisionType;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Location;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Rotation;
    var(*) /*0x35EA0000-0x00000000*/ private bool bNeedsPositionReplication;

    structdefaultproperties
    {
        bIsShutdown=false
        FragmentVis=none
        SavedGuid=(A=0,B=0,C=0,D=0)
        bReplicated=false
        bHidden=false
        CollisionType=ECollisionType.COLLIDE_CustomDefault
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Rotation=(Pitch=0,Yaw=0,Roll=0)
        bNeedsPositionReplication=false
    }
};

var(*) /*0x24790000-0x00000000*/ private int MaxPartsToSpawnAtOnce[65537];
var(*) /*0x24790000-0x00000400*/ private const export @NULL FracturedStaticMeshComponent[720897];
var(*) /*0x2D730000-0x00000400*/ private const export @NULL KynapseObstacleComponent[589825];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL SkinnedComponent[655361];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ChunkHealth;
var(*) /*0x35EA0000-0x00000000*/ private bool bHasShownMissingSoundWarning[536870913];
var(*) /*0x24790000-0x00000000*/ private bool bBreakChunksOnActorTouch[65537];
var(*) /*0x24790000-0x00000000*/ private bool bShouldSaveForCheckpoint[65537];
var(*) /*0x24790000-0x00000000*/ private editfixedsize array FracturedByDamageType[65537];
var(*) /*0x24790000-0x00000000*/ private float ChunkHealthScale[65537];
var(*) /*0x24790000-0x00000000*/ private editfixedsize array OverrideFragmentDestroyEffects[65537];
var(*) /*0x24790000-0x00000000*/ private float OverrideFragmentDestroyEffectScale[65537];
var(*) /*0x24790000-0x00000000*/ private float FractureCullMinDistance[65537];
var(*) /*0x24790000-0x00000000*/ private float FractureCullMaxDistance[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array DeferredPartsToSpawn[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PartImpactEffect;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ExplosionFractureSound;
var(*) /*0x35EA0000-0x00000000*/ private @NULL SingleChunkFractureSound;
var(*) /*0x35EA0000-0x00000000*/ private @NULL MI_LoseChunkPreviousMaterial[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MyGuid;
var(*) /*0x35EA0000-0x00000000*/ private int AccumulatedCoreDamage[536870913];

// Export UFracturedStaticMeshActor::execSpawnPart(FFrame&, void* const)
native final simulated function SpawnPart()
{
    local /*0x35EA0000-0x00000000*/ private int ChunkIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InitialVel[8388609], InitialAngVel;
    local /*0x35EA0000-0x00000000*/ private float RelativeScale[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bExplosion[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UFracturedStaticMeshActor::execSpawnPartMulti(FFrame&, void* const)
native final simulated function SpawnPartMulti()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ChunkIndices[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InitialVel[8388609], InitialAngVel;
    local /*0x35EA0000-0x00000000*/ private float RelativeScale[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bExplosion[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

simulated event PostBeginPlay()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PhysMat;

    super.PostBeginPlay();
    ResetHealth();
    // End:0x2E
    if(!bBreakChunksOnActorTouch)
    {
        SetTickIsDisabled(true);
    }
    PhysMat = FracturedStaticMeshComponent.GetFracturedMeshPhysMaterial();
    PartImpactEffect = PhysMat.FindPhysEffectInfo(0);
    PhysMat.FindFractureSounds(ExplosionFractureSound, SingleChunkFractureSound);
    ResetVisibility();
    //return;    
}

// Export UFracturedStaticMeshActor::execResetHealth(FFrame&, void* const)
native final simulated function ResetHealth();

function ShouldSaveForCheckpoint()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return bShouldSaveForCheckpoint;
    //return ReturnValue;    
}

function CreateCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Record[25165825];

    // End:0x45
    if((int(Physics) == int(0)) && bHidden)
    {
        Record.bIsShutdown = true;        
    }
    else
    {
        Record.FragmentVis = FracturedStaticMeshComponent.GetVisibleFragments();
    }
    Record.SavedGuid = MyGuid;
    Record.Location = Location;
    Record.Rotation = Rotation;
    Record.bHidden = bHidden;
    Record.CollisionType = ReplicatedCollisionType;
    Record.bNeedsPositionReplication = (int(RemoteRole) == int(ROLE_SimulatedProxy)) && bUpdateSimulatedPosition;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Record[25296897];

    // End:0x2D
    if(Record.bIsShutdown)
    {
        ShutDown();        
    }
    else
    {
        FracturedStaticMeshComponent.SetVisibleFragments(Record.FragmentVis);
    }
    SetLocation(Record.Location);
    SetRotation(Record.Rotation);
    // End:0x10B
    if(int(Record.CollisionType) != int(ReplicatedCollisionType))
    {
        SetCollisionType(Record.CollisionType);
        ForceNetRelevant();
    }
    // End:0x191
    if(Record.bHidden != bHidden)
    {
        SetHidden(Record.bHidden);
        SetForcedInitialReplicatedProperty(BoolProperty'Actor.bHidden', bHidden == default.bHidden);
        ForceNetRelevant();
    }
    // End:0x1D3
    if(Record.bNeedsPositionReplication)
    {
        bUpdateSimulatedPosition = true;
        bReplicateMovement = true;
        ForceNetRelevant();
    }
    //return;    
}

// Export UFracturedStaticMeshActor::execBreakOffIsolatedIslands(FFrame&, void* const)
native simulated event BreakOffIsolatedIslands()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array FragmentVis[25165825], IgnoreFrags;
    local /*0x35EA0000-0x00000000*/ private @NULL ChunkDir[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array DisableCollWithPart[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWantPhysChunks[8388609];


}

// Export UFracturedStaticMeshActor::execSpawnDeferredParts(FFrame&, void* const)
native simulated function SpawnDeferredParts()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated function IsFracturedByDamageType()
{
    local /*0x35EA0000-0x00000000*/ private class dmgType[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int I;

    // End:0x12
    if(FracturedByDamageType.Length == 0)
    {
        return true;
    }
    I = 0;
    J0x1D:

    // End:0x66 [Loop If]
    if(I < FracturedByDamageType.Length)
    {
        // End:0x58
        if(dmgType == FracturedByDamageType[I])
        {
            return true;
        }
        I++;
        // [Loop Continue]
        goto J0x1D;
    }
    return false;
    //return ReturnValue;    
}

simulated function FractureEffectIsRelevant()
{
    local /*0x35EA0000-0x00000000*/ private bool bForceDedicated[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL EffectInstigator[8388609];
    local /*0x35EA0000-0x00000000*/ private byte bWantPhysChunksAndParticles[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689], bResult;
    local /*0x35EA0000-0x00000000*/ private @NULL P;
    local /*0x35EA0000-0x00000000*/ private float FinalMinDistance, FinalCullDistance, DistSq;
    local /*0x35EA0000-0x00000000*/ private @NULL CameraLoc, CameraRot;

    bResult = true;
    bWantPhysChunksAndParticles = 1;
    // End:0x2C
    if(EffectInstigator == none)
    {
        return true;        
    }
    else
    {
        // End:0x60
        if(int(WorldInfo.NetMode) == int(NM_DedicatedServer))
        {
            return bForceDedicated;
        }
        // End:0x130
        if((int(WorldInfo.NetMode) == int(NM_ListenServer)) && WorldInfo.Game.NumPlayers > 1)
        {
            // End:0xD3
            if(bForceDedicated)
            {
                return true;
            }
            // End:0x12D
            if(((EffectInstigator != none) && EffectInstigator.IsHumanControlled()) && EffectInstigator.IsLocallyControlled())
            {
                return true;
            }            
        }
        else
        {
            // End:0x166
            if((EffectInstigator != none) && EffectInstigator.IsHumanControlled())
            {
                return true;
            }
        }
        FinalMinDistance = FractureCullMinDistance * WorldInfo.MyFractureManager.GetFSMFractureCullDistanceScale();
        FinalCullDistance = FractureCullMaxDistance * WorldInfo.MyFractureManager.GetFSMFractureCullDistanceScale();
        DistSq = 10000000000.0000000;
        // End:0x283
        foreach LocalPlayerControllers(Class'PlayerController', P)
        {
            P.GetPlayerViewPoint(CameraLoc, CameraRot);
            DistSq = FMin(DistSq, VSizeSq(Location - CameraLoc));            
        }        
        // End:0x2B5
        if(DistSq > (FinalCullDistance * FinalCullDistance))
        {
            bResult = false;            
        }
        else
        {
            // End:0x2D9
            if(DistSq < (FinalMinDistance * FinalMinDistance))
            {
                return true;
            }
        }
        // End:0x32F
        if(bResult)
        {
            // End:0x31E
            if((WorldInfo.TimeSeconds - LastRenderTime) < 0.5000000)
            {
                return true;                
            }
            else
            {
                bWantPhysChunksAndParticles = 0;
                return true;
            }            
        }
        else
        {
            bWantPhysChunksAndParticles = 0;
            return false;
        }
    }
    //return ReturnValue;    
}

// Export UFracturedStaticMeshActor::execRemoveDecals(FFrame&, void* const)
protected native final simulated function RemoveDecals()
{
    local /*0x35EA0000-0x00000000*/ private int IndexToRemoveDecalsFrom[8388609];


}

simulated function GetDestroyEffectScale()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x20
    if(OverrideFragmentDestroyEffectScale > 0.0000000)
    {
        return OverrideFragmentDestroyEffectScale;        
    }
    else
    {
        return FracturedStaticMesh(FracturedStaticMeshComponent.StaticMesh).FragmentDestroyEffectScale;
    }
    //return ReturnValue;    
}

simulated event TakeDamage()
{
    local /*0x35EA0000-0x00000000*/ private int Damage[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array FragmentVis;
    local /*0x35EA0000-0x00000000*/ private @NULL ChunkDir, MomentumDir, FracMesh, FracPart;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array NoCollParts;
    local /*0x35EA0000-0x00000000*/ private int TotalVisible;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array IgnoreFrags;
    local /*0x35EA0000-0x00000000*/ private @NULL ChunkBox, EffectPSys;
    local /*0x35EA0000-0x00000000*/ private float PhysChance, PartScale;
    local /*0x35EA0000-0x00000000*/ private byte bWantPhysChunksAndParticles;
    local /*0x35EA0000-0x00000000*/ private @NULL InstigatorPawn, FractureSettings, NewHitLocation, HitNormal;
    local /*0x35EA0000-0x00000000*/ private int ChunkDamage;

    super.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    // End:0x9C
    if(((DamageType != none) && !DamageType.default.bCausesFracture) || !IsFracturedByDamageType(DamageType))
    {
        return;
    }
    // End:0x14C
    if(HitInfo.HitComponent == none)
    {
        // End:0xF7
        if(Momentum == vect(0.0000000, 0.0000000, 0.0000000))
        {
            Momentum = Location - HitLocation;
        }
        TraceComponent(NewHitLocation, HitNormal, FracturedStaticMeshComponent, HitLocation + (float(100) * Normal(Momentum)), HitLocation,, HitInfo, true);
    }
    // End:0x1E4
    if((HitInfo.Item == FracturedStaticMeshComponent.GetCoreFragmentIndex()) || !FracturedStaticMeshComponent.IsFragmentDestroyable(HitInfo.Item))
    {
        AccumulatedCoreDamage += Damage;
        return;
    }
    // End:0x226
    if(!FracturedStaticMeshComponent.IsFragmentVisible(HitInfo.Item))
    {
        return;
    }
    // End:0x260
    if(EventInstigator != none)
    {
        InstigatorPawn = EventInstigator.Pawn;        
    }
    else
    {
        // End:0x297
        if(DamageCauser != none)
        {
            InstigatorPawn = DamageCauser.Instigator;
        }
    }
    // End:0x2BB
    if(!FractureEffectIsRelevant(false, InstigatorPawn, bWantPhysChunksAndParticles))
    {
        return;
    }
    ChunkDamage = GetDamageForChunk(HitInfo.Item, Damage, DamageType, DamageCauser);
    ChunkHealth[HitInfo.Item] -= ChunkDamage;
    // End:0xB3F
    if(ChunkHealth[HitInfo.Item] <= 0)
    {
        FracMesh = FracturedStaticMesh(FracturedStaticMeshComponent.StaticMesh);
        FractureSettings = WorldInfo.GetWorldFractureSettings();
        FragmentVis = FracturedStaticMeshComponent.GetVisibleFragments();
        TotalVisible = FracturedStaticMeshComponent.GetNumVisibleFragments();
        // End:0x434
        if(int(Physics) == int(10))
        {
            // End:0x434
            if(TotalVisible == 1)
            {
                return;
            }
        }
        // End:0x456
        if(TotalVisible == FragmentVis.Length)
        {
            SetLoseChunkReplacementMaterial();
        }
        FragmentVis[HitInfo.Item] = 0;
        ChunkDir = FracturedStaticMeshComponent.GetFragmentAverageExteriorNormal(HitInfo.Item);
        MomentumDir = Normal(Momentum);
        // End:0x522
        if((VSize(ChunkDir) < 0.0100000) || (MomentumDir Dot ChunkDir) > -0.2000000)
        {
            ChunkDir += MomentumDir;
        }
        ChunkDir.Z = float(Max(int(ChunkDir.Z), 0));
        ChunkDir.Z /= FracMesh.ChunkLinHorizontalScale;
        ChunkDir = Normal(ChunkDir);
        // End:0x9DF
        if(int(WorldInfo.NetMode) != int(NM_DedicatedServer))
        {
            PhysChance = ((FractureSettings.bEnableChanceOfPhysicsChunkOverride) ? FractureSettings.ChanceOfPhysicsChunkOverride : FracMesh.ChanceOfPhysicsChunk);
            PhysChance *= WorldInfo.MyFractureManager.GetFSMDirectSpawnChanceScale();
            // End:0x856
            if((((int(bWantPhysChunksAndParticles) == int(1)) && FracMesh.bSpawnPhysicsChunks) && FRand() < PhysChance) && !FracturedStaticMeshComponent.IsNoPhysFragment(HitInfo.Item))
            {
                PartScale = FracMesh.NormalPhysicsChunkScaleMin + (FRand() * (FracMesh.NormalPhysicsChunkScaleMax - FracMesh.NormalPhysicsChunkScaleMin));
                FracPart = SpawnPart(HitInfo.Item, (ChunkDir * FracMesh.ChunkLinVel) + Velocity, VRand() * FracMesh.ChunkAngVel, PartScale, false);
                // End:0x856
                if(FracPart != none)
                {
                    FracPart.FracturedStaticMeshComponent.DisableRBCollisionWithSMC(FracturedStaticMeshComponent, true);
                }
            }
            // End:0x9DF
            if(int(bWantPhysChunksAndParticles) == int(1))
            {
                // End:0x89D
                if(OverrideFragmentDestroyEffects.Length > 0)
                {
                    EffectPSys = OverrideFragmentDestroyEffects[Rand(OverrideFragmentDestroyEffects.Length)];                    
                }
                else
                {
                    // End:0x90C
                    if(FracMesh.FragmentDestroyEffects.Length > 0)
                    {
                        EffectPSys = FracMesh.FragmentDestroyEffects[Rand(FracMesh.FragmentDestroyEffects.Length)];
                    }
                }
                // End:0x9DF
                if((EffectPSys != none) && WorldInfo.MyFractureManager != none)
                {
                    ChunkBox = FracturedStaticMeshComponent.GetFragmentBox(HitInfo.Item);
                    WorldInfo.MyFractureManager.SpawnChunkDestroyEffect(EffectPSys, ChunkBox, ChunkDir, GetDestroyEffectScale());
                }
            }
        }
        // End:0xAE4
        if((FracMesh.bAlwaysBreakOffIsolatedIslands || FracturedStaticMeshComponent.GetCoreFragmentIndex() == -1) && !FracMesh.bFixIsolatedChunks)
        {
            IgnoreFrags[0] = HitInfo.Item;
            // End:0xA9E
            if(FracPart != none)
            {
                NoCollParts[0] = FracPart;
            }
            BreakOffIsolatedIslands(FragmentVis, IgnoreFrags, ChunkDir, NoCollParts, ((int(bWantPhysChunksAndParticles) == int(1)) ? true : false));
        }
        FracturedStaticMeshComponent.SetVisibleFragments(FragmentVis);
        // End:0xB3F
        if(int(Physics) == int(10))
        {
            FracturedStaticMeshComponent.RecreatePhysState();
        }
    }
    //return;    
}

simulated function GetDamageForChunk()
{
    local /*0x35EA0000-0x00000000*/ private int ChunkIndex[8388609], Damage;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689], ChunkDamage;

    // End:0x38
    if(RB_LineImpulseActor(DamageCauser) != none)
    {
        ChunkDamage = ChunkHealth[ChunkIndex];        
    }
    else
    {
        // End:0x94
        if(DamageType != none)
        {
            ChunkDamage = int(WorldInfo.FracturedMeshWeaponDamage * DamageType.default.FracturedMeshDamage);            
        }
        else
        {
            ChunkDamage = int(WorldInfo.FracturedMeshWeaponDamage);
        }
    }
    return ChunkDamage;
    //return ReturnValue;    
}

simulated event Explode()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array FragmentVis;
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private @NULL SpawnDir, FracMesh, FracPart;
    local /*0x35EA0000-0x00000000*/ private float PartScale;

    FracMesh = FracturedStaticMesh(FracturedStaticMeshComponent.StaticMesh);
    FragmentVis = FracturedStaticMeshComponent.GetVisibleFragments();
    I = 0;
    J0x65:

    // End:0x25D [Loop If]
    if(I < FragmentVis.Length)
    {
        // End:0x24F
        if((int(FragmentVis[I]) != int(0)) && I != FracturedStaticMeshComponent.GetCoreFragmentIndex())
        {
            SpawnDir = FracturedStaticMeshComponent.GetFragmentAverageExteriorNormal(I);
            PartScale = FracMesh.ExplosionPhysicsChunkScaleMin + (FRand() * (FracMesh.ExplosionPhysicsChunkScaleMax - FracMesh.ExplosionPhysicsChunkScaleMin));
            FracPart = SpawnPart(I, ((0.5000000 * SpawnDir) * FracMesh.ChunkLinVel) + Velocity, (0.5000000 * VRand()) * FracMesh.ChunkAngVel, PartScale, true);
            // End:0x239
            if(FracPart != none)
            {
                FracPart.FracturedStaticMeshComponent.SetRBCollidesWithChannel(14, false);
            }
            FragmentVis[I] = 0;
        }
        I++;
        // [Loop Continue]
        goto J0x65;
    }
    FracturedStaticMeshComponent.SetVisibleFragments(FragmentVis);
    //return;    
}

// Export UFracturedStaticMeshActor::execBreakOffPartsInRadius(FFrame&, void* const)
native simulated function BreakOffPartsInRadius()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Origin[8388609];
    local /*0x35EA0000-0x00000000*/ private float Radius[8388609], RBStrength;
    local /*0x35EA0000-0x00000000*/ private bool bWantPhysChunksAndParticles[8388609];


}

// Export UFracturedStaticMeshActor::execResetVisibility(FFrame&, void* const)
native simulated event ResetVisibility();

simulated event HideOneFragment()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array FragmentVis;
    local /*0x35EA0000-0x00000000*/ private int I;

    FragmentVis = FracturedStaticMeshComponent.GetVisibleFragments();
    I = 0;
    J0x34:

    // End:0xE7 [Loop If]
    if(I < FragmentVis.Length)
    {
        // End:0xD9
        if((int(FragmentVis[I]) != int(0)) && I != FracturedStaticMeshComponent.GetCoreFragmentIndex())
        {
            FragmentVis[I] = 0;
            FracturedStaticMeshComponent.SetVisibleFragments(FragmentVis);
            return;
        }
        I++;
        // [Loop Continue]
        goto J0x34;
    }
    //return;    
}

simulated event HideFragmentsToMaximizeMemoryUsage()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array FragmentVis;
    local /*0x35EA0000-0x00000000*/ private int I, Incr;

    Incr = 4;
    FragmentVis = FracturedStaticMeshComponent.GetVisibleFragments();
    I = 0;
    J0x40:

    // End:0xD2 [Loop If]
    if(I < FragmentVis.Length)
    {
        // End:0xBB
        if((int(FragmentVis[I]) != int(0)) && I != FracturedStaticMeshComponent.GetCoreFragmentIndex())
        {
            FragmentVis[I] = 0;
        }
        I += Incr;
        // [Loop Continue]
        goto J0x40;
    }
    FracturedStaticMeshComponent.SetVisibleFragments(FragmentVis);
    //return;    
}

simulated event SetLoseChunkReplacementMaterial()
{
    local /*0x35EA0000-0x00000000*/ private @NULL LoseChunkOutsideMat, FracMesh;

    // End:0x11
    if(MI_LoseChunkPreviousMaterial != none)
    {
        return;
    }
    FracMesh = FracturedStaticMesh(FracturedStaticMeshComponent.StaticMesh);
    // End:0x91
    if(FracturedStaticMeshComponent.LoseChunkOutsideMaterialOverride != none)
    {
        LoseChunkOutsideMat = FracturedStaticMeshComponent.LoseChunkOutsideMaterialOverride;        
    }
    else
    {
        LoseChunkOutsideMat = FracMesh.LoseChunkOutsideMaterial;
    }
    // End:0x16B
    if(LoseChunkOutsideMat != none)
    {
        MI_LoseChunkPreviousMaterial = FracturedStaticMeshComponent.GetMaterial(FracMesh.OutsideMaterialIndex).GetMaterial();
        FracturedStaticMeshComponent.SetMaterial(FracMesh.OutsideMaterialIndex, LoseChunkOutsideMat);
    }
    //return;    
}

simulated function NotifyHitByExplosion()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InstigatorController[8388609];
    local /*0x35EA0000-0x00000000*/ private float DamageAmount[8388609];
    local /*0x35EA0000-0x00000000*/ private class dmgType[8388609];
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private @NULL dmgEvent;

    Idx = 0;
    J0x0B:

    // End:0xA3 [Loop If]
    if(Idx < GeneratedEvents.Length)
    {
        dmgEvent = SeqEvent_TakeDamage(GeneratedEvents[Idx]);
        // End:0x95
        if(dmgEvent != none)
        {
            dmgEvent.HandleDamage(self, InstigatorController, dmgType, int(DamageAmount));
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

defaultproperties
{
    MaxPartsToSpawnAtOnce=6
    // Reference: FracturedStaticMeshComponent'Default__FracturedStaticMeshActor.FracturedStaticMeshComponent0'
    begin object name=FracturedStaticMeshComponent0 class=Class'FracturedStaticMeshComponent'
    end object
    FracturedStaticMeshComponent=FracturedStaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__FracturedStaticMeshActor.KynapseObstacle0'
    begin object name=KynapseObstacle0 class=Class'KynapseObstacleComponent'
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: FracturedSkinnedMeshComponent'Default__FracturedStaticMeshActor.FracturedSkinnedComponent0'
    begin object name=FracturedSkinnedComponent0 class=Class'FracturedSkinnedMeshComponent'
    end object
    SkinnedComponent=FracturedSkinnedComponent0
    ChunkHealthScale=1.0000000
    FractureCullMinDistance=512.0000000
    FractureCullMaxDistance=4096.0000000
    // Reference: DynamicLightEnvironmentComponent'Default__FracturedStaticMeshActor.LightEnvironment0'
    begin object name=LightEnvironment0 class=Class'DynamicLightEnvironmentComponent'
    end object
    Components[0]=LightEnvironment0
    Components[1]=FracturedSkinnedComponent0
    Components[2]=FracturedStaticMeshComponent0
    bNoDelete=true
    bWorldGeometry=true
    bRouteBeginPlayEvenIfStatic=false
    bGameRelevant=true
    bMovable=false
    bCanBeDamaged=true
    bCollideActors=true
    bBlockActors=true
    bProjTarget=true
    bEdShouldSnap=true
    bPathColliding=true
    CollisionComponent=FracturedStaticMeshComponent0
}