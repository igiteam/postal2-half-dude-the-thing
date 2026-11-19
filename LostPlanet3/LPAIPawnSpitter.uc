class LPAIPawnSpitter extends LPAIPawnAkridLarge
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

enum ESpitterGrabPoints
{
    esgpShield,                     // 0
    esgpTailStrike,                 // 1
    ESpitterGrabPoints_MAX          // 2
};

enum eSpitterAttack
{
    eSpitterAttack_Spit,            // 0
    eSpitterAttack_TailSting,       // 1
    eSpitterAttack_TailStingQuick,  // 2
    eSpitterAttack_TalonAttack,     // 3
    eSpitterAttack_TalonAttackQuick,// 4
    eSpitterAttack_ChargeAttack,    // 5
    eSpitterAttack_MAX              // 6
};

enum eSpitterSpitState
{
    eSpitterSpitState_None,         // 0
    eSpitterSpitState_Aiming,       // 1
    eSpitterSpitState_Firing,       // 2
    eSpitterSpitState_MAX           // 3
};

enum eSpitterSpitMode
{
    eSpitterSpitMode_Aimimg,        // 0
    eSpitterSpitMode_Reactive,      // 1
    eSpitterSpitMode_MAX            // 2
};

enum ESpitterWinchPoints
{
    ESWP_Tail,                      // 0
    ESWP_MAX                        // 1
};

enum ESpitterTailAnims
{
    TailAnim_DamageTwitch,          // 0
    TailAnim_MAX                    // 1
};

struct native Spitter_AttackSelection
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name DebugName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetweenAttack_Min;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetweenAttack_Max;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableTaunt;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TauntDuration;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetweenTaunt_Min;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetweenTaunt_Max;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetweenHunkerAndSpit;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetweenHunkerAndSting;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Probablility;

    structdefaultproperties
    {
        DebugName="None"
        TimeBetweenAttack_Min=0.0000000
        TimeBetweenAttack_Max=0.0000000
        bEnableTaunt=false
        TauntDuration=0.0000000
        TimeBetweenTaunt_Min=0.0000000
        TimeBetweenTaunt_Max=0.0000000
        TimeBetweenHunkerAndSpit=0.0000000
        TimeBetweenHunkerAndSting=0.0000000
        Probablility=none
    }
};

struct native SpitterTailIkInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SkelCtrl;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name BoneName;

    structdefaultproperties
    {
        SkelCtrl=none
        BoneName="None"
    }
};

struct native TailAnimInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name NodeName;

    structdefaultproperties
    {
        AnimTemplateLogic=none
        NodeName="None"
    }
};

