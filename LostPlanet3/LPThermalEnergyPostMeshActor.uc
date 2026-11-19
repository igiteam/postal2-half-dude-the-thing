class LPThermalEnergyPostMeshActor extends LPSkeletalMeshActor
    abstract
    nativereplication
    hidecategories(AnimDependency,Navigation);

enum EDeploymentState
{
    EDeploymentState_Uninitialized, // 0
    EDeploymentState_Disabled,      // 1
    EDeploymentState_Ghosted,       // 2
    EDeploymentState_Inflating,     // 3
    EDeploymentState_ReInflating,   // 4
    EDeploymentState_Extracting,    // 5
    EDeploymentState_Unstable,      // 6
    EDeploymentState_Deflating,     // 7
    EDeploymentState_MAX            // 8
};

enum EPostVisibility
{
    EPostVisibility_Disabled,       // 0
    EPostVisibility_Ghosted,        // 1
    EPostVisibility_Visible,        // 2
    EPostVisibility_MAX             // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPThermalEnergyPostMeshActor.EPostVisibility VisibilityState[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPThermalEnergyPostMeshActor.EDeploymentState DeploymentState[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private LPThermalEnergyPocketActor AttachedToPocket[2097153];
var(0.25_Pct) /*0x894C0000-0x00000000*/ private float Radius[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPPlayerPawn MyPlayerPawn[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPlayerController;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private const export @NULL CollisionCylinder[655361];
var(0.25_Pct) /*0x894C0000-0x00000000*/ private float EnergyTransferRatePerSecond[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int DamageTaken[2097153];
var(0.25_Pct) /*0x894C0000-0x00000000*/ private int OverrideHealth[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int Health[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int OldHealth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxHealth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ThermalPostTuneData;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL TransparentMesh[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ExplosionSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel name ReplicatedSeqName[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SeqOpenHold;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SeqClosedHold;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SeqClosing;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SeqOpening;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float UnstableTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InflationRateModifier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel float DeflationAnimStartTime[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PostExplosionTemplate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class MyDamageType;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ExtractionSoundComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ExtractionSoundCue;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ParticleComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int AssociatedTeamIndex[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBlockParentalStateChange;
var(0.25_Pct) /*0xBB7A0000-0x00000000*/ private travel bool bDeployWhenPlaced[2162689];
var(0.25_Pct) /*0xBB7A0000-0x00000000*/ private bool bGhostedPostVisibleBeforeDeployment[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGhostedPostVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDelayRecharging;
var(0.25_Pct) /*0x6C620000-0x00000400*/ private const export @NULL SPInteractionComponent[589825];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL FlareComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ParticleDamageComponent[524289];
var(0.25_Pct) /*0xBB7A0000-0x00000000*/ private float MaximumBatteryCapacity[65537];
var(0.25_Pct) /*0xBB7A0000-0x00000000*/ private float InitialBatteryCapacity[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentBatteryCapacity[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EMPDuration;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel EMPInfoStruct EMPInfo[2097153];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL EMPEffectComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL EMPSoundComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name PreviousState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TransferSoundCue;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL TransferSoundComponent[524289];

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25165825];

    super(SkeletalMeshActor).CreateCheckpointRecord(Record);
    Record.VisibilityState = int(VisibilityState);
    Record.DeploymentState = int(DeploymentState);
    Record.DamageTaken = DamageTaken;
    Record.Health = Health;
    Record.DeflationAnimStartTime = DeflationAnimStartTime;
    Record.AssociatedTeamIndex = AssociatedTeamIndex;
    Record.CurrentBatteryCapacity = CurrentBatteryCapacity;
    Record.bDelayRecharging = bDelayRecharging;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25296897];

    super(SkeletalMeshActor).ApplyCheckpointRecord(Record);
    VisibilityState = byte(Record.VisibilityState);
    DeploymentState = byte(Record.DeploymentState);
    DamageTaken = Record.DamageTaken;
    Health = Record.Health;
    DeflationAnimStartTime = Record.DeflationAnimStartTime;
    AssociatedTeamIndex = Record.AssociatedTeamIndex;
    CurrentBatteryCapacity = Record.CurrentBatteryCapacity;
    bDelayRecharging = Record.bDelayRecharging;
    ChangeDeploymentState(DeploymentState);
    SetParticleColor(AssociatedTeamIndex);
    CheckDamageState(DamageTaken, 0);
    //return;    
}

simulated event GetMasterTuneDataReference()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ThermalPostTuneData;
    //return ReturnValue;    
}

simulated function InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super(Actor).InitTuneData(TuneData);
    ThermalPostTuneData = LPTuneDataThermalEnergyPost(TuneData);
    // End:0x456
    if(ThermalPostTuneData != none)
    {
        // End:0x88
        if(OverrideHealth <= 0)
        {
            Health = ThermalPostTuneData.Health;
            OldHealth = Health;
        }
        // End:0xD4
        if(ThermalPostTuneData.ExplosionSound != none)
        {
            ExplosionSound = ThermalPostTuneData.ExplosionSound;
        }
        // End:0x128
        if(ThermalPostTuneData.SeqOpenHold != 'None')
        {
            SeqOpenHold = ThermalPostTuneData.SeqOpenHold;
        }
        // End:0x17C
        if(ThermalPostTuneData.SeqClosedHold != 'None')
        {
            SeqClosedHold = ThermalPostTuneData.SeqClosedHold;
        }
        // End:0x1D0
        if(ThermalPostTuneData.SeqClosing != 'None')
        {
            SeqClosing = ThermalPostTuneData.SeqClosing;
        }
        // End:0x224
        if(ThermalPostTuneData.SeqOpening != 'None')
        {
            SeqOpening = ThermalPostTuneData.SeqOpening;
        }
        // End:0x272
        if(ThermalPostTuneData.UnstableTime != float(0))
        {
            UnstableTime = ThermalPostTuneData.UnstableTime;
        }
        // End:0x2C0
        if(ThermalPostTuneData.InflationRateModifier != float(0))
        {
            InflationRateModifier = ThermalPostTuneData.InflationRateModifier;
        }
        // End:0x30E
        if(ThermalPostTuneData.EnergyTransferRatePerSecond != float(0))
        {
            EnergyTransferRatePerSecond = ThermalPostTuneData.EnergyTransferRatePerSecond;
        }
        // End:0x35A
        if(ThermalPostTuneData.PostExplosionTemplate != none)
        {
            PostExplosionTemplate = ThermalPostTuneData.PostExplosionTemplate;
        }
        // End:0x3BB
        if(ThermalPostTuneData.ExtractionParticleSystem != none)
        {
            ParticleComponent.SetTemplate(ThermalPostTuneData.ExtractionParticleSystem);
        }
        // End:0x41D
        if(ThermalPostTuneData.ExtractionLensFlare != none)
        {
            FlareComponent.SetTemplate(ThermalPostTuneData.ExtractionLensFlare);
        }
        // End:0x456
        if(MaximumBatteryCapacity <= float(0))
        {
            MaximumBatteryCapacity = ThermalPostTuneData.MaximumBatteryCapacity;
        }
    }
    // End:0x465
    if(Health <= 0)
    {
    }
    MaxHealth = Health;
    // End:0x4B7
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        CurrentBatteryCapacity = InitialBatteryCapacity;        
    }
    else
    {
        CurrentBatteryCapacity = MaximumBatteryCapacity;
    }
    bDelayRecharging = false;
    ClearTimer('DisableRechargeDelay');
    //return;    
}

simulated function IsPawnInRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Distance;

    Distance = VSize2D(Location - inPawn.Location);
    // End:0x77
    if(Distance > (Radius + inPawn.GetCollisionRadius()))
    {
        return false;
    }
    Distance = Abs(Location.Z - inPawn.Location.Z);
    // End:0x121
    if(Distance > (CollisionCylinder.CollisionHeight + inPawn.GetCollisionHeight()))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

simulated function SetGhostedVisibility()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    // End:0xD5
    if(bGhostedPostVisible != bVisible)
    {
        bGhostedPostVisible = bVisible;
        TransparentMesh.SetHidden(!bVisible);
        // End:0xA0
        if(bVisible)
        {
            // End:0x9D
            if(!TransparentMesh.bAttached)
            {
                AttachComponent(TransparentMesh);
            }            
        }
        else
        {
            // End:0xD5
            if(TransparentMesh.bAttached)
            {
                DetachComponent(TransparentMesh);
            }
        }
    }
    //return;    
}

simulated function SetVisibilityState()
{
    local /*0x97E50000-0x00000000*/ private byte inVisibilityState[8388609];

    VisibilityState = inVisibilityState;
    switch(VisibilityState)
    {
        // End:0xFE
        case 0:
            SetGhostedVisibility(false);
            SkeletalMeshComponent.SetHidden(true);
            // End:0x8B
            if(SkeletalMeshComponent.bAttached)
            {
                DetachComponent(SkeletalMeshComponent);
            }
            // End:0xC0
            if(LightEnvironment.bAttached)
            {
                DetachComponent(LightEnvironment);
            }
            // End:0xF5
            if(SPInteractionComponent.bAttached)
            {
                DetachComponent(SPInteractionComponent);
            }
            SetCollision(false, false);
            // End:0x2BA
            break;
        // End:0x1D9
        case 1:
            UpdateGhostedVisibility();
            SkeletalMeshComponent.SetHidden(true);
            // End:0x162
            if(SkeletalMeshComponent.bAttached)
            {
                DetachComponent(SkeletalMeshComponent);
            }
            // End:0x199
            if(!LightEnvironment.bAttached)
            {
                AttachComponent(LightEnvironment);
            }
            // End:0x1D0
            if(!SPInteractionComponent.bAttached)
            {
                AttachComponent(SPInteractionComponent);
            }
            SetCollision(true, false);
            // End:0x2BA
            break;
        // End:0x2B7
        case 2:
            SetGhostedVisibility(false);
            SkeletalMeshComponent.SetHidden(false);
            // End:0x240
            if(!SkeletalMeshComponent.bAttached)
            {
                AttachComponent(SkeletalMeshComponent);
            }
            // End:0x277
            if(!LightEnvironment.bAttached)
            {
                AttachComponent(LightEnvironment);
            }
            // End:0x2AE
            if(!SPInteractionComponent.bAttached)
            {
                AttachComponent(SPInteractionComponent);
            }
            SetCollision(true, false);
            // End:0x2BA
            break;
        // End:0xFFFF
        default:
            break;
    }
    switch(DeploymentState)
    {
        // End:0x2D2
        case 0:
        // End:0x2D7
        case 1:
        // End:0x2DC
        case 2:
        // End:0x2E1
        case 3:
        // End:0x2E6
        case 6:
        // End:0x2EB
        case 7:
        // End:0x38F
        case 4:
            ParticleComponent.KillParticlesForced();
            ParticleComponent.DeactivateSystem();
            ParticleDamageComponent.KillParticlesForced();
            ParticleDamageComponent.DeactivateSystem();
            FlareComponent.SetIsActive(false);
            // End:0x456
            break;
        // End:0x453
        case 5:
            // End:0x450
            if(!IsInState('EMPShutdown'))
            {
                // End:0x3EA
                if(!ParticleComponent.bIsActive)
                {
                    ParticleComponent.ActivateSystem();
                }
                SkeletalMeshComponent.AttachComponentToSocket(FlareComponent, ThermalPostTuneData.ExtractionLensFlareSocketName);
                FlareComponent.SetIsActive(true);
            }
            // End:0x456
            break;
        // End:0xFFFF
        default:
            break;
    }
    ParticleComponent.LastRenderTime = WorldInfo.TimeSeconds;
    //return;    
}

simulated event SetInitialState()
{
    bScriptInitialized = true;
    //return;    
}

simulated function ResetPost()
{
    DeploymentState = 1;
    SetVisibilityState(0);
    GotoState('Disabled');
    SetPlayerPawn(none);
    // End:0x7B
    if(ThermalPostTuneData != none)
    {
        Health = ThermalPostTuneData.Health;
        OldHealth = Health;
    }
    DamageTaken = 0;
    // End:0xBF
    if(ExtractionSoundComponent != none)
    {
        ExtractionSoundComponent.Stop();
        ExtractionSoundComponent = none;
    }
    AssociatedTeamIndex = -1;
    CurrentBatteryCapacity = InitialBatteryCapacity;
    bDelayRecharging = false;
    ClearTimer('DisableRechargeDelay');
    //return;    
}

simulated function ParentPocketStateHasChanged()
{
    local /*0x97E50000-0x00000000*/ private bool bEnabled[8388609];

    //return;    
}

function DeployPost()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609];

    //return;    
}

simulated function IsDeployed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsTransitioning()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsExtracting()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsUnstable()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsInflating()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsAvailable()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function AbortInflation()
{
    //return;    
}

simulated event OnAnimEnd()
{
    local /*0x97E50000-0x00000000*/ private @NULL InSeqNode[8388609];
    local /*0x97E50000-0x00000000*/ private float PlayedTime[8388609], ExcessTime;

    //return;    
}

function AttachToPocket()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];

    AttachedToPocket = P;
    SetPlayerPawn(none);
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

simulated event CanBeAttacked()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return IsExtracting();
    //return ReturnValue;    
}

simulated event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    // End:0x2D
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return;
    }
    super(SkeletalMeshActor).TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    //return;    
}

