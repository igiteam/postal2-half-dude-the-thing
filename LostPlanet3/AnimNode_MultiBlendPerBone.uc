class AnimNode_MultiBlendPerBone extends AnimNodeBlendBase
    hidecategories(Object,Object,Object);

enum EWeightCheck
{
    EWC_AnimNodeSlotNotPlaying,     // 0
    EWC_MAX                         // 1
};

enum EBlendType
{
    EBT_ParentBoneSpace,            // 0
    EBT_MeshSpace,                  // 1
    EBT_MAX                         // 2
};

struct native WeightNodeRule
{
    var(*) /*0x50960000-0x00000000*/ private name NodeName[65537];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedNode;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedSlotNode;
    var(*) /*0x50960000-0x00000000*/ private byte WeightCheck[65537];
    var(*) /*0x50960000-0x00000000*/ private int ChildIndex[65537];

    structdefaultproperties
    {
        NodeName="None"
        CachedNode=none
        CachedSlotNode=none
        WeightCheck=EWeightCheck.EWC_AnimNodeSlotNotPlaying
        ChildIndex=0
    }
};

struct native WeightRule
{
    var(*) /*0x50970000-0x00000000*/ private @NULL FirstNode[65537];
    var(*) /*0x50970000-0x00000000*/ private @NULL SecondNode[65537];

    structdefaultproperties
    {
        FirstNode=(NodeName="None",CachedNode=none,CachedSlotNode=none,WeightCheck=EWeightCheck.EWC_AnimNodeSlotNotPlaying,ChildIndex=0)
        SecondNode=(NodeName="None",CachedNode=none,CachedSlotNode=none,WeightCheck=EWeightCheck.EWC_AnimNodeSlotNotPlaying,ChildIndex=0)
    }
};

struct native BranchInfo
{
    var(*) /*0x0CDF0000-0x00000000*/ private name BoneName[65537];
    var(*) /*0x0CDF0000-0x00000000*/ private float PerBoneWeightIncrease[65537];

    structdefaultproperties
    {
        BoneName="None"
        PerBoneWeightIncrease=1.0000000
    }
};

struct native PerBoneMaskInfo
{
    var(*) /*0x3BE90000-0x00000000*/ private editfixedsize array BranchList[65537];
    var(*) /*0x3BE90000-0x00000000*/ private float DesiredWeight[65537];
    var(*) /*0x3BE90000-0x00000000*/ private float BlendTimeToGo[65537];
    var(*) /*0x3BE90000-0x00000000*/ private editfixedsize array WeightRuleList[65537];
    var(*) /*0x3BE90000-0x00000000*/ private bool bWeightBasedOnNodeRules[65537];
    var(*) /*0x3BE90000-0x00000000*/ private bool bDisableForNonLocalHumanPlayers[65537];
    var(*) /*0x35EA0000-0x00000000*/ private bool bPendingBlend[536870913];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PerBoneWeights[536870913];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array TransformReqBone[536870913];
    var(*) /*0x35EA0000-0x00000000*/ private int TransformReqBoneIndex[536870913];

    structdefaultproperties
    {
        BranchList=none
        DesiredWeight=0.0000000
        BlendTimeToGo=0.0000000
        WeightRuleList=none
        bWeightBasedOnNodeRules=false
        bDisableForNonLocalHumanPlayers=false
        bPendingBlend=false
        PerBoneWeights=none
        TransformReqBone=none
        TransformReqBoneIndex=0
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL PawnOwner[537001985];
var(*) /*0x02C90000-0x00000400*/ private editfixedsize array MaskList[4259841];
var(*) /*0x02C90000-0x00000000*/ private byte RotationBlendType[65537];

// Export UAnimNode_MultiBlendPerBone::execSetMaskWeight(FFrame&, void* const)
native final function SetMaskWeight()
{
    local /*0x35EA0000-0x00000000*/ private int MaskIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private float DesiredWeight[8388609], BlendTime;


}

defaultproperties
{
    Children=/* Array type was not detected. */
}