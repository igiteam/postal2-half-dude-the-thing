class SeqAct_SetMesh extends SequenceAction
    hidecategories(Object);

enum EMeshType
{
    MeshType_StaticMesh,            // 0
    MeshType_SkeletalMesh,          // 1
    MeshType_MAX                    // 2
};

var(*) /*0x44300000-0x00000000*/ private @NULL NewSkeletalMesh[65537];
var(*) /*0x44300000-0x00000000*/ private @NULL NewStaticMesh[65537];
var(*) /*0x44300000-0x00000000*/ private byte MeshType[65537];
var(*) /*0x44300000-0x00000000*/ private bool bIsAllowedToMove[65537];
var(*) /*0x44300000-0x00000000*/ private bool bAllowDecalsToReattach[65537];

defaultproperties
{
    ObjName="Set Mesh"
}