class FracturedStaticMeshComponent extends FracturedBaseComponent
    editinlinenew
    hidecategories(Object);

struct native FragmentGroup
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FragmentIndices;
    var(*) /*0x35EA0000-0x00000000*/ private bool bGroupIsRooted;

    structdefaultproperties
    {
        FragmentIndices=none
        bGroupIsRooted=false
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FragmentNeighborsVisible[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL VisibleBox[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bUseSkinnedRendering[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bUseVisibleVertsForBounds;
var(*) /*0x247B0000-0x00000000*/ private bool bTopFragmentsRootNonDestroyable[65537];
var(*) /*0x247B0000-0x00000000*/ private bool bBottomFragmentsRootNonDestroyable[65537];
var(*) /*0x247B0000-0x00000000*/ private float TopBottomFragmentDistThreshold[65537];
var(*) /*0x247B0000-0x00000000*/ private @NULL LoseChunkOutsideMaterialOverride[65537];
var(*) /*0x35EA0000-0x00000000*/ private float FragmentBoundsMaxZ;
var(*) /*0x35EA0000-0x00000000*/ private float FragmentBoundsMinZ;
var(*) /*0x35EA0000-0x00000400*/ private export @NULL SkinnedComponent[537395201];

// Export UFracturedStaticMeshComponent::execSetVisibleFragments(FFrame&, void* const)
native final function SetVisibleFragments()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array VisibilityFactors[8388609];


}

// Export UFracturedStaticMeshComponent::execIsFragmentDestroyable(FFrame&, void* const)
native final function IsFragmentDestroyable()
{
    local /*0x35EA0000-0x00000000*/ private int FragmentIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UFracturedStaticMeshComponent::execIsRootFragment(FFrame&, void* const)
native final function IsRootFragment()
{
    local /*0x35EA0000-0x00000000*/ private int FragmentIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UFracturedStaticMeshComponent::execIsNoPhysFragment(FFrame&, void* const)
native final function IsNoPhysFragment()
{
    local /*0x35EA0000-0x00000000*/ private int FragmentIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UFracturedStaticMeshComponent::execGetFragmentBox(FFrame&, void* const)
native final function GetFragmentBox()
{
    local /*0x35EA0000-0x00000000*/ private int FragmentIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UFracturedStaticMeshComponent::execGetFragmentAverageExteriorNormal(FFrame&, void* const)
native final function GetFragmentAverageExteriorNormal()
{
    local /*0x35EA0000-0x00000000*/ private int FragmentIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UFracturedStaticMeshComponent::execGetCoreFragmentIndex(FFrame&, void* const)
native final function GetCoreFragmentIndex()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UFracturedStaticMeshComponent::execGetFragmentGroups(FFrame&, void* const)
native final function GetFragmentGroups()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array IgnoreFragments[8388609];
    local /*0x35EA0000-0x00000000*/ private float MinConnectionArea[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ReturnValue[92274689];


}

// Export UFracturedStaticMeshComponent::execGetBoundaryHiddenFragments(FFrame&, void* const)
native final function GetBoundaryHiddenFragments()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array AdditionalVisibleFragments[8388609], ReturnValue;


}

// Export UFracturedStaticMeshComponent::execRecreatePhysState(FFrame&, void* const)
native final function RecreatePhysState();

// Export UFracturedStaticMeshComponent::execGetFracturedMeshPhysMaterial(FFrame&, void* const)
native final function GetFracturedMeshPhysMaterial()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}
