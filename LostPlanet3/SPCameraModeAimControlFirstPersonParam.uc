class SPCameraModeAimControlFirstPersonParam extends SPCameraModeAimControlParam
    abstract
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__Filter1__Delegate) /*0x05600000-0x00000000*/ private float MotionFilterSubStep[1073807361];
var(__Filter1__Delegate) /*0x05600000-0x00000000*/ private bool bMotionFilterPreventOscillation[1073807361];
var(__Filter1__Delegate) /*0x05600000-0x00000000*/ private int MotionPIDFilterYaw_Kp[1073807361];
var(__Filter1__Delegate) /*0x05600000-0x00000000*/ private int MotionPIDFilterPitch_Kp[1073807361];
var(__Filter1__Delegate) /*0x05600000-0x00000000*/ private int MaxMotionFilterLagYaw[1073807361];
var(__Filter1__Delegate) /*0x05600000-0x00000000*/ private int MaxMotionFilterLagPitch[1073807361];

defaultproperties
{
    CameraModeClass=Class'SPCameraModeAimControlFirstPerson'
}