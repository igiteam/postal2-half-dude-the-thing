class LPSeqAct_AIDifficultlyTuning extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x82600000-0x00000000*/ private float NewMaxHealth[65537];
var(0.25_Pct) /*0x82600000-0x00000000*/ private float DamageOutputChangeFactor[65537];

defaultproperties
{
    NewMaxHealth=100.0000000
    DamageOutputChangeFactor=1.0000000
    ObjName="AI Difficultly Tuning"
}