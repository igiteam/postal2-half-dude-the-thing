class LPAIPawn extends LPPawn
    abstract
    nativereplication
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

enum eMovementInteruptionEffectDirection
{
    eMIED_None,                     // 0
    eMIED_Forward,                  // 1
    eMIED_ForwardRight,             // 2
    eMIED_Right,                    // 3
    eMIED_BackwardRight,            // 4
    eMIED_Backward,                 // 5
    eMIED_BackwardLeft,             // 6
    eMIED_Left,                     // 7
    eMIED_ForwardLeft,              // 8
    eMIED_MAX                       // 9
};

enum eMovementInteruptionEffectSpeed
{
    eMIES_None,                     // 0
    eMIES_NoSignificantMovement,    // 1
    eMIES_Walk,                     // 2
    eMIES_Jog,                      // 3
    eMIES_Run,                      // 4
    eMIES_Sprint,                   // 5
    eMIES_MAX                       // 6
};

enum MPDismemberOverride
{
    MPDismemberOverride_none,       // 0
    MPDismemberOverride_DoesDismember,// 1
    MPDismemberOverride_DoesNotDismember,// 2
    MPDismemberOverride_MAX         // 3
};

enum MPDamagePassthroughOverride
{
    MPDamagePassthroughOverride_none,// 0
    MPDamagePassthroughOverride_PassToPawn,// 1
    MPDamagePassthroughOverride_PassToCore,// 2
    MPDamagePassthroughOverride_MAX // 3
};

enum eCoreEnableStage
{
    eCoreEnableStage_Disabled,      // 0
    eCoreEnableStage_Enabled,       // 1
    eCoreEnableStage_MAX            // 2
};

struct native ReplicatedAITakeHitInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Count;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AdditiveTemplateRootNode;

    structdefaultproperties
    {
        Count=0
        AdditiveTemplateRootNode=none
    }
};

struct native PustuleGrowthStatus
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PustuleGrowthData;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStartedPustule;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBurstPustule;
    var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL DamagePustuleParticleComponent[524289];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DamagePustuleSkelControl;

    structdefaultproperties
    {
        PustuleGrowthData=(HealthPercentToGrowPustule=0.8000000,HealthPercentToBurstPustule=-1.0000000,DamagePustuleSkelControlName="DamagePustule",SkelCtrlStrength=-1.0000000,SkelCtrlBlendInTime=-1.0000000,GrowthParticleEffectEventName="PhadyrDamagePustule",BurstParticleEffectEventName="PhadyrBurstPustule",ScaleOfGrowPustule=1.0000000)
        bStartedPustule=false
        bBurstPustule=false
        DamagePustuleParticleComponent=none
        DamagePustuleSkelControl=none
    }
};

struct native DamageTrackingEntry
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Time;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Damage;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCore;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CoreID;

    structdefaultproperties
    {
        Time=-1.0000000
        Damage=0.0000000
        bCore=false
        CoreID=-1
    }
};

struct native DamageTrackingInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastEntry;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DamageEntry;

    structdefaultproperties
    {
        LastEntry=-1
        DamageEntry=none
    }
};

struct native HitLocDebugInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHitShield;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHitCore;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BoneOffsetLoc;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name BoneHitName;

    structdefaultproperties
    {
        bHitShield=false
        bHitCore=false
        BoneOffsetLoc=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        BoneHitName="None"
    }
};

struct native CoreDamageFilterInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DamageCauser;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> DamageFilterCB;

    structdefaultproperties
    {
        DamageCauser=none
        DamageFilterCB=None
    }
};

struct native CoreDismembermentInfo
{
    var(0.25_Pct) /*0x27220000-0x00000000*/ private bool bDoesDismember[65537];
    var(0.25_Pct) /*0x27220000-0x00000000*/ private byte MPOverride[65537];
    var(0.25_Pct) /*0x27220000-0x00000000*/ private name BoneName[65537];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDismembered;

    structdefaultproperties
    {
        bDoesDismember=false
        MPOverride=MPDismemberOverride.MPDismemberOverride_none
        BoneName="None"
        bIsDismembered=false
    }
};

struct native CoresToAlsoDamageWhenDOT
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int OtherCoreToPassTo;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int IndexOtherCoreToPassTo;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PhysicalMaterialForOtherCore;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class TypeOfDamageAllowedToPass;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class TypeOfDamagePrecursorToLookFor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HealthPercentToPassAt;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private export @NULL InfoForDot;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDamageHasBeenPassed;

    structdefaultproperties
    {
        OtherCoreToPassTo=0
        IndexOtherCoreToPassTo=0
        PhysicalMaterialForOtherCore=none
        TypeOfDamageAllowedToPass=none
        TypeOfDamagePrecursorToLookFor=none
        HealthPercentToPassAt=0.0000000
        InfoForDot=(CausedByDamageType=none,DamageNeededToInduce=0.0000000,IntervalNeededToInduce=0.0000000,DamageType=none,DamagePerHit=0.0000000,DamagePerSecond=0.0000000,DamageDuration=0.0000000,EffectBoneName="None",EffectPhysicalMaterial=none,HitComponent=none,bCausesPoison=false,DamageCauser=none)
        bDamageHasBeenPassed=false
    }
};

struct native CoreData
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Health;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxHealth;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ReciprocalMaxHealth;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CoreID;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PhysMatPropTag;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DefaultDamagePassThroughFactor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CoreShields;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CoreShieldsSkeletal;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ByDamageTypePassThroughFilter;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL DamageFilter;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DismembermentInfo;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxCoreDamageFactor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxCoreDamageFactorBlendTarget;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxCoreDamageFactorBlendTimeLeft;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name DOTEffectSocketName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize export array CoresToAlsoDamageWhenDOT_List;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte EnableStage;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EnableStageChangeTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CoreFadeInTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CoreFadeOutTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CoreFadeStartTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CoreFadeEndTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageFactorAtFadeStart;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageFactorAtFadeEnd;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PhysicalMaterialOvverrideForDisabledCore;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PhysicalMaterialOvverrideForDeadCore;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StayDeadTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RegenerationStartTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PrevEnableStage;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PrevHealth;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DefaultRegenerationTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RegenerationRate;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanDamageCoreWhileRegenerating;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanRegenerate;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsRegenerating;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CoreGibStatusList;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte MPDamagePassthrough;

    structdefaultproperties
    {
        Health=0.0000000
        MaxHealth=0.0000000
        ReciprocalMaxHealth=0.0000000
        CoreID=0
        PhysMatPropTag=none
        DefaultDamagePassThroughFactor=1.0000000
        CoreShields=none
        CoreShieldsSkeletal=none
        ByDamageTypePassThroughFilter=none
        DamageFilter=(DamageCauser=none,DamageFilterCB=None)
        DismembermentInfo=(bDoesDismember=false,MPOverride=MPDismemberOverride.MPDismemberOverride_none,BoneName="None",bIsDismembered=false)
        MaxCoreDamageFactor=0.0000000
        MaxCoreDamageFactorBlendTarget=0.0000000
        MaxCoreDamageFactorBlendTimeLeft=0.0000000
        DOTEffectSocketName="None"
        CoresToAlsoDamageWhenDOT_List=none
        EnableStage=eCoreEnableStage.eCoreEnableStage_Enabled
        EnableStageChangeTime=0.0000000
        CoreFadeInTime=1.0000000
        CoreFadeOutTime=1.0000000
        CoreFadeStartTime=0.0000000
        CoreFadeEndTime=0.0000000
        DamageFactorAtFadeStart=0.0000000
        DamageFactorAtFadeEnd=0.0000000
        PhysicalMaterialOvverrideForDisabledCore=none
        PhysicalMaterialOvverrideForDeadCore=none
        StayDeadTime=0.0000000
        RegenerationStartTime=0.0000000
        PrevEnableStage=eCoreEnableStage.eCoreEnableStage_Disabled
        PrevHealth=0.0000000
        DefaultRegenerationTime=0.0000000
        RegenerationRate=0.0000000
        bCanDamageCoreWhileRegenerating=false
        bCanRegenerate=false
        bIsRegenerating=false
        CoreGibStatusList=none
        MPDamagePassthrough=MPDamagePassthroughOverride.MPDamagePassthroughOverride_none
    }
};

struct native CoreDamageActionData
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CoreID;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PercentOfHealth;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bActivated;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOnlyActivateOnAnimNotify;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWaitingOnAnimNotifyToActivate;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name BoneToTurnOff;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name BoneToTurnOn;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CoreToTurnOnId;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int GrabPointToTurnOn;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int GrabPointToTurnOff;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int WinchPointToTurnOn;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int WinchPointToTurnOff;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name NameOfTempTuneDataFx;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name NameOfLoopingTuneDataFx;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DurationOfLoopingTuneDataFx;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLoopingTuneDataFxStarted;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDestroyLoopFxOnNextCoreHealthAction;
    var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ActionParticleLoop[524289];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name NameOfTempTuneDataSfx;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name NameOfLoopingTuneDataSfx;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DurationOfLoopingTuneDataSfx;
    var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ActionSoundLoop[524289];

    structdefaultproperties
    {
        CoreID=-1
        PercentOfHealth=-1.0000000
        bActivated=false
        bOnlyActivateOnAnimNotify=false
        bWaitingOnAnimNotifyToActivate=false
        BoneToTurnOff="None"
        BoneToTurnOn="None"
        CoreToTurnOnId=-1
        GrabPointToTurnOn=-1
        GrabPointToTurnOff=-1
        WinchPointToTurnOn=-1
        WinchPointToTurnOff=-1
        NameOfTempTuneDataFx="None"
        NameOfLoopingTuneDataFx="None"
        DurationOfLoopingTuneDataFx=-1.0000000
        TimeLoopingTuneDataFxStarted=-1.0000000
        bDestroyLoopFxOnNextCoreHealthAction=false
        ActionParticleLoop=none
        NameOfTempTuneDataSfx="None"
        NameOfLoopingTuneDataSfx="None"
        DurationOfLoopingTuneDataSfx=-1.0000000
        ActionSoundLoop=none
    }
};

