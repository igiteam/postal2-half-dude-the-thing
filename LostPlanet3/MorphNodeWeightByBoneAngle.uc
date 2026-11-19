class MorphNodeWeightByBoneAngle extends MorphNodeWeightBase
    hidecategories(Object,Object,Object);

struct native BoneAngleMorph
{
    var(*) /*0x0B250000-0x00000000*/ private float Angle[65537];
    var(*) /*0x0B250000-0x00000000*/ private float TargetWeight[65537];

    structdefaultproperties
    {
        Angle=0.0000000
        TargetWeight=1.0000000
    }
};

var(*) /*0x35EA0000-0x00000000*/ private float Angle[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float NodeWeight[537001985];
var(*) /*0x04ED0000-0x00000000*/ private name BaseBoneName[65537];
var(*) /*0x04ED0000-0x00000000*/ private byte BaseBoneAxis[65537];
var(*) /*0x02770000-0x00000000*/ private byte AngleBoneAxis[65537];
var(*) /*0x04ED0000-0x00000000*/ private bool bInvertBaseBoneAxis[65537];
var(*) /*0x02770000-0x00000000*/ private bool bInvertAngleBoneAxis[65537];
var(*) /*0x30850000-0x00000000*/ private bool bControlMaterialParameter[65537];
var(*) /*0x02770000-0x00000000*/ private name AngleBoneName[65537];
var(*) /*0x30850000-0x00000000*/ private int MaterialSlotId[65537];
var(*) /*0x30850000-0x00000000*/ private name ScalarParameterName[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MaterialInstanceConstant[536870913];
var(*) /*0x33760000-0x00000000*/ private editfixedsize array WeightArray[65537];

defaultproperties
{
    BaseBoneAxis=EAxis.AXIS_X
    AngleBoneAxis=EAxis.AXIS_X
    WeightArray=/* Array type was not detected. */
    NodeConns=/* Array type was not detected. */
}