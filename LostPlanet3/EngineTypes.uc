class EngineTypes extends Object
    abstract;

const LOADING_MOVIE = "LoadingMovie";

enum EPathFindingError
{
    PATHERROR_STARTPOLYNOTFOUND,    // 0
    PATHERROR_GOALPOLYNOTFOUND,     // 1
    PATHERROR_ANCHORPYLONNOTFOUND,  // 2
    PATHERROR_NOPATHFOUND,          // 3
    PATHERROR_COMPUTEVALIDFINALDEST_FAIL,// 4
    PATHERROR_GETNEXTMOVELOCATION_FAIL,// 5
    PATHERROR_MOVETIMEOUT,          // 6
    PATHERROR_MAX                   // 7
};

enum EBlendMode
{
    BLEND_Opaque,                   // 0
    BLEND_Masked,                   // 1
    BLEND_Translucent,              // 2
    BLEND_Additive,                 // 3
    BLEND_Modulate,                 // 4
    BLEND_ModulateAndAdd,           // 5
    BLEND_SoftMasked,               // 6
    BLEND_AlphaComposite,           // 7
    BLEND_DitheredTranslucent,      // 8
    BLEND_SPAdd_1mA_1,              // 9
    BLEND_SPAdd_1mA_D,              // 10
    BLEND_SPAdd_1mA_1mD,            // 11
    BLEND_SPSub_1mA_1,              // 12
    BLEND_SPSub_1mA_D,              // 13
    BLEND_SPSub_1mA_1mD,            // 14
    BLEND_SPAdd_1mC_A,              // 15
    BLEND_SPSub_1mC_A,              // 16
    BLEND_SPAdd_C_A,                // 17
    BLEND_SPSub_C_A,                // 18
    BLEND_SPAdd_1mC_C,              // 19
    BLEND_SPAdd_1mC_1mC,            // 20
    BLEND_SPAdd_1mC_1mD,            // 21
    BLEND_SPSub_1mC_C,              // 22
    BLEND_SPSub_1mC_D,              // 23
    BLEND_SPSub_1mC_1mC,            // 24
    BLEND_SPSub_1mC_1mD,            // 25
    BLEND_SPAdd_C_D,                // 26
    BLEND_SPMax_1_1,                // 27
    BLEND_SPMin_1_1,                // 28
    BLEND_MAX                       // 29
};

enum EMaterialLightingModel
{
    MLM_Phong,                      // 0
    MLM_NonDirectional,             // 1
    MLM_Unlit,                      // 2
    MLM_SHPRT,                      // 3
    MLM_Custom,                     // 4
    MLM_Anisotropic,                // 5
    MLM_Blinn,                      // 6
    MLM_MAX                         // 7
};

enum EMaterialTessellationMode
{
    MTM_NoTessellation,             // 0
    MTM_FlatTessellation,           // 1
    MTM_PNTriangles,                // 2
    MTM_MAX                         // 3
};

enum EMobileValueSource
{
    MVS_Constant,                   // 0
    MVS_VertexColorRed,             // 1
    MVS_VertexColorGreen,           // 2
    MVS_VertexColorBlue,            // 3
    MVS_VertexColorAlpha,           // 4
    MVS_BaseTextureRed,             // 5
    MVS_BaseTextureGreen,           // 6
    MVS_BaseTextureBlue,            // 7
    MVS_BaseTextureAlpha,           // 8
    MVS_MaskTextureRed,             // 9
    MVS_MaskTextureGreen,           // 10
    MVS_MaskTextureBlue,            // 11
    MVS_MaskTextureAlpha,           // 12
    MVS_NormalTextureAlpha,         // 13
    MVS_EmissiveTextureRed,         // 14
    MVS_EmissiveTextureGreen,       // 15
    MVS_EmissiveTextureBlue,        // 16
    MVS_EmissiveTextureAlpha,       // 17
    MVS_MAX                         // 18
};

enum EMobileTextureBlendFactorSource
{
    MTBFS_VertexColor,              // 0
    MTBFS_MaskTexture,              // 1
    MTBFS_MAX                       // 2
};

