class LPTuneDataCoreDamageAction extends Object
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x89B00000-0x00000400*/ private editfixedsize @NULL CoreTag[589825];
var(0.25_Pct) /*0x89B00000-0x00000400*/ private editfixedsize @NULL PercentOfHealth[589825];
var(0.25_Pct) /*0x89B00000-0x00000000*/ private bool bOnlyActivateOnAnimNotify[65537];
var(0.25_Pct) /*0x89B00000-0x00000000*/ private bool bDestroyLoopFxOnNextCoreHealthAction[65537];
var(0.25_Pct) /*0x89B00000-0x00000000*/ private name BoneToTurnOff[65537];
var(0.25_Pct) /*0x89B00000-0x00000000*/ private name BoneToTurnOn[65537];
var(0.25_Pct) /*0x89B00000-0x00000400*/ private editfixedsize @NULL CoreToTurnOnTag[589825];
var(0.25_Pct) /*0x89B00000-0x00000400*/ private editfixedsize @NULL GrabPointToTurnOnTag[589825];
var(0.25_Pct) /*0x89B00000-0x00000400*/ private editfixedsize @NULL GrabPointToTurnOffTag[589825];
var(0.25_Pct) /*0x89B00000-0x00000400*/ private editfixedsize @NULL WinchPointToTurnOnTag[589825];
var(0.25_Pct) /*0x89B00000-0x00000400*/ private editfixedsize @NULL WinchPointToTurnOffTag[589825];
var(0.25_Pct) /*0x89B00000-0x00000000*/ private name NameOfTempTuneDataFx[65537];
var(0.25_Pct) /*0x89B00000-0x00000000*/ private name NameOfLoopingTuneDataFx[65537];
var(0.25_Pct) /*0x89B00000-0x00000000*/ private float DurationOfLoopingTuneDataFx[65537];
var(0.25_Pct) /*0x89B00000-0x00000000*/ private name NameOfTempTuneDataSfx[65537];
var(0.25_Pct) /*0x89B00000-0x00000000*/ private name NameOfLoopingTuneDataSfx[65537];
var(0.25_Pct) /*0x89B00000-0x00000000*/ private float DurationOfLoopingTuneDataSfx[65537];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataCoreDamageAction.PercentOfHealthD0'
    begin object name=PercentOfHealthD0 class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    PercentOfHealth=PercentOfHealthD0
    DurationOfLoopingTuneDataFx=-1.0000000
    DurationOfLoopingTuneDataSfx=-1.0000000
}