class LPCameraModeAimControlGrenadeParam extends SPCameraModeAimControlShoulderParam
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object);

defaultproperties
{
    OrbitRadiusFilterRate=0.8500000
    UseMPOverrideForLocation=true
    LocalOffset=(X=-210.0000000,Y=90.0000000,Z=-9.0000000)
    CollisionZoomInOffset=(X=0.0000000,Y=0.0000000,Z=15.0000000)
    LocalOffsetMP=(X=-210.0000000,Y=67.0000000,Z=18.0000000)
    FloatingAimToRotationCurveYaw=SPCurveFloat'TuneData_Camera.FloatingAimToRotationCurve'
    FloatingAimToRotationCurvePitch=SPCurveFloat'TuneData_Camera.FloatingAimToRotationCurve'
    FilterRateOffset=2.0000000
    CameraModeClass=Class'LPCameraModeAimControlGrenade'
    DesiredFOV=75.0000000
}