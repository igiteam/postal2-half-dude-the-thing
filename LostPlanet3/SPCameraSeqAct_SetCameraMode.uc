class SPCameraSeqAct_SetCameraMode extends SPCameraSequenceAction
    abstract
    hidecategories(Object);

var(__Filter1__Delegate) /*0x057F0000-0x00000400*/ private @NULL CameraModeParam[65537];
var(__Filter1__Delegate) /*0x057F0000-0x00000400*/ private @NULL CameraTransitionParam[65537];
var(__Filter1__Delegate) /*0x057F0000-0x00000000*/ private name Layer[65537];

static event GetObjClassVersion()
{
    local /*0x043A0000-0x00000000*/ private int ReturnValue[92274689];

    return super.GetObjClassVersion() + 7;
    //return ReturnValue;    
}

defaultproperties
{
    Layer="Default"
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Position Target",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="LookAt Target",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Set Camera Mode (SP)"
}