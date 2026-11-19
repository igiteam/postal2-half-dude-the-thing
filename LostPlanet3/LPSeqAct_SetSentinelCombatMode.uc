class LPSeqAct_SetSentinelCombatMode extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x83390000-0x00000000*/ private bool UpdateCloseRange[65537];
var(0.25_Pct) /*0x83390000-0x00000000*/ private bool UpdateNormalAttacks[65537];
var(0.25_Pct) /*0x83390000-0x00000000*/ private bool UpdateCover[65537];
var(0.25_Pct) /*0x83390000-0x00000000*/ private bool UpdateCloseRangeAttackDistance[65537];
var(0.25_Pct) /*0x83390000-0x00000400*/ private @NULL CloseRangeChance[65537];
var(0.25_Pct) /*0x83390000-0x00000400*/ private @NULL NormalChance[65537];
var(0.25_Pct) /*0x83390000-0x00000400*/ private @NULL CoverChance[65537];
var(0.25_Pct) /*0x83390000-0x00000000*/ private float CloseRangeAttackDistance[65537];

defaultproperties
{
    ObjName="Set Sentinel Combat Mode (LP)"
}