function scoreTeamPoint()
{
    local /*0x97E50000-0x00000000*/ private float EnergyToTransfer[8388609], ExchangeRate;

    ExchangeRate = ThermalPostTuneData.TEnergyPointExchangeRate;
    ExchangeRate *= EnergyToTransfer;
    LPTeamInfo_MP(WorldInfo.GRI.Teams[int(MyPlayerController.GetTeamNum())]).AccumulateTEnergyExtractionForScore(MyPlayerController, ExchangeRate);
    TriggerEventClass(Class'LPSeqEvent_ThermalEnergyPostFull', self);
    //return;    
}

function accumulatePersonalTEnergy()
{
    local /*0x97E50000-0x00000000*/ private float EnergyToTransfer[8388609], ExchangeRate;
    local /*0x97E50000-0x00000000*/ private @NULL LPC;
    local /*0x97E50000-0x00000000*/ private float DistanceThreshold, Distance;

    // End:0x1BA
    if(int(Role) == int(ROLE_Authority))
    {
        ExchangeRate = ThermalPostTuneData.TEnergyPointExchangeRate;
        ExchangeRate *= EnergyToTransfer;
        // End:0x87
        if(ThermalPostTuneData != none)
        {
            DistanceThreshold = ThermalPostTuneData.DistanceThresholdForEnergyAbsorbtion;
        }
        // End:0x1B9
        foreach WorldInfo.AllControllers(Class'LPPlayerController', LPC)
        {
            // End:0x1B8
            if(LPC.Pawn != none)
            {
                Distance = VSize(Location - LPC.Pawn.Location);
                // End:0x1B8
                if((int(LPC.GetTeamNum()) == AssociatedTeamIndex) && Distance < DistanceThreshold)
                {
                    LPPawn(LPC.Pawn).AddThermalEnergy(ExchangeRate, false);
                }
            }            
        }        
    }
    //return;    
}

