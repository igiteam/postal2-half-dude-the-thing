class SVehicleWheel extends Component;

enum EWheelSide
{
    SIDE_None,                      // 0
    SIDE_Left,                      // 1
    SIDE_Right,                     // 2
    SIDE_MAX                        // 3
};

var(*) /*0x4B120000-0x00000000*/ private float Steer[65537];
var(*) /*0x4B120000-0x00000000*/ private float MotorTorque[65537];
var(*) /*0x4B120000-0x00000000*/ private float BrakeTorque[65537];
var(*) /*0x4B120000-0x00000000*/ private float ChassisTorque[65537];
var(*) /*0x4B120000-0x00000000*/ private bool bPoweredWheel[65537];
var(*) /*0x4B120000-0x00000000*/ private bool bHoverWheel[65537];
var(*) /*0x4B120000-0x00000000*/ private bool bCollidesVehicles[65537];
var(*) /*0x4B120000-0x00000000*/ private bool bCollidesPawns[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsSquealing;
var(*) /*0x35EA0000-0x00000000*/ private bool bWheelOnGround;
var(*) /*0x4B120000-0x00000000*/ private float SteerFactor[65537];
var(*) /*0x4B120000-0x00000000*/ private name SkelControlName[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL WheelControl;
var(*) /*0x4B120000-0x00000000*/ private name BoneName[65537];
var(*) /*0x4B120000-0x00000000*/ private @NULL BoneOffset[65537];
var(*) /*0x4B120000-0x00000000*/ private float WheelRadius[65537];
var(*) /*0x4B120000-0x00000000*/ private float SuspensionTravel[65537];
var(*) /*0x4B120000-0x00000000*/ private float SuspensionSpeed[65537];
var(*) /*0x4B120000-0x00000000*/ private @NULL WheelParticleSystem[65537];
var(*) /*0x4B120000-0x00000000*/ private byte Side[65537];
var(*) /*0x4B120000-0x00000000*/ private float LongSlipFactor[65537];
var(*) /*0x4B120000-0x00000000*/ private float LatSlipFactor[65537];
var(*) /*0x4B120000-0x00000000*/ private float HandbrakeLongSlipFactor[65537];
var(*) /*0x4B120000-0x00000000*/ private float HandbrakeLatSlipFactor[65537];
var(*) /*0x4B120000-0x00000000*/ private float ParkedSlipFactor[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL WheelPosition;
var(*) /*0x35EA0000-0x00000000*/ private float SpinVel;
var(*) /*0x35EA0000-0x00000000*/ private float LongSlipRatio;
var(*) /*0x35EA0000-0x00000000*/ private float LatSlipAngle;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ContactNormal;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LongDirection;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LatDirection;
var(*) /*0x35EA0000-0x00000000*/ private float ContactForce;
var(*) /*0x35EA0000-0x00000000*/ private float LongImpulse;
var(*) /*0x35EA0000-0x00000000*/ private float LatImpulse;
var(*) /*0x35EA0000-0x00000000*/ private float DesiredSuspensionPosition;
var(*) /*0x35EA0000-0x00000000*/ private float SuspensionPosition;
var(*) /*0x35EA0000-0x00000000*/ private float CurrentRotation;
var(*) /*0x35EA0000-0x00000000*/ private @NULL WheelShape[537001985];
var(*) /*0x35EA0000-0x00000000*/ private int WheelMaterialIndex[537001985];
var(*) /*0x35EA0000-0x00000000*/ private class WheelPSCClass;
var(*) /*0x35EA0000-0x00000400*/ private export @NULL WheelParticleComp[524289];
var(*) /*0x35EA0000-0x00000000*/ private name SlipParticleParamName;

defaultproperties
{
    bCollidesVehicles=true
    WheelRadius=35.0000000
    SuspensionTravel=30.0000000
    SuspensionSpeed=50.0000000
    LongSlipFactor=4000.0000000
    LatSlipFactor=20000.0000000
    HandbrakeLongSlipFactor=4000.0000000
    HandbrakeLatSlipFactor=20000.0000000
    ParkedSlipFactor=20000.0000000
    WheelPSCClass=Class'ParticleSystemComponent'
    SlipParticleParamName="WheelSlip"
}