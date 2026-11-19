class LPAIPawnDongo extends LPAIPawnBaseSnowCrab
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

enum EDongoGrabPoints
{
    edgpStunned,                    // 0
    edgpStanding,                   // 1
    EDongoGrabPoints_MAX            // 2
};

struct native BankingInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneParams;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AVYaw;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AVYawMax;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OneOverAVYawMax;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AVSample;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NextAVSample;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumSamples;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OneOverNumSamples;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TargetRoll;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentRoll;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Rate;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PrePhysicsRotation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MeshRotation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MeshTranslation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DefaultMeshTranslation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DongoPawn;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RollingWidth;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RollingHeight;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDebugDraw;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDebugRoll;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DebugRollInDeg;

    structdefaultproperties
    {
        TuneParams=(bEnable=true,TurnRateDegreesPerSecond=190.0000000,MaximumBankAngleInDegrees=50.0000000,MinimumBankAngleInDegrees=20.0000000,BankRateInDegreesPerSecond=90.0000000,MinimumSpeedScaleFactor=0.1000000)
        AVYaw=0.0000000
        AVYawMax=0.0000000
        OneOverAVYawMax=0.0000000
        AVSample=none
        NextAVSample=0
        NumSamples=3
        OneOverNumSamples=1.0000000
        TargetRoll=0.0000000
        CurrentRoll=0.0000000
        Rate=0
        PrePhysicsRotation=(Pitch=0,Yaw=0,Roll=0)
        MeshRotation=(Pitch=0,Yaw=0,Roll=0)
        MeshTranslation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DefaultMeshTranslation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DongoPawn=none
        RollingWidth=50.0000000
        RollingHeight=220.0000000
        bDebugDraw=false
        bDebugRoll=false
        DebugRollInDeg=0.0000000
    }
};

struct native DongoMaterialParameterInfo
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

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DongoSteering[805437441];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataDongo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ChargeAnimations;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FrenzyAnimation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FleeAnimation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageNonCore[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bChargeDodgeWindowOpen[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFirstDodgeWindownOpen[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL BankingData[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DongoMaterialParameter[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int Rolling[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int TransitioningIntoMovement[2097153];

// Export ULPAIPawnDongo::execIsValidCoreTagType(FFrame&, void* const)
native simulated function IsValidCoreTagType()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawnDongo::execInitBankingData(FFrame&, void* const)
native function InitBankingData();

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    super.ReplicatedEvent(VarName);
    switch(VarName)
    {
        // End:0x3F
        case 'Rolling':
            HandleChangeOfRollSound();
            // End:0x42
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataDongo = LPTuneDataIceCrab(TuneData);
    InitDamageTracking();
    DamageNonCore = 0.0000000;
    bChargeDodgeWindowOpen = false;
    bFirstDodgeWindownOpen = false;
    super.InitTuneData(TuneData);
    // End:0xC0
    if(Class'SPEngine.SPUtil'.static.IsSinglePlayerGame())
    {
        BankingData.TuneParams = TuneDataDongo.DongoBankingSinglePlayer;        
    }
    else
    {
        BankingData.TuneParams = TuneDataDongo.DongoBankingMultiPlayer;
    }
    InitBankingData();
    InitDongoMaterialParameter();
    //return;    
}

function InitCrabShield()
{
    //return;    
}

function IsDoingChargeCSA()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2C
    if(ContextSensitiveAnimInfo.CurrentCSA == ChargeAnimations)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function SetChargeCSA()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x32
    if(bEnable)
    {
        UseContextSensitiveAnimObject(ChargeAnimations, 1.0000000);
        StartRollSound();        
    }
    else
    {
        UseContextSensitiveAnimObject(none, 1.0000000);
        EndRollSound();
    }
    SetFreeGrab(!bEnable);
    //return;    
}

simulated function SetFrenzyCSA()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x28
    if(bEnable)
    {
        UseContextSensitiveAnimObject(FrenzyAnimation, 1.0000000);        
    }
    else
    {
        UseContextSensitiveAnimObject(none, 1.0000000);
    }
    //return;    
}

simulated function SetFleeCSA()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x28
    if(bEnable)
    {
        UseContextSensitiveAnimObject(FleeAnimation, 1.0000000);        
    }
    else
    {
        UseContextSensitiveAnimObject(none, 1.0000000);
    }
    //return;    
}

function SetFreeGrab()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x6A
    if((Health > 0) || !bEnable)
    {
        SetWinchPointEnabledByIndex(0, bEnable);
        SetCurrentlyValidTargetForWinchAssist(bEnable);
        SetGrabPointEnabledByIndex(0, false);
        SetGrabPointEnabledByIndex(1, bEnable);
    }
    //return;    
}

simulated event IsStunned()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bIsStunned;

    bIsStunned = ((((IsDoingSpecialMove(Class'LPSM_SnowCrabDefaultStandingStun') || IsDoingSpecialMove(Class'LPSM_SnowCrabFailedChargeStun')) || IsDoingSpecialMove(Class'LPSM_SnowCrabFailedVsChargeStun')) || IsDoingSpecialMove(Class'LPSM_SnowCrabGrenadeStun')) || IsDoingSpecialMove_OF_Class(Class'LPSM_DongoGrenadeFlip')) || IsDoingSpecialMove_OF_Class(Class'LPSM_DongoStunnedHitByVs');
    return bIsStunned || IsGrabbed();
    //return ReturnValue;    
}

simulated function IsGrabbed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return IsDoingSpecialMove_OF_Class(Class'LPSM_ForkArmGrabVictim_Base');
    //return ReturnValue;    
}

