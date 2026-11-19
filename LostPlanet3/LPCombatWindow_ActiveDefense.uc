class LPCombatWindow_ActiveDefense extends LPCombatWindow
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x2C200000-0x00000000*/ private name DrawSocketName[65537];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private float DrawRadius[65537];
var(0.25_Pct) /*0x7CA30000-0x00000400*/ private editfixedsize @NULL EnabledForDifficulty[589825];

defaultproperties
{
    DrawRadius=100.0000000
    // Reference: SPFloatDifficulty'Default__LPCombatWindow_ActiveDefense.EnabledForDifficulty0'
    begin object name=EnabledForDifficulty0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    EnabledForDifficulty=EnabledForDifficulty0
}