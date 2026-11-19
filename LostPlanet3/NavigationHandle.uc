class NavigationHandle extends Object within Actor;

const LINECHECK_GRANULARITY = 768.f;
const NUM_PATHFINDING_PARAMS = 9;
const NumBreadCrumbs = 10;

struct native PolySegmentSpan
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Poly[268435457];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL P1;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL P2;

    structdefaultproperties
    {
        P1=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        P2=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

struct EdgePointer
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Dummy[268566529];
};

struct native PathStore
{
    var(*) /*0x35EA0000-0x00000000*/ private array EdgeList[268435457];
};

struct native NavMeshPathParams
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interface[268435457];
    var(*) /*0x35EA0000-0x00000000*/ private bool bCanMantle;
    var(*) /*0x35EA0000-0x00000000*/ private bool bNeedsMantleValidityTest;
    var(*) /*0x35EA0000-0x00000000*/ private bool bAbleToSearch;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SearchExtent;
    var(*) /*0x35EA0000-0x00000000*/ private float SearchLaneMultiplier;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SearchStart;
    var(*) /*0x35EA0000-0x00000000*/ private float MaxDropHeight;
    var(*) /*0x35EA0000-0x00000000*/ private float MinWalkableZ;
    var(*) /*0x35EA0000-0x00000000*/ private float MaxHoverDistance;

    structdefaultproperties
    {
        bCanMantle=false
        bNeedsMantleValidityTest=false
        bAbleToSearch=false
        SearchExtent=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        SearchLaneMultiplier=0.0000000
        SearchStart=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        MaxDropHeight=0.0000000
        MinWalkableZ=0.0000000
        MaxHoverDistance=0.0000000
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL AnchorPylon;
var(*) /*0x35EA0000-0x00000000*/ private @NULL AnchorPoly[268435457];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PathCache;
var(*) /*0x35EA0000-0x00000000*/ private @NULL BestUnfinishedPathPoint[805306369];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CurrentEdge[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SubGoal_DestPoly[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL FinalDestination;
var(*) /*0x35EA0000-0x00000000*/ private bool bSkipRouteCacheUpdates;
var(*) /*0x35EA0000-0x00000000*/ private bool bUseORforEvaluateGoal;
var(*) /*0x3B270000-0x00000000*/ private bool bDebugConstraintsAndGoalEvals[65537];
var(*) /*0x3B270000-0x00000000*/ private bool bUltraVerbosePathDebugging[65537];
var(*) /*0x3B270000-0x00000000*/ private bool bVisualPathDebugging[65537];
var(*) /*0x34780000-0x00000000*/ private bool bDebug_Breadcrumbs[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PathConstraintList;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PathGoalList;
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedPathParams;
var(*) /*0x3B270000-0x00000000*/ private byte LastPathError[65537];
var(*) /*0x3B270000-0x00000000*/ private float LastPathFailTime[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Breadcrumbs[10];
var(*) /*0x35EA0000-0x00000000*/ private int BreadCrumbMostRecentIdx;
var(*) /*0x35EA0000-0x00000000*/ private float BreadCrumbDistanceInterval;

// Export UNavigationHandle::execCopyPathStoreToPathCache(FFrame&, void* const)
native function CopyPathStoreToPathCache()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InStore[25296897];


}

// Export UNavigationHandle::execUpdateBreadCrumbs(FFrame&, void* const)
native function UpdateBreadCrumbs()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InLocation[8388609];


}

// Export UNavigationHandle::execGetNextBreadCrumb(FFrame&, void* const)
native function GetNextBreadCrumb()
{
    local /*0x35EA0000-0x00000000*/ private @NULL out_BreadCrumbLoc[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UNavigationHandle::execClearConstraints(FFrame&, void* const)
native function ClearConstraints();

// Export UNavigationHandle::execAddPathConstraint(FFrame&, void* const)
native function AddPathConstraint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Constraint[8388609];


}

// Export UNavigationHandle::execAddGoalEvaluator(FFrame&, void* const)
native function AddGoalEvaluator()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Evaluator[8388609];


}

// Export UNavigationHandle::execBuildFromPylonAToPylonB(FFrame&, void* const)
native function BuildFromPylonAToPylonB()
{
    local /*0x35EA0000-0x00000000*/ private @NULL A[8388609], B, ReturnValue;


}

// Export UNavigationHandle::execDoesPylonAHaveAPathToPylonB(FFrame&, void* const)
native function DoesPylonAHaveAPathToPylonB()
{
    local /*0x35EA0000-0x00000000*/ private @NULL A[8388609], B;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

function CreatePathConstraint()
{
    local /*0x35EA0000-0x00000000*/ private class ConstraintClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Outer.WorldInfo.GetNavMeshPathConstraintFromCache(ConstraintClass, self);
    //return ReturnValue;    
}

function CreatePathGoalEvaluator()
{
    local /*0x35EA0000-0x00000000*/ private class GoalEvalClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Outer.WorldInfo.GetNavMeshPathGoalEvaluatorFromCache(GoalEvalClass, self);
    //return ReturnValue;    
}

function GetPathCacheLength()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return PathCache.EdgeList.Length;
    //return ReturnValue;    
}

// Export UNavigationHandle::execPathCache_Empty(FFrame&, void* const)
native function PathCache_Empty()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UNavigationHandle::execPathCache_GetGoalPoint(FFrame&, void* const)
native function PathCache_GetGoalPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UNavigationHandle::execPathCache_RemoveIndex(FFrame&, void* const)
native function PathCache_RemoveIndex()
{
    local /*0x35EA0000-0x00000000*/ private int InIdx[8388609], Count;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    1                
}

// Export UNavigationHandle::execGetBestUnfinishedPathPoint(FFrame&, void* const)
native function GetBestUnfinishedPathPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UNavigationHandle::execFindPylon(FFrame&, void* const)
native function FindPylon()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UNavigationHandle::execGetPylonFromPos(FFrame&, void* const)
native static function GetPylonFromPos()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Position[8388609], ReturnValue;


}

// Export UNavigationHandle::execGetNextMoveLocation(FFrame&, void* const)
native function GetNextMoveLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL out_MoveDest[25165825];
    local /*0x35EA0000-0x00000000*/ private float ArrivalDistance[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UNavigationHandle::execSetFinalDestination(FFrame&, void* const)
native function SetFinalDestination()
{
    local /*0x35EA0000-0x00000000*/ private @NULL FinalDest[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UNavigationHandle::execComputeValidFinalDestination(FFrame&, void* const)
native function ComputeValidFinalDestination()
{
    local /*0x35EA0000-0x00000000*/ private @NULL out_ComputedPosition[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UNavigationHandle::execFindPath(FFrame&, void* const)
native function FindPath()
{
    local /*0x35EA0000-0x00000000*/ private @NULL out_DestActor[26214401];
    local /*0x35EA0000-0x00000000*/ private int out_DestItem[26214401];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UNavigationHandle::execSuggestMovePreparation(FFrame&, void* const)
native function SuggestMovePreparation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL MovePt[25165825], C;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UNavigationHandle::execObstacleLineCheck(FFrame&, void* const)
native static final function ObstacleLineCheck()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Start[8388609], End, Extent, out_HitLoc, out_HitNorm;

    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UNavigationHandle::execObstaclePointCheck(FFrame&, void* const)
native static final function ObstaclePointCheck()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Pt[8388609], Extent;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UNavigationHandle::execLineCheck(FFrame&, void* const)
native function LineCheck()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Start[8388609], End, Extent, out_HitLocation, out_HitNormal;

    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UNavigationHandle::execPointCheck(FFrame&, void* const)
native function PointCheck()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Pt[8388609], Extent;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UNavigationHandle::execPointReachable(FFrame&, void* const)
native function PointReachable()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Point[8388609], OverrideStartPoint;
    local /*0x35EA0000-0x00000000*/ private bool bAllowHitsInEndCollisionBox[9437185], ReturnValue;

    true                    
}

// Export UNavigationHandle::execActorReachable(FFrame&, void* const)
native function ActorReachable()
{
    local /*0x35EA0000-0x00000000*/ private @NULL A[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UNavigationHandle::execDrawPathCache(FFrame&, void* const)
native function DrawPathCache()
{
    local /*0x35EA0000-0x00000000*/ private @NULL DrawOffset[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bPersistent[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL DrawColor[9437185];


}

// Export UNavigationHandle::execPrintPathCacheDebugText(FFrame&, void* const)
native function PrintPathCacheDebugText();

// Export UNavigationHandle::execGetCurrentEdgeDebugText(FFrame&, void* const)
native function GetCurrentEdgeDebugText()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UNavigationHandle::execClearCurrentEdge(FFrame&, void* const)
native function ClearCurrentEdge();

// Export UNavigationHandle::execGetCurrentEdgeType(FFrame&, void* const)
native function GetCurrentEdgeType()
{
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];


}

// Export UNavigationHandle::execGetAllPolyCentersWithinBounds(FFrame&, void* const)
native static function GetAllPolyCentersWithinBounds()
{
    local /*0x35EA0000-0x00000000*/ private @NULL pos[8388609], Extent;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array out_PolyCtrs[25165825];


}

// Export UNavigationHandle::execGetValidPositionsForBox(FFrame&, void* const)
native static function GetValidPositionsForBox()
{
    local /*0x35EA0000-0x00000000*/ private @NULL pos[8388609];
    local /*0x35EA0000-0x00000000*/ private float Radius[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Extent[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bMustBeReachableFromStartPos[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array out_ValidPositions[25165825];
    local /*0x35EA0000-0x00000000*/ private int MaxPositions[9437185];
    local /*0x35EA0000-0x00000000*/ private float MinRadius[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ValidBoxAroundStartPos[9437185];

    -1    
    vect(0.0000000, 0.0000000, 0.0000000)                                        
}

// Export UNavigationHandle::execLimitPathCacheDistance(FFrame&, void* const)
native function LimitPathCacheDistance()
{
    local /*0x35EA0000-0x00000000*/ private float MaxDist[8388609];


}

// Export UNavigationHandle::execIsAnchorInescapable(FFrame&, void* const)
native function IsAnchorInescapable()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UNavigationHandle::execGetFirstMoveLocation(FFrame&, void* const)
native function GetFirstMoveLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UNavigationHandle::execCalculatePathDistance(FFrame&, void* const)
native function CalculatePathDistance()
{
    local /*0x35EA0000-0x00000000*/ private @NULL FinalDest[9437185];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UNavigationHandle::execCopyMovePointsFromPathCache(FFrame&, void* const)
native function CopyMovePointsFromPathCache()
{
    local /*0x35EA0000-0x00000000*/ private @NULL FinalDest[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array out_MovePoints[25165825];


}

// Export UNavigationHandle::execMoveToDesiredHeightAboveMesh(FFrame&, void* const)
native static function MoveToDesiredHeightAboveMesh()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Point[8388609];
    local /*0x35EA0000-0x00000000*/ private float Height[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UNavigationHandle::execPopulatePathfindingParamCache(FFrame&, void* const)
native final function PopulatePathfindingParamCache()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UNavigationHandle::execGetAllCoverSlotsInRadius(FFrame&, void* const)
native static final function GetAllCoverSlotsInRadius()
{
    local /*0x35EA0000-0x00000000*/ private @NULL FromLoc[8388609];
    local /*0x35EA0000-0x00000000*/ private float Radius[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array out_CoverList[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UNavigationHandle::execGetValidatedAnchorPosition(FFrame&, void* const)
native final function GetValidatedAnchorPosition()
{
    local /*0x35EA0000-0x00000000*/ private @NULL out_NewAnchorLoc[25165825], OverrideStartLoc;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UNavigationHandle::execStaticGetValidatedAnchorPosition(FFrame&, void* const)
native static final function StaticGetValidatedAnchorPosition()
{
    local /*0x35EA0000-0x00000000*/ private @NULL out_NewAnchorLoc[25165825], StartCheckBaseLocation, Extent;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

function DrawBreadCrumbs()
{
    local /*0x35EA0000-0x00000000*/ private bool bPersistent[9437185];

    false
    //return;    
}

defaultproperties
{
    BreadCrumbDistanceInterval=75.0000000
}