class SPCameraModeBoneTrackParam extends SPCameraModeParam
    abstract
    config(Camera)
    noteditinlinenew
    collapsecategories
    hidecategories(Object);

var(__Filter1__Delegate) /*0x056B0000-0x00000000*/ private name Bone[1073807361];
var(__Filter1__Delegate) /*0x056B0000-0x00000000*/ private @NULL Orbit[1073807361];
var(__Filter1__Delegate) /*0x056B0000-0x00000000*/ private @NULL TargetOffset[1073807361];
var(__Filter1__Delegate) /*0x056B0000-0x00000000*/ private bool bUsePlayerRelativeControls[1073807361];

defaultproperties
{
    Bone="JO_head"
    Orbit=none
    CameraModeClass=Class'SPCameraModeBoneTrack'
}