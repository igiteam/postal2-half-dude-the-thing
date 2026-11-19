class Player extends Object
    transient
    config(Engine);

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_FExec[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Actor[537001985];
var(*) /*0x35EA0000-0x00000000*/ private int CurrentNetSpeed[131073];
var(*) /*0x35EA0000-0x00000000*/ private input int ConfiguredInternetSpeed[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input int ConfiguredLanSpeed[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float PP_DesaturationMultiplier[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float PP_HighlightsMultiplier[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float PP_MidTonesMultiplier[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float PP_ShadowsMultiplier[1073741825];

// Export UPlayer::execSwitchController(FFrame&, void* const)
native function SwitchController()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609];


}

defaultproperties
{
    ConfiguredInternetSpeed=7000
    ConfiguredLanSpeed=10000
    PP_DesaturationMultiplier=1.0000000
    PP_HighlightsMultiplier=1.0000000
    PP_MidTonesMultiplier=1.0000000
    PP_ShadowsMultiplier=1.0000000
}