class Material extends MaterialInterface
    hidecategories(Object);

enum ESPMaterialArgType
{
    ESPMAT_Default,                 // 0
    ESPMAT_Scalar,                  // 1
    ESPMAT_Float1,                  // 2
    ESPMAT_Float2,                  // 3
    ESPMAT_Float3,                  // 4
    ESPMAT_Float4,                  // 5
    ESPMAT_Texture2D,               // 6
    ESPMAT_TextureCube,             // 7
    ESPMAT_MAX                      // 8
};

struct MaterialInput
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Expression;
    var(*) /*0x35EA0000-0x00000000*/ private int OutputIndex;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string InputName;
    var(*) /*0x35EA0000-0x00000000*/ private int Mask;
    var(*) /*0x35EA0000-0x00000000*/ private int MaskR;
    var(*) /*0x35EA0000-0x00000000*/ private int MaskG;
    var(*) /*0x35EA0000-0x00000000*/ private int MaskB;
    var(*) /*0x35EA0000-0x00000000*/ private int MaskA;
    var(*) /*0x35EA0000-0x00000000*/ private int GCC64_Padding;

    structdefaultproperties
    {
        Expression=none
        OutputIndex=0
        InputName=""
        Mask=0
        MaskR=0
        MaskG=0
        MaskB=0
        MaskA=0
        GCC64_Padding=0
    }
};

struct ColorMaterialInput extends MaterialInput
{
    var(*) /*0x35EA0000-0x00000000*/ private bool UseConstant;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Constant;
};

struct ScalarMaterialInput extends MaterialInput
{
    var(*) /*0x35EA0000-0x00000000*/ private bool UseConstant;
    var(*) /*0x35EA0000-0x00000000*/ private float Constant;
};

struct VectorMaterialInput extends MaterialInput
{
    var(*) /*0x35EA0000-0x00000000*/ private bool UseConstant;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Constant;
};

struct Vector2MaterialInput extends MaterialInput
{
    var(*) /*0x35EA0000-0x00000000*/ private bool UseConstant;
    var(*) /*0x35EA0000-0x00000000*/ private float ConstantX;
    var(*) /*0x35EA0000-0x00000000*/ private float ConstantY;
};

struct native MaterialFunctionInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL StateId;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Function;

    structdefaultproperties
    {
        StateId=(A=0,B=0,C=0,D=0)
        Function=none
    }
};

