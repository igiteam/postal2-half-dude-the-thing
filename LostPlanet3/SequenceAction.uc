class SequenceAction extends SequenceOp
    abstract
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private name HandlerName;
var(*) /*0x35EA0000-0x00000000*/ private bool bCallHandler;
var(*) /*0x35EA0000-0x00000000*/ private bool bDefaultAllPlayers;
var(*) /*0x35EA0000-0x00000000*/ private bool bTryPlayerCamera;
var(*) /*0x35EA0000-0x00000000*/ private bool bRedirectToInteractionMetaData;
var(*) /*0x4B7A0000-0x00000000*/ private editfixedsize array Targets[65537];

defaultproperties
{
    bCallHandler=true
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Unknown Action"
}