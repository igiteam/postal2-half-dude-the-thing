class KynapseBotHandle extends KynapseHandle
    collapsecategories
    hidecategories(Object,Object);

enum EKynapseAnimationState
{
    KynapseAnimation_None,          // 0
    KynapseAnimation_Idle,          // 1
    KynapseAnimation_BeginClimbing, // 2
    KynapseAnimation_Climbing,      // 3
    KynapseAnimation_EndClimbing,   // 4
    KynapseAnimation_EnterLift,     // 5
    KynapseAnimation_Lifting,       // 6
    KynapseAnimation_ExitLift,      // 7
    KynapseAnimation_WaitForDoor,   // 8
    KynapseAnimation_EndWaitFromDoor,// 9
    KynapseAnimation_Shooting,      // 10
    KynapseAnimation_Jump,          // 11
    KynapseAnimation_MAX            // 12
};

var(accidentRatio) /*0x01390000-0x00000000*/ private @NULL PathDataFamily[65537];
var(accidentRatio) /*0x01390000-0x00000000*/ private @NULL ModifierSetting[65537];
var(accidentRatio) /*0x01390000-0x00000000*/ private @NULL LpfContext[65537];
var(accidentRatio) /*0x01390000-0x00000400*/ private editfixedsize @NULL SeqActAgent[720897];
var(accidentRatio) /*0x01390000-0x00000000*/ private @NULL Team[65537];
var(accidentRatio) /*0x02000000-0x00000000*/ private byte animationState[536870913];

// Export UKynapseBotHandle::execPathFinder_TraceLine(FFrame&, void* const)
native function PathFinder_TraceLine()
{
    local /*0x02000000-0x00000000*/ private @NULL Dest[8388609], Source, HitLocation;
    local /*0x02000000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UKynapseBotHandle::execPathFinder_IsLocationInNavMesh(FFrame&, void* const)
native function PathFinder_IsLocationInNavMesh()
{
    local /*0x02000000-0x00000000*/ private @NULL InLocation[25296897];
    local /*0x02000000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UKynapseBotHandle::execPathFinder_GetClosestInsideAIMesh(FFrame&, void* const)
native function PathFinder_GetClosestInsideAIMesh()
{
    local /*0x02000000-0x00000000*/ private @NULL InLocation[25296897], ClosestInsideAIMesh;
    local /*0x02000000-0x00000000*/ private float MaxHorizontal[9437185], MaxVertical, GapInsideAIMesh;
    local /*0x02000000-0x00000000*/ private bool ReturnValue[92274689];

    100.0000000
    300.0000000
    10.0000000                            
}

// Export UKynapseBotHandle::execPathFinder_CheckInsideNavMeshAndAdjustToFloor(FFrame&, void* const)
native function PathFinder_CheckInsideNavMeshAndAdjustToFloor()
{
    local /*0x02000000-0x00000000*/ private @NULL InLocation[25296897], OutAdjustedLocation;
    local /*0x02000000-0x00000000*/ private float InMinFloorHeight[9437185], MaxVertical;
    local /*0x02000000-0x00000000*/ private bool ReturnValue[92274689];

    0.0000000
    300.0000000                        
}
