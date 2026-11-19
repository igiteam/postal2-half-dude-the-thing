class LPTuneDataStrikeTime extends Object
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x8A180000-0x00000000*/ private byte StrikeType[65537];
var(0.25_Pct) /*0x8A180000-0x00000400*/ private editfixedsize @NULL MinTimeBetweenStrikes[589825];
var(0.25_Pct) /*0x8A180000-0x00000400*/ private editfixedsize @NULL MaxTimeBetweenStrikes[589825];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataStrikeTime.MinTimeBetweenStrikesD0'
    begin object name=MinTimeBetweenStrikesD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=-1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MinTimeBetweenStrikes=MinTimeBetweenStrikesD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataStrikeTime.MaxTimeBetweenStrikesD0'
    begin object name=MaxTimeBetweenStrikesD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=-1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    MaxTimeBetweenStrikes=MaxTimeBetweenStrikesD0
}