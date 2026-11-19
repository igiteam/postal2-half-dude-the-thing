//=============================================================================
// The Car Wheel joint class.
//=============================================================================

//#exec Texture Import File=Textures\S_KBSJoint.pcx Name=S_KBSJoint Mips=Off MASKED=1
#exec Texture Import File=Textures\KCarWheelJoint.bmp Name=S_KCarWheelJoint Mips=Off MASKED=1


class KCarWheelJoint extends KConstraint
    native
    placeable;

// STEERING
var(KarmaConstraint) float KSteerAngle;       // desired steering angle to achieve using controller (65535 = 360 deg)
var(KarmaConstraint) float KProportionalGap;  // for steering controller (65535 = 360 deg)
var(KarmaConstraint) float KMaxSteerTorque;   // for steering controller
var(KarmaConstraint) float KMaxSteerSpeed;    // for steering controller (65535 = 1 rotation per second)
var(KarmaConstraint) bool  bKSteeringLocked;   // steering 'locked' in straight ahead direction

// MOTOR
var(KarmaConstraint) float KMotorTorque;      // torque applied to drive this wheel (can be negative)
var(KarmaConstraint) float KMaxSpeed;         // max speed to try and reach using KMotorTorque (65535 = 1 rotation per second)
var(KarmaConstraint) float KBraking;          // torque applied to brake wheel

// SUSPENSION
var(KarmaConstraint) float KSuspLowLimit;
var(KarmaConstraint) float KSuspHighLimit;
var(KarmaConstraint) float KSuspStiffness;
var(KarmaConstraint) float KSuspDamping;
var(KarmaConstraint) float KSuspRef;

var					 bool  KWheelOnGround;	   // Indicates if car wheel is on ground

// Other output
var const float KWheelHeight; // height of wheel relative to suspension centre


// Decompiled with UE Explorer.
defaultproperties
{
    KProportionalGap=8200.0000000
    KMaxSteerTorque=1000.0000000
    KMaxSteerSpeed=2600.0000000
    bKSteeringLocked=true
    KMaxSpeed=1310700.0000000
    KSuspLowLimit=-1.0000000
    KSuspHighLimit=1.0000000
    KSuspStiffness=50.0000000
    KSuspDamping=5.0000000
    Texture=Texture'S_KCarWheelJoint'
    DrawScale=0.2500000
}