class MaterialInterface extends Surface
    abstract
    forcescriptorder(true);

enum EMaterialUsage
{
    MATUSAGE_SkeletalMesh,          // 0
    MATUSAGE_FracturedMeshes,       // 1
    MATUSAGE_ParticleSprites,       // 2
    MATUSAGE_BeamTrails,            // 3
    MATUSAGE_ParticleSubUV,         // 4
    MATUSAGE_SpeedTree,             // 5
    MATUSAGE_StaticLighting,        // 6
    MATUSAGE_GammaCorrection,       // 7
    MATUSAGE_LensFlare,             // 8
    MATUSAGE_InstancedMeshParticles,// 9
    MATUSAGE_FluidSurface,          // 10
    MATUSAGE_Decals,                // 11
    MATUSAGE_MaterialEffect,        // 12
    MATUSAGE_MorphTargets,          // 13
    MATUSAGE_FogVolumes,            // 14
    MATUSAGE_WeaponTrails,          // 15
    MATUSAGE_RadialBlur,            // 16
    MATUSAGE_InstancedMeshes,       // 17
    MATUSAGE_SplineMesh,            // 18
    MATUSAGE_ScreenDoorFade,        // 19
    MATUSAGE_APEXMesh,              // 20
    MATUSAGE_Terrain,               // 21
    MATUSAGE_Landscape,             // 22
    MATUSAGE_MAX                    // 23
};

struct native LightmassMaterialInterfaceSettings
{
    var(*) /*0x30850000-0x00000000*/ private bool bCastShadowAsMasked[65537];
    var(*) /*0x30850000-0x00000000*/ private float EmissiveBoost[65537];
    var(*) /*0x30850000-0x00000000*/ private float DiffuseBoost[65537];
    var(*) /*0x35EA0000-0x00000000*/ private float SpecularBoost;
    var(*) /*0x30850000-0x00000000*/ private float ExportResolutionScale[65537];
    var(*) /*0x30850000-0x00000000*/ private float DistanceFieldPenumbraScale[65537];
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverrideCastShadowAsMasked;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverrideEmissiveBoost;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverrideDiffuseBoost;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverrideSpecularBoost;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverrideExportResolutionScale;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverrideDistanceFieldPenumbraScale;

