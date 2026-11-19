class PhysXParticleSystem extends Object
    hidecategories(Object);

enum ESimulationMethod
{
    ESM_SPH,                        // 0
    ESM_NO_PARTICLE_INTERACTION,    // 1
    ESM_MIXED_MODE,                 // 2
    ESM_MAX                         // 3
};

enum EPacketSizeMultiplier
{
    EPSM_4,                         // 0
    EPSM_8,                         // 1
    EPSM_16,                        // 2
    EPSM_32,                        // 3
    EPSM_64,                        // 4
    EPSM_128,                       // 5
    EPSM_MAX                        // 6
};

var(*) /*0x0EE60000-0x00000000*/ private int MaxParticles[65537];
var(*) /*0x0EE60000-0x00000000*/ private int ParticleSpawnReserve[65537];
var(*) /*0x136C0000-0x00000000*/ private byte RBChannel[196609];
var(*) /*0x436A0000-0x00000000*/ private byte SimulationMethod[65537];
var(*) /*0x436A0000-0x00000000*/ private byte PacketSizeMultiplier[65537];
var(*) /*0x136C0000-0x00000000*/ private @NULL RBCollideWithChannels[196609];
var(*) /*0x136C0000-0x00000000*/ private float CollisionDistance[65537];
var(*) /*0x136C0000-0x00000000*/ private float RestitutionWithStaticShapes[65537];
var(*) /*0x136C0000-0x00000000*/ private float RestitutionWithDynamicShapes[65537];
var(*) /*0x136C0000-0x00000000*/ private float FrictionWithStaticShapes[65537];
var(*) /*0x136C0000-0x00000000*/ private float FrictionWithDynamicShapes[65537];
var(*) /*0x136C0000-0x00000000*/ private float StaticFrictionWithStaticShapes[65537];
var(*) /*0x136C0000-0x00000000*/ private float StaticFrictionWithDynamicShapes[65537];
var(*) /*0x136C0000-0x00000000*/ private bool bDynamicCollision[65537];
var(*) /*0x1EB20000-0x00000000*/ private bool bDisableGravity[65537];
var(*) /*0x436A0000-0x00000000*/ private bool bStaticCollision[65537];
var(*) /*0x436A0000-0x00000000*/ private bool bTwoWayCollision[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bDestroy[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bSyncFailed[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsInGame[536870913];
var(*) /*0x1EB20000-0x00000000*/ private float MaxMotionDistance[65537];
var(*) /*0x1EB20000-0x00000000*/ private float Damping[65537];
var(*) /*0x1EB20000-0x00000000*/ private @NULL ExternalAcceleration[65537];
var(*) /*0x436A0000-0x00000000*/ private float RestParticleDistance[65537];
var(*) /*0x436A0000-0x00000000*/ private float RestDensity[65537];
var(*) /*0x436A0000-0x00000000*/ private float KernelRadiusMultiplier[65537];
var(*) /*0x436A0000-0x00000000*/ private float Stiffness[65537];
var(*) /*0x436A0000-0x00000000*/ private float Viscosity[65537];
var(*) /*0x436A0000-0x00000000*/ private float CollisionResponseCoefficient[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CascadeScene[268435457];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PSys[268435457];

defaultproperties
{
    MaxParticles=32767
    RBChannel=ERBCollisionChannel.RBCC_EffectPhysics
    SimulationMethod=ESimulationMethod.ESM_NO_PARTICLE_INTERACTION
    PacketSizeMultiplier=EPacketSizeMultiplier.EPSM_16
    RBCollideWithChannels=(Default=true,Nothing=false,Pawn=false,Vehicle=false,Water=false,GameplayPhysics=true,EffectPhysics=false,Untitled1=false,Untitled2=false,Untitled3=false,Untitled4=false,Cloth=false,FluidDrain=true,SoftBody=false,FracturedMeshPart=false,BlockingVolume=false,DeadPawn=false,Clothing=false,ClothingCollision=false,PhatPawnSize1=false,PhatPawnSize2=false,PhatPawnSize3=false)
    CollisionDistance=10.0000000
    RestitutionWithStaticShapes=0.5000000
    RestitutionWithDynamicShapes=0.5000000
    FrictionWithStaticShapes=0.0500000
    FrictionWithDynamicShapes=0.5000000
    bDynamicCollision=true
    bStaticCollision=true
    MaxMotionDistance=64.0000000
    RestParticleDistance=64.0000000
    RestDensity=1000.0000000
    KernelRadiusMultiplier=2.0000000
    Stiffness=20.0000000
    Viscosity=6.0000000
    CollisionResponseCoefficient=0.2000000
}