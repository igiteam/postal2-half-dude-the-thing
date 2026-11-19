class LPTuneDataStrugglePhaseWaggle extends LPTuneDataStrugglePhaseAnimControl
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0xA2530000-0x00000000*/ private name SuccessPhaseName[65537];
var(0.25_Pct) /*0xA2530000-0x00000000*/ private name failPhaseName[65537];
var(0.25_Pct) /*0xD5800000-0x00000000*/ private float MaxTimeAfterWhichPhaseFails[65537];
var(0.25_Pct) /*0xD5800000-0x00000000*/ private float TotalNumberOfWagglesForSuccess[65537];
var(0.25_Pct) /*0x035B0000-0x00000000*/ private bool bEnablePostProcess[65537];

defaultproperties
{
    MaxTimeAfterWhichPhaseFails=5.0000000
    TotalNumberOfWagglesForSuccess=10.0000000
    GameClass=Class'LPSP_StruggleWaggle'
}