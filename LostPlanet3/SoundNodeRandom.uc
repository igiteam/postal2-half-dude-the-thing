class SoundNodeRandom extends SoundNode
    editinlinenew
    hidecategories(Object,Object);

var(*) /*0x48720000-0x00000000*/ private editfixedsize array Weights[4259841];
var(*) /*0x48720000-0x00000000*/ private int PreselectAtLevelLoad[65537];
var(*) /*0x48720000-0x00000000*/ private bool bRandomizeWithoutReplacement[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array HasBeenUsed[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int NumRandomUsed[536870913];

defaultproperties
{
    bRandomizeWithoutReplacement=true
}