function BeginTransferEnergyFromBattery()
{
    // End:0x55
    if(TransferSoundComponent != none)
    {
        // End:0x52
        if(!TransferSoundComponent.IsPlaying())
        {
            TransferSoundComponent.Play();
        }        
    }
    else
    {
        // End:0x138
        if(TransferSoundCue != none)
        {
            TransferSoundComponent = CreateAudioComponent(TransferSoundCue, false, true);
            // End:0x138
            if(TransferSoundComponent != none)
            {
                TransferSoundComponent.bUseOwnerLocation = true;
                TransferSoundComponent.bAutoDestroy = true;
                TransferSoundComponent.bStopWhenOwnerDestroyed = true;
                TransferSoundComponent.bShouldRemainActiveIfDropped = true;
                TransferSoundComponent.Play();
            }
        }
    }
    //return;    
}

function ForceCapacity()
{
    local /*0x97E50000-0x00000000*/ private bool bFull[8388609];

    // End:0x36
    if(bFull)
    {
        CurrentBatteryCapacity = MaximumBatteryCapacity;
        InitialBatteryCapacity = MaximumBatteryCapacity;        
    }
    else
    {
        CurrentBatteryCapacity = 0.0000000;
        InitialBatteryCapacity = 0.0000000;
    }
    //return;    
}

function EndTransferEnergyFromBattery()
{
    // End:0x39
    if(TransferSoundComponent != none)
    {
        TransferSoundComponent.Stop();
        TransferSoundComponent = none;
    }
    // End:0x178
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        // End:0x165
        if(CurrentBatteryCapacity == float(0))
        {
            // End:0xA1
            if(AttachedToPocket != none)
            {
                AttachedToPocket.ThermalEnergyTransferComplete();
            }
            SendTransferCompleteEvent();
            // End:0x105
            if(ExtractionSoundComponent != none)
            {
                // End:0x105
                if(ExtractionSoundComponent.IsPlaying())
                {
                    ExtractionSoundComponent.FadeOut(0.7000000, 0.0000000);
                }
            }
            // End:0x133
            if(ParticleComponent != none)
            {
                ParticleComponent.DeactivateSystem();
            }
            // End:0x162
            if(FlareComponent != none)
            {
                FlareComponent.SetIsActive(false);
            }            
        }
        else
        {
            CurrentBatteryCapacity = MaximumBatteryCapacity;
        }
    }
    //return;    
}

simulated function TransferEnergyFromBattery()
{
    local /*0x97E50000-0x00000000*/ private float EnergyToTransfer[8388609], ReturnValue;

    // End:0x2A
    if((CurrentBatteryCapacity <= float(0)) || EnergyToTransfer < float(0))
    {
        return 0.0000000;
    }
    EnergyToTransfer = FClamp(EnergyToTransfer, 0.0000000, CurrentBatteryCapacity);
    CurrentBatteryCapacity -= EnergyToTransfer;
    SetBatteryLevelIndicator(CurrentBatteryCapacity / MaximumBatteryCapacity);
    bDelayRecharging = true;
    SetTimer(5.0000000, false, 'DisableRechargeDelay');
    return EnergyToTransfer;
    //return ReturnValue;    
}

simulated function AddEnergyToBattery()
{
    local /*0x97E50000-0x00000000*/ private float EnergyToTransfer[8388609], ReturnValue;

    CurrentBatteryCapacity += EnergyToTransfer;
    // End:0x73
    if(CurrentBatteryCapacity >= MaximumBatteryCapacity)
    {
        TriggerEventClass(Class'LPSeqEvent_ThermalEnergyPostFull', self);
        EnergyToTransfer = MaximumBatteryCapacity - CurrentBatteryCapacity;
        CurrentBatteryCapacity = MaximumBatteryCapacity;
    }
    return EnergyToTransfer;
    //return ReturnValue;    
}

simulated function DisableRechargeDelay()
{
    bDelayRecharging = false;
    //return;    
}

