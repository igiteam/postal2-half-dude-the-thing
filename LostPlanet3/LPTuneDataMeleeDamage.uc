class LPTuneDataMeleeDamage extends Object
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x89D60000-0x00000400*/ private editfixedsize @NULL DamageAmount[589825];
var(0.25_Pct) /*0x89D60000-0x00000000*/ private class TheDamageType[65537];
var(0.25_Pct) /*0x89D60000-0x00000000*/ private class Limb[65537];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataMeleeDamage.DamageAmountDefaultObject'
    begin object name=DamageAmountDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DamageAmount=DamageAmountDefaultObject
}