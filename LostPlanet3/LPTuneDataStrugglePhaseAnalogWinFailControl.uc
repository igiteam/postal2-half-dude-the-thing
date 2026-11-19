class LPTuneDataStrugglePhaseAnalogWinFailControl extends LPTuneDataStrugglePhaseAnimControl
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x05EF0000-0x00000000*/ private float PlayerPushScale[65537];
var(0.25_Pct) /*0x05EF0000-0x00000000*/ private float WinValue[65537];
var(0.25_Pct) /*0x05EF0000-0x00000000*/ private float LoseValue[65537];
var(0.25_Pct) /*0x05EF0000-0x00000000*/ private float MinTimeRequiredToHoldWinPose[65537];
var(0.25_Pct) /*0x05EF0000-0x00000000*/ private float MinTimeRequiredToHoldLosePose[65537];
var(0.25_Pct) /*0xA2530000-0x00000000*/ private name SuccessPhaseName[65537];
var(0.25_Pct) /*0xA2530000-0x00000000*/ private name failPhaseName[65537];

defaultproperties
{
    PlayerPushScale=1.0000000
    WinValue=0.9500000
    LoseValue=-0.9500000
    MinTimeRequiredToHoldWinPose=1.0000000
    MinTimeRequiredToHoldLosePose=1.0000000
    GameClass=Class'LPSP_StruggleAnalogWinFailControl'
}