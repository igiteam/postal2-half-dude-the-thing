class PBRuleNodeCorner extends PBRuleNodeBase
    editinlinenew
    collapsecategories
    hidecategories(Object,Object);

struct native RBCornerAngleInfo
{
    var(*) /*0x40170000-0x00000000*/ private float Angle[65537];
    var(*) /*0x40170000-0x00000000*/ private float CornerSize[65537];

    structdefaultproperties
    {
        Angle=0.0000000
        CornerSize=0.0000000
    }
};

var(*) /*0x3B730000-0x00000000*/ private float CornerSize[65537];
var(*) /*0x3B730000-0x00000000*/ private editfixedsize array Angles[65537];
var(*) /*0x3B730000-0x00000000*/ private float FlatThreshold[65537];
var(*) /*0x3B730000-0x00000000*/ private bool bNoMeshForConcaveCorners[65537];
var(*) /*0x3B730000-0x00000000*/ private bool bUseAdjacentRulesetForRightGap[65537];
var(*) /*0x3B730000-0x00000000*/ private byte CornerType[65537];
var(*) /*0x3B730000-0x00000000*/ private float CornerShapeOffset[65537];
var(*) /*0x3B730000-0x00000000*/ private int RoundTesselation[65537];
var(*) /*0x3B730000-0x00000000*/ private float RoundCurvature[65537];

defaultproperties
{
    CornerSize=256.0000000
    Angles=/* Array type was not detected. */
    FlatThreshold=5.0000000
    RoundTesselation=4
    RoundCurvature=1.0000000
}