class LPTuneDataStrugglePhaseAnimControl extends LPTuneDataStrugglePhaseAnim
    abstract
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x06270000-0x00000000*/ private name AdditiveTemplateName[65537];
var(0.25_Pct) /*0x06270000-0x00000000*/ private name AdditiveFollowerTemplateName[65537];
var(0.25_Pct) /*0x035B0000-0x00000000*/ private float FactorAnimFollowMeter[65537];
var(0.25_Pct) /*0x035B0000-0x00000000*/ private float MinPlayBackRate[65537];
var(0.25_Pct) /*0x035B0000-0x00000000*/ private float MaxPlayBackRate[65537];
var(0.25_Pct) /*0x68070000-0x00000000*/ private @NULL ButtonTextureXBox[65537];
var(0.25_Pct) /*0x68070000-0x00000000*/ private @NULL ButtonTexturePs3[65537];
var(0.25_Pct) /*0x68070000-0x00000000*/ private @NULL FeedbackOffset[65537];
var(0.25_Pct) /*0x68070000-0x00000000*/ private float FeedbackLength[65537];
var(0.25_Pct) /*0x68070000-0x00000000*/ private float FeedbackWidth[65537];
var(0.25_Pct) /*0x68070000-0x00000000*/ private bool ShowPressButtonHUD[65537];

defaultproperties
{
    FactorAnimFollowMeter=3.0000000
    MinPlayBackRate=-1.0000000
    MaxPlayBackRate=1.0000000
    FeedbackOffset=(X=60.0000000,Y=5.0000000,Z=10.0000000)
    FeedbackLength=20.0000000
    FeedbackWidth=4.0000000
    ShowPressButtonHUD=true
}