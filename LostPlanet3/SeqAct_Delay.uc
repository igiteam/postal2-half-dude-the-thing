class SeqAct_Delay extends SeqAct_Latent
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private bool bDelayActive[131073];
var(*) /*0x43F70000-0x00000000*/ private bool bStartWillRestart[65537];
var(*) /*0x35EA0000-0x00000000*/ private float DefaultDuration[131073];
var(*) /*0x43F70000-0x00000000*/ private float Duration[65537];
var(*) /*0x35EA0000-0x00000000*/ private float LastUpdateTime[131073];
var(*) /*0x35EA0000-0x00000000*/ private float RemainingTime[131073];

function Reset()
{
    ResetDelayActive();
    //return;    
}

// Export USeqAct_Delay::execResetDelayActive(FFrame&, void* const)
native function ResetDelayActive();

defaultproperties
{
    DefaultDuration=1.0000000
    Duration=1.0000000
    InputLinks[0]=(LinkDesc="Start",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Stop",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[2]=(LinkDesc="Pause",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Float',LinkedVariables=none,LinkDesc="Duration",LinkVar="None",PropertyName="Duration",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Delay"
}