struct native CoreCachedDamageInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CoreTag;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PrevHealth;

    structdefaultproperties
    {
        CoreTag=none
        PrevHealth=0.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataAIPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLpAiController[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRegisteredAiResources[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUnregisteredAiResources[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldRagdoll[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAutoExplodeFrozen;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bApplyRagdollImpulse;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUsePawnToWinchLauncherDirInsteadOfSocketRotation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUsePawnsLocationInsteadOfWinchTargetSocketLoc[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCurrentValidTargetForGrenadeAssist[538968065];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCurrentValidTargetForWinchAssist[538968065];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAlwaysValidTargetForGrenadeAssist[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAlwaysValidTargetForWinchAssist[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldBeInSemiGodWhenOnAnimatedPaths[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWasInSemiGodWhenStartedAnimatedPath[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIntentionalLobMiss;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIntentionalDirectFireMiss;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAbleToAdjustLobAimPositionForGameplay;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAbleToAdjustDirectFireAimPositionForGameplay;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerformingBurstFire[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseTEngBleed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGettingBirthed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInvulnerableWhenFleeing;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldDeathBloom;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoneBlowingUpWhileDying[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowHitLocationDebugInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFreezeWhilePlayingAnim;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPausedForVsExit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowAkridAsEnemies;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinSpeedSqToConsideredMovingForAlternateAnimations[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinSpeedSqToAllowTrippingAndPlowInWhileRunning[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize export array MyCoreData[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize export array MyCoreDamageActionData[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class VSShockSpecialMove;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class VSDrillKillSpecialMove;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinRangeSqToAllowDamageAssessmentOrAnnounceToPerformOrContinue;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxRangeSqToAllowDamageAssessmentToContinue;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DamageReactionManagerAI;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private ReplicatedAITakeHitInfo ReplicatedLastAITakeHitInfo[538968065];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CosAngRangeInFrontOfGrenadeFinalDestinationSocketToAllowAssist[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RangeSqFromGrenadeFinalDestinationSocketToStartAssist[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CosAngRangeInFrontOfPawnToAllowWinchAssist[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RangeSqFromPawnToStartWinchAssist[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL DamageTracking[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ExplosionRadialBlur[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RadialBlurFadeTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RadialBlurFadeTimeRemaining[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RadialBlurMaxBlurAmount[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DefferedActorsToBreakOff[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumBrokenFracturedMeshesThisFrame[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxBrokenFracturedMeshesThisFrame;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DifficultlyTuningDamageOutputFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array LobStrikeLocValidationInfoList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RangedLobStrikeTierForCurrentAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RangedLobStrikeZoneForCurrentAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RangedLobStrikeZonesAtlArcForCurrentAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array LobProjMeshLocations[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LobProjImpactLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LobProjExplosionLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RangedLobStrikeLastLobCalcArcSuccessId[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array LogAlgosSegmentEnds[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array LogAlgosSegmentValiditys[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LobFireLastLocOfBlockage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LobProjStartLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DirectFireStrikeLocValidationInfoList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DirectFireStrikeTierForCurrentAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DirectFireStrikeZoneForCurrentAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DirectFireStrikeZonesAtlArcForCurrentAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DirectFireProjMeshLocations[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DirectFireProjImpactLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DirectFireProjExplosionLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DirectFireStrikeLastFireCalcArcSuccessId[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DirectFireAlgosSegmentEnds[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DirectFireAlgosSegmentValiditys[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DirectFireLastLocOfBlockage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DirectFireProjStartLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AimTargetPositionForRangedLobStrike;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AimTargetActorForRangedLobStrike;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AimTargetPositionForDirectFireStrike;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AimTargetActorForDirectFireStrike;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AimTargetPositionForBurstFireStrike;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AimTargetActorForBurstFireStrike;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int HorizontalBurstFireSpread;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int VerticalBurstFireSpread[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int HorizontalDirectFireSpread[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int VerticalDirectFireSpread[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte NumProjectilesForCurrentBurst[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte LastMovementInteruptionEffectDirection[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte LastMovementInteruptionEffectSpeedFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentBurstFireFromLoc[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentBurstFireRot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfPelletSpitSoFarThisBurst[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxSeperationToTriggerReactiveAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnemySelectedByAttackCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WinchContactRadius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastTEngBleedHealth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTEngBleedTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ThingThatGameBirthToMe;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBirthProcessEnded;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptions;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DeathBloomStartTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastDeathBloomUpdateTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LocationAtStartOfDeathBloom[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LocationAtStartOfDeathBloomForRipExplosion[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array RecentLocalSpaceHits[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array TempPlaceHolderWeakPoint[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastCoreDestroyedInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastCoreDamagedInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AlternateDNAQuestObjective;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastRawDamageTakenFromPlayer[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SafetyDelayToUnPauseAiAfterEnteringOrExitingVs[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentDodgeWindowPlayer[536870913];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __DamageFilterCBDelegate__Delegate;

delegate DamageFilterCBDelegate()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609];

    //return;    
}

// Export ULPAIPawn::execCleanUpAIResources(FFrame&, void* const)
native function CleanUpAIResources();

// Export ULPAIPawn::execBreakOffFractureMeshActor(FFrame&, void* const)
native simulated function BreakOffFractureMeshActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL FSMActor[8388609];


}

// Export ULPAIPawn::execGetCoreIndexForThisCoreId(FFrame&, void* const)
native simulated function GetCoreIndexForThisCoreId()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609], ReturnValue;


}

// Export ULPAIPawn::execSetCollisionOnCoreBodies(FFrame&, void* const)
native function SetCollisionOnCoreBodies()
{
    local /*0x97E50000-0x00000000*/ private bool bEnabled[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];


}

// Export ULPAIPawn::execShowDebugMessage(FFrame&, void* const)
native simulated function ShowDebugMessage()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string msg[8388609];
    local /*0x97E50000-0x00000000*/ private float ZOffset[9437185], Duration;
    local /*0x97E50000-0x00000000*/ private byte Red[9437185], Green, Blue;


}

// Export ULPAIPawn::execUpdateMaxCoreDamageFactors(FFrame&, void* const)
native simulated function UpdateMaxCoreDamageFactors()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];


}

// Export ULPAIPawn::execFindTossVelocity(FFrame&, void* const)
native final function FindTossVelocity()
{
    local /*0x97E50000-0x00000000*/ private @NULL TossVelocity[25165825], Destination, Start;
    local /*0x97E50000-0x00000000*/ private float TossSpeed[8388609], MinTossSpeedAllowed, MaxTossSpeedAllowed, BaseTossZ, DesiredZPct;

    local /*0x97E50000-0x00000000*/ private @NULL CollisionSize[9437185];
    local /*0x97E50000-0x00000000*/ private float TerminalVelocity[9437185], OverrideGravityZ;
    local /*0x97E50000-0x00000000*/ private bool bUseDeadReckoning[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL TargetVelocity[9568257];
    local /*0x97E50000-0x00000000*/ private bool bOnlyTraceUp[9437185], bShowDebugArtifacts, bPreLobCalc;
    local /*0x97E50000-0x00000000*/ private int LobStrikeValidationIdx[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForceNoGravity[9437185], ReturnValue;


}

// Export ULPAIPawn::execGetCoreHealth(FFrame&, void* const)
native final simulated function GetCoreHealth()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawn::execIsCoreEnabled(FFrame&, void* const)
native final simulated function IsCoreEnabled()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawn::execIsCoreEnabledByIndex(FFrame&, void* const)
native final simulated function IsCoreEnabledByIndex()
{
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawn::execGetCoreDisabledPhysicalMaterial(FFrame&, void* const)
native final simulated function GetCoreDisabledPhysicalMaterial()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPAIPawn::execGetCoreDeadPhysicalMaterial(FFrame&, void* const)
native final simulated function GetCoreDeadPhysicalMaterial()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPAIPawn::execGetCoreIndexFromTag(FFrame&, void* const)
native final simulated function GetCoreIndexFromTag()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPAIPawn::execIsValidCoreTagType(FFrame&, void* const)
native simulated function IsValidCoreTagType()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawn::execWantsToAim(FFrame&, void* const)
native simulated function WantsToAim()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawn::execTakeDamage_SetParams(FFrame&, void* const)
native simulated function TakeDamage_SetParams()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], InHitLocation, InMomentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], InstigatedByPawn, DamageCauser;
    local /*0x97E50000-0x00000000*/ private bool bShouldPlayHitReactAnim[9437185], bShouldPlayHitEffects;

    true
    true                                                
}

// Export ULPAIPawn::execGetCoreDamageFactor(FFrame&, void* const)
native simulated function GetCoreDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawn::execCoreFadingInOutDamageFactor(FFrame&, void* const)
protected native final simulated function CoreFadingInOutDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawn::execGetCoreDamageFactorHelper(FFrame&, void* const)
protected native final simulated function GetCoreDamageFactorHelper()
{
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float CoreHealth[8388609], MaxCoreHealth, ReturnValue;


}

// Export ULPAIPawn::execGetPawnDamageFactor(FFrame&, void* const)
native final simulated function GetPawnDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawn::execGetNonCorePassThroughFactor(FFrame&, void* const)
native final simulated function GetNonCorePassThroughFactor()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawn::execSetAimInfoForDirectFireStrike(FFrame&, void* const)
native final simulated function SetAimInfoForDirectFireStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL AimPos[25296897], AimActor;
    local /*0x97E50000-0x00000000*/ private int TierId[9437185], ZoneId;
    local /*0x97E50000-0x00000000*/ private float AdditionPosZOffset[9437185];

    -1
    -1
    0.0000000                            
}

// Export ULPAIPawn::execFindCurrentLobFromAnywhereZone(FFrame&, void* const)
native final simulated function FindCurrentLobFromAnywhereZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfLob[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPAIPawn::execFindCurrentLobFromGivenLocationZone(FFrame&, void* const)
native final simulated function FindCurrentLobFromGivenLocationZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocationToLobFrom[25296897], TargetOfLob;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPAIPawn::execFindCurrentDirectFireFromAnywhereZone(FFrame&, void* const)
native final simulated function FindCurrentDirectFireFromAnywhereZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfDirectFire[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

simulated event IsStunned()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated event Destroyed()
{
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x53 [Loop If]
    if(Idx < TempPlaceHolderWeakPoint.Length)
    {
        TempPlaceHolderWeakPoint[Idx].Destroy();
        ++Idx;
        // [Loop Continue]
        goto J0x0B;
    }
    TempPlaceHolderWeakPoint.Length = 0;
    // End:0x87
    if(bRegisteredAiResources && !bUnregisteredAiResources)
    {
        CleanUpAIResources();
    }
    super.Destroyed();
    DefferedActorsToBreakOff.Length = 0;
    // End:0xFA
    if(ExplosionRadialBlur != none)
    {
        ExplosionRadialBlur.SetBlurScale(0.0000000);
        ExplosionRadialBlur.DetachFromAny();
        ExplosionRadialBlur = none;
    }
    CurrentDodgeWindowPlayer = none;
    //return;    
}

function PossessedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MPGame;

    super(Pawn).PossessedBy(C, bVehicleTransition);
    MyLpAiController = LPAIController(C);
    MPGame = LPGameMP_Base(WorldInfo.Game);
    // End:0xA6
    if(MPGame != none)
    {
        NetUpdateFrequency = float(MPGame.NetFrequencyOverride);        
    }
    else
    {
        NetUpdateFrequency = Class'LPAIPawn'.default.NetUpdateFrequency;
    }
    bPausedForVsExit = false;
    //return;    
}

function UnPossessed()
{
    super(Pawn).UnPossessed();
    MyLpAiController = none;
    //return;    
}

function SetupAIResources()
{
    local /*0x97E50000-0x00000000*/ private @NULL lpCurMapInfo;

    // End:0x87
    if(!bRegisteredAiResources)
    {
        lpCurMapInfo = LPMapInfo(WorldInfo.GetMapInfo());
        // End:0x53
        if(lpCurMapInfo == none)
        {
            return;
        }
        lpCurMapInfo.RegisterAiPawnActivateAIResource(Class);
        bRegisteredAiResources = true;
    }
    //return;    
}

simulated event PostBeginPlay()
{
    MyLpAiController = none;
    DifficultlyTuningDamageOutputFactor = 1.0000000;
    super.PostBeginPlay();
    SetupAIResources();
    bSmoothSlopeMovement = false;
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL WeakPoint;

    TuneDataAIPawn = LPTuneDataAIPawn(TuneData);
    super.InitTuneData(TuneData);
    TuneDataAIPawn = LPTuneDataAIPawn(TuneDataPawn);
    // End:0x7ED
    if(TuneDataAIPawn != none)
    {
        bGettingBirthed = false;
        InitCores();
        InitAllCoreShields();
        InitRangeFireData();
        Idx = 0;
        J0x8F:

        // End:0x13F [Loop If]
        if(Idx < GrabPoints.Length)
        {
            GrabPoints[Idx].FirmGrabRadius = TuneDataAIPawn.FirmGrabRadius;
            GrabPoints[Idx].WeakGrabRadius = TuneDataAIPawn.WeakGrabRadius;
            Idx++;
            // [Loop Continue]
            goto J0x8F;
        }
        bIntentionalLobMiss = false;
        LastMovementInteruptionEffectDirection = 0;
        LastMovementInteruptionEffectSpeedFactor = 0;
        MinRangeSqToAllowDamageAssessmentOrAnnounceToPerformOrContinue = TuneDataAIPawn.MinRangeToAllowDamageAssessmentOrAnnounceToPerformOrContinue * TuneDataAIPawn.MinRangeToAllowDamageAssessmentOrAnnounceToPerformOrContinue;
        MaxRangeSqToAllowDamageAssessmentToContinue = TuneDataAIPawn.MaxRangeToAllowDamageAssessmentToContinue * TuneDataAIPawn.MaxRangeToAllowDamageAssessmentToContinue;
        MinSpeedSqToConsideredMovingForAlternateAnimations = TuneDataAIPawn.MinSpeedToConsideredMovingForAlternateAnimations * TuneDataAIPawn.MinSpeedToConsideredMovingForAlternateAnimations;
        MinSpeedSqToAllowTrippingAndPlowInWhileRunning = TuneDataAIPawn.MinSpeedToAllowTrippingAndPlowInWhileRunning * TuneDataAIPawn.MinSpeedToAllowTrippingAndPlowInWhileRunning;
        Class'SPEngine.SPUtil'.static.SetHalfCosAngRange(TuneDataAIPawn.AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssist.GetValue(), CosAngRangeInFrontOfGrenadeFinalDestinationSocketToAllowAssist);
        RangeSqFromGrenadeFinalDestinationSocketToStartAssist = TuneDataAIPawn.RangeFromGrenadeFinalDestinationSocketToStartAssist.GetValue() * TuneDataAIPawn.RangeFromGrenadeFinalDestinationSocketToStartAssist.GetValue();
        Class'SPEngine.SPUtil'.static.SetHalfCosAngRange(TuneDataAIPawn.AngleInDegreesInFrontOfPawnToAllowWinchAssist.GetValue(), CosAngRangeInFrontOfPawnToAllowWinchAssist);
        RangeSqFromPawnToStartWinchAssist = TuneDataAIPawn.RangeFromPawnToStartWinchAssist.GetValue() * TuneDataAIPawn.RangeFromPawnToStartWinchAssist.GetValue();
        // End:0x46E
        if(TuneDataAIPawn.bUsePawnToWinchLauncherDirInsteadOfSocketRotation.GetValue() != float(0))
        {
            bUsePawnToWinchLauncherDirInsteadOfSocketRotation = true;            
        }
        else
        {
            bUsePawnToWinchLauncherDirInsteadOfSocketRotation = false;
        }
        // End:0x4C5
        if(TuneDataAIPawn.bUsePawnsLocationInsteadOfWinchTargetSocketLoc.GetValue() != float(0))
        {
            bUsePawnsLocationInsteadOfWinchTargetSocketLoc = true;            
        }
        else
        {
            bUsePawnsLocationInsteadOfWinchTargetSocketLoc = false;
        }
        DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptions = TuneDataAIPawn.DelayAfterHiveSpawnBeforeAllowedToStartLookingForAttackOptions.GetValue();
        InitTEngBleed();
        bWasInSemiGodWhenStartedAnimatedPath = false;
        // End:0x570
        if(TuneDataAIPawn.bShouldBeInSemiGodWhenOnAnimatedPaths.GetValue() != float(0))
        {
            bShouldBeInSemiGodWhenOnAnimatedPaths = true;            
        }
        else
        {
            bShouldBeInSemiGodWhenOnAnimatedPaths = false;
        }
        MaxSeperationToTriggerReactiveAttack = TuneDataAIPawn.MaxSeperationToTriggerReactiveAttack.GetValue();
        Idx = 0;
        J0x5C5:

        // End:0x7ED [Loop If]
        if(Idx < TuneDataAIPawn.TempPlaceHolderWeakPoint.Length)
        {
            WeakPoint = Class'LPTempPlaceHolderWeakPoint'.static.CreateInstance(self, TuneDataAIPawn.TempPlaceHolderWeakPoint[Idx].NameOfWeakPoint, TuneDataAIPawn.TempPlaceHolderWeakPoint[Idx].SocketName, TuneDataAIPawn.TempPlaceHolderWeakPoint[Idx].Size, TuneDataAIPawn.TempPlaceHolderWeakPoint[Idx].Health, TuneDataAIPawn.TempPlaceHolderWeakPoint[Idx].bCanRegenerate, TuneDataAIPawn.TempPlaceHolderWeakPoint[Idx].RegenerateTime, TuneDataAIPawn.TempPlaceHolderWeakPoint[Idx].StayDeadTime);
            // End:0x7DF
            if(WeakPoint != none)
            {
                TempPlaceHolderWeakPoint.AddItem(WeakPoint);                
            }
            ++Idx;
            // [Loop Continue]
            goto J0x5C5;
        }
    }
    //return;    
}

simulated function InitRangeFireData()
{
    local /*0x97E50000-0x00000000*/ private int iter;

    RangedLobStrikeLastLobCalcArcSuccessId = -1;
    RangedLobStrikeTierForCurrentAttack = -1;
    RangedLobStrikeZoneForCurrentAttack = -1;
    DirectFireStrikeZoneForCurrentAttack = -1;
    RangedLobStrikeZonesAtlArcForCurrentAttack = 1;
    iter = 0;
    J0x52:

    // End:0x141 [Loop If]
    if(iter < TuneDataAIPawn.RangedLobStrikeInfoByTier.Length)
    {
        TuneDataAIPawn.RangedLobStrikeInfoByTier[iter].XY_DistanceSqFromTargetForLobRangedStrikeInUU = TuneDataAIPawn.RangedLobStrikeInfoByTier[iter].XY_DistanceFromTargetForLobRangedStrikeInUU * TuneDataAIPawn.RangedLobStrikeInfoByTier[iter].XY_DistanceFromTargetForLobRangedStrikeInUU;
        ++iter;
        // [Loop Continue]
        goto J0x52;
    }
    iter = 0;
    J0x14C:

    // End:0x23B [Loop If]
    if(iter < TuneDataAIPawn.RangedLobStrikeInfoByZone.Length)
    {
        TuneDataAIPawn.RangedLobStrikeInfoByZone[iter].XY_DistanceSqFromTargetForLobRangedStrikeInUU = TuneDataAIPawn.RangedLobStrikeInfoByZone[iter].XY_DistanceFromTargetForLobRangedStrikeInUU * TuneDataAIPawn.RangedLobStrikeInfoByZone[iter].XY_DistanceFromTargetForLobRangedStrikeInUU;
        ++iter;
        // [Loop Continue]
        goto J0x14C;
    }
    iter = 0;
    J0x246:

    // End:0x335 [Loop If]
    if(iter < TuneDataAIPawn.RangedDirectFireStrikeInfoByTier.Length)
    {
        TuneDataAIPawn.RangedDirectFireStrikeInfoByTier[iter].XY_DistanceSqFromTargetForRangedStrikeInUU = TuneDataAIPawn.RangedDirectFireStrikeInfoByTier[iter].XY_DistanceFromTargetForRangedStrikeInUU * TuneDataAIPawn.RangedDirectFireStrikeInfoByTier[iter].XY_DistanceFromTargetForRangedStrikeInUU;
        ++iter;
        // [Loop Continue]
        goto J0x246;
    }
    iter = 0;
    J0x340:

    // End:0x42F [Loop If]
    if(iter < TuneDataAIPawn.RangedDirectFireStrikeInfoByZone.Length)
    {
        TuneDataAIPawn.RangedDirectFireStrikeInfoByZone[iter].XY_DistanceSqFromTargetForRangedStrikeInUU = TuneDataAIPawn.RangedDirectFireStrikeInfoByZone[iter].XY_DistanceFromTargetForRangedStrikeInUU * TuneDataAIPawn.RangedDirectFireStrikeInfoByZone[iter].XY_DistanceFromTargetForRangedStrikeInUU;
        ++iter;
        // [Loop Continue]
        goto J0x340;
    }
    //return;    
}

final simulated function InitCores()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Core;
    local /*0x97E50000-0x00000000*/ private int ifilter, idotPass;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL newFilterData, newDotPassData;

    // End:0xFCF
    if(TuneDataAIPawn != none)
    {
        I = 0;
        J0x1A:

        // End:0xFC5 [Loop If]
        if(I < TuneDataAIPawn.CoreInfo.Length)
        {
            // End:0xFB7
            if(TuneDataAIPawn.CoreInfo[I].CoreTag != none)
            {
                // End:0xFB7
                if(IsValidCoreTagType(TuneDataAIPawn.CoreInfo[I].CoreTag))
                {
                    Core.PhysMatPropTag = TuneDataAIPawn.CoreInfo[I].CoreTag;
                    Core.CoreID = TuneDataAIPawn.CoreInfo[I].CoreTag.GetCoreId();
                    Core.Health = TuneDataAIPawn.CoreInfo[I].Health.GetValue();
                    Core.MaxHealth = Core.Health;
                    Core.ReciprocalMaxHealth = 1.0000000 / Core.Health;
                    Core.DismembermentInfo = TuneDataAIPawn.CoreInfo[I].DismembermentInfo;
                    // End:0x3E0
                    if(!Class'SPEngine.SPUtil'.static.IsSinglePlayerGame())
                    {
                        // End:0x374
                        if(int(Core.DismembermentInfo.MPOverride) == int(1))
                        {
                            Core.DismembermentInfo.bDoesDismember = true;                            
                        }
                        else
                        {
                            // End:0x3E0
                            if(int(Core.DismembermentInfo.MPOverride) == int(2))
                            {
                                Core.DismembermentInfo.bDoesDismember = false;
                            }
                        }
                    }
                    Core.MPDamagePassthrough = TuneDataAIPawn.CoreInfo[I].MPDamagePassthrough;
                    Core.DOTEffectSocketName = TuneDataAIPawn.CoreInfo[I].DOTEffectSocketName;
                    Core.MaxCoreDamageFactor = TuneDataAIPawn.CoreInfo[I].MaxCoreDamageFactor;
                    Core.DefaultDamagePassThroughFactor = TuneDataAIPawn.CoreInfo[I].DefaultDamagePassThroughFactor;
                    Core.EnableStage = ((TuneDataAIPawn.CoreInfo[I].bEnableAtSpawn) ? 1 : 0);
                    Core.CoreFadeInTime = TuneDataAIPawn.CoreInfo[I].CoreFadeInTime;
                    Core.CoreFadeOutTime = TuneDataAIPawn.CoreInfo[I].CoreFadeOutTime;
                    Core.CoreFadeStartTime = -1.0000000;
                    Core.CoreFadeEndTime = -1.0000000;
                    Core.PhysicalMaterialOvverrideForDisabledCore = TuneDataAIPawn.CoreInfo[I].PhysicalMaterialOvverrideForDisabledCore;
                    Core.PhysicalMaterialOvverrideForDeadCore = TuneDataAIPawn.CoreInfo[I].PhysicalMaterialOvverrideForDeadCore;
                    Core.bCanRegenerate = TuneDataAIPawn.CoreInfo[I].bCanRegenerate;
                    Core.StayDeadTime = TuneDataAIPawn.CoreInfo[I].StayDeadTime.GetValue();
                    Core.PrevHealth = Core.Health;
                    Core.bCanDamageCoreWhileRegenerating = TuneDataAIPawn.CoreInfo[I].bCanDamageCoreWhileRegenerating;
                    Core.PrevEnableStage = Core.EnableStage;
                    // End:0xA17
                    if(TuneDataAIPawn.CoreInfo[I].TimeToRegenrate.GetValue() > float(0))
                    {
                        Core.DefaultRegenerationTime = TuneDataAIPawn.CoreInfo[I].TimeToRegenrate.GetValue();
                        Core.RegenerationRate = Core.MaxHealth / Core.DefaultRegenerationTime;                        
                    }
                    else
                    {
                        Core.DefaultRegenerationTime = 0.0000000;
                        Core.RegenerationRate = -1.0000000;
                    }
                    ifilter = 0;
                    J0xA66:

                    // End:0xBD7 [Loop If]
                    if(ifilter < TuneDataAIPawn.CoreInfo[I].ByDamageTypePassThroughFilter.Length)
                    {
                        newFilterData.DamageType = TuneDataAIPawn.CoreInfo[I].ByDamageTypePassThroughFilter[ifilter].DamageType;
                        newFilterData.DamageFactor = TuneDataAIPawn.CoreInfo[I].ByDamageTypePassThroughFilter[ifilter].DamageFactor;
                        Core.ByDamageTypePassThroughFilter.AddItem(newFilterData);                        
                        ++ifilter;
                        // [Loop Continue]
                        goto J0xA66;
                    }
                    idotPass = 0;
                    J0xBE2:

                    // End:0xF25 [Loop If]
                    if(idotPass < TuneDataAIPawn.CoreInfo[I].CoresToAlsoDamageWhenDOT_List.Length)
                    {
                        newDotPassData.OtherCoreToPassTo = TuneDataAIPawn.CoreInfo[I].CoresToAlsoDamageWhenDOT_List[idotPass].OtherCoreToPassTo.GetCoreId();
                        newDotPassData.PhysicalMaterialForOtherCore = TuneDataAIPawn.CoreInfo[I].CoresToAlsoDamageWhenDOT_List[idotPass].PhysicalMaterialForOtherCore;
                        newDotPassData.IndexOtherCoreToPassTo = -1;
                        newDotPassData.TypeOfDamageAllowedToPass = TuneDataAIPawn.CoreInfo[I].CoresToAlsoDamageWhenDOT_List[idotPass].TypeOfDamageAllowedToPass;
                        newDotPassData.TypeOfDamagePrecursorToLookFor = TuneDataAIPawn.CoreInfo[I].CoresToAlsoDamageWhenDOT_List[idotPass].TypeOfDamagePrecursorToLookFor;
                        newDotPassData.HealthPercentToPassAt = TuneDataAIPawn.CoreInfo[I].CoresToAlsoDamageWhenDOT_List[idotPass].HealthPercentToPassAt.GetValue();
                        newDotPassData.bDamageHasBeenPassed = false;
                        Core.CoresToAlsoDamageWhenDOT_List.AddItem(newDotPassData);                        
                        ++idotPass;
                        // [Loop Continue]
                        goto J0xBE2;
                    }
                    InitGibsCoreCore(Core, I);
                    MyCoreData.AddItem(Core);                    
                    Core.ByDamageTypePassThroughFilter.Length = 0;
                    Core.CoresToAlsoDamageWhenDOT_List.Length = 0;
                    Core.CoreGibStatusList.Length = 0;                    
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x1A;
        }
        InitCoreDamageActionData();
    }
    //return;    
}

simulated function InitGibsCoreCore()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL CoreBuilding[25165825];
    local /*0x97E50000-0x00000000*/ private int IndexForCoreBuilding[8388609], iter, iterInner;
    local /*0x97E50000-0x00000000*/ private editfixedsize array tempGibStatusList;

    iter = 0;
    J0x0B:

    // End:0x24A [Loop If]
    if(iter < TuneDataAIPawn.CoreInfo[IndexForCoreBuilding].Gibs.Length)
    {
        tempGibStatusList = TuneDataAIPawn.CoreInfo[IndexForCoreBuilding].Gibs[iter].GibClass.static.DetermineGibsToSpawn(self, TuneDataAIPawn.CoreInfo[IndexForCoreBuilding].Gibs[iter].GibTemplateOverrideData);
        iterInner = 0;
        J0x137:

        // End:0x23C [Loop If]
        if(iterInner < tempGibStatusList.Length)
        {
            tempGibStatusList[iterInner].bOnlyActivateOnAnimNotify = TuneDataAIPawn.CoreInfo[IndexForCoreBuilding].Gibs[iter].bOnlyActivateOnAnimNotify;
            tempGibStatusList[iterInner].bWaitingOnAnimNotifyToGib = false;
            CoreBuilding.CoreGibStatusList.AddItem(tempGibStatusList[iterInner]);            
            ++iterInner;
            // [Loop Continue]
            goto J0x137;
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated event TickCoreData()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL InCoreData[25165825];
    local /*0x97E50000-0x00000000*/ private int iter;

    // End:0xB8
    if((InCoreData.PrevHealth > float(0)) && InCoreData.Health <= float(0))
    {
        InCoreData.Health = 0.0000000;
        StartCoreRegen(InCoreData.DefaultRegenerationTime, InCoreData.StayDeadTime, InCoreData);
    }
    // End:0x2AB
    if(InCoreData.bIsRegenerating)
    {
        // End:0x1BC
        if(InCoreData.RegenerationStartTime < WorldInfo.TimeSeconds)
        {
            // End:0x177
            if(InCoreData.RegenerationRate <= float(0))
            {
                InCoreData.Health = InCoreData.MaxHealth;                
            }
            else
            {
                InCoreData.Health += (InCoreData.RegenerationRate * DeltaTime);
            }
        }
        // End:0x2AB
        if(InCoreData.Health >= InCoreData.MaxHealth)
        {
            InCoreData.Health = InCoreData.MaxHealth;
            InCoreData.bIsRegenerating = false;
            iter = 0;
            J0x25C:

            // End:0x2AB [Loop If]
            if(iter < MyCoreDamageActionData.Length)
            {
                MyCoreDamageActionData[iter].bActivated = false;
                ++iter;
                // [Loop Continue]
                goto J0x25C;
            }
        }
    }
    InCoreData.PrevHealth = InCoreData.Health;
    // End:0x360
    if(int(InCoreData.EnableStage) != int(InCoreData.PrevEnableStage))
    {
        InCoreData.EnableStageChangeTime = WorldInfo.TimeSeconds;
    }
    InCoreData.PrevEnableStage = InCoreData.EnableStage;
    //return;    
}

function StartCoreRegen()
{
    local /*0x97E50000-0x00000000*/ private float inRegenerateTime[8388609], inStayDeadTime;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL InCoreData[25165825];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];

    false
    // End:0x131
    if(InCoreData.bCanRegenerate || bForced)
    {
        // End:0x6A
        if(inRegenerateTime <= float(0))
        {
            InCoreData.RegenerationRate = 0.0000000;            
        }
        else
        {
            InCoreData.RegenerationRate = (InCoreData.MaxHealth - InCoreData.Health) / inRegenerateTime;
        }
        InCoreData.RegenerationStartTime = WorldInfo.TimeSeconds + inStayDeadTime;
        InCoreData.bIsRegenerating = true;
    }
    //return;    
}

simulated function InitCoreDamageActionData()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL coreDmgAction;

    // End:0x9D9
    if(TuneDataAIPawn != none)
    {
        I = 0;
        J0x1A:

        // End:0x9D9 [Loop If]
        if(I < TuneDataAIPawn.CoreDamageActionInfo.Length)
        {
            // End:0x9CB
            if(TuneDataAIPawn.CoreDamageActionInfo[I].CoreTag != none)
            {
                // End:0x9CB
                if(IsValidCoreTagType(TuneDataAIPawn.CoreDamageActionInfo[I].CoreTag))
                {
                    coreDmgAction.CoreID = TuneDataAIPawn.CoreDamageActionInfo[I].CoreTag.GetCoreId();
                    coreDmgAction.PercentOfHealth = TuneDataAIPawn.CoreDamageActionInfo[I].PercentOfHealth.GetValue();
                    coreDmgAction.bActivated = false;
                    coreDmgAction.bOnlyActivateOnAnimNotify = TuneDataAIPawn.CoreDamageActionInfo[I].bOnlyActivateOnAnimNotify;
                    coreDmgAction.bWaitingOnAnimNotifyToActivate = false;
                    coreDmgAction.BoneToTurnOff = TuneDataAIPawn.CoreDamageActionInfo[I].BoneToTurnOff;
                    coreDmgAction.BoneToTurnOn = TuneDataAIPawn.CoreDamageActionInfo[I].BoneToTurnOn;
                    // End:0x3B8
                    if(TuneDataAIPawn.CoreDamageActionInfo[I].CoreToTurnOnTag != none)
                    {
                        coreDmgAction.CoreToTurnOnId = TuneDataAIPawn.CoreDamageActionInfo[I].CoreToTurnOnTag.GetCoreId();                        
                    }
                    else
                    {
                        coreDmgAction.CoreToTurnOnId = -1;
                    }
                    // End:0x490
                    if(TuneDataAIPawn.CoreDamageActionInfo[I].GrabPointToTurnOnTag != none)
                    {
                        coreDmgAction.GrabPointToTurnOn = TuneDataAIPawn.CoreDamageActionInfo[I].GrabPointToTurnOnTag.GetGrabPointId();                        
                    }
                    else
                    {
                        coreDmgAction.GrabPointToTurnOn = -1;
                    }
                    // End:0x568
                    if(TuneDataAIPawn.CoreDamageActionInfo[I].GrabPointToTurnOffTag != none)
                    {
                        coreDmgAction.GrabPointToTurnOff = TuneDataAIPawn.CoreDamageActionInfo[I].GrabPointToTurnOffTag.GetGrabPointId();                        
                    }
                    else
                    {
                        coreDmgAction.GrabPointToTurnOff = -1;
                    }
                    // End:0x640
                    if(TuneDataAIPawn.CoreDamageActionInfo[I].WinchPointToTurnOnTag != none)
                    {
                        coreDmgAction.WinchPointToTurnOn = TuneDataAIPawn.CoreDamageActionInfo[I].WinchPointToTurnOnTag.GetWinchPointId();                        
                    }
                    else
                    {
                        coreDmgAction.WinchPointToTurnOn = -1;
                    }
                    // End:0x718
                    if(TuneDataAIPawn.CoreDamageActionInfo[I].WinchPointToTurnOffTag != none)
                    {
                        coreDmgAction.WinchPointToTurnOff = TuneDataAIPawn.CoreDamageActionInfo[I].WinchPointToTurnOffTag.GetWinchPointId();                        
                    }
                    else
                    {
                        coreDmgAction.WinchPointToTurnOff = -1;
                    }
                    coreDmgAction.NameOfTempTuneDataFx = TuneDataAIPawn.CoreDamageActionInfo[I].NameOfTempTuneDataFx;
                    coreDmgAction.NameOfLoopingTuneDataFx = TuneDataAIPawn.CoreDamageActionInfo[I].NameOfLoopingTuneDataFx;
                    coreDmgAction.DurationOfLoopingTuneDataFx = TuneDataAIPawn.CoreDamageActionInfo[I].DurationOfLoopingTuneDataFx;
                    coreDmgAction.bDestroyLoopFxOnNextCoreHealthAction = TuneDataAIPawn.CoreDamageActionInfo[I].bDestroyLoopFxOnNextCoreHealthAction;
                    coreDmgAction.NameOfTempTuneDataSfx = TuneDataAIPawn.CoreDamageActionInfo[I].NameOfTempTuneDataSfx;
                    coreDmgAction.NameOfLoopingTuneDataSfx = TuneDataAIPawn.CoreDamageActionInfo[I].NameOfLoopingTuneDataSfx;
                    coreDmgAction.DurationOfLoopingTuneDataSfx = TuneDataAIPawn.CoreDamageActionInfo[I].DurationOfLoopingTuneDataSfx;
                    MyCoreDamageActionData.AddItem(coreDmgAction);                                        
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x1A;
        }
    }
    //return;    
}

simulated function ResetCoreHealthByCoreID()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609], CoreIndex;

    CoreIndex = GetCoreIndexForThisCoreId(CoreID);
    // End:0xCF
    if(CoreIndex >= 0)
    {
        MyCoreData[CoreIndex].Health = TuneDataAIPawn.CoreInfo[CoreIndex].Health.GetValue();
        MyCoreData[CoreIndex].bIsRegenerating = false;
    }
    //return;    
}

simulated function InitAllCoreShields()
{
    //return;    
}

final simulated function InitCoreShield()
{
    local /*0x97E50000-0x00000000*/ private class ShieldClass[8388609];
    local /*0x97E50000-0x00000000*/ private name AttachSocket[8388609], ShieldId;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], CoreShield, ShieldRot, ShieldPos;

    ShieldRot = Rotation;
    ShieldPos = Location;
    // End:0x37
    if(ShieldClass == none)
    {
        return none;
    }
    CoreShield = Spawn(ShieldClass,,, ShieldPos, ShieldRot,, true);
    // End:0xD4
    if(CoreShield != none)
    {
        // End:0xD4
        if(!CoreShield.AttachToPawn(self, AttachSocket, ShieldId))
        {
            CoreShield.Destroy();
            CoreShield = none;
        }
    }
    return CoreShield;
    //return ReturnValue;    
}

final simulated function InitCoreShieldSkeletal()
{
    local /*0x97E50000-0x00000000*/ private class ShieldClass[8388609];
    local /*0x97E50000-0x00000000*/ private name AttachSocket[8388609], ShieldId;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], CoreShield, ShieldRot, ShieldPos;

    ShieldRot = Rotation;
    ShieldPos = Location;
    // End:0x37
    if(ShieldClass == none)
    {
        return none;
    }
    CoreShield = Spawn(ShieldClass,,, ShieldPos, ShieldRot,, true);
    // End:0xD4
    if(CoreShield != none)
    {
        // End:0xD4
        if(!CoreShield.AttachToPawn(self, AttachSocket, ShieldId))
        {
            CoreShield.Destroy();
            CoreShield = none;
        }
    }
    return CoreShield;
    //return ReturnValue;    
}

final simulated function InitShieldFracture()
{
    local /*0x97E50000-0x00000000*/ private class ShieldFractureClass[8388609];
    local /*0x97E50000-0x00000000*/ private name AttachSocket[8388609], ShieldId;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], ShieldFracture, ShieldRot, ShieldPos;

    ShieldRot = Rotation;
    ShieldPos = Location;
    // End:0x37
    if(ShieldFractureClass == none)
    {
        return none;
    }
    ShieldFracture = Spawn(ShieldFractureClass,,, ShieldPos, ShieldRot,, true);
    // End:0xD4
    if(ShieldFracture != none)
    {
        // End:0xD4
        if(!ShieldFracture.AttachToPawn(self, AttachSocket, ShieldId))
        {
            ShieldFracture.Destroy();
            ShieldFracture = none;
        }
    }
    return ShieldFracture;
    //return ReturnValue;    
}

simulated function NotifyShieldFractureAttached()
{
    local /*0x97E50000-0x00000000*/ private @NULL ShieldFracture[8388609];
    local /*0x97E50000-0x00000000*/ private name AttachSocket[8388609], ShieldId;

    //return;    
}

simulated function CanShieldFractureTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL ShieldFracture[8388609];
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DamageCauser[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function PostShieldFractureTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL ShieldFracture[8388609];

    //return;    
}

simulated function ShieldDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL Shield[8388609];

    //return;    
}

simulated function ShieldDestroyedSkeletal()
{
    local /*0x97E50000-0x00000000*/ private @NULL Shield[8388609];

    //return;    
}

simulated function RegisterShieldProtectingCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL Shield[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609], Idx;

    Idx = 0;
    J0x0B:

    // End:0x9B [Loop If]
    if(Idx < MyCoreData.Length)
    {
        // End:0x8D
        if(MyCoreData[Idx].CoreID == CoreID)
        {
            MyCoreData[Idx].CoreShields.AddItem(Shield);            
            // [Explicit Break]
            goto J0x9B;
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x9B:

    SetCollisionOnCoreBodies(false, CoreID);
    //return;    
}

simulated function RegisterShieldSkeletalProtectingCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL Shield[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609], Idx;

    Idx = 0;
    J0x0B:

    // End:0x9B [Loop If]
    if(Idx < MyCoreData.Length)
    {
        // End:0x8D
        if(MyCoreData[Idx].CoreID == CoreID)
        {
            MyCoreData[Idx].CoreShieldsSkeletal.AddItem(Shield);            
            // [Explicit Break]
            goto J0x9B;
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x9B:

    SetCollisionOnCoreBodies(false, CoreID);
    //return;    
}

simulated function UnregisterShieldProtectingCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL Shield[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609], CoreIdx, ShieldIdx;

    CoreIdx = 0;
    J0x0B:

    // End:0x172 [Loop If]
    if(CoreIdx < MyCoreData.Length)
    {
        // End:0x164
        if(MyCoreData[CoreIdx].CoreID == CoreID)
        {
            ShieldIdx = 0;
            J0x62:

            // End:0x161 [Loop If]
            if(ShieldIdx < MyCoreData[CoreIdx].CoreShields.Length)
            {
                // End:0x153
                if(MyCoreData[CoreIdx].CoreShields[ShieldIdx] == Shield)
                {
                    MyCoreData[CoreIdx].CoreShields.Remove(ShieldIdx, 1);                    
                    ShieldIdx--;
                    // End:0x153
                    if(MyCoreData[CoreIdx].CoreShields.Length == 0)
                    {
                        SetCollisionOnCoreBodies(true, CoreID);
                    }
                }
                ShieldIdx++;
                // [Loop Continue]
                goto J0x62;
            }
            // [Explicit Break]
            goto J0x172;
        }
        CoreIdx++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x172:

    //return;    
}

simulated function NotifyShieldAttached()
{
    local /*0x97E50000-0x00000000*/ private @NULL Shield[8388609];
    local /*0x97E50000-0x00000000*/ private name AttachSocket[8388609], ShieldId;

    //return;    
}

simulated function NotifyShieldAttachedSkeletal()
{
    local /*0x97E50000-0x00000000*/ private @NULL Shield[8388609];
    local /*0x97E50000-0x00000000*/ private name AttachSocket[8388609], ShieldId;

    //return;    
}

simulated function UnregisterShieldSkeletalProtectingCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL Shield[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609], CoreIdx, ShieldIdx;

    CoreIdx = 0;
    J0x0B:

    // End:0x172 [Loop If]
    if(CoreIdx < MyCoreData.Length)
    {
        // End:0x164
        if(MyCoreData[CoreIdx].CoreID == CoreID)
        {
            ShieldIdx = 0;
            J0x62:

            // End:0x161 [Loop If]
            if(ShieldIdx < MyCoreData[CoreIdx].CoreShieldsSkeletal.Length)
            {
                // End:0x153
                if(MyCoreData[CoreIdx].CoreShieldsSkeletal[ShieldIdx] == Shield)
                {
                    MyCoreData[CoreIdx].CoreShieldsSkeletal.Remove(ShieldIdx, 1);                    
                    ShieldIdx--;
                    // End:0x153
                    if(MyCoreData[CoreIdx].CoreShieldsSkeletal.Length == 0)
                    {
                        SetCollisionOnCoreBodies(true, CoreID);
                    }
                }
                ShieldIdx++;
                // [Loop Continue]
                goto J0x62;
            }
            // [Explicit Break]
            goto J0x172;
        }
        CoreIdx++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x172:

    //return;    
}

simulated function StartCoreFadeByIndex()
{
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float FactorAtStart[8388609], FactorAtEnd, FadeTime;

    // End:0x10C
    if(CoreIndex >= 0)
    {
        MyCoreData[CoreIndex].CoreFadeStartTime = WorldInfo.TimeSeconds;
        MyCoreData[CoreIndex].CoreFadeEndTime = MyCoreData[CoreIndex].CoreFadeStartTime + FadeTime;
        MyCoreData[CoreIndex].DamageFactorAtFadeStart = FactorAtStart;
        MyCoreData[CoreIndex].DamageFactorAtFadeEnd = FactorAtEnd;
    }
    //return;    
}

simulated function StartCoreFadePostEnableDisable()
{
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bEnabling[8388609];
    local /*0x97E50000-0x00000000*/ private float CurDamageFactor;

    // End:0x161
    if((CoreIndex >= 0) && MyCoreData[CoreIndex].Health > float(0))
    {
        CurDamageFactor = Class'SPEngine.SPUtil'.static.MapFromRangeToNewRange(MyCoreData[CoreIndex].MaxHealth, 0.0000000, 0.1000000, 0.9000000, MyCoreData[CoreIndex].Health);
        // End:0x11A
        if(bEnabling)
        {
            StartCoreFadeByIndex(CoreIndex, 0.0000000, CurDamageFactor, MyCoreData[CoreIndex].CoreFadeInTime);            
        }
        else
        {
            StartCoreFadeByIndex(CoreIndex, CurDamageFactor, 0.0000000, MyCoreData[CoreIndex].CoreFadeOutTime);
        }
    }
    //return;    
}

simulated function StartCoreFadePostDeath()
{
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float CurDamageFactor;

    // End:0x104
    if(CoreIndex >= 0)
    {
        // End:0x39
        if(!IsCoreEnabledByIndex(CoreIndex))
        {
            CurDamageFactor = 0.0000000;            
        }
        else
        {
            CurDamageFactor = Class'SPEngine.SPUtil'.static.MapFromRangeToNewRange(MyCoreData[CoreIndex].MaxHealth, 0.0000000, 0.1000000, 0.9000000, MyCoreData[CoreIndex].Health);
        }
        StartCoreFadeByIndex(CoreIndex, CurDamageFactor, 1.0000000, MyCoreData[CoreIndex].CoreFadeOutTime);
    }
    //return;    
}

simulated function StartAllCoreFadePostDeath()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x70 [Loop If]
    if(I < MyCoreData.Length)
    {
        StartCoreFadePostDeath(I);
        MyCoreData[I].Health = 0.0000000;
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated function GetCoreMaxHealth()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int CoreIndex;

    CoreIndex = GetCoreIndexForThisCoreId(CoreID);
    // End:0x53
    if(CoreIndex >= 0)
    {
        return MyCoreData[CoreIndex].MaxHealth;
    }
    return 0.0000000;
    //return ReturnValue;    
}

simulated function GetCoreNormalizedHealth()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int CoreIndex;

    CoreIndex = GetCoreIndexForThisCoreId(CoreID);
    // End:0x7B
    if(CoreIndex >= 0)
    {
        return MyCoreData[CoreIndex].Health / MyCoreData[CoreIndex].MaxHealth;
    }
    return 0.0000000;
    //return ReturnValue;    
}

simulated function CoreTookDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float prevCoreHealth[8388609];

    // End:0x1C5
    if((CoreIndex >= 0) && prevCoreHealth > float(0))
    {
        // End:0x1C5
        if(MyCoreData[CoreIndex].Health != prevCoreHealth)
        {
            LastCoreDamagedInfo.CoreTag = CoreTag;
            LastCoreDamagedInfo.PrevHealth = prevCoreHealth;
            TriggerEventClass(Class'LPSeqEvent_CoreTookDamage', TakeDamageParams.InstigatedBy);
            TriggerEventClass(Class'LPSeqEvent_CoreHealthDroppedBelowPercentageHealth', TakeDamageParams.InstigatedBy);
            // End:0x1C5
            if(MyCoreData[CoreIndex].Health <= float(0))
            {
                LastCoreDestroyedInfo.CoreTag = CoreTag;
                LastCoreDestroyedInfo.PrevHealth = prevCoreHealth;
                TriggerEventClass(Class'LPSeqEvent_CoreDestroyed', TakeDamageParams.InstigatedBy);
                StartCoreFadePostDeath(CoreIndex);
            }
        }
    }
    //return;    
}

simulated function IsCoreRegenerating()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int CoreIndex;

    CoreIndex = GetCoreIndexForThisCoreId(CoreID);
    // End:0x54
    if(CoreIndex >= 0)
    {
        return MyCoreData[CoreIndex].bIsRegenerating;
    }
    return false;
    //return ReturnValue;    
}

simulated function EnableCoreById()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex;

    CoreIndex = GetCoreIndexForThisCoreId(CoreID);
    // End:0x49
    if(CoreIndex >= 0)
    {
        EnableCoreByIndex(CoreIndex, bEnable);
    }
    //return;    
}

simulated function EnableCoreByIndex()
{
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609], bPrevEnabled;

    // End:0xDD
    if(CoreIndex >= 0)
    {
        bPrevEnabled = int(MyCoreData[CoreIndex].EnableStage) == int(1);
        MyCoreData[CoreIndex].EnableStage = ((bEnable) ? 1 : 0);
        // End:0xDD
        if((bEnable && !bPrevEnabled) || !bEnable && bPrevEnabled)
        {
            StartCoreFadePostEnableDisable(CoreIndex, bEnable);
        }
    }
    //return;    
}

simulated function OnToggleCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];
    local /*0x97E50000-0x00000000*/ private int I, Id;

    // End:0x20E
    if((Action != none) && Action.CoreTag.Length > 0)
    {
        I = 0;
        J0x41:

        // End:0x20E [Loop If]
        if(I < Action.CoreTag.Length)
        {
            // End:0x200
            if(IsValidCoreTagType(Action.CoreTag[I]))
            {
                Id = Action.CoreTag[I].GetCoreId();
                // End:0x139
                if(Action.InputLinks[0].bHasImpulse)
                {
                    EnableCoreById(Id, true);                    
                }
                else
                {
                    // End:0x187
                    if(Action.InputLinks[1].bHasImpulse)
                    {
                        EnableCoreById(Id, false);                        
                    }
                    else
                    {
                        // End:0x200
                        if(Action.InputLinks[2].bHasImpulse)
                        {
                            // End:0x1EC
                            if(IsCoreEnabled(Id))
                            {
                                EnableCoreById(Id, false);                                
                            }
                            else
                            {
                                EnableCoreById(Id, true);
                            }
                        }
                    }
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x41;
        }
    }
    //return;    
}

simulated function SetGettingBirthedStarted()
{
    bGettingBirthed = true;
    //return;    
}

simulated function SetGettingBirthedDone()
{
    bGettingBirthed = false;
    //return;    
}

simulated function GetIfGettingBirthed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bGettingBirthed;
    //return ReturnValue;    
}

function GetDamageAmountAndTypeFromSpline()
{
    local /*0x97E50000-0x00000000*/ private name SplineName[8388609];
    local /*0x97E50000-0x00000000*/ private float DamageAmount[25165825];
    local /*0x97E50000-0x00000000*/ private class TheDamageType[25165825];

    super(SPAIPawn).GetDamageAmountAndTypeFromSpline(SplineName, DamageAmount, TheDamageType);
    DamageAmount = DamageAmount * DifficultlyTuningDamageOutputFactor;
    //return;    
}

simulated event GetAccumulatedMeleeDamageForFullHitReaction()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x30
    if(DamageReactionManagerAI != none)
    {
        return int(DamageReactionManagerAI.AccumulatedMeleeDamageForFullHitReaction);
    }
    return -1;
    //return ReturnValue;    
}

simulated event GetVSMeleeDamageForFullHitReaction()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x6C
    if((TuneDataPawn != none) && TuneDataPawn.VSMeleeDamageForFullHitReaction != none)
    {
        return int(TuneDataPawn.VSMeleeDamageForFullHitReaction.GetValue());
    }
    return -1;
    //return ReturnValue;    
}

function PauseForVsEntryExit()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[9437185];

    false
    // End:0xF7
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        // End:0xF7
        if(bPausedForVsExit != bPause)
        {
            bPausedForVsExit = bPause;
            // End:0xBF
            if(MyLpAiController != none)
            {
                MyLpAiController.Kynapse_ActivateBot(!bPause);
                MyLpAiController.SetTickIsDisabled(bPause);
            }
            SetTickIsDisabled(bPause);
            // End:0xF7
            if(bPause)
            {
                SetTimer(SafetyDelayToUnPauseAiAfterEnteringOrExitingVs, false, 'PauseForVsEntryExit');
            }
        }
    }
    //return;    
}

simulated event GetAccumulatedMeleeDamageForStun()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x30
    if(DamageReactionManagerAI != none)
    {
        return int(DamageReactionManagerAI.AccumulatedMeleeDamageForStun);
    }
    return -1;
    //return ReturnValue;    
}

simulated event GetVSMeleeDamageForStun()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x6C
    if((TuneDataPawn != none) && TuneDataPawn.VSMeleeDamageForStun != none)
    {
        return int(TuneDataPawn.VSMeleeDamageForStun.GetValue());
    }
    return -1;
    //return ReturnValue;    
}

simulated function LaunchedPawnCreateParticleSystem()
{
    local /*0x97E50000-0x00000000*/ private int CellIdx[8388609];

    //return;    
}

simulated function NotifyLaunchedPawnDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL DefenderGoingDown[8388609];

    //return;    
}

function NotifyFormationLocationBecomingInvalid()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocBecomingInvalid[8388609];

    // End:0x37
    if(MyLpAiController != none)
    {
        MyLpAiController.NotifyFormationLocationBecomingInvalid(LocBecomingInvalid);
    }
    //return;    
}

simulated function CanTakeNonCoreDamage()
{
    local /*0x97E50000-0x00000000*/ private class inDamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return inDamageType == Class'LPDamageTypeForced';
    //return ReturnValue;    
}

simulated function GetCoreIdForThisCoreIndex()
{
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609], ReturnValue;

    // End:0x3F
    if(MyCoreData.Length > CoreIndex)
    {
        return MyCoreData[CoreIndex].CoreID;
    }
    return -1;
    //return ReturnValue;    
}

simulated function GetCoreNameForThisCoreId()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return string(CoreID);
    //return ReturnValue;    
}

simulated function GetGrabPointNameForThisGrabPointIndex()
{
    local /*0x97E50000-0x00000000*/ private int PointIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return string(PointIndex);
    //return ReturnValue;    
}

simulated function GetWinchPointNameForThisWinchPointIndex()
{
    local /*0x97E50000-0x00000000*/ private int PointIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return string(PointIndex);
    //return ReturnValue;    
}

simulated function ShouldReportCoreAsDestroyed()
{
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x48
    if(MyCoreData.Length > CoreIndex)
    {
        // End:0x48
        if(MyCoreData[CoreIndex].Health <= float(0))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function OnToggleAI()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    MyLpAiController.OnToggleAI(Action);
    //return;    
}

final simulated function IsBreakableByTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL FSMActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(FSMActor == none)
    {
        return false;
    }
    // End:0x2B
    if(LPShieldFracture(FSMActor) != none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

simulated event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, FSMActor;

    FSMActor = SPFracturedStaticMeshActor(Other);
    // End:0x8F
    if(IsBreakableByTouch(FSMActor) && DoIBreakFracturedMeshOfThisType(FSMActor))
    {
        // End:0x77
        if(NumBrokenFracturedMeshesThisFrame < MaxBrokenFracturedMeshesThisFrame)
        {
            BreakOffFractureMeshActor(FSMActor);            
        }
        else
        {
            DefferedActorsToBreakOff.AddItem(FSMActor);            
        }
        return;
    }
    super.Touch(Other, OtherComp, HitLocation, HitNormal);
    // End:0x10F
    if(Controller != none)
    {
        Controller.Touch(Other, OtherComp, HitLocation, HitNormal);
    }
    //return;    
}

simulated event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal, FSMActor;

    FSMActor = SPFracturedStaticMeshActor(Other);
    // End:0x8D
    if(IsBreakableByTouch(FSMActor) && DoIBreakFracturedMeshOfThisType(FSMActor))
    {
        // End:0x77
        if(NumBrokenFracturedMeshesThisFrame < MaxBrokenFracturedMeshesThisFrame)
        {
            BreakOffFractureMeshActor(FSMActor);            
        }
        else
        {
            DefferedActorsToBreakOff.AddItem(FSMActor);            
        }
    }
    super.Bump(Other, OtherComp, HitNormal);
    // End:0xFB
    if(Controller != none)
    {
        Controller.Bump(Other, OtherComp, HitNormal);
    }
    //return;    
}

simulated event Landed()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], FloorActor;

    super(Pawn).Landed(HitNormal, FloorActor);
    // End:0x5C
    if(IsDoingSpecialMove_OF_Class(Class'LPSM_WinchEscapeBase'))
    {
        BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_AIPawnLanded);
    }
    //return;    
}

event HandleAnimNotifyMeleeStrikeBegin()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array GroupClass[8388609];
    local /*0x97E50000-0x00000000*/ private byte MomentumHint[8388609];

    super(SPAIPawn).HandleAnimNotifyMeleeStrikeBegin(GroupClass, MomentumHint);
    //return;    
}

event HandleAnimNotifyMeleeStrikeEnd()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array GroupClass[8388609];

    super(SPAIPawn).HandleAnimNotifyMeleeStrikeEnd(GroupClass);
    //return;    
}

simulated event NotifyStopPawnChoreography()
{
    super(SPPawn).NotifyStopPawnChoreography();
    // End:0x38
    if(MyLpAiController != none)
    {
        MyLpAiController.NotifyStopPawnChoreography();
    }
    //return;    
}

event HandleNotifyPlayerDodgeWindow()
{
    local /*0x97E50000-0x00000000*/ private byte AttackType[8388609], DodgePhase;
    local /*0x97E50000-0x00000000*/ private @NULL InEnemyToNotify[8388609], LPPC, enemyToNotify;

    // End:0x25
    if(InEnemyToNotify != none)
    {
        enemyToNotify = InEnemyToNotify;        
    }
    else
    {
        // End:0x5D
        if(MyLpAiController != none)
        {
            enemyToNotify = MyLpAiController.GetEnemy();
        }
    }
    // End:0xAA
    if((int(DodgePhase) != int(0)) && CurrentDodgeWindowPlayer != none)
    {
        enemyToNotify = CurrentDodgeWindowPlayer.Pawn;
    }
    // End:0x1B9
    if(enemyToNotify != none)
    {
        LPPC = LPPlayerController(Pawn(enemyToNotify).Controller);
        // End:0x1B9
        if(LPPC != none)
        {
            // End:0x157
            if(int(DodgePhase) == int(0))
            {
                CurrentDodgeWindowPlayer = LPPC;
                LPPC.NotifyDodgeWindow(int(AttackType), self);                
            }
            else
            {
                LPPC.ClientNotifyClearDodgeWindow(int(AttackType), self);
                CurrentDodgeWindowPlayer = none;
            }
            // End:0x1B9
            if(LPPC.IsRolling())
            {
                NotifyStopPawnChoreography();
            }
        }
    }
    //return;    
}

event NotifyAllPlayerDodgeWindowsClosed()
{
    //return;    
}

event HandleNotifyPlayerActiveDefenseWindow()
{
    local /*0x97E50000-0x00000000*/ private bool bWindowOpen[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> OnActiveDefense[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPP, enemyToNotify;

    // End:0x12
    if(MyLpAiController == none)
    {
        return;
    }
    enemyToNotify = MyLpAiController.GetEnemy();
    // End:0x4C
    if(enemyToNotify == none)
    {
        return;
    }
    LPP = LPPawn(enemyToNotify);
    // End:0x79
    if(LPP == none)
    {
        return;
    }
    // End:0xB1
    if(bWindowOpen)
    {
        LPP.SetActiveDefenseCallback(OnActiveDefense);        
    }
    else
    {
        LPP.ClearActiveDefenseCallback();
    }
    //return;    
}

event HandleAnimNotifyDamageSmartActor()
{
    // End:0x2E
    if(MyLpAiController != none)
    {
        MyLpAiController.HandleAnimNotifyDamageSmartActor();
    }
    //return;    
}

event HandleAnimNotifyDamageSmartActorRanged()
{
    // End:0x2E
    if(MyLpAiController != none)
    {
        MyLpAiController.HandleAnimNotifyDamageSmartActorRanged();
    }
    //return;    
}

simulated function ShouldPlayRetractAnimWhenGrabbed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return TuneDataAIPawn.bShouldPlayRetractAnimWhenGrabbed;
    //return ReturnValue;    
}

simulated function NotifyJustGotGrabbed()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnGrabbingMe[8388609];

    //return;    
}

simulated function NotifyGrabInterationJustStarted()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnGrabbingMe[8388609];
    local /*0x97E50000-0x00000000*/ private int PointIndexGrab[8388609];

    //return;    
}

simulated function DoVSCrushTossAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL TossPawn[8388609], TossVelocity;

    vect(0.0000000, 0.0000000, -100.0000000)
    //return;    
}

simulated function DoVSReleaseAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReleaseVelocity[9437185];

    vect(0.0000000, 0.0000000, -100.0000000)
    //return;    
}

simulated function EnableLineSweepHitTester()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];
    local /*0x97E50000-0x00000000*/ private byte CollisionCheckType[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL HitTarget[9437185];

    0    
    // End:0x5E
    if((bEnable && Controller != none) && HitTarget == none)
    {
        HitTarget = MyLpAiController.MyLPEnemy;
    }
    super(SPAIPawn).EnableLineSweepHitTester(bEnable, CollisionCheckType, HitTarget);
    //return;    
}

function LineSweepHitTesterHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    super(SPAIPawn).LineSweepHitTesterHitSomethingNew(Info);
    // End:0x4A
    if(MyLpAiController != none)
    {
        MyLpAiController.MeleeHitSomethingNew(Info);
    }
    //return;    
}

event ImpactCombatTargetHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private name ImpactSocketName[8388609];
    local /*0x97E50000-0x00000000*/ private float ImpactRadius[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageTypeToApplied[8388609];

    super.ImpactCombatTargetHitSomethingNew(HitActor, ImpactLocation, ImpactSocketName, ImpactRadius, DamageTypeToApplied);
    // End:0x92
    if(MyLpAiController != none)
    {
        MyLpAiController.ImpactCombatTargetHitSomethingNew(HitActor, ImpactLocation, ImpactSocketName, ImpactRadius, DamageTypeToApplied);
    }
    //return;    
}

function NotifyTraceDamagePartHitSomething()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private int AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageTypeToApplied[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609];

    super.NotifyTraceDamagePartHitSomething(HitActor, ImpactLocation, AmountOfDamage, DamageTypeToApplied, HitInfo);
    // End:0x92
    if(MyLpAiController != none)
    {
        MyLpAiController.NotifyTraceDamagePartHitSomething(HitActor, ImpactLocation, AmountOfDamage, DamageTypeToApplied, HitInfo);
    }
    //return;    
}

event NotifyThatSpecialDodgeActorDodged()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];
    local /*0x97E50000-0x00000000*/ private class DodgePerforming[8388609];

    super.NotifyThatSpecialDodgeActorDodged(Dodger, DodgePerforming);
    // End:0x5C
    if(MyLpAiController != none)
    {
        MyLpAiController.NotifyThatSpecialDodgeActorDodged(Dodger, DodgePerforming);
    }
    //return;    
}

event NotifyThatSpecialDodgeReady()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];

    // End:0x37
    if(MyLpAiController != none)
    {
        MyLpAiController.NotifyThatSpecialDodgeReady(Dodger);
    }
    //return;    
}

function FindCurrentDirectFireFromGivenLocationZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocationToLobFrom[25296897], TargetOfLob;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float rangeToTarget;
    local /*0x97E50000-0x00000000*/ private int iter;

    // End:0xDD
    if(TargetOfLob != none)
    {
        rangeToTarget = VSize(TargetOfLob.Location - LocationToLobFrom);
        iter = 0;
        J0x4F:

        // End:0xDD [Loop If]
        if(iter < TuneDataAIPawn.RangedDirectFireStrikeInfoByZone.Length)
        {
            // End:0xCF
            if(rangeToTarget < TuneDataAIPawn.RangedDirectFireStrikeInfoByZone[iter].XY_DistanceFromTargetForRangedStrikeInUU)
            {
                return iter;
            }
            ++iter;
            // [Loop Continue]
            goto J0x4F;
        }
    }
    return -1;
    //return ReturnValue;    
}

function ShouldZeroOutDamageOnDisabledCore()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function IgnoreNonCorePassThroughFactor()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function AdjustDamage()
{
    local /*0x97E50000-0x00000000*/ private int InDamage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[25165825], InstigatedBy, HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser, PhysMat, TagCoreId;
    local /*0x97E50000-0x00000000*/ private float damagePercentageForNonCoreHit;
    local /*0x97E50000-0x00000000*/ private bool bcheckForNonCoreDamageFilter;

    super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    bcheckForNonCoreDamageFilter = true;
    PhysMat = LPPhysicalMaterial(HitInfo.PhysMaterial);
    // End:0x131
    if(PhysMat != none)
    {
        TagCoreId = LPPhysMatPropTag_CoreId(PhysMat.GetTag(Class'LPPhysMatPropTag_CoreId'));
        // End:0x131
        if(TagCoreId != none)
        {
            bcheckForNonCoreDamageFilter = false;
            // End:0x131
            if(!IsCoreEnabled(TagCoreId.GetCoreId()) && ShouldZeroOutDamageOnDisabledCore())
            {
                InDamage = 0;
            }
        }
    }
    // End:0x18E
    if(bcheckForNonCoreDamageFilter && !IgnoreNonCorePassThroughFactor())
    {
        damagePercentageForNonCoreHit = GetNonCorePassThroughFactor(DamageType);
        InDamage = int(float(InDamage) * damagePercentageForNonCoreHit);
    }
    // End:0x1D5
    if(bInvulnerableWhenFleeing)
    {
        // End:0x1D5
        if(MyLpAiController.LPFindFirstAICommandOfClassInStack(Class'LPAICmd_GotoFleePoint') != none)
        {
            InDamage = 0;
        }
    }
    //return;    
}

final simulated event CanDamageThisPhysicalMaterial()
{
    local /*0x97E50000-0x00000000*/ private @NULL InPhysMat[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPhysMat, TagCoreId;
    local /*0x97E50000-0x00000000*/ private float damagePercentageForNonCoreHit;
    local /*0x97E50000-0x00000000*/ private bool bcheckForNonCoreDamageFilter;
    local /*0x97E50000-0x00000000*/ private int CoreID;

    bcheckForNonCoreDamageFilter = true;
    LPPhysMat = LPPhysicalMaterial(InPhysMat);
    // End:0xEE
    if(LPPhysMat != none)
    {
        TagCoreId = LPPhysMatPropTag_CoreId(LPPhysMat.GetTag(Class'LPPhysMatPropTag_CoreId'));
        // End:0xEE
        if(TagCoreId != none)
        {
            CoreID = TagCoreId.GetCoreId();
            bcheckForNonCoreDamageFilter = false;
            // End:0xEE
            if((GetCoreHealth(CoreID) <= float(0)) || !IsCoreEnabled(CoreID))
            {
                return false;
            }
        }
    }
    // End:0x142
    if(bcheckForNonCoreDamageFilter)
    {
        // End:0x140
        if(CanTakeNonCoreDamage(DamageType))
        {
            damagePercentageForNonCoreHit = GetNonCorePassThroughFactor(DamageType);
            return damagePercentageForNonCoreHit > float(0);            
        }
        else
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

function AllowedToProcessTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag;

    // End:0xDC
    if(DamageReactionManagerAI != none)
    {
        CoreTag = DamageReactionManagerAI.hitCoreTag;
        // End:0xDC
        if((CoreTag != none) && (IsCoreProtectedByShield(CoreTag.GetCoreId())) || IsDamageFilteredForCore(CoreTag.GetCoreId(), TakeDamageParams.DamageType, TakeDamageParams.DamageCauser))
        {
            return false;
        }
    }
    return super.AllowedToProcessTakeDamage();
    //return ReturnValue;    
}

function CanDamageCoreID()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bCoreProtectedByShield, bDamageFilteredForCore;
    local /*0x97E50000-0x00000000*/ private int CoreIndex;

    // End:0x1A
    if(!IsCoreEnabled(CoreID))
    {
        return false;
    }
    CoreIndex = GetCoreIndexForThisCoreId(CoreID);
    // End:0x91
    if(MyCoreData[CoreIndex].bIsRegenerating && !MyCoreData[CoreIndex].bCanDamageCoreWhileRegenerating)
    {
        return false;
    }
    bCoreProtectedByShield = IsCoreProtectedByShield(CoreID);
    bDamageFilteredForCore = IsDamageFilteredForCore(CoreID, DamageType, DamageCauser);
    return !bCoreProtectedByShield && !bDamageFilteredForCore;
    //return ReturnValue;    
}

function IsCoreProtectedByShield()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int CoreIdx;

    CoreIdx = 0;
    J0x0B:

    // End:0x97 [Loop If]
    if(CoreIdx < MyCoreData.Length)
    {
        // End:0x89
        if(MyCoreData[CoreIdx].CoreID == CoreID)
        {
            // End:0x86
            if(MyCoreData[CoreIdx].CoreShields.Length > 0)
            {
                return true;
            }
            // [Explicit Break]
            goto J0x97;
        }
        CoreIdx++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x97:

    return false;
    //return ReturnValue;    
}

function IsDamageFilteredForCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int CoreIdx;
    local /*0x97E50000-0x00000000*/ private bool bFoundFilter, bPassedFilter;

    CoreIdx = 0;
    J0x0B:

    // End:0xC7 [Loop If]
    if(CoreIdx < MyCoreData.Length)
    {
        // End:0xB9
        if(MyCoreData[CoreIdx].DamageFilter.DamageCauser == DamageCauser)
        {
            bFoundFilter = true;
            // End:0xB9
            if(MyCoreData[CoreIdx].CoreID == CoreID)
            {
                bPassedFilter = true;
                // [Explicit Break]
                goto J0xC7;
            }
        }
        CoreIdx++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0xC7:

    return bFoundFilter && !bPassedFilter;
    //return ReturnValue;    
}

function NotifyCoreShieldDamaged()
{
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitShield[8388609];

    //return;    
}

simulated event CoreDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool hide[9437185], bHandled;

    false
    SetGrabPointEnabledByCoreID(CoreTag.GetCoreId(), false);
    // End:0x1EB
    if(MyCoreData[CoreIndex].DismembermentInfo.bDoesDismember && !MyCoreData[CoreIndex].DismembermentInfo.bIsDismembered)
    {
        bHandled = BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_HandleDismemberment, self, CoreTag.GetCoreId());
        // End:0x15C
        if(!bHandled && MyLpAiController != none)
        {
            bHandled = MyLpAiController.HandleDismemberment(CoreTag, CoreIndex);
        }
        // End:0x1E8
        if(!bHandled)
        {
            DismemberPart(MyCoreData[CoreIndex].DismembermentInfo.BoneName);
            BlendMaxCoreDamageFactorByCoreIndex(CoreIndex, 1.0000000, TuneDataAIPawn.CoreFadeTime);
        }        
    }
    else
    {
        BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_HandleCoreDestroyed, self, CoreTag.GetCoreId());
    }
    // End:0x273
    if(MyLpAiController != none)
    {
        MyLpAiController.CoreDestroyed(CoreTag, CoreIndex);
    }
    //return;    
}

simulated function FindBoneNameFromCoreID()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PhysMat[26214401];
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL Body, TagCoreId;

    Idx = 0;
    J0x0C:

    // End:0x1BF [Loop If]
    if(Idx < Mesh.PhysicsAssetInstance.Bodies.Length)
    {
        Body = Mesh.PhysicsAssetInstance.Bodies[Idx];
        // End:0x1B1
        if(Body != none)
        {
            PhysMat = LPPhysicalMaterial(Body.GetPhysicalMaterial());
            // End:0x1B1
            if(PhysMat != none)
            {
                TagCoreId = LPPhysMatPropTag_CoreId(PhysMat.GetTag(Class'LPPhysMatPropTag_CoreId'));
                // End:0x1B1
                if((TagCoreId != none) && TagCoreId.GetCoreId() == CoreID)
                {
                    return Mesh.PhysicsAsset.BodySetup[Idx].BoneName;
                }
            }
        }
        Idx++;
        // [Loop Continue]
        goto J0x0C;
    }
    return 'NAME_None';
    //return ReturnValue;    
}

event HandleAnimNotifyFinishDestroyingCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTagForDestroyOnAnimNotify[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForceDestroyCore[8388609];

    // End:0x41
    if(DamageReactionManagerAI != none)
    {
        DamageReactionManagerAI.HandleAnimNotifyFinishDestroyingCore(CoreTagForDestroyOnAnimNotify, bForceDestroyCore);
    }
    //return;    
}

function TurnOnCoreFlagsForDestroyOnAnimNotify()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTagForFlagForDestroyOnAnimNotify[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFlagCoreGibForDestroyOnAnimNotify[8388609], bFlagCoreDamageActionForDestroyOnAnimNotify, ReturnValue;
    local /*0x97E50000-0x00000000*/ private int coreIter, gibIter, CoreID;
    local /*0x97E50000-0x00000000*/ private bool bflagsSetAsNeeded;

    // End:0x11
    if(CoreTagForFlagForDestroyOnAnimNotify == none)
    {
        return false;
    }
    CoreID = CoreTagForFlagForDestroyOnAnimNotify.GetCoreId();
    // End:0x15B
    if(bFlagCoreGibForDestroyOnAnimNotify)
    {
        bflagsSetAsNeeded = false;
        coreIter = 0;
        J0x5E:

        // End:0x15B [Loop If]
        if(coreIter < MyCoreData.Length)
        {
            // End:0x14D
            if(MyCoreData[coreIter].CoreID == CoreID)
            {
                gibIter = 0;
                J0xB5:

                // End:0x14A [Loop If]
                if(gibIter < MyCoreData[coreIter].CoreGibStatusList.Length)
                {
                    MyCoreData[coreIter].CoreGibStatusList[gibIter].bOnlyActivateOnAnimNotify = true;
                    bflagsSetAsNeeded = true;
                    gibIter++;
                    // [Loop Continue]
                    goto J0xB5;
                }
                // [Explicit Break]
                goto J0x15B;
            }
            coreIter++;
            // [Loop Continue]
            goto J0x5E;
        }
    }
    J0x15B:

    // End:0x23E
    if(bFlagCoreDamageActionForDestroyOnAnimNotify)
    {
        bflagsSetAsNeeded = false;
        coreIter = 0;
        J0x17F:

        // End:0x23E [Loop If]
        if(coreIter < MyCoreDamageActionData.Length)
        {
            // End:0x230
            if(MyCoreDamageActionData[coreIter].CoreID == CoreID)
            {
                // End:0x230
                if(MyCoreDamageActionData[coreIter].PercentOfHealth < 0.0100000)
                {
                    MyCoreDamageActionData[coreIter].bOnlyActivateOnAnimNotify = true;
                    bflagsSetAsNeeded = true;
                }
            }
            coreIter++;
            // [Loop Continue]
            goto J0x17F;
        }
    }
    return bflagsSetAsNeeded;
    //return ReturnValue;    
}

function TurnOffCoreFlagsForDestroyOnAnimNotify()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTagForFlagForDestroyOnAnimNotify[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFlagCoreGibForDestroyOnAnimNotify[8388609], bFlagCoreDamageActionForDestroyOnAnimNotify, ReturnValue;
    local /*0x97E50000-0x00000000*/ private int coreIter, gibIter, CoreID;
    local /*0x97E50000-0x00000000*/ private bool bflagsSetAsNeeded;

    // End:0x11
    if(CoreTagForFlagForDestroyOnAnimNotify == none)
    {
        return false;
    }
    CoreID = CoreTagForFlagForDestroyOnAnimNotify.GetCoreId();
    // End:0x15B
    if(bFlagCoreGibForDestroyOnAnimNotify)
    {
        bflagsSetAsNeeded = false;
        coreIter = 0;
        J0x5E:

        // End:0x15B [Loop If]
        if(coreIter < MyCoreData.Length)
        {
            // End:0x14D
            if(MyCoreData[coreIter].CoreID == CoreID)
            {
                gibIter = 0;
                J0xB5:

                // End:0x14A [Loop If]
                if(gibIter < MyCoreData[coreIter].CoreGibStatusList.Length)
                {
                    MyCoreData[coreIter].CoreGibStatusList[gibIter].bOnlyActivateOnAnimNotify = false;
                    bflagsSetAsNeeded = true;
                    gibIter++;
                    // [Loop Continue]
                    goto J0xB5;
                }
                // [Explicit Break]
                goto J0x15B;
            }
            coreIter++;
            // [Loop Continue]
            goto J0x5E;
        }
    }
    J0x15B:

    // End:0x20E
    if(bFlagCoreDamageActionForDestroyOnAnimNotify)
    {
        bflagsSetAsNeeded = false;
        coreIter = 0;
        J0x17F:

        // End:0x20E [Loop If]
        if(coreIter < MyCoreDamageActionData.Length)
        {
            // End:0x200
            if(MyCoreDamageActionData[coreIter].CoreID == CoreID)
            {
                MyCoreDamageActionData[coreIter].bOnlyActivateOnAnimNotify = false;
                bflagsSetAsNeeded = true;
            }
            coreIter++;
            // [Loop Continue]
            goto J0x17F;
        }
    }
    return bflagsSetAsNeeded;
    //return ReturnValue;    
}

simulated event DismemberPart()
{
    local /*0x97E50000-0x00000000*/ private name BoneName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Impulse[9437185], HitLocation;
    local /*0x97E50000-0x00000000*/ private bool bVelChange[9437185];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0E:

    // End:0xF6 [Loop If]
    if(I < MyCoreData.Length)
    {
        // End:0xE8
        if(MyCoreData[I].DismembermentInfo.bDoesDismember && MyCoreData[I].DismembermentInfo.BoneName == BoneName)
        {
            MyCoreData[I].DismembermentInfo.bIsDismembered = true;
        }
        ++I;
        // [Loop Continue]
        goto J0x0E;
    }
    super(SPPawn).DismemberPart(BoneName, Impulse, HitLocation, bVelChange);
    //return;    
}

event AnimDismemberPart()
{
    local /*0x97E50000-0x00000000*/ private @NULL NotifyDismember[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreID, CoreIndex;
    local /*0x97E50000-0x00000000*/ private @NULL Src, Dest, partvelocity;

    CoreID = NotifyDismember.CoreToDismember.GetCoreId();
    CoreIndex = GetCoreIndexForThisCoreId(CoreID);
    // End:0x359
    if(MyCoreData[CoreIndex].DismembermentInfo.bDoesDismember && !MyCoreData[CoreIndex].DismembermentInfo.bIsDismembered)
    {
        // End:0x203
        if((NotifyDismember.MomentumSourceBone != 'None') && NotifyDismember.MomentumTargetBone != 'None')
        {
            Src = Mesh.GetBoneLocation(NotifyDismember.MomentumSourceBone);
            Dest = Mesh.GetBoneLocation(NotifyDismember.MomentumTargetBone);
            partvelocity = Normal(Dest - Src) * NotifyDismember.MomentumStrength;
        }
        // End:0x277
        if(NotifyDismember.EventName != 'None')
        {
            TuneDataPawnFXEventBindings.PlayEventFX(NotifyDismember.EventName, self, Mesh, none);
        }
        // End:0x2ED
        if(NotifyDismember.SoundName != 'None')
        {
            TuneDataPawnSoundEventBindings.PlayEventSoundLocally(NotifyDismember.SoundName, 'None', self, none, none);
        }
        DismemberPart(MyCoreData[CoreIndex].DismembermentInfo.BoneName, partvelocity,, true);
        BlendMaxCoreDamageFactorByCoreID(CoreID, 1.0000000, -1.0000000);
    }
    // End:0x3ED
    if(NotifyDismember.bDestroyCore)
    {
        StartCoreFadePostEnableDisable(CoreIndex, true);
        MyCoreData[CoreIndex].Health = 0.0000000;
        CoreDestroyed(NotifyDismember.CoreToDismember, CoreIndex);
    }
    //return;    
}

final simulated event BlendMaxCoreDamageFactorByCoreID()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private float NewValue[8388609], BlendTime;
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];

    false
    BlendMaxCoreDamageFactorByCoreIndex(GetCoreIndexForThisCoreId(CoreID), NewValue, BlendTime, bForced);
    //return;    
}

final simulated event BlendMaxCoreDamageFactorByCoreIndex()
{
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float NewValue[8388609], BlendTime;
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];

    false
    // End:0x131
    if(CoreIndex >= 0)
    {
        // End:0x131
        if(bForced || MyCoreData[CoreIndex].MaxCoreDamageFactorBlendTimeLeft <= 0.0000000)
        {
            // End:0x8E
            if(BlendTime < 0.0000000)
            {
                BlendTime = TuneDataAIPawn.CoreFadeTime;
            }
            MyCoreData[CoreIndex].MaxCoreDamageFactorBlendTarget = NewValue;
            MyCoreData[CoreIndex].MaxCoreDamageFactorBlendTimeLeft = BlendTime;
            // End:0x131
            if(BlendTime <= 0.0000000)
            {
                MyCoreData[CoreIndex].MaxCoreDamageFactor = NewValue;
            }
        }
    }
    //return;    
}

