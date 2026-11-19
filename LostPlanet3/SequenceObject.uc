class SequenceObject extends Object
    abstract
    forcescriptorder(true)
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private int ObjInstanceVersion[131073];
var(*) /*0x35EA0000-0x00000100*/ private @NULL ParentSequence[131073];
var(*) /*0x35EA0000-0x00000000*/ private int ObjPosX;
var(*) /*0x35EA0000-0x00000000*/ private int ObjPosY;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ObjName;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ObjCategory;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ObjRemoveInProject;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ObjColor;
var(*) /*0x44920000-0x00000000*/ private editfixedsize string ObjComment[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bDeletable;
var(*) /*0x35EA0000-0x00000000*/ private bool bDrawFirst;
var(*) /*0x35EA0000-0x00000000*/ private bool bDrawLast;
var(*) /*0x44920000-0x00000000*/ private bool bOutputObjCommentToScreen[65537];
var(*) /*0x44920000-0x00000000*/ private bool bSuppressAutoComment[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasDynamicData;
var(*) /*0x35EA0000-0x00000000*/ private int DrawWidth;
var(*) /*0x35EA0000-0x00000000*/ private int DrawHeight;
var(*) /*0x35EA0000-0x00000000*/ private globalconfig @NULL PIESequenceObject[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AvailableInEditors;
var(*) /*0x44920000-0x00000000*/ private float CommentLifeSpan[65537];

// Export USequenceObject::execScriptLog(FFrame&, void* const)
native final function ScriptLog()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string LogText[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWarning[9437185];

    true                
}

// Export USequenceObject::execGetWorldInfo(FFrame&, void* const)
native final function GetWorldInfo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

event IsValidLevelSequenceObject()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

event IsPastingIntoLevelSequenceAllowed()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return IsValidLevelSequenceObject();
    //return ReturnValue;    
}

event ShouldClearNameOnPasting()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return 1;
    //return ReturnValue;    
}

defaultproperties
{
    ObjName="Undefined"
    bDeletable=true
    bSuppressAutoComment=true
    bHasDynamicData=true
}