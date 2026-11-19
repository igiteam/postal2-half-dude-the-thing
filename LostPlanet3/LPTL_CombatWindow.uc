class LPTL_CombatWindow extends SPAnimNodeTemplateLogicBase
    abstract
    hidecategories(Object,Object,Object,Object,ChildBlendTimes,AnimNodeBlendList,Performance,AnimNodeBlendBase,Morph);

struct native CombatWindowSelector
{
    var(0.25_Pct) /*0x25C50000-0x00000000*/ private name WindowName[65537];

    structdefaultproperties
    {
        WindowName="None"
    }
};

var(0.25_Pct) /*0x89530000-0x00000000*/ private class PawnClass[65537];
var(0.25_Pct) /*0x89530000-0x00000000*/ private editfixedsize array CombatWindows[4259841];
