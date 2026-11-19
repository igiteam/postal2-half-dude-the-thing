class SeqAct_ActivateRemoteEvent extends SequenceAction
    hidecategories(Object);

var(*) /*0x43E00000-0x00000000*/ private @NULL Instigator[65537];
var(*) /*0x43E00000-0x00000000*/ private name EventName[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bStatusIsOk[536870913];

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 2;
    //return ReturnValue;    
}

defaultproperties
{
    EventName="DefaultEvent"
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Instigator",LinkVar="None",PropertyName="Instigator",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Activate Remote Event"
}