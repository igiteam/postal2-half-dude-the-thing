class LPSeqAct_ForceZiplineSprint extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x82A60000-0x00000000*/ private float BlendTime[65537];

defaultproperties
{
    BlendTime=0.2000000
    InputLinks[0]=(LinkDesc="Sprint",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Normal",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Force Zipline Sprint (LP)"
}