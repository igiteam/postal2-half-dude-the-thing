class LPAIPawnTurret extends LPAIPawn
    abstract
    nativereplication
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

enum ETurretTrackingMode
{
    ETTM_None,                      // 0
    ETTM_Inactive,                  // 1
    ETTM_ScanForEnemies,            // 2
    ETTM_TrackTarget,               // 3
    ETTM_MAX                        // 4
};

struct native TurretSkelControllerInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SkelControllerName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SkelController;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsLocked;

    structdefaultproperties
    {
        SkelControllerName="None"
        SkelController=none
        bIsLocked=false
    }
};

struct native ReplicateDamageEffects
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ReplicateMe;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEffectsOn;

    structdefaultproperties
    {
        ReplicateMe=0
        bEffectsOn=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataTurret[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WeaponPitchSkelControlInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WeaponYawSkelControlInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FXAction_Turret;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private Rotator ReplicatedDesiredWorldAimDir[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private LPAIPawnTurret.ETurretTrackingMode ReplicatedAimControllerTrackingMode[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PerkIndex;
var(0.25_Pct) /*0xABD20000-0x00000000*/ private @NULL RepairInfographic[65537];
var(0.25_Pct) /*0xABD20000-0x00000400*/ private const export @NULL RepairableComponent[589825];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL HackComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private LPPlayerController OwningController[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BaseEMPDuration;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL EMPEffectComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL EMPSoundComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentTeamNum;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TeamColorMIC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FiringArc;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize export array DamageEffectComponents[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize export array DamageAudioComponents[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel ReplicateDamageEffects ReplicatedDamageEffects[538968065];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PreviousDamageThresholdArrayIndex[536870913];

// Export ULPAIPawnTurret::execEnableCollisionWithActors(FFrame&, void* const)
native simulated function EnableCollisionWithActors()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];


}

// Export ULPAIPawnTurret::execUpdateTurretController(FFrame&, void* const)
native final simulated function UpdateTurretController()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];


}

// Export ULPAIPawnTurret::execUpdateExplosionTextureStreaming(FFrame&, void* const)
native final simulated function UpdateExplosionTextureStreaming();

// Export ULPAIPawnTurret::execIsAiming(FFrame&, void* const)
native simulated function IsAiming()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawnTurret::execHandleWeaponFiring(FFrame&, void* const)
native simulated function HandleWeaponFiring();

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    FXAction_Turret = LPFXAction_Turret(FXActionManagerInstance.StartFXAction(Class'LPFXAction_Turret'));
    ReplicatedDamageEffects.bEffectsOn = false;
    ReplicatedDamageEffects.ReplicateMe = 0;
    PreviousDamageThresholdArrayIndex = -1;
    Mesh.SetRBCollidesWithChannel(2, true);
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataTurret = LPTuneDataAIPawnTurret(TuneData);
    super.InitTuneData(TuneData);
    // End:0x77
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        FloorConformInfo.ConformType = 0;
    }
    //return;    
}

simulated event Destroyed()
{
    local /*0x97E50000-0x00000000*/ private bool bIsClone;

    // End:0xA0
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0xA0
        if(IsAliveAndWell() && OwningController != none)
        {
            bIsClone = (HackComponent != none) && HackComponent.bClonedDeployment;
            OwningController.MPNotifyPerkDestroyed(self, PerkIndex, bIsClone);
        }
    }
    KillDamageEffects();
    PreviousDamageThresholdArrayIndex = -1;
    super.Destroyed();
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x51
    if(VarName == 'ReplicatedDamageEffects')
    {
        // End:0x44
        if(ReplicatedDamageEffects.bEffectsOn)
        {
            UpdateDamagedEffects();            
        }
        else
        {
            KillDamageEffects();
        }        
    }
    else
    {
        super(LPPawn).ReplicatedEvent(VarName);
    }
    //return;    
}

function Died()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x97E50000-0x00000000*/ private class Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bDied, bIsClone;
    local /*0x97E50000-0x00000000*/ private @NULL KillerPRI;

    bDied = super.Died(Killer, Damage, HitLoc);
    bIsClone = (HackComponent != none) && HackComponent.bClonedDeployment;
    // End:0x11C
    if(bDied)
    {
        OwningController.MPNotifyPerkDestroyed(self, PerkIndex, bIsClone);
        // End:0x11C
        if(LPPlayerController(Killer) != none)
        {
            KillerPRI = LPPRI(Killer.PlayerReplicationInfo);
            KillerPRI.ServerIncrementStat('Stat_TotemsDestroyed');
        }
    }
    KillDamageEffects();
    return bDied;
    //return ReturnValue;    
}

