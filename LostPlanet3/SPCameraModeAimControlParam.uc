class SPCameraModeAimControlParam extends SPCameraModeParam
    abstract
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__Filter1__Delegate) /*0x002A0000-0x00000000*/ private bool FloatingAimAllow[1073807361];
var(__Filter1__Delegate) /*0x002A0000-0x00000000*/ private bool FloatingAimForce[1073807361];
var(__Filter1__Delegate) /*0x002A0000-0x00000000*/ private bool FloatingAimDontScale[1073807361];
var(__Filter1__Delegate) /*0x002A0000-0x00000000*/ private bool FloatingAimDontMirror[1073807361];
var(__Filter1__Delegate) /*0x002A0000-0x00000000*/ private bool DisallowInvertedControls[65537];
var(__Filter1__Delegate) /*0x01150000-0x00000400*/ private bool UseMPOverrideForLocation[1073807361];
var(__Filter1__Delegate) /*0x002A0000-0x00000000*/ private float FloatingAimThresholdMinX[1073807361];
var(__Filter1__Delegate) /*0x002A0000-0x00000000*/ private float FloatingAimThresholdMaxX[1073807361];
var(__Filter1__Delegate) /*0x002A0000-0x00000000*/ private float FloatingAimThresholdMinY[1073807361];
var(__Filter1__Delegate) /*0x002A0000-0x00000000*/ private float FloatingAimThresholdMaxY[1073807361];
var(__Filter1__Delegate) /*0x002A0000-0x00000000*/ private float FloatingAimInputScaleX[1073807361];
var(__Filter1__Delegate) /*0x002A0000-0x00000000*/ private float FloatingAimInputScaleY[1073807361];
var(__Filter1__Delegate) /*0x002A0000-0x00000000*/ private float AimAssistFrictionScaler[1073807361];
var(__Filter1__Delegate) /*0x01150000-0x00000400*/ private @NULL LocalOffset[1073807361];
var(__Filter1__Delegate) /*0x01150000-0x00000400*/ private @NULL CollisionZoomInOffset[1073807361];
var(__Filter1__Delegate) /*0x01150000-0x00000400*/ private @NULL LocalOffsetMP[1073807361];
var(__Filter1__Delegate) /*0x01150000-0x00000400*/ private name CameraSocket[1073807361];
var(__Filter1__Delegate) /*0x02A00000-0x00000400*/ private @NULL FloatingAimToRotationCurveYaw[65537];
var(__Filter1__Delegate) /*0x02A00000-0x00000400*/ private @NULL FloatingAimToRotationCurvePitch[65537];
var(__Filter1__Delegate) /*0x02890000-0x00000400*/ private float FilterRateOffset[1073807361];

defaultproperties
{
    FloatingAimAllow=true
    FloatingAimThresholdMinX=-0.1300000
    FloatingAimThresholdMaxX=0.3500000
    FloatingAimThresholdMinY=-0.3500000
    FloatingAimThresholdMaxY=0.3500000
    FloatingAimInputScaleX=1.0000000
    FloatingAimInputScaleY=1.0000000
    AimAssistFrictionScaler=1.0000000
    LocalOffset=(X=-200.0000000,Y=0.0000000,Z=0.0000000)
    FilterRateOffset=100.0000000
    CameraModeClass=Class'SPCameraModeAimControl'
    MouseSensitivity=60.0000000
    LookRightScale=100.0000000
    LookUpScale=-100.0000000
    CameraTurnMax=-1.0000000
    CameraLookUpMax=-1.0000000
}