struct native SpitterMaterialParameterInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MIC;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MICOriginal;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int matidx;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ParameterName;

    structdefaultproperties
    {
        MIC=none
        MICOriginal=none
        matidx=-1
        ParameterName="DamageFactor"
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpitHolePhysMat[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PrimaryCorePhysMat[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RightLegCorePhysMat[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataSpitter;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MySpitterController[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTimeBetweenEnemySightedTaunt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastEnemyUsedForTauntOnSight[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ChaneOfDoingMeleeAttacksWhileSpitEnabled[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StalkSpeedScalePof[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StalkSpeedScaleVs[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AttackSpeedScalePof[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AttackSpeedScaleVs[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class SpitterTailClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentCSA[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPAIPawnSpitter.eSpitterSpitState SpitState[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private LPAIPawnSpitter.eSpitterSpitMode SpitMode[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array TailAnimTemplateData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TailAnimData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int CurUpperBodyAnim[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInDodgeWindow[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAggressiveAttackSelection;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSpitCanFreezeTarget[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWantTailIK[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowChoreography[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTalonDodgeWindow[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTailDodgeWindow[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTailBreakHitReactionRequired[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsTailTwitching;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsTalonPushing;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bEnableTailTwitch[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimePawnDamagedBySpitAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AttackSelectionPofNotResined;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AttackSelectionPofNotResinedSpitDisabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AttackSelectionPofNotResinedTailDisabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AttackSelectionPofTailBurning;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AttackSelectionPofResined;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AttackSelectionVsNotResined;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AttackSelectionVsNotResinedSpitDisabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AttackSelectionVsNotResinedTailDisabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AttackSelectionVsResined;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AttackSelectionVsTailBurning;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSeperation_SpitAttackPof[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSeperation_SpitAttackVs[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamagePerSecondFromSpit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamagePerSecondFromSpit_VS[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Duration_SpitAttackPof_Max[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Duration_SpitAttackPof_Min[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Duration_SpitAttackVs_Max[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Duration_SpitAttackVs_Min[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RateOfFire_Delay[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AcidPool_Delay[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetween_ResinBreakAndSpitAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ErrorInAiming_Min[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ErrorInAiming_Max[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AimingErrorCorrectionSpeed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ErrorInAimingVS_Min[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ErrorInAimingVS_Max[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AimingErrorCorrectionSpeedVS[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ApproximateRelativeFirePoint[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SpitParticleSystem[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpitFxTargetPosition[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpitDamageStartTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextAcidPoolGenerationTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpitterTailIkControl[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class ClassAcidPool[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private Vector TargetPosition[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private LPPawn TargetedPawn[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name TargetedSocket[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSeperation_TailStingPof[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSeperation_TailStingVs[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TailStingForwardArcDot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TailStingQuick_RepeatCount_Min[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TailStingQuick_RepeatCount_Max[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSeperation_TalonAttackPof[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSeperation_TalonAttackReactivePof[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSeperation_TalonAttackVs[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TalonAttackForwardArcDot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TalonAttackQuick_RepeatCount_Min[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TalonAttackQuick_RepeatCount_Max[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSeperation_TailSwing[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetween_TailSwing_Min[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetween_TailSwing_Max[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TailSwingRearDot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetween_ReactiveTailSting_Min[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetween_ReactiveTailSting_Max[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetween_ReactiveTalonAttack_Min[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetween_ReactiveTalonAttack_Max[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageForBreakingTailAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageWindowInSecondsForBreakingTailAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpitterMaterialParameter[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AccumulatedCoreDamageDuringPhase[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSeperation_ChargeAttackPof[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSeperation_ChargeAttackVs[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel ReplicatedMemberStatus ReplicatedTailStatus[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ATL_FiringCycle_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ATL_FiringCycle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ATL_HitWhileSpitting_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ATL_HitWhileSpitting[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LengthOfHunkerDownAnim[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LengthOfTailOnFireTwitchAnim[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LengthOfTalonPushAnim[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Seperation_ToBreakOutOfHunkerDown[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AngularSeperation_ToBreakOutOfHunkerDown[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Seperation_ToBreakOutOfHunkerDown_DuringSpit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AngularSeperation_ToBreakOutOfHunkerDown_DuringSpit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HealthThresoldToDismemberTail[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AdditiveAnimInfo_TailTwitch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AdditiveAnimInfo_TalonPush;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_TailTwitch[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_TalonPush[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeUntilNextTailTwitch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastTalonPush;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ElapsedTimeForSpitDamage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpitFinishTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class DamageTypeChargeHit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class DamageTypeChargeBrush;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OldParticleSystemFinishedDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __WeaponPassThroughDelegate__Delegate;

delegate @NULL OldParticleSystemFinishedDelegate()
{
    local /*0x97E50000-0x00000400*/ private @NULL PSystem[8388609];

    //return;    
}

delegate WeaponPassThroughDelegate()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

// Export ULPAIPawnSpitter::execSpitGetCollision(FFrame&, void* const)
native static simulated function SpitGetCollision()
{
    local /*0x97E50000-0x00000000*/ private @NULL Origin[25165825], Target, Info;
    local /*0x97E50000-0x00000000*/ private float Radius[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    0.0000000                        
}

// Export ULPAIPawnSpitter::execIsSinglePlayerGame(FFrame&, void* const)
native function IsSinglePlayerGame()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawnSpitter::execIsValidCoreTagType(FFrame&, void* const)
native simulated function IsValidCoreTagType()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawnSpitter::execGetLeftLegDamageFactor(FFrame&, void* const)
native final simulated function GetLeftLegDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnSpitter::execGetRightLegDamageFactor(FFrame&, void* const)
native final simulated function GetRightLegDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnSpitter::execGetTailDamageFactor(FFrame&, void* const)
native final simulated function GetTailDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnSpitter::execGetTailDamageFactor_MP(FFrame&, void* const)
native final simulated function GetTailDamageFactor_MP()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnSpitter::execGetBodyDamageFactor(FFrame&, void* const)
native final simulated function GetBodyDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnSpitter::execGetSpitHoleDamageFactor(FFrame&, void* const)
native final simulated function GetSpitHoleDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    super(LPPawn).ReplicatedEvent(VarName);
    switch(VarName)
    {
        // End:0x48
        case 'SpitState':
            SetSpitState(SpitState);
            // End:0xA0
            break;
        // End:0x61
        case 'ReplicatedTailStatus':
            DoTailDestruction();
            // End:0xA0
            break;
        // End:0x7A
        case 'CurUpperBodyAnim':
            HandleChangeInTailAnim();
            // End:0xA0
            break;
        // End:0x9D
        case 'bEnableTailTwitch':
            EnableTailTwitch(bEnableTailTwitch);
            // End:0xA0
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated event PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL out_ProjLoc, out_ProjRot;

    super.PostBeginPlay();
    Mesh.GetSocketWorldLocationAndRotation('SpitPoint', out_ProjLoc, out_ProjRot);
    ApproximateRelativeFirePoint = out_ProjLoc - Location;
    ApproximateRelativeFirePoint = ApproximateRelativeFirePoint << Rotation;
    EnableCoreById(0, true);
    InitSpitterMaterialParameter();
    //return;    
}

function PossessedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super(LPAIPawn).PossessedBy(C, bVehicleTransition);
    MySpitterController = LPAIControllerSpitter(C);
    //return;    
}

function UnPossessed()
{
    super(LPAIPawn).UnPossessed();
    MySpitterController = none;
    //return;    
}

simulated function GetApproximateSpitStartForLocationAndOrientation()
{
    local /*0x97E50000-0x00000000*/ private @NULL InLocation[8388609], InRotation, ReturnValue, pos;

    pos = ApproximateRelativeFirePoint >> InRotation;
    pos += InLocation;
    return pos;
    //return ReturnValue;    
}

simulated function GetApproximateSpitStartPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return GetApproximateSpitStartForLocationAndOrientation(Location, Rotation);
    //return ReturnValue;    
}

simulated function @NULL PerformPostInitAnimTreeActions()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelComp[8388609];

    super(LPPawn).PerformPostInitAnimTreeActions(SkelComp);
    SpitterTailIkControl.SkelCtrl = LPSkelControl_CCD_IK_SpitterTail(SkelComp.FindSkelControl('TailAiming'));
    SpitterTailIkControl.SkelCtrl.SetSkelControlStrength(0.0000000, 0.0000000);
    SpitterTailIkControl.SkelCtrl.SetSkelControlActive(false);
    TailAnimData.AnimNodeSlot = SPAnimNodeSlot(SkelComp.FindAnimNode(TailAnimData.AnimNodeSlotName));
    AdditiveAnimInfo_TailTwitch.AnimNodeSlot = SPAnimNodeSlot(SkelComp.FindAnimNode(AdditiveAnimInfo_TailTwitch.AnimNodeSlotName));
    AdditiveAnimInfo_TalonPush.AnimNodeSlot = SPAnimNodeSlot(SkelComp.FindAnimNode(AdditiveAnimInfo_TalonPush.AnimNodeSlotName));
    //return;    
}

simulated function InitAnimTemplates()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array SMNames, SMNodes, MoveNames, MoveNodes;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x321
    if(AttackAnimTree != none)
    {
        // End:0x94
        if(ATL_FiringCycle_Name != 'None')
        {
            SMNames.AddItem(ATL_FiringCycle_Name);            
            AttackAnimTree.FindAnimNodes(SMNames, SMNodes, Class'SPEngine.SPAnimNodeTemplateLogicNamedRoot');
            ATL_FiringCycle = SPAnimNodeTemplateLogicNamedRoot(SMNodes[0]);
        }
        I = 0;
        J0x9F:

        // End:0xF8 [Loop If]
        if(I < TailAnimTemplateData.Length)
        {
            MoveNames.AddItem(TailAnimTemplateData[I].NodeName);            
            ++I;
            // [Loop Continue]
            goto J0x9F;
        }
        AttackAnimTree.FindAnimNodes(MoveNames, MoveNodes, Class'LPAnimNodeTemplateLogicNamedRoot');
        I = 0;
        J0x13D:

        // End:0x1A6 [Loop If]
        if(I < TailAnimTemplateData.Length)
        {
            TailAnimTemplateData[I].AnimTemplateLogic = LPAnimNodeTemplateLogicNamedRoot(MoveNodes[I]);
            ++I;
            // [Loop Continue]
            goto J0x13D;
        }
        MoveNames.Length = 0;
        MoveNodes.Length = 0;
        MoveNames.AddItem('TailOnFireTwitch');        
        MoveNames.AddItem('TalonPush');        
        MoveNames.AddItem(ATL_HitWhileSpitting_Name);        
        AttackAnimTree.FindAnimNodes(MoveNames, MoveNodes, Class'LPAnimNodeTemplateLogicNamedRoot');
        AnimTemplateLogic_TailTwitch = LPAnimNodeTemplateLogicNamedRoot(MoveNodes[0]);
        AnimTemplateLogic_TalonPush = LPAnimNodeTemplateLogicNamedRoot(MoveNodes[1]);
        ATL_HitWhileSpitting = LPAnimNodeTemplateLogicNamedRoot(MoveNodes[2]);
        LengthOfHunkerDownAnim = GetAttackAnimLength('HunkerDown');
        LengthOfTailOnFireTwitchAnim = GetAttackAnimLength(TailAnimTemplateData[0].NodeName);
        LengthOfTalonPushAnim = GetAttackAnimLength('TalonPush');
        // End:0x321
        if(LengthOfTailOnFireTwitchAnim < float(0))
        {
            LengthOfTailOnFireTwitchAnim = 0.0000000;
        }
    }
    super(LPPawn).InitAnimTemplates();
    //return;    
}

function GetAttackAnimLength()
{
    local /*0x97E50000-0x00000000*/ private name AnimName[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array MoveNames, MoveNodes;
    local /*0x97E50000-0x00000000*/ private @NULL NodeTemplateLogic, AnimSeqTemplate, AnimSeq;

    // End:0x162
    if(AttackAnimTree != none)
    {
        MoveNames.Length = 0;
        MoveNodes.Length = 0;
        MoveNames.AddItem(AnimName);        
        AttackAnimTree.FindAnimNodes(MoveNames, MoveNodes, Class'LPAnimNodeTemplateLogicNamedRoot');
        // End:0x162
        if(MoveNodes.Length > 0)
        {
            NodeTemplateLogic = LPAnimNodeTemplateLogicNamedRoot(MoveNodes[0]);
            // End:0x162
            if(NodeTemplateLogic != none)
            {
                AnimSeqTemplate = NodeTemplateLogic.GetBestSequenceTemplate(self);
                // End:0x162
                if(AnimSeqTemplate != none)
                {
                    AnimSeq = Mesh.FindAnimSequence(AnimSeqTemplate.AnimSeqName);
                    // End:0x162
                    if(AnimSeq != none)
                    {
                        return AnimSeq.SequenceLength;
                    }
                }
            }
        }
    }
    return -1.0000000;
    //return ReturnValue;    
}

function StartTailAnim()
{
    local /*0x97E50000-0x00000000*/ private int AnimIndex[8388609];

    // End:0x63
    if(((AnimIndex > -1) && AnimIndex < TailAnimTemplateData.Length) && AnimIndex != CurUpperBodyAnim)
    {
        CurUpperBodyAnim = AnimIndex;
        HandleChangeInTailAnim();
    }
    //return;    
}

function StopTailAnim()
{
    CurUpperBodyAnim = -1;
    HandleChangeInTailAnim();
    //return;    
}

simulated function IsTailAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return CurUpperBodyAnim < 0;
    //return ReturnValue;    
}

simulated function TailAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    CurUpperBodyAnim = -1;
    //return;    
}

simulated function HandleChangeInTailAnim()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    // End:0xDC
    if((CurUpperBodyAnim > -1) && CurUpperBodyAnim < TailAnimTemplateData.Length)
    {
        AnimSeqTemplate = TailAnimTemplateData[CurUpperBodyAnim].AnimTemplateLogic.GetBestSequenceTemplate(self);
        TailAnimData.AnimNodeSlot.PlayCustomSequenceWithDelegate(TailAnimFinished, 0, AnimSeqTemplate, 1.0000000, 0.1000000, 0.1000000, false, true, 0, 0, false, 3);        
    }
    else
    {
        CurUpperBodyAnim = -1;
        TailAnimData.AnimNodeSlot.StopCustomAnim(0.2000000);
    }
    //return;    
}

simulated function IsTailIKBlendingIn()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3B
    if(SpitterTailIkControl.SkelCtrl.BlendTimeToGo <= float(0))
    {
        return false;
    }
    // End:0x76
    if(SpitterTailIkControl.SkelCtrl.StrengthTarget < float(1))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

simulated function IsTailIKBlendingOut()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3B
    if(SpitterTailIkControl.SkelCtrl.BlendTimeToGo <= float(0))
    {
        return false;
    }
    // End:0x76
    if(SpitterTailIkControl.SkelCtrl.StrengthTarget > float(0))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

simulated function IsTailIKBlending()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3B
    if(SpitterTailIkControl.SkelCtrl.BlendTimeToGo > float(0))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function EnableTailIK()
{
    local /*0x97E50000-0x00000000*/ private float BlendInTime[9437185];

    1.0000000
    // End:0x2B
    if(!IsTailIKBlending())
    {
        EnableTailIKInternal(BlendInTime);
    }
    bWantTailIK = true;
    //return;    
}

simulated function DisableTailIK()
{
    local /*0x97E50000-0x00000000*/ private float BlenOutTime[9437185];

    0.5000000
    // End:0x2B
    if(!IsTailIKBlending())
    {
        DisableTailIKInternal(BlenOutTime);
    }
    bWantTailIK = false;
    //return;    
}

simulated function IsTailIKEnabled()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3B
    if(SpitterTailIkControl.SkelCtrl.ControlStrength == float(0))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

private final simulated function EnableTailIKInternal()
{
    local /*0x97E50000-0x00000000*/ private float BlendInTime[9437185];

    1.0000000
    SpitterTailIkControl.SkelCtrl.SetSkelControlActive(true);
    SpitterTailIkControl.SkelCtrl.EffectorLocation = Location + (Vector(Rotation) * float(200));
    SpitterTailIkControl.SkelCtrl.SetSkelControlStrength(1.0000000, BlendInTime);
    //return;    
}

private final simulated function DisableTailIKInternal()
{
    local /*0x97E50000-0x00000000*/ private float BlendOutTime[9437185];

    0.5000000
    SpitterTailIkControl.SkelCtrl.SetSkelControlStrength(0.0000000, BlendOutTime);
    //return;    
}

simulated function DisableTailIKImmediate()
{
    // End:0x99
    if((IsSinglePlayerGame()) && !IsTeenSpitter())
    {
        SpitterTailIkControl.SkelCtrl.SetSkelControlStrength(0.0000000, 0.2500000);
        SpitterTailIkControl.SkelCtrl.SetSkelControlActive(false);
        bWantTailIK = false;
    }
    //return;    
}

simulated event HandleAnimNotifyIKToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609], AnimNodeSeq;
    local /*0x97E50000-0x00000000*/ private editfixedsize array NotifyEvents;
    local /*0x97E50000-0x00000000*/ private float timeBegin, timeEnd, Time;

    // End:0x11
    if(Notify == none)
    {
        return;
    }
    // End:0x15B
    if(Notify.bEnable)
    {
        AnimNodeSeq.AnimSeq.GetNotifies(Class'LPAnimNotify_IKToggle', NotifyEvents);
        // End:0x158
        if(NotifyEvents.Length > 0)
        {
            timeBegin = NotifyEvents[0].Time;
            timeEnd = AnimNodeSeq.AnimSeq.SequenceLength + timeBegin;
            Time = timeEnd - timeBegin;
            // End:0x145
            if(MySpitterController != none)
            {
                MySpitterController.NotifyPreTailIkStart();
            }
            EnableTailIK(Time);
        }        
    }
    else
    {
        DisableTailIKImmediate();
    }
    //return;    
}

simulated function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class SpecialMove[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], MyAnimTree;

    MyAnimTree = super(SPPawn).GetAnimTemplateTreeForSpecialMove(SpecialMove);
    // End:0x39
    if(MyAnimTree != none)
    {
        return MyAnimTree;        
    }
    else
    {
        // End:0x78
        if(ClassIsChildOf(SpecialMove, Class'LPSM_SpitterAttackMoves') || ClassIsChildOf(SpecialMove, Class'LPSM_SpitterAdditiveAttackMove'))
        {
            return AttackAnimTree;            
        }
        else
        {
            return HitReactLogicAnimTree;
        }
    }
    //return ReturnValue;    
}

function FixMinMax()
{
    local /*0x97E50000-0x00000000*/ private float MinTime[25165825], MaxTime;
    local /*0x97E50000-0x00000000*/ private editfixedsize string TuneDataField[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Temp;
    local /*0x97E50000-0x00000000*/ private bool bFixed;

    ""
    bFixed = false;
    // End:0x3E
    if(MinTime < float(0))
    {
        MinTime = 0.0100000;
        bFixed = true;
    }
    // End:0x6A
    if(MaxTime < float(0))
    {
        MaxTime = 0.0100000;
        bFixed = true;
    }
    // End:0xC6
    if(MinTime > MaxTime)
    {
        Temp = MinTime;
        MinTime = MaxTime;
        MaxTime = Temp;
        bFixed = true;
    }
    // End:0xD3
    if(bFixed)
    {
    }
    return bFixed;
    //return ReturnValue;    
}

function FixRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL Range[25165825];
    local /*0x97E50000-0x00000000*/ private editfixedsize string TuneDataField[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Temp;
    local /*0x97E50000-0x00000000*/ private bool bFixed;

    ""
    bFixed = false;
    // End:0xE0
    if(Range.Min > Range.Max)
    {
        Temp = Range.Min;
        Range.Min = Range.Max;
        Range.Max = Temp;
        bFixed = true;
    }
    // End:0xED
    if(bFixed)
    {
    }
    return bFixed;
    //return ReturnValue;    
}

function AssignAttackSelection()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL As[25165825], Tas;
    local /*0x97E50000-0x00000000*/ private editfixedsize string TuneDataField[9437185];
    local /*0x97E50000-0x00000000*/ private float Min, Max;

    ""
    As.DebugName = name(TuneDataField);
    As.bEnableTaunt = Tas.bEnableTaunt;
    Min = Abs(Tas.TimeBetweenAttack_Min.GetValue());
    Max = Abs(Tas.TimeBetweenAttack_Max.GetValue());
    FixMinMax(Min, Max, TuneDataField $ ".TimeBetweenAttack");
    As.TimeBetweenAttack_Min = Min;
    As.TimeBetweenAttack_Max = Max;
    Min = Abs(Tas.TimeBetweenTaunt_Min.GetValue());
    Max = Abs(Tas.TimeBetweenTaunt_Max.GetValue());
    FixMinMax(Min, Max, TuneDataField $ ".TimeBetweenTaunt");
    As.TimeBetweenTaunt_Min = Min;
    As.TimeBetweenTaunt_Max = Max;
    As.TauntDuration = Abs(Tas.TauntDuration.GetValue());
    // End:0x335
    if(Tas.TimeBetweenHunkerAndSpit != none)
    {
        As.TimeBetweenHunkerAndSpit = Abs(Tas.TimeBetweenHunkerAndSpit.GetValue());        
    }
    else
    {
        As.TimeBetweenHunkerAndSpit = 0.0000000;
    }
    // End:0x3CD
    if(Tas.TimeBetweenHunkerAndSting != none)
    {
        As.TimeBetweenHunkerAndSting = Abs(Tas.TimeBetweenHunkerAndSting.GetValue());        
    }
    else
    {
        As.TimeBetweenHunkerAndSting = 0.0000000;
    }
    // End:0x467
    if(Tas.Probablility_Spit != none)
    {
        As.Probablility[0] = Abs(Tas.Probablility_Spit.GetValue());        
    }
    else
    {
        As.Probablility[0] = 0.0000000;
    }
    // End:0x503
    if(Tas.Probablility_TailSting != none)
    {
        As.Probablility[1] = Abs(Tas.Probablility_TailSting.GetValue());        
    }
    else
    {
        As.Probablility[1] = 0.0000000;
    }
    // End:0x5A0
    if(Tas.Probablility_QuickTailSting != none)
    {
        As.Probablility[2] = Abs(Tas.Probablility_QuickTailSting.GetValue());        
    }
    else
    {
        As.Probablility[2] = 0.0000000;
    }
    // End:0x63E
    if(Tas.Probablility_TalonAttack != none)
    {
        As.Probablility[3] = Abs(Tas.Probablility_TalonAttack.GetValue());        
    }
    else
    {
        As.Probablility[3] = 0.0000000;
    }
    // End:0x6DC
    if(Tas.Probablility_QuickTalonAttack != none)
    {
        As.Probablility[4] = Abs(Tas.Probablility_QuickTalonAttack.GetValue());        
    }
    else
    {
        As.Probablility[4] = 0.0000000;
    }
    // End:0x77A
    if(Tas.Probablility_ChargeAttack != none)
    {
        As.Probablility[5] = Abs(Tas.Probablility_ChargeAttack.GetValue());        
    }
    else
    {
        As.Probablility[5] = 0.0000000;
    }
    //return;    
}

simulated function OnSpitterToggleAggressive()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];
    local /*0x97E50000-0x00000000*/ private bool bNewSetting;

    bNewSetting = bAggressiveAttackSelection;
    // End:0x165
    if(Action != none)
    {
        // End:0x6A
        if(Action.InputLinks[0].bHasImpulse)
        {
            bNewSetting = true;            
        }
        else
        {
            // End:0xB0
            if(Action.InputLinks[1].bHasImpulse)
            {
                bNewSetting = false;                
            }
            else
            {
                // End:0xFF
                if(Action.InputLinks[2].bHasImpulse)
                {
                    bNewSetting = !bNewSetting;
                }
            }
        }
        // End:0x165
        if(bNewSetting != bAggressiveAttackSelection)
        {
            bAggressiveAttackSelection = bNewSetting;
            InitTuneDataSpitter();
            // End:0x165
            if(MySpitterController != none)
            {
                MySpitterController.AbortAttack();
            }
        }
    }
    //return;    
}

simulated function SetAttackSelection()
{
    // End:0x1A
    if(bAggressiveAttackSelection)
    {
        SetAggressiveAttackSelection();        
    }
    else
    {
        SetDefaultAttackSelection();
    }
    //return;    
}

simulated function SetDefaultAttackSelection()
{
    // End:0x34C
    if(TuneDataSpitter != none)
    {
        AssignAttackSelection(AttackSelectionPofNotResined, TuneDataSpitter.AttackSelectionPofNotResined, "AttackSelectionPofNotResined");
        AssignAttackSelection(AttackSelectionPofNotResinedSpitDisabled, TuneDataSpitter.AttackSelectionPofNotResinedSpitDisabled, "AttackSelectionPofNotResinedSpitDisabled");
        AssignAttackSelection(AttackSelectionPofNotResinedTailDisabled, TuneDataSpitter.AttackSelectionPofNotResinedTailDisabled, "AttackSelectionPofNotResinedTailDisabled");
        AssignAttackSelection(AttackSelectionPofResined, TuneDataSpitter.AttackSelectionPofResined, "AttackSelectionPofResined");
        AssignAttackSelection(AttackSelectionPofTailBurning, TuneDataSpitter.AttackSelectionPofTailBurning, "AttackSelectionPofTailBurning");
        AssignAttackSelection(AttackSelectionVsNotResined, TuneDataSpitter.AttackSelectionVsNotResined, "AttackSelectionVsNotResined");
        AssignAttackSelection(AttackSelectionVsNotResinedSpitDisabled, TuneDataSpitter.AttackSelectionVsNotResinedSpitDisabled, "AttackSelectionVsNotResinedSpitDisabled");
        AssignAttackSelection(AttackSelectionVsNotResinedTailDisabled, TuneDataSpitter.AttackSelectionVsNotResinedTailDisabled, "AttackSelectionVsNotResinedTailDisabled");
        AssignAttackSelection(AttackSelectionVsResined, TuneDataSpitter.AttackSelectionVsResined, "AttackSelectionVsResined");
        AssignAttackSelection(AttackSelectionVsTailBurning, TuneDataSpitter.AttackSelectionVsTailBurning, "AttackSelectionVsTailBurning");
    }
    //return;    
}

simulated function SetAggressiveAttackSelection()
{
    // End:0x235
    if(TuneDataSpitter != none)
    {
        SetDefaultAttackSelection();
        AssignAttackSelection(AttackSelectionPofNotResined, TuneDataSpitter.AttackSelection_Aggressive_Tail.AttackSelection_PlayerOnFoot, "AttackSelection_Aggressive_Tail.AttackSelection_PlayerOnFoot");
        AssignAttackSelection(AttackSelectionPofNotResinedTailDisabled, TuneDataSpitter.AttackSelection_Aggressive_Without_Tail.AttackSelection_PlayerOnFoot, "AttackSelection_Aggressive_Without_Tail.AttackSelection_PlayerOnFoot");
        AssignAttackSelection(AttackSelectionVsNotResined, TuneDataSpitter.AttackSelection_Aggressive_Tail.AttackSelection_UtilityRig, "AttackSelection_Aggressive_Tail.AttackSelection_UtilityRig");
        AssignAttackSelection(AttackSelectionVsNotResinedTailDisabled, TuneDataSpitter.AttackSelection_Aggressive_Without_Tail.AttackSelection_UtilityRig, "AttackSelection_Aggressive_Without_Tail.AttackSelection_UtilityRig");
    }
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super(LPAIPawnAkrid).InitTuneData(TuneData);
    TuneDataSpitter = LPTuneDataSpitter(TuneData);
    InitTuneDataSpitter();
    //return;    
}

simulated function InitTuneDataSpitter()
{
    bAllowChoreography = true;
    EnableCoreById(1, false);
    EnableCoreById(2, false);
    EnableCoreById(3, false);
    SetAttackSelection();
    StalkSpeedScalePof = Abs(TuneDataSpitter.SpitterStalkSpeedScalePof.GetValue());
    // End:0xAF
    if((StalkSpeedScalePof <= float(0)) || StalkSpeedScalePof > float(1))
    {
        StalkSpeedScalePof = 1.0000000;
    }
    StalkSpeedScaleVs = Abs(TuneDataSpitter.SpitterStalkSpeedScaleVs.GetValue());
    // End:0x122
    if((StalkSpeedScaleVs <= float(0)) || StalkSpeedScaleVs > float(1))
    {
        StalkSpeedScaleVs = 1.0000000;
    }
    AttackSpeedScaleVs = Abs(TuneDataSpitter.SpitterAttackSpeedScaleVs.GetValue());
    // End:0x195
    if((AttackSpeedScaleVs <= float(0)) || AttackSpeedScaleVs > float(1))
    {
        AttackSpeedScaleVs = 1.0000000;
    }
    AttackSpeedScalePof = Abs(TuneDataSpitter.SpitterAttackSpeedScalePof.GetValue());
    // End:0x208
    if((AttackSpeedScalePof <= float(0)) || AttackSpeedScalePof > float(1))
    {
        AttackSpeedScalePof = 1.0000000;
    }
    InitTuneDataSpitAttack(TuneDataSpitter);
    InitTuneDataStingAttack(TuneDataSpitter);
    InitTuneDataTalonAttack(TuneDataSpitter);
    InitTuneDataTailSwingAttack(TuneDataSpitter);
    InitTuneDataReactiveAttack(TuneDataSpitter);
    InitTuneDataHitReaction(TuneDataSpitter);
    InitTuneDataChargeAttack(TuneDataSpitter);
    Seperation_ToBreakOutOfHunkerDown = Abs(TuneDataSpitter.Seperation_ToBreakOutOfHunkerDown.GetValue());
    AngularSeperation_ToBreakOutOfHunkerDown = TuneDataSpitter.AngularSeperation_ToBreakOutOfHunkerDown_Degrees.GetValue();
    AngularSeperation_ToBreakOutOfHunkerDown = Cos(AngularSeperation_ToBreakOutOfHunkerDown * 0.0174533);
    Seperation_ToBreakOutOfHunkerDown_DuringSpit = Abs(TuneDataSpitter.Seperation_ToBreakOutOfHunkerDown_DuringSpit.GetValue());
    AngularSeperation_ToBreakOutOfHunkerDown_DuringSpit = TuneDataSpitter.AngularSeperation_ToBreakOutOfHunkerDown_Degrees_DuringSpit.GetValue();
    AngularSeperation_ToBreakOutOfHunkerDown_DuringSpit = Cos(AngularSeperation_ToBreakOutOfHunkerDown_DuringSpit * 0.0174533);
    InitDamageTracking();
    //return;    
}

simulated function InitTuneDataSpitAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    AttackSeperation_SpitAttackPof.Min = TuneData.AttackSeperation_SpitAttackPof_Min.GetValue();
    AttackSeperation_SpitAttackPof.Max = TuneData.AttackSeperation_SpitAttackPof_Max.GetValue();
    FixRange(AttackSeperation_SpitAttackPof, "AttackSeperation_SpitAttackPof");
    Duration_SpitAttackPof_Max = TuneData.Duration_SpitAttackPof_Max.GetValue();
    Duration_SpitAttackPof_Min = TuneData.Duration_SpitAttackPof_Min.GetValue();
    FixMinMax(Duration_SpitAttackPof_Min, Duration_SpitAttackPof_Max, "Duration_SpitAttackPof");
    AttackSeperation_SpitAttackVs.Min = TuneData.AttackSeperation_SpitAttackVs_Min.GetValue();
    AttackSeperation_SpitAttackVs.Max = TuneData.AttackSeperation_SpitAttackVs_Max.GetValue();
    FixRange(AttackSeperation_SpitAttackVs, "AttackSeperation_SpitAttackVs");
    Duration_SpitAttackVs_Max = TuneData.Duration_SpitAttackVs_Max.GetValue();
    Duration_SpitAttackVs_Min = TuneData.Duration_SpitAttackPof_Min.GetValue();
    FixMinMax(Duration_SpitAttackVs_Min, Duration_SpitAttackVs_Max, "Duration_SpitAttackVs");
    RateOfFire_Delay = 1.0000000 / TuneData.RateOfFire_SpitAttack.GetValue();
    TimeBetween_ResinBreakAndSpitAttack = TuneData.TimeBetween_ResinBreakAndSpitAttack.GetValue();
    // End:0x3AE
    if(TimeBetween_ResinBreakAndSpitAttack < float(0))
    {
        TimeBetween_ResinBreakAndSpitAttack = 0.0000000;        
    }
    else
    {
        // End:0x3CF
        if(TimeBetween_ResinBreakAndSpitAttack > float(10))
        {
            TimeBetween_ResinBreakAndSpitAttack = 10.0000000;
        }
    }
    ErrorInAiming_Min = TuneData.ErrorInAimingInUnrealUnits_Min.GetValue();
    ErrorInAiming_Max = TuneData.ErrorInAimingInUnrealUnits_Min.GetValue();
    FixMinMax(ErrorInAiming_Min, ErrorInAiming_Max, "ErrorInAimingInUnrealUnits");
    AimingErrorCorrectionSpeed = Abs(TuneData.AimingErrorCorrectionInMeteresPerSecond.GetValue()) * float(100);
    // End:0x4EA
    if(AimingErrorCorrectionSpeed < float(100))
    {
        AimingErrorCorrectionSpeed = 100.0000000;
    }
    ErrorInAimingVS_Min = TuneData.ErrorInAimingInUnrealUnits_VS_Min.GetValue();
    ErrorInAimingVS_Max = TuneData.ErrorInAimingInUnrealUnits_VS_Max.GetValue();
    FixMinMax(ErrorInAimingVS_Min, ErrorInAimingVS_Max, "ErrorInAimingInUnrealUnits_VS");
    AimingErrorCorrectionSpeedVS = Abs(TuneData.AimingErrorCorrectionInMeteresPerSecondVS.GetValue()) * float(100);
    // End:0x608
    if(AimingErrorCorrectionSpeedVS < float(100))
    {
        AimingErrorCorrectionSpeedVS = 100.0000000;
    }
    DamagePerSecondFromSpit = Abs(TuneData.DamagePerSecondFromSpit.GetValue());
    DamagePerSecondFromSpit_VS = Abs(TuneData.DamagePerSecondFromSpit_VS.GetValue());
    AcidPool_Delay = 1.0000000 / TuneData.AcidPoolMaxPerSecond.GetValue();
    //return;    
}

simulated function InitTuneDataStingAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];
    local /*0x97E50000-0x00000000*/ private float Min, Max;

    AttackSeperation_TailStingPof.Min = TuneData.AttackSeperation_TailStingPof_Min.GetValue();
    AttackSeperation_TailStingPof.Max = TuneData.AttackSeperation_TailStingPof_Max.GetValue();
    FixRange(AttackSeperation_TailStingPof, "AttackSeperation_TailStingPof");
    AttackSeperation_TailStingVs.Min = TuneData.AttackSeperation_TailStingVs_Min.GetValue();
    AttackSeperation_TailStingVs.Max = TuneData.AttackSeperation_TailStingVs_Max.GetValue();
    FixRange(AttackSeperation_TailStingVs, "AttackSeperation_TailStingVs");
    TailStingForwardArcDot = TuneData.TailStingForwardArcInDegrees.GetValue();
    TailStingForwardArcDot = TailStingForwardArcDot * 0.0174533;
    TailStingForwardArcDot = Cos(TailStingForwardArcDot);
    // End:0x2F0
    if(bAggressiveAttackSelection)
    {
        Min = Abs(TuneData.Aggressive_Overrides.QuickTailSting.RepeatCount_Min.GetValue());
        Max = Abs(TuneData.Aggressive_Overrides.QuickTailSting.RepeatCount_Max.GetValue());        
    }
    else
    {
        Min = Abs(TuneData.TailStingQuick_RepeatCount_Min.GetValue());
        Max = Abs(TuneData.TailStingQuick_RepeatCount_Max.GetValue());
    }
    FixMinMax(Min, Max, "TailStingQuick_RepeatCount");
    TailStingQuick_RepeatCount_Min = int(Min);
    TailStingQuick_RepeatCount_Max = int(Max);
    //return;    
}

simulated function InitTuneDataTalonAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];
    local /*0x97E50000-0x00000000*/ private float Min, Max;

    AttackSeperation_TalonAttackPof.Min = TuneData.AttackSeperation_TalonAttackPof_Min.GetValue();
    AttackSeperation_TalonAttackPof.Max = TuneData.AttackSeperation_TalonAttackPof_Max.GetValue();
    FixRange(AttackSeperation_TalonAttackPof, "AttackSeperation_TalonAttackPof");
    AttackSeperation_TalonAttackReactivePof.Min = TuneData.AttackSeperation_TalonAttackReactivePof_Min.GetValue();
    AttackSeperation_TalonAttackReactivePof.Max = TuneData.AttackSeperation_TalonAttackReactivePof_Max.GetValue();
    FixRange(AttackSeperation_TalonAttackReactivePof, "AttackSeperation_TalonAttackReactivePof");
    AttackSeperation_TalonAttackVs.Min = TuneData.AttackSeperation_TalonAttackVs_Min.GetValue();
    AttackSeperation_TalonAttackVs.Max = TuneData.AttackSeperation_TalonAttackVs_Max.GetValue();
    FixRange(AttackSeperation_TalonAttackVs, "AttackSeperation_TalonAttackVs");
    TalonAttackForwardArcDot = TuneData.TalonAttackForwardArcInDegrees.GetValue();
    TalonAttackForwardArcDot = TalonAttackForwardArcDot * 0.0174533;
    TalonAttackForwardArcDot = Cos(TalonAttackForwardArcDot);
    Min = Abs(TuneData.TalonAttackQuick_RepeatCount_Min.GetValue());
    Max = Abs(TuneData.TalonAttackQuick_RepeatCount_Max.GetValue());
    FixMinMax(Min, Max, "TalonAttackQuick_RepeatCount");
    TalonAttackQuick_RepeatCount_Min = int(Min);
    TalonAttackQuick_RepeatCount_Max = int(Max);
    //return;    
}

simulated function InitTuneDataTailSwingAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    AttackSeperation_TailSwing.Min = -1000000.0000000;
    AttackSeperation_TailSwing.Max = Abs(TuneData.AttackSeperation_TailSwing_Max.GetValue());
    FixRange(AttackSeperation_TailSwing, "AttackSeperation_TailSwing");
    TimeBetween_TailSwing_Min = Abs(TuneData.TimeBetween_TailSwing_Min.GetValue());
    TimeBetween_TailSwing_Max = Abs(TuneData.TimeBetween_TailSwing_Max.GetValue());
    FixMinMax(TimeBetween_TailSwing_Min, TimeBetween_TailSwing_Max, "TimeBetween_TailSwing_Max");
    TailSwingRearDot = Abs(TuneData.TailSwingRearArcInDegrees.GetValue()) * 0.0174533;
    Class'SPEngine.SPUtil'.static.NormalizeRadian(TailSwingRearDot);
    TailSwingRearDot = 3.1415930 - TailSwingRearDot;
    TailSwingRearDot = Cos(TailSwingRearDot);
    //return;    
}

simulated function InitTuneDataReactiveAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TimeBetween_ReactiveTailSting_Min = TuneData.TimeBetween_ReactiveTailSting_Min.GetValue();
    TimeBetween_ReactiveTailSting_Max = TuneData.TimeBetween_ReactiveTailSting_Max.GetValue();
    FixMinMax(TimeBetween_ReactiveTailSting_Min, TimeBetween_ReactiveTailSting_Max, "TimeBetween_ReactiveTailSting");
    TimeBetween_ReactiveTalonAttack_Min = TuneData.TimeBetween_ReactiveTalonAttack_Min.GetValue();
    TimeBetween_ReactiveTalonAttack_Max = TuneData.TimeBetween_ReactiveTalonAttack_Max.GetValue();
    FixMinMax(TimeBetween_ReactiveTalonAttack_Min, TimeBetween_ReactiveTalonAttack_Max, "TimeBetween_ReactiveTalonAttack");
    //return;    
}

simulated function InitTuneDataChargeAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    AttackSeperation_ChargeAttackPof.Min = TuneData.MinDistanceAwayToTryChargeAttack.GetValue();
    AttackSeperation_ChargeAttackPof.Max = (TuneData.MinDistanceAwayToTryChargeAttack.GetValue() * TuneData.MinDistanceAwayToTryChargeAttack.GetValue()) * TuneData.MinDistanceAwayToTryChargeAttack.GetValue();
    FixRange(AttackSeperation_ChargeAttackPof, "AttackSeperation_ChargeAttackPof");
    //return;    
}

simulated function InitTuneDataHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    DamageForBreakingTailAttack = Abs(TuneData.DamageForBreakingTailAttack.GetValue());
    DamageWindowInSecondsForBreakingTailAttack = Abs(TuneData.DamageWindowInSecondsForBreakingTailAttack.GetValue());
    HealthThresoldToDismemberTail = Abs(TuneData.PercentageDamageToDismemberTail.GetValue()) / float(100);
    // End:0xE6
    if(HealthThresoldToDismemberTail > float(1))
    {
        HealthThresoldToDismemberTail = 1.0000000;
    }
    HealthThresoldToDismemberTail *= float(HealthMax);
    //return;    
}

function InitDamageTracking()
{
    local /*0x97E50000-0x00000000*/ private int DamageTrackingEntries;

    DamageTrackingEntries = int(DamageWindowInSecondsForBreakingTailAttack * float(10));
    // End:0x73
    if(DamageTrackingEntries > 0)
    {
        DamageTracking.DamageEntry.Add(DamageTrackingEntries);        
        DamageTracking.LastEntry = -1;
    }
    //return;    
}

function AddToDamageTracking()
{
    local /*0x97E50000-0x00000000*/ private float DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private bool bCore[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreID[9437185];

    -1
    super(LPAIPawn).AddToDamageTracking(DamageAmount, bCore, CoreID);
    // End:0x52
    if(CoreID == 0)
    {
        AccumulatedCoreDamageDuringPhase += DamageAmount;
    }
    //return;    
}

function HaveAccumulatedDamageForTailReaction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float DamageAmount;

    // End:0x7C
    if((int(WorldInfo.NetMode) == int(NM_Standalone)) && IsDoingSpitAttack(true))
    {
        return AccumulatedCoreDamageDuringPhase > TuneDataSpitter.DamageForBreakingSpitAttack.GetValue();        
    }
    else
    {
        DamageAmount = GetDamageFromDamageTrackerForCore(DamageWindowInSecondsForBreakingTailAttack, 0);
        // End:0xB3
        if(DamageAmount > DamageForBreakingTailAttack)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function UpdateTailTwitch()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x14
    if(!bEnableTailTwitch)
    {
        return;        
    }
    else
    {
        // End:0x54
        if(MySpitterController != none)
        {
            // End:0x54
            if(!MySpitterController.IsTailBurning())
            {
                EnableTailTwitch(false);
                return;
            }
        }
    }
    TimeUntilNextTailTwitch -= DeltaTime;
    // End:0x84
    if(!IsAllowedToTailBurnTwitch())
    {
        StopAdditiveTailTwitch();
        return;
    }
    // End:0x93
    if(IsAdditiveTailTwitchPlaying())
    {
        return;
    }
    // End:0xA6
    if(TimeUntilNextTailTwitch > float(0))
    {
        return;
    }
    PlayAdditiveTailTwitch();
    //return;    
}

simulated function EnableTailTwitch()
{
    local /*0x97E50000-0x00000000*/ private bool bInEnableTailTwitch[8388609];

    bEnableTailTwitch = bInEnableTailTwitch;
    // End:0x31
    if(bEnableTailTwitch)
    {
        SetWinchPointEnabledByIndex(0, true);        
    }
    else
    {
        StopAdditiveTailTwitch();
        SetWinchPointEnabledByIndex(0, false);
    }
    //return;    
}

simulated function IsAllowedToTailBurnTwitch()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(IsStunned())
    {
        return false;
    }
    // End:0x57
    if((IsDoingSpecialMove_OF_Class(Class'LPSM_DirectionalHitReaction') || IsDoingSpecialMove_OF_Class(Class'LPSM_ActiveDefenseFollower')) || IsDoingSpecialMove_OF_Class(Class'LPSM_SpitterWinched'))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

simulated function IsAdditiveTailTwitchPlaying()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bIsTailTwitching;
    //return ReturnValue;    
}

simulated function StopAdditiveTailTwitch()
{
    local /*0x97E50000-0x00000000*/ private float inTime[9437185];

    0.5000000
    // End:0x51
    if(bIsTailTwitching)
    {
        AdditiveAnimInfo_TailTwitch.AnimNodeSlot.StopCustomAnim(inTime);
    }
    bIsTailTwitching = false;
    TimeUntilNextTailTwitch = 0.0000000;
    //return;    
}

simulated function PlayAdditiveTailTwitch()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate, PlayingSeq;
    local /*0x97E50000-0x00000000*/ private float Min, Max;

    // End:0x1B8
    if(!IsAdditiveTailTwitchPlaying())
    {
        bIsTailTwitching = true;
        AnimSeqTemplate = AnimTemplateLogic_TailTwitch.GetBestSequenceTemplate(self);
        PlayingSeq = AdditiveAnimInfo_TailTwitch.AnimNodeSlot.PlayCustomSequenceWithDelegate(AdditiveTailTwitchStopped, 0, AnimSeqTemplate, 1.0000000, 0.2500000, 0.5000000, false, true, 0, 0, false, 3);
        Min = Abs(TuneDataSpitter.MinTimeBetweenTailTwitch.GetValue());
        Max = Abs(TuneDataSpitter.MaxTimeBetweenTailTwitch.GetValue());
        TimeUntilNextTailTwitch = RandRange(Min, Max);
        TimeUntilNextTailTwitch += PlayingSeq.AnimSeq.SequenceLength;
        PlayingSeq.SetIssueAnimFinishedCallbackOnInterruption(true);
    }
    //return;    
}

simulated function AdditiveTailTwitchStopped()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[9437185];
    local /*0x97E50000-0x00000000*/ private int InUserData[9437185];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[9437185];

    none
    0
    false
    bIsTailTwitching = false;
    //return;    
}

function NotifyTakeHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation;
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[8388609], DamageCauser;
    local /*0x97E50000-0x00000000*/ private int CoreIndex;
    local /*0x97E50000-0x00000000*/ private float PrevHealth;

    // End:0x20E
    if(TakeDamageParams.Damage > 0)
    {
        CoreIndex = GetCoreIndexForThisCoreId(0);
        // End:0x11F
        if(CoreIndex >= 0)
        {
            MyCoreData[CoreIndex].Health = float(Health);
            MyCoreData[CoreIndex].MaxHealth = float(HealthMax);
            PrevHealth = float(Health + TakeDamageParams.Damage);
            CoreTookDamage(MyCoreData[CoreIndex].PhysMatPropTag, CoreIndex, PrevHealth);
        }
        // End:0x20E
        if((float(Health) < HealthThresoldToDismemberTail) && !ReplicatedTailStatus.bPartDismembered)
        {
            // End:0x20E
            if(((IsSinglePlayerGame()) && !IsTeenSpitter()) || TuneDataSpitter.bCanDamageTailCoreInMutiplayer)
            {
                bTailBreakHitReactionRequired = true;
                StartTailDestruction();
                LPAIControllerSpitter(Controller).NotifyTailDestroyed();
                TriggerEventClass(Class'LPSeqEvent_SpitterTailDestroyed', TakeDamageParams.InstigatedBy);
            }
        }
    }
    super(Pawn).NotifyTakeHit(InstigatedBy, HitLocation, Damage, DamageType, Momentum, DamageCauser);
    //return;    
}

function TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    // End:0x63
    if(LPAIControllerSpitter(InstigatedBy) == none)
    {
        super.TakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    }
    //return;    
}

function AdjustDamage()
{
    local /*0x97E50000-0x00000000*/ private int InDamage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[25165825], InstigatedBy, HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser, CoreTag, Mat;
    local /*0x97E50000-0x00000000*/ private bool bHitSpitHole;

    super(LPAIPawn).AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    // End:0xA2
    if((ClassIsChildOf(DamageType, Class'LPDamageTypeFreeze') || ClassIsChildOf(DamageType, Class'LPDamageTypeSpitterAcid')) || ClassIsChildOf(DamageType, Class'LPDamageTypeSpitterTailExplosion'))
    {
        InDamage = 0;
        return;
    }
    // End:0xBC
    if(ClassIsChildOf(DamageType, Class'LPDamageTypeVSMelee'))
    {
        return;
    }
    // End:0xF0
    if((IsTailDestroyed()) && ClassIsChildOf(DamageType, Class'LPDamageTypeVSWelderDOT'))
    {
        InDamage = 0;
        return;
    }
    Mat = LPPhysicalMaterial(HitInfo.PhysMaterial);
    // End:0x1AC
    if(Mat != none)
    {
        CoreTag = LPPhysMatPropTag_SpitterCoreId(Mat.GetTag(Class'LPPhysMatPropTag_SpitterCoreId'));
        // End:0x1AC
        if((CoreTag != none) && CoreTag.GetCoreId() == 3)
        {
            bHitSpitHole = true;
        }
    }
    // End:0x215
    if(bHitSpitHole)
    {
        // End:0x212
        if(!(ClassIsChildOf(DamageType, Class'LPDamageTypeVSWelder') || ClassIsChildOf(DamageType, Class'LPDamageTypeVSWelderDOT')) || ClassIsChildOf(DamageType, Class'LPDamageTypeVSDrill'))
        {
            InDamage = 0;
        }        
    }
    else
    {
        // End:0x249
        if((CoreTag == none) && !CanTakeNonCoreDamage(DamageType))
        {
            InDamage = 0;
        }
    }
    //return;    
}

simulated function DestroySpitHole()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo;

    HitInfo.PhysMaterial = SpitHolePhysMat;
    TakeDamage(100000, none, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypeVSWelder', HitInfo);
    //return;    
}

simulated event CoreDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool hide[9437185];

    false
    super(LPAIPawn).CoreDestroyed(CoreTag, CoreIndex, hide);
    //return;    
}

simulated event DismemberPart()
{
    local /*0x97E50000-0x00000000*/ private name BoneName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Impulse[9437185], HitLocation;
    local /*0x97E50000-0x00000000*/ private bool bVelChange[9437185];

    DoTailDestruction();
    //return;    
}

event AnimDismemberPart()
{
    local /*0x97E50000-0x00000000*/ private @NULL NotifyDismember[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex;
    local /*0x97E50000-0x00000000*/ private float PrevHealth;

    // End:0x1FB
    if((float(Health) >= HealthThresoldToDismemberTail) && !ReplicatedTailStatus.bPartDismembered)
    {
        PrevHealth = float(Health);
        Health = int(HealthThresoldToDismemberTail - float(1));
        CoreIndex = GetCoreIndexForThisCoreId(0);
        // End:0x136
        if(CoreIndex >= 0)
        {
            MyCoreData[CoreIndex].Health = float(Health);
            MyCoreData[CoreIndex].MaxHealth = float(HealthMax);
            CoreTookDamage(MyCoreData[CoreIndex].PhysMatPropTag, CoreIndex, PrevHealth);
        }
        // End:0x1FB
        if(((IsSinglePlayerGame()) && !IsTeenSpitter()) || TuneDataSpitter.bCanDamageTailCoreInMutiplayer)
        {
            bTailBreakHitReactionRequired = true;
            StartTailDestruction();
            LPAIControllerSpitter(Controller).NotifyTailDestroyed();
            TriggerEventClass(Class'LPSeqEvent_SpitterTailDestroyed', SpecialMoveState.CurSMInfo.InteractionActor);
        }
    }
    //return;    
}

function DebugStartTailDestruction()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo;
    local /*0x97E50000-0x00000000*/ private float DamageRequired;

    // End:0xBD
    if(!ReplicatedTailStatus.bPartDismembered)
    {
        DamageRequired = float(Health) - HealthThresoldToDismemberTail;
        // End:0xBD
        if(DamageRequired > float(0))
        {
            HitInfo.PhysMaterial = PrimaryCorePhysMat;
            TakeDamage(int(DamageRequired + float(1)), none, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypeBallistic', HitInfo);
        }
    }
    //return;    
}

function DebugDropHealthByPct()
{
    local /*0x97E50000-0x00000000*/ private float Pct[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo;
    local /*0x97E50000-0x00000000*/ private float DamageRequired;

    Pct = Pct / float(100);
    DamageRequired = float(Health) - (float(Health) * Pct);
    // End:0xC1
    if(DamageRequired > float(0))
    {
        HitInfo.PhysMaterial = PrimaryCorePhysMat;
        TakeDamage(int(DamageRequired + float(1)), none, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypeBallistic', HitInfo);
    }
    //return;    
}

function DebugSpitterDie()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo;

    HitInfo.PhysMaterial = PrimaryCorePhysMat;
    TakeDamage(Health + 1, none, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypeBallistic', HitInfo);
    //return;    
}

function DebugSpitPof()
{
    // End:0x2E
    if(MySpitterController != none)
    {
        MySpitterController.CmdSpitStrikePofDebug();
    }
    //return;    
}

function StartTailDestruction()
{
    ReplicatedTailStatus.bPartDismembered = true;
    SetGrabPointDestroyedByIndex(1, true);
    SetGrabPointDestroyedByIndex(0, false);
    // End:0x70
    if(!BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_HandleDismemberment, self, 0))
    {
        DoTailDestruction();
    }
    //return;    
}

simulated function DoTailDestruction()
{
    local /*0x97E50000-0x00000000*/ private @NULL pos;

    ReplicatedTailStatus.TimeDismembered = WorldInfo.TimeSeconds;
    ReplicatedTailStatus.bCoreDestroyed = true;
    ReplicatedTailStatus.bPartDismembered = true;
    Mesh.HideBoneByName('JO_Tail_dtch', 2);
    SpitterTailClass.static.CreateInstance(self);
    pos = Mesh.GetBoneLocation('JO_Tail_dtch');
    DoTailDetatchExplosion(pos);
    //return;    
}

function DebugStartSpitHoleBurn()
{
    DestroySpitHole();
    //return;    
}

function IsTailDestroyed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x22
    if(ReplicatedTailStatus.bPartDismembered)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function DoTailDetatchExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL ExplosionLoc[8388609], explosionActor;

    // End:0x1BF
    if(TuneDataSpitter.TailDismemberExplosionTemplate != none)
    {
        explosionActor = Spawn(Class'LPExplosionActor',,, ExplosionLoc, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
        // End:0x1BF
        if(explosionActor != none)
        {
            explosionActor.TheWeaponThatSpawnedMe = self;
            explosionActor.Instigator = self;
            explosionActor.InstigatorController = Controller;
            explosionActor.bDrawDebug = TuneDataSpitter.bDebugDrawTailDismemberExplosion;
            explosionActor.ExplosionPhysMaterial = ((Mesh.PhysMaterialOverride != none) ? SPPhysicalMaterial(Mesh.PhysMaterialOverride) : none);
            explosionActor.Explode(TuneDataSpitter.TailDismemberExplosionTemplate);
        }
    }
    //return;    
}

function DebugHobble()
{
    MySpitterController.CmdSpitterHobble();
    //return;    
}

simulated event IsStunned()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bIsStunned;

    bIsStunned = IsDoingSpecialMove_OF_Class(Class'LPSM_SpitterStunBase') || IsGrabbed();
    return bIsStunned;
    //return ReturnValue;    
}

simulated function IsGrabbed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return IsDoingSpecialMove_OF_Class(Class'LPSM_ForkArmGrabVictim_Base');
    //return ReturnValue;    
}

simulated function IsInInterrupibleTailAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bInterruptible;

    bInterruptible = ((((IsDoingSpitAttack()) || IsDoingSpecialMove_OF_Class(Class'LPSM_SpitterTailStingTell')) || IsDoingSpecialMove_OF_Class(Class'LPSM_SpitterAttackTailStingIn')) || IsDoingSpecialMove_OF_Class(Class'LPSM_SpitterAttackTailStingQuickIn')) || IsDoingSpecialMove_OF_Class(Class'LPSM_SpitterAttackTailStingQuickOut');
    return bInterruptible;
    //return ReturnValue;    
}

simulated function IsDoingSpitAttack()
{
    local /*0x97E50000-0x00000000*/ private bool bOnlyHold[9437185], ReturnValue;

    return (!bOnlyHold && IsDoingSpecialMove_OF_Class(Class'LPSM_SpitterSpitAttack')) || IsDoingSpecialMove_OF_Class(Class'LPSM_SpitterSpitAttackHold');
    //return ReturnValue;    
}

simulated function CanCoreDamageInterruptTailAttack()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (HitCoreIndex == 0) && !ClassIsChildOf(TypeOfDamage, Class'LPDamageTypeVSWelderDOT');
    //return ReturnValue;    
}

simulated function RestoreLegCores()
{
    ResetCoreHealthByCoreID(1);
    ResetCoreHealthByCoreID(2);
    //return;    
}

function StartDie()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];

    GrabPoints[0].bEnabledForFreeGrab = false;
    // End:0x4A
    if(WantsToPlayDieAnim(DamageType))
    {
        PlayDyingSpecialMove(Class'LPSM_SpitterDie');
    }
    super(LPAIPawn).StartDie(DamageType, HitLoc);
    //return;    
}

simulated event Destroyed()
{
    CleanupSpitterMaterialParameters();
    super.Destroyed();
    //return;    
}

simulated function CreateDupicateMICFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL OriginalMIC[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], MIC;

    MIC = new (none) Class'Engine.MaterialInstanceConstant';
    // End:0x80
    if(MIC != none)
    {
        MIC.SetParent(OriginalMIC);
        Mesh.SetMaterial(Idx, MIC);
    }
    return MIC;
    //return ReturnValue;    
}

simulated function InitSpitterMaterialParameter()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL MI, MIC;

    I = 0;
    J0x0B:

    // End:0x179 [Loop If]
    if(true)
    {
        MI = Mesh.GetMaterial(I);
        // End:0x173
        if(MI != none)
        {
            MIC = MaterialInstanceConstant(MI);
            // End:0x165
            if(MIC != none)
            {
                // End:0x165
                if(MIC.Name == 'Spitter_mat_DamageEmbers_INST')
                {
                    SpitterMaterialParameter.MICOriginal = MIC;
                    MIC = CreateDupicateMICFor(MIC, I);
                    SpitterMaterialParameter.MIC = MIC;
                    SpitterMaterialParameter.ParameterName = 'Damage_Factor';
                    SpitterMaterialParameter.matidx = I;
                }
            }
            ++I;            
        }
        else
        {
            // [Explicit Break]
            goto J0x179;
        }
        // [Loop Continue]
        goto J0x0B;
    }
    J0x179:

    ResetSpitterMaterialParameters();
    //return;    
}

simulated function GetSpitterMaterialParameterValueForCurrentHealth()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], CurrentHealth, Value, ModifiedMaximumHealth, Factor;

    Factor = TuneDataSpitter.PercentageOfHealthToUseAsMaxForTailDamageTexture.GetValue() / float(100);
    // End:0x79
    if((Factor < float(0)) || Factor > 1.0000000)
    {
        Factor = 1.0000000;
    }
    ModifiedMaximumHealth = Factor * float(HealthMax);
    CurrentHealth = float(Health);
    // End:0xCE
    if(CurrentHealth < float(0))
    {
        CurrentHealth = 0.0000000;
    }
    Value = 1.0000000 - (CurrentHealth / float(HealthMax));
    Value = Value * (float(HealthMax) / ModifiedMaximumHealth);
    // End:0x140
    if(Value > float(1))
    {
        Value = 1.0000000;
    }
    return Value;
    //return ReturnValue;    
}

simulated function ResetSpitterMaterialParameters()
{
    local /*0x97E50000-0x00000000*/ private float Target;

    // End:0xB5
    if((SpitterMaterialParameter.MIC != none) && SpitterMaterialParameter.matidx > -1)
    {
        Target = GetSpitterMaterialParameterValueForCurrentHealth();
        SpitterMaterialParameter.MIC.SetScalarParameterValue(SpitterMaterialParameter.ParameterName, Target);
    }
    //return;    
}

simulated function CleanupSpitterMaterialParameters()
{
    // End:0x132
    if((SpitterMaterialParameter.MIC != none) && SpitterMaterialParameter.matidx > -1)
    {
        Mesh.SetMaterial(SpitterMaterialParameter.matidx, SpitterMaterialParameter.MICOriginal);
        SpitterMaterialParameter.MIC.SetParent(none);
        SpitterMaterialParameter.MIC = none;
        SpitterMaterialParameter.MICOriginal = none;
        SpitterMaterialParameter.matidx = -1;
    }
    //return;    
}

simulated function UpdateBodyDamage()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], Target, Current;

    // End:0x10C
    if((SpitterMaterialParameter.MIC != none) && SpitterMaterialParameter.matidx > -1)
    {
        SpitterMaterialParameter.MIC.GetScalarParameterValue(SpitterMaterialParameter.ParameterName, Current);
        Target = GetSpitterMaterialParameterValueForCurrentHealth();
        SpitterMaterialParameter.MIC.SetScalarParameterValue(SpitterMaterialParameter.ParameterName, Target);
    }
    //return;    
}

simulated function SetCSA()
{
    local /*0x97E50000-0x00000000*/ private byte eNewCsa[9437185];

    0
    // End:0xFC
    if(int(eNewCsa) != int(CurrentCSA))
    {
        CurrentCSA = eNewCsa;
        switch(eNewCsa)
        {
            // End:0x7C
            case 1:
                UseContextSensitiveAnimObject(TuneDataSpitter.AttackPofCSA, 0.5000000);
                // End:0xFC
                break;
            // End:0xB1
            case 2:
                UseContextSensitiveAnimObject(TuneDataSpitter.AttackVsCSA, 0.5000000);
                // End:0xFC
                break;
            // End:0xE6
            case 3:
                UseContextSensitiveAnimObject(TuneDataSpitter.StalkCSA, 0.5000000);
                // End:0xFC
                break;
            // End:0xFFFF
            default:
                UseContextSensitiveAnimObject(none, 0.5000000);
                // End:0xFC
                break;
                break;
        }
    }
    //return;    
}

simulated function GetCurrentCSA()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x45
    if(ContextSensitiveAnimInfo.CurrentCSA == TuneDataSpitter.AttackPofCSA)
    {
        return 1;        
    }
    else
    {
        // End:0x8A
        if(ContextSensitiveAnimInfo.CurrentCSA == TuneDataSpitter.AttackVsCSA)
        {
            return 2;            
        }
        else
        {
            // End:0xCF
            if(ContextSensitiveAnimInfo.CurrentCSA == TuneDataSpitter.StalkCSA)
            {
                return 3;                
            }
            else
            {
                return 0;
            }
        }
    }
    //return ReturnValue;    
}

simulated event @NULL SpitParticleCreateSystem()
{
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689], ThePool, PSComp, PS;
    local /*0x97E50000-0x00000000*/ private int I;

    PSComp = none;
    PS = TuneDataSpitter.SpitParticleSystem[0];
    // End:0x1DE
    if(PS != none)
    {
        ThePool = SPEmitterPool(WorldInfo.MyEmitterPool);
        PSComp = ThePool.SPSpawnEmitterMeshAttachment(PS, Mesh, 'SpitPoint', true);
        // End:0xEB
        if(PSComp != none)
        {
            PSComp.ActivateSystem();
        }
        // End:0x13F
        if(PSComp.__OnSystemFinished__Delegate != none)
        {
            __OldParticleSystemFinishedDelegate__Delegate = PSComp.OnSystemFinished;
        }
        PSComp.__OnSystemFinished__Delegate = CleanUpParticleSystem;
        I = 0;
        J0x17A:

        // End:0x1DE [Loop If]
        if(I < PSComp.EmitterInstances.Length)
        {
            PSComp.SetKillOnDeactivate(I, true);
            ++I;
            // [Loop Continue]
            goto J0x17A;
        }
    }
    return PSComp;
    //return ReturnValue;    
}

simulated event @NULL CleanUpParticleSystem()
{
    local /*0x97E50000-0x00000400*/ private @NULL PSComp[8388609];

    // End:0x92
    if(PSComp != none)
    {
        PSComp.__OnSystemFinished__Delegate = OldParticleSystemFinishedDelegate;
        PSComp.OnSystemFinished(PSComp);
        // End:0x92
        if(SpitParticleSystem == PSComp)
        {
            SpitParticleSystem = none;
        }
    }
    //return;    
}

simulated event SpitParticleSetBeamTarget()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL Source;

    // End:0xEB
    if(SpitParticleSystem != none)
    {
        Mesh.GetSocketWorldLocationAndRotation('SpitPoint', Source);
        I = 0;
        J0x4D:

        // End:0xEB [Loop If]
        if(I < SpitParticleSystem.EmitterInstances.Length)
        {
            SpitParticleSystem.SetBeamSourcePoint(I, Source, 0);
            SpitParticleSystem.SetBeamEndPoint(I, SpitFxTargetPosition);
            ++I;
            // [Loop Continue]
            goto J0x4D;
        }
    }
    //return;    
}

simulated event UpdateSpitTarget()
{
    // End:0x9B
    if(TargetedPawn != none)
    {
        // End:0x71
        if(TargetedSocket != 'None')
        {
            TargetedPawn.Mesh.GetSocketWorldLocationAndRotation(TargetedSocket, TargetPosition);            
        }
        else
        {
            TargetPosition = TargetedPawn.GetProjectileTargetPosition(self);
        }
    }
    SpitFxTargetPosition = TargetPosition;
    //return;    
}

function CanSpitAt()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetLoc[8388609];
    local /*0x97E50000-0x00000000*/ private float minDot[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Origin, Rot, DirToTarget, TailDir;
    local /*0x97E50000-0x00000000*/ private float dotprod;

    0.9900000
    Mesh.GetSocketWorldLocationAndRotation('SpitPoint', Origin, Rot);
    DirToTarget = TargetLoc - Origin;
    DirToTarget = Normal(DirToTarget);
    TailDir = Vector(Rot);
    dotprod = DirToTarget Dot TailDir;
    // End:0xC3
    if(dotprod <= minDot)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

simulated function SetSpitFinishTime()
{
    local /*0x97E50000-0x00000000*/ private float inTime[8388609];

    SpitFinishTime = inTime;
    //return;    
}

simulated event DoSpitDamageAndEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL Impact[25165825];
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    ElapsedTimeForSpitDamage += DeltaTime;
    // End:0x9E
    if(SpitDamageStartTime <= WorldInfo.TimeSeconds)
    {
        SpitDamageStartTime = WorldInfo.TimeSeconds + RateOfFire_Delay;
        ApplySpitDamageAndEffects(Impact, ElapsedTimeForSpitDamage);
        ElapsedTimeForSpitDamage = 0.0000000;
    }
    //return;    
}

simulated function ApplySpitDamageAndEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL Impact[25165825];
    local /*0x97E50000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PhysMat;
    local /*0x97E50000-0x00000000*/ private float Damage;
    local /*0x97E50000-0x00000000*/ private class SpitDamageType;

    // End:0x23
    if(bSpitCanFreezeTarget)
    {
        SpitDamageType = Class'LPDamageTypeFreeze';        
    }
    else
    {
        SpitDamageType = Class'LPDamageTypeSpitterAcid';
    }
    // End:0x325
    if((ElapsedTime > float(0)) && Impact.HitActor != none)
    {
        PhysMat = SPPhysicalMaterial(Impact.HitInfo.PhysMaterial);
        // End:0x158
        if(PhysMat != none)
        {
            PhysMat.PlayImpactEffects(Impact.HitActor, Impact.HitInfo, Impact.HitLocation, Impact.HitNormal, SpitDamageType);
        }
        // End:0x303
        if(int(Role) == int(ROLE_Authority))
        {
            // End:0x18B
            if(bSpitCanFreezeTarget)
            {
                Damage = 1.0000000;                
            }
            else
            {
                // End:0x1D7
                if(LPVSPlayerPawn(Impact.HitActor) != none)
                {
                    Damage = DamagePerSecondFromSpit_VS * ElapsedTime;                    
                }
                else
                {
                    Damage = DamagePerSecondFromSpit * ElapsedTime;
                }
            }
            // End:0x248
            if(LPPawn(Impact.HitActor) != none)
            {
                LastTimePawnDamagedBySpitAttack = WorldInfo.TimeSeconds;
            }
            Impact.HitActor.SPTakeDamageFractional(Damage, Controller, Impact.HitLocation, Impact.RayDir * Damage, SpitDamageType, Impact.HitInfo, self, RateOfFire_Delay + float(1));
        }
        // End:0x325
        if(!bSpitCanFreezeTarget)
        {
            GenerateAcidPoolFromImpact(Impact);
        }
    }
    //return;    
}

function GenerateAcidPoolFromImpact()
{
    local /*0x97E50000-0x00000000*/ private @NULL Impact[25165825];

    // End:0x3A
    if((int(WorldInfo.NetMode) != int(NM_Standalone)) || IsTeenSpitter())
    {
        return;
    }
    // End:0x13E
    if((TuneDataSpitter.AcidPoolEnabled && int(Role) == int(ROLE_Authority)) && NextAcidPoolGenerationTime < WorldInfo.TimeSeconds)
    {
        // End:0x13E
        if(!ClassIsChildOf(Impact.HitActor.Class, Class'LPPawn'))
        {
            NextAcidPoolGenerationTime = WorldInfo.TimeSeconds + AcidPool_Delay;
            ClassAcidPool.static.CreateInstance(self, Impact);
        }
    }
    //return;    
}

simulated function SetSpitTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609];

    // End:0x62
    if(Target != none)
    {
        TargetedPawn = LPPawn(Target);
        TargetPosition = Target.Location;
        SpitMode = 0;        
    }
    else
    {
        TargetedPawn = none;
    }
    //return;    
}

simulated function StartSpitting()
{
    local /*0x97E50000-0x00000000*/ private float SpittingDuration[9437185];

    -1.0000000
    SetSpitState(2);
    // End:0x59
    if(SpittingDuration > float(0))
    {
        SetSpitFinishTime(WorldInfo.TimeSeconds + SpittingDuration);
    }
    //return;    
}

simulated function StopSpitting()
{
    local /*0x97E50000-0x00000000*/ private bool bContinueAiming[8388609];

    // End:0x1C
    if(bContinueAiming)
    {
        SetSpitState(1);        
    }
    else
    {
        SetSpitState(0);
    }
    //return;    
}

simulated function SetSpitTargetPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL InTargetPosition[8388609];

    SpitMode = 0;
    TargetedPawn = none;
    TargetPosition = InTargetPosition;
    //return;    
}

function ClearReactiveSpitTimers()
{
    ClearTimer('EnableReactiveSpit', self);
    ClearTimer('DisableReactiveSpit', self);
    //return;    
}

function IsSpitting()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(SpitParticleSystem != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function StartReactiveSpit()
{
    local /*0x97E50000-0x00000000*/ private float Delay[9437185];

    0.0000000
    // End:0x75
    if(int(SpitState) != int(2))
    {
        // End:0x75
        if(!IsTimerActive('EnableReactiveSpit', self))
        {
            ClearReactiveSpitTimers();
            // End:0x5E
            if(Delay <= float(0))
            {
                EnableReactiveSpit();                
            }
            else
            {
                SetTimer(Delay, false, 'EnableReactiveSpit', self);
            }
        }
    }
    //return;    
}

function StopReactiveSpit()
{
    local /*0x97E50000-0x00000000*/ private float Delay[9437185];

    0.0000000
    // End:0x75
    if(int(SpitState) == int(2))
    {
        // End:0x75
        if(!IsTimerActive('DisableReactiveSpit', self))
        {
            ClearReactiveSpitTimers();
            // End:0x5E
            if(Delay <= float(0))
            {
                DisableReactiveSpit();                
            }
            else
            {
                SetTimer(Delay, false, 'DisableReactiveSpit', self);
            }
        }
    }
    //return;    
}

function EnableReactiveSpit()
{
    SpitMode = 1;
    StartSpitting();
    TargetedPawn = none;
    //return;    
}

function DisableReactiveSpit()
{
    SetSpitTarget(none);
    StopSpitting(false);
    //return;    
}

simulated function SetAiming()
{
    local /*0x97E50000-0x00000000*/ private bool bAiming[8388609];

    // End:0x1C
    if(bAiming)
    {
        SetSpitState(1);        
    }
    else
    {
        SetSpitState(0);
    }
    //return;    
}

simulated function SetSpitState()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];

    // End:0x12
    if(IsInState('Dying'))
    {
        return;
    }
    switch(NewState)
    {
        // End:0x5D
        case 0:
            // End:0x5A
            if(IsInState('SpittingState') || IsInState('Aiming'))
            {
                GotoState('None');
            }
            // End:0xC1
            break;
        // End:0x85
        case 2:
            // End:0x82
            if(!IsInState('SpittingState'))
            {
                GotoState('SpittingState');
            }
            // End:0xC1
            break;
        // End:0xBE
        case 1:
            // End:0xBB
            if(!IsTailIKEnabled() || !IsInState('Aiming'))
            {
                GotoState('Aiming');
            }
            // End:0xC1
            break;
        // End:0xFFFF
        default:
            break;
    }
    SpitState = NewState;
    //return;    
}

simulated function PassThruCheckVision()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(LPTotemDeployableShieldEmitter(HitActor) != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function PassThruCheckAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function GetSpitCollision()
{
    local /*0x97E50000-0x00000000*/ private @NULL Origin[8388609], Target, Info;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> ExtraPassThroughCB[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    Info.HitActor = Class'SPGameFramework.SPGFWeapon'.static.WeaponTrace(Class'SPEngine.SPUtil'.static.GetDefaultWeaponClass(), self, Info.HitLocation, Info.HitNormal, Target, Origin,, Info.HitInfo, ExtraPassThroughCB);
    // End:0xF1
    if(Info.HitActor == none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

simulated function GetSpitCollisionVisual()
{
    local /*0x97E50000-0x00000000*/ private @NULL Origin[8388609], Target, Info;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    Info.HitActor = Class'SPGameFramework.SPGFWeapon'.static.WeaponTrace(Class'SPEngine.SPUtil'.static.GetDefaultWeaponClass(), self, Info.HitLocation, Info.HitNormal, Target, Origin,, Info.HitInfo, PassThruCheckVision);
    // End:0xF8
    if(Info.HitActor == none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

simulated function SpitUpdate()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

simulated function UpdateIK()
{
    // End:0x5D
    if((IsTailIKEnabled()) != bWantTailIK)
    {
        // End:0x43
        if(bWantTailIK)
        {
            // End:0x40
            if(!IsTailIKBlendingOut())
            {
                EnableTailIKInternal();
            }            
        }
        else
        {
            // End:0x5D
            if(!IsTailIKBlendingIn())
            {
                DisableTailIKInternal();
            }
        }
    }
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(LPPawn).Tick(DeltaTime);
    UpdateIK();
    SpitUpdate(DeltaTime);
    UpdateTailTwitch(DeltaTime);
    UpdateBodyDamage(DeltaTime);
    //return;    
}

function LineSweepHitTesterDoDamageAndEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL DmgInfo[25296897];

    // End:0x3E
    if(MySpitterController.AllowLineSweepHitTesterDamage(DmgInfo))
    {
        super(SPAIPawn).LineSweepHitTesterDoDamageAndEffects(DmgInfo);
    }
    //return;    
}

function LineSweepHitTesterDoPendingDamageAndEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL DmgInfo[25296897];

    LineSweepHitTesterDoDamageAndEffects(DmgInfo);
    //return;    
}

simulated function IsTaunting()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Ctrl;

    Ctrl = LPAIControllerSpitter(Controller);
    // End:0x4B
    if(Ctrl != none)
    {
        return Ctrl.IsTaunting();
    }
    return false;
    //return ReturnValue;    
}

event HandleNotifyPlayerDodgeWindow()
{
    local /*0x97E50000-0x00000000*/ private byte AttackType[8388609], DodgePhase;
    local /*0x97E50000-0x00000000*/ private @NULL InEnemyToNotify[8388609];

    // End:0x108
    if(!IsTaunting())
    {
        // End:0x32
        if(int(DodgePhase) == int(0))
        {
            bInDodgeWindow = true;            
        }
        else
        {
            bInDodgeWindow = false;
            MySpitterController.NotifyDodgeWindowClosed();
        }
        // End:0xA0
        if(int(AttackType) == int(20))
        {
            // End:0x94
            if(int(DodgePhase) == int(0))
            {
                bTalonDodgeWindow = true;                
            }
            else
            {
                bTalonDodgeWindow = false;
            }
        }
        // End:0xE3
        if(int(AttackType) == int(17))
        {
            // End:0xD7
            if(int(DodgePhase) == int(0))
            {
                bTailDodgeWindow = true;                
            }
            else
            {
                bTailDodgeWindow = false;
            }
        }
        super(LPAIPawn).HandleNotifyPlayerDodgeWindow(AttackType, DodgePhase, InEnemyToNotify);
    }
    //return;    
}

simulated function ForceCloseDodgeWindows()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemyToNotify[8388609];

    // End:0x27
    if(bTailDodgeWindow)
    {
        HandleNotifyPlayerDodgeWindow(17, 1, InEnemyToNotify);        
    }
    else
    {
        // End:0x4B
        if(bTalonDodgeWindow)
        {
            HandleNotifyPlayerDodgeWindow(20, 1, InEnemyToNotify);
        }
    }
    //return;    
}

function DebugAttackSpitOnly()
{
    SetExclusiveAttack(0);
    //return;    
}

function DebugAttackTailStingOnly()
{
    SetExclusiveAttack(1);
    //return;    
}

function DebugAttackTailStingQuickOnly()
{
    SetExclusiveAttack(2);
    //return;    
}

function DebugAttackTalonOnly()
{
    SetExclusiveAttack(3);
    //return;    
}

function DebugAttackTalonQuickOnly()
{
    SetExclusiveAttack(4);
    //return;    
}

function DebugAttackChargeOnly()
{
    SetExclusiveAttack(5);
    //return;    
}

function DebugAttackNormal()
{
    SetExclusiveAttack();
    //return;    
}

function DebugAttackReactiveOnly()
{
    // End:0x2E
    if(MySpitterController != none)
    {
        MySpitterController.DebugAttackReactiveOnly();
    }
    //return;    
}

function SetExclusiveAttack()
{
    local /*0x97E50000-0x00000000*/ private int InAttack[9437185];

    -1
    // End:0x40
    if(MySpitterController != none)
    {
        MySpitterController.SetExclusiveAttack(InAttack);
    }
    //return;    
}

simulated function StartAdditiveFireAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    AnimSeqTemplate = ATL_FiringCycle.GetBestSequenceTemplate(self);
    AdditiveAnimInfo.AnimNodeSlot.PlayCustomSequenceWithDelegate(None, 0, AnimSeqTemplate, 1.0000000, 0.0000000, 0.0000000, true, false, 0, 0, false, 3);
    //return;    
}

simulated function StartAdditiveTailHitWhileSpittingAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    // End:0x4B
    if(((IsTeenSpitter()) || ATL_HitWhileSpitting == none) || int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return;
    }
    AnimSeqTemplate = ATL_HitWhileSpitting.GetBestSequenceTemplate(self);
    ReplicatePlayAdditiveAnimationSequence(AnimSeqTemplate, None, 0, 1.0000000, 0.0000000, 0.0000000, false, false);
    //return;    
}

simulated function StopAdditiveFireAnimation()
{
    AdditiveAnimInfo.AnimNodeSlot.StopCustomAnim(0.2500000);
    //return;    
}

function ShouldUseDeadReckoningForBurstFire()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function HaveLosForSpitAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[8388609], EnemyForTest;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return HaveLosForSpitAttackGivenFirePoint(self, FromLocation, ApproximateRelativeFirePoint, EnemyForTest);
    //return ReturnValue;    
}

static function HaveLosForSpitAttackGivenFirePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL Spitter[8388609], FromLocation, RelativeFirePoint, EnemyForTest;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Origin, Direction, Target, Info;

    Target = EnemyForTest.Location;
    Direction = Target - FromLocation;
    Direction.Z = 0.0000000;
    Direction = Normal(Direction);
    Origin = (RelativeFirePoint >> Rotator(Direction)) + FromLocation;
    // End:0x114
    if(Spitter == none)
    {
        // End:0x111
        if(SpitGetCollision(Origin, Target, Info, 150.0000000))
        {
            // End:0x111
            if(Info.HitActor != EnemyForTest)
            {
                return false;
            }
        }        
    }
    else
    {
        // End:0x17D
        if(Spitter.GetSpitCollisionVisual(Origin, Target, Info))
        {
            // End:0x17D
            if(Info.HitActor != EnemyForTest)
            {
                return false;
            }
        }
    }
    return true;
    //return ReturnValue;    
}

simulated function IsAdditiveTalonPushPlaying()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bIsTalonPushing;
    //return ReturnValue;    
}

simulated function StopAdditiveTalonPush()
{
    local /*0x97E50000-0x00000000*/ private float inTime[9437185];

    0.5000000
    // End:0x51
    if(bIsTalonPushing)
    {
        AdditiveAnimInfo_TalonPush.AnimNodeSlot.StopCustomAnim(inTime);
    }
    bIsTalonPushing = false;
    //return;    
}

simulated function PlayAdditiveTalonPush()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate, PlayingSeq;

    // End:0xD4
    if(!IsAdditiveTalonPushPlaying())
    {
        bIsTalonPushing = true;
        AnimSeqTemplate = AnimTemplateLogic_TalonPush.GetBestSequenceTemplate(self);
        PlayingSeq = AdditiveAnimInfo_TalonPush.AnimNodeSlot.PlayCustomSequenceWithDelegate(AdditiveTalonPushStopped, 0, AnimSeqTemplate, 1.0000000, 0.2500000, 0.5000000, false, true, 0, 0, false, 3);
        PlayingSeq.SetIssueAnimFinishedCallbackOnInterruption(true);
    }
    //return;    
}

simulated function AdditiveTalonPushStopped()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[9437185];
    local /*0x97E50000-0x00000000*/ private int InUserData[9437185];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[9437185];

    none
    0
    false
    bIsTalonPushing = false;
    TimeOfLastTalonPush = WorldInfo.TimeSeconds;
    //return;    
}

function DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];

    super(LPAIPawn).DrawDebug(InHUD);
    //return;    
}

simulated function IsTeenSpitter()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated state Aiming
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        EnableTailIK();
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextState[8388609];

        TargetedPawn = none;
        // End:0x2D
        if(NextState != 'SpittingState')
        {
            DisableTailIK();
        }
        //return;        
    }
    stop;    
}

simulated state SpittingState
{
    simulated function @NULL StartSpitAudio()
    {
        local /*0x97E50000-0x00000400*/ private @NULL AC;

        AC = TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('SpitterSpitLoop', 'None', self, Mesh, none);
        AddAudioComponent(AC, 'SpitterSpitLoop');
        //return;        
    }

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextState[8388609];

        EndSpitUpdate();
        // End:0x43
        if(SpitParticleSystem != none)
        {
            SpitParticleSystem.DeactivateSystem();
            SpitParticleSystem = none;
        }
        // End:0x65
        if(NextState != 'Aiming')
        {
            DisableTailIK();
        }
        RemoveAudioComponent('SpitterSpitLoop');
        TuneDataPawnSoundEventBindings.PlayEventSoundLocally('SpitterSpitLoopEnd', 'None', self, none, none);
        // End:0xC6
        if(ATL_FiringCycle != none)
        {
            StopAdditiveFireAnimation();
        }
        ElapsedTimeForSpitDamage = 0.0000000;
        //return;        
    }

    simulated function EndSpitUpdate()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Origin, Rot, Target, Info;

        Mesh.GetSocketWorldLocationAndRotation('SpitPoint', Origin, Rot);
        Target = (Normal(TargetPosition - Origin) * float(10000)) + Origin;
        // End:0xEA
        if(GetSpitCollision(Origin, Target, Info, PassThruCheckAttack))
        {
            SpitFxTargetPosition = Info.HitLocation;
            ApplySpitDamageAndEffects(Info, ElapsedTimeForSpitDamage);
        }
        SpitFinishTime = 0.0000000;
        //return;        
    }

    simulated function NotifyCmdOfSpitStart()
    {
        // End:0x2E
        if(MySpitterController != none)
        {
            MySpitterController.NotifyCmdOfSpitStart();
        }
        //return;        
    }

    simulated function SpitUpdate()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL Origin, Direction, Rot, Target, Info;

        // End:0x11
        if(SpitParticleSystem == none)
        {
            return;
        }
        // End:0x2C
        if(ElapsedTimeForSpitDamage == float(0))
        {
            NotifyCmdOfSpitStart();
        }
        Mesh.GetSocketWorldLocationAndRotation('SpitPoint', Origin, Rot);
        // End:0xBC
        if(int(SpitMode) == int(0))
        {
            UpdateSpitTarget();
            Target = (Normal(TargetPosition - Origin) * float(10000)) + Origin;            
        }
        else
        {
            DisableTailIKImmediate();
            Direction = Vector(Rot);
            Target = (Direction * float(10000)) + Origin;
        }
        // End:0x1E5
        if((((int(WorldInfo.NetMode) != int(NM_Standalone)) || SpitFinishTime > WorldInfo.TimeSeconds) || IsTeenSpitter()) && GetSpitCollision(Origin, Target, Info, PassThruCheckAttack))
        {
            SpitFxTargetPosition = Info.HitLocation;
            DoSpitDamageAndEffects(Info, DeltaTime);
        }
        // End:0x201
        if(SpitParticleSystem != none)
        {
            SpitParticleSetBeamTarget();            
        }
        //return;        
    }
Begin:

    // End:0x19
    if(ATL_FiringCycle != none)
    {
        StartAdditiveFireAnimation();
    }
    // End:0x68
    if((IsTeenSpitter()) || int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        Sleep(RandRange(0.7000000, 1.2000000));
    }
    // End:0x8B
    if(SpitParticleSystem == none)
    {
        SpitParticleSystem = SpitParticleCreateSystem();
    }
    SpitDamageStartTime = WorldInfo.TimeSeconds;
    Class'SPEngine.SPUtil'.static.DoNothing(none);
    StartSpitAudio();
    ElapsedTimeForSpitDamage = 0.0000000;
    stop;                
}

defaultproperties
{
    MinTimeBetweenEnemySightedTaunt=90.0000000
    TailAnimTemplateData=/* Array type was not detected. */
    TailAnimData=(AnimNodeSlotName="UpperBodySlotNode",AnimNodeSlot=none)
    CurUpperBodyAnim=-1
    bAllowChoreography=true
    SpitterTailIkControl=(SkelCtrl=none,BoneName="JO_Tail_M")
    SpitterMaterialParameter=(MIC=none,MICOriginal=none,matidx=-1,ParameterName="DamageFactor")
    AdditiveAnimInfo_TailTwitch=(AnimNodeSlotName="AdditiveSlotNode_TailTwitch",AnimNodeSlot=none)
    AdditiveAnimInfo_TalonPush=(AnimNodeSlotName="AdditiveSlotNode_TalonPush",AnimNodeSlot=none)
    DamageTypeChargeHit=Class'LPDamageTypeCrabChargeStrike'
    DamageTypeChargeBrush=Class'LPDamageTypeCrabChargeBrush'
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnSpitter.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnSpitter.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnSpitter.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnSpitter.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnSpitter.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnSpitter.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnSpitter.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnSpitter.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnSpitter.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnSpitter.FaceAudioComponent'
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
    Components[9]=FXActionManagerDefObj0
    // Reference: SPDamageStateComponent'Default__LPAIPawnSpitter.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj class=Class'SPEngine.SPDamageStateComponent'
    end object
    Components[10]=DamageStateComponentDefObj
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnSpitter.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
    SupportedEvents=/* Array type was not detected. */
}