class LPTuneDataStrugglePhase extends LPTuneDataStrugglePhaseNative
    abstract
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0xD7810000-0x00000000*/ private int WinPoints[65537];
var(0.25_Pct) /*0xD7810000-0x00000000*/ private int DamagePoints[65537];
var(0.25_Pct) /*0xD7810000-0x00000000*/ private bool bAllowPlayerToDie[65537];
var(0.25_Pct) /*0xD7810000-0x00000000*/ private bool PlayWinPhaseDirectly[65537];
var(0.25_Pct) /*0xD7810000-0x00000000*/ private bool bFinishingPhase[65537];
var(0.25_Pct) /*0xA3FD0000-0x00000000*/ private bool bLockPlayerPitchControllerForPhase[65537];
var(0.25_Pct) /*0xD7810000-0x00000000*/ private name OverwriteWinPhaseName[65537];
var(0.25_Pct) /*0xD7810000-0x00000000*/ private name OverwriteFailPhaseName[65537];
var(0.25_Pct) /*0xA27D0000-0x00000000*/ private editfixedsize array BoneNamesOfPhysAssetsToTurnOffForThisPhaseOnLeader[65537];
var(0.25_Pct) /*0xA27D0000-0x00000000*/ private editfixedsize array BoneNamesOfPhysAssetsToTurnOffForThisPhaseOnFollower[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class GameClass;
var(0.25_Pct) /*0xA3FD0000-0x00000000*/ private int PitchToLockPlayerControllerToForPhase[65537];
var(0.25_Pct) /*0xA3FD0000-0x00000000*/ private float BlendTimeToLockPitch[65537];

defaultproperties
{
    bAllowPlayerToDie=true
    BlendTimeToLockPitch=2.0000000
}