final simulated event BlendAllMaxCoreDamageFactors()
{
    local /*0x97E50000-0x00000000*/ private float NewValue[8388609], BlendTime;
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];
    local /*0x97E50000-0x00000000*/ private int CoreIdx;

    false
    CoreIdx = 0;
    J0x10:

    // End:0x65 [Loop If]
    if(CoreIdx < MyCoreData.Length)
    {
        BlendMaxCoreDamageFactorByCoreIndex(CoreIdx, NewValue, BlendTime, bForced);
        CoreIdx++;
        // [Loop Continue]
        goto J0x10;
    }
    //return;    
}

final function RemoveCoreDamageFilter()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIdx;

    CoreIdx = 0;
    J0x0B:

    // End:0x135 [Loop If]
    if(CoreIdx < MyCoreData.Length)
    {
        // End:0x127
        if(MyCoreData[CoreIdx].CoreID == CoreID)
        {
            // End:0x124
            if(MyCoreData[CoreIdx].DamageFilter.DamageCauser == DamageCauser)
            {
                MyCoreData[CoreIdx].DamageFilter.DamageCauser = none;
                MyCoreData[CoreIdx].DamageFilter.DamageFilterCB = None;
            }
            // [Explicit Break]
            goto J0x135;
        }
        CoreIdx++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x135:

    //return;    
}

