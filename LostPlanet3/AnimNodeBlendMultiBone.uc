class AnimNodeBlendMultiBone extends AnimNodeBlendBase
    hidecategories(Object,Object,Object,Object);

struct native ChildBoneBlendInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array TargetPerBoneWeight;
    var(*) /*0x11A00000-0x00000000*/ private name InitTargetStartBone[65537];
    var(*) /*0x11A00000-0x00000000*/ private float InitPerBoneIncrease[65537];
    var(*) /*0x35EA0000-0x00000000*/ private name OldStartBone[131073];
    var(*) /*0x35EA0000-0x00000000*/ private float OldBoneIncrease[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array TargetRequiredBones[536870913];

    structdefaultproperties
    {
        TargetPerBoneWeight=none
        InitTargetStartBone="None"
        InitPerBoneIncrease=1.0000000
        OldStartBone="None"
        OldBoneIncrease=0.0000000
        TargetRequiredBones=none
    }
};

var(*) /*0x02D60000-0x00000000*/ private editfixedsize array BlendTargetList[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SourceRequiredBones[536870913];

// Export UAnimNodeBlendMultiBone::execSetTargetStartBone(FFrame&, void* const)
native final function SetTargetStartBone()
{
    local /*0x35EA0000-0x00000000*/ private int TargetIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private name StartBoneName[8388609];
    local /*0x35EA0000-0x00000000*/ private float PerBoneIncrease[9437185];


}

defaultproperties
{
    Children=/* Array type was not detected. */
}