class MorphNodeWeightByBoneRotation extends MorphNodeWeightBase
    hidecategories(Object,Object,Object);

var(*) /*0x35EA0000-0x00000000*/ private float Angle[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float NodeWeight[537001985];
var(*) /*0x33770000-0x00000000*/ private name BoneName[65537];
var(*) /*0x33770000-0x00000000*/ private byte BoneAxis[65537];
var(*) /*0x33770000-0x00000000*/ private bool bInvertBoneAxis[65537];
var(*) /*0x30850000-0x00000000*/ private bool bControlMaterialParameter[65537];
var(*) /*0x33770000-0x00000000*/ private editfixedsize array WeightArray[65537];
var(*) /*0x30850000-0x00000000*/ private int MaterialSlotId[65537];
var(*) /*0x30850000-0x00000000*/ private name ScalarParameterName[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MaterialInstanceConstant[536870913];

defaultproperties
{
    BoneAxis=EAxis.AXIS_Y
    WeightArray=/* Array type was not detected. */
    NodeConns=/* Array type was not detected. */
}