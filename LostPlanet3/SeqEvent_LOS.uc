class SeqEvent_LOS extends SequenceEvent
    hidecategories(Object);

var(*) /*0x44710000-0x00000000*/ private float ScreenCenterDistance[65537];
var(*) /*0x44710000-0x00000000*/ private float TriggerDistance[65537];
var(*) /*0x44710000-0x00000000*/ private bool bCheckForObstructions[65537];

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 1;
    //return ReturnValue;    
}

defaultproperties
{
    ScreenCenterDistance=50.0000000
    TriggerDistance=2048.0000000
    bCheckForObstructions=true
    OutputLinks[0]=(Links=none,LinkDesc="Look",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Stop Look",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    ObjName="Line Of Sight"
}