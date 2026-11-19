class Scout extends Pawn
    transient
    config(Game)
    notplaceable
    hidecategories(AnimDependency,Navigation);

struct native PathSizeInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private name Desc;
    var(*) /*0x35EA0000-0x00000000*/ private float Radius;
    var(*) /*0x35EA0000-0x00000000*/ private float Height;
    var(*) /*0x35EA0000-0x00000000*/ private float CrouchHeight;
    var(*) /*0x35EA0000-0x00000000*/ private byte PathColor;

    structdefaultproperties
    {
        Desc="None"
        Radius=0.0000000
        Height=0.0000000
        CrouchHeight=0.0000000
        PathColor=0
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PathSizes;
var(*) /*0x35EA0000-0x00000000*/ private float TestJumpZ;
var(*) /*0x35EA0000-0x00000000*/ private float TestGroundSpeed;
var(*) /*0x35EA0000-0x00000000*/ private float TestMaxFallSpeed;
var(*) /*0x35EA0000-0x00000000*/ private float TestFallSpeed;
var(*) /*0x35EA0000-0x00000000*/ private float MaxLandingVelocity[131073];
var(*) /*0x35EA0000-0x00000000*/ private int MinNumPlayerStarts;
var(*) /*0x35EA0000-0x00000000*/ private class DefaultReachSpecClass;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array EdgePathColors;
var(*) /*0x35EA0000-0x00000000*/ private float NavMeshGen_StepSize;
var(*) /*0x35EA0000-0x00000000*/ private float NavMeshGen_EntityHalfHeight;
var(*) /*0x35EA0000-0x00000000*/ private float NavMeshGen_StartingHeightOffset;
var(*) /*0x35EA0000-0x00000000*/ private float NavMeshGen_MaxDropHeight;
var(*) /*0x35EA0000-0x00000000*/ private float NavMeshGen_MaxStepHeight;
var(*) /*0x35EA0000-0x00000000*/ private float NavMeshGen_VertZDeltaSnapThresh;
var(*) /*0x35EA0000-0x00000000*/ private float NavMeshGen_MinPolyArea;
var(*) /*0x35EA0000-0x00000000*/ private float NavMeshGen_BorderBackfill_CheckDist;
var(*) /*0x35EA0000-0x00000000*/ private float NavMeshGen_MinMergeDotAreaThreshold;
var(*) /*0x35EA0000-0x00000000*/ private float NavMeshGen_MinMergeDotSmallArea;
var(*) /*0x35EA0000-0x00000000*/ private float NavMeshGen_MinMergeDotLargeArea;
var(*) /*0x35EA0000-0x00000000*/ private float NavMeshGen_MaxPolyHeight;
var(*) /*0x35EA0000-0x00000000*/ private float NavMeshGen_HeightMergeThreshold;
var(*) /*0x35EA0000-0x00000000*/ private float NavMeshGen_EdgeMaxDelta;
var(*) /*0x35EA0000-0x00000000*/ private float NavMeshGen_MaxGroundCheckSize;
var(*) /*0x35EA0000-0x00000000*/ private float NavMeshGen_MinEdgeLength;
var(*) /*0x35EA0000-0x00000000*/ private bool NavMeshGen_ExpansionDoObstacleMeshSimplification;
var(*) /*0x43390000-0x00000000*/ private bool bHightlightOneWayReachSpecs[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bBuildReachSpecs;
var(*) /*0x35EA0000-0x00000000*/ private float MinMantleFallDist;
var(*) /*0x35EA0000-0x00000000*/ private float MaxMantleFallDist;
var(*) /*0x35EA0000-0x00000000*/ private float MinMantleLateralDist;
var(*) /*0x35EA0000-0x00000000*/ private float MaxMantleLateralDist;
var(*) /*0x35EA0000-0x00000000*/ private float MaxMantleFallTime;

simulated event PreBeginPlay()
{
    // End:0x13
    if(bCollideActors)
    {
        SetCollision(false, false);
    }
    //return;    
}

defaultproperties
{
    PathSizes=/* Array type was not detected. */
    TestJumpZ=420.0000000
    TestGroundSpeed=600.0000000
    TestMaxFallSpeed=2500.0000000
    TestFallSpeed=1200.0000000
    MinNumPlayerStarts=1
    DefaultReachSpecClass=Class'ReachSpec'
    EdgePathColors=/* Array type was not detected. */
    NavMeshGen_StepSize=30.0000000
    NavMeshGen_EntityHalfHeight=72.0000000
    NavMeshGen_StartingHeightOffset=65.0000000
    NavMeshGen_MaxDropHeight=60.0000000
    NavMeshGen_MaxStepHeight=35.0000000
    NavMeshGen_VertZDeltaSnapThresh=20.0000000
    NavMeshGen_MinPolyArea=25.0000000
    NavMeshGen_BorderBackfill_CheckDist=70.0000000
    NavMeshGen_MinMergeDotAreaThreshold=2.0000000
    NavMeshGen_MinMergeDotLargeArea=0.9500000
    NavMeshGen_MaxPolyHeight=160.0000000
    NavMeshGen_HeightMergeThreshold=10.0000000
    NavMeshGen_EdgeMaxDelta=2.0000000
    NavMeshGen_MaxGroundCheckSize=30.0000000
    NavMeshGen_MinEdgeLength=7.0000000
    NavMeshGen_ExpansionDoObstacleMeshSimplification=true
    bBuildReachSpecs=true
    AccelRate=1.0000000
    // Reference: CylinderComponent'Default__Scout.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    RemoteRole=ENetRole.ROLE_None
    bCollideActors=false
    bCollideWorld=false
    bBlockActors=false
    bProjTarget=false
    bPathColliding=true
    CollisionComponent=CollisionCylinder
}