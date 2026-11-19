class LPCameraModeAimControlAnimatedParam extends SPCameraModeAimControlAnimatedParam
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object);

defaultproperties
{
    CameraSocketName="CameraASocket"
    CameraFOVBoneName="JO_CameraFOV"
    CheckCameraCollision=false
    FloatingAimForce=true
    FloatingAimDontScale=true
    FloatingAimThresholdMinX=-0.3500000
    FloatingAimInputScaleX=0.4000000
    FloatingAimInputScaleY=0.4000000
    LocalOffset=(X=-250.0000000,Y=0.0000000,Z=2.0000000)
    CollisionZoomInOffset=(X=-12.0000000,Y=25.0000000,Z=0.0000000)
    FloatingAimToRotationCurveYaw=SPCurveFloat'TuneData_Camera.FloatingAimToRotationCurve'
    FloatingAimToRotationCurvePitch=SPCurveFloat'TuneData_Camera.FloatingAimToRotationCurve'
    CameraModeClass=Class'LPCameraModeAimControlAnimated'
    DesiredFOV=50.0000000
    MouseSensitivity=180.0000000
}