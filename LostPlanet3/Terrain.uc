class Terrain extends Info
    placeable
    hidecategories(AnimDependency,Navigation);

struct TerrainHeight
{
};

struct TerrainInfoData
{
};

struct TerrainWeightedMaterial
{
};

struct TerrainLayer
{
    var(*) /*0x4BDC0000-0x00000000*/ private editfixedsize string Name[65537];
    var(*) /*0x4BDC0000-0x00000000*/ private @NULL Setup[65537];
    var(*) /*0x35EA0000-0x00000000*/ private int AlphaMapIndex;
    var(*) /*0x4BDC0000-0x00000000*/ private bool Highlighted[65537];
    var(*) /*0x4BDC0000-0x00000000*/ private bool WireframeHighlighted[65537];
    var(*) /*0x4BDC0000-0x00000000*/ private bool Hidden[65537];
    var(*) /*0x4BDC0000-0x00000000*/ private @NULL HighlightColor[65537];
    var(*) /*0x4BDC0000-0x00000000*/ private @NULL WireframeColor[65537];
    var(*) /*0x35EA0000-0x00000000*/ private int MinX;
    var(*) /*0x35EA0000-0x00000000*/ private int MinY;
    var(*) /*0x35EA0000-0x00000000*/ private int MaxX;
    var(*) /*0x35EA0000-0x00000000*/ private int MaxY;

    structdefaultproperties
    {
        Name=""
        Setup=none
        AlphaMapIndex=-1
        Highlighted=false
        WireframeHighlighted=false
        Hidden=false
        HighlightColor=(R=255,G=255,B=255,A=0)
        WireframeColor=(R=0,G=0,B=0,A=0)
        MinX=0
        MinY=0
        MaxX=0
        MaxY=0
    }
};

struct AlphaMap
{
};

struct TerrainDecorationInstance
{
    var(*) /*0x35EA0000-0x00000400*/ private export @NULL Component[524289];
    var(*) /*0x35EA0000-0x00000000*/ private float X;
    var(*) /*0x35EA0000-0x00000000*/ private float Y;
    var(*) /*0x35EA0000-0x00000000*/ private float Scale;
    var(*) /*0x35EA0000-0x00000000*/ private int Yaw;

    structdefaultproperties
    {
        Component=none
        X=0.0000000
        Y=0.0000000
        Scale=0.0000000
        Yaw=0
    }
};

struct TerrainDecoration
{
    var(*) /*0x4BD50000-0x00000400*/ private @NULL Factory[65537];
    var(*) /*0x4BD50000-0x00000000*/ private float MinScale[65537];
    var(*) /*0x4BD50000-0x00000000*/ private float MaxScale[65537];
    var(*) /*0x4BD50000-0x00000000*/ private float Density[65537];
    var(*) /*0x4BD50000-0x00000000*/ private float SlopeRotationBlend[65537];
    var(*) /*0x4BD50000-0x00000000*/ private int RandSeed[65537];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize export array Instances;

    structdefaultproperties
    {
        Factory=none
        MinScale=1.0000000
        MaxScale=1.0000000
        Density=0.0100000
        SlopeRotationBlend=0.0000000
        RandSeed=0
        Instances=none
    }
};

struct TerrainDecoLayer
{
    var(*) /*0x4BD40000-0x00000000*/ private editfixedsize string Name[65537];
    var(*) /*0x4BD40000-0x00000000*/ private editfixedsize export array Decorations[65537];
    var(*) /*0x35EA0000-0x00000000*/ private int AlphaMapIndex;

    structdefaultproperties
    {
        Name=""
        Decorations=none
        AlphaMapIndex=-1
    }
};

struct TerrainMaterialResource
{
};

struct native CachedTerrainMaterialArray
{
    var(*) /*0x35EA0000-0x00000000*/ private array CachedMaterials[268566529];
};

struct SelectedTerrainVertex
{
    var(*) /*0x35EA0000-0x00000000*/ private int X;
    var(*) /*0x35EA0000-0x00000000*/ private int Y;
    var(*) /*0x35EA0000-0x00000000*/ private int Weight;

    structdefaultproperties
    {
        X=0
        Y=0
        Weight=0
    }
};

