class ProcBuilding extends Volume
    placeable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

const ROOF_MINZ = 0.7;
const PROCBUILDING_VERSION = 1;

enum EScopeEdge
{
    EPSA_Top,                       // 0
    EPSA_Bottom,                    // 1
    EPSA_Left,                      // 2
    EPSA_Right,                     // 3
    EPSA_None,                      // 4
    EPSA_MAX                        // 5
};

enum EPBCornerType
{
    EPBC_Default,                   // 0
    EPBC_Chamfer,                   // 1
    EPBC_Round,                     // 2
    EPBC_MAX                        // 3
};

enum EBuildingStatsBrowserColumns
{
    BSBC_Name,                      // 0
    BSBC_Ruleset,                   // 1
    BSBC_NumStaticMeshComps,        // 2
    BSBC_NumInstancedStaticMeshComps,// 3
    BSBC_NumInstancedTris,          // 4
    BSBC_LightmapMemBytes,          // 5
    BSBC_ShadowmapMemBytes,         // 6
    BSBC_LODDiffuseMemBytes,        // 7
    BSBC_LODLightingMemBytes,       // 8
    BSBC_MAX                        // 9
};

struct native PBScope2D
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ScopeFrame;
    var(*) /*0x35EA0000-0x00000000*/ private float DimX;
    var(*) /*0x35EA0000-0x00000000*/ private float DimZ;

    structdefaultproperties
    {
        ScopeFrame=(XPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000),YPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000),ZPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000),WPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000))
        DimX=0.0000000
        DimZ=0.0000000
    }
};

struct native PBScopeProcessInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL OwningBuilding;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Ruleset;
    var(*) /*0x35EA0000-0x00000000*/ private name RulesetVariation;
    var(*) /*0x35EA0000-0x00000000*/ private bool bGenerateLODPoly;
    var(*) /*0x35EA0000-0x00000000*/ private bool bPartOfNonRect;

    structdefaultproperties
    {
        OwningBuilding=none
        Ruleset=none
        RulesetVariation="None"
        bGenerateLODPoly=false
        bPartOfNonRect=false
    }
};

struct native PBFaceUVInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Offset;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Size;

    structdefaultproperties
    {
        Offset=(X=0.0000000,Y=0.0000000)
        Size=(X=0.0000000,Y=0.0000000)
    }
};

struct native PBEdgeInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL EdgeEnd;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL EdgeStart;
    var(*) /*0x35EA0000-0x00000000*/ private int ScopeAIndex;
    var(*) /*0x35EA0000-0x00000000*/ private byte ScopeAEdge;
    var(*) /*0x35EA0000-0x00000000*/ private int ScopeBIndex;
    var(*) /*0x35EA0000-0x00000000*/ private byte ScopeBEdge;
    var(*) /*0x35EA0000-0x00000000*/ private float EdgeAngle;

    structdefaultproperties
    {
        EdgeEnd=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        EdgeStart=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ScopeAIndex=0
        ScopeAEdge=EScopeEdge.EPSA_Top
        ScopeBIndex=0
        ScopeBEdge=EScopeEdge.EPSA_Top
        EdgeAngle=0.0000000
    }
};

struct native PBMeshCompInfo
{
    var(*) /*0x35EA0000-0x00000400*/ private export @NULL MeshComp[524289];
    var(*) /*0x35EA0000-0x00000000*/ private int TopLevelScopeIndex;

    structdefaultproperties
    {
        MeshComp=none
        TopLevelScopeIndex=0
    }
};

struct native PBFracMeshCompInfo
{
    var(*) /*0x35EA0000-0x00000400*/ private export @NULL FracMeshComp[524289];
    var(*) /*0x35EA0000-0x00000000*/ private int TopLevelScopeIndex;

    structdefaultproperties
    {
        FracMeshComp=none
        TopLevelScopeIndex=0
    }
};

struct native PBMaterialParam
{
    var(*) /*0x3B670000-0x00000000*/ private name ParamName[65537];
    var(*) /*0x3B670000-0x00000000*/ private @NULL Color[65537];

    structdefaultproperties
    {
        ParamName="None"
        Color=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
    }
};

struct native PBMemUsageInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Building;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Ruleset;
    var(*) /*0x35EA0000-0x00000000*/ private int NumStaticMeshComponent;
    var(*) /*0x35EA0000-0x00000000*/ private int NumInstancedStaticMeshComponents;
    var(*) /*0x35EA0000-0x00000000*/ private int NumInstancedTris;
    var(*) /*0x35EA0000-0x00000000*/ private int LightmapMemBytes;
    var(*) /*0x35EA0000-0x00000000*/ private int ShadowmapMemBytes;
    var(*) /*0x35EA0000-0x00000000*/ private int LODDiffuseMemBytes;
    var(*) /*0x35EA0000-0x00000000*/ private int LODLightingMemBytes;

    structdefaultproperties
    {
        Building=none
        Ruleset=none
        NumStaticMeshComponent=0
        NumInstancedStaticMeshComponents=0
        NumInstancedTris=0
        LightmapMemBytes=0
        ShadowmapMemBytes=0
        LODDiffuseMemBytes=0
        LODLightingMemBytes=0
    }
};