simulated function ChangeDeploymentState()
{
    local /*0x97E50000-0x00000000*/ private byte DepState[8388609];

    switch(DepState)
    {
        // End:0x18
        case 0:
        // End:0x2E
        case 1:
            GotoState('Disabled');
            // End:0xB5
            break;
        // End:0x44
        case 2:
            GotoState('Ghosted');
            // End:0xB5
            break;
        // End:0x5A
        case 3:
            GotoState('Inflating');
            // End:0xB5
            break;
        // End:0x70
        case 4:
            GotoState('ReInflating');
            // End:0xB5
            break;
        // End:0x86
        case 5:
            GotoState('Extracting');
            // End:0xB5
            break;
        // End:0x9C
        case 6:
            GotoState('Unstable');
            // End:0xB5
            break;
        // End:0xB2
        case 7:
            GotoState('Deflating');
            // End:0xB5
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
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeq, LPC;

    // End:0x2D
    if(VarName == 'DeploymentState')
    {
        ChangeDeploymentState(DeploymentState);        
    }
    else
    {
        // End:0x5A
        if(VarName == 'VisibilityState')
        {
            SetVisibilityState(VisibilityState);            
        }
        else
        {
            // End:0xFA
            if(VarName == 'DeflationAnimStartTime')
            {
                AnimSeq = AnimNodeSequence(SkeletalMeshComponent.Animations);
                // End:0xF7
                if(AnimSeq.AnimSeqName == SeqClosing)
                {
                    AnimSeq.SetPosition(DeflationAnimStartTime, true);
                }                
            }
            else
            {
                // End:0x127
                if(VarName == 'AssociatedTeamIndex')
                {
                    SetParticleColor(AssociatedTeamIndex);                    
                }
                else
                {
                    // End:0x1EF
                    if(VarName == 'DamageTaken')
                    {
                        // End:0x1D8
                        if(Health > DamageTaken)
                        {
                            // End:0x1D7
                            foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
                            {
                                // End:0x1D6
                                if(LPC.myLPHUD != none)
                                {
                                    LPC.myLPHUD.TENGPostTookDamage(AttachedToPocket, self);
                                }                                
                            }                            
                        }
                        CheckDamageState(DamageTaken, 0);                        
                    }
                    else
                    {
                        // End:0x21C
                        if(VarName == 'MyPlayerPawn')
                        {
                            SetPlayerPawn(MyPlayerPawn);                            
                        }
                        else
                        {
                            // End:0x270
                            if(VarName == 'Health')
                            {
                                CheckDamageState(Health, OldHealth - Health);
                                OldHealth = Health;                                
                            }
                            else
                            {
                                // End:0x294
                                if(VarName == 'bDeployWhenPlaced')
                                {
                                    SetExtracting();                                    
                                }
                                else
                                {
                                    // End:0x2CC
                                    if(VarName == 'CurrentBatteryCapacity')
                                    {
                                        SetBatteryLevelIndicator(CurrentBatteryCapacity / MaximumBatteryCapacity);                                        
                                    }
                                    else
                                    {
                                        // End:0x2FC
                                        if(VarName == 'EMPInfo')
                                        {
                                            GotoState('EMPShutdown', 'Begin');                                            
                                        }
                                        else
                                        {
                                            super(SPSkeletalMeshActor).ReplicatedEvent(VarName);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    //return;    
}

simulated function DoExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL explosionActor, ExplosionLoc;

    ExplosionLoc = Location;
    explosionActor = Spawn(Class'LPExplosionActor',,, ExplosionLoc + (vect(0.0000000, 0.0000000, 1.0000000) * float(32)), Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
    // End:0x1BF
    if(explosionActor != none)
    {
        explosionActor.TheWeaponThatSpawnedMe = none;
        explosionActor.Instigator = Instigator;
        explosionActor.InstigatorController = ((Instigator == none) ? none : Instigator.Controller);
        explosionActor.bDrawDebug = false;
        explosionActor.ExplosionPhysMaterial = ((SkeletalMeshComponent.PhysMaterialOverride != none) ? SPPhysicalMaterial(SkeletalMeshComponent.PhysMaterialOverride) : none);
        explosionActor.Explode(PostExplosionTemplate);
    }
    //return;    
}

reliable client simulated function MulticastDoExplosion()
{
    DoExplosion();
    //return;    
}

simulated function SetParticleColor()
{
    local /*0x97E50000-0x00000000*/ private int InIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Col, TeamColor, LCol;

    // End:0x11
    if(InIndex < 0)
    {
        return;
    }
    AssociatedTeamIndex = InIndex;
    // End:0x24E
    if(ParticleComponent != none)
    {
        TeamColor = Class'LPGameMP_Base'.static.GetTeamColor(InIndex);
        Col.X = float(TeamColor.R) / float(255);
        Col.Y = float(TeamColor.G) / float(255);
        Col.Z = float(TeamColor.B) / float(255);
        ParticleComponent.SetVectorParameter('InstanceColor', Col);
        // End:0x24E
        if(ThermalPostTuneData.bUseTeamColorForLensFlare)
        {
            LCol.R = Col.X;
            LCol.G = Col.Y;
            LCol.B = Col.Z;
            FlareComponent.SetSourceColor(LCol);
        }
    }
    //return;    
}

simulated function SetBatteryLevelIndicator()
{
    local /*0x97E50000-0x00000000*/ private float ScalarBatteryPercentage[8388609];

    //return;    
}

simulated function SetPlayerPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609];

    MyPlayerPawn = LPP;
    // End:0x56
    if(LPP != none)
    {
        MyPlayerController = LPPlayerController(LPP.Controller);        
    }
    else
    {
        MyPlayerController = none;
    }
    //return;    
}

simulated function SetPlayerController()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    // End:0x25
    if(LPC != none)
    {
        MyPlayerController = LPC;        
    }
    else
    {
        MyPlayerController = none;
    }
    //return;    
}

simulated function CheckDamageState()
{
    local /*0x97E50000-0x00000000*/ private int iNewHealth[8388609], iDifference;

    //return;    
}

simulated function SendTransferCompleteEvent()
{
    TriggerEventClass(Class'LPSeqEvent_ThermalEnergyPostBatteryTransferComplete', self);
    //return;    
}

simulated function GetInflationRateModifier()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PerkTechnician;

    // End:0xBE
    if(MyPlayerPawn != none)
    {
        PerkTechnician = LPPerkTechnician(MyPlayerPawn.GetEnabledPerk(18));
        // End:0xBE
        if(PerkTechnician != none)
        {
            return InflationRateModifier * (1.0000000 + (PerkTechnician.TechnicianTuneData.DeploymentTimeDecrease.GetValue(MyPlayerController) / float(100)));
        }
    }
    return InflationRateModifier;
    //return ReturnValue;    
}

simulated function UpdateGhostedVisibility()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;
    local /*0x97E50000-0x00000000*/ private bool bShouldBeVisible;

    bShouldBeVisible = false;
    // End:0x148
    if((int(WorldInfo.NetMode) == int(NM_Standalone)) && !bGhostedPostVisibleBeforeDeployment)
    {
        // End:0x144
        foreach WorldInfo.LocalPlayerControllers(Class'LPPlayerController', LPC)
        {
            // End:0x143
            if(LPC.Pawn.IsAliveAndWell())
            {
                // End:0x143
                if(VSizeSq(Location - LPC.Pawn.Location) <= (ThermalPostTuneData.DistanceToRevealGhosted * ThermalPostTuneData.DistanceToRevealGhosted))
                {
                    bShouldBeVisible = true;
                    // End:0x144
                    break;
                }
            }            
        }                
    }
    else
    {
        bShouldBeVisible = true;
    }
    SetGhostedVisibility(bShouldBeVisible);
    //return;    
}

simulated function GetInflationPercentage()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 0.0000000;
    //return ReturnValue;    
}

simulated function SetExtracting()
{
    DeploymentState = 5;
    GotoState('Extracting');
    //return;    
}

auto state Disabled
{
    ignores OnAnimEnd, Touch, UnTouch, DeployPost, TakeDamage, EndState;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPC;

        DeploymentState = 1;
        SetVisibilityState(0);
        Health = MaxHealth;
        SkeletalMeshComponent.Animations.StopAnim();
        // End:0xE2
        foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
        {
            // End:0xE1
            if(LPC.myLPHUD != none)
            {
                LPC.myLPHUD.TENGPostChangedOwner(AttachedToPocket, self);
            }            
        }        
        SetPlayerPawn(none);
        // End:0x105
        if(bDeployWhenPlaced)
        {
            SetExtracting();
        }
        //return;        
    }

    simulated function ParentPocketStateHasChanged()
    {
        local /*0x97E50000-0x00000000*/ private bool bEnabled[8388609];

        // End:0x1B
        if(bEnabled)
        {
            GotoState('Ghosted');
        }
        //return;        
    }
    stop;    
}

state Ghosted
{
    ignores OnAnimEnd, TakeDamage;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPC, LPP;

        DeploymentState = 2;
        SetVisibilityState(1);
        Health = MaxHealth;
        // End:0x55
        if(int(Role) == int(ROLE_Authority))
        {
            PlayCustomAnim(true, SeqClosedHold);
        }
        AnimNodeSequence(SkeletalMeshComponent.Animations).Rate = 1.0000000;
        // End:0x11A
        foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
        {
            // End:0x119
            if(LPC.myLPHUD != none)
            {
                LPC.myLPHUD.TENGPostChangedOwner(AttachedToPocket, self);
            }            
        }        
        // End:0x162
        foreach TouchingActors(Class'LPPlayerPawn', LPP)
        {
            Touch(LPP, none, vect(0.0000000, 0.0000000, 0.0000000), vect(0.0000000, 0.0000000, 0.0000000));            
        }        
        SetPlayerPawn(none);
        SetTimer(0.2000000, true, 'UpdateGhostedVisibility');
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPC;

        // End:0x3F
        foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
        {
            LPC.ClearThermalPostMessage();            
        }        
        ClearTimer('UpdateGhostedVisibility');
        //return;        
    }

    simulated function ParentPocketStateHasChanged()
    {
        local /*0x97E50000-0x00000000*/ private bool bEnabled[8388609];

        // End:0x1D
        if(!bEnabled)
        {
            GotoState('Disabled');
        }
        //return;        
    }

    function DeployPost()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LP[8388609];

        // End:0x11
        if(LP == none)
        {
            return;
        }
        SetPlayerPawn(LP);
        GotoState('Inflating');
        //return;        
    }

    simulated event UnTouch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], LPP, LPC;

        LPP = LPPlayerPawn(Other);
        // End:0xCE
        if(LPP != none)
        {
            LPC = LPPlayerController(LPP.Controller);
            // End:0xCE
            if(LPC != none)
            {
                LPC.ClearThermalPostMessage();
                // End:0xCE
                if(LPC.LastTouchedThermalPost == self)
                {
                    LPC.LastTouchedThermalPost = none;
                }
            }
        }
        super(LPThermalEnergyPostMeshActor).UnTouch(Other);
        //return;        
    }

    simulated event @NULL Touch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, LPP, LPC;

        super(LPThermalEnergyPostMeshActor).Touch(Other, OtherComp, HitLocation, HitNormal);
        LPP = LPPlayerPawn(Other);
        // End:0x5B
        if(LPP == none)
        {
            return;
        }
        LPC = LPPlayerController(LPP.Controller);
        // End:0xC3
        if((LPC == none) || !LPC.IsLocalPlayerController())
        {
            return;
        }
        // End:0xEA
        if(LPC.GetPlayersThermalPost() != none)
        {
            return;
        }
        LPC.DisplayThermalPostMessage_Drop();
        LPC.LastTouchedThermalPost = self;
        //return;        
    }

    simulated function IsAvailable()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x22
        if((MyPlayerController != none) || MyPlayerPawn != none)
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }
    stop;    
}