simulated event IsDoingRollIntroOrOutro()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x30
    if(IsDoingSpecialMove_OF_Class(Class'LPSM_DongoRollStart') || IsDoingSpecialMove_OF_Class(Class'LPSM_DongoRollEnd'))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function IsClawRightAbleToBeUsedForSlapAside()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

simulated function IsClawLeftAbleToBeUsedForSlapAside()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

simulated function NotifyJustGotGrabbed()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnGrabbingMe[8388609];

    SetFreeGrab(false);
    //return;    
}

function StartRollSound()
{
    // End:0x24
    if(Rolling == 0)
    {
        Rolling = 1;
        HandleChangeOfRollSound();
    }
    //return;    
}

function EndRollSound()
{
    // End:0x24
    if(Rolling != 0)
    {
        Rolling = 0;
        HandleChangeOfRollSound();
    }
    //return;    
}

simulated function HandleChangeOfRollSound()
{
    // End:0x1C
    if(Rolling != 0)
    {
        TurnOnRollAudioComponent();        
    }
    else
    {
        TurnOffRollAudioComponent();
        // End:0x91
        if(!IsPendingKill() && !Class'Engine.Engine'.static.IsEditor())
        {
            TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('DongoRollEnd', 'None', self, none, none);
        }
    }
    //return;    
}

simulated function TurnOnRollAudioComponent()
{
    AddAudioComponent(TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('DongoRoll', 'None', self, Mesh, none), 'DongoRoll');
    //return;    
}

simulated function TurnOffRollAudioComponent()
{
    RemoveAudioComponent('DongoRoll');
    //return;    
}

simulated event Destroyed()
{
    TurnOffRollAudioComponent();
    CleanupDongoMaterialParameters();
    super.Destroyed();
    //return;    
}

function LineSweepHitTesterHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    // End:0x40
    if(LPVSPlayerPawn(Info.Impact.HitActor) != none)
    {
        return;
    }
    super(LPAIPawn).LineSweepHitTesterHitSomethingNew(Info);
    //return;    
}

simulated function CanTakeNonCoreDamage()
{
    local /*0x97E50000-0x00000000*/ private class inDamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1C
    if(inDamageType == Class'LPDamageTypeVSMeleeTwoHandBash')
    {
        return true;        
    }
    else
    {
        // End:0x87
        if((inDamageType == Class'LPDamageTypeVSMeleeEndCombo') && DamageNonCore >= TuneDataPawn.VSMeleeDamageForStun.GetValue())
        {
            Health = 1;
            return true;            
        }
        else
        {
            return super(LPAIPawn).CanTakeNonCoreDamage(inDamageType);
        }
    }
    //return ReturnValue;    
}