simulated function UpdateTeamColor()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP, MI, TD;
    local /*0x97E50000-0x00000000*/ private int Idx, TeamNum;
    local /*0x97E50000-0x00000000*/ private @NULL LCol;

    TeamNum = int(GetTeamNum());
    // End:0x275
    if(TeamNum != CurrentTeamNum)
    {
        CurrentTeamNum = TeamNum;
        LPP = LPPlayerPawn(Class'SPEngine.SPUtil'.static.GetPlayerOwner(0).Actor.Pawn);
        // End:0x275
        if(LPP != none)
        {
            TD = LPTuneDataPerkBeaconBase(LPP.GetPerkInstance(PerkIndex).GetTuneData());
            // End:0x275
            if((TD != none) && TD.TeamID_PhysMaterial != none)
            {
                // End:0x203
                if(TeamColorMIC == none)
                {
                    // End:0x202
                    foreach Mesh.SkeletalMesh.Materials(MI, Idx)
                    {
                        // End:0x201
                        if(MI.GetPhysicalMaterial() == TD.TeamID_PhysMaterial)
                        {
                            TeamColorMIC = Mesh.CreateAndSetMaterialInstanceConstant(Idx);                            
                        }
                        else
                        {                            
                        }
                    }                    
                }
                // End:0x275
                if(TeamColorMIC != none)
                {
                    LCol = Class'LPGameMP_Base'.static.GetTeamLinearColor(TeamNum);
                    TeamColorMIC.SetVectorParameterValue('TeamColor', LCol);
                }
            }
        }
    }
    //return;    
}

simulated function @NULL PerformPostInitAnimTreeActions()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelComp[8388609];

    super(LPPawn).PerformPostInitAnimTreeActions(SkelComp);
    // End:0x9E
    if(WeaponPitchSkelControlInfo.SkelControllerName != 'None')
    {
        WeaponPitchSkelControlInfo.SkelController = SkelControlSingleBone(SkelComp.FindSkelControl(WeaponPitchSkelControlInfo.SkelControllerName));
    }
    // End:0x129
    if(WeaponYawSkelControlInfo.SkelControllerName != 'None')
    {
        WeaponYawSkelControlInfo.SkelController = SkelControlSingleBone(SkelComp.FindSkelControl(WeaponYawSkelControlInfo.SkelControllerName));
    }
    //return;    
}

function GetMuzzleLocAndRot()
{
    local /*0x97E50000-0x00000000*/ private @NULL TipLoc[25165825], TipRot, PawnWeapon;

    TipRot = Rotation;
    TipLoc = Location;
    PawnWeapon = SPInventoryWeapon(Weapon);
    // End:0x82
    if(PawnWeapon != none)
    {
        PawnWeapon.GetMuzzleLocAndRot(TipLoc, TipRot);
    }
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(LPPawn).Tick(DeltaTime);
    // End:0x9D
    if(!IsInState('EMPShutdown'))
    {
        AimController.UpdateAim(DeltaTime);
        WorldAimDir = AimController.GetWorldAimRotator();
        UpdateTurretController(DeltaTime);
        UpdateTeamColor();
        UpdateExplosionTextureStreaming();
    }
    //return;    
}

simulated event HeadBoneName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'None';
    //return ReturnValue;    
}

simulated event BaseBoneName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'None';
    //return ReturnValue;    
}

simulated function DoRagdoll()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bRetval;

    bRetval = super(SPPawn).DoRagdoll();
    FXAction_Turret.End();
    TuneDataPawnFXEventBindings.PlayEventFX('Explode', self, Mesh, none);
    TuneDataPawnSoundEventBindings.PlayEventSoundLocally('Explode', 'None', self, none, none);
    // End:0x101
    if(bRetval)
    {
        DismemberPart('JO_Turret_Osc');
        DismemberPart('JO_Turret_Arm');
        DismemberPart('JO_Camer_Arm');
        DismemberPart('JO_WeaponMount');
    }
    return bRetval;
    //return ReturnValue;    
}

function SetTurretTrackingMode()
{
    local /*0x97E50000-0x00000000*/ private byte NewMode[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Aim;

    Aim = LPAimControlTurret(AimController);
    // End:0x53
    if(Aim != none)
    {
        Aim.SetTurretTrackingMode(NewMode);
    }
    //return;    
}

function IsIdle()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Aim;
    local /*0x97E50000-0x00000000*/ private byte Mode;

    Aim = LPAimControlTurret(AimController);
    // End:0x66
    if(Aim != none)
    {
        Mode = Aim.GetTurretTrackingMode();
        return int(Mode) != int(3);
    }
    return true;
    //return ReturnValue;    
}

