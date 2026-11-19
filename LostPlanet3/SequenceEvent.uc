class SequenceEvent extends SequenceOp
    abstract
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array DuplicateEvts;
var(*) /*0x35EA0000-0x00000000*/ private @NULL SourceEvent[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Originator;
var(*) /*0x35EA0000-0x00000000*/ private @NULL Instigator;
var(*) /*0x35EA0000-0x00000000*/ private float ActivationTime;
var(*) /*0x35EA0000-0x00000000*/ private int TriggerCount;
var(*) /*0x448C0000-0x00000000*/ private int MaxTriggerCount[65537];
var(*) /*0x448C0000-0x00000000*/ private float ReTriggerDelay[65537];
var(*) /*0x448C0000-0x00000000*/ private bool bEnabled[65537];
var(*) /*0x448C0000-0x00000000*/ private bool bPlayerOnly[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bRegistered[536870913];
var(*) /*0x448C0000-0x00000000*/ private bool bClientSideOnly[196609];
var(*) /*0x448C0000-0x00000000*/ private bool bSavePersistentData[65537];
var(*) /*0x448C0000-0x00000000*/ private byte Priority[65537];
var(*) /*0x35EA0000-0x00000000*/ private int MaxWidth;

event RegisterEvent()
{
    //return;    
}

// Export USequenceEvent::execCheckActivate(FFrame&, void* const)
native final function CheckActivate()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InOriginator[8388609], InInstigator;
    local /*0x35EA0000-0x00000000*/ private bool bTest[9437185];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ActivateIndices[26345473];
    local /*0x35EA0000-0x00000000*/ private bool bPushTop[9437185], ReturnValue;


}

function Reset()
{
    ActivationTime = 0.0000000;
    TriggerCount = 0;
    Instigator = none;
    //return;    
}

event Toggled()
{
    //return;    
}

defaultproperties
{
    MaxTriggerCount=1
    bEnabled=true
    bPlayerOnly=true
    bAutoActivateOutputLinks=false
    InputLinks=none
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Instigator",LinkVar="None",PropertyName="None",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
}