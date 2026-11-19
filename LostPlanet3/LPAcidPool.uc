class LPAcidPool extends DecalActorBase
    abstract
    hidecategories(AnimDependency,Navigation);

struct native AcidPoolVictim
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorToDamage;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float accumulatedDamage;

    structdefaultproperties
    {
        ActorToDamage=none
        accumulatedDamage=0.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Victim[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL EditorSprite[537526273];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL CylinderComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataSpitter;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataGLauncher;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeSpawned;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL PSComponent[524289];

// Export ULPAcidPool::execGetVictimIndex(FFrame&, void* const)
native function GetVictimIndex()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPAcidPool::execPostInit(FFrame&, void* const)
native function PostInit();

// Export ULPAcidPool::execPostDestroy(FFrame&, void* const)
native function PostDestroy();

// Export ULPAcidPool::execAliveCount(FFrame&, void* const)
native function AliveCount()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

event IsTouching()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL A;

    // End:0x33
    foreach TouchingActors(Class'Engine.Actor', A)
    {
        // End:0x32
        if(A == Other)
        {            
            return true;
        }        
    }    
    return false;
    //return ReturnValue;    
}

function CanDamageActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x32
    if(ClassIsChildOf(Other.Class, Class'LPBaseVSPlayerPawn'))
    {
        return false;        
    }
    else
    {
        // End:0x61
        if(ClassIsChildOf(Other.Class, Class'LPAIPawnAkrid'))
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

function AddVictim()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609], NewVictim;

    // End:0x6D
    if((CanDamageActor(A)) && (GetVictimIndex(A)) < 0)
    {
        NewVictim.ActorToDamage = A;
        Victim.AddItem(NewVictim);        
    }
    //return;    
}

function RemoveVictim()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = GetVictimIndex(A);
    // End:0x45
    if(Idx > -1)
    {
        Victim.Remove(Idx, 1);        
    }
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    super(Actor).Touch(Other, OtherComp, HitLocation, HitNormal);
    // End:0x73
    if((LPAcidPool(Other) == none) && LPAIPawnSpitter(Other) == none)
    {
        AddVictim(Other);
    }
    //return;    
}

event UnTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];

    super(Actor).UnTouch(Other);
    RemoveVictim(Other);
    //return;    
}

event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(Actor).Tick(DeltaTime);
    DamageTouchingActor(DeltaTime);
    //return;    
}

