class SeqCond_SwitchBase extends SequenceCondition
    abstract
    hidecategories(Object);

event VerifyDefaultCaseValue()
{
    //return;    
}

event IsFallThruEnabled()
{
    local /*0x35EA0000-0x00000000*/ private int ValueIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

event InsertValueEntry()
{
    local /*0x35EA0000-0x00000000*/ private int InsertIndex[8388609];

    //return;    
}

event RemoveValueEntry()
{
    local /*0x35EA0000-0x00000000*/ private int RemoveIndex[8388609];

    //return;    
}

defaultproperties
{
    OutputLinks[0]=(Links=none,LinkDesc="Default",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
}