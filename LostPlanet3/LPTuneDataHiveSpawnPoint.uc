class LPTuneDataHiveSpawnPoint extends SPEngineTuneDataBase
    hidecategories(Object,Object);

struct HiveAnimationSets
{
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name Idle[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name DeadClosed[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name DeadOpen[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name RangeAttack[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name HitReactionCore[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name HitReactionShell[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name HitReactionLeaf01[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name HitReactionLeaf02[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name HitReactionLeaf03[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name HitReactionLeaf04[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name HitReactionLeaf05[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name HitReactionLeaf06[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name Opening[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name Open[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name Closing[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name OpeningSlow[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name OpenSlow[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name ClosingSlow[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name SwallowGrenade[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name BlowingUpFromGrenadeOpen[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name BlowingUpFromGrenadeClosed[65537];
    var(0.25_Pct) /*0x672B0000-0x00000000*/ private name OpenBirthModifier[65537];

    structdefaultproperties
    {
        Idle="None"
        DeadClosed="None"
        DeadOpen="None"
        RangeAttack="None"
        HitReactionCore="None"
        HitReactionShell="None"
        HitReactionLeaf01="None"
        HitReactionLeaf02="None"
        HitReactionLeaf03="None"
        HitReactionLeaf04="None"
        HitReactionLeaf05="None"
        HitReactionLeaf06="None"
        Opening="None"
        Open="None"
        Closing="None"
        OpeningSlow="None"
        OpenSlow="None"
        ClosingSlow="None"
        SwallowGrenade="None"
        BlowingUpFromGrenadeOpen="None"
        BlowingUpFromGrenadeClosed="None"
        OpenBirthModifier="None"
    }
};

var(0.25_Pct) /*0x2AEA0000-0x00000400*/ private editfixedsize array DamageFilterInfo[65537];
var(0.25_Pct) /*0x65FC0000-0x00000000*/ private int Health[65537];
var(0.25_Pct) /*0x65FC0000-0x00000000*/ private float SecondsUntilRegeneration[65537];
var(0.25_Pct) /*0x08BF0000-0x00000000*/ private float RangeAttackDistance[65537];
var(0.25_Pct) /*0x08BF0000-0x00000400*/ private editfixedsize @NULL RangeAttackTemplate[589825];
var(0.25_Pct) /*0x08BF0000-0x00000000*/ private float MinTimeBetweenRangeAttacks[65537];
var(0.25_Pct) /*0x65FC0000-0x00000400*/ private editfixedsize @NULL DeathExplosionTemplate[589825];
var(0.25_Pct) /*0x06380000-0x00000000*/ private @NULL AnimSeqNames[65537];
var(0.25_Pct) /*0xBCA70000-0x00000000*/ private float SpawnOpenMaxTime[65537];
var(0.25_Pct) /*0x63850000-0x00000400*/ private editfixedsize @NULL RangeFromGrenadeFinalDestinationSocketToStartAssist[589825];
var(0.25_Pct) /*0x63850000-0x00000400*/ private editfixedsize @NULL AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssist[589825];
var(0.25_Pct) /*0x63850000-0x00000400*/ private editfixedsize @NULL AngleInDegreesToAllowGrenadeStick[589825];
var(0.25_Pct) /*0x63850000-0x00000000*/ private float GrenadeAssistZoneNumOfRadials[196609];
var(0.25_Pct) /*0x63850000-0x00000000*/ private float GrenadeAssistZoneNumBiasPointsPerRadial[196609];
var(0.25_Pct) /*0x63850000-0x00000400*/ private @NULL GrenadeAssistZoneColorActive[589825];
var(0.25_Pct) /*0x63850000-0x00000400*/ private @NULL GrenadeAssistZoneColorInActive[589825];
var(0.25_Pct) /*0x63850000-0x00000400*/ private @NULL GrenadeValidStickZoneColor[589825];
var(0.25_Pct) /*0x63930000-0x00000400*/ private export @NULL ExploRadialBlurForGrenadeExplosionInternal[720897];
var(0.25_Pct) /*0x63930000-0x00000000*/ private float ExploRadialBlurFadeOutTimeForGrenadeExplosionInternal[196609];
var(0.25_Pct) /*0x63930000-0x00000000*/ private float ExploRadialBlurMaxBlurForGrenadeExplosionInternal[196609];
var(0.25_Pct) /*0x63930000-0x00000000*/ private name BoneToStickGrenadeTo[65537];
var(0.25_Pct) /*0x63930000-0x00000000*/ private bool bStopAllPhysicalActionsOfGrenadeOnAttachment[65537];
var(0.25_Pct) /*0x493E0000-0x00000000*/ private bool bCanBeTagged[65537];
var(0.25_Pct) /*0x63930000-0x00000000*/ private float DelayAfterNotifyOfInternalExplosionBeforeSecondExplosionEffects[65537];
var(0.25_Pct) /*0x493E0000-0x00000400*/ private editfixedsize @NULL RequiredNumTags[589825];
var(0.25_Pct) /*0x493E0000-0x00000400*/ private editfixedsize @NULL RequiredTagHoverTime[589825];
var(0.25_Pct) /*0x493E0000-0x00000400*/ private editfixedsize @NULL DNATaggingQuestObjective[589825];
var(0.25_Pct) /*0x493E0000-0x00000000*/ private @NULL TagParticleSystem[65537];

defaultproperties
{
    Health=1000
    SecondsUntilRegeneration=90.0000000
    RangeAttackDistance=-1.0000000
    MinTimeBetweenRangeAttacks=1.5000000
    AnimSeqNames=(Idle="AKD_hivspa_idle_Core",DeadClosed="AKD_hivspa_die_block_Core",DeadOpen="AKD_hivspa_die_open_Core",RangeAttack="AKD_hivspa_attack_Core",HitReactionCore="ADD_AKD_hivspa_hit_Core",HitReactionShell="ADD_AKD_hivspa_hit_react_outer_Core",HitReactionLeaf01="ADD_AKD_hivspa_hit_react_leaf_1_Core",HitReactionLeaf02="ADD_AKD_hivspa_hit_react_leaf_2_Core",HitReactionLeaf03="ADD_AKD_hivspa_hit_react_leaf_3_Core",HitReactionLeaf04="ADD_AKD_hivspa_hit_react_leaf_4_Core",HitReactionLeaf05="ADD_AKD_hivspa_hit_react_leaf_5_Core",HitReactionLeaf06="ADD_AKD_hivspa_hit_react_leaf_6_Core",Opening="AKD_hivspa_Birth_Open_Fast_Core",Open="AKD_hivspa_Birth_Open_Loop_Core",Closing="AKD_hivspa_Birth_Close_Fast_Core",OpeningSlow="AKD_hivspa_Birth_Open_Slow_Core",OpenSlow="AKD_hivspa_Birth_Open_Loop_Core",ClosingSlow="AKD_hivspa_Birth_Close_Slow_Core",SwallowGrenade="AKD_hivspa_grenade_swallow_Core",BlowingUpFromGrenadeOpen="AKD_hivspa_grenade_explosion_death_Core",BlowingUpFromGrenadeClosed="AKD_hivspa_grenade_explosion_death_closed_Core",OpenBirthModifier="ADD_AKD_hivspa_hit_Core")
    SpawnOpenMaxTime=2.0000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataHiveSpawnPoint.RangeFromGrenadeFinalDestinationSocketToStartAssistD0'
    begin object name=RangeFromGrenadeFinalDestinationSocketToStartAssistD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=500.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RangeFromGrenadeFinalDestinationSocketToStartAssist=RangeFromGrenadeFinalDestinationSocketToStartAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataHiveSpawnPoint.AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0'
    begin object name=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=60.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssist=AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssistD0
    // Reference: SPFloatDifficulty'Default__LPTuneDataHiveSpawnPoint.AngleInDegreesToAllowGrenadeStickD0'
    begin object name=AngleInDegreesToAllowGrenadeStickD0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=45.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    AngleInDegreesToAllowGrenadeStick=AngleInDegreesToAllowGrenadeStickD0
    GrenadeAssistZoneNumOfRadials=8.0000000
    GrenadeAssistZoneNumBiasPointsPerRadial=2.0000000
    GrenadeAssistZoneColorActive=(R=255,G=100,B=100,A=0)
    GrenadeAssistZoneColorInActive=(R=255,G=255,B=20,A=0)
    GrenadeValidStickZoneColor=(R=0,G=0,B=100,A=0)
    ExploRadialBlurFadeOutTimeForGrenadeExplosionInternal=0.1000000
    ExploRadialBlurMaxBlurForGrenadeExplosionInternal=0.2000000
    BoneToStickGrenadeTo="JO_GrenTarget"
    bStopAllPhysicalActionsOfGrenadeOnAttachment=true
    bCanBeTagged=true
    DelayAfterNotifyOfInternalExplosionBeforeSecondExplosionEffects=0.1000000
    // Reference: SPFloatDifficulty'Default__LPTuneDataHiveSpawnPoint.RequiredNumTags0'
    begin object name=RequiredNumTags0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RequiredNumTags=RequiredNumTags0
    // Reference: SPFloatDifficulty'Default__LPTuneDataHiveSpawnPoint.RequiredTagHoverTime0'
    begin object name=RequiredTagHoverTime0 class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.5000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    RequiredTagHoverTime=RequiredTagHoverTime0
}