function IsOtherAcidPoolDamagingVictim()
{
    local /*0x97E50000-0x00000000*/ private @NULL PotentailVictim[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL A;

    // End:0x6C
    foreach PotentailVictim.TouchingActors(Class'LPAcidPool', A)
    {
        // End:0x6B
        if(A != self)
        {
            // End:0x6B
            if(A.TimeSpawned < TimeSpawned)
            {                
                return true;
            }
        }        
    }    
    return false;
    //return ReturnValue;    
}

function DamageTouchingActor()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private float DamageAmount, DamageToAccumulate, KeepTime;

    DamageAmount = GetDamageAmount();
    // End:0x28F
    if(DamageAmount > float(0))
    {
        DamageAmount *= DeltaTime;
        DamageToAccumulate = GetDamageToAccumulate();
        KeepTime = 1.0000000 / DamageAmount;
        // End:0x87
        if(KeepTime < float(1))
        {
            KeepTime = 1.0000000;
        }
        I = 0;
        J0x92:

        // End:0x28F [Loop If]
        if(I < Victim.Length)
        {
            // End:0x281
            if(!IsOtherAcidPoolDamagingVictim(Victim[I].ActorToDamage))
            {
                // End:0x210
                if(DamageToAccumulate > float(0))
                {
                    Victim[I].accumulatedDamage += DamageAmount;
                    // End:0x20D
                    if(Victim[I].accumulatedDamage >= DamageToAccumulate)
                    {
                        Victim[I].ActorToDamage.TakeDamage(int(DamageToAccumulate), Instigator.Controller, Location, vect(0.0000000, 0.0000000, 0.0000000), GetDamageType(),, self);
                        Victim[I].accumulatedDamage -= DamageToAccumulate;
                    }                    
                }
                else
                {
                    Victim[I].ActorToDamage.SPTakeDamageFractional(DamageAmount, none, Location, vect(0.0000000, 0.0000000, 0.0000000), GetDamageType(),,, KeepTime);
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x92;
        }
    }
    //return;    
}

static simulated function CreateInstance()
{
    local /*0x97E50000-0x00000000*/ private @NULL InOwner[8388609], Impact, ReturnValue, AcidPool, PrevAcidPool, InSpitterPawn;

    local /*0x97E50000-0x00000000*/ private float SearchRadius, MinSeperation, Seperation;
    local /*0x97E50000-0x00000000*/ private @NULL Rot;
    local /*0x97E50000-0x00000000*/ private float Radius, Height;
    local /*0x97E50000-0x00000000*/ private @NULL pos;

    InSpitterPawn = LPAIPawnSpitter(InOwner);
    Radius = ((InSpitterPawn != none) ? InSpitterPawn.TuneDataSpitter.AcidPoolSize.GetValue() : 0.0000000);
    Height = GetDefaultHeight();
    pos = Impact.HitLocation;
    MinSeperation = ((InSpitterPawn != none) ? InSpitterPawn.TuneDataSpitter.AcidPoolMinSpaceSeperation.GetValue() : 0.0000000);
    // End:0x148
    if(MinSeperation < float(0))
    {
        MinSeperation = 0.0000000;
    }
    SearchRadius = Radius + MinSeperation;
    // End:0x21A
    foreach InOwner.CollidingActors(Class'LPAcidPool', PrevAcidPool, SearchRadius, pos, true)
    {
        // End:0x219
        if(PrevAcidPool != none)
        {
            Seperation = VSize2D(PrevAcidPool.Location - pos) - Radius;
            // End:0x219
            if(Seperation < MinSeperation)
            {                
                return none;
            }
        }        
    }    
    Rot = Rotator(-Impact.HitNormal);
    Rot.Roll = int(RandRange(0.0000000, 32767.0000000));
    pos += (Impact.HitNormal * Height);
    AcidPool = InOwner.Spawn(default.Class,,, pos, Rot,, true);
    AcidPool.SetHardAttach(true);
    AcidPool.SetBase(Impact.HitActor);
    AcidPool.TimeSpawned = InOwner.WorldInfo.TimeSeconds;
    AcidPool.Init(InOwner, Impact);
    return AcidPool;
    //return ReturnValue;    
}

static function GetDefaultHeight()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 20.0000000;
    //return ReturnValue;    
}

simulated function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL InOwner[8388609], Impact, InSpitterPawn, DecalMat, PS;

    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private float Radius, Height;
    local /*0x97E50000-0x00000000*/ private @NULL MITV_Decal;
    local /*0x97E50000-0x00000000*/ private editfixedsize array DecalMaterials, ParticleSystems;

    InSpitterPawn = LPAIPawnSpitter(InOwner);
    // End:0x53
    if(InSpitterPawn != none)
    {
        TuneDataSpitter = InSpitterPawn.TuneDataSpitter;
    }
    Radius = GetPoolSize();
    LifeSpan = GetLifeSpan();
    Height = GetDefaultHeight();
    CylinderComponent.SetCylinderSize(Radius, Height);
    Decal.Width = Radius * float(2);
    Decal.Height = Radius * float(2);
    DecalMaterials = GetDecalMaterials();
    // End:0x28B
    if(DecalMaterials.Length > 0)
    {
        Idx = Class'SPEngine.SPUtil'.static.RandRangeInt(0, DecalMaterials.Length - 1);
        DecalMat = DecalMaterials[Idx];
        // End:0x28B
        if(DecalMat != none)
        {
            // End:0x263
            if(ClassIsChildOf(DecalMat.Class, Class'Engine.MaterialInstanceTimeVarying'))
            {
                MITV_Decal = new (self) Class'Engine.MaterialInstanceTimeVarying';
                MITV_Decal.SetParent(DecalMat);
                Decal.SetDecalMaterial(MITV_Decal);
                MITV_Decal.SetDuration(LifeSpan);                
            }
            else
            {
                Decal.SetDecalMaterial(DecalMat);
            }
        }
    }
    ParticleSystems = GetParticleSystems();
    // End:0x34B
    if(ParticleSystems.Length > 0)
    {
        Idx = Class'SPEngine.SPUtil'.static.RandRangeInt(0, ParticleSystems.Length - 1);
        PS = ParticleSystems[Idx];
        // End:0x34B
        if(PS != none)
        {
            PSComponent = CreateParticleSystem(PS, Impact.HitLocation);
        }
    }
    DoCreationExplosion(InOwner, Location);
    PostInit();
    //return;    
}

simulated function DoCreationExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL InOwner[8388609], ExplosionLoc, explosionActor, ExplosionTemplate;

    ExplosionTemplate = GetExplosionTemplate();
    // End:0x1E3
    if(ExplosionTemplate != none)
    {
        explosionActor = Spawn(Class'LPExplosionActor',,, ExplosionLoc, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
        // End:0x1E3
        if(explosionActor != none)
        {
            explosionActor.TheWeaponThatSpawnedMe = InOwner;
            explosionActor.Instigator = InOwner;
            explosionActor.InstigatorController = InOwner.Controller;
            explosionActor.bDrawDebug = ShouldDebugDrawExplosion();
            explosionActor.ExplosionPhysMaterial = ((InOwner.Mesh.PhysMaterialOverride != none) ? SPPhysicalMaterial(InOwner.Mesh.PhysMaterialOverride) : none);
            explosionActor.Explode(ExplosionTemplate);
        }
    }
    //return;    
}

