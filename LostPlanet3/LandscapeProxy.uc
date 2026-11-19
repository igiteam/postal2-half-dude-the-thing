class LandscapeProxy extends Info
    notplaceable
    hidecategories(AnimDependency,Navigation,Movement,Collision,Display,Attachment,Physics,Debug,Lighting,LOD);

struct native LandscapeWeightmapUsage
{
    var(*) /*0x35EA0000-0x00000400*/ private export @NULL ChannelUsage[524292];

    structdefaultproperties
    {
        ChannelUsage[0]=none
        ChannelUsage[1]=none
        ChannelUsage[2]=none
        ChannelUsage[3]=none
    }
};

struct native LandscapeLayerStruct
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LayerInfoObj;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ThumbnailMIC;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Owner;
    var(*) /*0x35EA0000-0x00000000*/ private int DebugColorChannel[536870913];
    var(*) /*0x35EA0000-0x00000000*/ private bool bSelected[536870913];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string SourceFilePath;

    structdefaultproperties
    {
        LayerInfoObj=none
        ThumbnailMIC=none
        Owner=none
        DebugColorChannel=0
        bSelected=false
        SourceFilePath=""
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL LandscapeGuid[131073];
var(*) /*0x2F830000-0x00000000*/ private int MaxLODLevel[65537];
var(*) /*0x2D9A0000-0x00000000*/ private @NULL DefaultPhysMaterial[65537];
var(*) /*0x2D9A0000-0x00000000*/ private float StreamingDistanceMultiplier[196609];
var(*) /*0x2D9A0000-0x00000000*/ private @NULL LandscapeMaterial[65537];
var(*) /*0x2F830000-0x00000000*/ private float LODDistanceFactor[65537];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array LandscapeComponents[655361];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array CollisionComponents[655361];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} MaterialInstanceConstantMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} WeightmapUsageMap[268566529];
var(*) /*0x2EB00000-0x00000000*/ private float StaticLightingResolution[65537];
var(*) /*0x2DAE0000-0x00000000*/ private @NULL LandscapeActor[536936449];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsProxy[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsSetup[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bResetup[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsMovingToLevel[536870913];
var(*) /*0x2ECC0000-0x00000000*/ private @NULL LightmassSettings[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LayerInfoObjs;
var(*) /*0x35EA0000-0x00000000*/ private int ComponentSizeQuads[131073];
var(*) /*0x35EA0000-0x00000000*/ private int SubsectionSizeQuads[131073];
var(*) /*0x35EA0000-0x00000000*/ private int NumSubsections[131073];

defaultproperties
{
    MaxLODLevel=-1
    StreamingDistanceMultiplier=1.0000000
    LODDistanceFactor=1.0000000
    StaticLightingResolution=1.0000000
    bIsProxy=true
    LightmassSettings=(bUseTwoSidedLighting=false,bShadowIndirectOnly=false,bUseEmissiveForStaticLighting=false,EmissiveLightFalloffExponent=2.0000000,EmissiveLightExplicitInfluenceRadius=0.0000000,EmissiveBoost=1.0000000,DiffuseBoost=1.0000000,SpecularBoost=1.0000000,FullyOccludedSamplesFraction=1.0000000)
    DrawScale3D=(X=128.0000000,Y=128.0000000,Z=256.0000000)
    bStatic=true
    bHidden=false
    bNoDelete=true
    bWorldGeometry=true
    bMovable=false
    bCollideActors=true
    bBlockActors=true
    bEdShouldSnap=true
    bLockLocation=true
}