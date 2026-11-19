class LPQO_Quest extends SPQO_Quest
    editinlinenew
    hidecategories(Object,Object)
    autoexpandcategories(SPQuestObject_Base,SPQO_Quest);

var(0.25_Pct) /*0x820C0000-0x00000000*/ private bool bOptionalQuest[65537];
var(0.25_Pct) /*0xD0210000-0x00000000*/ private bool bAllowJobLogTracking[65537];
var(0.25_Pct) /*0x820C0000-0x00000000*/ private name PersistentMapName[65537];

defaultproperties
{
    bAllowJobLogTracking=true
    // Reference: LPQP_PreviousEntry'Default__LPQO_Quest.DefaultPrereqA'
    begin object name=DefaultPrereqA class=Class'LPQP_PreviousEntry'
    end object
    Prerequisite=DefaultPrereqA
    DynamicDataClass=Class'LPQDD_Quest'
}