state Inflating
{
    ignores Touch, DeployPost, TakeDamage;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPC;
        local /*0x97E50000-0x00000000*/ private float AnimLength;

        DeploymentState = 3;
        SetVisibilityState(2);
        // End:0x42
        if(int(Role) == int(ROLE_Authority))
        {
            PlayCustomAnim(false, SeqOpening);
        }
        AnimNodeSequence(SkeletalMeshComponent.Animations).Rate = GetInflationRateModifier();
        // End:0x102
        if(int(Role) == int(ROLE_Authority))
        {
            AnimLength = AnimNodeSequence(SkeletalMeshComponent.Animations).GetAnimPlaybackLength();
            SetTimer(AnimLength + 0.0100000, false, 'SetExtracting');
        }
        // End:0x18D
        foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
        {
            // End:0x18C
            if(LPC.myLPHUD != none)
            {
                LPC.myLPHUD.TENGPostDeploying(AttachedToPocket, self, AssociatedTeamIndex);
            }            
        }        
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        ClearTimer('SetExtracting');
        //return;        
    }

    simulated event OnAnimEnd()
    {
        local /*0x97E50000-0x00000000*/ private @NULL InSeqNode[8388609];
        local /*0x97E50000-0x00000000*/ private float PlayedTime[8388609], ExcessTime;

        // End:0x1E
        if(int(Role) == int(ROLE_Authority))
        {
            SetExtracting();
        }
        //return;        
    }

    simulated function IsTransitioning()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    simulated function IsInflating()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    simulated function ParentPocketStateHasChanged()
    {
        local /*0x97E50000-0x00000000*/ private bool bEnabled[8388609];

        // End:0x1D
        if(!bEnabled)
        {
            GotoState('Deflating');
        }
        //return;        
    }

    function AbortInflation()
    {
        GotoState('Unstable');
        //return;        
    }

    simulated function GetInflationPercentage()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL Seq;

        Seq = AnimNodeSequence(SkeletalMeshComponent.Animations);
        // End:0x46
        if(Seq == none)
        {
            return 0.0000000;
        }
        return Seq.GetNormalizedPosition();
        //return ReturnValue;        
    }
    stop;    
}

state ReInflating extends Inflating
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPC, AnimSeq;
        local /*0x97E50000-0x00000000*/ private float animPos;

        DeploymentState = 3;
        SetVisibilityState(2);
        AnimSeq = AnimNodeSequence(SkeletalMeshComponent.Animations);
        AnimSeq.Rate = GetInflationRateModifier();
        // End:0xFE
        if(int(Role) == int(ROLE_Authority))
        {
            animPos = 1.0000000 - AnimSeq.GetNormalizedPosition();
            animPos *= AnimSeq.GetAnimPlaybackLength();
            SetTimer(animPos + 0.0100000, false, 'SetExtracting');
        }
        // End:0x189
        foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
        {
            // End:0x188
            if(LPC.myLPHUD != none)
            {
                LPC.myLPHUD.TENGPostDeploying(AttachedToPocket, self, AssociatedTeamIndex);
            }            
        }        
        //return;        
    }
    stop;    
}

