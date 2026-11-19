class LPSeqAct_SetAmbientTemperature extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x83150000-0x00000000*/ private float TargetTemperature[65537];
var(0.25_Pct) /*0x83150000-0x00000000*/ private float TemperatureChangeRate[65537];

defaultproperties
{
    TemperatureChangeRate=2.0000000
    ObjName="Set Ambient Temperature (LP)"
}