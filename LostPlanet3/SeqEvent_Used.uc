class SeqEvent_Used extends SequenceEvent
    hidecategories(Object);

var(*) /*0x447F0000-0x00000000*/ private bool bAimToInteract[65537];
var(*) /*0x447F0000-0x00000000*/ private float InteractDistance[65537];
var(*) /*0x447F0000-0x00000000*/ private editfixedsize string InteractText[65537];
var(*) /*0x447F0000-0x00000000*/ private @NULL InteractIcon[65537];
var(*) /*0x4D450000-0x00000000*/ private editfixedsize array ClassProximityTypes[65537];
var(*) /*0x4D450000-0x00000000*/ private editfixedsize array IgnoredClassProximityTypes[65537];

defaultproperties
{
    bAimToInteract=true
    InteractDistance=128.0000000
    InteractText="Use"
    OutputLinks[0]=(Links=none,LinkDesc="Used",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Unused",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Instigator",LinkVar="None",PropertyName="None",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'SeqVar_Float',LinkedVariables=none,LinkDesc="Distance",LinkVar="None",PropertyName="None",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Used"
}