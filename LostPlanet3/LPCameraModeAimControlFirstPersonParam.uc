class LPCameraModeAimControlFirstPersonParam extends SPCameraModeAimControlFirstPersonParam
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object);

defaultproperties
{
    MotionFilterSubStep=0.0166600
    MotionPIDFilterYaw_Kp=7
    MotionPIDFilterPitch_Kp=15
    MaxMotionFilterLagYaw=2048
    MaxMotionFilterLagPitch=2048
    FloatingAimAllow=false
    LocalOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    CameraSocket="CameraSocket"
    FloatingAimToRotationCurveYaw=SPCurveFloat'TuneData_Camera.FloatingAimToRotationCurve'
    FloatingAimToRotationCurvePitch=SPCurveFloat'TuneData_Camera.FloatingAimToRotationCurve'
    CameraModeClass=Class'LPCameraModeAimControlFirstPerson'
    DesiredFOV=85.0000000
    LookRightScale=180.0000000
    LookUpScale=-155.0000000
    LookAroundPitchMinimum=30.0000000
}