class LPTuneDataStruggle extends SPEngineTuneDataBase
    hidecategories(Object,Object);

var(0.25_Pct) /*0x8A190000-0x00000400*/ private editfixedsize array StrugglePhases[589825];
var(0.25_Pct) /*0x8A190000-0x00000000*/ private name WinPhaseName[65537];
var(0.25_Pct) /*0x8A190000-0x00000000*/ private name PerfectWinPhaseName[65537];
var(0.25_Pct) /*0x8A190000-0x00000000*/ private int NumPointsToWin[65537];
var(0.25_Pct) /*0x8A190000-0x00000000*/ private name failPhaseName[65537];
var(0.25_Pct) /*0x8A190000-0x00000000*/ private name StartPhaseName[65537];
var(0.25_Pct) /*0x8A190000-0x00000000*/ private float MaxSinkDepth[65537];
var(0.25_Pct) /*0x8A190000-0x00000000*/ private bool bShowKnife[65537];
var(0.25_Pct) /*0x8A190000-0x00000000*/ private bool bShowKnifeOnAnimNotify[65537];
var(0.25_Pct) /*0x8A190000-0x00000000*/ private bool bKillFollowerOnWin[65537];
var(0.25_Pct) /*0x8A190000-0x00000000*/ private bool bWaitForFollowerToFinish[65537];
var(0.25_Pct) /*0x22E80000-0x00000000*/ private bool PushAwayFromBlockingCamera[65537];
var(0.25_Pct) /*0x1B5A0000-0x00000000*/ private bool bUseStruggleCamera[65537];
var(0.25_Pct) /*0x8A190000-0x00000000*/ private name KnifeSocket[65537];
var(0.25_Pct) /*0x8A190000-0x00000000*/ private float MinPercentageHealthAfterStruggle[65537];
var(0.25_Pct) /*0x22E80000-0x00000000*/ private float DesiredSeparationFromVS[65537];
var(0.25_Pct) /*0x22E80000-0x00000000*/ private float DesiredSeparationFromWorldGeometry[65537];
var(0.25_Pct) /*0x22E80000-0x00000000*/ private float TimeAdjustToDesiredDistance[65537];
var(0.25_Pct) /*0x1B5A0000-0x00000000*/ private float DurationCameraTransition[65537];
var(0.25_Pct) /*0x1B5A0000-0x00000000*/ private float StruggleCameraFOV[65537];
var(0.25_Pct) /*0xBB430000-0x00000000*/ private name SoundModeName[65537];

defaultproperties
{
    MaxSinkDepth=-1.0000000
    bShowKnife=true
    bKillFollowerOnWin=true
    PushAwayFromBlockingCamera=true
    bUseStruggleCamera=true
    MinPercentageHealthAfterStruggle=0.5000000
    TimeAdjustToDesiredDistance=0.1000000
    DurationCameraTransition=0.5000000
    StruggleCameraFOV=75.0000000
}