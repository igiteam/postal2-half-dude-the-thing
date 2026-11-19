class LPSeqAct_SetTaserRecharge extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x833D0000-0x00000000*/ private bool bResetToDefaults[65537];
var(0.25_Pct) /*0x833D0000-0x00000000*/ private float TimeToFullCharge[65537];

defaultproperties
{
    TimeToFullCharge=5.0000000
    ObjName="Set Taser Recharge Time (LP)"
}