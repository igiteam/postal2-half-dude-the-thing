class LPSeqAct_SetPOFMinSnowiness extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x83370000-0x00000000*/ private float MinSnowiness[65537];
var(0.25_Pct) /*0x83370000-0x00000000*/ private float BlendTime[65537];

defaultproperties
{
    BlendTime=-1.0000000
    bCallHandler=false
    ObjName="Set POF Min Snowiness (LP)"
}