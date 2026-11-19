class AnimTree extends AnimNodeBlendBase
    hidecategories(Object,Object,Object,Object);

struct native AnimGroup
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SeqNodes[537001985];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SynchMaster[537001985];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL NotifyMaster[537001985];
    var(*) /*0x02B20000-0x00000000*/ private name GroupName[196609];
    var(*) /*0x02B20000-0x00000000*/ private float RateScale[196609];
    var(*) /*0x35EA0000-0x00000000*/ private float SynchPctPosition[131073];

    structdefaultproperties
    {
        SeqNodes=none
        SynchMaster=none
        NotifyMaster=none
        GroupName="None"
        RateScale=1.0000000
        SynchPctPosition=0.0000000
    }
};

struct native SkelControlListHead
{
    var(*) /*0x35EA0000-0x00000000*/ private name BoneName;
    var(*) /*0x35EA0000-0x00000400*/ private editfixedsize @NULL ControlHead[524289];
    var(*) /*0x35EA0000-0x00000000*/ private int DrawY;

    structdefaultproperties
    {
        BoneName="None"
        ControlHead=none
        DrawY=0
    }
};

struct native PreviewSkelMeshStruct
{
    var(*) /*0x3E440000-0x00000000*/ private name DisplayName[65537];
    var(*) /*0x3E440000-0x00000000*/ private @NULL PreviewSkelMesh[65537];
    var(*) /*0x3E440000-0x00000000*/ private editfixedsize array PreviewMorphSets[65537];

    structdefaultproperties
    {
        DisplayName="None"
        PreviewSkelMesh=none
        PreviewMorphSets=none
    }
};

struct native PreviewSocketStruct
{
    var(*) /*0x3E470000-0x00000000*/ private name DisplayName[65537];
    var(*) /*0x3E470000-0x00000000*/ private name SocketName[65537];
    var(*) /*0x3E470000-0x00000000*/ private @NULL PreviewSkelMesh[65537];
    var(*) /*0x3E470000-0x00000000*/ private @NULL PreviewStaticMesh[65537];

    structdefaultproperties
    {
        DisplayName="None"
        SocketName="None"
        PreviewSkelMesh=none
        PreviewStaticMesh=none
    }
};

struct native PreviewAnimSetsStruct
{
    var(*) /*0x3E280000-0x00000000*/ private name DisplayName[65537];
    var(*) /*0x3E280000-0x00000000*/ private editfixedsize array PreviewAnimSets[65537];

    structdefaultproperties
    {
        DisplayName="None"
        PreviewAnimSets=none
    }
};

var(*) /*0x03170000-0x00000000*/ private @NULL AnimTreeTemplate[196609];
var(*) /*0x03170000-0x00000000*/ private bool bEnablePooling[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bUseSavedPose;
var(*) /*0x35EA0000-0x00000000*/ private bool bBeingEdited[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bParentNodeArrayBuilt;
var(*) /*0x35EA0000-0x00000000*/ private bool bRebuildAnimTickArray;
var(*) /*0x03170000-0x00000000*/ private editfixedsize array AnimGroups[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize transient array PrioritizedSkelBranches;
var(*) /*0x03170000-0x00000000*/ private editfixedsize array ComposePrePassBoneNames[65537];
var(*) /*0x03170000-0x00000000*/ private editfixedsize array ComposePostPassBoneNames[65537];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize array RootMorphNodes[524289];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize array SkelControlLists[524289];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SavedPose;
var(*) /*0x35EA0000-0x00000000*/ private int MorphConnDrawY;
var(*) /*0x03170000-0x00000000*/ private float PreviewPlayRate[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient @NULL PreviewSkelMesh;
var(*) /*0x35EA0000-0x00000000*/ private transient @NULL SocketSkelMesh;
var(*) /*0x35EA0000-0x00000000*/ private transient @NULL SocketStaticMesh;
var(*) /*0x35EA0000-0x00000000*/ private transient name SocketName;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize transient array PreviewAnimSets;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize transient array PreviewMorphSets;
var(*) /*0x03170000-0x00000000*/ private editfixedsize array PreviewMeshList[65537];
var(*) /*0x35EA0000-0x00000000*/ private int PreviewMeshIndex;
var(*) /*0x03170000-0x00000000*/ private editfixedsize array PreviewSocketList[65537];
var(*) /*0x35EA0000-0x00000000*/ private int PreviewSocketIndex;
var(*) /*0x03170000-0x00000000*/ private editfixedsize array PreviewAnimSetList[65537];
var(*) /*0x35EA0000-0x00000000*/ private int PreviewAnimSetListIndex;
var(*) /*0x35EA0000-0x00000000*/ private int PreviewAnimSetIndex;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PreviewCamPos;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PreviewCamRot;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PreviewFloorPos;
var(*) /*0x35EA0000-0x00000000*/ private int PreviewFloorYaw;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AnimNodeFrames;
var(*) /*0x03170000-0x00000400*/ private editfixedsize @NULL GlobalPreviewValues[589825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array UnlinkedNodes;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AnimTickArray;

// Export UAnimTree::execFindSkelControl(FFrame&, void* const)
native final function FindSkelControl()
{
    local /*0x35EA0000-0x00000000*/ private name InControlName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UAnimTree::execFindMorphNode(FFrame&, void* const)
native final function FindMorphNode()
{
    local /*0x35EA0000-0x00000000*/ private name InNodeName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UAnimTree::execSetUseSavedPose(FFrame&, void* const)
native final function SetUseSavedPose()
{
    local /*0x35EA0000-0x00000000*/ private bool bUseSaved[8388609];


}

// Export UAnimTree::execSetAnimGroupForNode(FFrame&, void* const)
native final function SetAnimGroupForNode()
{
    local /*0x35EA0000-0x00000000*/ private @NULL SeqNode[8388609];
    local /*0x35EA0000-0x00000000*/ private name GroupName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bCreateIfNotFound[9437185], ReturnValue;


}

// Export UAnimTree::execGetGroupSynchMaster(FFrame&, void* const)
native final function GetGroupSynchMaster()
{
    local /*0x35EA0000-0x00000000*/ private name GroupName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UAnimTree::execGetGroupNotifyMaster(FFrame&, void* const)
native final function GetGroupNotifyMaster()
{
    local /*0x35EA0000-0x00000000*/ private name GroupName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UAnimTree::execForceGroupRelativePosition(FFrame&, void* const)
native final function ForceGroupRelativePosition()
{
    local /*0x35EA0000-0x00000000*/ private name GroupName[8388609];
    local /*0x35EA0000-0x00000000*/ private float RelativePosition[8388609];


}

// Export UAnimTree::execGetGroupRelativePosition(FFrame&, void* const)
native final function GetGroupRelativePosition()
{
    local /*0x35EA0000-0x00000000*/ private name GroupName[8388609];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UAnimTree::execSetGroupRateScale(FFrame&, void* const)
native final function SetGroupRateScale()
{
    local /*0x35EA0000-0x00000000*/ private name GroupName[8388609];
    local /*0x35EA0000-0x00000000*/ private float NewRateScale[8388609];


}

// Export UAnimTree::execGetGroupRateScale(FFrame&, void* const)
native final function GetGroupRateScale()
{
    local /*0x35EA0000-0x00000000*/ private name GroupName[8388609];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UAnimTree::execGetGroupIndex(FFrame&, void* const)
native final function GetGroupIndex()
{
    local /*0x35EA0000-0x00000000*/ private name GroupName[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

defaultproperties
{
    Children=/* Array type was not detected. */
    bFixNumChildren=true
}