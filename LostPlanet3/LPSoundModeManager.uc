class LPSoundModeManager extends SPSoundModeManager
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private name MODE_InsideVS;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PRI_InsideVS;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name MODE_LowHealth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PRI_LowHealth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name MODE_AttentionDrawingAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PRI_AttentionDrawingAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PRI_StruggleMode;

defaultproperties
{
    MODE_InsideVS="Cockpit"
    PRI_InsideVS=10
    MODE_LowHealth="Dying"
    PRI_LowHealth=11
    MODE_AttentionDrawingAttack="Wasp_Announce"
    PRI_AttentionDrawingAttack=3
    PRI_StruggleMode=2
}