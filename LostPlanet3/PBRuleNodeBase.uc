class PBRuleNodeBase extends Object
    abstract
    editinlinenew
    hidecategories(Object);

struct native PBRuleLink
{
    var(*) /*0x3B6F0000-0x00000400*/ private editfixedsize @NULL NextRule[589825];
    var(*) /*0x3B6F0000-0x00000000*/ private name LinkName[65537];
    var(*) /*0x35EA0000-0x00000000*/ private int DrawY;

    structdefaultproperties
    {
        NextRule=none
        LinkName="None"
        DrawY=0
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array NextRules[4194305];
var(*) /*0x3B710000-0x00000000*/ private editfixedsize string Comment[65537];
var(*) /*0x35EA0000-0x00000000*/ private int RulePosX;
var(*) /*0x35EA0000-0x00000000*/ private int RulePosY;
var(*) /*0x35EA0000-0x00000000*/ private int InDrawY;
var(*) /*0x35EA0000-0x00000000*/ private int DrawWidth;
var(*) /*0x35EA0000-0x00000000*/ private int DrawHeight;

defaultproperties
{
    NextRules=/* Array type was not detected. */
}