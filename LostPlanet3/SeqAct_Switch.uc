class SeqAct_Switch extends SequenceAction
    hidecategories(Object);

var(*) /*0x44410000-0x00000000*/ private int LinkCount[65537];
var(*) /*0x44410000-0x00000000*/ private int IncrementAmount[65537];
var(*) /*0x44410000-0x00000000*/ private bool bLooping[65537];
var(*) /*0x44410000-0x00000000*/ private bool bAutoDisableLinks[65537];
var(*) /*0x44410000-0x00000000*/ private editfixedsize array Indices[65537];

defaultproperties
{
    LinkCount=1
    IncrementAmount=1
    Indices=/* Array type was not detected. */
    OutputLinks[0]=(Links=none,LinkDesc="Link 1",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Int',LinkedVariables=none,LinkDesc="Index",LinkVar="None",PropertyName="Indices",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Switch"
}