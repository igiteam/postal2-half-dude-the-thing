class LPCameraModeAimControlWeaponParam extends SPCameraModeAimControlWeaponParam
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object,PlayerSprint,Aiming,Filters,LookLimit,LookSpeed,Targeting,CameraLocation,Mantle,Filter,PlayerSprint,Aiming,Filters,LookLimit,LookSpeed,Targeting,CameraLocation,Mantle,Filter);

defaultproperties
{
    OrbitRadiusFilterRate=0.8500000
    PlayerSprintCameraParams=(AdditiveLocalOffsetDuringPlayerSprints=(X=25.0000000,Y=-50.0000000,Z=15.0000000),SprintLocalOffsetFilterRate=0.8500000,AdditiveFOVDuringPlayerSprints=30.0000000,SprintFOVFilterRate=0.1500000)
    LocalOffset=(X=-190.0000000,Y=50.0000000,Z=2.0000000)
    CollisionZoomInOffset=(X=0.0000000,Y=20.0000000,Z=15.0000000)
    FloatingAimToRotationCurveYaw=SPCurveFloat'TuneData_Camera.FloatingAimToRotationCurve'
    FloatingAimToRotationCurvePitch=SPCurveFloat'TuneData_Camera.FloatingAimToRotationCurve'
    CameraModeClass=Class'LPCameraModeAimControlThirdPerson'
}