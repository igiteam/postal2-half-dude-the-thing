class LPCameraModeLedgeWalkParam extends LPCameraModeAimControlThirdPersonParam
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(0.25_Pct) /*0x7C840000-0x00000000*/ private float YawAngleLimit[1073807361];

defaultproperties
{
    YawAngleLimit=50.0000000
    PlayerSprintCameraParams=(bEnableVelocityBasedSprintCamera=false)
    FloatingAimAllow=false
    LocalOffset=(X=-190.0000000,Y=0.0000000,Z=-3.0000000)
    CollisionZoomInOffset=(X=0.0000000,Y=32.0000000,Z=9.0000000)
    CameraModeClass=Class'LPCameraModeLedgeWalk'
    LookRightScale=320.0000000
    LookUpScale=-225.0000000
}