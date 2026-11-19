class LPCameraModeAimControlWeaponShoulderParam extends SPCameraModeAimControlWeaponShoulderParam
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object,PlayerSprint,Aiming,Filters,LookLimit,Targeting,Mantle,Filter,PlayerSprint,Aiming,Filters,LookLimit,Targeting,Mantle,Filter);

defaultproperties
{
    OrbitRadiusFilterRate=0.8500000
    LocalOffset=(X=-100.0000000,Y=45.0000000,Z=0.0000000)
    CollisionZoomInOffset=(X=-22.0000000,Y=10.0000000,Z=12.0000000)
    FloatingAimToRotationCurveYaw=SPCurveFloat'TuneData_Camera.FloatingAimToRotationCurve'
    FloatingAimToRotationCurvePitch=SPCurveFloat'TuneData_Camera.FloatingAimToRotationCurve'
    FilterRateOffset=4.0000000
    CameraModeClass=Class'LPCameraModeAimControlShoulder'
    DesiredFOV=65.0000000
    LookRightScale=180.0000000
    LookUpScale=-150.0000000
}