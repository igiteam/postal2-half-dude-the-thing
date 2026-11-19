class SeqAct_CastToInt extends SeqAct_SetSequenceVariable
    hidecategories(Object);

var(*) /*0x43F10000-0x00000000*/ private bool bTruncate[65537];
var(*) /*0x35EA0000-0x00000000*/ private float Value;
var(*) /*0x35EA0000-0x00000000*/ private int IntResult;

defaultproperties
{
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Float',LinkedVariables=none,LinkDesc="Int",LinkVar="None",PropertyName="Value",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'SeqVar_Int',LinkedVariables=none,LinkDesc="Result",LinkVar="None",PropertyName="IntResult",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Cast To Int"
}