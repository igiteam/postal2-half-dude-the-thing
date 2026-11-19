class SkelControlWheel extends SkelControlSingleBone
    hidecategories(Object,Object,Translation,Rotation);

var(*) /*0x50A40000-0x00000000*/ private float WheelDisplacement[536936449];
var(*) /*0x50A40000-0x00000000*/ private float WheelMaxRenderDisplacement[65537];
var(*) /*0x50A40000-0x00000000*/ private float WheelRoll[536936449];
var(*) /*0x50A40000-0x00000000*/ private byte WheelRollAxis[65537];
var(*) /*0x50A40000-0x00000000*/ private byte WheelSteeringAxis[65537];
var(*) /*0x50A40000-0x00000000*/ private float WheelSteering[536936449];
var(*) /*0x50A40000-0x00000000*/ private bool bInvertWheelRoll[65537];
var(*) /*0x50A40000-0x00000000*/ private bool bInvertWheelSteering[65537];

defaultproperties
{
    WheelMaxRenderDisplacement=50.0000000
    WheelRollAxis=EAxis.AXIS_X
    WheelSteeringAxis=EAxis.AXIS_Z
    bApplyTranslation=true
    bApplyRotation=true
    bAddTranslation=true
    bAddRotation=true
    BoneTranslationSpace=EBoneControlSpace.BCS_BoneSpace
    BoneRotationSpace=EBoneControlSpace.BCS_BoneSpace
    bIgnoreWhenNotRendered=true
}