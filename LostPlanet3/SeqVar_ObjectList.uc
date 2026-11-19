class SeqVar_ObjectList extends SeqVar_Object
    hidecategories(Object);

var(*) /*0x44A10000-0x00000000*/ private editfixedsize array ObjList[65537];

function GetObjectValue()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ((ObjList.Length > 0) ? ObjList[0] : none);
    //return ReturnValue;    
}

function SetObjectValue()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewValue[8388609];

    ObjList[0] = NewValue;
    //return;    
}

defaultproperties
{
    ObjName="Object List"
}