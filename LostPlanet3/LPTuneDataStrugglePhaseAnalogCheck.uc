class LPTuneDataStrugglePhaseAnalogCheck extends LPTuneDataStrugglePhaseAnim
    editinlinenew
    hidecategories(Object,Object);

struct AnalogCheckMeterRange
{
    var(0.25_Pct) /*0x05F10000-0x00000000*/ private float MinMeterValue[65537];
    var(0.25_Pct) /*0x05F10000-0x00000000*/ private float MaxMeterValue[65537];
    var(0.25_Pct) /*0x05F10000-0x00000000*/ private name PhaseName[65537];

    structdefaultproperties
    {
        MinMeterValue=0.0000000
        MaxMeterValue=0.0000000
        PhaseName="None"
    }
};

var(0.25_Pct) /*0x05F00000-0x00000000*/ private name SuccessPhaseName[65537];
var(0.25_Pct) /*0x05F00000-0x00000000*/ private name failPhaseName[65537];
var(0.25_Pct) /*0x05F00000-0x00000000*/ private name MeterPhaseName[65537];
var(0.25_Pct) /*0x05F00000-0x00000000*/ private float MinMeterValue[65537];
var(0.25_Pct) /*0x05F00000-0x00000000*/ private float MaxMeterValue[65537];
var(0.25_Pct) /*0x05F00000-0x00000000*/ private editfixedsize array CheckMeterRanges[65537];

defaultproperties
{
    MaxMeterValue=1.0000000
    GameClass=Class'LPSP_StruggleAnalogCheck'
}