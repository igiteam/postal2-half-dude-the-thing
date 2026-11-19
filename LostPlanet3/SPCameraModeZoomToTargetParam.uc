class SPCameraModeZoomToTargetParam extends SPCameraModeParam
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__Filter1__Delegate) /*0x02890000-0x00000400*/ private float FilterRateFOV[1073807361];
var(__Filter1__Delegate) /*0x067B0000-0x00000000*/ private float BorderSizeAsFractionOfFOV[1073807361];
var(__Filter1__Delegate) /*0x067B0000-0x00000000*/ private float MinimumFOV[1073807361];
var(__Filter1__Delegate) /*0x067B0000-0x00000000*/ private float MaximumFOV[1073807361];
var(__Filter1__Delegate) /*0x067B0000-0x00000000*/ private float TimeBeforeZoomActivates[1073807361];
var(__Filter1__Delegate) /*0x067B0000-0x00000000*/ private bool UsePreviousCamerasPosition[1073807361];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL Position[536870913];

defaultproperties
{
    FilterRateFOV=60.0000000
    BorderSizeAsFractionOfFOV=1.3500000
    MinimumFOV=20.0000000
    MaximumFOV=125.0000000
    TimeBeforeZoomActivates=0.5000000
    UsePreviousCamerasPosition=true
    CameraModeClass=Class'SPCameraModeZoomToTarget'
}