simulated function @NULL CreateParticleSystem()
{
    local /*0x97E50000-0x00000000*/ private @NULL PS[8388609], pos, ReturnValue, ThePool, PSComp;

    local /*0x97E50000-0x00000000*/ private int I;

    PSComp = none;
    // End:0x129
    if(PS != none)
    {
        ThePool = SPEmitterPool(WorldInfo.MyEmitterPool);
        PSComp = ThePool.SPSpawnEmitter(PS, pos,, self);
        // End:0xBA
        if(PSComp != none)
        {
            PSComp.ActivateSystem();
        }
        I = 0;
        J0xC5:

        // End:0x129 [Loop If]
        if(I < PSComp.EmitterInstances.Length)
        {
            PSComp.SetKillOnDeactivate(I, true);
            ++I;
            // [Loop Continue]
            goto J0xC5;
        }
    }
    return PSComp;
    //return ReturnValue;    
}

function KillSelf()
{
    PSComponent.DeactivateSystem();
    PSComponent = none;
    Destroy();
    bForceNetUpdate = true;
    //return;    
}

simulated event Destroyed()
{
    PSComponent.DeactivateSystem();
    super(Actor).Destroyed();
    PostDestroy();
    //return;    
}

simulated function GetDamageAmount()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x47
    if(TuneDataSpitter != none)
    {
        return TuneDataSpitter.AcidPoolDamagePerSecond.GetValue();        
    }
    else
    {
        // End:0x8B
        if(TuneDataGLauncher != none)
        {
            return TuneDataGLauncher.AcidPoolDamagePerSecond.GetValue();
        }
    }
    return 0.0000000;
    //return ReturnValue;    
}

simulated function GetDamageToAccumulate()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x2E
    if(TuneDataGLauncher != none)
    {
        return TuneDataGLauncher.AcidPoolDamagePerHit;
    }
    return 0.0000000;
    //return ReturnValue;    
}

simulated function GetDamageType()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x1C
    if(TuneDataSpitter != none)
    {
        return Class'LPDamageTypeSpitterAcid';        
    }
    else
    {
        // End:0x35
        if(TuneDataGLauncher != none)
        {
            return Class'LPDamageTypeGLauncherAcidPool';
        }
    }
    return Class'LPDamageType';
    //return ReturnValue;    
}

simulated function GetPoolSize()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x47
    if(TuneDataSpitter != none)
    {
        return TuneDataSpitter.AcidPoolSize.GetValue();        
    }
    else
    {
        // End:0x5C
        if(TuneDataGLauncher != none)
        {
            return 200.0000000;
        }
    }
    return 1.0000000;
    //return ReturnValue;    
}

simulated function GetLifeSpan()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x47
    if(TuneDataSpitter != none)
    {
        return TuneDataSpitter.AcidPoolLifeSpan.GetValue();        
    }
    else
    {
        // End:0x5C
        if(TuneDataGLauncher != none)
        {
            return 7.0000000;
        }
    }
    return 1.0000000;
    //return ReturnValue;    
}

simulated function GetDecalMaterials()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array ReturnValue[92274689], EmptyArray;

    // End:0x31
    if(TuneDataSpitter != none)
    {
        return TuneDataSpitter.AcidPoolDecalMaterial;        
    }
    else
    {
        // End:0x5F
        if(TuneDataGLauncher != none)
        {
            return TuneDataGLauncher.AcidPoolDecalMaterial;
        }
    }
    EmptyArray.Length = 0;
    return EmptyArray;
    //return ReturnValue;    
}

simulated function GetParticleSystems()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array ReturnValue[92274689], EmptyArray;

    // End:0x31
    if(TuneDataSpitter != none)
    {
        return TuneDataSpitter.AcidPoolParticleSystem;        
    }
    else
    {
        // End:0x5F
        if(TuneDataGLauncher != none)
        {
            return TuneDataGLauncher.AcidPoolParticleSystem;
        }
    }
    EmptyArray.Length = 0;
    return EmptyArray;
    //return ReturnValue;    
}

simulated function GetExplosionTemplate()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x31
    if(TuneDataSpitter != none)
    {
        return TuneDataSpitter.SpitterAcidPoolCreationExplosion;        
    }
    else
    {
        // End:0x5F
        if(TuneDataGLauncher != none)
        {
            return TuneDataGLauncher.AcidPoolCreationExplosion;
        }
    }
    return none;
    //return ReturnValue;    
}

simulated function ShouldDebugDrawExplosion()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x32
    if(TuneDataSpitter != none)
    {
        return TuneDataSpitter.bDebugSpitterAcidPoolCreationExplosion;        
    }
    else
    {
        // End:0x61
        if(TuneDataGLauncher != none)
        {
            return TuneDataGLauncher.bDebugAcidPoolCreationExplosion;
        }
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: CylinderComponent'Default__LPAcidPool.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'Engine.CylinderComponent'
    end object
    CylinderComponent=CollisionCylinder
    // Reference: DecalComponent'Default__LPAcidPool.NewDecalComponent'
    begin object name=NewDecalComponent
    end object
    Decal=NewDecalComponent
    Components[0]=NewDecalComponent
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Rotation=(Pitch=49152,Yaw=0,Roll=0)
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bStatic=false
    bMovable=true
    bCollideActors=true
    CollisionComponent=CollisionCylinder
}