function AdjustDamage()
{
    local /*0x97E50000-0x00000000*/ private int InDamage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[25165825], InstigatedBy, HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser, CoreTag, Mat;
    local /*0x97E50000-0x00000000*/ private bool bHitCore;

    bHitCore = false;
    Mat = LPPhysicalMaterial(TakeDamageParams.HitInfo.PhysMaterial);
    // End:0xB3
    if(Mat != none)
    {
        CoreTag = LPPhysMatPropTag_CoreId(Mat.GetTag(Class'LPPhysMatPropTag_CoreId'));
        // End:0xB3
        if(CoreTag != none)
        {
            bHitCore = true;
        }
    }
    // End:0xD7
    if(!bHitCore)
    {
        AddToDamageNonCore(float(InDamage));
    }
    super(LPAIPawn).AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    //return;    
}

function InitDamageTracking()
{
    local /*0x97E50000-0x00000000*/ private int DamageTrackingEntries;

    DamageTrackingEntries = int(TuneDataDongo.DamageWindowInSeconds.GetValue() * float(10));
    // End:0x9E
    if(DamageTrackingEntries > 0)
    {
        DamageTracking.DamageEntry.Add(DamageTrackingEntries);        
        DamageTracking.LastEntry = -1;
    }
    //return;    
}

function HaveAccumulatedDamageForFlee()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float DamageAmount;

    DamageAmount = GetDamageFromDamageTracker(TuneDataDongo.DamageWindowInSeconds.GetValue(), true);
    // End:0x9E
    if(DamageAmount > float(0))
    {
        // End:0x9E
        if(DamageAmount >= TuneDataDongo.DamageForFlee.GetValue())
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function AddToDamageNonCore()
{
    local /*0x97E50000-0x00000000*/ private float DamageAmount[8388609];

    DamageNonCore += DamageAmount;
    //return;    
}

function ResetDamageNonCore()
{
    DamageNonCore = 0.0000000;
    //return;    
}

function HasEnoughDamageForTaunt()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return DamageNonCore > TuneDataDongo.DamageForTaunt.GetValue();
    //return ReturnValue;    
}

simulated function SetGrabPointEnabledByIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    // End:0x46
    if((Index >= 0) && Index < GrabPoints.Length)
    {
        super(LPPawn).SetGrabPointEnabledByIndex(Index, bOn);
    }
    //return;    
}

simulated function PlayHitReactionAnimation()
{
    // End:0x48
    if((Health > 0) && !IsDoingSpecialMove_OF_Class(Class'LPSM_WinchStruggleBase'))
    {
        DamageReactionManagerAI.ExecuteDamageReaction();
    }
    //return;    
}

simulated function CheckCollisionWhileFlying()
{
    // End:0x42
    if(int(Physics) == int(4))
    {
        // End:0x42
        if(MyLpAiController != none)
        {
            MyLpAiController.NotifyCollisionWhileFlying();
        }
    }
    //return;    
}

simulated event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    CheckCollisionWhileFlying();
    super(LPAIPawn).Bump(Other, OtherComp, HitNormal);
    //return;    
}

simulated function @NULL HitWall()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], Wall, WallComp;

    CheckCollisionWhileFlying();
    super(Actor).HitWall(HitNormal, Wall, WallComp);
    //return;    
}

singular simulated event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    CheckCollisionWhileFlying();
    super(LPAIPawn).Touch(Other, OtherComp, HitLocation, HitNormal);
    //return;    
}

simulated event @NULL RigidBodyCollision()
{
    local /*0x97E50000-0x00000400*/ private @NULL HitComponent[8388609], OtherComponent, RigidCollisionData;
    local /*0x97E50000-0x00000000*/ private int ContactIndex[8388609];

    CheckCollisionWhileFlying();
    super(LPPawn).RigidBodyCollision(HitComponent, OtherComponent, RigidCollisionData, ContactIndex);
    //return;    
}

simulated event Landed()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], FloorActor;

    CheckCollisionWhileFlying();
    super(LPAIPawn).Landed(HitNormal, FloorActor);
    //return;    
}