enum EMobileTexCoordsSource
{
    MTCS_TexCoords0,                // 0
    MTCS_TexCoords1,                // 1
    MTCS_TexCoords2,                // 2
    MTCS_TexCoords3,                // 3
    MTCS_MAX                        // 4
};

enum EMobileAlphaValueSource
{
    MAVS_DiffuseTextureAlpha,       // 0
    MAVS_MaskTextureRed,            // 1
    MAVS_MaskTextureGreen,          // 2
    MAVS_MaskTextureBlue,           // 3
    MAVS_MAX                        // 4
};

enum EMobileColorMultiplySource
{
    MCMS_None,                      // 0
    MCMS_BaseTextureRed,            // 1
    MCMS_BaseTextureGreen,          // 2
    MCMS_BaseTextureBlue,           // 3
    MCMS_BaseTextureAlpha,          // 4
    MCMS_MaskTextureRed,            // 5
    MCMS_MaskTextureGreen,          // 6
    MCMS_MaskTextureBlue,           // 7
    MCMS_MaskTextureAlpha,          // 8
    MCMS_MAX                        // 9
};

enum EMobileEmissiveColorSource
{
    MECS_EmissiveTexture,           // 0
    MECS_BaseTexture,               // 1
    MECS_Constant,                  // 2
    MECS_MAX                        // 3
};

enum EMobileEnvironmentBlendMode
{
    MEBM_Add,                       // 0
    MEBM_Lerp,                      // 1
    MEBM_MAX                        // 2
};

enum EMobileSpecularMask
{
    MSM_Constant,                   // 0
    MSM_Luminance,                  // 1
    MSM_DiffuseRed,                 // 2
    MSM_DiffuseGreen,               // 3
    MSM_DiffuseBlue,                // 4
    MSM_DiffuseAlpha,               // 5
    MSM_MaskTextureRGB,             // 6
    MSM_MaskTextureRed,             // 7
    MSM_MaskTextureGreen,           // 8
    MSM_MaskTextureBlue,            // 9
    MSM_MaskTextureAlpha,           // 10
    MSM_MAX                         // 11
};

enum EMobileAmbientOcclusionSource
{
    MAOS_Disabled,                  // 0
    MAOS_VertexColorRed,            // 1
    MAOS_VertexColorGreen,          // 2
    MAOS_VertexColorBlue,           // 3
    MAOS_VertexColorAlpha,          // 4
    MAOS_MAX                        // 5
};

enum ELightingBuildQuality
{
    Quality_Preview,                // 0
    Quality_Medium,                 // 1
    Quality_High,                   // 2
    Quality_Production,             // 3
    Quality_NoGlobalIllumination,   // 4
    Quality_MAX                     // 5
};

struct native SubtitleCue
{
    var(*) /*0x4ADF0000-0x00000000*/ private editfixedsize string Text;
    var(*) /*0x4ADF0000-0x00000000*/ private float Time;

    structdefaultproperties
    {
        Text=""
        Time=0.0000000
    }
};

struct native LocalizedSubtitle
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string LanguageExt;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Subtitles;
    var(*) /*0x35EA0000-0x00000000*/ private bool bMature;
    var(*) /*0x35EA0000-0x00000000*/ private bool bManualWordWrap;
    var(*) /*0x35EA0000-0x00000000*/ private bool bSingleLine;

    structdefaultproperties
    {
        LanguageExt=""
        Subtitles=none
        bMature=false
        bManualWordWrap=false
        bSingleLine=false
    }
};

struct native SPMaterialDummyStruct
{
    var(*) /*0x35EA0000-0x00000000*/ private int Dummy;

    structdefaultproperties
    {
        Dummy=0
    }
};

struct LightMapRef
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Reference[268566529];
};

struct native DominantShadowInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL WorldToLight;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LightToWorld;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LightSpaceImportanceBounds;
    var(*) /*0x35EA0000-0x00000000*/ private int ShadowMapSizeX;
    var(*) /*0x35EA0000-0x00000000*/ private int ShadowMapSizeY;

    structdefaultproperties
    {
        WorldToLight=(XPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000),YPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000),ZPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000),WPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000))
        LightToWorld=(XPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000),YPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000),ZPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000),WPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000))
        LightSpaceImportanceBounds=(Min=(X=0.0000000,Y=0.0000000,Z=0.0000000),Max=(X=0.0000000,Y=0.0000000,Z=0.0000000),IsValid=0)
        ShadowMapSizeX=0
        ShadowMapSizeY=0
    }
};

