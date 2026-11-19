class SeqCond_SwitchClass extends SeqCond_SwitchBase
    hidecategories(Object);

struct native SwitchClassInfo
{
    var(*) /*0x4B210000-0x00000000*/ private name ClassName[65537];
    var(*) /*0x4B210000-0x00000000*/ private byte bFallThru[65537];

    structdefaultproperties
    {
        ClassName="None"
        bFallThru=0
    }
};

var(*) /*0x44600000-0x00000000*/ private editfixedsize array ClassArray[65537];

event VerifyDefaultCaseValue()
{
    super.VerifyDefaultCaseValue();
    ClassArray.Length = OutputLinks.Length;
    ClassArray[ClassArray.Length - 1].ClassName = 'Default';
    ClassArray[ClassArray.Length - 1].bFallThru = 0;
    //return;    
}

event IsFallThruEnabled()
{
    local /*0x35EA0000-0x00000000*/ private int ValueIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return ((ValueIndex >= 0) && ValueIndex < ClassArray.Length) && int(ClassArray[ValueIndex].bFallThru) != int(0);
    //return ReturnValue;    
}

event InsertValueEntry()
{
    local /*0x35EA0000-0x00000000*/ private int InsertIndex[8388609];

    InsertIndex = Clamp(InsertIndex, 0, ClassArray.Length);
    ClassArray.Insert(InsertIndex, 1);    
    //return;    
}

event RemoveValueEntry()
{
    local /*0x35EA0000-0x00000000*/ private int RemoveIndex[8388609];

    // End:0x3E
    if((RemoveIndex >= 0) && RemoveIndex < ClassArray.Length)
    {
        ClassArray.Remove(RemoveIndex, 1);        
    }
    //return;    
}

defaultproperties
{
    ClassArray=/* Array type was not detected. */
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Object",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Switch Class"
}