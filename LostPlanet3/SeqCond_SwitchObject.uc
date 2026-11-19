class SeqCond_SwitchObject extends SeqCond_SwitchBase
    hidecategories(Object);

struct native SwitchObjectCase
{
    var(*) /*0x4B260000-0x00000000*/ private @NULL ObjectValue[65537];
    var(*) /*0x4B260000-0x00000000*/ private bool bFallThru[65537];
    var(*) /*0x4B260000-0x00000000*/ private bool bDefaultValue[65537];

    structdefaultproperties
    {
        ObjectValue=none
        bFallThru=false
        bDefaultValue=false
    }
};

var(*) /*0x44610000-0x00000000*/ private editfixedsize array SupportedValues[65537];

event VerifyDefaultCaseValue()
{
    local /*0x35EA0000-0x00000000*/ private int I;

    super.VerifyDefaultCaseValue();
    SupportedValues.Length = OutputLinks.Length;
    I = 0;
    J0x2A:

    // End:0x7C [Loop If]
    if(I < (SupportedValues.Length - 1))
    {
        SupportedValues[I].bDefaultValue = false;
        I++;
        // [Loop Continue]
        goto J0x2A;
    }
    SupportedValues[SupportedValues.Length - 1].ObjectValue = none;
    SupportedValues[SupportedValues.Length - 1].bFallThru = false;
    SupportedValues[SupportedValues.Length - 1].bDefaultValue = true;
    //return;    
}

event IsFallThruEnabled()
{
    local /*0x35EA0000-0x00000000*/ private int ValueIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return ((ValueIndex >= 0) && ValueIndex < SupportedValues.Length) && SupportedValues[ValueIndex].bFallThru;
    //return ReturnValue;    
}

event InsertValueEntry()
{
    local /*0x35EA0000-0x00000000*/ private int InsertIndex[8388609];

    InsertIndex = Clamp(InsertIndex, 0, SupportedValues.Length);
    SupportedValues.Insert(InsertIndex, 1);    
    //return;    
}

event RemoveValueEntry()
{
    local /*0x35EA0000-0x00000000*/ private int RemoveIndex[8388609];

    // End:0x3E
    if((RemoveIndex >= 0) && RemoveIndex < SupportedValues.Length)
    {
        SupportedValues.Remove(RemoveIndex, 1);        
    }
    //return;    
}

defaultproperties
{
    SupportedValues=/* Array type was not detected. */
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Object",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Switch Object"
}