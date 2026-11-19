class StaticMeshComponent extends MeshComponent
    editinlinenew
    noexport
    hidecategories(Object);

enum ELightmapModificationFunction
{
    MLMF_Modulate,                  // 0
    MLMF_ModulateAlpha,             // 1
    MLMF_MAX                        // 2
};

struct PaintedVertex
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Position;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Normal;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Color;

    structdefaultproperties
    {
        Position=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Normal=none
        Color=(R=0,G=0,B=0,A=0)
    }
};

struct StaticMeshComponentLODInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ShadowMaps[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ShadowVertexBuffers[131073];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LightMap[268566529];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL OverrideVertexColors[268566529];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PaintedVertices[131073];

    structdefaultproperties
    {
        ShadowMaps=none
        ShadowVertexBuffers=none
        PaintedVertices=none
    }
};

var(*) /*0x4A270000-0x00000000*/ private int ForcedLodModel[65537];
var(*) /*0x35EA0000-0x00000000*/ private int PreviousLODLevel;
var(*) /*0x4A270000-0x00000000*/ private @NULL StaticMesh[196609];
var(*) /*0x4A270000-0x00000000*/ private @NULL WireframeColor[65537];
var(*) /*0x4A270000-0x00000000*/ private bool bIgnoreInstanceForTextureStreaming[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient bool bOverrideLightMapResolution[131073];
var(*) /*0x4A270000-0x00000000*/ private bool bOverrideLightMapRes[196609];
var(*) /*0x35EA0000-0x00000000*/ private transient int OverriddenLightMapResolution[131073];
var(*) /*0x4A270000-0x00000000*/ private int OverriddenLightMapRes[196609];
var(*) /*0x4A270000-0x00000000*/ private float OverriddenLODMaxRange[65537];
var(*) /*0x4A270000-0x00000000*/ private float StreamingDistanceMultiplier[65537];
var(*) /*0x35EA0000-0x00000000*/ private int SubDivisionStepSize[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bUseSubDivisions[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bForceStaticDecals[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bCanHighlightSelectedSections[536870913];
var(*) /*0x333D0000-0x00000000*/ private bool bUseSimpleLightmapModifications[65537];
var(*) /*0x333D0000-0x00000000*/ private @NULL SimpleLightmapModificationTexture[65537];
var(*) /*0x333D0000-0x00000000*/ private byte SimpleLightmapModificationFunction[65537];
var(*) /*0x3C500000-0x00000000*/ private bool bNeverBecomeDynamic[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array IrrelevantLights[131073];
var(*) /*0x35EA0000-0x00000000*/ private localized array LODData[268566529];
var(*) /*0x35EA0000-0x00000000*/ private int VertexPositionVersionNumber[131073];
var(*) /*0x2ECC0000-0x00000000*/ private @NULL LightmassSettings[65537];

// Export UStaticMeshComponent::execSetStaticMesh(FFrame&, void* const)
native simulated function SetStaticMesh()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewMesh[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bForce[9437185], ReturnValue;


}

// Export UStaticMeshComponent::execDisableRBCollisionWithSMC(FFrame&, void* const)
native simulated function @NULL DisableRBCollisionWithSMC()
{
    local /*0x35EA0000-0x00000400*/ private @NULL OtherSMC[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bDisabled[8388609];


}

// Export UStaticMeshComponent::execSetForceStaticDecals(FFrame&, void* const)
native final function SetForceStaticDecals()
{
    local /*0x35EA0000-0x00000000*/ private bool bInForceStaticDecals[8388609];


}

// Export UStaticMeshComponent::execCanBecomeDynamic(FFrame&, void* const)
native function CanBecomeDynamic()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}
