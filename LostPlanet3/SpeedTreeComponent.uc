class SpeedTreeComponent extends PrimitiveComponent
    editinlinenew
    hidecategories(Object)
    autoexpandcategories(Collision,Rendering,Lighting);

enum ESpeedTreeMeshType
{
    STMT_MinMinusOne,               // 0
    STMT_Branches1,                 // 1
    STMT_Branches2,                 // 2
    STMT_Fronds,                    // 3
    STMT_LeafCards,                 // 4
    STMT_LeafMeshes,                // 5
    STMT_Billboards,                // 6
    STMT_Max                        // 7
};

struct native SpeedTreeStaticLight
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Guid[131073];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL BranchShadowMap[131073];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL FrondShadowMap[131073];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LeafMeshShadowMap[131073];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LeafCardShadowMap[131073];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL BillboardShadowMap[131073];

    structdefaultproperties
    {
        Guid=(A=0,B=0,C=0,D=0)
        BranchShadowMap=none
        FrondShadowMap=none
        LeafMeshShadowMap=none
        LeafCardShadowMap=none
        BillboardShadowMap=none
    }
};

var(*) /*0x49060000-0x00000000*/ private @NULL SpeedTree[196609];
var(*) /*0x49060000-0x00000000*/ private bool bUseLeafCards[65537];
var(*) /*0x49060000-0x00000000*/ private bool bUseLeafMeshes[65537];
var(*) /*0x49060000-0x00000000*/ private bool bUseBranches[65537];
var(*) /*0x49060000-0x00000000*/ private bool bUseFronds[65537];
var(*) /*0x49060000-0x00000000*/ private bool bUseBillboards[65537];
var(*) /*0x49060000-0x00000000*/ private float Lod3DStart[65537];
var(*) /*0x49060000-0x00000000*/ private float Lod3DEnd[65537];
var(*) /*0x49060000-0x00000000*/ private float LodBillboardStart[65537];
var(*) /*0x49060000-0x00000000*/ private float LodBillboardEnd[65537];
var(*) /*0x49060000-0x00000000*/ private float LodLevelOverride[65537];
var(*) /*0x49060000-0x00000000*/ private @NULL Branch1Material[65537];
var(*) /*0x49060000-0x00000000*/ private @NULL Branch2Material[65537];
var(*) /*0x49060000-0x00000000*/ private @NULL FrondMaterial[65537];
var(*) /*0x49060000-0x00000000*/ private @NULL LeafCardMaterial[65537];
var(*) /*0x49060000-0x00000000*/ private @NULL LeafMeshMaterial[65537];
var(*) /*0x49060000-0x00000000*/ private @NULL BillboardMaterial[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SpeedTreeIcon;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array StaticLights[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL BranchLightMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL FrondLightMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LeafMeshLightMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LeafCardLightMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL BillboardLightMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RotationOnlyMatrix[268566529];
var(*) /*0x2ECC0000-0x00000000*/ private @NULL LightmassSettings[65537];

// Export USpeedTreeComponent::execGetMaterial(FFrame&, void* const)
native function GetMaterial()
{
    local /*0x35EA0000-0x00000000*/ private byte MeshType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USpeedTreeComponent::execSetMaterial(FFrame&, void* const)
native function SetMaterial()
{
    local /*0x35EA0000-0x00000000*/ private byte MeshType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Material[8388609];


}