var(*) /*0x3E760000-0x00000000*/ private @NULL Ruleset[65537];
var(*) /*0x3E760000-0x00000000*/ private const editfixedsize export array BuildingMeshCompInfos[196609];
var(*) /*0x3E760000-0x00000000*/ private const editfixedsize export array BuildingFracMeshCompInfos[196609];
var(*) /*0x3E760000-0x00000400*/ private const export @NULL SimpleMeshComp[720897];
var(*) /*0x3E760000-0x00000000*/ private bool bGenerateRoofMesh[65537];
var(*) /*0x3E760000-0x00000000*/ private bool bGenerateFloorMesh[65537];
var(*) /*0x3E760000-0x00000000*/ private bool bApplyRulesToRoof[65537];
var(*) /*0x3E760000-0x00000000*/ private bool bApplyRulesToFloor[65537];
var(*) /*0x3E760000-0x00000000*/ private bool bSplitWallsAtRoofLevels[65537];
var(*) /*0x3E760000-0x00000000*/ private bool bSplitWallsAtWallEdges[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bQuickEdited[536870913];
var(*) /*0x3E760000-0x00000000*/ private bool bBuildingBrushCollision[65537];
var(*) /*0x16220000-0x00000000*/ private bool bDebugDrawEdgeInfo[65537];
var(*) /*0x16220000-0x00000000*/ private bool bDebugDrawScopes[65537];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array LODMeshComps[655361];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LODMeshUVInfos;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array TopLevelScopes;
var(*) /*0x35EA0000-0x00000000*/ private int NumMeshedTopLevelScopes;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array TopLevelScopeUVInfos;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array TopLevelScopeInfos;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array EdgeInfos;
var(*) /*0x35EA0000-0x00000000*/ private float MaxFacadeZ;
var(*) /*0x35EA0000-0x00000000*/ private float MinFacadeZ;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array OverlappingBuildings[536870913];
var(*) /*0x3E760000-0x00000000*/ private float SimpleMeshMassiveLODDistance[65537];
var(*) /*0x3E760000-0x00000000*/ private float RenderToTexturePullBackAmount[65537];
var(*) /*0x3E760000-0x00000000*/ private int RoofLightmapRes[65537];
var(*) /*0x3E760000-0x00000000*/ private int NonRectWallLightmapRes[65537];
var(*) /*0x3E760000-0x00000000*/ private float LODRenderToTextureScale[65537];
var(*) /*0x3E760000-0x00000000*/ private name ParamSwatchName[65537];
var(*) /*0x3E760000-0x00000000*/ private editfixedsize array BuildingMaterialParams[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array BuildingMatParamMICs;
var(*) /*0x3E760000-0x10000000*/ private const @NULL LowLODPersistentActor[196609];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL CurrentSimpleMeshComp[537395201];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CurrentSimpleMeshActor[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AttachedBuildings;
var(*) /*0x35EA0000-0x00000000*/ private int BuildingInstanceVersion[131073];

// Export UProcBuilding::execClearBuildingMeshes(FFrame&, void* const)
native function ClearBuildingMeshes();

// Export UProcBuilding::execFindComponentsForTopLevelScope(FFrame&, void* const)
native function array FindComponentsForTopLevelScope()
{
    local /*0x35EA0000-0x00000000*/ private int TopLevelScopeIndex[8388609];
    local /*0x35EA0000-0x00000400*/ private editfixedsize array ReturnValue[92274689];


}

// Export UProcBuilding::execGetBaseMostBuilding(FFrame&, void* const)
native function GetBaseMostBuilding()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UProcBuilding::execGetAllGroupedProcBuildings(FFrame&, void* const)
native function GetAllGroupedProcBuildings()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array OutSet[25165825];


}

// Export UProcBuilding::execBreakFractureComponent(FFrame&, void* const)
native function @NULL BreakFractureComponent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL Comp[8388609], BoxMin, BoxMax;


}

// Export UProcBuilding::execFindEdgeForTopLevelScope(FFrame&, void* const)
native function FindEdgeForTopLevelScope()
{
    local /*0x35EA0000-0x00000000*/ private int TopLevelScopeIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private byte Edge[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

defaultproperties
{
    bGenerateRoofMesh=true
    bSplitWallsAtRoofLevels=true
    bSplitWallsAtWallEdges=true
    bBuildingBrushCollision=true
    SimpleMeshMassiveLODDistance=10000.0000000
    RenderToTexturePullBackAmount=125.0000000
    RoofLightmapRes=64
    NonRectWallLightmapRes=64
    LowLODPersistentActor=none
    BrushColor=(R=222,G=255,B=135,A=255)
    bColored=true
    // Reference: BrushComponent'Default__ProcBuilding.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    bHidden=false
    bWorldGeometry=true
    bRouteBeginPlayEvenIfStatic=false
    bGameRelevant=true
    bMovable=false
    bBlockActors=true
    bForceOctreeSNFilter=true
    bPathColliding=true
    CollisionComponent=BrushComponent0
}