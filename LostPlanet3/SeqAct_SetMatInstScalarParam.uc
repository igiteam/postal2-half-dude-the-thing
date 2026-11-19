class SeqAct_SetMatInstScalarParam extends SequenceAction
    hidecategories(Object);

var(*) /*0x442D0000-0x00000000*/ private @NULL MatInst[65537];
var(*) /*0x442D0000-0x00000000*/ private name ParamName[65537];
var(*) /*0x442D0000-0x00000000*/ private float ScalarValue[65537];

defaultproperties
{
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Float',LinkedVariables=none,LinkDesc="ScalarValue",LinkVar="None",PropertyName="ScalarValue",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Set ScalarParam"
}