struct native LightmassLightSettings
{
    var(*) /*0x25EE0000-0x00000000*/ private float IndirectLightingScale[65537];
    var(*) /*0x25EE0000-0x00000000*/ private float IndirectLightingSaturation[65537];
    var(*) /*0x25EE0000-0x00000000*/ private float ShadowExponent[65537];

    structdefaultproperties
    {
        IndirectLightingScale=1.0000000
        IndirectLightingSaturation=1.0000000
        ShadowExponent=2.0000000
    }
};

struct native LightmassPointLightSettings extends LightmassLightSettings
{
    var(*) /*0x3D500000-0x00000000*/ private float LightSourceRadius[65537];

    structdefaultproperties
    {
        LightSourceRadius=100.0000000
        IndirectLightingScale=0.0000000
        IndirectLightingSaturation=0.0000000
        ShadowExponent=0.0000000
    }
};

struct native LightmassDirectionalLightSettings extends LightmassLightSettings
{
    var(*) /*0x1CCC0000-0x00000000*/ private float LightSourceAngle[65537];

    structdefaultproperties
    {
        LightSourceAngle=3.0000000
        IndirectLightingScale=0.0000000
        IndirectLightingSaturation=0.0000000
        ShadowExponent=0.0000000
    }
};

struct LightmassPrimitiveSettings
{
    var(*) /*0x2ED50000-0x00000000*/ private bool bUseTwoSidedLighting[65537];
    var(*) /*0x2ED50000-0x00000000*/ private bool bShadowIndirectOnly[65537];
    var(*) /*0x2ED50000-0x00000000*/ private bool bUseEmissiveForStaticLighting[65537];
    var(*) /*0x2ED50000-0x00000000*/ private float EmissiveLightFalloffExponent[65537];
    var(*) /*0x2ED50000-0x00000000*/ private float EmissiveLightExplicitInfluenceRadius[65537];
    var(*) /*0x2ED50000-0x00000000*/ private float EmissiveBoost[65537];
    var(*) /*0x2ED50000-0x00000000*/ private float DiffuseBoost[65537];
    var(*) /*0x35EA0000-0x00000000*/ private float SpecularBoost;
    var(*) /*0x2ED50000-0x00000000*/ private float FullyOccludedSamplesFraction[65537];

    structdefaultproperties
    {
        bUseTwoSidedLighting=false
        bShadowIndirectOnly=false
        bUseEmissiveForStaticLighting=false
        EmissiveLightFalloffExponent=2.0000000
        EmissiveLightExplicitInfluenceRadius=0.0000000
        EmissiveBoost=1.0000000
        DiffuseBoost=1.0000000
        SpecularBoost=1.0000000
        FullyOccludedSamplesFraction=1.0000000
    }
};

struct native LightmassDebugOptions
{
    var(*) /*0x2ECE0000-0x00000000*/ private bool bDebugMode[65537];
    var(*) /*0x2ECE0000-0x00000000*/ private bool bStatsEnabled[65537];
    var(*) /*0x2ECE0000-0x00000000*/ private bool bGatherBSPSurfacesAcrossComponents[65537];
    var(*) /*0x2ECE0000-0x00000000*/ private float CoplanarTolerance[65537];
    var(*) /*0x2ECE0000-0x00000000*/ private bool bUseDeterministicLighting[65537];
    var(*) /*0x2ECE0000-0x00000000*/ private bool bUseImmediateImport[65537];
    var(*) /*0x2ECE0000-0x00000000*/ private bool bImmediateProcessMappings[65537];
    var(*) /*0x2ECE0000-0x00000000*/ private bool bSortMappings[65537];
    var(*) /*0x2ECE0000-0x00000000*/ private bool bDumpBinaryFiles[65537];
    var(*) /*0x2ECE0000-0x00000000*/ private bool bDebugMaterials[65537];
    var(*) /*0x2ECE0000-0x00000000*/ private bool bPadMappings[65537];
    var(*) /*0x2ECE0000-0x00000000*/ private bool bDebugPaddings[65537];
    var(*) /*0x2ECE0000-0x00000000*/ private bool bOnlyCalcDebugTexelMappings[65537];
    var(*) /*0x2ECE0000-0x00000000*/ private bool bUseRandomColors[65537];
    var(*) /*0x2ECE0000-0x00000000*/ private bool bColorBordersGreen[65537];
    var(*) /*0x2ECE0000-0x00000000*/ private bool bColorByExecutionTime[65537];
    var(*) /*0x2ECE0000-0x00000000*/ private float ExecutionTimeDivisor[65537];
    var(*) /*0x35EA0000-0x00000000*/ private bool bInitialized;

