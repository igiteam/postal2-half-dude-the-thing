class LPHiveSpawnPoint extends LPPawnSpawnPoint
    config(AI)
    hidecategories(AnimDependency,Navigation);

enum EHiveState
{
    EHiveState_Uninitialized,       // 0
    EHiveState_Idle,                // 1
    EHiveState_PreBirth,            // 2
    EHiveState_Birthing,            // 3
    EHiveState_PostBirth,           // 4
    EHiveState_Dying,               // 5
    EHiveState_Dead,                // 6
    EHiveState_Pining,              // 7
    EHiveState_EatingGrenade,       // 8
    EHiveState_InternalGrenadeExplosion,// 9
    EHiveState_MAX                  // 10
};

struct native HiveReplicatedAnimationStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLooping;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimationName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Rate;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BlendIn;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BlendOut;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RepCounter;

    structdefaultproperties
    {
        bLooping=false
        AnimationName="None"
        Rate=0.0000000
        BlendIn=0.0000000
        BlendOut=0.0000000
        RepCounter=0
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel HiveReplicatedAnimationStruct ReplicatedAnimationInfo[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel HiveReplicatedAnimationStruct ReplicatedAdditiveAnimationInfo[2097153];
var(0.25_Pct) /*0x7FF00000-0x00000000*/ private float AttackRadius[65537];
var(0.25_Pct) /*0x7FF00000-0x00000000*/ private bool bRegenerateAfterDeath[65537];
var(0.25_Pct) /*0x7FF00000-0x00000000*/ private bool bBlockAfterDeath[65537];
var(0.25_Pct) /*0x7FF00000-0x00000000*/ private bool bWallSpawner[65537];
var(0.25_Pct) /*0x7FF00000-0x00000000*/ private bool bFallAfterSpawning[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAvailableForSpawning;
var(0.25_Pct) /*0x21DB0000-0x00000000*/ private bool bUseCinematicInitialAnims[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGodMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDiedByInternalGrenade[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLoadingCheckpoint;
var(0.25_Pct) /*0x2C200000-0x00000000*/ private bool bHiveSpLogging[1073807361];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private bool bHiveSpLogToWindow[1073807361];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private bool bFlushHiveSpLogEachLine[1073807361];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDNATagged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWasDNATagged;
var(0.25_Pct) /*0x7FF00000-0x00000000*/ private float FallImpulseStrengthMin[65537];
var(0.25_Pct) /*0x7FF00000-0x00000000*/ private float FallImpulseStrengthMax[65537];
var(0.25_Pct) /*0x7FF00000-0x00000000*/ private float FallingAIDelayTime[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private const export @NULL DrawSphere[655361];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HiveTuneData;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private const export @NULL AttackRangeCylinder[655361];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPHiveSpawnPoint.EHiveState HiveState[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int DamageTaken[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int Health[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxHealth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeWhenNextRangeAttackValid;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyBaby;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL IdleSoundCue;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL IdleSoundComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL VisibleMesh[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL LightingComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BabySpawnOffset;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BabySpawnRotation;
var(0.25_Pct) /*0x21DB0000-0x00000000*/ private float IdleTimeBeforeReturningToInitial[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SpawnCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CosAngRangeInFrontOfGrenadeFinalDestinationSocketToAllowAssist[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RangeSqFromGrenadeFinalDestinationSocketToStartAssist[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CosAngRangeToAllowGrenadeStick[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array GrenadesStuckToHive[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentGrenExploding[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ExplosionRadialBlur[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RadialBlurFadeTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RadialBlurFadeTimeRemaining[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RadialBlurMaxBlurAmount[536870913];
var(0.25_Pct) /*0x2AB20000-0x00000000*/ private @NULL PhysMatShell[65537];
var(0.25_Pct) /*0x2AB20000-0x00000000*/ private @NULL PhysMatCore[65537];
var(0.25_Pct) /*0x2AB20000-0x00000000*/ private @NULL PhysMatLeaf01[65537];
var(0.25_Pct) /*0x2AB20000-0x00000000*/ private @NULL PhysMatLeaf02[65537];
var(0.25_Pct) /*0x2AB20000-0x00000000*/ private @NULL PhysMatLeaf03[65537];
var(0.25_Pct) /*0x2AB20000-0x00000000*/ private @NULL PhysMatLeaf04[65537];
var(0.25_Pct) /*0x2AB20000-0x00000000*/ private @NULL PhysMatLeaf05[65537];
var(0.25_Pct) /*0x2AB20000-0x00000000*/ private @NULL PhysMatLeaf06[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ShellDamageComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SphincterBurnLength;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SphincterBurnStart;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SphincterBurnCurrent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DeadPhysicalMaterial;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name LastUsedAnimName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastAnimSeq;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HiveSpLogFile[536870913];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private editfixedsize array HiveSpLogFilter[1073807361];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumTimesTagged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TaggedTime;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL DNAParticles[524289];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnAnimationFinishedDelegate__Delegate;

// Export ULPHiveSpawnPoint::execGetOverallDamageFactor(FFrame&, void* const)
native final simulated function GetOverallDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPHiveSpawnPoint::execGetSphincterBurnFactor(FFrame&, void* const)
native final simulated function GetSphincterBurnFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPHiveSpawnPoint::execGetSphincterDeathFactor(FFrame&, void* const)
native final simulated function GetSphincterDeathFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

simulated event GetMasterTuneDataReference()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return HiveTuneData;
    //return ReturnValue;    
}

simulated function InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super(Actor).InitTuneData(TuneData);
    HiveTuneData = LPTuneDataHiveSpawnPoint(TuneData);
    // End:0x257
    if(HiveTuneData != none)
    {
        Health = HiveTuneData.Health;
        MaxHealth = Health;
        // End:0x11F
        if(HiveTuneData.RangeAttackDistance >= float(0))
        {
            AttackRadius = HiveTuneData.RangeAttackDistance;
            CylinderComponent(CollisionComponent).SetCylinderSize(AttackRadius, CylinderComponent(CollisionComponent).CollisionHeight);
        }
        Class'SPEngine.SPUtil'.static.SetHalfCosAngRange(HiveTuneData.AngleInDegreesInFrontOfGrenadeFinalDestinationSocketToAllowAssist.GetValue(), CosAngRangeInFrontOfGrenadeFinalDestinationSocketToAllowAssist);
        RangeSqFromGrenadeFinalDestinationSocketToStartAssist = HiveTuneData.RangeFromGrenadeFinalDestinationSocketToStartAssist.GetValue() * HiveTuneData.RangeFromGrenadeFinalDestinationSocketToStartAssist.GetValue();
        Class'SPEngine.SPUtil'.static.SetHalfCosAngRange(HiveTuneData.AngleInDegreesToAllowGrenadeStick.GetValue(), CosAngRangeToAllowGrenadeStick);
        bDiedByInternalGrenade = false;
    }
    //return;    
}

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25165825];

    super(SPPawnSpawnPoint).CreateCheckpointRecord(Record);
    Record.HiveState = int(HiveState);
    Record.DamageTaken = DamageTaken;
    Record.Health = Health;
    Record.SpawnCount = SpawnCount;
    Record.SphincterBurnCurrent = SphincterBurnCurrent;
    Record.LastUsedAnimName = LastUsedAnimName;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25296897];

    super(SPPawnSpawnPoint).ApplyCheckpointRecord(Record);
    HiveState = byte(Record.HiveState);
    DamageTaken = Record.DamageTaken;
    Health = Record.Health;
    SpawnCount = Record.SpawnCount;
    SphincterBurnCurrent = Record.SphincterBurnCurrent;
    LastUsedAnimName = Record.LastUsedAnimName;
    bLoadingCheckpoint = true;
    ChangeHiveState(HiveState);
    bLoadingCheckpoint = false;
    //return;    
}

simulated function @NULL GetMesh()
{
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689];

    return VisibleMesh;
    //return ReturnValue;    
}

simulated function @NULL GetShellDamageComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689];

    return ShellDamageComponent;
    //return ReturnValue;    
}

simulated function @NULL SetShellDamageComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL Comp[8388609];

    ShellDamageComponent = Comp;
    //return;    
}

simulated function PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL SpawnOffset, SpawnRot;
    local /*0x97E50000-0x00000000*/ private bool bOk;

    SetCollision(true, true);
    RemovePhysicalMaterialOverride();
    CylinderComponent(CollisionComponent).SetCylinderSize(AttackRadius, CylinderComponent(CollisionComponent).CollisionHeight);
    TimeWhenNextRangeAttackValid = 0.0000000;
    VisibleMesh.SetHidden(false);
    bOk = VisibleMesh.GetSocketWorldLocationAndRotation('SpawnPoint', SpawnOffset, SpawnRot);
    // End:0x11B
    if(bOk)
    {
        BabySpawnOffset = SpawnOffset - Location;
        BabySpawnRotation = SpawnRot;
    }
    PlayHiveAnimation(false, HiveTuneData.AnimSeqNames.Closing);
    GotoState('Idle');
    Health = MaxHealth;
    DamageTaken = 0;
    MyBaby = none;
    SphincterBurnCurrent = 0.0000000;
    bLoadingCheckpoint = false;
    //return;    
}

simulated function Reset()
{
    // End:0x32
    if(MyBaby != none)
    {
        MyBaby.Destroy();
        MyBaby = none;
    }
    ClearTimer('PerformDelayedRangeAttack');
    ClearTimer('AkridIsFree');
    ClearTimer('PiningTimedOut');
    ClearTimer('ResetSpawnCount');
    VisibleMesh.SetHidden(false);
    SetCollision(true, true);
    RemovePhysicalMaterialOverride();
    TimeWhenNextRangeAttackValid = 0.0000000;
    PlayHiveAnimation(false, HiveTuneData.AnimSeqNames.Closing);
    GotoState('Idle');
    Health = MaxHealth;
    DamageTaken = 0;
    MyBaby = none;
    SphincterBurnCurrent = 0.0000000;
    bLoadingCheckpoint = false;
    super(SPPawnSpawnPoint).Reset();
    //return;    
}

simulated event Destroyed()
{
    // End:0x32
    if(MyBaby != none)
    {
        MyBaby.Destroy();
        MyBaby = none;
    }
    // End:0x8F
    if(ExplosionRadialBlur != none)
    {
        ExplosionRadialBlur.SetBlurScale(0.0000000);
        ExplosionRadialBlur.DetachFromAny();
        ExplosionRadialBlur = none;
    }
    // End:0xC8
    if(DNAParticles != none)
    {
        DNAParticles.DeactivateSystem();
        DNAParticles = none;
    }
    ClearTimer('PerformDelayedRangeAttack');
    ClearTimer('AkridIsFree');
    ClearTimer('PiningTimedOut');
    ClearTimer('ResetSpawnCount');
    super(Actor).Destroyed();
    //return;    
}

simulated event PawnSpawnedAtPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609], AIC;

    // End:0x13D
    if(int(Role) == int(ROLE_Authority))
    {
        MyBaby = P;
        MyBaby.SetPhysics(4);
        // End:0x81
        if(LPAIPawn(MyBaby) != none)
        {
            LPAIPawn(MyBaby).SetGettingBirthedStarted();
        }
        AIC = SPAIController(P.Controller);
        // End:0x13D
        if((AIC != none) && LPAIPawn(MyBaby).TuneDataAIPawn.bDisableAllAiWhileSpawningFromHive.GetValue() != float(0))
        {
            AIC.ForceDisableAI();
        }
    }
    GotoState('PreBirth');
    //return;    
}

simulated function ChangeHiveState()
{
    local /*0x97E50000-0x00000000*/ private byte State[8388609];

    switch(State)
    {
        // End:0x18
        case 0:
        // End:0x2E
        case 6:
            GotoState('Dead');
            // End:0xE1
            break;
        // End:0x44
        case 1:
            GotoState('Idle');
            // End:0xE1
            break;
        // End:0x5A
        case 2:
            GotoState('PreBirth');
            // End:0xE1
            break;
        // End:0x70
        case 3:
            GotoState('Birthing');
            // End:0xE1
            break;
        // End:0x86
        case 4:
            GotoState('PostBirth');
            // End:0xE1
            break;
        // End:0x9C
        case 5:
            GotoState('Dying');
            // End:0xE1
            break;
        // End:0xB2
        case 7:
            GotoState('Pining');
            // End:0xE1
            break;
        // End:0xC8
        case 8:
            GotoState('EatingGrenade');
            // End:0xE1
            break;
        // End:0xDE
        case 9:
            GotoState('InternalGrenadeExplosion');
            // End:0xE1
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x2D
    if(VarName == 'HiveState')
    {
        ChangeHiveState(HiveState);        
    }
    else
    {
        // End:0xDE
        if(VarName == 'ReplicatedAdditiveAnimationInfo')
        {
            PlayAdditiveHiveAnimation(ReplicatedAdditiveAnimationInfo.bLooping, ReplicatedAdditiveAnimationInfo.AnimationName, ReplicatedAdditiveAnimationInfo.Rate, ReplicatedAdditiveAnimationInfo.BlendIn, ReplicatedAdditiveAnimationInfo.BlendOut);            
        }
        else
        {
            super(Actor).ReplicatedEvent(VarName);
        }
    }
    //return;    
}

simulated event UnTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];

    super(Actor).UnTouch(Other);
    //return;    
}

simulated event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    super(Actor).Touch(Other, OtherComp, HitLocation, HitNormal);
    //return;    
}

function OnToggleGodMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bGodMode = true;        
    }
    else
    {
        // End:0x8C
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bGodMode = false;            
        }
        else
        {
            bGodMode = !bGodMode;
        }
    }
    //return;    
}

simulated event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL PlayerCtrl;

    // End:0x540
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x41
        if(ClassIsChildOf(DamageType, Class'LPDamageTypeDNATag'))
        {
            ConditionalAttachDNATag(HitLocation);
        }
        // End:0x75
        if((LPAIPawn(DamageCauser) != none) || LPHiveSpawnPoint(DamageCauser) != none)
        {
            return;
        }
        // End:0x84
        if(bGodMode)
        {
            return;
        }
        PlayerCtrl = LPPlayerController(EventInstigator);
        // End:0xE2
        if((PlayerCtrl != none) && PlayerCtrl.bSemiDukeMode)
        {
            DamageAmount = 10000;
        }
        // End:0x19A
        if(HiveTuneData != none)
        {
            Idx = Class'SPEngine.SPUtil'.static.GetFilteredDamageFactorIndex(HiveTuneData.DamageFilterInfo, DamageType);
            // End:0x19A
            if(Idx > -1)
            {
                DamageAmount *= HiveTuneData.DamageFilterInfo[Idx].DamageFactor;
            }
        }
        // End:0x53E
        if(DamageAmount > 0)
        {
            DamageTaken += DamageAmount;
            // End:0x513
            if(Health > 0)
            {
                Health -= DamageAmount;
                // End:0x24C
                if(HitInfo.PhysMaterial == PhysMatLeaf01)
                {
                    PlayAdditiveHiveAnimation(false, HiveTuneData.AnimSeqNames.HitReactionLeaf01);                    
                }
                else
                {
                    // End:0x2B8
                    if(HitInfo.PhysMaterial == PhysMatLeaf02)
                    {
                        PlayAdditiveHiveAnimation(false, HiveTuneData.AnimSeqNames.HitReactionLeaf02);                        
                    }
                    else
                    {
                        // End:0x324
                        if(HitInfo.PhysMaterial == PhysMatLeaf03)
                        {
                            PlayAdditiveHiveAnimation(false, HiveTuneData.AnimSeqNames.HitReactionLeaf03);                            
                        }
                        else
                        {
                            // End:0x390
                            if(HitInfo.PhysMaterial == PhysMatLeaf04)
                            {
                                PlayAdditiveHiveAnimation(false, HiveTuneData.AnimSeqNames.HitReactionLeaf04);                                
                            }
                            else
                            {
                                // End:0x3FC
                                if(HitInfo.PhysMaterial == PhysMatLeaf05)
                                {
                                    PlayAdditiveHiveAnimation(false, HiveTuneData.AnimSeqNames.HitReactionLeaf05);                                    
                                }
                                else
                                {
                                    // End:0x468
                                    if(HitInfo.PhysMaterial == PhysMatLeaf06)
                                    {
                                        PlayAdditiveHiveAnimation(false, HiveTuneData.AnimSeqNames.HitReactionLeaf06);                                        
                                    }
                                    else
                                    {
                                        // End:0x4D4
                                        if(HitInfo.PhysMaterial == PhysMatShell)
                                        {
                                            PlayAdditiveHiveAnimation(false, HiveTuneData.AnimSeqNames.HitReactionShell);                                            
                                        }
                                        else
                                        {
                                            PlayAdditiveHiveAnimation(false, HiveTuneData.AnimSeqNames.HitReactionCore);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            // End:0x53B
            if(Health <= 0)
            {
                Health = 0;
                GotoState('Dying');
            }            
        }
        else
        {
            return;
        }
    }
    super(Actor).TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    //return;    
}

simulated event OnAnimEnd()
{
    local /*0x97E50000-0x00000000*/ private @NULL InSeqNode[8388609];
    local /*0x97E50000-0x00000000*/ private float PlayedTime[8388609], ExcessTime;

    //return;    
}

simulated event HandleHiveAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL InSeqNode[8388609];

    PerformDelayedRangeAttack();
    //return;    
}

simulated event HandleHiveOpen()
{
    local /*0x97E50000-0x00000000*/ private @NULL InSeqNode[8388609];

    //return;    
}

simulated function GetSpawnImpulse()
{
    local /*0x97E50000-0x00000000*/ private @NULL outVec[25165825];
    local /*0x97E50000-0x00000000*/ private float outAIDelayTime[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Dir;
    local /*0x97E50000-0x00000000*/ private float Strength;

    // End:0x3F
    if(((FallImpulseStrengthMin == float(0)) || FallImpulseStrengthMax == float(0)) || FallImpulseStrengthMax < FallImpulseStrengthMin)
    {
        return false;
    }
    Dir = Vector(Rotation);
    Strength = RandRange(FallImpulseStrengthMin, FallImpulseStrengthMax);
    Dir *= Strength;
    outVec = Dir;
    outAIDelayTime = FallingAIDelayTime;
    return true;
    //return ReturnValue;    
}

simulated function DrawGrenadeAssistZone()
{
    //return;    
}

simulated function IsValidTargetForGrenadeAssist()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return IsHiveInValidCoditionToStickGrenade();
    //return ReturnValue;    
}

simulated function HandleDamageNotifyForGrenadeAttachment()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenGettingStuck[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL dmgEvent;

    Idx = 0;
    J0x0B:

    // End:0xAE [Loop If]
    if(Idx < GeneratedEvents.Length)
    {
        dmgEvent = SeqEvent_TakeDamage(GeneratedEvents[Idx]);
        // End:0xA0
        if(dmgEvent != none)
        {
            dmgEvent.HandleDamage(self, GrenGettingStuck.InstigatorController, Class'LPDamageTypeGrenadeActual', 1);
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated function IsGrenadeOnValidEntryPathForThisHive()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenGettingStuck[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL mouthSockLoc, mouthSockRot;
    local /*0x97E50000-0x00000000*/ private float dotOfMouthCoreToGrensPath;
    local /*0x97E50000-0x00000000*/ private @NULL normalizedVelocityVec;

    // End:0xAF
    if(GrenGettingStuck != none)
    {
        VisibleMesh.GetSocketWorldLocationAndRotation('GrenadeFinalTarget', mouthSockLoc, mouthSockRot);
        normalizedVelocityVec = Normal(GrenGettingStuck.Velocity);
        dotOfMouthCoreToGrensPath = Vector(mouthSockRot) Dot normalizedVelocityVec;
        // End:0xAF
        if(dotOfMouthCoreToGrensPath <= -CosAngRangeToAllowGrenadeStick)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function IsHiveInValidCoditionToStickGrenade()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(Health <= 0)
    {
        return false;
    }
    // End:0x20
    if(bGodMode)
    {
        return false;
    }
    // End:0x36
    if(int(HiveState) == int(0))
    {
        return false;
    }
    // End:0x4C
    if(int(HiveState) == int(6))
    {
        return false;
    }
    // End:0x62
    if(int(HiveState) == int(5))
    {
        return false;
    }
    // End:0x78
    if(int(HiveState) == int(7))
    {
        return false;
    }
    // End:0x8E
    if(int(HiveState) == int(8))
    {
        return false;
    }
    // End:0xA4
    if(int(HiveState) == int(9))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

simulated function @NULL TryToStickGrenade()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenGettingStuck[8388609], ComponentGrenOn, HitNormal, PhysMat;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo, grenMesh;

    // End:0x2BC
    if((((GrenGettingStuck != none) && !IsPendingKill()) && IsHiveInValidCoditionToStickGrenade()) && IsGrenadeOnValidEntryPathForThisHive(GrenGettingStuck))
    {
        // End:0x2BC
        if(PhysMat != none)
        {
            GrenGettingStuck.BoneNameGluedTo = HiveTuneData.BoneToStickGrenadeTo;
            grenMesh = GrenGettingStuck.GetSkeletalMesh();
            // End:0x1A4
            if(HiveTuneData.bStopAllPhysicalActionsOfGrenadeOnAttachment)
            {
                GrenGettingStuck.StopSimulating();
                grenMesh.SetHidden(true);
                GrenGettingStuck.SetBase(self,, SkeletalMeshComponent(GetMesh()), GrenGettingStuck.BoneNameGluedTo);
                GrenGettingStuck.SetHardAttach(true);
                GrenGettingStuck.SetBase(self);
            }
            HitInfo.PhysMaterial = PhysMat;
            HitInfo.BoneName = GrenGettingStuck.BoneNameGluedTo;
            HitInfo.HitComponent = ComponentGrenOn;
            GrenGettingStuck.StopExplosionTimer();
            PhysMat.PlayImpactEffects(self, HitInfo, GrenGettingStuck.Location, HitNormal, Class'LPDamageTypeGrenadeActual');
            HandleDamageNotifyForGrenadeAttachment(GrenGettingStuck);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function @NULL NotifyOfGrenadeGettingStuckTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenGettingStuck[8388609], ComponentGrenOn, HitNormal, PhysMat;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x72
    if(TryToStickGrenade(GrenGettingStuck, ComponentGrenOn, HitNormal, PhysMat))
    {
        // End:0x72
        if(GrenGettingStuck != none)
        {
            // End:0x72
            if(PhysMat != none)
            {
                AddGrenadeStuckToThisHive(GrenGettingStuck);
                GotoState('EatingGrenade');
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function AddGrenadeStuckToThisHive()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenGettingStuck[8388609];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x54 [Loop If]
    if(iter < GrenadesStuckToHive.Length)
    {
        // End:0x46
        if(GrenadesStuckToHive[iter] == GrenGettingStuck)
        {
            return;
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    GrenadesStuckToHive.AddItem(GrenGettingStuck);    
    //return;    
}

simulated function RemoveGrenadeStuckToThisHive()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenToRemove[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x69 [Loop If]
    if(iter < GrenadesStuckToHive.Length)
    {
        // End:0x5B
        if(GrenadesStuckToHive[iter] == GrenToRemove)
        {
            GrenadesStuckToHive.Remove(iter, 1);            
            return true;
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

simulated function RemoveAllGrenades()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0xD6 [Loop If]
    if(iter < GrenadesStuckToHive.Length)
    {
        // End:0xB3
        if(GrenadesStuckToHive[iter] != none)
        {
            GrenadesStuckToHive[iter].SetBase(none);
            GrenadesStuckToHive[iter].SetOwner(none);
            GrenadesStuckToHive[iter].LifeSpan = 0.0001000;
        }
        GrenadesStuckToHive.Remove(iter, 1);        
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    return true;
    //return ReturnValue;    
}

simulated function PlayGrenadeInHiveExplosionEffects()
{
    //return;    
}

simulated function HandleInternalGrenadeExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenExploding[8388609];

    //return;    
}

simulated function HandleInternalGrenadeExplosionFromStoredData()
{
    HandleInternalGrenadeExplosion(CurrentGrenExploding);
    CurrentGrenExploding = none;
    //return;    
}

simulated function GetLocationForExplosionForGrenadeStuckToThisHive()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenExploding[8388609], ReturnValue;

    return Location;
    //return ReturnValue;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], Pct;

    super(Actor).Tick(DeltaTime);
    // End:0xFF
    if(ExplosionRadialBlur != none)
    {
        // End:0xB1
        if(RadialBlurFadeTimeRemaining > 0.0000000)
        {
            Pct = RadialBlurFadeTimeRemaining / RadialBlurFadeTime;
            Pct *= Pct;
            ExplosionRadialBlur.SetBlurScale(Pct * RadialBlurMaxBlurAmount);
            RadialBlurFadeTimeRemaining -= DeltaTime;            
        }
        else
        {
            ExplosionRadialBlur.SetBlurScale(0.0000000);
            ExplosionRadialBlur.DetachFromAny();
            ExplosionRadialBlur = none;
        }
    }
    // End:0x16C
    if(SphincterBurnLength > float(0))
    {
        SphincterBurnLength -= DeltaTime;
        SphincterBurnCurrent = (SphincterBurnStart - SphincterBurnLength) / SphincterBurnStart;
        SphincterBurnCurrent = FClamp(SphincterBurnCurrent, 0.0000000, 1.0000000);
    }
    //return;    
}

simulated function StartBurnEffect()
{
    local /*0x97E50000-0x00000000*/ private float Time[8388609];

    SphincterBurnCurrent = 0.0000000;
    SphincterBurnLength = Time;
    SphincterBurnStart = Time;
    //return;    
}

simulated function PerformDelayedRangeAttack()
{
    ClearTimer('PerformDelayedRangeAttack');
    DoRangeAttack();
    MulticastDoRangeAttack();
    //return;    
}

simulated function DoDeathExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL explosionActor, ExplosionLoc, ExplosionRot, FacingDir;
    local /*0x97E50000-0x00000000*/ private bool bOk;

    // End:0x37
    if((HiveTuneData == none) || HiveTuneData.RangeAttackTemplate == none)
    {
        return;
    }
    bOk = VisibleMesh.GetSocketWorldLocationAndRotation('Mouth', ExplosionLoc, ExplosionRot);
    // End:0xD4
    if(!bOk)
    {
        FacingDir = Vector(Rotation);
        ExplosionLoc = (Location + (FacingDir * float(100))) + vect(0.0000000, 0.0000000, 100.0000000);
    }
    explosionActor = Spawn(Class'LPExplosionActor',,, ExplosionLoc, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
    // End:0x280
    if(explosionActor != none)
    {
        explosionActor.TheWeaponThatSpawnedMe = none;
        explosionActor.Instigator = Instigator;
        explosionActor.InstigatorController = ((Instigator == none) ? none : Instigator.Controller);
        explosionActor.bDrawDebug = false;
        explosionActor.ExplosionPhysMaterial = ((VisibleMesh.PhysMaterialOverride != none) ? SPPhysicalMaterial(VisibleMesh.PhysMaterialOverride) : none);
        explosionActor.Explode(HiveTuneData.DeathExplosionTemplate);
    }
    //return;    
}

simulated function DoRangeAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL explosionActor, ExplosionLoc, ExplosionRot, FacingDir;
    local /*0x97E50000-0x00000000*/ private bool bOk;

    // End:0x37
    if((HiveTuneData == none) || HiveTuneData.RangeAttackTemplate == none)
    {
        return;
    }
    bOk = VisibleMesh.GetSocketWorldLocationAndRotation('Mouth', ExplosionLoc, ExplosionRot);
    // End:0xD4
    if(!bOk)
    {
        FacingDir = Vector(Rotation);
        ExplosionLoc = (Location + (FacingDir * float(100))) + vect(0.0000000, 0.0000000, 100.0000000);
    }
    explosionActor = Spawn(Class'LPExplosionActor',,, ExplosionLoc, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
    // End:0x280
    if(explosionActor != none)
    {
        explosionActor.TheWeaponThatSpawnedMe = none;
        explosionActor.Instigator = Instigator;
        explosionActor.InstigatorController = ((Instigator == none) ? none : Instigator.Controller);
        explosionActor.bDrawDebug = false;
        explosionActor.ExplosionPhysMaterial = ((VisibleMesh.PhysMaterialOverride != none) ? SPPhysicalMaterial(VisibleMesh.PhysMaterialOverride) : none);
        explosionActor.Explode(HiveTuneData.RangeAttackTemplate);
    }
    //return;    
}

reliable client simulated function MulticastDoRangeAttack()
{
    DoRangeAttack();
    //return;    
}

function AkridIsFree()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];

    //return;    
}

simulated function PlayHiveAnimation()
{
    local /*0x97E50000-0x00000000*/ private bool bLooping[8388609];
    local /*0x97E50000-0x00000000*/ private name AnimName[8388609];
    local /*0x97E50000-0x00000000*/ private float Rate[9437185], BlendIn, BlendOut, ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL Slot, Seq;

    1.0000000
    0.0000000
    0.0000000
    // End:0xE2
    if(VisibleMesh != none)
    {
        Slot = SPAnimNodeSlot(VisibleMesh.FindAnimNode('HiveSlotNode'));
        // End:0xE2
        if(Slot != none)
        {
            Seq = Slot.PlayCustomAnimWithDelegate(OnAnimationFinishedDelegate, 0, AnimName, Rate, BlendIn, BlendOut, bLooping, true);
        }
    }
    LastUsedAnimName = AnimName;
    LastAnimSeq = Seq;
    return ((Seq != none) ? Seq.GetAnimPlaybackLength() : 0.0000000);
    //return ReturnValue;    
}

simulated function PlayAdditiveHiveAnimation()
{
    local /*0x97E50000-0x00000000*/ private bool bLooping[8388609];
    local /*0x97E50000-0x00000000*/ private name AnimName[8388609];
    local /*0x97E50000-0x00000000*/ private float Rate[9437185], BlendIn, BlendOut, ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL Slot;
    local /*0x97E50000-0x00000000*/ private float Length;

    1.0000000
    0.0000000
    0.0000000
    // End:0xCE
    if(VisibleMesh != none)
    {
        Slot = SPAnimNodeSlot(VisibleMesh.FindAnimNode('AdditiveSlotNode'));
        // End:0xCE
        if(Slot != none)
        {
            Length = Slot.PlayCustomAnim(AnimName, Rate, BlendIn, BlendOut, bLooping, true);
        }
    }
    // End:0x1D5
    if(int(WorldInfo.NetMode) == int(NM_ListenServer))
    {
        ReplicatedAdditiveAnimationInfo.bLooping = bLooping;
        ReplicatedAdditiveAnimationInfo.AnimationName = AnimName;
        ReplicatedAdditiveAnimationInfo.Rate = Rate;
        ReplicatedAdditiveAnimationInfo.BlendIn = BlendIn;
        ReplicatedAdditiveAnimationInfo.BlendOut = BlendOut;
        ReplicatedAdditiveAnimationInfo.RepCounter++;
    }
    return Length;
    //return ReturnValue;    
}

delegate OnAnimationFinishedDelegate()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    OnAnimEnd(Node, 0.0000000, 0.0000000);
    //return;    
}

simulated function BeginAkridSpawnAnimation()
{
    // End:0xB7
    if(((MyBaby != none) && int(HiveState) == int(2)) && (MyBaby.SpecialMoveState.CurSMInstance != none) && !MyBaby.SpecialMoveState.bEndingSpecialMove)
    {
        MyBaby.EndCurrentSpecialMove();
    }
    // End:0x260
    if(((MyBaby != none) && MyBaby.SpecialMoveState.CurSMInstance == none) || MyBaby.SpecialMoveState.bEndingSpecialMove)
    {
        SetTimer(HiveTuneData.SpawnOpenMaxTime, false, 'AkridIsFree');
        // End:0x1D8
        if(MyBaby.Controller != none)
        {
            MyBaby.Controller.SetFocalPoint(Location + (Vector(Rotation) * 1000.0000000), true);
        }
        // End:0x224
        if(bWallSpawner)
        {
            MyBaby.DoSpecialMove(Class'LPSM_AkridHiveSpawnWall', true, true, None, self);            
        }
        else
        {
            MyBaby.DoSpecialMove(Class'LPSM_AkridHiveSpawnFloor', true, true, None, self);
        }
    }
    //return;    
}

simulated function ShouldPlayCinematic()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1E
    if(bUseCinematicInitialAnims)
    {
        // End:0x1E
        if(SpawnCount == 0)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function ResetSpawnCount()
{
    ClearTimer('ResetSpawnCount');
    SpawnCount = 0;
    //return;    
}

simulated function AddPhysicalMaterialOverride()
{
    VisibleMesh.SetPhysMaterialOverride(DeadPhysicalMaterial);
    //return;    
}

simulated function RemovePhysicalMaterialOverride()
{
    VisibleMesh.SetPhysMaterialOverride(none);
    //return;    
}

simulated function ConditionalAttachDNATag()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609];

    // End:0x44
    if((bIsDNATagged || bWasDNATagged) || !HiveTuneData.bCanBeTagged)
    {
        return;
    }
    bIsDNATagged = true;
    // End:0xB7
    if((int(WorldInfo.NetMode) != int(NM_DedicatedServer)) && HiveTuneData.TagParticleSystem != none)
    {
        DNAParticles = new (self) Class'Engine.ParticleSystemComponent';
    }
    // End:0x191
    if(DNAParticles != none)
    {
        DNAParticles.SetTemplate(HiveTuneData.TagParticleSystem);
        DNAParticles.SetAbsolute(true);
        DNAParticles.SetScale(10.0000000);
        DNAParticles.SetTranslation(HitLocation);
        DNAParticles.ActivateSystem(true);
    }
    //return;    
}

function DNAExtracted()
{
    local /*0x97E50000-0x00000000*/ private @NULL InTagger[8388609], Objective;

    // End:0xB0
    if((InTagger != none) && HiveTuneData.DNATaggingQuestObjective != none)
    {
        Objective = SPQO_ObjectiveBool(HiveTuneData.DNATaggingQuestObjective.GetQuestObject());
        // End:0xB0
        if(Objective != none)
        {
            Objective.AdjustQuestProgress(1.0000000);
        }
    }
    // End:0xDE
    if(DNAParticles != none)
    {
        DNAParticles.DeactivateSystem();
    }
    bIsDNATagged = false;
    bWasDNATagged = true;
    //return;    
}

event HiveSpLog_Internal()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string LogText[142606337];

    //return;    
}

auto state Idle
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        HiveState = 1;
        bAvailableForSpawning = true;
        TimeWhenNextRangeAttackValid = 0.0000000;
        // End:0x79
        if(HiveTuneData.MinTimeBetweenRangeAttacks > float(0))
        {
            SetTimer(HiveTuneData.MinTimeBetweenRangeAttacks, true, 'CheckRangeAttack');
        }
        // End:0xAA
        if(IdleSoundComponent == none)
        {
            IdleSoundComponent = CreateAudioComponent(IdleSoundCue, false, true);
        }
        // End:0x15C
        if(IdleSoundComponent != none)
        {
            IdleSoundComponent.bUseOwnerLocation = true;
            IdleSoundComponent.bAutoDestroy = true;
            IdleSoundComponent.bStopWhenOwnerDestroyed = true;
            IdleSoundComponent.bShouldRemainActiveIfDropped = true;
            IdleSoundComponent.Play();
        }
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        bAvailableForSpawning = false;
        ClearTimer('CheckRangeAttack');
        //return;        
    }

    function CheckRangeAttack()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LPP;

        // End:0x19
        if(IsTimerActive('PerformDelayedRangeAttack', self))
        {
            return;
        }
        // End:0xF1
        foreach TouchingActors(Class'LPPlayerPawn', LPP)
        {
            // End:0xF0
            if(LPP.IsAliveAndWell())
            {
                PlayHiveAnimation(false, HiveTuneData.AnimSeqNames.RangeAttack);
                SetTimer(0.8000000, false, 'PerformDelayedRangeAttack', self);
                TimeWhenNextRangeAttackValid = WorldInfo.TimeSeconds + HiveTuneData.MinTimeBetweenRangeAttacks;
                // End:0xF1
                break;
            }            
        }        
        //return;        
    }
    stop;    
}

state PreBirth
{
    ignores EndState;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        HiveState = 2;
        // End:0x9E
        if(true)
        {
            // End:0x5F
            if(ShouldPlayCinematic())
            {
                PlayHiveAnimation(false, HiveTuneData.AnimSeqNames.OpeningSlow);                
            }
            else
            {
                PlayHiveAnimation(false, HiveTuneData.AnimSeqNames.Opening);
            }
        }
        //return;        
    }

    simulated event OnAnimEnd()
    {
        local /*0x97E50000-0x00000000*/ private @NULL InSeqNode[8388609];
        local /*0x97E50000-0x00000000*/ private float PlayedTime[8388609], ExcessTime;

        // End:0xB8
        if((InSeqNode.AnimSeqName == HiveTuneData.AnimSeqNames.Opening) || InSeqNode.AnimSeqName == HiveTuneData.AnimSeqNames.OpeningSlow)
        {
            GotoState('Birthing');
        }
        //return;        
    }

    simulated event HandleHiveOpen()
    {
        local /*0x97E50000-0x00000000*/ private @NULL InSeqNode[8388609];

        BeginAkridSpawnAnimation();
        //return;        
    }

    function AkridIsFree()
    {
        local /*0x97E50000-0x00000000*/ private @NULL P[8388609];

        ClearTimer('AkridIsFree');
        GotoState('PostBirth');
        //return;        
    }
    stop;    
}

state Birthing
{
    ignores EndState;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        HiveState = 3;
        // End:0xE7
        if(true)
        {
            // End:0x5F
            if(ShouldPlayCinematic())
            {
                PlayHiveAnimation(true, HiveTuneData.AnimSeqNames.OpenSlow);                
            }
            else
            {
                PlayHiveAnimation(true, HiveTuneData.AnimSeqNames.Open);
            }
            PlayAdditiveHiveAnimation(false, HiveTuneData.AnimSeqNames.OpenBirthModifier);
            BeginAkridSpawnAnimation();
        }
        //return;        
    }

    function AkridIsFree()
    {
        local /*0x97E50000-0x00000000*/ private @NULL P[8388609];

        ClearTimer('AkridIsFree');
        GotoState('PostBirth');
        //return;        
    }
    stop;    
}

state PostBirth
{
    ignores EndState;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        HiveState = 4;
        // End:0x9E
        if(true)
        {
            // End:0x5F
            if(ShouldPlayCinematic())
            {
                PlayHiveAnimation(false, HiveTuneData.AnimSeqNames.ClosingSlow);                
            }
            else
            {
                PlayHiveAnimation(false, HiveTuneData.AnimSeqNames.Closing);
            }
        }
        // End:0xD3
        if(bUseCinematicInitialAnims && SpawnCount == 0)
        {
            SetTimer(IdleTimeBeforeReturningToInitial, false, 'ResetSpawnCount');
        }
        MyBaby = none;
        ++SpawnCount;
        LastSpawnTime = WorldInfo.TimeSeconds;
        //return;        
    }

    simulated event OnAnimEnd()
    {
        local /*0x97E50000-0x00000000*/ private @NULL InSeqNode[8388609];
        local /*0x97E50000-0x00000000*/ private float PlayedTime[8388609], ExcessTime;

        // End:0xB8
        if((InSeqNode.AnimSeqName == HiveTuneData.AnimSeqNames.Closing) || InSeqNode.AnimSeqName == HiveTuneData.AnimSeqNames.ClosingSlow)
        {
            GotoState('Idle');
        }
        //return;        
    }
    stop;    
}

state EatingGrenade
{
    ignores EndState;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        HiveState = 8;
        PlayHiveAnimation(false, HiveTuneData.AnimSeqNames.SwallowGrenade);
        ClearTimer('PerformDelayedRangeAttack');
        ClearTimer('AkridIsFree');
        ClearTimer('PiningTimedOut');
        ClearTimer('ResetSpawnCount');
        //return;        
    }

    simulated event OnAnimEnd()
    {
        local /*0x97E50000-0x00000000*/ private @NULL InSeqNode[8388609];
        local /*0x97E50000-0x00000000*/ private float PlayedTime[8388609], ExcessTime;

        // End:0x62
        if(InSeqNode.AnimSeqName == HiveTuneData.AnimSeqNames.SwallowGrenade)
        {
            GotoState('InternalGrenadeExplosion');
        }
        //return;        
    }
    stop;    
}

state InternalGrenadeExplosion
{
    ignores HandleHiveAttack;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private float Length;

        bDiedByInternalGrenade = true;
        HiveState = 9;
        // End:0x75
        if(bBlockAfterDeath)
        {
            Length = PlayHiveAnimation(false, HiveTuneData.AnimSeqNames.BlowingUpFromGrenadeClosed,,, -1.0000000);            
        }
        else
        {
            Length = PlayHiveAnimation(false, HiveTuneData.AnimSeqNames.BlowingUpFromGrenadeOpen,,, -1.0000000);
        }
        DoDeathExplosion();
        // End:0xF0
        if(Length > float(0))
        {
            StartBurnEffect(Length);
        }
        GotoState('Dying');
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        RemoveAllGrenades();
        //return;        
    }
    stop;    
}

state Dying
{
    ignores EndState;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        HiveState = 5;
        bAvailableForSpawning = false;
        Health = 0;
        // End:0x55
        if(MyBaby != none)
        {
            MyBaby.Destroy();
            MyBaby = none;
        }
        ClearTimer('PerformDelayedRangeAttack');
        ClearTimer('AkridIsFree');
        ClearTimer('PiningTimedOut');
        ClearTimer('ResetSpawnCount');
        // End:0xBE
        if(!bDiedByInternalGrenade)
        {
            DoDeathExplosion();
        }
        // End:0xDC
        if(bRegenerateAfterDeath)
        {
            GotoState('Pining');            
        }
        else
        {
            GotoState('Dead');
        }
        // End:0x118
        if(IdleSoundComponent != none)
        {
            IdleSoundComponent.Stop();
        }
        //return;        
    }
    stop;    
}

state Pining
{
    ignores TakeDamage, Touch, UnTouch, EndState;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private float Length;

        HiveState = 7;
        SetTimer(HiveTuneData.SecondsUntilRegeneration, false, 'PiningTimedOut');
        // End:0x89
        if(true)
        {
            Length = PlayHiveAnimation(false, HiveTuneData.AnimSeqNames.DeadClosed,,, -1.0000000);
        }
        // End:0xAD
        if(Length > float(0))
        {
            StartBurnEffect(Length);
        }
        //return;        
    }

    function PiningTimedOut()
    {
        ClearTimer('PiningTimedOut');
        GotoState('Idle');
        Health = MaxHealth;
        DamageTaken = 0;
        MyBaby = none;
        SetCollision(true, true);
        RemovePhysicalMaterialOverride();
        //return;        
    }
    stop;    
}

state Dead
{
    ignores TakeDamage, Touch, UnTouch, EndState;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private float Length;

        HiveState = 6;
        AddPhysicalMaterialOverride();
        // End:0xA7
        if(bLoadingCheckpoint)
        {
            PlayHiveAnimation(false, LastUsedAnimName,,, -1.0000000);
            // End:0x8C
            if(LastAnimSeq != none)
            {
                LastAnimSeq.SetPosition(LastAnimSeq.GetAnimPlaybackLength(), false);
            }
            SetCollision(bBlockAfterDeath, bBlockAfterDeath);            
        }
        else
        {
            // End:0x119
            if(bBlockAfterDeath)
            {
                SetCollision(true, true);
                // End:0x116
                if(!bDiedByInternalGrenade)
                {
                    Length = PlayHiveAnimation(false, HiveTuneData.AnimSeqNames.DeadClosed,,, -1.0000000);
                }                
            }
            else
            {
                SetCollision(false, false);
                // End:0x17B
                if(!bDiedByInternalGrenade)
                {
                    Length = PlayHiveAnimation(false, HiveTuneData.AnimSeqNames.DeadOpen,,, -1.0000000);
                }
            }
            // End:0x19F
            if(Length > float(0))
            {
                StartBurnEffect(Length);
            }
            TriggerEventClass(Class'LPSeqEvent_Death', self);
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    AttackRadius=400.0000000
    bWallSpawner=true
    FallImpulseStrengthMin=250.0000000
    FallImpulseStrengthMax=250.0000000
    FallingAIDelayTime=1.0000000
    // Reference: DrawSphereComponent'Default__LPHiveSpawnPoint.DrawSphere0'
    begin object name=DrawSphere0 class=Class'Engine.DrawSphereComponent'
    end object
    DrawSphere=DrawSphere0
    // Reference: CylinderComponent'Default__LPHiveSpawnPoint.AttackCylinder0'
    begin object name=AttackCylinder0 class=Class'Engine.CylinderComponent'
    end object
    AttackRangeCylinder=AttackCylinder0
    Health=100
    MaxHealth=100
    // Reference: SkeletalMeshComponent'Default__LPHiveSpawnPoint.HiveMesh0'
    begin object name=HiveMesh0 class=Class'Engine.SkeletalMeshComponent'
    end object
    VisibleMesh=HiveMesh0
    // Reference: DynamicLightEnvironmentComponent'Default__LPHiveSpawnPoint.LightComp0'
    begin object name=LightComp0 class=Class'Engine.DynamicLightEnvironmentComponent'
    end object
    LightingComponent=LightComp0
    // Reference: SPDamageStateComponent'Default__LPHiveSpawnPoint.ShellDamageStateComponentDefObj'
    begin object name=ShellDamageStateComponentDefObj class=Class'SPEngine.SPDamageStateComponent'
    end object
    ShellDamageComponent=ShellDamageStateComponentDefObj
    Components[0]=none
    Components[1]=LightComp0
    Components[2]=HiveMesh0
    Components[3]=DrawSphere0
    Components[4]=AttackCylinder0
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bHidden=false
    bAlwaysRelevant=true
    bReplicateInstigator=true
    bGameRelevant=true
    bCollideActors=true
    // Reference: LPHiveSpawnerInteractionMetaData'Default__LPHiveSpawnPoint.HiveInteraction0'
    begin object name=HiveInteraction0 class=Class'LPHiveSpawnerInteractionMetaData'
    end object
    InteractionMetaData=HiveInteraction0
    CollisionComponent=AttackCylinder0
    SupportedEvents=/* Array type was not detected. */
}