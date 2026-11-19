class Pylon extends NavigationPoint
    placeable
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force,Lighting,LightColor,Force)
    implements(EditorLinkSelectionInterface,Interface_NavigationHandle);

enum ENavMeshEdgeType
{
    NAVEDGE_Normal,                 // 0
    NAVEDGE_Mantle,                 // 1
    NAVEDGE_Coverslip,              // 2
    NAVEDGE_SwatTurn,               // 3
    NAVEDGE_DropDown,               // 4
    NAVEDGE_PathObject,             // 5
    NAVEDGE_BackRefDummy,           // 6
    NAVEDGE_Jump,                   // 7
    NAVEDGE_MAX                     // 8
};

struct native atomicwhencooked immutablewhencooked PolyReference
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL OwningPylon;
    var(*) /*0x35EA0000-0x00000000*/ private int PolyId;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedPoly[268435457];

    structdefaultproperties
    {
        OwningPylon=none
        PolyId=0
    }
};

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_IEditorLinkSelectionInterface[268566529];
var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_IInterface_NavigationHandle[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL NavMeshPtr[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ObstacleMesh[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DynamicObstacleMesh[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL WorkingSetPtr[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PathObjectsThatAffectThisPylon[805437441];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array NextPassSeedList[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL OctreeId[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL OctreeIWasAddedTo[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL NextPylon[131073];
var(*) /*0x324B0000-0x00000000*/ private editfixedsize array ExpansionVolumes[65537];
var(*) /*0x324B0000-0x00000000*/ private float ExpansionRadius[65537];
var(*) /*0x35EA0000-0x00000000*/ private float MaxExpansionRadius[131073];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL PylonRadiusPreview[524289];
var(*) /*0x35EA0000-0x00000000*/ private bool bImportedMesh;
var(*) /*0x35EA0000-0x00000000*/ private bool bUseExpansionSphereOverride;
var(*) /*0x35EA0000-0x00000000*/ private bool bNeedsCostCheck;
var(*) /*0x35EA0000-0x00000000*/ private bool bPylonInHighLevelPath[536870913];
var(*) /*0x324B0000-0x00000000*/ private bool bUseRecast[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bAllowRecastGenerator[536870913];
var(*) /*0x16220000-0x00000000*/ private bool bDrawEdgePolys[65537];
var(*) /*0x16220000-0x00000000*/ private bool bDrawPolyBounds[65537];
var(*) /*0x1CE70000-0x00000000*/ private bool bRenderInShowPaths[65537];
var(*) /*0x1CE70000-0x00000000*/ private bool bDrawWalkableSurface[65537];
var(*) /*0x1CE70000-0x00000000*/ private bool bDrawObstacleSurface[65537];
var(*) /*0x1CE70000-0x00000000*/ private bool bSolidObstaclesInGame[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bBuildThisPylon[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bDisabled;
var(*) /*0x35EA0000-0x00000000*/ private bool bForceObstacleMeshCollision;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ExpansionSphereCenter;
var(*) /*0x35EA0000-0x00000400*/ private export @NULL RenderingComp[524289];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL BrokenSprite[537526273];
var(*) /*0x324B0000-0x00000000*/ private editfixedsize array ImposterPylons[65537];
var(*) /*0x324B0000-0x00000000*/ private editfixedsize array OnBuild_DisableCollisionForThese[65537];
var(*) /*0x324B0000-0x00000000*/ private editfixedsize array OnBuild_EnableCollisionForThese[65537];
var(*) /*0x324B0000-0x00000000*/ private float MaxPolyHeight_Optional[65537];
var(*) /*0x35EA0000-0x00000000*/ private byte NavMeshGenerator;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array VoxelFilterBounds[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array VoxelFilterTM[536870913];
var(*) /*0x16220000-0x00000000*/ private int DebugEdgeCount[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DebugPathExtent[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DebugPathStartLocation[536870913];

// Export UPylon::execOnPylonStatusChange(FFrame&, void* const)
native function OnPylonStatusChange();

// Export UPylon::execUpdateMeshForPreExistingNavMeshObstacles(FFrame&, void* const)
native function UpdateMeshForPreExistingNavMeshObstacles();

// Export UPylon::execFlushDynamicEdges(FFrame&, void* const)
native function FlushDynamicEdges();

function GetTestPathExtent()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private class ScoutClass;
    local /*0x35EA0000-0x00000000*/ private @NULL Extent;

    ScoutClass = class<Scout>(DynamicLoadObject(Class'Engine'.default.ScoutClassName, Class'Core.Class'));
    Extent.X = ScoutClass.default.PathSizes[0].Radius;
    Extent.Y = ScoutClass.default.PathSizes[0].Radius;
    Extent.Z = ScoutClass.default.PathSizes[0].Height;
    return Extent;
    //return ReturnValue;    
}

function VerifyTopLevelConnections()
{
    local /*0x35EA0000-0x00000000*/ private @NULL DebugHandle;
    local /*0x35EA0000-0x00000000*/ private int I, PtIdx;
    local /*0x35EA0000-0x00000000*/ private @NULL NeighborPylon;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array pts, Dst_Pts;
    local /*0x35EA0000-0x00000000*/ private bool bFoundPath;

    DebugHandle = new (self) Class'NavigationHandle';
    DebugPathStartLocation = Location;
    DebugPathExtent = GetTestPathExtent();
    DebugHandle.GetValidPositionsForBox(Location, DebugPathExtent.X * float(10), DebugPathExtent, false, pts, 5);
    // End:0xE4
    if(pts.Length == 0)
    {
        DrawDebugLine(Location, Location + vect(0.0000000, 0.0000000, 100.0000000), 255, 255, 0, true);
        return;
    }
    I = 0;
    J0xEF:

    // End:0x3A6 [Loop If]
    if(I < PathList.Length)
    {
        NeighborPylon = Pylon(PathList[I].End.Actor);
        // End:0x398
        if(NeighborPylon != none)
        {
            DebugHandle.GetValidPositionsForBox(NeighborPylon.Location, DebugPathExtent.X * float(10), DebugPathExtent, false, Dst_Pts, 1);
            // End:0x248
            if(Dst_Pts.Length < 1)
            {
                DrawDebugLine(NeighborPylon.Location, NeighborPylon.Location + vect(0.0000000, 0.0000000, 100.0000000), 255, 255, 0, true);                
            }
            else
            {
                bFoundPath = false;
                PtIdx = 0;
                J0x25F:

                // End:0x33E [Loop If]
                if(PtIdx < pts.Length)
                {
                    DebugPathStartLocation = pts[PtIdx];
                    Class'NavMeshPath_Toward'.static.TowardPoint(DebugHandle, Dst_Pts[0]);
                    Class'NavMeshGoal_At'.static.AtLocation(DebugHandle, Dst_Pts[0]);
                    // End:0x330
                    if(DebugHandle.FindPath())
                    {
                        bFoundPath = true;
                        // [Explicit Break]
                        goto J0x33E;
                    }
                    ++PtIdx;
                    // [Loop Continue]
                    goto J0x25F;
                }
                J0x33E:

                // End:0x398
                if(!bFoundPath)
                {
                    DrawDebugLine(Location, Dst_Pts[0], 255, 0, 0, true);
                    DrawDebugCoordinateSystem(Location, rot(0, 0, 0), 15.0000000, true);
                }
            }
        }
        ++I;
        // [Loop Continue]
        goto J0xEF;
    }
    //return;    
}

event NotifyPathChanged()
{
    //return;    
}

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    SetEnabled(!bBlocked);
    //return;    
}

event SetEnabled()
{
    local /*0x35EA0000-0x00000000*/ private bool bEnabled[8388609];

    bDisabled = !bEnabled;
    bForceObstacleMeshCollision = bDisabled;
    OnPylonStatusChange();
    //return;    
}

event IsEnabled()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return !bDisabled;
    //return ReturnValue;    
}

function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x45
    if(Action.InputLinks[0].bHasImpulse)
    {
        SetEnabled(true);        
    }
    else
    {
        // End:0x8A
        if(Action.InputLinks[1].bHasImpulse)
        {
            SetEnabled(false);            
        }
        else
        {
            // End:0xD8
            if(Action.InputLinks[2].bHasImpulse)
            {
                SetEnabled(!IsEnabled());
            }
        }
    }
    //return;    
}

// Export UPylon::execCanReachPylon(FFrame&, void* const)
native function CanReachPylon()
{
    local /*0x35EA0000-0x00000000*/ private @NULL DestPylon[8388609], C;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

defaultproperties
{
    ExpansionRadius=2048.0000000
    MaxExpansionRadius=7168.0000000
    bRenderInShowPaths=true
    bDrawWalkableSurface=true
    bDrawObstacleSurface=true
    DebugEdgeCount=-1
    bDestinationOnly=true
    // Reference: CylinderComponent'Default__Pylon.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    Components[5]=none
    Components[6]=none
    Components[7]=none
    CollisionComponent=CollisionCylinder
}