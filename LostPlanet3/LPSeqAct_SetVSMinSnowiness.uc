class LPSeqAct_SetVSMinSnowiness extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x83450000-0x00000000*/ private float MinSnowiness[65537];
var(0.25_Pct) /*0x83450000-0x00000000*/ private float BlendTime[65537];

defaultproperties
{
    BlendTime=-1.0000000
    ObjName="Set VS Min Snowiness (LP)"
}