    structdefaultproperties
    {
        bCastShadowAsMasked=false
        EmissiveBoost=1.0000000
        DiffuseBoost=1.0000000
        SpecularBoost=1.0000000
        ExportResolutionScale=1.0000000
        DistanceFieldPenumbraScale=1.0000000
        bOverrideCastShadowAsMasked=false
        bOverrideEmissiveBoost=false
        bOverrideDiffuseBoost=false
        bOverrideSpecularBoost=false
        bOverrideExportResolutionScale=false
        bOverrideDistanceFieldPenumbraScale=false
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL ParentRefFence[805437441];
var(*) /*0x2ECC0000-0x00000000*/ private @NULL LightmassSettings[65537];
var(*) /*0x31110000-0x00000000*/ private editfixedsize string PreviewMesh[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LightingGuid[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasQualitySwitch[131073];
var(*) /*0x32E40000-0x00000000*/ private bool bAutoFlattenMobile[65537];
var(*) /*0x32E40000-0x00000000*/ private bool bAutoFlattenMobileNormalTexture[65537];
var(*) /*0x32E40000-0x00000000*/ private bool bMobileAllowFog[65537];
var(*) /*0x32EA0000-0x00000000*/ private bool bGenerateSubUV[65537];
var(*) /*0x32ED0000-0x00000000*/ private bool bUseMobileSpecular[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient bool bUseMobileVertexSpecular;
var(*) /*0x32ED0000-0x00000000*/ private bool bUseMobilePixelSpecular[65537];
var(*) /*0x32E50000-0x00000000*/ private bool bUseMobileBumpOffset[65537];
var(*) /*0x32EE0000-0x00000000*/ private bool bLockColorBlending[65537];
var(*) /*0x32E60000-0x00000000*/ private bool bUseMobileUniformColorMultiply[65537];
var(*) /*0x32E60000-0x00000000*/ private bool bUseMobileVertexColorMultiply[65537];
var(*) /*0x32E60000-0x00000000*/ private bool bUseMobileDetailNormal[65537];
var(*) /*0x32EF0000-0x00000000*/ private bool bBaseTextureTransformed[65537];
var(*) /*0x32EF0000-0x00000000*/ private bool bEmissiveTextureTransformed[65537];
var(*) /*0x32EF0000-0x00000000*/ private bool bNormalTextureTransformed[65537];
var(*) /*0x32EF0000-0x00000000*/ private bool bMaskTextureTransformed[65537];
var(*) /*0x32EF0000-0x00000000*/ private bool bDetailTextureTransformed[65537];
var(*) /*0x32F00000-0x00000000*/ private bool bUseMobileWaveVertexMovement[65537];
var(*) /*0x32E90000-0x00000000*/ private bool bMobileEnableBounceLight[65537];
var(*) /*0x32E40000-0x00000000*/ private @NULL FlattenBackgroundColor[65537];
var(*) /*0x32E40000-0x00000000*/ private @NULL MobileBaseTexture[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient @NULL FlattenedTexture;
var(*) /*0x32E40000-0x00000000*/ private byte MobileBaseTextureTexCoordsSource[65537];
var(*) /*0x32E40000-0x00000000*/ private byte MobileAmbientOcclusionSource[65537];
var(*) /*0x32ED0000-0x00000000*/ private byte MobileSpecularMask[65537];
var(*) /*0x32E70000-0x00000000*/ private byte MobileEmissiveColorSource[65537];
var(*) /*0x32E70000-0x00000000*/ private byte MobileEmissiveMaskSource[65537];
var(*) /*0x32E80000-0x00000000*/ private byte MobileEnvironmentMaskSource[65537];
var(*) /*0x32E80000-0x00000000*/ private byte MobileEnvironmentBlendMode[65537];
var(*) /*0x32EC0000-0x00000000*/ private byte MobileRimLightingMaskSource[65537];
var(*) /*0x32EB0000-0x00000000*/ private byte MobileMaskTextureTexCoordsSource[65537];
var(*) /*0x32EB0000-0x00000000*/ private byte MobileAlphaValueSource[65537];
var(*) /*0x32EE0000-0x00000000*/ private byte MobileDetailTextureTexCoordsSource[65537];
var(*) /*0x32EE0000-0x00000000*/ private byte MobileTextureBlendFactorSource[65537];
var(*) /*0x32E60000-0x00000000*/ private byte MobileColorMultiplySource[65537];
var(*) /*0x32E40000-0x00000000*/ private @NULL MobileNormalTexture[65537];
var(*) /*0x32EA0000-0x00000000*/ private float SubUVFrameRate[65537];
var(*) /*0x32EA0000-0x00000000*/ private int SubUVFrameCountAlongAxes[65537];
var(*) /*0x32EA0000-0x00000000*/ private float SubUVFrameSize[65537];
var(*) /*0x32ED0000-0x00000000*/ private @NULL MobileSpecularColor[65537];
var(*) /*0x32ED0000-0x00000000*/ private float MobileSpecularPower[65537];
var(*) /*0x32E70000-0x00000000*/ private @NULL MobileEmissiveTexture[65537];
var(*) /*0x32E70000-0x00000000*/ private @NULL MobileEmissiveColor[65537];
var(*) /*0x32E80000-0x00000000*/ private @NULL MobileEnvironmentTexture[65537];
var(*) /*0x32E80000-0x00000000*/ private float MobileEnvironmentAmount[65537];
var(*) /*0x32E80000-0x00000000*/ private @NULL MobileEnvironmentColor[65537];
var(*) /*0x32E80000-0x00000000*/ private float MobileEnvironmentFresnelAmount[65537];
var(*) /*0x32E80000-0x00000000*/ private float MobileEnvironmentFresnelExponent[65537];
var(*) /*0x32EC0000-0x00000000*/ private float MobileRimLightingStrength[65537];
var(*) /*0x32EC0000-0x00000000*/ private float MobileRimLightingExponent[65537];
var(*) /*0x32EC0000-0x00000000*/ private @NULL MobileRimLightingColor[65537];
var(*) /*0x32E50000-0x00000000*/ private float MobileBumpOffsetReferencePlane[65537];
var(*) /*0x32E50000-0x00000000*/ private float MobileBumpOffsetHeightRatio[65537];
var(*) /*0x32EB0000-0x00000000*/ private @NULL MobileMaskTexture[65537];
var(*) /*0x32EB0000-0x00000000*/ private float MobileOpacityMultiplier[65537];
var(*) /*0x32EE0000-0x00000000*/ private @NULL MobileDetailTexture[65537];
var(*) /*0x32EE0000-0x00000000*/ private @NULL MobileDetailTexture2[65537];
var(*) /*0x32EE0000-0x00000000*/ private @NULL MobileDetailTexture3[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient @NULL DefaultUniformColor;
var(*) /*0x32E60000-0x00000000*/ private @NULL MobileDefaultUniformColor[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient float TransformCenterX;
var(*) /*0x32EF0000-0x00000000*/ private float MobileTransformCenterX[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient float TransformCenterY;
var(*) /*0x32EF0000-0x00000000*/ private float MobileTransformCenterY[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient float PannerSpeedX;
var(*) /*0x32EF0000-0x00000000*/ private float MobilePannerSpeedX[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient float PannerSpeedY;
var(*) /*0x32EF0000-0x00000000*/ private float MobilePannerSpeedY[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient float RotateSpeed;
var(*) /*0x32EF0000-0x00000000*/ private float MobileRotateSpeed[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient float FixedScaleX;
var(*) /*0x32EF0000-0x00000000*/ private float MobileFixedScaleX[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient float FixedScaleY;
var(*) /*0x32EF0000-0x00000000*/ private float MobileFixedScaleY[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient float SineScaleX;
var(*) /*0x32EF0000-0x00000000*/ private float MobileSineScaleX[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient float SineScaleY;
var(*) /*0x32EF0000-0x00000000*/ private float MobileSineScaleY[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient float SineScaleFrequencyMultipler;
var(*) /*0x32EF0000-0x00000000*/ private float MobileSineScaleFrequencyMultipler[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient float FixedOffsetX;
var(*) /*0x32EF0000-0x00000000*/ private float MobileFixedOffsetX[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient float FixedOffsetY;
var(*) /*0x32EF0000-0x00000000*/ private float MobileFixedOffsetY[65537];
var(*) /*0x32F00000-0x00000000*/ private float MobileTangentVertexFrequencyMultiplier[65537];
var(*) /*0x32F00000-0x00000000*/ private float MobileVerticalFrequencyMultiplier[65537];
var(*) /*0x32F00000-0x00000000*/ private float MobileMaxVertexMovementAmplitude[65537];
var(*) /*0x32F00000-0x00000000*/ private float MobileSwayFrequencyMultiplier[65537];
var(*) /*0x32F00000-0x00000000*/ private float MobileSwayMaxAngle[65537];
var(*) /*0x32E90000-0x00000000*/ private @NULL MobileDirectionalLightDirection[65537];
var(*) /*0x32E90000-0x00000000*/ private float MobileDirectionalLightBrightness[65537];
var(*) /*0x32E90000-0x00000000*/ private @NULL MobileDirectionalLightColor[65537];
var(*) /*0x32E90000-0x00000000*/ private @NULL MobileBounceLightDirection[65537];
var(*) /*0x32E90000-0x00000000*/ private float MobileBounceLightBrightness[65537];
var(*) /*0x32E90000-0x00000000*/ private @NULL MobileBounceLightColor[65537];
var(*) /*0x32E90000-0x00000000*/ private float MobileSkyLightBrightness[65537];
var(*) /*0x32E90000-0x00000000*/ private @NULL MobileSkyLightColor[65537];

// Export UMaterialInterface::execGetMaterial(FFrame&, void* const)
native final function GetMaterial()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UMaterialInterface::execGetPhysicalMaterial(FFrame&, void* const)
native final function GetPhysicalMaterial()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UMaterialInterface::execGetParameterDesc(FFrame&, void* const)
native function GetParameterDesc()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string OutDesc[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMaterialInterface::execGetFontParameterValue(FFrame&, void* const)
native function GetFontParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OutFontValue[25165825];
    local /*0x35EA0000-0x00000000*/ private int OutFontPage[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMaterialInterface::execGetScalarParameterValue(FFrame&, void* const)
native function GetScalarParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private float OutValue[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMaterialInterface::execGetScalarCurveParameterValue(FFrame&, void* const)
native function GetScalarCurveParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL OutValue[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMaterialInterface::execGetTextureParameterValue(FFrame&, void* const)
native function GetTextureParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OutValue[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMaterialInterface::execGetVectorParameterValue(FFrame&, void* const)
native function GetVectorParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OutValue[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMaterialInterface::execGetVectorCurveParameterValue(FFrame&, void* const)
native function GetVectorCurveParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL OutValue[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMaterialInterface::execGetLinearColorParameterValue(FFrame&, void* const)
native function GetLinearColorParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OutValue[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMaterialInterface::execGetLinearColorCurveParameterValue(FFrame&, void* const)
native function GetLinearColorCurveParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL OutValue[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMaterialInterface::execGetGroupName(FFrame&, void* const)
native function GetGroupName()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609], GroupName;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMaterialInterface::execGetMobileScalarParameterValue(FFrame&, void* const)
native function GetMobileScalarParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private float OutValue[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMaterialInterface::execGetMobileTextureParameterValue(FFrame&, void* const)
native function GetMobileTextureParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OutValue[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMaterialInterface::execGetMobileVectorParameterValue(FFrame&, void* const)
native function GetMobileVectorParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OutValue[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMaterialInterface::execSetForceMipLevelsToBeResident(FFrame&, void* const)
native function SetForceMipLevelsToBeResident()
{
    local /*0x35EA0000-0x00000000*/ private bool OverrideForceMiplevelsToBeResident[8388609], bForceMiplevelsToBeResidentValue;
    local /*0x35EA0000-0x00000000*/ private float ForceDuration[8388609];
    local /*0x35EA0000-0x00000000*/ private int CinematicTextureGroups[9437185];

    0                        
}

defaultproperties
{
    LightmassSettings=(bCastShadowAsMasked=false,EmissiveBoost=1.0000000,DiffuseBoost=1.0000000,SpecularBoost=1.0000000,ExportResolutionScale=1.0000000,DistanceFieldPenumbraScale=1.0000000,bOverrideCastShadowAsMasked=false,bOverrideEmissiveBoost=false,bOverrideDiffuseBoost=false,bOverrideSpecularBoost=false,bOverrideExportResolutionScale=false,bOverrideDistanceFieldPenumbraScale=false)
    bMobileAllowFog=true
    FlattenBackgroundColor=(R=0,G=0,B=0,A=255)
    MobileDetailTextureTexCoordsSource=EMobileTexCoordsSource.MTCS_TexCoords1
    MobileSpecularColor=(R=1.0000000,G=1.0000000,B=1.0000000,A=1.0000000)
    MobileSpecularPower=16.0000000
    MobileEmissiveColor=(R=1.0000000,G=1.0000000,B=1.0000000,A=1.0000000)
    MobileEnvironmentAmount=1.0000000
    MobileEnvironmentColor=(R=1.0000000,G=1.0000000,B=1.0000000,A=1.0000000)
    MobileEnvironmentFresnelExponent=1.0000000
    MobileRimLightingExponent=2.0000000
    MobileRimLightingColor=(R=1.0000000,G=1.0000000,B=1.0000000,A=1.0000000)
    MobileBumpOffsetReferencePlane=0.5000000
    MobileBumpOffsetHeightRatio=0.0500000
    MobileOpacityMultiplier=1.0000000
    MobileDefaultUniformColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
    MobileTransformCenterX=0.5000000
    MobileTransformCenterY=0.5000000
    MobileFixedScaleX=1.0000000
    MobileFixedScaleY=1.0000000
    MobileSineScaleFrequencyMultipler=1.0000000
    MobileTangentVertexFrequencyMultiplier=0.1250000
    MobileVerticalFrequencyMultiplier=0.1000000
    MobileMaxVertexMovementAmplitude=5.0000000
    MobileSwayFrequencyMultiplier=0.0700000
    MobileSwayMaxAngle=2.0000000
    MobileDirectionalLightDirection=(X=0.0000000,Y=-45.0000000,Z=45.0000000)
    MobileDirectionalLightBrightness=2.0000000
    MobileDirectionalLightColor=(R=255,G=255,B=255,A=0)
    MobileBounceLightDirection=(X=0.0000000,Y=45.0000000,Z=-27.5000000)
    MobileBounceLightBrightness=0.2500000
    MobileBounceLightColor=(R=255,G=255,B=255,A=0)
    MobileSkyLightBrightness=0.2500000
    MobileSkyLightColor=(R=255,G=255,B=255,A=0)
}