class SPSeqEvent_GameButtonActionUsed extends SequenceEvent
    abstract
    forcescriptorder(true)
    hidecategories(Object);

var(__HandleButtonInput__Delegate) /*0x026A0000-0x00000000*/ private bool bLookToInteract[65537];
var(__HandleButtonInput__Delegate) /*0x026A0000-0x00000000*/ private bool bAimToInteract[65537];
var(__HandleButtonInput__Delegate) /*0x026A0000-0x00000000*/ private bool bDisableGameAction[65537];
var(__HandleButtonInput__Delegate) /*0x026A0000-0x00000000*/ private float InteractDistance[65537];
var(__HandleButtonInput__Delegate) /*0x026A0000-0x00000000*/ private editfixedsize string InteractText[65537];
var(__HandleButtonInput__Delegate) /*0x026A0000-0x00000000*/ private @NULL InteractIcon[65537];
var(__HandleButtonInput__Delegate) /*0x028F0000-0x00000000*/ private editfixedsize array ClassProximityTypes[65537];
var(__HandleButtonInput__Delegate) /*0x028F0000-0x00000000*/ private editfixedsize array IgnoredClassProximityTypes[65537];
var(__HandleButtonInput__Delegate) /*0x026A0000-0x00000000*/ private name GBA_Button[65537];
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private class DefaultInputClass;

defaultproperties
{
    bLookToInteract=true
    bAimToInteract=true
    InteractDistance=128.0000000
    InteractText="Use"
    DefaultInputClass=Class'SPInputBase'
    OutputLinks[0]=(Links=none,LinkDesc="Pressed",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Released",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Instigator",LinkVar="None",PropertyName="None",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=none,LinkDesc="Distance",LinkVar="None",PropertyName="None",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Game Button Action Used (SP)"
}