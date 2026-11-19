class SeqAct_SetParticleSysParam extends SequenceAction
    hidecategories(Object);

var(*) /*0x44330000-0x00000400*/ private editfixedsize export array InstanceParameters[589825];
var(*) /*0x44330000-0x00000000*/ private bool bOverrideScalar[65537];
var(*) /*0x44330000-0x00000000*/ private float ScalarValue[65537];

defaultproperties
{
    bOverrideScalar=true
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'SeqVar_Float',LinkedVariables=none,LinkDesc="Scalar Value",LinkVar="None",PropertyName="ScalarValue",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Set Particle Param"
}