var(*) /*0x3C4A0000-0x00000000*/ private @NULL PhysMaterial[65537];
var(*) /*0x35EA0000-0x00000000*/ private class PhysicalMaterial;
var(*) /*0x3C4A0000-0x00000000*/ private @NULL PhysMaterialMask[65537];
var(*) /*0x3C4A0000-0x00000000*/ private int PhysMaterialMaskUVChannel[65537];
var(*) /*0x3C4A0000-0x00000000*/ private @NULL BlackPhysicalMaterial[65537];
var(*) /*0x3C4A0000-0x00000000*/ private @NULL WhitePhysicalMaterial[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL DiffuseColor;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL DiffusePower;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL SpecularColor;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL SpecularPower;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Normal;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL EmissiveColor;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Opacity;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL OpacityMask;
var(*) /*0x30850000-0x00000000*/ private float OpacityMaskClipValue[65537];
var(*) /*0x32D60000-0x00000000*/ private float ShadowDepthBias[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Distortion;
var(*) /*0x30850000-0x00000000*/ private byte BlendMode[65537];
var(*) /*0x30850000-0x00000000*/ private byte LightingModel[65537];
var(*) /*0x15BF0000-0x00000000*/ private byte D3D11TessellationMode[196609];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL CustomLighting;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL CustomSkylightDiffuse;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL AnisotropicDirection;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL OutputAlpha;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL TwoSidedLightingMask;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL TwoSidedLightingColor;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL WorldPositionOffset;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL WorldDisplacement;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL TessellationMultiplier;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL SubsurfaceInscatteringColor;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL SubsurfaceAbsorptionColor;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL SubsurfaceScatteringRadius;
var(*) /*0x15BF0000-0x00000000*/ private bool EnableSubsurfaceScattering[65537];
var(*) /*0x32D60000-0x00000000*/ private bool EnableSeparateTranslucency[65537];
var(*) /*0x15BF0000-0x00000000*/ private bool bEnableMaskedAntialiasing[65537];
var(*) /*0x30850000-0x00000000*/ private bool EnableDiffusePower[65537];
var(*) /*0x30850000-0x00000000*/ private bool EnableSelectionColor[65537];
var(*) /*0x30850000-0x00000000*/ private bool TwoSided[65537];
var(*) /*0x4DAC0000-0x00000000*/ private bool TwoSidedSeparatePass[65537];
var(*) /*0x30850000-0x00000000*/ private bool bSceneTextureFilter[65537];
var(*) /*0x4DAC0000-0x00000000*/ private bool bDisableDepthTest[65537];
var(*) /*0x4DAC0000-0x00000000*/ private bool bSceneTextureRenderBehindTranslucency[65537];
var(*) /*0x4DAC0000-0x00000000*/ private bool bAllowFog[65537];
var(*) /*0x4DAC0000-0x00000000*/ private bool bTranslucencyReceiveDominantShadowsFromStatic[65537];
var(*) /*0x4DAC0000-0x00000000*/ private bool bTranslucencyInheritDominantShadowsFromOpaque[65537];
var(*) /*0x4DAC0000-0x00000000*/ private bool bAllowTranslucencyDoF[65537];
var(*) /*0x4DAC0000-0x00000000*/ private bool bUseOneLayerDistortion[65537];
var(*) /*0x4DAC0000-0x00000000*/ private bool bUseLitTranslucencyDepthPass[65537];
var(*) /*0x4DAC0000-0x00000000*/ private bool bUseLitTranslucencyPostRenderDepthPass[65537];
var(*) /*0x4DAC0000-0x00000000*/ private bool bCastLitTranslucencyShadowAsMasked[65537];
var(*) /*0x4DAC0000-0x00000000*/ private bool bRejectFullyTransparentFragments[65537];
var(*) /*0x4DAC0000-0x00000000*/ private bool bAllowDownsampling[65537];
var(*) /*0x4DAC0000-0x00000000*/ private bool bAttenuateOpacityBySpecularHighlight[65537];
var(*) /*0x34160000-0x00000000*/ private bool bUsedAsLightFunction[196609];
var(*) /*0x34160000-0x00000000*/ private bool bUsedWithFogVolumes[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bUsedAsSpecialEngineMaterial[131073];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithSkeletalMesh[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithTerrain[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithLandscape[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithFracturedMeshes[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bUsedWithParticleSystem[131073];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithParticleSprites[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithBeamTrails[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithParticleSubUV[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithSpeedTree[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithStaticLighting[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithLensFlare[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithGammaCorrection[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithInstancedMeshParticles[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithFluidSurfaces[196609];
var(*) /*0x34160000-0x00000000*/ private bool bUsedWithDecals[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithMaterialEffect[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithMorphTargets[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithRadialBlur[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithInstancedMeshes[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithSplineMeshes[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithAPEXMeshes[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithWeaponTrails[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bIsVisualizeFogDensity[196609];
var(*) /*0x4EF90000-0x00000000*/ private bool bUsedWithScreenDoorFade[196609];
var(*) /*0x15BF0000-0x00000000*/ private bool bEnableCrackFreeDisplacement[196609];
var(*) /*0x15BF0000-0x00000000*/ private bool bUseImageBasedReflections[65537];
var(*) /*0x32D60000-0x00000000*/ private bool Wireframe[65537];
var(*) /*0x32D60000-0x00000000*/ private bool bPerPixelCameraVector[65537];
var(*) /*0x32D60000-0x00000000*/ private bool bAllowLightmapSpecular[65537];
var(*) /*0x32D60000-0x00000000*/ private bool bDesaturateSpecularLightColor[65537];
var(*) /*0x32D60000-0x00000000*/ private bool bUseMaxDesaturatedSpecularLightColor[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient bool bIsFallbackMaterial;
var(*) /*0x35EA0000-0x00000000*/ private bool bUsesDistortion;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsMasked;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsPreviewMaterial[536870913];
var(*) /*0x30850000-0x00000000*/ private float MaterialDepthBias[65537];
var(*) /*0x30850000-0x00000000*/ private editfixedsize editinline string CustomCode[65537];
var(*) /*0x15BF0000-0x00000000*/ private float ImageReflectionNormalDampening[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MaterialResources[268566530];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DefaultMaterialInstances[268566531];
var(*) /*0x35EA0000-0x00000000*/ private int EditorX;
var(*) /*0x35EA0000-0x00000000*/ private int EditorY;
var(*) /*0x35EA0000-0x00000000*/ private int EditorPitch;
var(*) /*0x35EA0000-0x00000000*/ private int EditorYaw;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Expressions;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array EditorComments;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array MaterialFunctionInfos;
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} EditorParameters[268435457];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize transient array ReferencedTextures[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ReferencedTextureGuids[131073];
var(*) /*0x35EA0000-0x00000000*/ private int versionId[131073];

defaultproperties
{
    PhysMaterialMaskUVChannel=-1
    DiffuseColor=(UseConstant=false,Constant=(R=128,G=128,B=128,A=0),Expression=none,OutputIndex=0,InputName="",Mask=0,MaskR=0,MaskG=0,MaskB=0,MaskA=0,GCC64_Padding=0)
    DiffusePower=(UseConstant=false,Constant=1.0000000,Expression=none,OutputIndex=0,InputName="",Mask=0,MaskR=0,MaskG=0,MaskB=0,MaskA=0,GCC64_Padding=0)
    SpecularColor=(UseConstant=false,Constant=(R=128,G=128,B=128,A=0),Expression=none,OutputIndex=0,InputName="",Mask=0,MaskR=0,MaskG=0,MaskB=0,MaskA=0,GCC64_Padding=0)
    SpecularPower=(UseConstant=false,Constant=15.0000000,Expression=none,OutputIndex=0,InputName="",Mask=0,MaskR=0,MaskG=0,MaskB=0,MaskA=0,GCC64_Padding=0)
    Opacity=(UseConstant=false,Constant=1.0000000,Expression=none,OutputIndex=0,InputName="",Mask=0,MaskR=0,MaskG=0,MaskB=0,MaskA=0,GCC64_Padding=0)
    OpacityMask=(UseConstant=false,Constant=1.0000000,Expression=none,OutputIndex=0,InputName="",Mask=0,MaskR=0,MaskG=0,MaskB=0,MaskA=0,GCC64_Padding=0)
    OpacityMaskClipValue=0.3333000
    TwoSidedLightingColor=(UseConstant=false,Constant=(R=255,G=255,B=255,A=0),Expression=none,OutputIndex=0,InputName="",Mask=0,MaskR=0,MaskG=0,MaskB=0,MaskA=0,GCC64_Padding=0)
    SubsurfaceInscatteringColor=(UseConstant=false,Constant=(R=255,G=255,B=255,A=0),Expression=none,OutputIndex=0,InputName="",Mask=0,MaskR=0,MaskG=0,MaskB=0,MaskA=0,GCC64_Padding=0)
    SubsurfaceAbsorptionColor=(UseConstant=false,Constant=(R=230,G=200,B=200,A=0),Expression=none,OutputIndex=0,InputName="",Mask=0,MaskR=0,MaskG=0,MaskB=0,MaskA=0,GCC64_Padding=0)
    EnableSelectionColor=true
    bAllowFog=true
    bRejectFullyTransparentFragments=true
    bAllowLightmapSpecular=true
    ImageReflectionNormalDampening=5.0000000
}