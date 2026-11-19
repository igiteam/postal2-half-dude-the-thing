class LPShieldFracture extends LPFracturedSMActorMovable
    abstract
    hidecategories(AnimDependency,Navigation);

struct native LPShieldFracture_AttachInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SocketName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int bAttachChanged;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ShieldId;

    structdefaultproperties
    {
        SocketName="None"
        bAttachChanged=0
        ShieldId="None"
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyAkridPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPShieldFracture_AttachInfoStruct AttachInfo[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int Visibility[2097153];

// Export ULPShieldFracture::execSetHealth(FFrame&, void* const)
native simulated function SetHealth()
{
    local /*0x97E50000-0x00000000*/ private float InFragmentHealthScale[8388609], InFragmentMinHealth, InFragmentMaxHealth;


}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    super(SPFracturedStaticMeshActor).ReplicatedEvent(VarName);
    switch(VarName)
    {
        // End:0x3F
        case 'AttachInfo':
            ReattachForClient();
            // End:0x5B
            break;
        // End:0x58
        case 'Visibility':
            InternalSetVisibility();
            // End:0x5B
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated event Explode()
{
    super(SPFracturedStaticMeshActor).Explode();
    //return;    
}

function AttachToPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyAkrid[8388609];
    local /*0x97E50000-0x00000000*/ private name AttachSocket[8388609], ShieldId;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x94
    if(InternalAttachToPawn(MyAkrid, AttachSocket, ShieldId))
    {
        AttachInfo.SocketName = AttachSocket;
        AttachInfo.bAttachChanged++;
        AttachInfo.ShieldId = ShieldId;
        return true;
    }
    return false;
    //return ReturnValue;    
}

protected simulated function ReattachForClient()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyAkrid;

    MyAkrid = LPAIPawnAkrid(Base);
    // End:0x41
    if(MyAkrid == none)
    {
        SetTimer(0.1000000, true, 'NeedToReattachTimer');        
    }
    else
    {
        InternalAttachToPawn(MyAkrid, AttachInfo.SocketName, AttachInfo.ShieldId);
    }
    //return;    
}

simulated function NeedToReattachTimer()
{
    // End:0x2D
    if(Base != none)
    {
        ReattachForClient();
        ClearTimer('NeedToReattachTimer');
    }
    //return;    
}

protected simulated function InternalAttachToPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyAkrid[8388609];
    local /*0x97E50000-0x00000000*/ private name AttachSocket[8388609], ShieldId;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x142
    if((MyAkrid != none) && MyAkrid.Mesh != none)
    {
        SetHardAttach(false);
        SetBase(none);
        SetCollisionType(1);
        SetLocation(MyAkrid.Location);
        SetRotation(MyAkrid.Rotation);
        SetCollisionType(3);
        SetHardAttach(true);
        SetBase(MyAkrid,, MyAkrid.Mesh, AttachSocket);
        // End:0x12D
        if(int(Role) < int(ROLE_Authority))
        {
            MyAkrid.NotifyShieldFractureAttached(self, AttachSocket, ShieldId);
        }
        MyAkridPawn = MyAkrid;
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function SetVisibility()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    Visibility = ((bVisible) ? 1 : 0);
    InternalSetVisibility();
    //return;    
}

protected simulated function InternalSetVisibility()
{
    // End:0x29
    if(Visibility != 0)
    {
        SetCollisionType(3);
        SetHidden(false);        
    }
    else
    {
        SetCollisionType(1);
        SetHidden(true);
    }
    //return;    
}

simulated event Attach()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];

    super(Actor).Attach(Other);
    //return;    
}

simulated event Detach()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];

    super(Actor).Detach(Other);
    //return;    
}

simulated event Destroyed()
{
    super(Actor).Destroyed();
    //return;    
}

simulated event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    // End:0xC1
    if(MyAkridPawn != none)
    {
        // End:0xC1
        if(MyAkridPawn.CanShieldFractureTakeDamage(self, DamageAmount, EventInstigator, DamageType, DamageCauser))
        {
            super(SPFracturedStaticMeshActor).TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
            MyAkridPawn.PostShieldFractureTakeDamage(self);
        }
    }
    //return;    
}

simulated function GetDamageForChunk()
{
    local /*0x97E50000-0x00000000*/ private int ChunkIndex[8388609], Damage;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return Damage;
    //return ReturnValue;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x52
    if(MyAkridPawn != none)
    {
        MyAkridPawn.Touch(Other, OtherComp, HitLocation, HitNormal);
    }
    //return;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    // End:0x49
    if(MyAkridPawn != none)
    {
        MyAkridPawn.Bump(Other, OtherComp, HitNormal);
    }
    //return;    
}