simulated function StartEMP()
{
    // End:0xC4
    if(!IsInState('EMPShutdown'))
    {
        // End:0xAB
        if(LPPlayerController(EMPInfo.EMPInstigator.Controller) != none)
        {
            LPPlayerController(EMPInfo.EMPInstigator.Controller).IncrementStat('Stat_EMPShutdowns');
        }
        GotoState('EMPShutdown', 'Begin');        
    }
    else
    {
        SetTimer(EMPInfo.EMPDuration, false, 'EndEMPEffect');
    }
    //return;    
}

simulated function GetDefaultEMPDuration()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return BaseEMPDuration;
    //return ReturnValue;    
}

event HealDamage()
{
    local /*0x97E50000-0x00000000*/ private int Amount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Healer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], ReturnVal;

    ReturnVal = super(SPPawn).HealDamage(Amount, Healer, DamageType);
    UpdateDamagedEffects();
    return ReturnVal;
    //return ReturnValue;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    // End:0x78
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        // End:0x78
        if((EventInstigator != none) && LPAIPawnSnowCrab(EventInstigator.Pawn) != none)
        {
            DamageAmount = 1000000;
        }
    }
    super.TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    UpdateDamagedEffects();
    //return;    
}

simulated function CanTakeNonCoreDamage()
{
    local /*0x97E50000-0x00000000*/ private class inDamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function @NULL UpdateDamagedEffects()
{
    local /*0x97E50000-0x00000000*/ private int I, iThresholdIndex;
    local /*0x97E50000-0x00000000*/ private float HealthPercent;
    local /*0x97E50000-0x00000000*/ private @NULL TD, PSC, AC, DmgThreshold;
    local /*0x97E50000-0x00000000*/ private int iHandled;

    HealthPercent = float(Health) / float(HealthMax);
    TD = LPTuneDataAIPawnTurret(TuneDataBasePawn);
    iHandled = 0;
    iThresholdIndex = 0;
    J0x54:

    // End:0x486 [Loop If]
    if(iThresholdIndex < TD.DamageThresholdList.Length)
    {
        DmgThreshold = TD.DamageThresholdList[iThresholdIndex];
        // End:0x478
        if((HealthPercent >= DmgThreshold.DamageEffectsThresholdMin) && HealthPercent <= DmgThreshold.DamageEffectsThresholdMax)
        {
            // End:0x14A
            if(ReplicatedDamageEffects.bEffectsOn)
            {
                // End:0x14A
                if(iThresholdIndex != PreviousDamageThresholdArrayIndex)
                {
                    KillDamageEffects();
                }
            }
            // End:0x46A
            if(!ReplicatedDamageEffects.bEffectsOn)
            {
                I = 0;
                J0x177:

                // End:0x2F9 [Loop If]
                if(I < DmgThreshold.DamageParticles.Length)
                {
                    // End:0x2EB
                    if(DmgThreshold.DamageParticles[I].ParticleSystem != none)
                    {
                        PSC = SPEmitterPool(WorldInfo.MyEmitterPool).SPSpawnEmitterMeshAttachment(DmgThreshold.DamageParticles[I].ParticleSystem, Mesh, DmgThreshold.DamageParticles[I].SocketName, true);
                        // End:0x2EB
                        if(PSC != none)
                        {
                            PSC.ActivateSystem();
                            DamageEffectComponents.AddItem(PSC);                            
                        }
                    }
                    I++;
                    // [Loop Continue]
                    goto J0x177;
                }
                I = 0;
                J0x304:

                // End:0x41A [Loop If]
                if(I < DmgThreshold.DamageSounds.Length)
                {
                    AC = AudioComponent(TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx(DmgThreshold.DamageSounds[I], 'None', self, none, none));
                    AC.bAutoDestroy = false;
                    AC.bUseOwnerLocation = true;
                    AC.Play();
                    DamageAudioComponents.AddItem(AC);                    
                    I++;
                    // [Loop Continue]
                    goto J0x304;
                }
                ReplicatedDamageEffects.bEffectsOn = true;
                ++ReplicatedDamageEffects.ReplicateMe;
                PreviousDamageThresholdArrayIndex = iThresholdIndex;
            }
            ++iHandled;
            // [Explicit Break]
            goto J0x486;
        }
        ++iThresholdIndex;
        // [Loop Continue]
        goto J0x54;
    }
    J0x486:

    // End:0x4C1
    if((iHandled == 0) && ReplicatedDamageEffects.bEffectsOn)
    {
        KillDamageEffects();
    }
    //return;    
}

simulated function KillDamageEffects()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = DamageEffectComponents.Length - 1;
    J0x17:

    // End:0x72 [Loop If]
    if(I >= 0)
    {
        DamageEffectComponents[I].DeactivateSystem();
        DamageEffectComponents.Remove(I, 1);        
        I--;
        // [Loop Continue]
        goto J0x17;
    }
    I = DamageAudioComponents.Length - 1;
    J0x89:

    // End:0x10D [Loop If]
    if(I >= 0)
    {
        DamageAudioComponents[I].Stop();
        DamageAudioComponents[I].DetachFromAny();
        DamageAudioComponents.Remove(I, 1);        
        I--;
        // [Loop Continue]
        goto J0x89;
    }
    ReplicatedDamageEffects.bEffectsOn = false;
    ++ReplicatedDamageEffects.ReplicateMe;
    PreviousDamageThresholdArrayIndex = -1;
    //return;    
}

