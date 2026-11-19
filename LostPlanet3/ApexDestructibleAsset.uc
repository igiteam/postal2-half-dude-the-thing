class ApexDestructibleAsset extends ApexAsset
    hidecategories(Object,Object);

enum EImpactDamageOverride
{
    IDO_None,                       // 0
    IDO_On,                         // 1
    IDO_Off,                        // 2
    IDO_MAX                         // 3
};

struct native NxDestructibleDepthParameters
{
    var(*) /*0x35EA0000-0x00000000*/ private transient bool TAKE_IMPACT_DAMAGE;
    var(*) /*0x35EA0000-0x00000000*/ private transient bool IGNORE_POSE_UPDATES;
    var(*) /*0x35EA0000-0x00000000*/ private transient bool IGNORE_RAYCAST_CALLBACKS;
    var(*) /*0x35EA0000-0x00000000*/ private transient bool IGNORE_CONTACT_CALLBACKS;
    var(*) /*0x35EA0000-0x00000000*/ private transient bool USER_FLAG;
    var(*) /*0x35EA0000-0x00000000*/ private transient bool USER_FLAG_1;
    var(*) /*0x35EA0000-0x00000000*/ private transient bool USER_FLAG_2;
    var(*) /*0x35EA0000-0x00000000*/ private transient bool USER_FLAG_3;
    var(*) /*0x36CC0000-0x00000000*/ private byte ImpactDamageOverride[65537];

    structdefaultproperties
    {
        ImpactDamageOverride=EImpactDamageOverride.IDO_None
    }
};

struct native NxDestructibleParametersFlag
{
    var(*) /*0x36CE0000-0x00000000*/ private bool ACCUMULATE_DAMAGE[65537];
    var(*) /*0x36CE0000-0x00000000*/ private bool ASSET_DEFINED_SUPPORT[65537];
    var(*) /*0x36CE0000-0x00000000*/ private bool WORLD_SUPPORT[65537];
    var(*) /*0x36CE0000-0x00000000*/ private bool DEBRIS_TIMEOUT[65537];
    var(*) /*0x36CE0000-0x00000000*/ private bool DEBRIS_MAX_SEPARATION[65537];
    var(*) /*0x36CE0000-0x00000000*/ private bool CRUMBLE_SMALLEST_CHUNKS[65537];
    var(*) /*0x36CE0000-0x00000000*/ private bool ACCURATE_RAYCASTS[65537];
    var(*) /*0x36CE0000-0x00000000*/ private bool USE_VALID_BOUNDS[65537];
    var(*) /*0x36CE0000-0x00000000*/ private bool FORM_EXTENDED_STRUCTURES[65537];

    structdefaultproperties
    {
        ACCUMULATE_DAMAGE=false
        ASSET_DEFINED_SUPPORT=false
        WORLD_SUPPORT=false
        DEBRIS_TIMEOUT=false
        DEBRIS_MAX_SEPARATION=false
        CRUMBLE_SMALLEST_CHUNKS=false
        ACCURATE_RAYCASTS=false
        USE_VALID_BOUNDS=false
        FORM_EXTENDED_STRUCTURES=false
    }
};

struct native NxDestructibleDamageParameters
{
    var(*) /*0x36CA0000-0x00000000*/ private float DamageThreshold[65537];
    var(*) /*0x36CA0000-0x00000000*/ private float DamageSpread[65537];
    var(*) /*0x36CA0000-0x00000000*/ private float ImpactDamage[65537];
    var(*) /*0x36CA0000-0x00000000*/ private float ImpactResistance[65537];
    var(*) /*0x36CA0000-0x00000000*/ private int DefaultImpactDamageDepth[65537];

    structdefaultproperties
    {
        DamageThreshold=0.0000000
        DamageSpread=0.0000000
        ImpactDamage=0.0000000
        ImpactResistance=0.0000000
        DefaultImpactDamageDepth=-1
    }
};

struct native NxDestructibleDebrisParameters
{
    var(*) /*0x36CB0000-0x00000000*/ private float DebrisLifetimeMin[65537];
    var(*) /*0x36CB0000-0x00000000*/ private float DebrisLifetimeMax[65537];
    var(*) /*0x36CB0000-0x00000000*/ private float DebrisMaxSeparationMin[65537];
    var(*) /*0x36CB0000-0x00000000*/ private float DebrisMaxSeparationMax[65537];
    var(*) /*0x36CB0000-0x00000000*/ private @NULL ValidBounds[65537];

    structdefaultproperties
    {
        DebrisLifetimeMin=0.0000000
        DebrisLifetimeMax=0.0000000
        DebrisMaxSeparationMin=0.0000000
        DebrisMaxSeparationMax=0.0000000
        ValidBounds=(Min=(X=-500000.0000000,Y=-500000.0000000,Z=-500000.0000000),Max=(X=500000.0000000,Y=500000.0000000,Z=500000.0000000),IsValid=0)
    }
};

