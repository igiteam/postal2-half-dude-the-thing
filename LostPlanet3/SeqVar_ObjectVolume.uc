class SeqVar_ObjectVolume extends SeqVar_Object
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private float LastUpdateTime;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ContainedObjects;
var(*) /*0x44A20000-0x00000000*/ private editfixedsize array ExcludeClassList[65537];
var(*) /*0x44A20000-0x00000000*/ private bool bCollidingOnly[65537];

defaultproperties
{
    ExcludeClassList=/* Array type was not detected. */
    bCollidingOnly=true
    ObjName="Object Volume"
}