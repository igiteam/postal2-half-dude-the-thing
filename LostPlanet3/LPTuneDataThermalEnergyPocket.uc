class LPTuneDataThermalEnergyPocket extends SPEngineTuneDataBase
    hidecategories(Object,Object);

var(0.25_Pct) /*0x8A530000-0x00000000*/ private int MaxPostsPlayerCanErect[65537];
var(0.25_Pct) /*0x8A530000-0x00000000*/ private @NULL PocketEnabledSoundCue[65537];
var(0.25_Pct) /*0x8A530000-0x00000000*/ private @NULL PocketDisabledSoundCue[65537];
var(0.25_Pct) /*0x8A530000-0x00000000*/ private @NULL PocketProximityAkSoundCue[65537];
var(0.25_Pct) /*0x8A530000-0x00000000*/ private @NULL PocketProximityAkSoundStopCue[65537];
var(0.25_Pct) /*0x8A530000-0x00000000*/ private float PocketProximityPingMaxDistance[65537];
var(0.25_Pct) /*0x8A530000-0x00000000*/ private float InfestationLevel1Time[65537];
var(0.25_Pct) /*0x8A530000-0x00000000*/ private float InfestationLevel2Time[65537];
var(0.25_Pct) /*0x8A530000-0x00000000*/ private float InfestationLevel3Time[65537];

defaultproperties
{
    InfestationLevel1Time=2.0000000
    InfestationLevel2Time=10.0000000
    InfestationLevel3Time=20.0000000
}