state Extracting
{
    ignores OnAnimEnd, DeployPost;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPC;

        DeploymentState = 5;
        SetVisibilityState(2);
        // End:0xBF
        if(int(Role) == int(ROLE_Authority))
        {
            PlayCustomAnim(true, SeqOpenHold);
            TriggerEventClass(Class'LPSeqEvent_ThermalEnergyPostActivated', MyPlayerController);
            // End:0xBF
            if((ParticleComponent != none) && MyPlayerController != none)
            {
                AssociatedTeamIndex = int(MyPlayerController.GetTeamNum());
                SetParticleColor(AssociatedTeamIndex);
            }
        }
        AnimNodeSequence(SkeletalMeshComponent.Animations).Rate = 1.0000000;
        // End:0x156
        if(ExtractionSoundComponent != none)
        {
            // End:0x153
            if(!ExtractionSoundComponent.IsPlaying())
            {
                ExtractionSoundComponent.Play();
            }            
        }
        else
        {
            ExtractionSoundComponent = CreateAudioComponent(ExtractionSoundCue, false, true);
            // End:0x22A
            if(ExtractionSoundComponent != none)
            {
                ExtractionSoundComponent.bUseOwnerLocation = true;
                ExtractionSoundComponent.bAutoDestroy = true;
                ExtractionSoundComponent.bStopWhenOwnerDestroyed = true;
                ExtractionSoundComponent.bShouldRemainActiveIfDropped = true;
                ExtractionSoundComponent.Play();
            }
        }
        // End:0x2BA
        if(((MyPlayerController != none) && int(MyPlayerController.WorldInfo.NetMode) != int(NM_Standalone)) && PreviousStateName == 'Inflating')
        {
            MyPlayerController.IncrementStat('Stat_TPostsDeployed');
        }
        // End:0x332
        if(((MyPlayerController != none) && MyPlayerController.IsLocalController()) && MyPlayerController.myLPHUD != none)
        {
            MyPlayerController.ClearThermalPostMessage();
        }
        bBlockParentalStateChange = false;
        // End:0x3C9
        foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
        {
            // End:0x3C8
            if(LPC.myLPHUD != none)
            {
                LPC.myLPHUD.TENGPostDeploying(AttachedToPocket, self, AssociatedTeamIndex);
            }            
        }        
        // End:0x409
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            SetTimer(1.0000000, true, 'TransferEnergyToTeam');            
        }
        else
        {
            AttachedToPocket.SetTPostStatus(true);
        }
        AttachedToPocket.PostStateChanged(self);
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        ClearTimer('TransferEnergyToTeam');
        ClearTimer('TransferEnergyToBattery');
        // End:0x61
        if(ExtractionSoundComponent != none)
        {
            ExtractionSoundComponent.Stop();
            ExtractionSoundComponent = none;
        }
        PlaySound(ThermalPostTuneData.ExtractionEndedCue);
        AssociatedTeamIndex = -1;
        AttachedToPocket.PostStateChanged(self);
        //return;        
    }

    simulated function IsDeployed()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    simulated function IsExtracting()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    simulated function TransferEnergyToTeam()
    {
        local /*0x97E50000-0x00000000*/ private float EnergyToDrain;
        local /*0x97E50000-0x00000000*/ private @NULL LPC;

        // End:0xDF
        if(int(Role) == int(ROLE_Authority))
        {
            // End:0x4D
            if(WorldInfo.Game.bGameEnded)
            {
                return;
            }
            bBlockParentalStateChange = true;
            // End:0x6A
            if(AttachedToPocket == none)
            {
                return;
            }
            EnergyToDrain = AttachedToPocket.DecrementEnergyRemaining(EnergyTransferRatePerSecond);
            // End:0xD3
            if(EnergyToDrain > float(0))
            {
                scoreTeamPoint(EnergyToDrain);
                accumulatePersonalTEnergy(EnergyToDrain);
            }
            bBlockParentalStateChange = false;
        }
        // End:0x16A
        foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
        {
            // End:0x169
            if(LPC.myLPHUD != none)
            {
                LPC.myLPHUD.TENGPostDeploying(AttachedToPocket, self, AssociatedTeamIndex);
            }            
        }        
        //return;        
    }

    simulated function TransferEnergyToBattery()
    {
        local /*0x97E50000-0x00000000*/ private float EnergyToDrain;
        local /*0x97E50000-0x00000000*/ private @NULL LPC;

        // End:0xAA
        if(int(Role) == int(ROLE_Authority))
        {
            // End:0x2D
            if(CurrentBatteryCapacity >= MaximumBatteryCapacity)
            {
                return;
            }
            // End:0x3C
            if(bDelayRecharging)
            {
                return;
            }
            bBlockParentalStateChange = true;
            EnergyToDrain = AttachedToPocket.DecrementEnergyRemaining(EnergyTransferRatePerSecond);
            // End:0x9E
            if(EnergyToDrain > float(0))
            {
                AddEnergyToBattery(EnergyToDrain);
            }
            bBlockParentalStateChange = false;
        }
        // End:0x135
        foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
        {
            // End:0x134
            if(LPC.myLPHUD != none)
            {
                LPC.myLPHUD.TENGPostDeploying(AttachedToPocket, self, AssociatedTeamIndex);
            }            
        }        
        //return;        
    }

    simulated event Tick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        // End:0xC5
        if(int(Role) == int(ROLE_Authority))
        {
            // End:0x82
            if(int(WorldInfo.NetMode) != int(NM_Standalone))
            {
                // End:0x82
                if((MyPlayerController == none) || MyPlayerController.PlayerReplicationInfo == none)
                {
                    GotoState('Deflating');
                    return;
                }
            }
            // End:0xC5
            if(!AttachedToPocket.bEnabled && !bDeployWhenPlaced)
            {
                GotoState('Deflating');
            }
        }
        //return;        
    }

    simulated function ParentPocketStateHasChanged()
    {
        local /*0x97E50000-0x00000000*/ private bool bEnabled[8388609];

        // End:0x0F
        if(bBlockParentalStateChange)
        {
            return;
        }
        // End:0x3D
        if(!bEnabled && !bDeployWhenPlaced)
        {
            GotoState('Deflating');
        }
        //return;        
    }

    simulated function CheckDamageState()
    {
        local /*0x97E50000-0x00000000*/ private int iNewHealth[8388609], iDifference, I, iOldHealth;

        // End:0x11
        if(iDifference < 0)
        {
            return;
        }
        // End:0x236
        if(ThermalPostTuneData != none)
        {
            iOldHealth = iNewHealth + iDifference;
            I = 0;
            J0x49:

            // End:0x236 [Loop If]
            if(I < ThermalPostTuneData.DamageParticleSystems.Length)
            {
                // End:0x228
                if((iNewHealth <= ThermalPostTuneData.DamageParticleSystems[I].HealthRemainingThreshold) && iOldHealth >= ThermalPostTuneData.DamageParticleSystems[I].HealthRemainingThreshold)
                {
                    ParticleDamageComponent.KillParticlesForced();
                    ParticleDamageComponent.DeactivateSystem();
                    ParticleDamageComponent.SetTemplate(ThermalPostTuneData.DamageParticleSystems[I].DamageParticleSystem);
                    SkeletalMeshComponent.AttachComponentToSocket(ParticleDamageComponent, ThermalPostTuneData.DamageParticleSystems[I].SocketName);
                    ParticleDamageComponent.ActivateSystem();
                    // [Explicit Break]
                    goto J0x236;
                }
                ++I;
                // [Loop Continue]
                goto J0x49;
            }
        }
        J0x236:

        //return;        
    }

    simulated event TakeDamage()
    {
        local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
        local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
        local /*0x97E50000-0x00000000*/ private int Idx;
        local /*0x97E50000-0x00000000*/ private @NULL PRI, LPC;

        // End:0x2D
        if(int(WorldInfo.NetMode) == int(NM_Standalone))
        {
            return;
        }
        // End:0x681
        if(int(Role) == int(ROLE_Authority))
        {
            // End:0x99
            if(MyPlayerController != none)
            {
                // End:0x99
                if(int(MyPlayerController.GetTeamNum()) == int(EventInstigator.GetTeamNum()))
                {
                    return;
                }
            }
            // End:0x151
            if(ThermalPostTuneData != none)
            {
                Idx = Class'SPEngine.SPUtil'.static.GetFilteredDamageFactorIndex(ThermalPostTuneData.DamageFilterInfo, DamageType);
                // End:0x151
                if(Idx > -1)
                {
                    DamageAmount *= ThermalPostTuneData.DamageFilterInfo[Idx].DamageFactor;
                }
            }
            // End:0x681
            if(DamageAmount > 0)
            {
                DamageTaken += DamageAmount;
                // End:0x4AE
                if(Health > 0)
                {
                    OldHealth = Health;
                    Health -= DamageAmount;
                    // End:0x23B
                    foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
                    {
                        // End:0x23A
                        if(LPC.myLPHUD != none)
                        {
                            // End:0x23A
                            if(Health > 0)
                            {
                                LPC.myLPHUD.TENGPostTookDamage(AttachedToPocket, self);
                            }
                        }                        
                    }                    
                    CheckDamageState(Health, DamageAmount);
                    // End:0x4AE
                    if(ClassIsChildOf(DamageType, Class'LPDamageType') && class<LPDamageType>(DamageType).default.bCausesEMP)
                    {
                        // End:0x4AE
                        if(ThermalPostTuneData.EMPDisruptionDuration.GetValue() > float(0))
                        {
                            EMPInfo.EMPRepCount++;
                            EMPInfo.EMPDuration = ThermalPostTuneData.EMPDisruptionDuration.GetValue();
                            // End:0x425
                            if((ClassIsChildOf(DamageType, Class'LPDamageTypeHalberdEMP') && EventInstigator != none) && LPWeaponHalberd(EventInstigator.Pawn.Weapon) != none)
                            {
                                EMPInfo.EMPDuration *= LPWeaponHalberd(EventInstigator.Pawn.Weapon).GetEMPIncreasedDuration();
                            }
                            LPC = LPPlayerController(EventInstigator);
                            // End:0x48C
                            if((LPC != none) && !IsInState('EMPShutdown'))
                            {
                                LPC.ServerIncrementStat('Stat_EMPShutdowns');
                            }
                            bForceNetUpdate = true;
                            GotoState('EMPShutdown', 'Begin');
                        }
                    }
                }
                // End:0x681
                if(Health <= 0)
                {
                    TriggerEventClass(Class'LPSeqEvent_ThermalEnergyPostDeactivated', self);
                    MyPlayerController.SetThermalPost(none);
                    SetPlayerPawn(none);
                    // End:0x549
                    if(OverrideHealth <= 0)
                    {
                        Health = ThermalPostTuneData.Health;
                        OldHealth = Health;
                    }
                    // End:0x5A7
                    foreach DynamicActors(Class'LPPRI', PRI)
                    {
                        // End:0x5A6
                        if(PRI.MyThermalPost == self)
                        {
                            PRI.SetThermalPost(none);
                        }                        
                    }                    
                    // End:0x62B
                    foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
                    {
                        // End:0x62A
                        if(LPC.myLPHUD != none)
                        {
                            LPC.myLPHUD.TENGPostChangedOwner(AttachedToPocket, self);
                        }                        
                    }                    
                    DoExplosion();
                    MulticastDoExplosion();
                    // End:0x673
                    if(AttachedToPocket.bEnabled)
                    {
                        GotoState('Ghosted');                        
                    }
                    else
                    {
                        GotoState('Disabled');
                    }
                }
            }
        }
        super(LPThermalEnergyPostMeshActor).TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
        //return;        
    }

    simulated event UnTouch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], LPP, LPC;

        // End:0x2B
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            return;
        }
        LPP = LPPlayerPawn(Other);
        // End:0xD5
        if(LPP != none)
        {
            LPC = LPPlayerController(LPP.Controller);
            // End:0xD5
            if(LPC != none)
            {
                LPC.ClearThermalPostMessage();
                LPC.SetThermalPost(none);
            }
        }
        super(LPThermalEnergyPostMeshActor).UnTouch(Other);
        //return;        
    }

    simulated event @NULL Touch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, LPP, LPC;

        // End:0x2B
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            return;
        }
        super(LPThermalEnergyPostMeshActor).Touch(Other, OtherComp, HitLocation, HitNormal);
        LPP = LPPlayerPawn(Other);
        // End:0x86
        if(LPP == none)
        {
            return;
        }
        LPC = LPPlayerController(LPP.Controller);
        // End:0xEE
        if((LPC == none) || !LPC.IsLocalPlayerController())
        {
            return;
        }
        // End:0x115
        if(LPC.GetPlayersThermalPost() != none)
        {
            return;
        }
        // End:0x128
        if(CurrentBatteryCapacity <= float(0))
        {
            return;
        }
        LPC.DisplayThermalPostMessage_Transfer();
        LPC.LastTouchedThermalPost = self;
        //return;        
    }
    stop;    
}

