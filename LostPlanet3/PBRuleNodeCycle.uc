class PBRuleNodeCycle extends PBRuleNodeBase
    editinlinenew
    collapsecategories
    hidecategories(Object,Object);

var(*) /*0x3B740000-0x00000000*/ private byte RepeatAxis[65537];
var(*) /*0x3B740000-0x00000000*/ private float RepeatSize[65537];
var(*) /*0x3B740000-0x00000000*/ private int CycleSize[65537];
var(*) /*0x3B740000-0x00000000*/ private bool bFixRepeatSize[65537];

defaultproperties
{
    RepeatAxis=EProcBuildingAxis.EPBAxis_Z
    RepeatSize=512.0000000
    CycleSize=2
    NextRules=/* Array type was not detected. */
}