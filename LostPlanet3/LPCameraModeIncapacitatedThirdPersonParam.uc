class LPCameraModeIncapacitatedThirdPersonParam extends SPCameraModeAimControlThirdPersonParam
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object);

defaultproperties
{
    OrbitRadiusFilterRate=0.8500000
    FOVFilterRate=2.0000000
    LocalOffset=(X=-210.0000000,Y=0.0000000,Z=-50.0000000)
    FloatingAimToRotationCurveYaw=SPCurveFloat'TuneData_Camera.FloatingAimToRotationCurve'
    FloatingAimToRotationCurvePitch=SPCurveFloat'TuneData_Camera.FloatingAimToRotationCurve'
    FilterRateOffset=2.0000000
    CameraModeClass=Class'LPCameraModeAimControlThirdPerson'
    DesiredFOV=90.0000000
    BothSticksControlCamera=true
    LookRightScale=345.0000000
    LookUpScale=-240.0000000
    LookAroundPitchMinimum=35.0000000
    LookAroundPitchMaximum=115.0000000
}