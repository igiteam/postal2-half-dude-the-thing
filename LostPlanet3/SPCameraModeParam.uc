class SPCameraModeParam extends Object
    abstract
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__Filter1__Delegate) /*0x05710000-0x00000000*/ private const class CameraModeClass[65537];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL PositionTarget;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL LookAtTarget;
var(__Filter1__Delegate) /*0x05710000-0x00000400*/ private float DesiredFOV[1073807361];
var(__Filter1__Delegate) /*0x05710000-0x00000400*/ private bool BothSticksControlCamera[1073807361];
var(__Filter1__Delegate) /*0x05710000-0x00000400*/ private bool bAllowShoulderAimOverrideOnKismetLayer[1073807361];
var(__Filter1__Delegate) /*0x03D90000-0x00000400*/ private bool bUseIncludePoints[1073807361];
var(__Filter1__Delegate) /*0x05710000-0x00000400*/ private float ShoulderAimOverrideLookAroundClampYaw[1073807361];
var(__Filter1__Delegate) /*0x03C20000-0x00000400*/ private float MouseSensitivity[1073807361];
var(__Filter1__Delegate) /*0x03C20000-0x00000400*/ private float LookRightScale[1073807361];
var(__Filter1__Delegate) /*0x03C20000-0x00000400*/ private float LookUpScale[1073807361];
var(__Filter1__Delegate) /*0x03C20000-0x00000400*/ private float CameraTurnMax[1073807361];
var(__Filter1__Delegate) /*0x03C20000-0x00000400*/ private float CameraLookUpMax[1073807361];
var(__Filter1__Delegate) /*0x03BE0000-0x00000400*/ private float LookAroundPitchMinimum[1073807361];
var(__Filter1__Delegate) /*0x03BE0000-0x00000400*/ private float LookAroundPitchMaximum[1073807361];
var(__Filter1__Delegate) /*0x03BE0000-0x00000400*/ private float LookAroundClampYaw[1073807361];
var(__Filter1__Delegate) /*0x03C20000-0x00000400*/ private float IndirectLookThresholdInner[1073807361];
var(__Filter1__Delegate) /*0x03C20000-0x00000400*/ private float IndirectLookThresholdOuter[1073807361];
var(__Filter1__Delegate) /*0x06020000-0x00000400*/ private float HeadTrackingPercent[1073807361];

defaultproperties
{
    DesiredFOV=75.0000000
    bUseIncludePoints=true
    ShoulderAimOverrideLookAroundClampYaw=85.0000000
    MouseSensitivity=0.7000000
    LookRightScale=1.5000000
    LookUpScale=1.5000000
    CameraTurnMax=12.0000000
    CameraLookUpMax=10.0000000
    LookAroundPitchMinimum=20.0000000
    LookAroundPitchMaximum=150.0000000
    LookAroundClampYaw=180.0000000
    IndirectLookThresholdInner=0.9850000
    IndirectLookThresholdOuter=0.9400000
}