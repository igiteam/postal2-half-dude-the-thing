class SPCameraSeqAct_SetCameraFocus extends SPCameraSequenceAction
    abstract
    hidecategories(Object);

var(__Filter1__Delegate) /*0x057E0000-0x00000400*/ private float AttractionStrength[65537];
var(__Filter1__Delegate) /*0x057E0000-0x00000000*/ private bool bUseTargetOrientationOnly[65537];
var(__Filter1__Delegate) /*0x057E0000-0x00000400*/ private float DelaySeconds[65537];

static event GetObjClassVersion()
{
    local /*0x043A0000-0x00000000*/ private int ReturnValue[92274689];

    return super.GetObjClassVersion() + 7;
    //return ReturnValue;    
}

defaultproperties
{
    AttractionStrength=1.0000000
    DelaySeconds=2.0000000
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Focus Target",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Set Camera Focus (SP)"
}