class SPCameraSeqAct_ClearCameraLayer extends SPCameraSequenceAction
    abstract
    hidecategories(Object);

var(__Filter1__Delegate) /*0x057B0000-0x00000400*/ private name Layer[65537];
var(__Filter1__Delegate) /*0x057B0000-0x00000400*/ private @NULL CameraTransitionParam[65537];

static event GetObjClassVersion()
{
    local /*0x043A0000-0x00000000*/ private int ReturnValue[92274689];

    return super.GetObjClassVersion() + 2;
    //return ReturnValue;    
}

defaultproperties
{
    Layer="Designer"
    ObjName="Clear Camera Layer (SP)"
}