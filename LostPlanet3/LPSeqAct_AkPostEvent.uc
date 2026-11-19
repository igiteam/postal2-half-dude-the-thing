class LPSeqAct_AkPostEvent extends SPSeqAct_AkPostEvent
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x826F0000-0x00000000*/ private bool bStopVitalSuitMusicPlayer[65537];
var(0.25_Pct) /*0x826F0000-0x00000000*/ private bool bDisableVSGameMusic[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRegistredDisableVSGameMusicOverride[536870913];
var(0.25_Pct) /*0x826F0000-0x00000000*/ private bool bDisableVSUserMusic[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRegistredDisableVSUserMusicOverride[536870913];
var(0.25_Pct) /*0x826F0000-0x00000000*/ private bool bAutoResumeMusicPlayer[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRegistredAutoResumeMusicPlayer[536870913];
var(0.25_Pct) /*0x826F0000-0x00000000*/ private bool bShowRadioMessageInVSHUD[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRegisteredRadioMessage[536870913];

defaultproperties
{
    bDisableVSGameMusic=true
    bDisableVSUserMusic=true
    bAutoResumeMusicPlayer=true
    ObjName="AkPostEvent (LP)"
}