simulated function GetDamageInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL OutDamageInfo[25165825];
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private byte bWantPhysChunksAndParticles;
    local /*0x97E50000-0x00000000*/ private @NULL InstigatorPawn, NewHitLocation, HitNormal;

    OutDamageInfo.Base = none;
    OutDamageInfo.ChunkIdx = -1;
    OutDamageInfo.Damage = 0;
    OutDamageInfo.ShieldId = 'None';
    // End:0x4D1
    if(MyAkridPawn.CanShieldFractureTakeDamage(self, Damage, EventInstigator, DamageType, DamageCauser))
    {
        // End:0x11E
        if(((DamageType != none) && !DamageType.default.bCausesFracture) || !IsFracturedByDamageType(DamageType))
        {
            return false;
        }
        // End:0x1CE
        if(HitInfo.HitComponent == none)
        {
            // End:0x179
            if(Momentum == vect(0.0000000, 0.0000000, 0.0000000))
            {
                Momentum = Location - HitLocation;
            }
            TraceComponent(NewHitLocation, HitNormal, FracturedStaticMeshComponent, HitLocation + (float(100) * Normal(Momentum)), HitLocation,, HitInfo, true);
        }
        // End:0x294
        if(((HitInfo.Item == FracturedStaticMeshComponent.GetCoreFragmentIndex()) || !FracturedStaticMeshComponent.IsFragmentVisible(HitInfo.Item)) || !FracturedStaticMeshComponent.IsFragmentDestroyable(HitInfo.Item))
        {
            return false;
        }
        // End:0x2CE
        if(EventInstigator != none)
        {
            InstigatorPawn = EventInstigator.Pawn;            
        }
        else
        {
            // End:0x305
            if(DamageCauser != none)
            {
                InstigatorPawn = DamageCauser.Instigator;
            }
        }
        // End:0x329
        if(!FractureEffectIsRelevant(false, InstigatorPawn, bWantPhysChunksAndParticles))
        {
            return false;
        }
        // End:0x357
        if(ChunkHealth[HitInfo.Item] <= 0)
        {
            return false;
        }
        // End:0x38B
        if(IsFragmentHidden(HitInfo.Item, CurrentDestroyedFragments))
        {
            return false;
        }
        OutDamageInfo.Base = Base;
        OutDamageInfo.ChunkIdx = HitInfo.Item;
        OutDamageInfo.ShieldId = AttachInfo.ShieldId;
        OutDamageInfo.Momentum = Momentum;
        OutDamageInfo.bWantPhysChunksAndParticles = int(bWantPhysChunksAndParticles);
        OutDamageInfo.Damage = GetDamageForChunk(HitInfo.Item, Damage, DamageType, DamageCauser);
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ApplyDamageInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL DI[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array FragmentVis;
    local /*0x97E50000-0x00000000*/ private @NULL ChunkDir, MomentumDir, FracMesh, FracPart;
    local /*0x97E50000-0x00000000*/ private editfixedsize array NoCollParts;
    local /*0x97E50000-0x00000000*/ private int TotalVisible;
    local /*0x97E50000-0x00000000*/ private editfixedsize array IgnoreFrags;
    local /*0x97E50000-0x00000000*/ private @NULL ChunkBox, EffectPSys;
    local /*0x97E50000-0x00000000*/ private float PhysChance, PartScale;
    local /*0x97E50000-0x00000000*/ private @NULL FractureSettings;

    // End:0x2E
    if(ChunkHealth[DI.ChunkIdx] <= 0)
    {
        return;
    }
    // End:0x62
    if(IsFragmentHidden(DI.ChunkIdx, CurrentDestroyedFragments))
    {
        return;
    }
    ChunkHealth[DI.ChunkIdx] -= DI.Damage;
    // End:0x8FF
    if(ChunkHealth[DI.ChunkIdx] <= 0)
    {
        FracMesh = FracturedStaticMesh(FracturedStaticMeshComponent.StaticMesh);
        FractureSettings = WorldInfo.GetWorldFractureSettings();
        FragmentVis = FracturedStaticMeshComponent.GetVisibleFragments();
        TotalVisible = FracturedStaticMeshComponent.GetNumVisibleFragments();
        // End:0x1A3
        if(int(Physics) == int(10))
        {
            // End:0x1A3
            if(TotalVisible == 1)
            {
                return;
            }
        }
        // End:0x1C5
        if(TotalVisible == FragmentVis.Length)
        {
            SetLoseChunkReplacementMaterial();
        }
        FragmentVis[DI.ChunkIdx] = 0;
        ChunkDir = FracturedStaticMeshComponent.GetFragmentAverageExteriorNormal(DI.ChunkIdx);
        MomentumDir = Normal(DI.Momentum);
        // End:0x2A4
        if((VSize(ChunkDir) < 0.0100000) || (MomentumDir Dot ChunkDir) > -0.2000000)
        {
            ChunkDir += MomentumDir;
        }
        ChunkDir.Z = float(Max(int(ChunkDir.Z), 0));
        ChunkDir.Z /= FracMesh.ChunkLinHorizontalScale;
        ChunkDir = Normal(ChunkDir);
        // End:0x791
        if(int(WorldInfo.NetMode) != int(NM_DedicatedServer))
        {
            PhysChance = ((FractureSettings.bEnableChanceOfPhysicsChunkOverride) ? FractureSettings.ChanceOfPhysicsChunkOverride : FracMesh.ChanceOfPhysicsChunk);
            PhysChance *= WorldInfo.MyFractureManager.GetFSMDirectSpawnChanceScale();
            // End:0x5E6
            if((((DI.bWantPhysChunksAndParticles == 1) && FracMesh.bSpawnPhysicsChunks) && FRand() < PhysChance) && !FracturedStaticMeshComponent.IsNoPhysFragment(DI.ChunkIdx))
            {
                PartScale = FracMesh.NormalPhysicsChunkScaleMin + (FRand() * (FracMesh.NormalPhysicsChunkScaleMax - FracMesh.NormalPhysicsChunkScaleMin));
                FracPart = SpawnPart(DI.ChunkIdx, (ChunkDir * FracMesh.ChunkLinVel) + Velocity, VRand() * FracMesh.ChunkAngVel, PartScale, false);
                // End:0x5E6
                if(FracPart != none)
                {
                    FracPart.FracturedStaticMeshComponent.DisableRBCollisionWithSMC(FracturedStaticMeshComponent, true);
                }
            }
            // End:0x791
            if(DI.bWantPhysChunksAndParticles == 1)
            {
                // End:0x63B
                if(OverrideFragmentDestroyEffects.Length > 0)
                {
                    EffectPSys = OverrideFragmentDestroyEffects[Rand(OverrideFragmentDestroyEffects.Length)];                    
                }
                else
                {
                    // End:0x6AA
                    if(FracMesh.FragmentDestroyEffects.Length > 0)
                    {
                        EffectPSys = FracMesh.FragmentDestroyEffects[Rand(FracMesh.FragmentDestroyEffects.Length)];
                    }
                }
                // End:0x791
                if((EffectPSys != none) && WorldInfo.MyFractureManager != none)
                {
                    ChunkBox = FracturedStaticMeshComponent.GetFragmentBox(DI.ChunkIdx);
                    WorldInfo.MyFractureManager.SpawnChunkDestroyEffect(EffectPSys, ChunkBox, ChunkDir, FracMesh.FragmentDestroyEffectScale);
                }
            }
        }
        // End:0x8A4
        if((FracMesh.bAlwaysBreakOffIsolatedIslands || FracturedStaticMeshComponent.GetCoreFragmentIndex() == -1) && !FracMesh.bFixIsolatedChunks)
        {
            IgnoreFrags[0] = DI.ChunkIdx;
            // End:0x850
            if(FracPart != none)
            {
                NoCollParts[0] = FracPart;
            }
            BreakOffIsolatedIslands(FragmentVis, IgnoreFrags, ChunkDir, NoCollParts, ((DI.bWantPhysChunksAndParticles == 1) ? true : false));
        }
        FracturedStaticMeshComponent.SetVisibleFragments(FragmentVis);
        // End:0x8FF
        if(int(Physics) == int(10))
        {
            FracturedStaticMeshComponent.RecreatePhysState();
        }
    }
    MyAkridPawn.PostShieldFractureTakeDamage(self);
    //return;    
}

defaultproperties
{
    Visibility=1
    bReplicateDestroyedFragmentInfo=true
    bDestroyAfterFullyCleanedUp=true
    // Reference: FracturedStaticMeshComponent'Default__LPShieldFracture.FracturedStaticMeshComponent0'
    begin object name=FracturedStaticMeshComponent0
    end object
    FracturedStaticMeshComponent=FracturedStaticMeshComponent0
    KynapseObstacleComponent=none
    // Reference: SPFracturedSkinnedMeshComponent'Default__LPShieldFracture.SPFracturedSkinnedComponent0'
    begin object name=SPFracturedSkinnedComponent0
    end object
    SkinnedComponent=SPFracturedSkinnedComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPShieldFracture.LightEnvironment0'
    begin object name=LightEnvironment0
    end object
    Components[0]=LightEnvironment0
    Components[1]=FracturedStaticMeshComponent0
    Components[2]=SPFracturedSkinnedComponent0
    bShadowParented=false
    CollisionComponent=FracturedStaticMeshComponent0
}