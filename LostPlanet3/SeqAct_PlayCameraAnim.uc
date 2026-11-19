class SeqAct_PlayCameraAnim extends SequenceAction
    hidecategories(Object);

var(*) /*0x44190000-0x00000000*/ private @NULL CameraAnim[65537];
var(*) /*0x44190000-0x00000000*/ private bool bLoop[65537];
var(*) /*0x44190000-0x00000000*/ private bool bRandomStartTime[65537];
var(*) /*0x44190000-0x00000000*/ private float BlendInTime[65537];
var(*) /*0x44190000-0x00000000*/ private float BlendOutTime[65537];
var(*) /*0x44190000-0x00000000*/ private float Rate[65537];
var(*) /*0x44190000-0x00000000*/ private float IntensityScale[65537];
var(*) /*0x44190000-0x00000000*/ private byte PlaySpace[65537];
var(*) /*0x44190000-0x00000000*/ private @NULL UserDefinedSpaceActor[65537];

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 1;
    //return ReturnValue;    
}

defaultproperties
{
    BlendInTime=0.2000000
    BlendOutTime=0.2000000
    Rate=1.0000000
    IntensityScale=1.0000000
    InputLinks[0]=(LinkDesc="Play",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Stop",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Play CameraAnim"
}