function ReplicateTakeDamageEffects()
{
    super.ReplicateTakeDamageEffects();
    // End:0x38
    if(DamageReactionManagerAI != none)
    {
        DamageReactionManagerAI.DetermineDamageReaction();
    }
    //return;    
}

simulated function PlayHitReactionAnimation()
{
    super(SPPawn).PlayHitReactionAnimation();
    // End:0x38
    if(DamageReactionManagerAI != none)
    {
        DamageReactionManagerAI.ExecuteDamageReaction();
    }
    //return;    
}

function InitDamageTracking()
{
    local /*0x97E50000-0x00000000*/ private int DamageTrackingEntries;

    DamageTrackingEntries = int(TuneDataAIPawn.BaseDamageTrackingWindowInSeconds.GetValue() * float(10));
    // End:0x9E
    if(DamageTrackingEntries > 0)
    {
        DamageTracking.DamageEntry.Add(DamageTrackingEntries);        
        DamageTracking.LastEntry = -1;
    }
    //return;    
}

function ResetDamageTracker()
{
    DamageTracking.LastEntry = -1;
    //return;    
}

function AddToDamageTracking()
{
    local /*0x97E50000-0x00000000*/ private float DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private bool bCore[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreID[9437185], Idx;

    -1
    // End:0x23E
    if(DamageTracking.DamageEntry.Length > 0)
    {
        ++DamageTracking.LastEntry;
        // End:0xA6
        if(DamageTracking.LastEntry >= DamageTracking.DamageEntry.Length)
        {
            DamageTracking.LastEntry = 0;
        }
        Idx = DamageTracking.LastEntry;
        DamageTracking.DamageEntry[Idx].Time = WorldInfo.TimeSeconds;
        DamageTracking.DamageEntry[Idx].Damage = DamageAmount;
        DamageTracking.DamageEntry[Idx].bCore = bCore;
        DamageTracking.DamageEntry[Idx].CoreID = CoreID;
        // End:0x23E
        if(CoreID > -1)
        {
            DamageTracking.DamageEntry[Idx].bCore = true;
        }
    }
    //return;    
}

function GetDamageFromDamageTracker()
{
    local /*0x97E50000-0x00000000*/ private float TimePeriod[8388609];
    local /*0x97E50000-0x00000000*/ private bool bCore[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], DamageAmount, StartTime;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x4D
    if((DamageTracking.DamageEntry.Length < 1) || DamageTracking.LastEntry < 0)
    {
        return 0.0000000;
    }
    StartTime = WorldInfo.TimeSeconds - TimePeriod;
    // End:0xA0
    if(StartTime < float(0))
    {
        StartTime = 0.0000000;
    }
    DamageAmount = 0.0000000;
    I = 0;
    J0xBA:

    // End:0x20A [Loop If]
    if(I < DamageTracking.DamageEntry.Length)
    {
        // End:0x1FC
        if((DamageTracking.DamageEntry[I].Time > float(0)) && DamageTracking.DamageEntry[I].Time >= StartTime)
        {
            // End:0x1FC
            if(bCore == DamageTracking.DamageEntry[I].bCore)
            {
                DamageAmount += DamageTracking.DamageEntry[I].Damage;
            }
        }
        ++I;
        // [Loop Continue]
        goto J0xBA;
    }
    return DamageAmount;
    //return ReturnValue;    
}

function GetDamageFromDamageTrackerForCore()
{
    local /*0x97E50000-0x00000000*/ private float TimePeriod[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], DamageAmount, StartTime;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x5E
    if(((DamageTracking.DamageEntry.Length < 1) || DamageTracking.LastEntry < 0) || CoreID < 0)
    {
        return 0.0000000;
    }
    StartTime = WorldInfo.TimeSeconds - TimePeriod;
    // End:0xB1
    if(StartTime < float(0))
    {
        StartTime = 0.0000000;
    }
    DamageAmount = 0.0000000;
    I = 0;
    J0xCB:

    // End:0x258 [Loop If]
    if(I < DamageTracking.DamageEntry.Length)
    {
        // End:0x24A
        if((DamageTracking.DamageEntry[I].Time > float(0)) && DamageTracking.DamageEntry[I].Time >= StartTime)
        {
            // End:0x24A
            if(DamageTracking.DamageEntry[I].bCore && DamageTracking.DamageEntry[I].CoreID == CoreID)
            {
                DamageAmount += DamageTracking.DamageEntry[I].Damage;
            }
        }
        ++I;
        // [Loop Continue]
        goto J0xCB;
    }
    return DamageAmount;
    //return ReturnValue;    
}

simulated function DrawGrenadeAssistZone()
{
    //return;    
}

simulated function DrawWinchAssistZone()
{
    //return;    
}

simulated function GetWinchAssistTargetLocationAndRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL OutLocation[25165825], OutRotation, SourceLocation;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private bool bFoundPoint;

    // End:0x128
    if(!bUsePawnsLocationInsteadOfWinchTargetSocketLoc || !bUsePawnToWinchLauncherDirInsteadOfSocketRotation)
    {
        Idx = 0;
        J0x2C:

        // End:0x9C [Loop If]
        if(Idx < WinchPoints.Length)
        {
            // End:0x8E
            if(IsWinchPointEnabled(Idx))
            {
                GetWinchPointCollisionLocationAndRotation(Idx, OutLocation, OutRotation);
                bFoundPoint = true;
                // [Explicit Break]
                goto J0x9C;
            }
            Idx++;
            // [Loop Continue]
            goto J0x2C;
        }
        J0x9C:

        // End:0x128
        if(!bFoundPoint && Class'SPEngine.SPUtil'.static.DoesSocketExist(Mesh, 'WinchAssistTarget'))
        {
            Mesh.GetSocketWorldLocationAndRotation('WinchAssistTarget', OutLocation, OutRotation);
            bFoundPoint = true;
        }
    }
    // End:0x159
    if(!bFoundPoint || bUsePawnsLocationInsteadOfWinchTargetSocketLoc)
    {
        OutLocation = Location;
    }
    // End:0x197
    if(!bFoundPoint || bUsePawnToWinchLauncherDirInsteadOfSocketRotation)
    {
        OutRotation = Rotator(SourceLocation - Location);
    }
    //return;    
}

