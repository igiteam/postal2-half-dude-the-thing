class LPTuneDataStrugglePhaseButton extends LPTuneDataStrugglePhaseAnimControl
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0xA2530000-0x00000000*/ private name SuccessPhaseName[65537];
var(0.25_Pct) /*0xA2530000-0x00000000*/ private name failPhaseName[65537];
var(0.25_Pct) /*0x1A500000-0x00000000*/ private float EnemyPushAtStart[65537];
var(0.25_Pct) /*0x1A500000-0x00000000*/ private float EnemyPushAtEnd[65537];
var(0.25_Pct) /*0x1A500000-0x00000000*/ private float PlayerPushEachButton[65537];
var(0.25_Pct) /*0x1A500000-0x00000000*/ private float InitTimeCanNotLose[65537];
var(0.25_Pct) /*0x1A500000-0x00000000*/ private float TimeIncreasesDifficulty[65537];
var(0.25_Pct) /*0x1A500000-0x00000000*/ private float RatioIncreasesDifficulty[65537];
var(0.25_Pct) /*0x035B0000-0x00000000*/ private float AnimPctgFailed[65537];
var(0.25_Pct) /*0x035B0000-0x00000000*/ private float AnimPctgSuccess[65537];
var(0.25_Pct) /*0x035B0000-0x00000000*/ private bool bEnablePostProcess[65537];

defaultproperties
{
    EnemyPushAtStart=0.1000000
    EnemyPushAtEnd=0.2000000
    PlayerPushEachButton=0.1000000
    InitTimeCanNotLose=2.0000000
    TimeIncreasesDifficulty=5.0000000
    RatioIncreasesDifficulty=0.4000000
    AnimPctgSuccess=1.0000000
    GameClass=Class'LPSP_StruggleButton'
}