class KynapseSeqAct extends SeqAct_Latent
    abstract
    forcescriptorder(true)
    hidecategories(Object);

var(accidentRatio) /*0x01B10000-0x00000000*/ private bool bInterruptable[65537];
var(accidentRatio) /*0x01B10000-0x00000000*/ private float Duration[65537];
var(accidentRatio) /*0x02000000-0x00000000*/ private float activityTimer;
var(accidentRatio) /*0x02000000-0x00000010*/ private editfixedsize array KynapseBotsList;
var(accidentRatio) /*0x01B10000-0x00000000*/ private float Speed[65537];

defaultproperties
{
    Duration=10000.0000000
    Speed=240.0000000
    OutputLinks[0]=(Links=none,LinkDesc="Finished",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Aborted",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[2]=(Links=none,LinkDesc="Out",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
}