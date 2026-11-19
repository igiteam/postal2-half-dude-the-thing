class SPCameraModeAimControlAnimatedParam extends SPCameraModeAimControlParam
    abstract
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL MyPawn[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private name CameraSocketName[1073741825];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private name CameraFOVBoneName[1073741825];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private int CameraFOVComponentAxis[1073741825];
var(__Filter1__Delegate) /*0x055E0000-0x00000400*/ private float AnimatedFOV[65537];
var(__Filter1__Delegate) /*0x055E0000-0x00000400*/ private bool CheckCameraCollision[65537];
var(__Filter1__Delegate) /*0x055E0000-0x00000400*/ private bool bCollideCamera[65537];
var(__Filter1__Delegate) /*0x055E0000-0x00000400*/ private bool bConstrainPlayerInFOV[65537];
var(__Filter1__Delegate) /*0x055E0000-0x00000400*/ private bool bConstrainEnemyInFOV[65537];

defaultproperties
{
    CheckCameraCollision=true
    bCollideCamera=true
    bConstrainPlayerInFOV=true
    bConstrainEnemyInFOV=true
}