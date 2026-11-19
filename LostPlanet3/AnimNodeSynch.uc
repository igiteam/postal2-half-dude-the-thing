class AnimNodeSynch extends AnimNodeBlendBase
    hidecategories(Object,Object,Object);

struct native SynchGroup
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SeqNodes;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL MasterNode[536870913];
    var(*) /*0x4B2A0000-0x00000000*/ private name GroupName[65537];
    var(*) /*0x4B2A0000-0x00000000*/ private bool bFireSlaveNotifies[65537];
    var(*) /*0x4B2A0000-0x00000000*/ private float RateScale[65537];

    structdefaultproperties
    {
        SeqNodes=none
        MasterNode=none
        GroupName="None"
        bFireSlaveNotifies=false
        RateScale=1.0000000
    }
};

var(*) /*0x02E60000-0x00000000*/ private editfixedsize array Groups[65537];

// Export UAnimNodeSynch::execAddNodeToGroup(FFrame&, void* const)
native final function AddNodeToGroup()
{
    local /*0x35EA0000-0x00000000*/ private @NULL SeqNode[8388609];
    local /*0x35EA0000-0x00000000*/ private name GroupName[8388609];


}

// Export UAnimNodeSynch::execRemoveNodeFromGroup(FFrame&, void* const)
native final function RemoveNodeFromGroup()
{
    local /*0x35EA0000-0x00000000*/ private @NULL SeqNode[8388609];
    local /*0x35EA0000-0x00000000*/ private name GroupName[8388609];


}

// Export UAnimNodeSynch::execGetMasterNodeOfGroup(FFrame&, void* const)
native final function GetMasterNodeOfGroup()
{
    local /*0x35EA0000-0x00000000*/ private name GroupName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UAnimNodeSynch::execForceRelativePosition(FFrame&, void* const)
native final function ForceRelativePosition()
{
    local /*0x35EA0000-0x00000000*/ private name GroupName[8388609];
    local /*0x35EA0000-0x00000000*/ private float RelativePosition[8388609];


}

// Export UAnimNodeSynch::execGetRelativePosition(FFrame&, void* const)
native final function GetRelativePosition()
{
    local /*0x35EA0000-0x00000000*/ private name GroupName[8388609];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UAnimNodeSynch::execSetGroupRateScale(FFrame&, void* const)
native final function SetGroupRateScale()
{
    local /*0x35EA0000-0x00000000*/ private name GroupName[8388609];
    local /*0x35EA0000-0x00000000*/ private float NewRateScale[8388609];


}

defaultproperties
{
    Children=/* Array type was not detected. */
    bFixNumChildren=true
}