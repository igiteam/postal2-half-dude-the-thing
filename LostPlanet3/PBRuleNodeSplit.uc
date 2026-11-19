class PBRuleNodeSplit extends PBRuleNodeBase
    editinlinenew
    collapsecategories
    hidecategories(Object,Object);

struct native RBSplitInfo
{
    var(*) /*0x401F0000-0x00000000*/ private bool bFixSize[65537];
    var(*) /*0x401F0000-0x00000000*/ private float FixedSize[65537];
    var(*) /*0x401F0000-0x00000000*/ private float ExpandRatio[65537];
    var(*) /*0x401F0000-0x00000000*/ private name SplitName[65537];

    structdefaultproperties
    {
        bFixSize=false
        FixedSize=512.0000000
        ExpandRatio=1.0000000
        SplitName="None"
    }
};

var(*) /*0x3B7F0000-0x00000000*/ private byte SplitAxis[65537];
var(*) /*0x3B7F0000-0x00000000*/ private editfixedsize array SplitSetup[65537];

defaultproperties
{
    SplitAxis=EProcBuildingAxis.EPBAxis_Z
    NextRules=/* Array type was not detected. */
}