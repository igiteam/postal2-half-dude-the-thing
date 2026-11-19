class FracturedBaseComponent extends StaticMeshComponent
    abstract
    editinlinenew
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private @NULL ComponentBaseResources[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ReleaseResourcesFence[805437441];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array VisibleFragments[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bVisibilityHasChanged[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bVisibilityReset[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bInitialVisibilityValue[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bUseDynamicIndexBuffer[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bUseDynamicIBWithHiddenFragments[131073];
var(*) /*0x35EA0000-0x00000000*/ private int NumResourceIndices[131073];
var(*) /*0x35EA0000-0x00000000*/ private int bResetStaticMesh[537001985];

// Export UFracturedBaseComponent::execSetStaticMesh(FFrame&, void* const)
native simulated function SetStaticMesh()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewMesh[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bForce[9437185], ReturnValue;


}

// Export UFracturedBaseComponent::execGetVisibleFragments(FFrame&, void* const)
native simulated function GetVisibleFragments()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ReturnValue[92274689];


}

// Export UFracturedBaseComponent::execIsFragmentVisible(FFrame&, void* const)
native simulated function IsFragmentVisible()
{
    local /*0x35EA0000-0x00000000*/ private int FragmentIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UFracturedBaseComponent::execGetNumFragments(FFrame&, void* const)
native function GetNumFragments()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UFracturedBaseComponent::execGetNumVisibleFragments(FFrame&, void* const)
native function GetNumVisibleFragments()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}