simulated function DrawWinchAssistZoneInRelationToThisWinch()
{
    local /*0x97E50000-0x00000000*/ private @NULL WinchLocation[25296897];

    //return;    
}

function DrawShowLobFireAttackDebug()
{
    //return;    
}

function DrawShowDirectFireAttackDebug()
{
    //return;    
}

simulated function ShouldGrenadesIRunOverExplode()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return TuneDataAIPawn.bShouldGrenadesIRunOverExplode && Health > 0;
    //return ReturnValue;    
}

simulated function IsValidTargetForGrenadeAssist()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bAlwaysValidTargetForGrenadeAssist || bCurrentValidTargetForGrenadeAssist;
    //return ReturnValue;    
}

simulated function SetCurrentlyValidTargetForGrenadeAssist()
{
    bCurrentValidTargetForGrenadeAssist = true;
    //return;    
}

simulated function SetCurrentlyNotValidTargetForGrenadeAssist()
{
    bCurrentValidTargetForGrenadeAssist = false;
    //return;    
}

simulated function SetAlwaysValidTargetForGrenadeAssist()
{
    bAlwaysValidTargetForGrenadeAssist = true;
    //return;    
}

simulated function SetAlwaysValidTargetForGrenadeAssistOff()
{
    bAlwaysValidTargetForGrenadeAssist = false;
    //return;    
}