simulated function DoVSCrushTossAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL TossPawn[8388609], TossVelocity;

    vect(0.0000000, 0.0000000, -100.0000000)
    Class'SPEngine.SPUtil'.static.SetRBCollision(Mesh, TossPawn.Mesh, false);
    ReplicatedTossInfo.TossPawn = TossPawn;
    ReplicatedTossInfo.TossVelocity = TossVelocity;
    // End:0x110
    if(TossVelocity != vect(0.0000000, 0.0000000, -100.0000000))
    {
        EndCurrentSpecialMove();
        LPAIControllerDongo(Controller).CmdThrown(LPPawn(TossPawn), TossVelocity);        
    }
    else
    {
        DoVSReleaseAction(TossVelocity);
        TakeDamage(1000, ((TossPawn.Controller != none) ? TossPawn.Controller : LPBaseVSPlayerPawn(TossPawn).LastDriver), Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypeForced');
    }
    //return;    
}

simulated function DoVSReleaseAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReleaseVelocity[9437185];

    vect(0.0000000, 0.0000000, -100.0000000)
    EndCurrentSpecialMove();
    SetPhysics(6);
    Velocity = ReleaseVelocity;
    bShouldRagdoll = true;
    bApplyRagdollImpulse = false;
    //return;    
}

function StartDie()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];

    SetFreeGrab(false);
    TurnOffRollAudioComponent();
    // End:0x91
    if(WantsToPlayDieAnim(DamageType))
    {
        // End:0x91
        if(!bShouldRagdoll)
        {
            // End:0x75
            if(IsDoingSpecialMove_OF_Class(Class'LPSM_WinchStruggleBase'))
            {
                DoVSReleaseAction();
                DoSpecialMove(Class'LPSM_PackHunterDieWinchArm');                
            }
            else
            {
                super.StartDie(DamageType, HitLoc);
            }
        }
    }
    //return;    
}

event HandleNotifyPlayerDodgeWindow()
{
    local /*0x97E50000-0x00000000*/ private byte AttackType[8388609], DodgePhase;
    local /*0x97E50000-0x00000000*/ private @NULL InEnemyToNotify[8388609];

    super(LPAIPawn).HandleNotifyPlayerDodgeWindow(AttackType, DodgePhase, InEnemyToNotify);
    // End:0x68
    if(int(AttackType) == int(19))
    {
        // End:0x5C
        if(int(DodgePhase) == int(0))
        {
            bChargeDodgeWindowOpen = true;            
        }
        else
        {
            bChargeDodgeWindowOpen = false;
        }
    }
    //return;    
}

event NotifyAllPlayerDodgeWindowsClosed()
{
    bChargeDodgeWindowOpen = false;
    bFirstDodgeWindownOpen = false;
    super(LPAIPawn).NotifyAllPlayerDodgeWindowsClosed();
    //return;    
}

simulated function SetRadarIconState()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];

    super(LPPawn).SetRadarIconState(NewState);
    // End:0x55
    if(int(RadarIconState) != int(PrevRadarIconState))
    {
        // End:0x55
        if(int(RadarIconState) == int(2))
        {
            SetTimer(2.0000000, false, 'ClearRadarAttackAnnounceState');
        }
    }
    //return;    
}

simulated function ClearRadarAttackAnnounceState()
{
    SetRadarIconState(1);
    //return;    
}

function DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];

    //return;    
}

simulated function SetStunnedGrabPointsEnabled()
{
    local /*0x97E50000-0x00000000*/ private bool bEnabled[8388609];

    SetGrabPointEnabledByIndex(0, bEnabled);
    SetGrabPointEnabledByIndex(1, !bEnabled);
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

simulated function InitDongoMaterialParameter()
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
                if(MIC.Name == 'Dongo_mat_DamageEmbers_INST')
                {
                    DongoMaterialParameter.MICOriginal = MIC;
                    MIC = CreateDupicateMICFor(MIC, I);
                    DongoMaterialParameter.MIC = MIC;
                    DongoMaterialParameter.ParameterName = 'Damage_Factor';
                    DongoMaterialParameter.matidx = I;
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

    ResetDongoMaterialParameters();
    //return;    
}

simulated function GetDongoMaterialParameterValueForCurrentHealth()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], CurrentHealth, Value;

    CurrentHealth = float(Health);
    // End:0x35
    if(CurrentHealth < float(0))
    {
        CurrentHealth = 0.0000000;
    }
    Value = 1.0000000 - (CurrentHealth / float(HealthMax));
    return Value;
    //return ReturnValue;    
}

