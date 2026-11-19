class SkelControl_CCD_IK extends SkelControlBase
    hidecategories(Object,Object);

var(*) /*0x1F540000-0x00000000*/ private @NULL EffectorLocation[65537];
var(*) /*0x1F540000-0x00000000*/ private byte EffectorLocationSpace[65537];
var(*) /*0x1F540000-0x00000000*/ private name EffectorSpaceBoneName[65537];
var(*) /*0x1F540000-0x00000000*/ private @NULL EffectorTranslationFromBone[65537];
var(*) /*0x11330000-0x00000000*/ private int NumBones[65537];
var(*) /*0x11330000-0x00000000*/ private int MaxPerBoneIterations[65537];
var(*) /*0x35EA0000-0x00000000*/ private int IterationsCount[131073];
var(*) /*0x11330000-0x00000000*/ private float Precision[65537];
var(*) /*0x11330000-0x00000000*/ private bool bStartFromTail[65537];
var(*) /*0x11330000-0x00000000*/ private bool bNoTurnOptimization[65537];
var(*) /*0x11330000-0x00000000*/ private editfixedsize array AngleConstraint[196609];
var(*) /*0x11330000-0x00000000*/ private float MaxAngleSteps[65537];

defaultproperties
{
    NumBones=2
    MaxPerBoneIterations=3
    Precision=0.1000000
    MaxAngleSteps=0.4000000
}