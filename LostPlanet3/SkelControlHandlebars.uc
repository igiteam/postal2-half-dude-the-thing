class SkelControlHandlebars extends SkelControlSingleBone
    hidecategories(Object,Object,Translation,Rotation);

var(*) /*0x28BA0000-0x00000000*/ private byte WheelRollAxis[65537];
var(*) /*0x28BA0000-0x00000000*/ private byte HandlebarRotateAxis[65537];
var(*) /*0x28BA0000-0x00000000*/ private name WheelBoneName[65537];
var(*) /*0x28BA0000-0x00000000*/ private bool bInvertRotation[65537];
var(*) /*0x35EA0000-0x00000000*/ private int SteerWheelBoneIndex;

defaultproperties
{
    WheelRollAxis=EAxis.AXIS_Y
    HandlebarRotateAxis=EAxis.AXIS_Z
    SteerWheelBoneIndex=-1
    bApplyRotation=true
    BoneTranslationSpace=EBoneControlSpace.BCS_BoneSpace
    BoneRotationSpace=EBoneControlSpace.BCS_BoneSpace
    bIgnoreWhenNotRendered=true
}