struct native NxDestructibleAdvancedParameters
{
    var(*) /*0x36C90000-0x00000000*/ private float DamageCap[65537];
    var(*) /*0x36C90000-0x00000000*/ private float ImpactVelocityThreshold[65537];
    var(*) /*0x36C90000-0x00000000*/ private float MaxChunkSpeed[65537];
    var(*) /*0x36C90000-0x00000000*/ private float MassScaleExponent[65537];
    var(*) /*0x36C90000-0x00000000*/ private float MassScale[65537];
    var(*) /*0x36C90000-0x00000000*/ private float FractureImpulseScale[65537];

    structdefaultproperties
    {
        DamageCap=0.0000000
        ImpactVelocityThreshold=0.0000000
        MaxChunkSpeed=0.0000000
        MassScaleExponent=0.0000000
        MassScale=0.0000000
        FractureImpulseScale=0.0000000
    }
};

struct native NxDestructibleParameters
{
    var(*) /*0x15C10000-0x00000000*/ private @NULL DamageParameters[65537];
    var(*) /*0x16190000-0x00000000*/ private @NULL DebrisParameters[65537];
    var(*) /*0x01B30000-0x00000000*/ private @NULL AdvancedParameters[65537];
    var(*) /*0x35EA0000-0x00000000*/ private transient float DamageThreshold;
    var(*) /*0x35EA0000-0x00000000*/ private transient float DamageToRadius;
    var(*) /*0x35EA0000-0x00000000*/ private transient float DamageCap;
    var(*) /*0x35EA0000-0x00000000*/ private transient float ForceToDamage;
    var(*) /*0x35EA0000-0x00000000*/ private transient float ImpactVelocityThreshold;
    var(*) /*0x35EA0000-0x00000000*/ private transient float MaterialStrength;
    var(*) /*0x35EA0000-0x00000000*/ private transient float DamageToPercentDeformation;
    var(*) /*0x35EA0000-0x00000000*/ private transient float DeformationPercentLimit;
    var(*) /*0x35EA0000-0x00000000*/ private transient bool bFormExtendedStructures;
    var(*) /*0x36CD0000-0x00000000*/ private int SupportDepth[65537];
    var(*) /*0x36CD0000-0x00000000*/ private int MinimumFractureDepth[65537];
    var(*) /*0x36CD0000-0x00000000*/ private int DebrisDepth[65537];
    var(*) /*0x36CD0000-0x00000000*/ private int EssentialDepth[65537];
    var(*) /*0x35EA0000-0x00000000*/ private transient float DebrisLifetimeMin;
    var(*) /*0x35EA0000-0x00000000*/ private transient float DebrisLifetimeMax;
    var(*) /*0x35EA0000-0x00000000*/ private transient float DebrisMaxSeparationMin;
    var(*) /*0x35EA0000-0x00000000*/ private transient float DebrisMaxSeparationMax;
    var(*) /*0x35EA0000-0x00000000*/ private transient @NULL ValidBounds;
    var(*) /*0x35EA0000-0x00000000*/ private transient float MaxChunkSpeed;
    var(*) /*0x35EA0000-0x00000000*/ private transient float MassScaleExponent;
    var(*) /*0x36CD0000-0x00000000*/ private @NULL Flags[65537];
    var(*) /*0x35EA0000-0x00000000*/ private transient float GrbVolumeLimit;
    var(*) /*0x35EA0000-0x00000000*/ private transient float GrbParticleSpacing;
    var(*) /*0x35EA0000-0x00000000*/ private transient float FractureImpulseScale;
    var(*) /*0x36CD0000-0x00000000*/ private editfixedsize array DepthParameters[4259841];
    var(*) /*0x36CD0000-0x00000000*/ private int DynamicChunksDominanceGroup[65537];
    var(*) /*0x36CD0000-0x00000000*/ private bool UseDynamicChunksGroupsMask[65537];
    var(*) /*0x36CD0000-0x00000000*/ private byte DynamicChunksChannel[196609];
    var(*) /*0x36CD0000-0x00000000*/ private @NULL DynamicChunksCollideWithChannels[196609];