function SetMovementPhysics()
{
    SetPhysics(4);
    //return;    
}

simulated function EndEMPEffect()
{
    EMPInfo.EMPDuration = 0.0000000;
    EMPInfo.EMPRepCount++;
    GotoState('None');
    //return;    
}

simulated state EMPShutdown
{
    ignores SetTurretTrackingMode, StartFire;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PrevStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL Aim;

        Aim = LPAimControlTurret(AimController);
        // End:0x4C
        if(Aim != none)
        {
            Aim.SetTurretTrackingMode(1);
        }
        StopFire(0);
        //return;        
    }

    function IsIdle()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL Aim, TurretAI;

        // End:0x63
        if(NextStateName == 'None')
        {
            Aim = LPAimControlTurret(AimController);
            // End:0x63
            if(Aim != none)
            {
                Aim.SetTurretTrackingMode(2);
            }
        }
        TurretAI = LPAIControllerTurret(Controller);
        // End:0xCC
        if(TurretAI != none)
        {
            TurretAI.AbortCommand(TurretAI.CommandList);
        }
        EMPEffectComponent.DeactivateSystem();
        EMPSoundComponent.FadeOut(0.5000000, 0.0000000);
        //return;        
    }
Begin:

    EMPEffectComponent = TuneDataPawnFXEventBindings.PlayEventFX('EMPHit', self, Mesh, none);
    // End:0x9D
    if(EMPEffectComponent != none)
    {
        EMPEffectComponent.__OnSystemFinished__Delegate = None;
        EMPEffectComponent.SetActive(true);
    }
    EMPSoundComponent = AudioComponent(TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('EMPHit', 'EMPHit', self, Mesh, none));
    // End:0x11E
    if(EMPSoundComponent != none)
    {
        EMPSoundComponent.bStopWhenOwnerDestroyed = true;
    }
    SetTimer(EMPInfo.EMPDuration, false, 'EndEMPEffect');
    stop;                
}

defaultproperties
{
    WeaponPitchSkelControlInfo=(SkelControllerName="WeaponControlPitch",SkelController=none,bIsLocked=false)
    WeaponYawSkelControlInfo=(SkelControllerName="WeaponControlYaw",SkelController=none,bIsLocked=false)
    // Reference: LPHackableTotemBaseComponent'Default__LPAIPawnTurret.HackComponentA'
    begin object name=HackComponentA class=Class'LPHackableTotemBaseComponent'
    end object
    HackComponent=HackComponentA
    CurrentTeamNum=255
    bShouldRagdoll=true
    bReplicateWorldAimDir=false
    // Reference: LPAIResManTurret'Default__LPAIPawnTurret.LPAIResManTurret'
    begin object name=LPAIResManTurret class=Class'LPAIResManTurret'
    end object
    AIResourceManager=LPAIResManTurret
    // Reference: LPAimControlTurret'Default__LPAIPawnTurret.AimControl'
    begin object name=AimControl class=Class'LPAimControlTurret'
    end object
    AimController=AimControl
    InventoryAttachSlotArray=/* Array type was not detected. */
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnTurret.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnTurret.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnTurret.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0 class=Class'LPFXActionManager'
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    SinkDepthMultiplier=0.0000000
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnTurret.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnTurret.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnTurret.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnTurret.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    bIgnoreForces=true
    BaseEyeHeight=50.0000000
    // Reference: SkeletalMeshComponent'Default__LPAIPawnTurret.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnTurret.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnTurret.FaceAudioComponent'
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
    // Reference: KynapseObstacleComponent'Default__LPAIPawnTurret.KynapseObstacle0'
    begin object name=KynapseObstacle0 class=Class'Engine.KynapseObstacleComponent'
    end object
    Components[9]=KynapseObstacle0
    Components[10]=LPAIResManTurret
    Components[11]=FXActionManagerDefObj0
    Components[12]=HackComponentA
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnTurret.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
    RotationRate=(Pitch=0,Yaw=0,Roll=0)
}