class LPSeqVar_AIs extends SeqVar_Object
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x84380000-0x00000000*/ private bool bUseTeamFilter[65537];
var(0.25_Pct) /*0x84380000-0x00000000*/ private byte TeamFilter[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AICtrls[536870913];

// Export ULPSeqVar_AIs::execUpdateAICtrlsList(FFrame&, void* const)
native final function UpdateAICtrlsList();

function GetObjectValue()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], AICtrl;

    UpdateAICtrlsList();
    AICtrl = none;
    // End:0x3A
    if(AICtrls.Length > 0)
    {
        AICtrl = AICtrls[0];
    }
    return AICtrl;
    //return ReturnValue;    
}

defaultproperties
{
    SupportedClasses=/* Array type was not detected. */
    ObjName="AIs"
}