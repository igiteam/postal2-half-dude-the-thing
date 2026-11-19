class Engine extends Subsystem
    abstract
    transient
    config(Engine);

enum ETransitionType
{
    TT_None,                        // 0
    TT_Paused,                      // 1
    TT_Loading,                     // 2
    TT_Saving,                      // 3
    TT_Connecting,                  // 4
    TT_Precaching,                  // 5
    TT_MAX                          // 6
};

struct native StatColorMapEntry
{
    var(*) /*0x35EA0000-0x00000000*/ private input float In[1073741825];
    var(*) /*0x35EA0000-0x00000000*/ private input @NULL Out[1073741825];

    structdefaultproperties
    {
        In=0.0000000
        Out=(R=0,G=0,B=0,A=0)
    }
};

struct native StatColorMapping
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string StatName[1073741825];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input array ColorMap[1073741825];
    var(*) /*0x35EA0000-0x00000000*/ private input bool DisableBlend[1073741825];

    structdefaultproperties
    {
        StatName=""
        ColorMap=none
        DisableBlend=false
    }
};

struct native DropNoteInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Location;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Rotation;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Comment;

    structdefaultproperties
    {
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Rotation=(Pitch=0,Yaw=0,Roll=0)
        Comment=""
    }
};

struct native SPMapLoadingMovieInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string MapName;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LoadingMovies;

    structdefaultproperties
    {
        MapName=""
        LoadingMovies=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL TinyFont;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string TinyFontName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SmallFont;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string SmallFontName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MediumFont;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string MediumFontName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LargeFont;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string LargeFontName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SubtitleFont;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string SubtitleFontName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Arial7;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LucidaConsole7;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LucidaConsole8;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LucidaConsole10;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LucidaConsole14;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AdditionalFonts;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input array AdditionalFontNames[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private class ConsoleClass;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string ConsoleClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private class GameViewportClientClass;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string GameViewportClientClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private class DataStoreClientClass;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string DataStoreClientClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private class LocalPlayerClass;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string LocalPlayerClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DefaultMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string DefaultMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DefaultDecalMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string DefaultDecalMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DefaultTexture;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string DefaultTextureName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL WireframeMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string WireframeMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL EmissiveTexturedMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string EmissiveTexturedMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL GeomMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string GeomMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DefaultFogVolumeMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string DefaultFogVolumeMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL TickMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string TickMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CrossMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string CrossMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LevelColorationLitMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string LevelColorationLitMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LevelColorationUnlitMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string LevelColorationUnlitMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LightingTexelDensityMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string LightingTexelDensityName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ShadedLevelColorationLitMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string ShadedLevelColorationLitMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ShadedLevelColorationUnlitMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string ShadedLevelColorationUnlitMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RemoveSurfaceMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string RemoveSurfaceMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL VertexColorMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string VertexColorMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL VertexColorViewModeMaterial_ColorOnly;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string VertexColorViewModeMaterialName_ColorOnly[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL VertexColorViewModeMaterial_AlphaAsColor;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string VertexColorViewModeMaterialName_AlphaAsColor[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL VertexColorViewModeMaterial_RedOnly;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string VertexColorViewModeMaterialName_RedOnly[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL VertexColorViewModeMaterial_GreenOnly;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string VertexColorViewModeMaterialName_GreenOnly[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL VertexColorViewModeMaterial_BlueOnly;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string VertexColorViewModeMaterialName_BlueOnly[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL HeatmapMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string HeatmapMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL BoneWeightMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string BoneWeightMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL TangentColorMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string TangentColorMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MobileEmulationMasterMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string MobileEmulationMasterMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ProcBuildingSimpleMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string ProcBuildingSimpleMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL BuildingQuadStaticMesh;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string BuildingQuadStaticMeshName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float ProcBuildingLODColorTexelsPerWorldUnit[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float ProcBuildingLODLightingTexelsPerWorldUnit[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input int MaxProcBuildingLODColorTextureSize[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input int MaxProcBuildingLODLightingTextureSize[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input bool UseProcBuildingLODTextureCropping[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input bool ForcePowerOfTwoProcBuildingLODTextures[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input bool bCombineSimilarMappings[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input bool bRenderLightMapDensityGrayscale[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bUseSound[536870913];
var(*) /*0x46840000-0x00000000*/ private bool bUseBackgroundLevelStreaming[1073807361];
var(*) /*0x46840000-0x00000000*/ private bool bSubtitlesEnabled[1073807361];
var(*) /*0x46840000-0x00000000*/ private bool bSubtitlesForcedOff[1073807361];
var(*) /*0x35EA0000-0x00000000*/ private bool bSmoothFrameRate[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bCheckForMultiplePawnsSpawnedInAFrame[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input bool bShouldGenerateSimpleLightmaps[1073741825];
var(*) /*0x46840000-0x00000000*/ private bool bForceStaticTerrain[1073807361];
var(*) /*0x35EA0000-0x00000000*/ private bool bForceCPUSkinning[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bUsePostProcessEffects[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bOnScreenKismetWarnings[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bEnableKismetLogging[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bAllowMatureLanguage[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input bool bDisablePhysXHardwareSupport[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bPauseOnLossOfFocus[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input bool bCheckParticleRenderSize[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input bool bEnableColorClear[1073872897];
var(*) /*0x35EA0000-0x00000000*/ private bool bAreConstraintsDirty[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasPendingGlobalReattach[536870913];
var(*) /*0x35EA0000-0x00000000*/ private input bool bEnableOnScreenDebugMessages[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bEnableOnScreenDebugMessagesDisplay[536870913];
var(*) /*0x35EA0000-0x00000000*/ private input bool bSuppressMapWarnings[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input bool bCookSeparateSharedMPGameContent[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input bool bUseRecastNavMesh[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bDisableAILogging;
var(*) /*0x35EA0000-0x00000000*/ private input bool bAllowGPUSkinDecals[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input bool bAllowTerrainDecals[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input bool bAllowFluidDecals[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input bool bUseNormalMapsForSimpleLightMaps[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bStartWithMatineeCapture[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bCompressMatineeCapture[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bLockReadOnlyLevels[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bUsePackageNetInfo;
var(*) /*0x35EA0000-0x00000000*/ private bool bLostFocusPause;
var(*) /*0x35EA0000-0x00000000*/ private bool bPlayQueuedTextureMovies;
var(*) /*0x35EA0000-0x00000000*/ private input bool bUseAlternateFaceFXOverwriteBlending[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float MaxRMSDForCombiningMappings[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input int ImageReflectionTextureSize[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input @NULL LightingOnlyBrightness[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input array LightComplexityColors[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input array ShaderComplexityColors[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float MaxPixelShaderAdditiveComplexityCount[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float MinTextureDensity[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float IdealTextureDensity[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float MaxTextureDensity[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float MinLightMapDensity[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float IdealLightMapDensity[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float MaxLightMapDensity[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float RenderLightMapDensityGrayscaleScale[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float RenderLightMapDensityColorScale[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input @NULL LightMapDensityVertexMappedColor[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input @NULL LightMapDensitySelectedColor[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input array StatColorMappings[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL EditorBrushMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string EditorBrushMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DefaultPhysMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string DefaultPhysMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LandscapeHolePhysMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string LandscapeHolePhysMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ApexDamageParams;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string ApexDamageParamsName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL TerrainErrorMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string TerrainErrorMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input int TerrainMaterialMaxTextureCount[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input int TerrainTessellationCheckCount[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float TerrainTessellationCheckDistance[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private class OnlineSubsystemClass;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string DefaultOnlineSubsystemName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DefaultPostProcess;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string DefaultPostProcessName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ThumbnailSkeletalMeshPostProcess;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ThumbnailSkeletalMeshPostProcessName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ThumbnailParticleSystemPostProcess;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ThumbnailParticleSystemPostProcessName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ThumbnailMaterialPostProcess;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ThumbnailMaterialPostProcessName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DefaultUIScenePostProcess;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string DefaultUIScenePostProcessName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DefaultUICaretMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string DefaultUICaretMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SceneCaptureReflectActorMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string SceneCaptureReflectActorMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SceneCaptureCubeActorMaterial;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string SceneCaptureCubeActorMaterialName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ScreenDoorNoiseTexture;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string ScreenDoorNoiseTextureName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ImageGrainNoiseTexture;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string ImageGrainNoiseTextureName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RandomAngleTexture;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string RandomAngleTextureName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RandomNormalTexture;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string RandomNormalTextureName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RandomMirrorDiscTexture;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string RandomMirrorDiscTextureName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL WeightMapPlaceholderTexture;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string WeightMapPlaceholderTextureName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LightMapDensityTexture;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string LightMapDensityTextureName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LightMapDensityNormal;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string LightMapDensityNormalName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DefaultSound;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string DefaultSoundName[1073741825];
var(*) /*0x46840000-0x00000000*/ private float TimeBetweenPurgingPendingKillObjects[1073807361];
var(*) /*0x35EA0000-0x00000000*/ private class KActorFromStaticSpawnClass;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string KActorFromStaticSpawnClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string DLCName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SPTuneDataEventsFXPawnAsset;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string SPTuneDataEvents_FXPawnAssetName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SPTuneDataEventsFXWeaponAsset;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string SPTuneDataEvents_FXWeaponAssetName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SPTuneDataEventsSoundPawnAsset;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string SPTuneDataEvents_SoundPawnAssetName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SPTuneDataEventsSoundWeaponAsset;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string SPTuneDataEvents_SoundWeaponAssetName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SPTuneDataEventsSoundPartsInventory;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string SPTuneDataEvents_SoundPartsInventoryAssetName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SPTuneDataEventsFXPartsInventory;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string SPTuneDataEvents_FXPartsInventoryAssetName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SPTuneDataEventsSoundProjectileAsset;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string SPTuneDataEvents_SoundProjectileAssetName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SPTuneDataEventsFXProjectileAsset;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string SPTuneDataEvents_FXProjectileAssetName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SPTuneDataGameflowAsset;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string SPTuneData_GameflowAssetName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SPTuneDataEventsFaceFXStatesAsset;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string SPTuneDataEvents_FaceFXStatesAssetName[1073741825];
var(*) /*0x46840000-0x00000000*/ private float DefaultSweepPhaseTimeAllotment[1073807361];
var(*) /*0x46840000-0x00000000*/ private int MemoryLeftWhereWeForceMarkPhase[1073807361];
var(*) /*0x46840000-0x00000000*/ private int MemoryLeftWhereWeReenableForceMarkPhase[1073807361];
var(*) /*0x46840000-0x00000000*/ private int MemoryLeftWhereWeForceFullSweepPhase[1073807361];
var(*) /*0x46840000-0x00000000*/ private int MemoryLeftWhereWeForceLongerSweepPhaseTime[1073807361];
var(*) /*0x46840000-0x00000000*/ private float LongerSweepPhaseTimeAllotment[1073807361];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Client[131073];
var(*) /*0x35EA0000-0x00000010*/ private editfixedsize array GamePlayers;
var(*) /*0x35EA0000-0x00000000*/ private @NULL GameViewport[131073];
var(*) /*0x35EA0000-0x00000010*/ private editfixedsize array DeferredCommands;
var(*) /*0x35EA0000-0x00000000*/ private int TickCycles;
var(*) /*0x35EA0000-0x00000000*/ private int GameCycles;
var(*) /*0x35EA0000-0x00000000*/ private int ClientCycles;
var(*) /*0x35EA0000-0x00000000*/ private float MaxSmoothedFrameRate[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float MinSmoothedFrameRate[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int NumPawnsAllowedToBeSpawnedInAFrame[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RemoteControlExec[268435457];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MobileMaterialEmulator[268435457];
var(*) /*0x13980000-0x00000000*/ private @NULL C_WorldBox[65537];
var(*) /*0x13980000-0x00000000*/ private @NULL C_BrushWire[65537];
var(*) /*0x13980000-0x00000000*/ private @NULL C_AddWire[65537];
var(*) /*0x13980000-0x00000000*/ private @NULL C_SubtractWire[65537];
var(*) /*0x13980000-0x00000000*/ private @NULL C_SemiSolidWire[65537];
var(*) /*0x13980000-0x00000000*/ private @NULL C_NonSolidWire[65537];
var(*) /*0x13980000-0x00000000*/ private @NULL C_WireBackground[65537];
var(*) /*0x13980000-0x00000000*/ private @NULL C_ScaleBoxHi[65537];
var(*) /*0x13980000-0x00000000*/ private @NULL C_VolumeCollision[65537];
var(*) /*0x13980000-0x00000000*/ private @NULL C_BSPCollision[65537];
var(*) /*0x13980000-0x00000000*/ private @NULL C_OrthoBackground[65537];
var(*) /*0x13980000-0x00000000*/ private @NULL C_Volume[65537];
var(*) /*0x13980000-0x00000000*/ private @NULL C_BrushShape[65537];
var(*) /*0x46840000-0x00000000*/ private float StreamingDistanceFactor[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ScoutClassName[1073872897];
var(*) /*0x35EA0000-0x00000000*/ private byte TransitionType;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string TransitionDescription;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string TransitionGameType;
var(*) /*0x35EA0000-0x00000000*/ private float MeshLODRange[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float CameraRotationThreshold[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float CameraTranslationThreshold[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float PrimitiveProbablyVisibleTime[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float PercentUnoccludedRequeries[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float MaxOcclusionPixelsFraction[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int MaxFluidNumVerts[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float FluidSimulationTimeLimit[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int MaxParticleResize[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int MaxParticleResizeWarn[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int MaxParticleVertexMemory[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int MaxParticleSpriteCount[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int MaxParticleSubUVCount[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int BeginUPTryCount[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PendingDroppedNotes[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string DynamicCoverMeshComponentName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float NetClientTicksPerSecond[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float MaxTrackedOcclusionIncrement[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float TrackedOcclusionStepSize[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input @NULL DefaultSelectedMaterialColor[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input @NULL DefaultHoveredMaterialColor[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SelectedMaterialColor[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL UnselectedMaterialColor[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input array IgnoreSimulatedFuncWarnings[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int ScreenSaverInhibitorSemaphore[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ScreenSaverInhibitor[536870913];
var(*) /*0x35EA0000-0x00000000*/ private input float SPScreenAdjustmentSettings_Gamma[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float SPScreenAdjustmentSettings_Brightness[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL GlobalTranslationContext;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LoadingMovieStartTime[537001985];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string MatineeCaptureName[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string MatineePackageCaptureName[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string VisibleLevelsForMatineeCapture[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int MatineeCaptureFPS[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int MatineeCaptureType[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input array PerMapLoadingMovies[1073741825];

// Export UEngine::execIsEditor(FFrame&, void* const)
native static final function IsEditor()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UEngine::execIsGame(FFrame&, void* const)
native static final function IsGame()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UEngine::execGetCurrentWorldInfo(FFrame&, void* const)
native static final function GetCurrentWorldInfo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UEngine::execGetBuildDate(FFrame&, void* const)
native static final function GetBuildDate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UEngine::execGetDeviceUUID(FFrame&, void* const)
native static final function GetDeviceUUID()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UEngine::execGetOSVersion(FFrame&, void* const)
native static final function GetOSVersion()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UEngine::execGetDevicePushNotificationToken(FFrame&, void* const)
native static final function GetDevicePushNotificationToken()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UEngine::execHasNetworkConnection(FFrame&, void* const)
native static final function HasNetworkConnection()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UEngine::execGetTinyFont(FFrame&, void* const)
native static final function GetTinyFont()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UEngine::execGetSmallFont(FFrame&, void* const)
native static final function GetSmallFont()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UEngine::execGetMediumFont(FFrame&, void* const)
native static final function GetMediumFont()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UEngine::execGetLargeFont(FFrame&, void* const)
native static final function GetLargeFont()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UEngine::execGetSubtitleFont(FFrame&, void* const)
native static final function GetSubtitleFont()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UEngine::execGetAdditionalFont(FFrame&, void* const)
native static final function GetAdditionalFont()
{
    local /*0x35EA0000-0x00000000*/ private int AdditionalFontIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UEngine::execIsSplitScreen(FFrame&, void* const)
native static final function IsSplitScreen()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UEngine::execIsStereoscopic3D(FFrame&, void* const)
native static final function IsStereoscopic3D()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UEngine::execIsUsingES2Renderer(FFrame&, void* const)
native static final function IsUsingES2Renderer()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UEngine::execGetAudioDevice(FFrame&, void* const)
native static final function GetAudioDevice()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UEngine::execGetAkAudioDevice(FFrame&, void* const)
native static final function GetAkAudioDevice()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UEngine::execGetLastMovieName(FFrame&, void* const)
native static final function GetLastMovieName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UEngine::execPlayLoadMapMovie(FFrame&, void* const)
native static final function PlayLoadMapMovie()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UEngine::execStopMovie(FFrame&, void* const)
native static final function StopMovie()
{
    local /*0x35EA0000-0x00000000*/ private bool bDelayStopUntilGameHasRendered[8388609];


}

// Export UEngine::execRemoveAllOverlays(FFrame&, void* const)
native static final function RemoveAllOverlays();

// Export UEngine::execAddOverlay(FFrame&, void* const)
native static final function AddOverlay()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Font[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Text[8388609];
    local /*0x35EA0000-0x00000000*/ private float X[8388609], Y, ScaleX, ScaleY;
    local /*0x35EA0000-0x00000000*/ private bool bIsCentered[8388609];


}

// Export UEngine::execAddOverlayWrapped(FFrame&, void* const)
native static final function AddOverlayWrapped()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Font[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Text[8388609];
    local /*0x35EA0000-0x00000000*/ private float X[8388609], Y, ScaleX, ScaleY, WrapWidth;


}

// Export UEngine::execIsRealDStereoEnabled(FFrame&, void* const)
native static final function IsRealDStereoEnabled()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UEngine::execGetEngine(FFrame&, void* const)
native static final function GetEngine()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UEngine::execGetDefaultPostProcessChain(FFrame&, void* const)
native static final function GetDefaultPostProcessChain()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UEngine::execGetWorldPostProcessChain(FFrame&, void* const)
native static final function GetWorldPostProcessChain()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UEngine::execAddTextureStreamingSlaveLoc(FFrame&, void* const)
native final function AddTextureStreamingSlaveLoc()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InLoc[8388609];
    local /*0x35EA0000-0x00000000*/ private float BoostFactor[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bOverrideLocation[8388609];
    local /*0x35EA0000-0x00000000*/ private float OverrideDuration[8388609];


}

// Export UEngine::execBasicSaveObject(FFrame&, void* const)
native static final function BasicSaveObject()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Obj[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string PathName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIsSaveGame[8388609];
    local /*0x35EA0000-0x00000000*/ private int Version[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bEncrypt[9437185], ReturnValue;

    false                            
}

// Export UEngine::execBasicLoadObject(FFrame&, void* const)
native static final function BasicLoadObject()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Obj[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string PathName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIsSaveGame[8388609];
    local /*0x35EA0000-0x00000000*/ private int Version[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UEngine::execLaunchURL(FFrame&, void* const)
native static final function LaunchURL()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[8388609];


}

// Export UEngine::execIsRenderingScreenShot(FFrame&, void* const)
native static final function IsRenderingScreenShot()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UEngine::execIsDumpingMovie(FFrame&, void* const)
native static final function IsDumpingMovie()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UEngine::execGetCurrentLoadingMovie(FFrame&, void* const)
native static function GetCurrentLoadingMovie()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UEngine::execPlayPerMapLoadingMovie(FFrame&, void* const)
native static function PlayPerMapLoadingMovie()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ForMapName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bForce[9437185], ReturnValue;

    false                
}

defaultproperties
{
    TinyFontName="EngineFonts.TinyFont"
    SmallFontName="EngineFonts.SmallFont"
    MediumFontName="EngineFonts.SmallFont"
    LargeFontName="EngineFonts.SmallFont"
    SubtitleFontName="LPFontsWIN.SubtitleMultifont"
    ConsoleClassName="Engine.Console"
    GameViewportClientClassName="LostPlanetGame.LPGameViewportClient"
    DataStoreClientClassName="Engine.DataStoreClient"
    LocalPlayerClassName="Engine.LocalPlayer"
    DefaultMaterialName="EngineMaterials.DefaultMaterial"
    DefaultDecalMaterialName="EngineMaterials.DefaultDecalMaterial"
    DefaultTextureName="EngineMaterials.DefaultDiffuse"
    WireframeMaterialName="EngineDebugMaterials.WireframeMaterial"
    EmissiveTexturedMaterialName="EngineMaterials.EmissiveTexturedMaterial"
    GeomMaterialName="EngineDebugMaterials.GeomMaterial"
    DefaultFogVolumeMaterialName="EngineMaterials.FogVolumeMaterial"
    TickMaterialName="EditorMaterials.Tick_Mat"
    CrossMaterialName="EditorMaterials.Cross_Mat"
    LevelColorationLitMaterialName="EngineDebugMaterials.LevelColorationLitMaterial"
    LevelColorationUnlitMaterialName="EngineDebugMaterials.LevelColorationUnlitMaterial"
    LightingTexelDensityName="EngineDebugMaterials.MAT_LevelColorationLitLightmapUVs"
    ShadedLevelColorationLitMaterialName="EngineDebugMaterials.ShadedLevelColorationLitMaterial"
    ShadedLevelColorationUnlitMaterialName="EngineDebugMaterials.ShadedLevelColorationUnlitMaterial"
    RemoveSurfaceMaterialName="EngineMaterials.RemoveSurfaceMaterial"
    VertexColorMaterialName="EngineDebugMaterials.VertexColorMaterial"
    VertexColorViewModeMaterialName_ColorOnly="EngineDebugMaterials.VertexColorViewMode_ColorOnly"
    VertexColorViewModeMaterialName_AlphaAsColor="EngineDebugMaterials.VertexColorViewMode_AlphaAsColor"
    VertexColorViewModeMaterialName_RedOnly="EngineDebugMaterials.VertexColorViewMode_RedOnly"
    VertexColorViewModeMaterialName_GreenOnly="EngineDebugMaterials.VertexColorViewMode_GreenOnly"
    VertexColorViewModeMaterialName_BlueOnly="EngineDebugMaterials.VertexColorViewMode_BlueOnly"
    HeatmapMaterialName="EngineDebugMaterials.HeatmapMaterial"
    BoneWeightMaterialName="EngineDebugMaterials.BoneWeightMaterial"
    TangentColorMaterialName="EngineDebugMaterials.TangentColorMaterial"
    MobileEmulationMasterMaterialName="MobileEngineMaterials.MobileMasterMaterial"
    ProcBuildingSimpleMaterialName="EngineBuildings.ProcBuildingSimpleMaterial"
    BuildingQuadStaticMeshName="EngineBuildings.BuildingQuadMesh"
    ProcBuildingLODColorTexelsPerWorldUnit=0.0750000
    ProcBuildingLODLightingTexelsPerWorldUnit=0.0150000
    MaxProcBuildingLODColorTextureSize=1024
    MaxProcBuildingLODLightingTextureSize=256
    UseProcBuildingLODTextureCropping=true
    ForcePowerOfTwoProcBuildingLODTextures=true
    bUseSound=true
    bUseBackgroundLevelStreaming=true
    bSubtitlesEnabled=true
    bSmoothFrameRate=true
    bShouldGenerateSimpleLightmaps=true
    bEnableKismetLogging=true
    bAllowMatureLanguage=true
    bDisablePhysXHardwareSupport=true
    bPauseOnLossOfFocus=true
    bCheckParticleRenderSize=true
    bEnableColorClear=true
    bEnableOnScreenDebugMessages=true
    bCookSeparateSharedMPGameContent=true
    bUseRecastNavMesh=true
    bAllowGPUSkinDecals=true
    bAllowTerrainDecals=true
    bAllowFluidDecals=true
    bUseNormalMapsForSimpleLightMaps=true
    bUsePackageNetInfo=true
    bUseAlternateFaceFXOverwriteBlending=true
    MaxRMSDForCombiningMappings=6.0000000
    ImageReflectionTextureSize=1024
    LightingOnlyBrightness=(R=0.3000000,G=0.3000000,B=0.3000000,A=1.0000000)
    LightComplexityColors=/* Array type was not detected. */
    ShaderComplexityColors=/* Array type was not detected. */
    MaxPixelShaderAdditiveComplexityCount=900.0000000
    IdealTextureDensity=13.0000000
    MaxTextureDensity=55.0000000
    IdealLightMapDensity=0.0500000
    MaxLightMapDensity=0.2000000
    RenderLightMapDensityGrayscaleScale=1.0000000
    RenderLightMapDensityColorScale=1.0000000
    LightMapDensityVertexMappedColor=(R=0.6500000,G=0.6500000,B=0.2500000,A=1.0000000)
    LightMapDensitySelectedColor=(R=1.0000000,G=0.2000000,B=1.0000000,A=1.0000000)
    StatColorMappings=/* Array type was not detected. */
    EditorBrushMaterialName="EngineMaterials.EditorBrushMaterial"
    DefaultPhysMaterialName="GLO_PHY_Mat_AlwaysLoaded.PhysMat_Default"
    LandscapeHolePhysMaterialName="EngineMaterials.LandscapeHolePhysicalMaterial"
    TerrainErrorMaterialName="EngineDebugMaterials.MaterialError_Mat"
    TerrainMaterialMaxTextureCount=16
    TerrainTessellationCheckCount=6
    TerrainTessellationCheckDistance=4096.0000000
    DefaultOnlineSubsystemName="OnlineSubsystemSteamworks.OnlineSubsystemSteamworks"
    DefaultPostProcessName="FX_PostProcess.LPDefaultScenePostProcess"
    ThumbnailSkeletalMeshPostProcessName="EngineMaterials.DefaultThumbnailPostProcess"
    ThumbnailParticleSystemPostProcessName="EngineMaterials.DefaultThumbnailPostProcess"
    ThumbnailMaterialPostProcessName="EngineMaterials.DefaultThumbnailPostProcess"
    DefaultUIScenePostProcessName="FX_PostProcess.LPDefaultUIScenePostProcess"
    DefaultUICaretMaterialName="EngineMaterials.BlinkingCaret"
    SceneCaptureReflectActorMaterialName="EngineMaterials.ScreenMaterial"
    SceneCaptureCubeActorMaterialName="EngineMaterials.CubeMaterial"
    ScreenDoorNoiseTextureName="EngineMaterials.Good64x64TilingNoiseHighFreq"
    ImageGrainNoiseTextureName="EngineMaterials.Good64x64TilingNoiseHighFreq"
    RandomAngleTextureName="EngineMaterials.RandomAngles"
    RandomNormalTextureName="EngineMaterials.RandomNormal2"
    RandomMirrorDiscTextureName="EngineMaterials.RandomMirrorDisc"
    WeightMapPlaceholderTextureName="EngineMaterials.WeightMapPlaceholderTexture"
    LightMapDensityTextureName="EngineMaterials.DefaultWhiteGrid"
    LightMapDensityNormalName="EngineMaterials.DefaultNormal"
    DefaultSoundName="EngineSounds.WhiteNoise"
    TimeBetweenPurgingPendingKillObjects=30.0000000
    KActorFromStaticSpawnClassName="LostPlanetGame.LPKActorFromStatic"
    SPTuneDataEvents_FXPawnAssetName="TuneData_FXEvents_ONLY.TuneData_FXPawnEvents"
    SPTuneDataEvents_FXWeaponAssetName="TuneData_FXEvents_ONLY.TuneData_FXWeaponEvents"
    SPTuneDataEvents_SoundPawnAssetName="TuneData_SNDEvents_ONLY.TuneData_SoundPawnEvents"
    SPTuneDataEvents_SoundWeaponAssetName="TuneData_SNDEvents_ONLY.TuneData_SoundWeaponEvents"
    SPTuneDataEvents_SoundPartsInventoryAssetName="TuneData_SNDEvents_ONLY.TuneData_SoundPartsInventoryEvent"
    SPTuneDataEvents_FXPartsInventoryAssetName="TuneData_FXEvents_ONLY.TuneData_FXPartsInventoryEvents"
    SPTuneDataEvents_SoundProjectileAssetName="TuneData_SNDEvents_ONLY.TuneData_SoundProjectileEvents"
    SPTuneDataEvents_FXProjectileAssetName="TuneData_FXEvents_ONLY.TuneData_FXProjectileEvents"
    SPTuneData_GameflowAssetName="TuneData_Gameflow.Game"
    SPTuneDataEvents_FaceFXStatesAssetName="FaceFXStates_Defs_ONLY.Definitions.TuneData_FaceFXState_Definitions"
    MaxSmoothedFrameRate=62.0000000
    MinSmoothedFrameRate=22.0000000
    NumPawnsAllowedToBeSpawnedInAFrame=2
    C_WorldBox=(R=0,G=0,B=40,A=255)
    C_BrushWire=(R=192,G=0,B=0,A=255)
    C_AddWire=(R=127,G=127,B=255,A=255)
    C_SubtractWire=(R=255,G=192,B=63,A=255)
    C_SemiSolidWire=(R=127,G=255,B=0,A=255)
    C_NonSolidWire=(R=63,G=192,B=32,A=255)
    C_WireBackground=(R=0,G=0,B=0,A=255)
    C_ScaleBoxHi=(R=223,G=149,B=157,A=255)
    C_VolumeCollision=(R=149,G=223,B=157,A=255)
    C_BSPCollision=(R=149,G=157,B=223,A=255)
    C_OrthoBackground=(R=163,G=163,B=163,A=255)
    C_Volume=(R=255,G=196,B=255,A=255)
    C_BrushShape=(R=128,G=255,B=128,A=255)
    ScoutClassName="LostPlanetGame.LPScout"
    CameraRotationThreshold=45.0000000
    CameraTranslationThreshold=10000.0000000
    PrimitiveProbablyVisibleTime=8.0000000
    PercentUnoccludedRequeries=0.1250000
    MaxOcclusionPixelsFraction=0.1000000
    MaxFluidNumVerts=1048576
    FluidSimulationTimeLimit=30.0000000
    MaxParticleVertexMemory=131972
    BeginUPTryCount=200000
    NetClientTicksPerSecond=120.0000000
    MaxTrackedOcclusionIncrement=0.1000000
    TrackedOcclusionStepSize=0.1000000
    DefaultSelectedMaterialColor=(R=0.0400000,G=0.0200000,B=0.2400000,A=1.0000000)
    DefaultHoveredMaterialColor=(R=0.0200000,G=0.0200000,B=0.0200000,A=1.0000000)
    SelectedMaterialColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
    UnselectedMaterialColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
    IgnoreSimulatedFuncWarnings=/* Array type was not detected. */
    PerMapLoadingMovies=/* Array type was not detected. */
}