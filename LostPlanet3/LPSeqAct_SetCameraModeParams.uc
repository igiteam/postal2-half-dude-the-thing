class LPSeqAct_SetCameraModeParams extends SPCameraSequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x831B0000-0x00000400*/ private @NULL CameraModeParam[65537];

static event GetObjClassVersion()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return super.GetObjClassVersion() + 0;
    //return ReturnValue;    
}

defaultproperties
{
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Set Camera Mode Params (LP)"
}