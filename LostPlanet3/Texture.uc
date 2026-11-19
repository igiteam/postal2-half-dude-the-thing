class Texture extends Surface
    abstract;

enum TextureCompressionSettings
{
    TC_Default,                     // 0
    TC_Normalmap,                   // 1
    TC_Displacementmap,             // 2
    TC_NormalmapAlpha,              // 3
    TC_Grayscale,                   // 4
    TC_HighDynamicRange,            // 5
    TC_OneBitAlpha,                 // 6
    TC_NormalmapUncompressed,       // 7
    TC_NormalmapBC5,                // 8
    TC_OneBitMonochrome,            // 9
    TC_SimpleLightmapModification,  // 10
    TC_VectorDisplacementmap,       // 11
    TC_NormalmapDXT5n,              // 12
    TC_MAX                          // 13
};

enum EPixelFormat
{
    PF_Unknown,                     // 0
    PF_A32B32G32R32F,               // 1
    PF_A8R8G8B8,                    // 2
    PF_G8,                          // 3
    PF_G16,                         // 4
    PF_DXT1,                        // 5
    PF_DXT3,                        // 6
    PF_DXT5,                        // 7
    PF_UYVY,                        // 8
    PF_FloatRGB,                    // 9
    PF_FloatRGBA,                   // 10
    PF_DepthStencil,                // 11
    PF_ShadowDepth,                 // 12
    PF_FilteredShadowDepth,         // 13
    PF_R32F,                        // 14
    PF_G16R16,                      // 15
    PF_G16R16F,                     // 16
    PF_G16R16F_FILTER,              // 17
    PF_G32R32F,                     // 18
    PF_A2B10G10R10,                 // 19
    PF_A16B16G16R16,                // 20
    PF_D24,                         // 21
    PF_R16F,                        // 22
    PF_R16F_FILTER,                 // 23
    PF_BC5,                         // 24
    PF_V8U8,                        // 25
    PF_A1,                          // 26
    PF_FloatR11G11B10,              // 27
    PF_A4R4G4B4,                    // 28
    PF_R5G6B5,                      // 29
    PF_MAX                          // 30
};

enum TextureFilter
{
    TF_Nearest,                     // 0
    TF_Linear,                      // 1
    TF_ForceBilinear,               // 2
    TF_ForceTrilinear,              // 3
    TF_ForceAnisotropic,            // 4
    TF_MAX                          // 5
};

enum TextureAddress
{
    TA_Wrap,                        // 0
    TA_Clamp,                       // 1
    TA_Mirror,                      // 2
    TA_Border,                      // 3
    TA_MAX                          // 4
};

enum TextureGroup
{
    TEXTUREGROUP_World,             // 0
    TEXTUREGROUP_WorldNormalMap,    // 1
    TEXTUREGROUP_WorldSpecular,     // 2
    TEXTUREGROUP_Character,         // 3
    TEXTUREGROUP_CharacterNormalMap,// 4
    TEXTUREGROUP_CharacterSpecular, // 5
    TEXTUREGROUP_Weapon,            // 6
    TEXTUREGROUP_WeaponNormalMap,   // 7
    TEXTUREGROUP_WeaponSpecular,    // 8
    TEXTUREGROUP_Vehicle,           // 9
    TEXTUREGROUP_VehicleNormalMap,  // 10
    TEXTUREGROUP_VehicleSpecular,   // 11
    TEXTUREGROUP_Cinematic,         // 12
    TEXTUREGROUP_Effects,           // 13
    TEXTUREGROUP_EffectsLarge,      // 14
    TEXTUREGROUP_EffectsNotFiltered,// 15
    TEXTUREGROUP_Skybox,            // 16
    TEXTUREGROUP_UI,                // 17
    TEXTUREGROUP_Lightmap,          // 18
    TEXTUREGROUP_RenderTarget,      // 19
    TEXTUREGROUP_MobileFlattened,   // 20
    TEXTUREGROUP_ProcBuilding_Face, // 21
    TEXTUREGROUP_ProcBuilding_LightMap,// 22
    TEXTUREGROUP_Shadowmap,         // 23
    TEXTUREGROUP_ColorLookupTable,  // 24
    TEXTUREGROUP_Terrain_Heightmap, // 25
    TEXTUREGROUP_Terrain_Weightmap, // 26
    TEXTUREGROUP_ImageBasedReflection,// 27
    TEXTUREGROUP_Bokeh,             // 28
    TEXTUREGROUP_MAX                // 29
};

