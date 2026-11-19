class LPSeqAct_SetPackHunterTailGlow extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x83330000-0x00000000*/ private float GlowValue[65537];
var(0.25_Pct) /*0x83330000-0x00000000*/ private float RampRate[65537];

defaultproperties
{
    ObjName="Set PackHunter Tail (LP)"
}