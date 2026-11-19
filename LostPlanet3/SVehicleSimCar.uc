class SVehicleSimCar extends SVehicleSimBase;

var(*) /*0x4B100000-0x00000000*/ private float ChassisTorqueScale[65537];
var(*) /*0x4B100000-0x00000000*/ private editfixedsize @NULL MaxSteerAngleCurve[65537];
var(*) /*0x4B100000-0x00000000*/ private float SteerSpeed[65537];
var(*) /*0x4B100000-0x00000000*/ private float ReverseThrottle[65537];
var(*) /*0x4B100000-0x00000000*/ private float EngineBrakeFactor[65537];
var(*) /*0x4B100000-0x00000000*/ private float MaxBrakeTorque[65537];
var(*) /*0x4B100000-0x00000000*/ private float StopThreshold[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsDriving;
var(*) /*0x35EA0000-0x00000000*/ private float ActualSteering;
var(*) /*0x35EA0000-0x00000000*/ private float TimeSinceThrottle;
