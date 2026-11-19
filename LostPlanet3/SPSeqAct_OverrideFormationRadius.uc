class SPSeqAct_OverrideFormationRadius extends SequenceAction
    abstract
    forcescriptorder(true)
    hidecategories(Object);

enum OverrideFormationRadiusMode
{
    OFR_Mode_UseNewRadius,          // 0
    OFR_Mode_UseDefault,            // 1
    OFR_Mode_MAX                    // 2
};

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private name ResourceName;
var(__NotifyAccessLostDelegate__Delegate) /*0x057A0000-0x00000000*/ private byte Mode[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x057A0000-0x00000000*/ private @NULL Override[65537];

event Activated()
{
    //return;    
}

defaultproperties
{
    ResourceName="HAS NOT BEEN SET"
    ObjName="Override the formation radius (SP)"
}