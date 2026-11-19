class LPTuneDataAmmoTENGDriller extends LPTuneDataAmmoDefault
    hidecategories(Object,Object);

var(0.25_Pct) /*0xCA330000-0x00000400*/ private editfixedsize @NULL DrainMultiplier[589825];
var(0.25_Pct) /*0xCA330000-0x00000000*/ private bool bDrainFromIncapacitatedPlayers[65537];
var(0.25_Pct) /*0xCA330000-0x00000000*/ private bool bScaleRecieveDelayByDistance[65537];
var(0.25_Pct) /*0xCA330000-0x00000000*/ private float RecieveDelay[65537];
var(0.25_Pct) /*0xCA330000-0x00000000*/ private float BaseRecieveDelayDistance[65537];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataAmmoTENGDriller.DrainMultiplier0'
    begin object name=DrainMultiplier0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DrainMultiplier=DrainMultiplier0
    RecieveDelay=0.5000000
    BaseRecieveDelayDistance=2000.0000000
    LocationalDamageParts=/* Array type was not detected. */
}