enum TextureMipGenSettings
{
    TMGS_FromTextureGroup,          // 0
    TMGS_SimpleAverage,             // 1
    TMGS_Sharpen0,                  // 2
    TMGS_Sharpen1,                  // 3
    TMGS_Sharpen2,                  // 4
    TMGS_Sharpen3,                  // 5
    TMGS_Sharpen4,                  // 6
    TMGS_Sharpen5,                  // 7
    TMGS_Sharpen6,                  // 8
    TMGS_Sharpen7,                  // 9
    TMGS_Sharpen8,                  // 10
    TMGS_Sharpen9,                  // 11
    TMGS_Sharpen10,                 // 12
    TMGS_NoMipmaps,                 // 13
    TMGS_LeaveExistingMips,         // 14
    TMGS_Blur1,                     // 15
    TMGS_Blur2,                     // 16
    TMGS_Blur3,                     // 17
    TMGS_Blur4,                     // 18
    TMGS_Blur5,                     // 19
    TMGS_MAX                        // 20
};

enum ETextureMipCount
{
    TMC_ResidentMips,               // 0
    TMC_AllMips,                    // 1
    TMC_AllMipsBiased,              // 2
    TMC_MAX                         // 3
};

struct native TextureGroupContainer
{
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_World[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_WorldNormalMap[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_WorldSpecular[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_Character[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_CharacterNormalMap[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_CharacterSpecular[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_Weapon[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_WeaponNormalMap[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_WeaponSpecular[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_Vehicle[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_VehicleNormalMap[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_VehicleSpecular[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_Cinematic[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_Effects[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_EffectsLarge[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_EffectsNotFiltered[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_Skybox[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_UI[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_Lightmap[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_RenderTarget[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_MobileFlattened[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_ProcBuilding_Face[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_ProcBuilding_LightMap[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_Shadowmap[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_ColorLookupTable[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_Terrain_Heightmap[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_Terrain_Weightmap[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_ImageBasedReflection[196609];
    var(*) /*0x4C410000-0x00000000*/ private bool TEXTUREGROUP_Bokeh[196609];

    structdefaultproperties
    {
        TEXTUREGROUP_World=false
        TEXTUREGROUP_WorldNormalMap=false
        TEXTUREGROUP_WorldSpecular=false
        TEXTUREGROUP_Character=false
        TEXTUREGROUP_CharacterNormalMap=false
        TEXTUREGROUP_CharacterSpecular=false
        TEXTUREGROUP_Weapon=false
        TEXTUREGROUP_WeaponNormalMap=false
        TEXTUREGROUP_WeaponSpecular=false
        TEXTUREGROUP_Vehicle=false
        TEXTUREGROUP_VehicleNormalMap=false
        TEXTUREGROUP_VehicleSpecular=false
        TEXTUREGROUP_Cinematic=false
        TEXTUREGROUP_Effects=false
        TEXTUREGROUP_EffectsLarge=false
        TEXTUREGROUP_EffectsNotFiltered=false
        TEXTUREGROUP_Skybox=false
        TEXTUREGROUP_UI=false
        TEXTUREGROUP_Lightmap=false
        TEXTUREGROUP_RenderTarget=false
        TEXTUREGROUP_MobileFlattened=false
        TEXTUREGROUP_ProcBuilding_Face=false
        TEXTUREGROUP_ProcBuilding_LightMap=false
        TEXTUREGROUP_Shadowmap=false
        TEXTUREGROUP_ColorLookupTable=false
        TEXTUREGROUP_Terrain_Heightmap=false
        TEXTUREGROUP_Terrain_Weightmap=false
        TEXTUREGROUP_ImageBasedReflection=false
        TEXTUREGROUP_Bokeh=false
    }
};

var(*) /*0x4C140000-0x00000000*/ private bool SRGB[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool RGBE;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsSourceArtUncompressed;
var(*) /*0x4C140000-0x00000000*/ private bool CompressionNoAlpha[65537];
var(*) /*0x36080000-0x00000000*/ private bool CompressionNone[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient bool CompressionNoMipmaps;
var(*) /*0x4C140000-0x00000000*/ private bool CompressionFullDynamicRange[65537];
var(*) /*0x4C140000-0x00000000*/ private bool DeferCompression[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool NeverStream;
var(*) /*0x4C140000-0x00000000*/ private bool bDitherMipMapAlpha[65537];
var(*) /*0x4C140000-0x00000000*/ private bool bPreserveBorderR[65537];
var(*) /*0x4C140000-0x00000000*/ private bool bPreserveBorderG[65537];
var(*) /*0x4C140000-0x00000000*/ private bool bPreserveBorderB[65537];
var(*) /*0x4C140000-0x00000000*/ private bool bPreserveBorderA[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bNoTiling[131073];
var(*) /*0x32E40000-0x00000000*/ private bool bForcePVRTC4[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bAsyncResourceReleaseHasBeenStarted[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bUseCinematicMipLevels[537001985];
var(*) /*0x4C140000-0x00000000*/ private float UnpackMin[65540];
var(*) /*0x4C140000-0x00000000*/ private float UnpackMax[65540];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SourceArt[268566529];
var(*) /*0x4C140000-0x00000000*/ private int FadeMipFrom[65537];
var(*) /*0x4C140000-0x00000000*/ private int FadeMipTo[65537];
var(*) /*0x4C140000-0x00000000*/ private @NULL FadeMipColor[65537];
var(*) /*0x4C140000-0x00000000*/ private byte CompressionSettings[65537];
var(*) /*0x4C140000-0x00000000*/ private byte Filter[65537];
var(*) /*0x4C140000-0x00000000*/ private byte LODGroup[65537];
var(*) /*0x35EA0000-0x00000000*/ private byte CachedLODGroup[536870913];
var(*) /*0x4C140000-0x00000000*/ private byte MipGenSettings[65537];
var(*) /*0x4C140000-0x00000000*/ private int LODBias[65537];
var(*) /*0x35EA0000-0x00000000*/ private int CachedCombinedLODBias[536870913];
var(*) /*0x4C140000-0x00000000*/ private int NumCinematicMipLevels[65537];
var(*) /*0x4C140000-0x00000000*/ private editfixedsize string SourceFilePath[65537];
var(*) /*0x4C140000-0x00000000*/ private const editfixedsize string SourceFileTimestamp[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Resource[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LightingGuid[131073];
var(*) /*0x4C140000-0x00000000*/ private float AdjustBrightness[65537];
var(*) /*0x4C140000-0x00000000*/ private float AdjustBrightnessCurve[65537];
var(*) /*0x4C140000-0x00000000*/ private float AdjustVibrance[65537];
var(*) /*0x4C140000-0x00000000*/ private float AdjustSaturation[65537];
var(*) /*0x4C140000-0x00000000*/ private float AdjustRGBCurve[65537];
var(*) /*0x4C140000-0x00000000*/ private float AdjustHue[65537];
var(*) /*0x35EA0000-0x00000000*/ private int InternalFormatLODBias[131073];

defaultproperties
{
    SRGB=true
    UnpackMax[0]=1.0000000
    UnpackMax[1]=1.0000000
    UnpackMax[2]=1.0000000
    UnpackMax[3]=1.0000000
    Filter=TextureFilter.TF_Linear
    AdjustBrightness=1.0000000
    AdjustBrightnessCurve=1.0000000
    AdjustSaturation=1.0000000
    AdjustRGBCurve=1.0000000
}