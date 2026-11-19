class SkelControlLookAt extends SkelControlBase
    hidecategories(Object,Object);

var(*) /*0x2FE10000-0x00000000*/ private @NULL TargetLocation[65537];
var(*) /*0x2FE10000-0x00000000*/ private byte TargetLocationSpace[65537];
var(*) /*0x2FE10000-0x00000000*/ private byte LookAtAxis[65537];
var(*) /*0x2FE10000-0x00000000*/ private byte UpAxis[65537];
var(*) /*0x2EE80000-0x00000000*/ private byte AllowRotationSpace[65537];
var(*) /*0x2FE10000-0x00000000*/ private name TargetSpaceBoneName[65537];
var(*) /*0x2FE10000-0x00000000*/ private bool bInvertLookAtAxis[65537];
var(*) /*0x2FE10000-0x00000000*/ private bool bDefineUpAxis[65537];
var(*) /*0x2FE10000-0x00000000*/ private bool bInvertUpAxis[65537];
var(*) /*0x2EE80000-0x00000000*/ private bool bEnableLimit[65537];
var(*) /*0x2EE80000-0x00000000*/ private bool bLimitBasedOnRefPose[65537];
var(*) /*0x2EE80000-0x00000000*/ private bool bDisableBeyondLimit[65537];
var(*) /*0x2EE80000-0x00000000*/ private bool bNotifyBeyondLimit[65537];
var(*) /*0x2EE80000-0x00000000*/ private bool bShowLimit[65537];
var(*) /*0x2EE80000-0x00000000*/ private bool bAllowRotationX[65537];
var(*) /*0x2EE80000-0x00000000*/ private bool bAllowRotationY[65537];
var(*) /*0x2EE80000-0x00000000*/ private bool bAllowRotationZ[65537];
var(*) /*0x2FE10000-0x00000000*/ private float TargetLocationInterpSpeed[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DesiredTargetLocation;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ActorSpaceLookAtTarget[537001985];
var(*) /*0x2EE80000-0x00000000*/ private float MaxAngle[65537];
var(*) /*0x2EE80000-0x00000000*/ private float OuterMaxAngle[65537];
var(*) /*0x2EE80000-0x00000000*/ private float DeadZoneAngle[65537];
var(*) /*0x2EE80000-0x00000000*/ private @NULL RotationAngleRangeX[65537];
var(*) /*0x2EE80000-0x00000000*/ private @NULL RotationAngleRangeY[65537];
var(*) /*0x2EE80000-0x00000000*/ private @NULL RotationAngleRangeZ[65537];
var(*) /*0x2EE80000-0x00000000*/ private name AllowRotationOtherBoneName[65537];
var(*) /*0x35EA0000-0x00000000*/ private float LookAtAlpha[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float LookAtAlphaTarget[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float LookAtAlphaBlendTimeToGo[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LimitLookDir[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL BaseLookDir[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL BaseBonePos[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float LastCalcTime[537001985];
var(*) /*0x35EA0000-0x00000000*/ private int ControlBoneIndex[537001985];

// Export USkelControlLookAt::execSetTargetLocation(FFrame&, void* const)
native final function SetTargetLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewTargetLocation[8388609];


}

// Export USkelControlLookAt::execInterpolateTargetLocation(FFrame&, void* const)
native final function InterpolateTargetLocation()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];


}

// Export USkelControlLookAt::execSetLookAtAlpha(FFrame&, void* const)
native final function SetLookAtAlpha()
{
    local /*0x35EA0000-0x00000000*/ private float DesiredAlpha[8388609], DesiredBlendTime;


}

// Export USkelControlLookAt::execCanLookAtPoint(FFrame&, void* const)
native final function CanLookAtPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PointLoc[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bDrawDebugInfo[9437185], bDebugUsePersistentLines, bDebugFlushLinesFirst, ReturnValue;


}

defaultproperties
{
    LookAtAxis=EAxis.AXIS_X
    UpAxis=EAxis.AXIS_Z
    AllowRotationSpace=EBoneControlSpace.BCS_BoneSpace
    bLimitBasedOnRefPose=true
    bShowLimit=true
    bAllowRotationX=true
    bAllowRotationY=true
    bAllowRotationZ=true
    TargetLocationInterpSpeed=10.0000000
    ActorSpaceLookAtTarget=(X=256.0000000,Y=0.0000000,Z=0.0000000)
    OuterMaxAngle=90.0000000
    RotationAngleRangeX=(X=-90.0000000,Y=90.0000000)
    RotationAngleRangeY=(X=-90.0000000,Y=90.0000000)
    RotationAngleRangeZ=(X=-90.0000000,Y=90.0000000)
    LookAtAlpha=1.0000000
    LookAtAlphaTarget=1.0000000
    ControlBoneIndex=-1
    BlendInTime=0.3300000
    BlendOutTime=0.3300000
    bIgnoreWhenNotRendered=true
}