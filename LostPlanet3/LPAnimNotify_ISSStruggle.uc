class LPAnimNotify_ISSStruggle extends LPAnimNotify_Script
    editinlinenew
    collapsecategories
    hidecategories(Object);

enum EISSStruggleAction
{
    EIA_ShowProp,                   // 0
    EIA_HideProp,                   // 1
    EIA_MAX                         // 2
};

var(0.25_Pct) /*0x7C040000-0x00000000*/ private byte Action[65537];
var(0.25_Pct) /*0x7C040000-0x00000000*/ private byte Prop[65537];

defaultproperties
{
    NotifyName="OnAnimNotifyISSStruggle"
}