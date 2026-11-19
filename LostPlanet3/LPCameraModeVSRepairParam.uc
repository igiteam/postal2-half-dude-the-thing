class LPCameraModeVSRepairParam extends SPCameraModeAimControlShoulderParam
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object);

defaultproperties
{
    FloatingAimAllow=false
    LocalOffset=(X=-150.0000000,Y=95.0000000,Z=-25.0000000)
    CollisionZoomInOffset=(X=0.0000000,Y=20.0000000,Z=15.0000000)
    FloatingAimToRotationCurveYaw=SPCurveFloat'TuneData_Camera.FloatingAimToRotationCurve'
    FloatingAimToRotationCurvePitch=SPCurveFloat'TuneData_Camera.FloatingAimToRotationCurve'
    CameraModeClass=Class'LPCameraModeVSRepair'
    DesiredFOV=75.0000000
}