class SeqVar_Object extends SequenceVariable
    hidecategories(Object);

var(*) /*0x44A00000-0x00000000*/ private @NULL ObjValue[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ActorLocation[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SupportedClasses[131073];

function GetObjectValue()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ObjValue;
    //return ReturnValue;    
}

function SetObjectValue()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewValue[8388609];

    ObjValue = NewValue;
    //return;    
}

defaultproperties
{
    SupportedClasses=/* Array type was not detected. */
    ObjName="Object"
}