    structdefaultproperties
    {
        DamageParameters=(DamageThreshold=0.0000000,DamageSpread=0.0000000,ImpactDamage=0.0000000,ImpactResistance=0.0000000,DefaultImpactDamageDepth=-1)
        DebrisParameters=(DebrisLifetimeMin=0.0000000,DebrisLifetimeMax=0.0000000,DebrisMaxSeparationMin=0.0000000,DebrisMaxSeparationMax=0.0000000,ValidBounds=(Min=(X=-500000.0000000,Y=-500000.0000000,Z=-500000.0000000),Max=(X=500000.0000000,Y=500000.0000000,Z=500000.0000000),IsValid=0))
        AdvancedParameters=(DamageCap=0.0000000,ImpactVelocityThreshold=0.0000000,MaxChunkSpeed=0.0000000,MassScaleExponent=0.0000000,MassScale=0.0000000,FractureImpulseScale=0.0000000)
        SupportDepth=0
        MinimumFractureDepth=0
        DebrisDepth=0
        EssentialDepth=0
        Flags=(ACCUMULATE_DAMAGE=false,ASSET_DEFINED_SUPPORT=false,WORLD_SUPPORT=false,DEBRIS_TIMEOUT=false,DEBRIS_MAX_SEPARATION=false,CRUMBLE_SMALLEST_CHUNKS=false,ACCURATE_RAYCASTS=false,USE_VALID_BOUNDS=false,FORM_EXTENDED_STRUCTURES=false)
        DepthParameters=none
        DynamicChunksDominanceGroup=-1
        UseDynamicChunksGroupsMask=false
        DynamicChunksChannel=ERBCollisionChannel.RBCC_Default
        DynamicChunksCollideWithChannels=(Default=false,Nothing=false,Pawn=false,Vehicle=false,Water=false,GameplayPhysics=false,EffectPhysics=false,Untitled1=false,Untitled2=false,Untitled3=false,Untitled4=false,Cloth=false,FluidDrain=false,SoftBody=false,FracturedMeshPart=false,BlockingVolume=false,DeadPawn=false,Clothing=false,ClothingCollision=false,PhatPawnSize1=false,PhatPawnSize2=false,PhatPawnSize3=false)
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL MApexAsset[268435457];
var(*) /*0x03370000-0x00000000*/ private editfixedsize array Materials[4390913];
var(*) /*0x03370000-0x00000000*/ private editfixedsize array FractureMaterials[4390913];
var(*) /*0x03370000-0x00000000*/ private @NULL DefaultPhysMaterial[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MDestructibleThumbnailComponent[268435457];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasUniqueAssetMaterialNames;
var(*) /*0x35EA0000-0x00000000*/ private transient bool bDynamic;
var(*) /*0x03370000-0x00000000*/ private editfixedsize string CrumbleEmitterName[65537];
var(*) /*0x03370000-0x00000000*/ private editfixedsize string DustEmitterName[65537];
var(*) /*0x03370000-0x00000000*/ private editfixedsize @NULL DestructibleParameters[65537];

defaultproperties
{
    DestructibleParameters=(DamageParameters=(DamageThreshold=0.0000000,DamageSpread=0.0000000,ImpactDamage=0.0000000,ImpactResistance=0.0000000,DefaultImpactDamageDepth=-1),DebrisParameters=(DebrisLifetimeMin=0.0000000,DebrisLifetimeMax=0.0000000,DebrisMaxSeparationMin=0.0000000,DebrisMaxSeparationMax=0.0000000,ValidBounds=(Min=(X=-500000.0000000,Y=-500000.0000000,Z=-500000.0000000),Max=(X=500000.0000000,Y=500000.0000000,Z=500000.0000000),IsValid=0)),AdvancedParameters=(DamageCap=0.0000000,ImpactVelocityThreshold=0.0000000,MaxChunkSpeed=0.0000000,MassScaleExponent=0.0000000,MassScale=0.0000000,FractureImpulseScale=0.0000000),SupportDepth=0,MinimumFractureDepth=0,DebrisDepth=0,EssentialDepth=0,Flags=(ACCUMULATE_DAMAGE=false,ASSET_DEFINED_SUPPORT=false,WORLD_SUPPORT=false,DEBRIS_TIMEOUT=false,DEBRIS_MAX_SEPARATION=false,CRUMBLE_SMALLEST_CHUNKS=false,ACCURATE_RAYCASTS=false,USE_VALID_BOUNDS=false,FORM_EXTENDED_STRUCTURES=false),DepthParameters=none,DynamicChunksDominanceGroup=-1,UseDynamicChunksGroupsMask=false,DynamicChunksChannel=ERBCollisionChannel.RBCC_Default,DynamicChunksCollideWithChannels=(Default=false,Nothing=false,Pawn=false,Vehicle=false,Water=false,GameplayPhysics=false,EffectPhysics=false,Untitled1=false,Untitled2=false,Untitled3=false,Untitled4=false,Cloth=false,FluidDrain=false,SoftBody=false,FracturedMeshPart=false,BlockingVolume=false,DeadPawn=false,Clothing=false,ClothingCollision=false,PhatPawnSize1=false,PhatPawnSize2=false,PhatPawnSize3=false))
}