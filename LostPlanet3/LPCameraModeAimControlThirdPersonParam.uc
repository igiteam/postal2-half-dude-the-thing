class LPCameraModeAimControlThirdPersonParam extends SPCameraModeAimControlThirdPersonParam
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object);

defaultproperties
{
    OrbitRadiusFilterRate=0.8500000
    FOVFilterRate=2.0000000
    PlayerSprintCameraParams=(AdditiveLocalOffsetDuringPlayerSprints=(X=25.0000000,Y=-50.0000000,Z=15.0000000),SprintLocalOffsetFilterRate=0.8500000,SprintFOVFilterRate=0.1500000,PitchLimitSmoothRate=9.0000000)
    PlayerRollCameraParams=(AdditiveLocalOffsetDuringRoll=(X=-55.0000000,Y=15.0000000,Z=-52.0000000))
    AttractorMaxDistance=500.0000000
    AttractorMinFOVDegrees=30.0000000
    UseMPOverrideForLocation=true
    LocalOffset=(X=-190.0000000,Y=65.0000000,Z=-3.0000000)
    CollisionZoomInOffset=(X=-28.0000000,Y=25.0000000,Z=11.0000000)
    LocalOffsetMP=(X=-210.0000000,Y=67.0000000,Z=18.0000000)
    FloatingAimToRotationCurveYaw=SPCurveFloat'TuneData_Camera.FloatingAimToRotationCurve'
    FloatingAimToRotationCurvePitch=SPCurveFloat'TuneData_Camera.FloatingAimToRotationCurve'
    FilterRateOffset=2.0000000
    CameraModeClass=Class'LPCameraModeAimControlThirdPerson'
    LookRightScale=470.0000000
    LookUpScale=-275.0000000
    LookAroundPitchMinimum=35.0000000
}