simulated function IsValidTargetForWinchAssist()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL WPInfo;

    // End:0x7C
    if(bAlwaysValidTargetForWinchAssist || bCurrentValidTargetForWinchAssist)
    {
        // End:0x7B
        foreach WinchPoints(WPInfo)
        {
            // End:0x7A
            if(WPInfo.bEnabledForWinching && !WPInfo.bDestroyed)
            {                
                return true;
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

simulated function SetCurrentlyValidTargetForWinchAssist()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[9437185];

    true
    bCurrentValidTargetForWinchAssist = bEnable;
    //return;    
}

simulated function SetCurrentlyNotValidTargetForWinchAssist()
{
    bCurrentValidTargetForWinchAssist = false;
    //return;    
}

simulated function NotifyCurrentTakeDamageWillShutdownVsOpponent()
{
    local /*0x97E50000-0x00000000*/ private @NULL VsGoingToShutdown[8388609];
    local /*0x97E50000-0x00000000*/ private float NewDamage[8388609];

    //return;    
}

simulated function IsMovingFastEnoughToTripAndPlowIn()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float currentSpeedSq;

    currentSpeedSq = VSizeSq(Velocity);
    // End:0x2E
    if(currentSpeedSq > MinSpeedSqToAllowTrippingAndPlowInWhileRunning)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function IsMovingFastEnoughToBeConsideredMovingForAlternateAnimations()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float currentSpeedSq;

    currentSpeedSq = VSizeSq(Velocity);
    // End:0x2E
    if(currentSpeedSq > MinSpeedSqToConsideredMovingForAlternateAnimations)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function GetMovementInteruptionEffectBasedOnCurrentVelocityAndFacing()
{
    local /*0x97E50000-0x00000000*/ private byte DirToGo[25165825], SpeedFactor;
    local /*0x97E50000-0x00000000*/ private bool bUseAcceleration[9437185];

    false
    DirToGo = GetMovementInteruptionEffectDirectionBasedOnCurrentVelocityAndFacing(bUseAcceleration);
    SpeedFactor = GetMovementInteruptionEffectSpeedFactorBasedOnCurrentVelocityAndFacing(DirToGo, bUseAcceleration);
    //return;    
}

simulated function GetMovementInteruptionEffectDirectionBasedOnCurrentVelocityAndFacing()
{
    local /*0x97E50000-0x00000000*/ private bool bUseAcceleration[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL velDir, PawnDir, leftDir, upVec;
    local /*0x97E50000-0x00000000*/ private float forwardPct, leftPct, targetDirAngle;

    velDir = ((bUseAcceleration) ? Acceleration : Velocity);
    velDir.Z = 0.0000000;
    // End:0x7C
    if(Class'SPEngine.SPUtil'.static.IsNearlyZero(velDir))
    {
        return 1;
    }
    velDir = Normal(velDir);
    PawnDir = Vector(Rotation);
    PawnDir.Z = 0.0000000;
    PawnDir = Normal(PawnDir);
    upVec = vect(0.0000000, 0.0000000, 1.0000000);
    leftDir = PawnDir Cross upVec;
    leftDir = Normal(leftDir);
    forwardPct = PawnDir Dot velDir;
    leftPct = leftDir Dot velDir;
    targetDirAngle = Acos(forwardPct);
    // End:0x1A3
    if(leftPct > 0.0000000)
    {
        targetDirAngle *= -1.0000000;
    }
    // End:0x267
    if(MyLpAiController != none)
    {
        MyLpAiController.AILog_Internal((((((("bUseAcceleration: " @ string(bUseAcceleration)) @ " -- velDir: ") @ string(((bUseAcceleration) ? Acceleration : Velocity))) @ " pawnDir: ") @ string(PawnDir)) @ " targetDirAngle: ") @ string(targetDirAngle));
    }
    // End:0x287
    if(targetDirAngle < (-0.8750000 * 3.1415930))
    {
        return 5;        
    }
    else
    {
        // End:0x2A7
        if(targetDirAngle < (-0.6250000 * 3.1415930))
        {
            return 6;            
        }
        else
        {
            // End:0x2C7
            if(targetDirAngle < (-0.3750000 * 3.1415930))
            {
                return 7;                
            }
            else
            {
                // End:0x2E7
                if(targetDirAngle < (-0.1250000 * 3.1415930))
                {
                    return 8;                    
                }
                else
                {
                    // End:0x307
                    if(targetDirAngle < (0.1250000 * 3.1415930))
                    {
                        return 1;                        
                    }
                    else
                    {
                        // End:0x327
                        if(targetDirAngle < (0.3750000 * 3.1415930))
                        {
                            return 2;                            
                        }
                        else
                        {
                            // End:0x347
                            if(targetDirAngle < (0.6250000 * 3.1415930))
                            {
                                return 3;                                
                            }
                            else
                            {
                                // End:0x367
                                if(targetDirAngle < (0.8750000 * 3.1415930))
                                {
                                    return 4;                                    
                                }
                                else
                                {
                                    return 5;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    //return ReturnValue;    
}

simulated function GetMovementInteruptionEffectSpeedFactorBasedOnCurrentVelocityAndFacing()
{
    local /*0x97E50000-0x00000000*/ private byte DirToGo[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUseAcceleration[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float currentSpeedSq;
    local /*0x97E50000-0x00000000*/ private @NULL speedMag;

    speedMag = ((bUseAcceleration) ? Acceleration : Velocity);
    currentSpeedSq = VSizeSq(speedMag);
    // End:0x89
    if(int(DirToGo) == int(1))
    {
        return GetMovementInteruptionEffectSpeedFactorBasedOnCurrentVelocityAndThisDirection(TuneDataAIPawn.ForwardSpeedsForAttackInterruption, currentSpeedSq);        
    }
    else
    {
        // End:0xE8
        if((int(DirToGo) == int(2)) || int(DirToGo) == int(8))
        {
            return GetMovementInteruptionEffectSpeedFactorBasedOnCurrentVelocityAndThisDirection(TuneDataAIPawn.ForwardAndToTheSideSpeedsForAttackInterruption, currentSpeedSq);            
        }
        else
        {
            // End:0x147
            if((int(DirToGo) == int(3)) || int(DirToGo) == int(7))
            {
                return GetMovementInteruptionEffectSpeedFactorBasedOnCurrentVelocityAndThisDirection(TuneDataAIPawn.ToTheSideSpeedsForAttackInterruption, currentSpeedSq);                
            }
            else
            {
                // End:0x1A6
                if((int(DirToGo) == int(6)) || int(DirToGo) == int(4))
                {
                    return GetMovementInteruptionEffectSpeedFactorBasedOnCurrentVelocityAndThisDirection(TuneDataAIPawn.BackwardToTheSideSpeedsForAttackInterruption, currentSpeedSq);                    
                }
                else
                {
                    // End:0x1EF
                    if(int(DirToGo) == int(5))
                    {
                        return GetMovementInteruptionEffectSpeedFactorBasedOnCurrentVelocityAndThisDirection(TuneDataAIPawn.BackwardSpeedsForAttackInterruption, currentSpeedSq);                        
                    }
                    else
                    {
                        return 0;
                    }
                }
            }
        }
    }
    //return ReturnValue;    
}

simulated function GetMovementInteruptionEffectSpeedFactorBasedOnCurrentVelocityAndThisDirection()
{
    local /*0x97E50000-0x00000000*/ private @NULL BinForThisDirection[25165825];
    local /*0x97E50000-0x00000000*/ private float currentSpeedSq[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x4E
    if(currentSpeedSq < (BinForThisDirection.MinSpeedToConsideredMovingAtWalkSpeeds * BinForThisDirection.MinSpeedToConsideredMovingAtWalkSpeeds))
    {
        return 1;        
    }
    else
    {
        // End:0x9C
        if(currentSpeedSq < (BinForThisDirection.MinSpeedToConsideredMovingAtJogSpeeds * BinForThisDirection.MinSpeedToConsideredMovingAtJogSpeeds))
        {
            return 2;            
        }
        else
        {
            // End:0xEA
            if(currentSpeedSq < (BinForThisDirection.MinSpeedToConsideredMovingAtRunSpeeds * BinForThisDirection.MinSpeedToConsideredMovingAtRunSpeeds))
            {
                return 3;                
            }
            else
            {
                // End:0x138
                if(currentSpeedSq < (BinForThisDirection.MinSpeedToConsideredMovingAtSprintSpeeds * BinForThisDirection.MinSpeedToConsideredMovingAtSprintSpeeds))
                {
                    return 4;                    
                }
                else
                {
                    return 5;
                }
            }
        }
    }
    //return ReturnValue;    
}

function PlayWithdrawingScaredSound()
{
    //return;    
}

function OnKillPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    GotoState('Dying');
    //return;    
}

exec function ScriptedKillPawn()
{
    Health = 0;
    Died(Controller, Class'Engine.DmgType_Suicided', Location);
    //return;    
}

function Died()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    StartAllCoreFadePostDeath();
    // End:0x55
    if((Killer != none) && Killer.IsA('LPPlayerController'))
    {
        TriggerEventClass(Class'LPSeqEvent_DeathByPlayer', self);
    }
    return super.Died(Killer, DamageType, HitLocation);
    //return ReturnValue;    
}

simulated event DoIIgnoreBlockedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL FracAct[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (DoIBreakFracturedMeshOfThisType(FracAct)) || DoIExplodeFracturedMeshOfThisType(FracAct);
    //return ReturnValue;    
}

simulated event DoIBreakFracturedMeshOfThisType()
{
    local /*0x97E50000-0x00000000*/ private @NULL FracAct[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated event DoIExplodeFracturedMeshOfThisType()
{
    local /*0x97E50000-0x00000000*/ private @NULL FracAct[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function GetBestCurrentVelocityForThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetToCalcFor[8388609], ReturnValue, trackerOn;

    // End:0xAD
    if(TargetToCalcFor != none)
    {
        trackerOn = LPPathTrackerBase(TargetToCalcFor.Base);
        // End:0x8E
        if(trackerOn != none)
        {
            return trackerOn.CurrentVelocityForAI + TargetToCalcFor.Velocity;
        }
        return TargetToCalcFor.Velocity;
    }
    return vect(0.0000000, 0.0000000, 0.0000000);
    //return ReturnValue;    
}

simulated function SetAimInfoForRangedLobStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL AimPos[25296897], AimActor;
    local /*0x97E50000-0x00000000*/ private int TierId[9437185], ZoneId;
    local /*0x97E50000-0x00000000*/ private float AdditionPosZOffset[9437185];

    -1
    -1
    0.0000000
    AimTargetPositionForRangedLobStrike = AimPos;
    AimTargetActorForRangedLobStrike = AimActor;
    RangedLobStrikeTierForCurrentAttack = TierId;
    RangedLobStrikeZoneForCurrentAttack = ZoneId;
    AimTargetPositionForRangedLobStrike.Z += AdditionPosZOffset;
    //return;    
}

simulated function SetRangedLobStrikeZoneInfo()
{
    local /*0x97E50000-0x00000000*/ private int ZoneId[8388609], AtlArc;

    RangedLobStrikeZoneForCurrentAttack = ZoneId;
    RangedLobStrikeZonesAtlArcForCurrentAttack = AtlArc;
    //return;    
}

simulated function GetAimTargetActorForRangedLobStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return AimTargetActorForRangedLobStrike;
    //return ReturnValue;    
}

simulated function GetAimTargetPositionForRangedLobStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return AimTargetPositionForRangedLobStrike;
    //return ReturnValue;    
}

simulated function GetDirectFireStrikeTierForCurrentAttack()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return DirectFireStrikeTierForCurrentAttack;
    //return ReturnValue;    
}

simulated function GetRangedLobStrikeTierForCurrentAttack()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return RangedLobStrikeTierForCurrentAttack;
    //return ReturnValue;    
}

simulated function GetRangedLobStrikeZoneForCurrentAttack()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return RangedLobStrikeZoneForCurrentAttack;
    //return ReturnValue;    
}

simulated function GetDirectFireStrikeZoneForCurrentAttack()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return DirectFireStrikeZoneForCurrentAttack;
    //return ReturnValue;    
}

simulated function GetRangedLobStrikeZonesAtlArcForCurrentAttack()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return RangedLobStrikeZonesAtlArcForCurrentAttack;
    //return ReturnValue;    
}

simulated function ResetRangedLobStrikeTierForCurrentAttack()
{
    RangedLobStrikeTierForCurrentAttack = -1;
    //return;    
}

simulated function ResetRangedLobStrikeZoneForCurrentAttack()
{
    RangedLobStrikeZoneForCurrentAttack = -1;
    //return;    
}

simulated function ResetRangedDirectFireStrikeZoneForCurrentAttack()
{
    DirectFireStrikeZoneForCurrentAttack = -1;
    //return;    
}

simulated function ResetRangedLobStrikeZonesAtlArcForCurrentAttack()
{
    RangedLobStrikeZonesAtlArcForCurrentAttack = -1;
    //return;    
}

simulated function GetRangedLobFireMidZoneRangeForThisZone()
{
    local /*0x97E50000-0x00000000*/ private int ZoneToGetRageFor[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], preZoneMaxRange, thisZoneMaxRange, midRange;

    // End:0x10A
    if(TuneDataAIPawn.RangedLobStrikeInfoByZone.Length > ZoneToGetRageFor)
    {
        // End:0x4E
        if(ZoneToGetRageFor == 0)
        {
            preZoneMaxRange = 0.0000000;            
        }
        else
        {
            preZoneMaxRange = TuneDataAIPawn.RangedLobStrikeInfoByZone[ZoneToGetRageFor - 1].XY_DistanceFromTargetForLobRangedStrikeInUU;
        }
        thisZoneMaxRange = TuneDataAIPawn.RangedLobStrikeInfoByZone[ZoneToGetRageFor].XY_DistanceFromTargetForLobRangedStrikeInUU;
        midRange = (preZoneMaxRange + thisZoneMaxRange) / 2.0000000;
        return midRange;
    }
    return -1.0000000;
    //return ReturnValue;    
}

simulated function GetRangedDiectFireMidZoneRangeForThisZone()
{
    local /*0x97E50000-0x00000000*/ private int ZoneToGetRageFor[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], preZoneMaxRange, thisZoneMaxRange, midRange;

    // End:0x10A
    if(TuneDataAIPawn.RangedDirectFireStrikeInfoByZone.Length > ZoneToGetRageFor)
    {
        // End:0x4E
        if(ZoneToGetRageFor == 0)
        {
            preZoneMaxRange = 0.0000000;            
        }
        else
        {
            preZoneMaxRange = TuneDataAIPawn.RangedDirectFireStrikeInfoByZone[ZoneToGetRageFor - 1].XY_DistanceFromTargetForRangedStrikeInUU;
        }
        thisZoneMaxRange = TuneDataAIPawn.RangedDirectFireStrikeInfoByZone[ZoneToGetRageFor].XY_DistanceFromTargetForRangedStrikeInUU;
        midRange = (preZoneMaxRange + thisZoneMaxRange) * 0.5000000;
        return midRange;
    }
    return -1.0000000;
    //return ReturnValue;    
}

simulated function GetRangedLobFireIdealSpeedForCurrentLob()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], idealSpeed;

    idealSpeed = 5000.0000000;
    // End:0xD6
    if((RangedLobStrikeTierForCurrentAttack < 0) && RangedLobStrikeZoneForCurrentAttack >= 0)
    {
        // End:0x84
        if(bIntentionalLobMiss)
        {
            idealSpeed = TuneDataAIPawn.RangedLobStrikeInfoByZone[RangedLobStrikeZoneForCurrentAttack].IntentionalMissRangedLobFireIdealSpeed;            
        }
        else
        {
            idealSpeed = TuneDataAIPawn.RangedLobStrikeInfoByZone[RangedLobStrikeZoneForCurrentAttack].RangedLobFireIdealSpeed;
        }
        return idealSpeed;        
    }
    else
    {
        // End:0x189
        if(RangedLobStrikeTierForCurrentAttack >= 0)
        {
            // End:0x13A
            if(bIntentionalLobMiss)
            {
                idealSpeed = TuneDataAIPawn.RangedLobStrikeInfoByTier[RangedLobStrikeTierForCurrentAttack].IntentionalMissRangedLobFireIdealSpeed;                
            }
            else
            {
                idealSpeed = TuneDataAIPawn.RangedLobStrikeInfoByTier[RangedLobStrikeTierForCurrentAttack].RangedLobFireIdealSpeed;
            }
            return idealSpeed;
        }
    }
    return idealSpeed;
    //return ReturnValue;    
}

simulated function GetRangedDirectFireIdealSpeedForCurrentLob()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], idealSpeed;

    idealSpeed = 5000.0000000;
    // End:0xD6
    if((RangedLobStrikeTierForCurrentAttack < 0) && RangedLobStrikeZoneForCurrentAttack >= 0)
    {
        // End:0x84
        if(bIntentionalDirectFireMiss)
        {
            idealSpeed = TuneDataAIPawn.RangedDirectFireStrikeInfoByZone[RangedLobStrikeZoneForCurrentAttack].IntentionalMissRangedFireIdealSpeed;            
        }
        else
        {
            idealSpeed = TuneDataAIPawn.RangedDirectFireStrikeInfoByZone[RangedLobStrikeZoneForCurrentAttack].RangedFireIdealSpeed;
        }
        return idealSpeed;        
    }
    else
    {
        // End:0x189
        if(RangedLobStrikeTierForCurrentAttack >= 0)
        {
            // End:0x13A
            if(bIntentionalLobMiss)
            {
                idealSpeed = TuneDataAIPawn.RangedDirectFireStrikeInfoByTier[RangedLobStrikeTierForCurrentAttack].IntentionalMissRangedFireIdealSpeed;                
            }
            else
            {
                idealSpeed = TuneDataAIPawn.RangedDirectFireStrikeInfoByTier[RangedLobStrikeTierForCurrentAttack].RangedFireIdealSpeed;
            }
            return idealSpeed;
        }
    }
    return idealSpeed;
    //return ReturnValue;    
}

simulated function GetRangedLobFireIdealSpeedForThisTierOrZone()
{
    local /*0x97E50000-0x00000000*/ private int TierToLaunchFrom[8388609], ZoneToLaunchFrom;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], idealSpeed;

    idealSpeed = 5000.0000000;
    // End:0x81
    if((TierToLaunchFrom < 0) && ZoneToLaunchFrom >= 0)
    {
        idealSpeed = TuneDataAIPawn.RangedLobStrikeInfoByZone[ZoneToLaunchFrom].RangedLobFireIdealSpeed;
        return idealSpeed;        
    }
    else
    {
        // End:0xDF
        if(TierToLaunchFrom >= 0)
        {
            idealSpeed = TuneDataAIPawn.RangedLobStrikeInfoByTier[TierToLaunchFrom].RangedLobFireIdealSpeed;
            return idealSpeed;
        }
    }
    return idealSpeed;
    //return ReturnValue;    
}

simulated function GetRangedLobFireMinSpeedForCurrentLob()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], MinSpeed;

    MinSpeed = 50.0000000;
    // End:0xD6
    if((RangedLobStrikeTierForCurrentAttack < 0) && RangedLobStrikeZoneForCurrentAttack >= 0)
    {
        // End:0x84
        if(bIntentionalLobMiss)
        {
            MinSpeed = TuneDataAIPawn.RangedLobStrikeInfoByZone[RangedLobStrikeZoneForCurrentAttack].IntentionalMissRangedLobFireMinSpeed;            
        }
        else
        {
            MinSpeed = TuneDataAIPawn.RangedLobStrikeInfoByZone[RangedLobStrikeZoneForCurrentAttack].RangedLobFireMinSpeed;
        }
        return MinSpeed;        
    }
    else
    {
        // End:0x189
        if(RangedLobStrikeTierForCurrentAttack >= 0)
        {
            // End:0x13A
            if(bIntentionalLobMiss)
            {
                MinSpeed = TuneDataAIPawn.RangedLobStrikeInfoByTier[RangedLobStrikeTierForCurrentAttack].IntentionalMissRangedLobFireMinSpeed;                
            }
            else
            {
                MinSpeed = TuneDataAIPawn.RangedLobStrikeInfoByTier[RangedLobStrikeTierForCurrentAttack].RangedLobFireMinSpeed;
            }
            return MinSpeed;
        }
    }
    return MinSpeed;
    //return ReturnValue;    
}