state Unstable
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL AnimSeq;

        DeploymentState = 6;
        SetVisibilityState(2);
        // End:0x43
        if(int(Role) == int(ROLE_Authority))
        {
            SetTimer(UnstableTime, false, 'DeflateFromLackOfInterest');
        }
        AnimSeq = AnimNodeSequence(SkeletalMeshComponent.Animations);
        AnimSeq.Rate = 0.0000000;
        MyPlayerController.SetThermalPost(none);
        SetPlayerPawn(none);
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        ClearTimer('DeflateFromLackOfInterest');
        //return;        
    }

    simulated function IsTransitioning()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    simulated function DeflateFromLackOfInterest()
    {
        ClearTimer('DeflateFromLackOfInterest');
        GotoState('Deflating');
        //return;        
    }

    simulated function ParentPocketStateHasChanged()
    {
        local /*0x97E50000-0x00000000*/ private bool bEnabled[8388609];

        // End:0x31
        if(!bEnabled)
        {
            ClearTimer('DeflateFromLackOfInterest');
            GotoState('Deflating');
        }
        //return;        
    }

    simulated function IsUnstable()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    simulated function IsAvailable()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    simulated event UnTouch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], LPP, LPC;

        LPP = LPPlayerPawn(Other);
        // End:0xCE
        if(LPP != none)
        {
            LPC = LPPlayerController(LPP.Controller);
            // End:0xCE
            if(LPC != none)
            {
                LPC.ClearThermalPostMessage();
                // End:0xCE
                if(LPC.LastTouchedThermalPost == self)
                {
                    LPC.LastTouchedThermalPost = none;
                }
            }
        }
        super(LPThermalEnergyPostMeshActor).UnTouch(Other);
        //return;        
    }

    simulated event @NULL Touch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, LPP, LPC;

        super(LPThermalEnergyPostMeshActor).Touch(Other, OtherComp, HitLocation, HitNormal);
        LPP = LPPlayerPawn(Other);
        // End:0x5B
        if(LPP == none)
        {
            return;
        }
        LPC = LPPlayerController(LPP.Controller);
        // End:0xC3
        if((LPC == none) || !LPC.IsLocalPlayerController())
        {
            return;
        }
        // End:0xEA
        if(LPC.GetPlayersThermalPost() != none)
        {
            return;
        }
        LPC.DisplayThermalPostMessage_Pump();
        LPC.LastTouchedThermalPost = self;
        //return;        
    }

    simulated function DeployPost()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

        // End:0x35
        if(int(Role) == int(ROLE_Authority))
        {
            SetPlayerPawn(LPC);
            GotoState('ReInflating');
        }
        //return;        
    }
    stop;    
}

state Deflating
{
    ignores Touch, DeployPost;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL AnimSeq;
        local /*0x97E50000-0x00000000*/ private float AnimLength, animCurrentPos, animTimePos;
        local /*0x97E50000-0x00000000*/ private @NULL LPC;

        DeploymentState = 7;
        SetVisibilityState(2);
        // End:0x2F5
        if(((PreviousStateName == 'Inflating') || PreviousStateName == 'ReInflating') || PreviousStateName == 'Unstable')
        {
            // End:0x23D
            if(int(Role) == int(ROLE_Authority))
            {
                AnimSeq = AnimNodeSequence(SkeletalMeshComponent.Animations);
                AnimSeq.Rate = GetInflationRateModifier();
                animCurrentPos = AnimSeq.CurrentTime;
                AnimLength = AnimSeq.GetAnimPlaybackLength();
                animTimePos = animCurrentPos / AnimLength;
                PlayCustomAnim(false, SeqClosing);
                AnimSeq = AnimNodeSequence(SkeletalMeshComponent.Animations);
                AnimSeq.Rate = 1.0000000;
                AnimLength = AnimSeq.GetAnimPlaybackLength();
                animCurrentPos = AnimLength * (float(1) - animTimePos);
                AnimSeq.SetPosition(animCurrentPos, true);
                DeflationAnimStartTime = animCurrentPos;
                bNetDirty = true;
            }
            AnimSeq.Rate = GetInflationRateModifier();
            // End:0x2F1
            foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
            {
                // End:0x2F0
                if(LPC.myLPHUD != none)
                {
                    LPC.myLPHUD.TENGPostRetracting(AttachedToPocket, self, AssociatedTeamIndex);
                }                
            }                        
        }
        else
        {
            // End:0x380
            if(PreviousStateName == 'Extracting')
            {
                // End:0x336
                if(int(Role) == int(ROLE_Authority))
                {
                    PlayCustomAnim(false, SeqClosing);
                }
                AnimNodeSequence(SkeletalMeshComponent.Animations).Rate = GetInflationRateModifier();                
            }
        }
        TriggerEventClass(Class'LPSeqEvent_ThermalEnergyPostDeactivated', self);
        // End:0x3C9
        if(MyPlayerController != none)
        {
            MyPlayerController.SetThermalPost(none);            
        }
        else
        {
            // End:0x43A
            if(MyPlayerPawn != none)
            {
                // End:0x43A
                if(MyPlayerPawn.Controller != none)
                {
                    LPPlayerController(MyPlayerPawn.Controller).SetThermalPost(none);
                }
            }
        }
        SetPlayerPawn(none);
        CurrentBatteryCapacity = 0.0000000;
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPC;

        // End:0xA2
        foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
        {
            // End:0xA1
            if(LPC.myLPHUD != none)
            {
                LPC.myLPHUD.TENGPostChangedOwner(AttachedToPocket, self);
                LPC.ClearThermalPostMessage();
            }            
        }        
        //return;        
    }

    simulated event OnAnimEnd()
    {
        local /*0x97E50000-0x00000000*/ private @NULL InSeqNode[8388609];
        local /*0x97E50000-0x00000000*/ private float PlayedTime[8388609], ExcessTime;

        // End:0x33
        if(AttachedToPocket.bEnabled)
        {
            GotoState('Ghosted');            
        }
        else
        {
            GotoState('Disabled');
        }
        //return;        
    }

    simulated function IsTransitioning()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
    stop;    
}