var(*) /*0x35EA0000-0x00000000*/ private array Heights[268566529];
var(*) /*0x35EA0000-0x00000000*/ private array InfoData[268566529];
var(*) /*0x4BD00000-0x00000000*/ private editfixedsize array Layers[196609];
var(*) /*0x4BD00000-0x00000000*/ private int NormalMapLayer[65537];
var(*) /*0x4BD00000-0x00000000*/ private editfixedsize export array DecoLayers[196609];
var(*) /*0x35EA0000-0x00000000*/ private array AlphaMaps[268566529];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export globalconfig array TerrainComponents[655361];
var(*) /*0x35EA0000-0x00000000*/ private int NumSectionsX[131073];
var(*) /*0x35EA0000-0x00000000*/ private int NumSectionsY[131073];
var(*) /*0x35EA0000-0x00000000*/ private array WeightedMaterials[268566529];
var(*) /*0x35EA0000-0x00000000*/ private array WeightedTextureMaps[268566529];
var(*) /*0x4BD00000-0x00000000*/ private int MaxTesselationLevel[65537];
var(*) /*0x4BD00000-0x00000000*/ private int MinTessellationLevel[65537];
var(*) /*0x4BD00000-0x00000000*/ private float TesselationDistanceScale[65537];
var(*) /*0x4BD00000-0x00000000*/ private float TessellationCheckDistance[65537];
var(*) /*0x136C0000-0x00000000*/ private int CollisionTesselationLevel[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedTerrainMaterials[268566530];
var(*) /*0x35EA0000-0x00000000*/ private int NumVerticesX[131073];
var(*) /*0x35EA0000-0x00000000*/ private int NumVerticesY[131073];
var(*) /*0x4BD00000-0x00000000*/ private int NumPatchesX[65537];
var(*) /*0x4BD00000-0x00000000*/ private int NumPatchesY[65537];
var(*) /*0x4BD00000-0x00000000*/ private int MaxComponentSize[65537];
var(*) /*0x2EB00000-0x00000000*/ private int StaticLightingResolution[65537];
var(*) /*0x2EB00000-0x00000000*/ private bool bIsOverridingLightResolution[65537];
var(*) /*0x2EB00000-0x00000000*/ private bool bBilinearFilterLightmapGeneration[65537];
var(*) /*0x2EB00000-0x00000000*/ private bool bCastShadow[65537];
var(*) /*0x2EB00000-0x00000000*/ private bool bForceDirectLightMap[196609];
var(*) /*0x2EB00000-0x00000000*/ private bool bCastDynamicShadow[196609];
var(*) /*0x2EB00000-0x00000000*/ private bool bEnableSpecular[65537];
var(*) /*0x136C0000-0x00000000*/ private bool bBlockRigidBody[196609];
var(*) /*0x136C0000-0x00000000*/ private bool bAllowRigidBodyUnderneath[196609];
var(*) /*0x2EB00000-0x00000000*/ private bool bAcceptsDynamicLights[196609];
var(*) /*0x4BD00000-0x00000000*/ private bool bMorphingEnabled[65537];
var(*) /*0x4BD00000-0x00000000*/ private bool bMorphingGradientsEnabled[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bLocked;
var(*) /*0x35EA0000-0x00000000*/ private bool bHeightmapLocked;
var(*) /*0x35EA0000-0x00000000*/ private bool bShowingCollision;
var(*) /*0x4BD00000-0x00000000*/ private bool bUseWorldOriginTextureUVs[65537];
var(*) /*0x4BD00000-0x00000000*/ private bool bShowWireframe[65537];
var(*) /*0x3C500000-0x00000000*/ private @NULL TerrainPhysMaterialOverride[196609];
var(*) /*0x2EB00000-0x00000000*/ private @NULL LightingChannels[196609];
var(*) /*0x2ECC0000-0x00000000*/ private @NULL LightmassSettings[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ReleaseResourcesFence[268566529];
var(*) /*0x4BD00000-0x00000000*/ private int EditorTessellationLevel[536936449];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SelectedVertices[536870913];
var(*) /*0x4BD00000-0x00000000*/ private @NULL WireframeColor[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LightingGuid[131073];

// Export UTerrain::execCalcLayerBounds(FFrame&, void* const)
native final function CalcLayerBounds();

simulated event PostBeginPlay()
{
    local /*0x35EA0000-0x00000000*/ private int I;

    CalcLayerBounds();
    I = 0;
    J0x15:

    // End:0xA3 [Loop If]
    if(I < Layers.Length)
    {
        // End:0x95
        if(Layers[I].Setup != none)
        {
            Layers[I].Setup.PostBeginPlay();
        }
        I++;
        // [Loop Continue]
        goto J0x15;
    }
    //return;    
}

defaultproperties
{
    NormalMapLayer=-1
    MaxTesselationLevel=4
    MinTessellationLevel=1
    TesselationDistanceScale=1.0000000
    TessellationCheckDistance=-1.0000000
    CollisionTesselationLevel=1
    NumPatchesX=1
    NumPatchesY=1
    MaxComponentSize=16
    StaticLightingResolution=4
    bBilinearFilterLightmapGeneration=true
    bCastShadow=true
    bForceDirectLightMap=true
    bCastDynamicShadow=true
    bBlockRigidBody=true
    bAcceptsDynamicLights=true
    LightingChannels=(bInitialized=true,BSP=false,Static=true,Dynamic=false,CompositeDynamic=false,Skybox=false,SPBackground=false,GeneratedMeshAreaLight=false,Unnamed_1=false,Unnamed_2=false,Unnamed_3=false,Unnamed_4=false,Unnamed_5=false,Unnamed_6=false,Cinematic_1=false,Cinematic_2=false,Cinematic_3=false,Cinematic_4=false,Cinematic_5=false,Cinematic_6=false,Cinematic_7=false,Cinematic_8=false,Cinematic_9=false,Cinematic_10=false,Gameplay_1=false,Gameplay_2=false,Gameplay_3=false,Gameplay_4=false,Crowd=false)
    LightmassSettings=(bUseTwoSidedLighting=false,bShadowIndirectOnly=false,bUseEmissiveForStaticLighting=false,EmissiveLightFalloffExponent=2.0000000,EmissiveLightExplicitInfluenceRadius=0.0000000,EmissiveBoost=1.0000000,DiffuseBoost=1.0000000,SpecularBoost=1.0000000,FullyOccludedSamplesFraction=1.0000000)
    WireframeColor=(R=0,G=255,B=255,A=0)
    DrawScale3D=(X=256.0000000,Y=256.0000000,Z=256.0000000)
    bStatic=true
    bHidden=false
    bNoDelete=true
    bWorldGeometry=true
    bCollideActors=true
    bBlockActors=true
    bEdShouldSnap=true
}