simulated function ResetDongoMaterialParameters()
{
    local /*0x97E50000-0x00000000*/ private float Target;

    // End:0xB5
    if((DongoMaterialParameter.MIC != none) && DongoMaterialParameter.matidx > -1)
    {
        Target = GetDongoMaterialParameterValueForCurrentHealth();
        DongoMaterialParameter.MIC.SetScalarParameterValue(DongoMaterialParameter.ParameterName, Target);
    }
    //return;    
}

simulated function CleanupDongoMaterialParameters()
{
    // End:0x132
    if((DongoMaterialParameter.MIC != none) && DongoMaterialParameter.matidx > -1)
    {
        Mesh.SetMaterial(DongoMaterialParameter.matidx, DongoMaterialParameter.MICOriginal);
        DongoMaterialParameter.MIC.SetParent(none);
        DongoMaterialParameter.MIC = none;
        DongoMaterialParameter.MICOriginal = none;
        DongoMaterialParameter.matidx = -1;
    }
    //return;    
}

simulated function UpdateBodyDamage()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], Target, Current;

    // End:0x10C
    if((DongoMaterialParameter.MIC != none) && DongoMaterialParameter.matidx > -1)
    {
        DongoMaterialParameter.MIC.GetScalarParameterValue(DongoMaterialParameter.ParameterName, Current);
        Target = GetDongoMaterialParameterValueForCurrentHealth();
        DongoMaterialParameter.MIC.SetScalarParameterValue(DongoMaterialParameter.ParameterName, Target);
    }
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    UpdateBodyDamage(DeltaTime);
    //return;    
}

simulated event HandleAnimNotifyAI()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609], NodeSeq, DodgeNotify;

    DodgeNotify = LPAnimNotify_DongoDodgeWindow(Notify);
    // End:0x55
    if(DodgeNotify != none)
    {
        BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_AnimNotifyDodge, self);
    }
    //return;    
}

defaultproperties
{
    BankingData=(TuneParams=(bEnable=true,TurnRateDegreesPerSecond=190.0000000,MaximumBankAngleInDegrees=50.0000000,MinimumBankAngleInDegrees=20.0000000,BankRateInDegreesPerSecond=90.0000000,MinimumSpeedScaleFactor=0.1000000),AVYaw=0.0000000,AVYawMax=0.0000000,OneOverAVYawMax=0.0000000,AVSample=none,NextAVSample=0,NumSamples=3,OneOverNumSamples=1.0000000,TargetRoll=0.0000000,CurrentRoll=0.0000000,Rate=0,PrePhysicsRotation=(Pitch=0,Yaw=0,Roll=0),MeshRotation=(Pitch=0,Yaw=0,Roll=0),MeshTranslation=(X=0.0000000,Y=0.0000000,Z=0.0000000),DefaultMeshTranslation=(X=0.0000000,Y=0.0000000,Z=0.0000000),DongoPawn=none,RollingWidth=50.0000000,RollingHeight=220.0000000,bDebugDraw=false,bDebugRoll=false,DebugRollInDeg=0.0000000)
    DongoMaterialParameter=(MIC=none,MICOriginal=none,matidx=-1,ParameterName="DamageFactor")
    DamageTypeChargeHit=Class'LPDamageTypeDongoRam'
    ChanceOfPlayingAggressiveClawStrike=0.0000000
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnDongo.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnDongo.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnDongo.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnDongo.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnDongo.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnDongo.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnDongo.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnDongo.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnDongo.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnDongo.FaceAudioComponent'
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
    // Reference: SPDamageStateComponent'Default__LPAIPawnDongo.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj
    end object
    Components[10]=DamageStateComponentDefObj
    bCanBeFrictionedTo=true
    bUseMultipleExtent=true
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnDongo.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}