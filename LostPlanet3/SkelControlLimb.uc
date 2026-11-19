class SkelControlLimb extends SkelControlBase
    hidecategories(Object,Object);

var(*) /*0x1F540000-0x00000000*/ private @NULL EffectorLocation[65537];
var(*) /*0x1F540000-0x00000000*/ private byte EffectorLocationSpace[65537];
var(*) /*0x2D0B0000-0x00000000*/ private byte JointTargetLocationSpace[65537];
var(*) /*0x2D0B0000-0x00000000*/ private byte JointOffsetSpace[65537];
var(*) /*0x2EE70000-0x00000000*/ private byte BoneAxis[65537];
var(*) /*0x2EE70000-0x00000000*/ private byte JointAxis[65537];
var(*) /*0x1F540000-0x00000000*/ private name EffectorSpaceBoneName[65537];
var(*) /*0x2D0B0000-0x00000000*/ private @NULL JointTargetLocation[65537];
var(*) /*0x2D0B0000-0x00000000*/ private name JointTargetSpaceBoneName[65537];
var(*) /*0x2D0B0000-0x00000000*/ private @NULL JointOffset[65537];
var(*) /*0x2D0B0000-0x00000000*/ private name JointOffsetBoneName[65537];
var(*) /*0x2EE70000-0x00000000*/ private bool bInvertBoneAxis[65537];
var(*) /*0x2EE70000-0x00000000*/ private bool bInvertJointAxis[65537];
var(*) /*0x2EE70000-0x00000000*/ private bool bRotateJoint[65537];
var(*) /*0x2EE70000-0x00000000*/ private bool bMaintainEffectorRelRot[65537];
var(*) /*0x2EE70000-0x00000000*/ private bool bTakeRotationFromEffectorSpace[65537];
var(*) /*0x47790000-0x00000000*/ private bool bAllowStretching[65537];
var(*) /*0x47790000-0x00000000*/ private @NULL StretchLimits[65537];
var(*) /*0x47790000-0x00000000*/ private name StretchRollBoneName[65537];

defaultproperties
{
    BoneAxis=EAxis.AXIS_X
    JointAxis=EAxis.AXIS_Y
    StretchLimits=(X=0.7100000,Y=1.2000000)
    bIgnoreWhenNotRendered=true
}