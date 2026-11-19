class RB_ConstraintSetup extends Object
    hidecategories(Object);

struct native LinearDOFSetup
{
    var(*) /*0x2EFA0000-0x00000000*/ private byte bLimited[65537];
    var(*) /*0x2EFA0000-0x00000000*/ private float LimitSize[65537];

    structdefaultproperties
    {
        bLimited=1
        LimitSize=0.0000000
    }
};

var(*) /*0x3FE20000-0x00000000*/ private name JointName[196609];
var(*) /*0x3FE20000-0x00000000*/ private name ConstraintBone1[65537];
var(*) /*0x3FE20000-0x00000000*/ private name ConstraintBone2[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Pos1;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PriAxis1;
var(*) /*0x35EA0000-0x00000000*/ private @NULL SecAxis1;
var(*) /*0x35EA0000-0x00000000*/ private @NULL Pos2;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PriAxis2;
var(*) /*0x35EA0000-0x00000000*/ private @NULL SecAxis2;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PulleyPivot1;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PulleyPivot2;
var(*) /*0x3FE20000-0x00000000*/ private bool bEnableProjection[65537];
var(*) /*0x2EF00000-0x00000000*/ private bool bLinearLimitSoft[65537];
var(*) /*0x2EF00000-0x00000000*/ private bool bLinearBreakable[65537];
var(*) /*0x027F0000-0x00000000*/ private bool bSwingLimited[65537];
var(*) /*0x027F0000-0x00000000*/ private bool bTwistLimited[65537];
var(*) /*0x027F0000-0x00000000*/ private bool bSwingLimitSoft[65537];
var(*) /*0x027F0000-0x00000000*/ private bool bTwistLimitSoft[65537];
var(*) /*0x027F0000-0x00000000*/ private bool bAngularBreakable[65537];
var(*) /*0x3F360000-0x00000000*/ private bool bIsPulley[65537];
var(*) /*0x3F360000-0x00000000*/ private bool bMaintainMinDistance[65537];
var(*) /*0x2EF00000-0x00000000*/ private @NULL LinearXSetup[65537];
var(*) /*0x2EF00000-0x00000000*/ private @NULL LinearYSetup[65537];
var(*) /*0x2EF00000-0x00000000*/ private @NULL LinearZSetup[65537];
var(*) /*0x2EF00000-0x00000000*/ private float LinearLimitStiffness[65537];
var(*) /*0x2EF00000-0x00000000*/ private float LinearLimitDamping[65537];
var(*) /*0x2EF00000-0x00000000*/ private float LinearBreakThreshold[65537];
var(*) /*0x027F0000-0x00000000*/ private float Swing1LimitAngle[65537];
var(*) /*0x027F0000-0x00000000*/ private float Swing2LimitAngle[65537];
var(*) /*0x027F0000-0x00000000*/ private float TwistLimitAngle[65537];
var(*) /*0x027F0000-0x00000000*/ private float SwingLimitStiffness[65537];
var(*) /*0x027F0000-0x00000000*/ private float SwingLimitDamping[65537];
var(*) /*0x027F0000-0x00000000*/ private float TwistLimitStiffness[65537];
var(*) /*0x027F0000-0x00000000*/ private float TwistLimitDamping[65537];
var(*) /*0x027F0000-0x00000000*/ private float AngularBreakThreshold[65537];
var(*) /*0x3F360000-0x00000000*/ private float PulleyRatio[65537];

defaultproperties
{
    PriAxis1=(X=1.0000000,Y=0.0000000,Z=0.0000000)
    SecAxis1=(X=0.0000000,Y=1.0000000,Z=0.0000000)
    PriAxis2=(X=1.0000000,Y=0.0000000,Z=0.0000000)
    SecAxis2=(X=0.0000000,Y=1.0000000,Z=0.0000000)
    LinearXSetup=(bLimited=1,LimitSize=0.0000000)
    LinearYSetup=(bLimited=1,LimitSize=0.0000000)
    LinearZSetup=(bLimited=1,LimitSize=0.0000000)
    LinearBreakThreshold=300.0000000
    AngularBreakThreshold=500.0000000
    PulleyRatio=1.0000000
}