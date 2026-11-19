class LPSeqAct_AIToggleIceCrabClaw extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x826B0000-0x00000000*/ private bool bLeftClaw[65537];
var(0.25_Pct) /*0x826B0000-0x00000000*/ private bool bRightClaw[65537];

defaultproperties
{
    InputLinks[0]=(LinkDesc="Disable",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Disable Ice Crab Claw (LP)"
}