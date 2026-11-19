class LPTuneDataStrugglePhaseAnim extends LPTuneDataStrugglePhase
    abstract
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x06270000-0x00000000*/ private byte PlayAnimMode[65537];
var(0.25_Pct) /*0x06270000-0x00000000*/ private byte PlayAnimTarget[65537];
var(0.25_Pct) /*0xA2530000-0x00000000*/ private name AnimTemplateName[65537];
var(0.25_Pct) /*0x06270000-0x00000000*/ private bool bIsLooping[65537];
var(0.25_Pct) /*0x035B0000-0x00000000*/ private bool bLeaderUpperBody[65537];
var(0.25_Pct) /*0x035B0000-0x00000000*/ private bool EndFollowerOnAnimFinishes[65537];
var(0.25_Pct) /*0x06270000-0x00000000*/ private float MinTime[65537];
var(0.25_Pct) /*0x06270000-0x00000000*/ private float MaxTime[65537];
var(0.25_Pct) /*0x06270000-0x00000000*/ private @NULL CameraAnim[65537];
var(0.25_Pct) /*0x06270000-0x00000000*/ private name SoundEventName[65537];
var(0.25_Pct) /*0x035B0000-0x00000000*/ private float AnimStartPctg[65537];
var(0.25_Pct) /*0x035B0000-0x00000000*/ private float ChoreoMovementPercent[65537];
var(0.25_Pct) /*0x035B0000-0x00000000*/ private float BlendInTime[65537];
var(0.25_Pct) /*0x035B0000-0x00000000*/ private name OverwriteKnifeSocket[65537];
var(0.25_Pct) /*0x035B0000-0x00000000*/ private float PlayRate[65537];

defaultproperties
{
    AnimStartPctg=-1.0000000
    ChoreoMovementPercent=0.5000000
    BlendInTime=0.2500000
    PlayRate=1.0000000
}