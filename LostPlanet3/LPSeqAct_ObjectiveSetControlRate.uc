class LPSeqAct_ObjectiveSetControlRate extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x26E90000-0x00000000*/ private float PlayerControlRateMultiplier[65537];
var(0.25_Pct) /*0x26E90000-0x00000000*/ private float AkridControlRateMultiplier[65537];

defaultproperties
{
    PlayerControlRateMultiplier=1.0000000
    AkridControlRateMultiplier=1.0000000
    ObjName="Objective Set Control Rate (LP)"
}