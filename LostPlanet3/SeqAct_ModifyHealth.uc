class SeqAct_ModifyHealth extends SequenceAction
    hidecategories(Object);

var(*) /*0x44130000-0x00000000*/ private class DamageType[65537];
var(*) /*0x44130000-0x00000000*/ private float Momentum[65537];
var(*) /*0x44130000-0x00000000*/ private float Amount[65537];
var(*) /*0x44130000-0x00000000*/ private float Radius[65537];
var(*) /*0x44130000-0x00000000*/ private bool bHeal[65537];
var(*) /*0x44130000-0x00000000*/ private bool bRadial[65537];
var(*) /*0x44130000-0x00000000*/ private bool bFalloff[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Instigator;

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 1;
    //return ReturnValue;    
}

defaultproperties
{
    Momentum=500.0000000
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'SeqVar_Float',LinkedVariables=none,LinkDesc="Amount",LinkVar="None",PropertyName="Amount",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[2]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Instigator",LinkVar="None",PropertyName="Instigator",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Modify Health"
}