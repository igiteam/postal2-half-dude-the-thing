class SVehicleSimBase extends ActorComponent;

var(*) /*0x4B0F0000-0x00000000*/ private float WheelSuspensionStiffness[65537];
var(*) /*0x4B0F0000-0x00000000*/ private float WheelSuspensionDamping[65537];
var(*) /*0x4B0F0000-0x00000000*/ private float WheelSuspensionBias[65537];
var(*) /*0x4B0F0000-0x00000000*/ private float WheelLongExtremumSlip[65537];
var(*) /*0x4B0F0000-0x00000000*/ private float WheelLongExtremumValue[65537];
var(*) /*0x4B0F0000-0x00000000*/ private float WheelLongAsymptoteSlip[65537];
var(*) /*0x4B0F0000-0x00000000*/ private float WheelLongAsymptoteValue[65537];
var(*) /*0x4B0F0000-0x00000000*/ private float WheelLatExtremumSlip[65537];
var(*) /*0x4B0F0000-0x00000000*/ private float WheelLatExtremumValue[65537];
var(*) /*0x4B0F0000-0x00000000*/ private float WheelLatAsymptoteSlip[65537];
var(*) /*0x4B0F0000-0x00000000*/ private float WheelLatAsymptoteValue[65537];
var(*) /*0x4B0F0000-0x00000000*/ private float WheelInertia[65537];
var(*) /*0x4B0F0000-0x00000000*/ private bool bWheelSpeedOverride[65537];
var(*) /*0x4B0F0000-0x00000000*/ private bool bClampedFrictionModel[65537];
var(*) /*0x4B0F0000-0x00000000*/ private bool bAutoDrive[65537];
var(*) /*0x4B0F0000-0x00000000*/ private float AutoDriveSteer[65537];
