class SeqAct_SetString extends SeqAct_SetSequenceVariable
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Target;
var(*) /*0x44390000-0x00000000*/ private editfixedsize string Value[65537];

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 0;
    //return ReturnValue;    
}

defaultproperties
{
    VariableLinks[0]=(ExpectedType=Class'SeqVar_String',LinkedVariables=none,LinkDesc="Value",LinkVar="None",PropertyName="Value",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'SeqVar_String',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Target",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="String"
}