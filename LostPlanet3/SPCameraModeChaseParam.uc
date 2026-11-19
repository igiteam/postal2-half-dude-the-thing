class SPCameraModeChaseParam extends SPCameraModeParam
    abstract
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__Filter1__Delegate) /*0x056D0000-0x00000400*/ private float Radius[1073807361];
var(__Filter1__Delegate) /*0x056D0000-0x00000400*/ private float RadiusAddSprinting[1073807361];
var(__Filter1__Delegate) /*0x056D0000-0x00000000*/ private float MaxRigBaseDist[1073807361];
var(__Filter1__Delegate) /*0x056D0000-0x00000000*/ private float MaxRadius[1073807361];
var(__Filter1__Delegate) /*0x056D0000-0x00000400*/ private float CollisionRadius[1073807361];
var(__Filter1__Delegate) /*0x056D0000-0x00000400*/ private float CenterPitch[1073807361];
var(__Filter1__Delegate) /*0x056D0000-0x00000400*/ private float CenterPitchSpeed[1073807361];
var(__Filter1__Delegate) /*0x056D0000-0x00000400*/ private float LocPredictVelocityScale[1073807361];
var(__Filter1__Delegate) /*0x056D0000-0x00000400*/ private float FollowYawStrength[1073807361];
var(__Filter1__Delegate) /*0x056D0000-0x00000400*/ private float TowardCameraLimitAngle[1073807361];
var(__Filter1__Delegate) /*0x048D0000-0x00000400*/ private float PitchMin[1073807361];
var(__Filter1__Delegate) /*0x048D0000-0x00000400*/ private float PitchMax[1073807361];
var(__Filter1__Delegate) /*0x048D0000-0x00000400*/ private float DebugPitchMin[1073807361];
var(__Filter1__Delegate) /*0x048D0000-0x00000400*/ private float DebugPitchMax[1073807361];
var(__Filter1__Delegate) /*0x04450000-0x00000400*/ private @NULL TargetOffset[1073807361];
var(__Filter1__Delegate) /*0x04450000-0x00000400*/ private @NULL TargetNearOffset[1073807361];
var(__Filter1__Delegate) /*0x04450000-0x00000400*/ private bool bTargetOffsetInCameraSpace[1073807361];
var(__Filter1__Delegate) /*0x04450000-0x00000400*/ private bool bEnableTargetOffsetShoulderSwitch[1073807361];
var(__Filter1__Delegate) /*0x04450000-0x00000400*/ private bool bTargetOffsetTransitionOnlyIfMoving[1073807361];
var(__Filter1__Delegate) /*0x04450000-0x00000400*/ private float TargetOffsetTransitionSpeed[1073807361];
var(__Filter1__Delegate) /*0x04450000-0x00000400*/ private float TargetOffsetTransitionDeadZoneDegrees[1073807361];
var(__Filter1__Delegate) /*0x02890000-0x00000400*/ private float FilterRateLocation[1073807361];
var(__Filter1__Delegate) /*0x02890000-0x00000400*/ private float FilterRateRotation[1073807361];
var(__Filter1__Delegate) /*0x02890000-0x00000400*/ private float FilterRateFOV[1073807361];
var(__Filter1__Delegate) /*0x02890000-0x00000400*/ private float FilterRateOffset[1073807361];
var(__Filter1__Delegate) /*0x02890000-0x00000400*/ private float FilterRateCollide[1073807361];
var(__Filter1__Delegate) /*0x02890000-0x00000400*/ private float FilterRateRadius[1073807361];

defaultproperties
{
    Radius=190.0000000
    RadiusAddSprinting=90.0000000
    MaxRigBaseDist=100.0000000
    MaxRadius=300.0000000
    CollisionRadius=30.0000000
    CenterPitch=90.0000000
    CenterPitchSpeed=0.0050000
    FollowYawStrength=0.0000750
    TowardCameraLimitAngle=135.0000000
    PitchMin=60.0000000
    PitchMax=105.0000000
    DebugPitchMin=20.0000000
    DebugPitchMax=140.0000000
    TargetOffset=(X=0.0000000,Y=50.0000000,Z=-45.0000000)
    TargetNearOffset=(X=0.0000000,Y=12.0000000,Z=25.0000000)
    bTargetOffsetInCameraSpace=true
    bEnableTargetOffsetShoulderSwitch=true
    bTargetOffsetTransitionOnlyIfMoving=true
    TargetOffsetTransitionSpeed=90.0000000
    TargetOffsetTransitionDeadZoneDegrees=30.0000000
    FilterRateLocation=1.5000000
    FilterRateRotation=5.0000000
    FilterRateFOV=30.0000000
    FilterRateOffset=100.0000000
    FilterRateCollide=0.5000000
    FilterRateRadius=0.9000000
    CameraModeClass=Class'SPCameraModeChase'
    HeadTrackingPercent=0.3000000
}