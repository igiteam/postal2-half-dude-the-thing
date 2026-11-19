class SeqAct_Latent extends SequenceAction
    abstract
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LatentActors;
var(*) /*0x35EA0000-0x00000000*/ private bool bAborted;
var(*) /*0x35EA0000-0x00000000*/ private float LatentActivationTime;

// Export USeqAct_Latent::execAbortFor(FFrame&, void* const)
native function AbortFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL latentActor[8388609];


}

event Update()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

defaultproperties
{
    bLatentExecution=true
    OutputLinks[0]=(Links=none,LinkDesc="Finished",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Aborted",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    ObjName="Undefined Latent"
}