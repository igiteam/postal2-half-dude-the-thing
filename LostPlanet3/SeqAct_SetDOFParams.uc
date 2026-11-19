class SeqAct_SetDOFParams extends SeqAct_Latent
    hidecategories(Object);

var(*) /*0x44280000-0x00000000*/ private float FalloffExponent[65537];
var(*) /*0x44280000-0x00000000*/ private float BlurKernelSize[65537];
var(*) /*0x0A570000-0x00000000*/ private float MaxNearBlurAmount[65537];
var(*) /*0x0A570000-0x00000000*/ private float MinBlurAmount[65537];
var(*) /*0x0A570000-0x00000000*/ private float MaxFarBlurAmount[65537];
var(*) /*0x44280000-0x00000000*/ private float FocusInnerRadius[65537];
var(*) /*0x44280000-0x00000000*/ private float FocusDistance[65537];
var(*) /*0x44280000-0x00000000*/ private @NULL FocusPosition[65537];
var(*) /*0x44280000-0x00000000*/ private float InterpolateSeconds[65537];
var(*) /*0x35EA0000-0x00000000*/ private float InterpolateElapsed;
var(*) /*0x35EA0000-0x00000000*/ private float OldFalloffExponent;
var(*) /*0x35EA0000-0x00000000*/ private float OldBlurKernelSize;
var(*) /*0x35EA0000-0x00000000*/ private float OldMaxNearBlurAmount;
var(*) /*0x35EA0000-0x00000000*/ private float OldMinBlurAmount;
var(*) /*0x35EA0000-0x00000000*/ private float OldMaxFarBlurAmount;
var(*) /*0x35EA0000-0x00000000*/ private float OldFocusInnerRadius;
var(*) /*0x35EA0000-0x00000000*/ private float OldFocusDistance;
var(*) /*0x35EA0000-0x00000000*/ private @NULL OldFocusPosition;

defaultproperties
{
    FalloffExponent=4.0000000
    BlurKernelSize=5.0000000
    MaxNearBlurAmount=1.0000000
    MaxFarBlurAmount=1.0000000
    FocusInnerRadius=600.0000000
    FocusDistance=600.0000000
    InterpolateSeconds=2.0000000
    InputLinks[0]=(LinkDesc="Enable",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Disable",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Depth Of Field"
}