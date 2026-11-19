class SeqAct_PlaySound extends SeqAct_Latent
    hidecategories(Object);

var(*) /*0x441C0000-0x00000000*/ private @NULL PlaySound[65537];
var(*) /*0x441C0000-0x00000000*/ private float ExtraDelay[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bDelayReached[536870913];
var(*) /*0x441C0000-0x00000000*/ private bool bSuppressSubtitles[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bStopped[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float SoundDuration[536870913];
var(*) /*0x441C0000-0x00000000*/ private float FadeInTime[65537];
var(*) /*0x441C0000-0x00000000*/ private float FadeOutTime[65537];
var(*) /*0x441C0000-0x00000000*/ private float VolumeMultiplier[65537];
var(*) /*0x441C0000-0x00000000*/ private float PitchMultiplier[65537];
var(*) /*0x441C0000-0x00000000*/ private float BeforeEndTime[65537];

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 1;
    //return ReturnValue;    
}

defaultproperties
{
    VolumeMultiplier=1.0000000
    PitchMultiplier=1.0000000
    InputLinks[0]=(LinkDesc="Play",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Stop",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    OutputLinks[0]=(Links=none,LinkDesc="Out",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Finished",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[2]=(Links=none,LinkDesc="Stopped",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[3]=(Links=none,LinkDesc="BeforeEnd",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    ObjName="Play Sound"
}