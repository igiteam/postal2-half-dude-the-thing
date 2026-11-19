class LPTuneDataSeizeControlObjective extends SPEngineTuneDataBase
    hidecategories(Object,Object);

var(0.25_Pct) /*0x8A0F0000-0x00000000*/ private float FirstPlayerControlPerSecond[65537];
var(0.25_Pct) /*0x8A0F0000-0x00000000*/ private float AdditionalPlayersControlPerSecond[65537];
var(0.25_Pct) /*0x8A0F0000-0x00000000*/ private float ErodeAmountPerSecond[65537];
var(0.25_Pct) /*0x8A0F0000-0x00000000*/ private float NeutralPercentThreshhold[65537];
var(0.25_Pct) /*0x04E30000-0x00000000*/ private float AkridSmallControlPerSecond[65537];
var(0.25_Pct) /*0x04E30000-0x00000000*/ private float AkridMediumControlPerSecond[65537];
var(0.25_Pct) /*0x04E30000-0x00000000*/ private float AkridLargeControlPerSecond[65537];
var(0.25_Pct) /*0x04E30000-0x00000000*/ private float AkridExtraLargeControlPerSecond[65537];
var(0.25_Pct) /*0x04E30000-0x00000000*/ private float AkridStationaryControlPerSecond[65537];

defaultproperties
{
    FirstPlayerControlPerSecond=10.0000000
    AdditionalPlayersControlPerSecond=5.0000000
    ErodeAmountPerSecond=5.0000000
    AkridSmallControlPerSecond=2.0000000
    AkridMediumControlPerSecond=5.0000000
    AkridLargeControlPerSecond=10.0000000
    AkridExtraLargeControlPerSecond=20.0000000
    AkridStationaryControlPerSecond=2.0000000
}