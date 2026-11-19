class SeqAct_SetActiveAnimChild extends SequenceAction
    hidecategories(Object);

var(*) /*0x44220000-0x00000000*/ private name NodeName[65537];
var(*) /*0x44220000-0x00000000*/ private int ChildIndex[65537];
var(*) /*0x44220000-0x00000000*/ private float BlendTime[65537];

defaultproperties
{
    BlendTime=0.2500000
    InputLinks[0]=(LinkDesc="Activate",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Set Active Anim Child"
}