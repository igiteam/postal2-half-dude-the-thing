class SVehicleSimTank extends SVehicleSimCar;

var(*) /*0x35EA0000-0x00000000*/ private float LeftTrackVel;
var(*) /*0x35EA0000-0x00000000*/ private float RightTrackVel;
var(*) /*0x35EA0000-0x00000000*/ private float LeftTrackTorque;
var(*) /*0x35EA0000-0x00000000*/ private float RightTrackTorque;
var(*) /*0x4B110000-0x00000000*/ private float MaxEngineTorque[65537];
var(*) /*0x4B110000-0x00000000*/ private float EngineDamping[65537];
var(*) /*0x4B110000-0x00000000*/ private float InsideTrackTorqueFactor[65537];
var(*) /*0x4B110000-0x00000000*/ private float SteeringLatStiffnessFactor[65537];
var(*) /*0x4B110000-0x00000000*/ private float TurnInPlaceThrottle[65537];
var(*) /*0x4B110000-0x00000000*/ private float TurnMaxGripReduction[65537];
var(*) /*0x4B110000-0x00000000*/ private float TurnGripScaleRate[65537];
var(*) /*0x4B110000-0x00000000*/ private bool bTurnInPlaceOnSteer[65537];