    structdefaultproperties
    {
        bDebugMode=false
        bStatsEnabled=false
        bGatherBSPSurfacesAcrossComponents=true
        CoplanarTolerance=0.0010000
        bUseDeterministicLighting=true
        bUseImmediateImport=true
        bImmediateProcessMappings=true
        bSortMappings=true
        bDumpBinaryFiles=false
        bDebugMaterials=false
        bPadMappings=true
        bDebugPaddings=false
        bOnlyCalcDebugTexelMappings=false
        bUseRandomColors=false
        bColorBordersGreen=false
        bColorByExecutionTime=false
        ExecutionTimeDivisor=15.0000000
        bInitialized=false
    }
};

struct native SwarmDebugOptions
{
    var(*) /*0x4B140000-0x00000000*/ private bool bDistributionEnabled[65537];
    var(*) /*0x4B140000-0x00000000*/ private bool bForceContentExport[65537];
    var(*) /*0x35EA0000-0x00000000*/ private bool bInitialized;

    structdefaultproperties
    {
        bDistributionEnabled=true
        bForceContentExport=false
        bInitialized=false
    }
};

struct native RootMotionCurve
{
    var(*) /*0x423E0000-0x00000000*/ private name AnimName[65537];
    var(*) /*0x423E0000-0x00000000*/ private editfixedsize @NULL Curve[65537];
    var(*) /*0x423E0000-0x00000000*/ private float MaxCurveTime[65537];

    structdefaultproperties
    {
        AnimName="None"
        Curve=(Points=none,InterpMethod=EInterpMethodType.IMT_UseFixedTangentEvalAndNewAutoTangents)
        MaxCurveTime=0.0000000
    }
};

struct native PrimitiveMaterialRef
{
    var(*) /*0x35EA0000-0x00000400*/ private export @NULL Primitive[524289];
    var(*) /*0x35EA0000-0x00000000*/ private int MaterialIndex;

    structdefaultproperties
    {
        Primitive=none
        MaterialIndex=0
    }
};

struct native PostProcessMaterialRef
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Effect;

    structdefaultproperties
    {
        Effect=none
    }
};

struct native PostProcessVolumeMaterialRef
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Volume;

    structdefaultproperties
    {
        Volume=none
    }
};

struct native CameraActorMaterialRef
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Actor;

    structdefaultproperties
    {
        Actor=none
    }
};

struct native MaterialReferenceList
{
    var(*) /*0x31150000-0x00000000*/ private @NULL TargetMaterial[65537];
    var(*) /*0x35EA0000-0x00000000*/ private noclear editfixedsize export array AffectedMaterialRefs;
    var(*) /*0x35EA0000-0x00000000*/ private noclear editfixedsize array AffectedPPChainMaterialRefs;
    var(*) /*0x35EA0000-0x00000000*/ private noclear editfixedsize array AffectedPPVolumeMaterialRefs;
    var(*) /*0x35EA0000-0x00000000*/ private noclear editfixedsize array AffectedCameraActorMaterialRefs;

    structdefaultproperties
    {
        TargetMaterial=none
        AffectedMaterialRefs=none
        AffectedPPChainMaterialRefs=none
        AffectedPPVolumeMaterialRefs=none
        AffectedCameraActorMaterialRefs=none
    }
};

struct native VelocityObstacleStat
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Position;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Velocity;
    var(*) /*0x35EA0000-0x00000000*/ private float Radius;
    var(*) /*0x35EA0000-0x00000000*/ private int Priority;

    structdefaultproperties
    {
        Position=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Velocity=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Radius=0.0000000
        Priority=0
    }
};
