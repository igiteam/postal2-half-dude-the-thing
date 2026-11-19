class LPTuneDataCore extends Object
    editinlinenew
    hidecategories(Object);

struct native LPCoresToAlsoDamageWhenDOT_TuneData
{
    var(0.25_Pct) /*0x7CD30000-0x00000400*/ private editfixedsize @NULL OtherCoreToPassTo[589825];
    var(0.25_Pct) /*0x7CD30000-0x00000000*/ private @NULL PhysicalMaterialForOtherCore[65537];
    var(0.25_Pct) /*0x7CD30000-0x00000000*/ private class TypeOfDamageAllowedToPass[65537];
    var(0.25_Pct) /*0x7CD30000-0x00000000*/ private class TypeOfDamagePrecursorToLookFor[65537];
    var(0.25_Pct) /*0x7CD30000-0x00000400*/ private editfixedsize @NULL HealthPercentToPassAt[589825];

    structdefaultproperties
    {
        OtherCoreToPassTo=none
        PhysicalMaterialForOtherCore=none
        TypeOfDamageAllowedToPass=none
        TypeOfDamagePrecursorToLookFor=none
        HealthPercentToPassAt=none
    }
};

var(0.25_Pct) /*0x89AF0000-0x00000400*/ private editfixedsize @NULL Health[589825];
var(0.25_Pct) /*0x89AF0000-0x00000400*/ private editfixedsize @NULL CoreTag[589825];
var(0.25_Pct) /*0x89AF0000-0x00000000*/ private @NULL DismembermentInfo[65537];
var(0.25_Pct) /*0x89AF0000-0x00000000*/ private name IKDrillTargetSocket[65537];
var(0.25_Pct) /*0x89AF0000-0x00000000*/ private byte MPDamagePassthrough[65537];
var(0.25_Pct) /*0x89AF0000-0x00000000*/ private float DefaultDamagePassThroughFactor[65537];
var(0.25_Pct) /*0x89AF0000-0x00000000*/ private editfixedsize array ByDamageTypePassThroughFilter[65537];
var(0.25_Pct) /*0x89AF0000-0x00000000*/ private float MaxCoreDamageFactor[65537];
var(0.25_Pct) /*0x4A4C0000-0x00000000*/ private name DOTEffectSocketName[65537];
var(0.25_Pct) /*0x89AF0000-0x00000000*/ private bool bEnableAtSpawn[65537];
var(0.25_Pct) /*0xAAC50000-0x00000400*/ private bool bCanRegenerate[589825];
var(0.25_Pct) /*0xAAC50000-0x00000400*/ private bool bCanDamageCoreWhileRegenerating[589825];
var(0.25_Pct) /*0x47E20000-0x00000000*/ private float CoreFadeInTime[65537];
var(0.25_Pct) /*0x47E20000-0x00000000*/ private float CoreFadeOutTime[65537];
var(0.25_Pct) /*0x89AF0000-0x00000000*/ private @NULL PhysicalMaterialOvverrideForDisabledCore[65537];
var(0.25_Pct) /*0x89AF0000-0x00000000*/ private @NULL PhysicalMaterialOvverrideForDeadCore[65537];
var(0.25_Pct) /*0xAAC50000-0x00000400*/ private editfixedsize @NULL StayDeadTime[589825];
var(0.25_Pct) /*0xAAC50000-0x00000400*/ private editfixedsize @NULL TimeToRegenrate[589825];
var(0.25_Pct) /*0x4A4C0000-0x00000400*/ private editfixedsize array CoresToAlsoDamageWhenDOT_List[589825];
var(0.25_Pct) /*0x622F0000-0x00000400*/ private editfixedsize array Gibs[65537];

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPTuneDataCore.HealthDefaultObject'
    begin object name=HealthDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Health=HealthDefaultObject
    DefaultDamagePassThroughFactor=1.0000000
    MaxCoreDamageFactor=1.0000000
    bEnableAtSpawn=true
    CoreFadeInTime=1.0000000
    CoreFadeOutTime=1.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataCore.StayDeadTimeDefaultObject'
    begin object name=StayDeadTimeDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    StayDeadTime=StayDeadTimeDefaultObject
    // Reference: SPFloatDifficulty'Default__LPTuneDataCore.TimeToRegenrateDefaultObject'
    begin object name=TimeToRegenrateDefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeToRegenrate=TimeToRegenrateDefaultObject
}