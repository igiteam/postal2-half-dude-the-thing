class SeqAct_SetMotionBlurParams extends SeqAct_Latent
    hidecategories(Object);

var(*) /*0x44310000-0x00000000*/ private float MotionBlurAmount[65537];
var(*) /*0x44310000-0x00000000*/ private float InterpolateSeconds[65537];
var(*) /*0x35EA0000-0x00000000*/ private float InterpolateElapsed;
var(*) /*0x35EA0000-0x00000000*/ private float OldMotionBlurAmount;

defaultproperties
{
    MotionBlurAmount=0.1000000
    InterpolateSeconds=2.0000000
    InputLinks[0]=(LinkDesc="Enable",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Disable",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Motion Blur"
}