simulated state EMPShutdown
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PrevStateName[8388609];

        PreviousState = PrevStateName;
        // End:0x6D
        if(ExtractionSoundComponent != none)
        {
            // End:0x6D
            if(ExtractionSoundComponent.IsPlaying())
            {
                ExtractionSoundComponent.FadeOut(0.7000000, 0.0000000);
            }
        }
        // End:0x9B
        if(ParticleComponent != none)
        {
            ParticleComponent.DeactivateSystem();
        }
        // End:0xCA
        if(FlareComponent != none)
        {
            FlareComponent.SetIsActive(false);
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
        local /*0x97E50000-0x00000000*/ private @NULL PRI, LPC;

        // End:0x2D
        if(int(WorldInfo.NetMode) == int(NM_Standalone))
        {
            return;
        }
        // End:0x61A
        if(int(Role) == int(ROLE_Authority))
        {
            // End:0x99
            if(MyPlayerController != none)
            {
                // End:0x99
                if(int(MyPlayerController.GetTeamNum()) == int(EventInstigator.GetTeamNum()))
                {
                    return;
                }
            }
            // End:0x151
            if(ThermalPostTuneData != none)
            {
                Idx = Class'SPEngine.SPUtil'.static.GetFilteredDamageFactorIndex(ThermalPostTuneData.DamageFilterInfo, DamageType);
                // End:0x151
                if(Idx > -1)
                {
                    DamageAmount *= ThermalPostTuneData.DamageFilterInfo[Idx].DamageFactor;
                }
            }
            // End:0x61A
            if(DamageAmount > 0)
            {
                DamageTaken += DamageAmount;
                // End:0x447
                if(Health > 0)
                {
                    OldHealth = Health;
                    Health -= DamageAmount;
                    // End:0x23B
                    foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
                    {
                        // End:0x23A
                        if(LPC.myLPHUD != none)
                        {
                            // End:0x23A
                            if(Health > 0)
                            {
                                LPC.myLPHUD.TENGPostTookDamage(AttachedToPocket, self);
                            }
                        }                        
                    }                    
                    CheckDamageState(Health, DamageAmount);
                    // End:0x447
                    if(ClassIsChildOf(DamageType, Class'LPDamageType') && class<LPDamageType>(DamageType).default.bCausesEMP)
                    {
                        // End:0x447
                        if(ThermalPostTuneData.EMPDisruptionDuration.GetValue() > float(0))
                        {
                            EMPInfo.EMPRepCount++;
                            EMPInfo.EMPDuration = ThermalPostTuneData.EMPDisruptionDuration.GetValue();
                            // End:0x425
                            if((ClassIsChildOf(DamageType, Class'LPDamageTypeHalberdEMP') && EventInstigator != none) && LPWeaponHalberd(EventInstigator.Pawn.Weapon) != none)
                            {
                                EMPInfo.EMPDuration *= LPWeaponHalberd(EventInstigator.Pawn.Weapon).GetEMPIncreasedDuration();
                            }
                            bForceNetUpdate = true;
                            GotoState('EMPShutdown', 'Begin');
                        }
                    }
                }
                // End:0x61A
                if(Health <= 0)
                {
                    TriggerEventClass(Class'LPSeqEvent_ThermalEnergyPostDeactivated', self);
                    MyPlayerController.SetThermalPost(none);
                    SetPlayerPawn(none);
                    // End:0x4E2
                    if(OverrideHealth <= 0)
                    {
                        Health = ThermalPostTuneData.Health;
                        OldHealth = Health;
                    }
                    // End:0x540
                    foreach DynamicActors(Class'LPPRI', PRI)
                    {
                        // End:0x53F
                        if(PRI.MyThermalPost == self)
                        {
                            PRI.SetThermalPost(none);
                        }                        
                    }                    
                    // End:0x5C4
                    foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
                    {
                        // End:0x5C3
                        if(LPC.myLPHUD != none)
                        {
                            LPC.myLPHUD.TENGPostChangedOwner(AttachedToPocket, self);
                        }                        
                    }                    
                    DoExplosion();
                    MulticastDoExplosion();
                    // End:0x60C
                    if(AttachedToPocket.bEnabled)
                    {
                        GotoState('Ghosted');                        
                    }
                    else
                    {
                        GotoState('Disabled');
                    }
                }
            }
        }
        super(LPThermalEnergyPostMeshActor).TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        EMPInfo.EMPRepCount++;
        EMPInfo.EMPDuration = 0.0000000;
        EMPEffectComponent.DeactivateSystem();
        EMPSoundComponent.FadeOut(0.5000000, 0.0000000);
        // End:0xCC
        if(!ParticleComponent.bIsActive)
        {
            ParticleComponent.ActivateSystem();
        }
        SkeletalMeshComponent.AttachComponentToSocket(FlareComponent, ThermalPostTuneData.ExtractionLensFlareSocketName);
        FlareComponent.SetIsActive(true);
        //return;        
    }
Begin:

    // End:0x27
    if(EMPEffectComponent == none)
    {
        EMPEffectComponent = new (self) Class'Engine.ParticleSystemComponent';
    }
    // End:0xD7
    if(EMPEffectComponent != none)
    {
        EMPEffectComponent.SetTemplate(ThermalPostTuneData.EMPParticleSystem);
        EMPEffectComponent.__OnSystemFinished__Delegate = None;
        AttachComponent(EMPSoundComponent);
        EMPEffectComponent.SetActive(true);
    }
    // End:0xFE
    if(EMPSoundComponent == none)
    {
        EMPSoundComponent = new (self) Class'Engine.AudioComponent';
    }
    // End:0x194
    if(EMPSoundComponent != none)
    {
        EMPSoundComponent.bStopWhenOwnerDestroyed = true;
        EMPSoundComponent.SoundCue = ThermalPostTuneData.EMPSoundCue;
        EMPSoundComponent.FadeIn(0.1000000, 1.0000000);
    }
    Sleep(EMPInfo.EMPDuration);
    GotoState(PreviousState);
    stop;            
}

defaultproperties
{
    Radius=80.0000000
    // Reference: CylinderComponent'Default__LPThermalEnergyPostMeshActor.CollisionCylinder0'
    begin object name=CollisionCylinder0 class=Class'Engine.CylinderComponent'
    end object
    CollisionCylinder=CollisionCylinder0
    EnergyTransferRatePerSecond=5.0000000
    Health=1000
    OldHealth=-1
    // Reference: StaticMeshComponent'Default__LPThermalEnergyPostMeshActor.TransparentMesh0'
    begin object name=TransparentMesh0 class=Class'Engine.StaticMeshComponent'
    end object
    TransparentMesh=TransparentMesh0
    UnstableTime=3.0000000
    InflationRateModifier=1.0000000
    bGhostedPostVisible=true
    // Reference: SPAISmartObjectInteractionComponent'Default__LPThermalEnergyPostMeshActor.SPAISmartObjectInteractionComponent'
    begin object name=SPAISmartObjectInteractionComponent class=Class'SPAI.SPAISmartObjectInteractionComponent'
    end object
    SPInteractionComponent=SPAISmartObjectInteractionComponent
    // Reference: SPHeadTrackComponent'Default__LPThermalEnergyPostMeshActor.SPHeadTrackComponent0'
    begin object name=SPHeadTrackComponent0
    end object
    HeadTrackComponent=SPHeadTrackComponent0
    // Reference: SkeletalMeshComponent'Default__LPThermalEnergyPostMeshActor.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    SkeletalMeshComponent=SkeletalMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPThermalEnergyPostMeshActor.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: AudioComponent'Default__LPThermalEnergyPostMeshActor.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=MyLightEnvironment
    Components[1]=SkeletalMeshComponent0
    Components[2]=FaceAudioComponent
    Components[3]=SPHeadTrackComponent0
    Components[4]=CollisionCylinder0
    Components[5]=TransparentMesh0
    Components[6]=SPAISmartObjectInteractionComponent
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    CollisionType=ECollisionType.COLLIDE_TouchAllButWeapons
    bAlwaysRelevant=true
    bGameRelevant=true
    bCollideWhenPlacing=true
    bCollideActors=true
    NetUpdateFrequency=10.0000000
    InteractionComponent=SPAISmartObjectInteractionComponent
    CollisionComponent=CollisionCylinder0
    SupportedEvents=/* Array type was not detected. */
}