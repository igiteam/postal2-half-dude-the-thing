class SPCameraModeDirectorParam extends SPCameraModeParam
    abstract
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__Filter1__Delegate) /*0x048D0000-0x00000400*/ private float PitchMin[1073807361];
var(__Filter1__Delegate) /*0x048D0000-0x00000400*/ private float PitchMax[1073807361];
var(__Filter1__Delegate) /*0x04450000-0x00000400*/ private @NULL TargetOffset[1073807361];
var(__Filter1__Delegate) /*0x03AD0000-0x00000400*/ private float LookPitchDelta[1073807361];
var(__Filter1__Delegate) /*0x03AD0000-0x00000400*/ private float LookYawDelta[1073807361];
var(__Filter1__Delegate) /*0x02890000-0x00000400*/ private float FilterRateLocation[1073807361];
var(__Filter1__Delegate) /*0x02890000-0x00000400*/ private float FilterRateRotation[1073807361];
var(__Filter1__Delegate) /*0x02890000-0x00000400*/ private float FilterRateLookAround[1073807361];
var(__Filter1__Delegate) /*0x02890000-0x00000400*/ private float FilterRateFOV[1073807361];
var(__Filter1__Delegate) /*0x05700000-0x00000400*/ private bool bUsePlayerRelativeControls[1073807361];
var(__Filter1__Delegate) /*0x05700000-0x00000400*/ private bool bUseSelfCentering[1073807361];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL ControlTarget;

defaultproperties
{
    PitchMin=20.0000000
    PitchMax=160.0000000
    LookPitchDelta=20.0000000
    LookYawDelta=30.0000000
    FilterRateLocation=0.9000000
    FilterRateRotation=2.0000000
    FilterRateLookAround=0.9500000
    FilterRateFOV=0.8000000
    CameraModeClass=Class'SPCameraModeDirector'
    LookRightScale=1.0000000
    LookUpScale=1.0000000
    LookAroundPitchMaximum=160.0000000
    LookAroundClampYaw=90.0000000
    IndirectLookThresholdInner=1.0000000
    IndirectLookThresholdOuter=1.0000000
}