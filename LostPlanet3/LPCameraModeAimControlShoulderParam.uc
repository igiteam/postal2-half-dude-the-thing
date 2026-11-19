class LPCameraModeAimControlShoulderParam extends SPCameraModeAimControlShoulderParam
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object);

defaultproperties
{
    PlayerRollCameraParams=(AdditiveLocalOffsetDuringRoll=(X=-140.0000000,Y=28.0000000,Z=-52.0000000),AdditiveFOVDuringRoll=10.0000000)
    LocalOffset=(X=-105.0000000,Y=52.0000000,Z=-3.0000000)
    CollisionZoomInOffset=(X=-22.0000000,Y=10.0000000,Z=15.0000000)
    FloatingAimToRotationCurveYaw=SPCurveFloat'TuneData_Camera.FloatingAimToRotationCurve'
    FloatingAimToRotationCurvePitch=SPCurveFloat'TuneData_Camera.FloatingAimToRotationCurve'
    CameraModeClass=Class'LPCameraModeAimControlShoulder'
    DesiredFOV=65.0000000
}