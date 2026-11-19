class SeqAct_SetMatInstVectorParam extends SequenceAction
    hidecategories(Object);

var(*) /*0x442F0000-0x00000000*/ private @NULL MatInst[65537];
var(*) /*0x442F0000-0x00000000*/ private name ParamName[65537];
var(*) /*0x442F0000-0x00000000*/ private @NULL VectorValue[65537];

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 2;
    //return ReturnValue;    
}

defaultproperties
{
    VectorValue=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Vector',LinkedVariables=none,LinkDesc="VectorValue",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Set VectorParam"
}