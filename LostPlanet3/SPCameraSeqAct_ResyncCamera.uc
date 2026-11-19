class SPCameraSeqAct_ResyncCamera extends SPCameraSequenceAction
    abstract
    hidecategories(Object);

static event GetObjClassVersion()
{
    local /*0x043A0000-0x00000000*/ private int ReturnValue[92274689];

    return super.GetObjClassVersion() + 7;
    //return ReturnValue;    
}

defaultproperties
{
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Sync Target",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Resync Camera (SP)"
}