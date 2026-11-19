class SPAIKismetObjectiveData extends Object
    abstract
    editinlinenew
    hidecategories(Object);

var(__NotifyAccessLostDelegate__Delegate) /*0x05100000-0x00000000*/ private byte PriorityCategory[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x05100000-0x00000000*/ private float ObjectiveRating[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private class GeneratedObjectiveClass;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array AllowedControllerClasses;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bUseAsGenerator;

event PreUnload()
{
    //return;    
}

event PostEdit()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize string ChangedProperty[8388609];

    //return;    
}

defaultproperties
{
    PriorityCategory=SPAIObjectiveCategory.SPAI_OBJCAT_Kismet
    AllowedControllerClasses=/* Array type was not detected. */
}