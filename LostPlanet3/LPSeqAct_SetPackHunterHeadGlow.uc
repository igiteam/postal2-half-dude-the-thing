class LPSeqAct_SetPackHunterHeadGlow extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x83320000-0x00000000*/ private float GlowValue[65537];
var(0.25_Pct) /*0x83320000-0x00000000*/ private float RampRate[65537];

defaultproperties
{
    ObjName="Set PackHunter Head (LP)"
}