simulated function GetRangedLobFireMinSpeedForThisTierOrZone()
{
    local /*0x97E50000-0x00000000*/ private int TierToLaunchFrom[8388609], ZoneToLaunchFrom;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], retSpeed;

    retSpeed = 5000.0000000;
    // End:0x81
    if((TierToLaunchFrom < 0) && ZoneToLaunchFrom >= 0)
    {
        retSpeed = TuneDataAIPawn.RangedLobStrikeInfoByZone[ZoneToLaunchFrom].RangedLobFireMinSpeed;
        return retSpeed;        
    }
    else
    {
        // End:0xDF
        if(TierToLaunchFrom >= 0)
        {
            retSpeed = TuneDataAIPawn.RangedLobStrikeInfoByTier[TierToLaunchFrom].RangedLobFireMinSpeed;
            return retSpeed;
        }
    }
    return retSpeed;
    //return ReturnValue;    
}

simulated function GetRangedLobFireMaxSpeedForCurrentLob()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], MaxSpeed;

    MaxSpeed = 50.0000000;
    // End:0xD6
    if((RangedLobStrikeTierForCurrentAttack < 0) && RangedLobStrikeZoneForCurrentAttack >= 0)
    {
        // End:0x84
        if(bIntentionalLobMiss)
        {
            MaxSpeed = TuneDataAIPawn.RangedLobStrikeInfoByZone[RangedLobStrikeZoneForCurrentAttack].IntentionalMissRangedLobFireMaxSpeed;            
        }
        else
        {
            MaxSpeed = TuneDataAIPawn.RangedLobStrikeInfoByZone[RangedLobStrikeZoneForCurrentAttack].RangedLobFireMaxSpeed;
        }
        return MaxSpeed;        
    }
    else
    {
        // End:0x189
        if(RangedLobStrikeTierForCurrentAttack >= 0)
        {
            // End:0x13A
            if(bIntentionalLobMiss)
            {
                MaxSpeed = TuneDataAIPawn.RangedLobStrikeInfoByTier[RangedLobStrikeTierForCurrentAttack].IntentionalMissRangedLobFireMaxSpeed;                
            }
            else
            {
                MaxSpeed = TuneDataAIPawn.RangedLobStrikeInfoByTier[RangedLobStrikeTierForCurrentAttack].RangedLobFireMaxSpeed;
            }
            return MaxSpeed;
        }
    }
    return MaxSpeed;
    //return ReturnValue;    
}

simulated function GetRangedLobFireMaxSpeedForThisTierOrZone()
{
    local /*0x97E50000-0x00000000*/ private int TierToLaunchFrom[8388609], ZoneToLaunchFrom;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], retSpeed;

    retSpeed = 5000.0000000;
    // End:0x81
    if((TierToLaunchFrom < 0) && ZoneToLaunchFrom >= 0)
    {
        retSpeed = TuneDataAIPawn.RangedLobStrikeInfoByZone[ZoneToLaunchFrom].RangedLobFireMaxSpeed;
        return retSpeed;        
    }
    else
    {
        // End:0xDF
        if(TierToLaunchFrom >= 0)
        {
            retSpeed = TuneDataAIPawn.RangedLobStrikeInfoByTier[TierToLaunchFrom].RangedLobFireMaxSpeed;
            return retSpeed;
        }
    }
    return retSpeed;
    //return ReturnValue;    
}

simulated function GetDesiredZPercentOfLobForCurrentLob()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], desiredZPercent;

    desiredZPercent = 0.0001000;
    // End:0x193
    if((RangedLobStrikeTierForCurrentAttack < 0) && RangedLobStrikeZoneForCurrentAttack >= 0)
    {
        // End:0xEC
        if(RangedLobStrikeZonesAtlArcForCurrentAttack >= 0)
        {
            // End:0x93
            if(bIntentionalLobMiss)
            {
                desiredZPercent = TuneDataAIPawn.RangedLobStrikeInfoByZone[RangedLobStrikeZoneForCurrentAttack].IntentionalMissDesiredZPercentOfLob;                
            }
            else
            {
                desiredZPercent = TuneDataAIPawn.RangedLobStrikeInfoByZone[RangedLobStrikeZoneForCurrentAttack].AltDesiredZPercentOfLobList[RangedLobStrikeZonesAtlArcForCurrentAttack];
            }
            return desiredZPercent;
        }
        // End:0x141
        if(bIntentionalLobMiss)
        {
            desiredZPercent = TuneDataAIPawn.RangedLobStrikeInfoByZone[RangedLobStrikeZoneForCurrentAttack].IntentionalMissDesiredZPercentOfLob;            
        }
        else
        {
            desiredZPercent = TuneDataAIPawn.RangedLobStrikeInfoByZone[RangedLobStrikeZoneForCurrentAttack].DesiredZPercentOfLob;
        }
        return desiredZPercent;        
    }
    else
    {
        // End:0x246
        if(RangedLobStrikeTierForCurrentAttack >= 0)
        {
            // End:0x1F7
            if(bIntentionalLobMiss)
            {
                desiredZPercent = TuneDataAIPawn.RangedLobStrikeInfoByTier[RangedLobStrikeTierForCurrentAttack].IntentionalMissDesiredZPercentOfLob;                
            }
            else
            {
                desiredZPercent = TuneDataAIPawn.RangedLobStrikeInfoByTier[RangedLobStrikeTierForCurrentAttack].DesiredZPercentOfLob;
            }
            return desiredZPercent;
        }
    }
    return desiredZPercent;
    //return ReturnValue;    
}

simulated function GetDesiredZPercentOfLobForThisTierOrZone()
{
    local /*0x97E50000-0x00000000*/ private int TierToLaunchFrom[8388609], ZoneToLaunchFrom;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], retSpeed;

    retSpeed = 5000.0000000;
    // End:0x81
    if((TierToLaunchFrom < 0) && ZoneToLaunchFrom >= 0)
    {
        retSpeed = TuneDataAIPawn.RangedLobStrikeInfoByZone[ZoneToLaunchFrom].DesiredZPercentOfLob;
        return retSpeed;        
    }
    else
    {
        // End:0xDF
        if(TierToLaunchFrom >= 0)
        {
            retSpeed = TuneDataAIPawn.RangedLobStrikeInfoByTier[TierToLaunchFrom].DesiredZPercentOfLob;
            return retSpeed;
        }
    }
    return retSpeed;
    //return ReturnValue;    
}

simulated function GetShapeOfProjectileForLobCalcForCurrentLob()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x5F
    if((RangedLobStrikeTierForCurrentAttack < 0) && RangedLobStrikeZoneForCurrentAttack >= 0)
    {
        return TuneDataAIPawn.RangedLobStrikeInfoByZone[RangedLobStrikeZoneForCurrentAttack].ShapeOfProjectileForLobCalc;        
    }
    else
    {
        // End:0xAA
        if(RangedLobStrikeTierForCurrentAttack >= 0)
        {
            return TuneDataAIPawn.RangedLobStrikeInfoByTier[RangedLobStrikeTierForCurrentAttack].ShapeOfProjectileForLobCalc;
        }
    }
    return vect(0.0000000, 0.0000000, 0.0000000);
    //return ReturnValue;    
}

simulated function GetShapeOfProjectileForThisTierOrZone()
{
    local /*0x97E50000-0x00000000*/ private int TierToLaunchFrom[8388609], ZoneToLaunchFrom;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x5F
    if((TierToLaunchFrom < 0) && ZoneToLaunchFrom >= 0)
    {
        return TuneDataAIPawn.RangedLobStrikeInfoByZone[ZoneToLaunchFrom].ShapeOfProjectileForLobCalc;        
    }
    else
    {
        // End:0xAA
        if(TierToLaunchFrom >= 0)
        {
            return TuneDataAIPawn.RangedLobStrikeInfoByTier[TierToLaunchFrom].ShapeOfProjectileForLobCalc;
        }
    }
    return vect(0.0000000, 0.0000000, 0.0000000);
    //return ReturnValue;    
}

simulated function GetIntentionalLobMissFrontOffsetDistanceForCurrentLob()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], misDist;

    misDist = 50.0000000;
    // End:0x77
    if((RangedLobStrikeTierForCurrentAttack < 0) && RangedLobStrikeZoneForCurrentAttack >= 0)
    {
        misDist = TuneDataAIPawn.RangedLobStrikeInfoByZone[RangedLobStrikeZoneForCurrentAttack].IntentionalLobMissFrontOffsetDistance;        
    }
    else
    {
        // End:0xCB
        if(RangedLobStrikeTierForCurrentAttack >= 0)
        {
            misDist = TuneDataAIPawn.RangedLobStrikeInfoByTier[RangedLobStrikeTierForCurrentAttack].IntentionalLobMissFrontOffsetDistance;
        }
    }
    return misDist;
    //return ReturnValue;    
}

simulated function GetIntentionalLobMissSideOffsetDistanceForCurrentLob()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], misDist;

    misDist = 50.0000000;
    // End:0x77
    if((RangedLobStrikeTierForCurrentAttack < 0) && RangedLobStrikeZoneForCurrentAttack >= 0)
    {
        misDist = TuneDataAIPawn.RangedLobStrikeInfoByZone[RangedLobStrikeZoneForCurrentAttack].IntentionalLobMissSideOffsetDistance;        
    }
    else
    {
        // End:0xCB
        if(RangedLobStrikeTierForCurrentAttack >= 0)
        {
            misDist = TuneDataAIPawn.RangedLobStrikeInfoByTier[RangedLobStrikeTierForCurrentAttack].IntentionalLobMissSideOffsetDistance;
        }
    }
    return misDist;
    //return ReturnValue;    
}

simulated function GetIntentionalLobMissHeightOffsetDistanceForCurrentLob()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], misDist;

    misDist = 50.0000000;
    // End:0x77
    if((RangedLobStrikeTierForCurrentAttack < 0) && RangedLobStrikeZoneForCurrentAttack >= 0)
    {
        misDist = TuneDataAIPawn.RangedLobStrikeInfoByZone[RangedLobStrikeZoneForCurrentAttack].IntentionalLobMissHeightOffsetDistance;        
    }
    else
    {
        // End:0xCB
        if(RangedLobStrikeTierForCurrentAttack >= 0)
        {
            misDist = TuneDataAIPawn.RangedLobStrikeInfoByTier[RangedLobStrikeTierForCurrentAttack].IntentionalLobMissHeightOffsetDistance;
        }
    }
    return misDist;
    //return ReturnValue;    
}

