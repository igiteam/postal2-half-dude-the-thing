class SeqAct_ToggleConstraintDrive extends SequenceAction
    hidecategories(Object);

var(*) /*0x44470000-0x00000000*/ private bool bEnableAngularPositionDrive[65537];
var(*) /*0x44470000-0x00000000*/ private bool bEnableAngularVelocityDrive[65537];
var(*) /*0x44470000-0x00000000*/ private bool bEnableLinearPositionDrive[65537];
var(*) /*0x44470000-0x00000000*/ private bool bEnableLinearvelocityDrive[65537];

defaultproperties
{
    InputLinks[0]=(LinkDesc="Enable Drive",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Disable All Drive",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Toggle Constraint Drive"
}