simulated event HandleAnimNotifyAI()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609], NodeSeq;

    //return;    
}

final simulated function AddCoreDamageFilter()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> FilterCB[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIdx;

    CoreIdx = GetCoreIndexForThisCoreId(CoreID);
    // End:0xB2
    if(CoreIdx >= 0)
    {
        MyCoreData[CoreIdx].DamageFilter.DamageCauser = DamageCauser;
        MyCoreData[CoreIdx].DamageFilter.DamageFilterCB = FilterCB;
    }
    //return;    
}

function TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser, localHit, BoneLocation;
    local /*0x97E50000-0x00000000*/ private class TheDamageType;

    // End:0x30
    if(LPPlayerController(InstigatedBy) != none)
    {
        LastRawDamageTakenFromPlayer = Damage;        
    }
    else
    {
        LastRawDamageTakenFromPlayer = 0;
    }
    // End:0xB5
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        TheDamageType = class<LPDamageType>(DamageType);
        // End:0xB5
        if(InStruggleMode && !TheDamageType.default.bStruggleModeDamageType)
        {
            return;
        }
    }
    // End:0x229
    if(bShowHitLocationDebugInfo)
    {
        localHit.BoneHitName = HitInfo.BoneName;
        BoneLocation = Mesh.GetBoneLocation(localHit.BoneHitName);
        localHit.BoneOffsetLoc = HitLocation - BoneLocation;
        localHit.bHitShield = false;
        localHit.bHitCore = false;
        // End:0x213
        if(RecentLocalSpaceHits.Length > TuneDataAIPawn.NumOfLastHitsToShow)
        {
            RecentLocalSpaceHits.Remove(0, RecentLocalSpaceHits.Length - TuneDataAIPawn.NumOfLastHitsToShow);            
        }
        RecentLocalSpaceHits.AddItem(localHit);        
    }
    super.TakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    // End:0x2A7
    if(!TakeDamageParams.bTakeDamageAborted)
    {
        HandleTEngBleed(HitLocation);
    }
    //return;    
}

function HandleTEngBleed()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];
    local /*0x97E50000-0x00000000*/ private float DropAmount;
    local /*0x97E50000-0x00000000*/ private @NULL BleedVelocity;

    // End:0x1FC
    if(bUseTEngBleed)
    {
        // End:0x1FC
        if(WorldInfo.TimeSeconds > (LastTEngBleedTime + TuneDataAIPawn.BleedRate.GetValue()))
        {
            // End:0x1FC
            if(float(Health) <= (float(LastTEngBleedHealth) - TuneDataAIPawn.BleedDamage.GetValue()))
            {
                LastTEngBleedTime = WorldInfo.TimeSeconds;
                LastTEngBleedHealth = Health;
                DropAmount = TuneDataAIPawn.BleedAmount.GetValue() + (((FRand() * float(2)) - float(1)) * TuneDataAIPawn.BleedAmountVariance.GetValue());
                BleedVelocity = vect(0.0000000, 0.0000000, 0.0000000);
                DropThermalEnergy(DropAmount, int(TuneDataAIPawn.BleedCount.GetValue()), HitLoc - Location, BleedVelocity);
            }
        }
    }
    //return;    
}

function InitTEngBleed()
{
    // End:0x56
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        bUseTEngBleed = TuneDataAIPawn.bBleedEnabledMP;        
    }
    else
    {
        bUseTEngBleed = TuneDataAIPawn.bBleedEnabled;
    }
    LastTEngBleedHealth = HealthMax;
    LastTEngBleedTime = 0.0000000;
    //return;    
}

function GetPressureDepletionRate()
{
    local /*0x97E50000-0x00000000*/ private @NULL inHoldSM[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], ret;

    // End:0x63
    if(inHoldSM.bDrillInUse)
    {
        ret = TuneDataAIPawn.ForkArmGrabRightArmUseDepetionRate.GetValue();        
    }
    else
    {
        ret = TuneDataAIPawn.ForkArmGrabPressureDepletionRate.GetValue();
    }
    return ret;
    //return ReturnValue;    
}

function CanCurrentCommandBeInterrupted()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Cmd;

    // End:0x11
    if(MyLpAiController == none)
    {
        return true;
    }
    // End:0x37
    if(MyLpAiController.CurrentObjective == none)
    {
        return true;
    }
    // End:0x72
    if(MyLpAiController.CurrentObjective.CurrentCommand == none)
    {
        return true;
    }
    Cmd = LPAICommand(MyLpAiController.CurrentObjective.CurrentCommand);
    // End:0xC9
    if(Cmd == none)
    {
        return true;
    }
    return Cmd.IsInterruptible();
    //return ReturnValue;    
}

function GetLocationToTraceToAfterWinchContact()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Location;
    //return ReturnValue;    
}

function WantsToPlayDieAnim()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private class TheDamageType;

    // End:0x19
    if(DamageType == Class'Engine.DmgType_Suicided')
    {
        return false;
    }
    TheDamageType = class<LPDamageType>(DamageType);
    // End:0x5B
    if(!TheDamageType.default.bPlayDeathAnim)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function StartDie()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];

    // End:0x108
    if(bShouldDeathBloom && !bDoneBlowingUpWhileDying)
    {
        // End:0x47
        if(WantsToPlayDieAnim(DamageType))
        {
            PlayDyingSpecialMove(Class'LPSM_PhadyrDie');
        }
        LocationAtStartOfDeathBloom = Location;
        LocationAtStartOfDeathBloomForRipExplosion = Mesh.GetBoneLocation(TuneDataAIPawn.NameOfBoneForDeathRipapartExplosion);
        DeathBloomStartTime = WorldInfo.TimeSeconds;
        LastDeathBloomUpdateTime = WorldInfo.TimeSeconds;
        SetTimer(0.0400000, false, 'StartBlowMeUpWhileDying', self);        
    }
    else
    {
        super.StartDie(DamageType, HitLoc);
    }
    //return;    
}

function PlayDyingSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class SpecialMoveClass[8388609];

    DoSpecialMove(SpecialMoveClass, true);
    //return;    
}

function ApplyFlyBackImpulse()
{
    local /*0x97E50000-0x00000000*/ private float HorizantalImpulse, UpwardImpulse;
    local /*0x97E50000-0x00000000*/ private @NULL CombinedImpulse, ImpulseDirection, ImpulseLocation, HitDirection;
    local /*0x97E50000-0x00000000*/ private float ImpulseSize;

    HorizantalImpulse = TuneDataAIPawn.PushAlongImpulse;
    UpwardImpulse = TuneDataAIPawn.PushUpImpulse;
    // End:0x7A
    if((HorizantalImpulse == 0.0000000) && UpwardImpulse == 0.0000000)
    {
        return;
    }
    // End:0x1FA
    if(ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeBallistic'))
    {
        ZeroMovementVariables();
        HitDirection = Class'SPEngine.SPAnimNodeTemplateLogicHitDirection'.static.GetHitDirectionMomentum(self);
        HitDirection.Z = 0.0000000;
        HitDirection = Normal(HitDirection);
        CombinedImpulse = HitDirection * HorizantalImpulse;
        CombinedImpulse.Z = UpwardImpulse;
        ImpulseDirection = Normal(CombinedImpulse);
        ImpulseLocation = -ImpulseDirection * float(60);
        ImpulseLocation += TakeDamageParams.HitLocation;
        ImpulseSize = VSize(CombinedImpulse);
        Mesh.AddRadialImpulse(ImpulseLocation, 5000.0000000, ImpulseSize, 1, true);
    }
    //return;    
}

simulated event OnPlayRagDollDeath()
{
    local /*0x97E50000-0x00000000*/ private @NULL RagdollNotify[9437185];

    // End:0x10
    if(bRagdollDead)
    {
        return;
    }
    super(SPPawn).OnPlayRagDollDeath(RagdollNotify);
    // End:0x3A
    if(bApplyRagdollImpulse)
    {
        ApplyFlyBackImpulse();
    }
    //return;    
}

event TempPlaceHolderWeakPointReachedZeroHealth()
{
    local /*0x97E50000-0x00000000*/ private @NULL WeakPoint[8388609];

    //return;    
}

simulated function NotifyGrenadeOnRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL InGrenade[8388609];

    //return;    
}

function StartBlowMeUpWhileDying()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[9437185];

    Class'LPDamageType'
    Location
    // End:0x8C
    if(!bDoneBlowingUpWhileDying)
    {
        DeathBloomStartTime = WorldInfo.TimeSeconds;
        LastDeathBloomUpdateTime = WorldInfo.TimeSeconds;
        SetTimer(0.0300000, true, 'BlowMeUpWhileDying', self);
    }
    //return;    
}

simulated function BlowMeUpWhileDying()
{
    local /*0x97E50000-0x00000000*/ private float bloomDelta, bloomUpdateDelta, currentScaleRate, CurrentScale, NewScale;

    bloomDelta = WorldInfo.TimeSeconds - DeathBloomStartTime;
    bloomUpdateDelta = WorldInfo.TimeSeconds - LastDeathBloomUpdateTime;
    LastDeathBloomUpdateTime = WorldInfo.TimeSeconds;
    currentScaleRate = Class'SPEngine.SPCurveFloat'.static.ApplyCurve(bloomDelta, TuneDataAIPawn.HowMuchToIncreaseSizePerSecWhenGoingThroughMassiveDeathExplosionCurve);
    CurrentScale = currentScaleRate * bloomUpdateDelta;
    CurrentScale += 1.0000000;
    NewScale = DrawScale * CurrentScale;
    // End:0x178
    if(NewScale < TuneDataAIPawn.MaxSizeToIncreaseSizeByWhenGoingThroughMassiveDeathExplosion)
    {
        SetDrawScale(DrawScale * CurrentScale);        
    }
    else
    {
        bShouldRagdoll = false;
        bDoneBlowingUpWhileDying = true;
        // End:0x1B4
        if(!TuneDataAIPawn.bDoRipApartExplosionAtSameTimeAsGibThrowOut)
        {
        }
        ClearTimer('BlowMeUpWhileDying', self);
        Destroy();
    }
    return;
    //return;    
}

function DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];

    //return;    
}

function OnApplyQuestObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0xA2
    if(int(Action.QuestType) == int(0))
    {
        // End:0x97
        if(Action.QuestEntry != none)
        {
            AlternateDNAQuestObjective = SPQO_Objective(Action.QuestEntry.GetQuestObject());            
        }
        else
        {
            AlternateDNAQuestObjective = none;
        }
    }
    //return;    
}

function DNAExtracted()
{
    local /*0x97E50000-0x00000000*/ private @NULL InTagger[8388609];

    // End:0x45
    if((InTagger != none) && AlternateDNAQuestObjective != none)
    {
        AlternateDNAQuestObjective.AdjustQuestProgress(1.0000000);
    }
    super.DNAExtracted(InTagger);
    //return;    
}

function NotifyYouKilledPlayer()
{
    //return;    
}

function IsGrenadeClose()
{
    local /*0x97E50000-0x00000000*/ private @NULL TestLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

simulated state Dying
{
    ignores EncroachedBy, Timer, StartWaitToDeletePawn;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        // End:0x28
        if(!bRagdollDead)
        {
            SetCollision(true, true, true);
        }
        LifeSpan = 600.0000000;
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeathFX;

        // End:0x9F
        if(FXActionManagerInstance != none)
        {
            DeathFX = LPFXAction_FreezePawn(FXActionManagerInstance.GetFXAction(Class'LPFXAction_FreezePawn'));
            // End:0x9F
            if((DeathFX != none) && DeathFX.IsActive())
            {
                DeathFX.ShutDown();
                Destroy();
            }
        }
        //return;        
    }

    function HasFreezeFXAction()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL DeathFX;

        // End:0x5B
        if(FXActionManagerInstance != none)
        {
            DeathFX = LPFXAction_FreezePawn(FXActionManagerInstance.GetFXAction(Class'LPFXAction_FreezePawn'));
            // End:0x5B
            if(DeathFX != none)
            {
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }

    function StartFreezePawn()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bIsFreezing;
        local /*0x97E50000-0x00000000*/ private @NULL DeathFX;

        bIsFreezing = false;
        // End:0xEA
        if(FXActionManagerInstance != none)
        {
            DeathFX = LPFXAction_FreezePawn(FXActionManagerInstance.GetFXAction(Class'LPFXAction_FreezePawn'));
            // End:0xEA
            if(DeathFX != none)
            {
                FXActionManagerInstance.StartFXAction(Class'LPFXAction_FreezePawn');
                bIsFreezing = true;
                // End:0xEA
                if(bShouldRagdoll)
                {
                    Mesh.SetNotifyRigidBodyCollision(true);
                    Mesh.ScriptRigidBodyCollisionThreshold = 500.0000000;
                }
            }
        }
        return bIsFreezing;
        //return ReturnValue;        
    }

    simulated event @NULL RigidBodyCollision()
    {
        local /*0x97E50000-0x00000400*/ private @NULL HitComponent[8388609], OtherComponent, RigidCollisionData;
        local /*0x97E50000-0x00000000*/ private int ContactIndex[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeathFX;

        // End:0x13D
        if((bShouldRagdoll && OtherComponent != HitComponent) && (OtherComponent == none) || !ClassIsChildOf(OtherComponent.Owner.Class, Class'LPBaseVSPlayerPawn'))
        {
            // End:0x13D
            if(FXActionManagerInstance != none)
            {
                DeathFX = LPFXAction_FreezePawn(FXActionManagerInstance.GetFXAction(Class'LPFXAction_FreezePawn'));
                // End:0x13D
                if((DeathFX != none) && DeathFX.IsActive())
                {
                    DeathFX.RagdollCollision(HitComponent, OtherComponent, RigidCollisionData, ContactIndex);
                }
            }
        }
        super(LPPawn).RigidBodyCollision(HitComponent, OtherComponent, RigidCollisionData, ContactIndex);
        //return;        
    }

    function DontWaitForSpecialMoveToFinish()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL CurrentSpecialMove;

        // End:0xD7
        if((((HasFreezeFXAction()) && bFreezeWhilePlayingAnim) && !InStruggleMode) && !IsInPawnChoreography())
        {
            CurrentSpecialMove = SPSM_PlayAnimBase(SpecialMoveState.CurSMInstance);
            // End:0xD7
            if((CurrentSpecialMove == none) || CurrentSpecialMove.PlayingSeq.GetTimeLeft() < TuneDataAIPawn.MaxTimeAnimationFreeze)
            {
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }

    function IsTimeToDeleteDeadPawn()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return (Mesh.LastRenderTime + TuneDataAIPawn.TimeAfterLastRenderToDeletePawn) < WorldInfo.TimeSeconds;
        //return ReturnValue;        
    }

    function GetTimeToDeleteCheckSleepInterval()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

        return 0.1000000;
        //return ReturnValue;        
    }
    J0x00:
    // End:0x5F [Loop If]
    if((IsDoingASpecialMove() && Mesh != none) && !Mesh.bPauseAnims)
    {
        // End:0x54
        if(DontWaitForSpecialMoveToFinish())
        {
            // [Explicit Break]
            goto J0x5F;
        }
        Sleep(0.1000000);
        // [Loop Continue]
        goto J0x00;
    }
    J0x5F:

    // End:0x9E
    if(!DontWaitForSpecialMoveToFinish() || bGibbed)
    {
        Mesh.bPauseAnims = true;
    }
    // End:0x1AC
    if(!bGibbed)
    {
        // End:0xD6
        if(bShouldRagdoll && !bRagdollDead)
        {
            OnPlayRagDollDeath();
        }
        // End:0x1AC
        if(StartFreezePawn())
        {
            J0xE3:

            // End:0x12F [Loop If]
            if(FXActionManagerInstance.GetFXAction(Class'LPFXAction_FreezePawn').IsActive())
            {
                Sleep(0.1000000);
                // [Loop Continue]
                goto J0xE3;
            }
            J0x12F:

            // End:0x15C [Loop If]
            if(TuneDataAIPawn.DebugDontDestroyPawn)
            {
                Sleep(10000000.0000000);
                // [Loop Continue]
                goto J0x12F;
            }
            // End:0x1AC
            if(LPFXAction_FreezePawn(FXActionManagerInstance.GetFXAction(Class'LPFXAction_FreezePawn')).FracturedStaticMeshToSwap.Length > 0)
            {
                Destroy();
            }
        }
    }
    SetLifeCycleState(2);
    Sleep(TuneDataAIPawn.TimeBetweenDeathAndDelete);
    // End:0x228
    if(TuneDataAIPawn.TimeAfterLastRenderToDeletePawn > float(0))
    {
        StartWaitToDeletePawn();
        J0x209:

        // End:0x228 [Loop If]
        if(!IsTimeToDeleteDeadPawn())
        {
            Sleep(GetTimeToDeleteCheckSleepInterval());
            // [Loop Continue]
            goto J0x209;
        }
    }
    Destroy();
    stop;                    
}

defaultproperties
{
    bApplyRagdollImpulse=true
    bCurrentValidTargetForWinchAssist=true
    bFreezeWhilePlayingAnim=true
    bAllowAkridAsEnemies=true
    DamageTracking=(LastEntry=-1,DamageEntry=none)
    MaxBrokenFracturedMeshesThisFrame=1
    TimeBirthProcessEnded=-1.0000000
    SafetyDelayToUnPauseAiAfterEnteringOrExitingVs=4.0000000
    bPlayImpactEffectsWhenDead=false
    bIsUsingAccelRateMaxSpeedModifier=true
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawn.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    bAllowHitReactionsInMatinee=true
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawn.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    SpecialMoves=/* Array type was not detected. */
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawn.SMTC'
    begin object name=SMTC class=Class'SPAIKynapse.SPMovementTransitionComponentAI'
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawn.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawn.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawn.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    DesiredSpeed=0.0000000
    SightRadius=10000.0000000
    PeripheralVision=-1.0000000
    AirControl=0.0000000
    // Reference: SkeletalMeshComponent'Default__LPAIPawn.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawn.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawn.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=none
    Components[1]=CollisionCylinder
    Components[2]=none
    Components[3]=myKynapseBodyHandle
    Components[4]=MyLightEnvironment
    Components[5]=SPPawnMesh
    Components[6]=FaceAudioComponent
    Components[7]=SPDamageOverTimeComponentObj
    Components[8]=SMTC
    NetUpdateFrequency=15.0000000
    // Reference: LPActorInteractionMetaData'Default__LPAIPawn.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
    SupportedEvents=/* Array type was not detected. */
}