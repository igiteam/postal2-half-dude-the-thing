class LPDisableRepairObjective extends LPSkeletalMeshActor
    abstract
    nativereplication
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x7E160000-0x00000400*/ private export @NULL StaticMeshComponent[589825];
var(0.25_Pct) /*0xABD20000-0x00000000*/ private @NULL RepairInfographic[65537];
var(0.25_Pct) /*0x7E160000-0x00000400*/ private const export @NULL RepairableComponent[589825];
var(0.25_Pct) /*0x7E160000-0x00000000*/ private bool bEnabled[65537];
var(0.25_Pct) /*0x7E160000-0x00000000*/ private bool bIgnoreDamage[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDisabled[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsBeingRepaired;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int EnabledRepCount[2097153];
var(0.25_Pct) /*0x7E160000-0x00000000*/ private byte OwningTeam[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int Health[2097153];
var(0.25_Pct) /*0x7E160000-0x00000000*/ private int InitialHealth[65537];
var(0.25_Pct) /*0x7E160000-0x00000000*/ private int MaxHealth[65537];
var(0.25_Pct) /*0x7E160000-0x00000000*/ private int DisableHealth[65537];
var(0.25_Pct) /*0x7E160000-0x00000000*/ private int RepairHealth[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL DamageParticleComponent[524289];
var(0.25_Pct) /*0x7E160000-0x00000000*/ private @NULL DamageParticleSystem[65537];
var(0.25_Pct) /*0x7E160000-0x00000000*/ private name DamageParticleSocket[65537];
var(0.25_Pct) /*0x7E160000-0x00000000*/ private @NULL DamageParticleOffset[65537];
var(0.25_Pct) /*0x7E160000-0x00000000*/ private @NULL IconOffset[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int ParticleRepCount[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentHealer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastHealer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastDamager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastRepairTime;
var(0.25_Pct) /*0x9AE30000-0x00000400*/ private const export @NULL ObjectiveComponent[589825];

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x2E
    if(VarName == 'ParticleRepCount')
    {
        SetDamageParticles(bIsDisabled);        
    }
    else
    {
        // End:0x52
        if(VarName == 'Health')
        {
            NotifyHUDStateChanged();            
        }
        else
        {
            // End:0x73
            if(VarName == 'EnabledRepCount')
            {
                UpdateEnabled();
            }
        }
    }
    super(SPSkeletalMeshActor).ReplicatedEvent(VarName);
    //return;    
}

simulated event PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPMI;
    local /*0x97E50000-0x00000000*/ private int iIndex;

    super(SPSkeletalMeshActor).PostBeginPlay();
    LPMI = LPMapInfo(WorldInfo.GetMapInfo());
    iIndex = LPMI.DisableRepairItemList.Find(self);    
    // End:0xA0
    if(iIndex == -1)
    {
        LPMI.DisableRepairItemList.AddItem(self);        
    }
    // End:0xDA
    if(SkeletalMeshComponent.SkeletalMesh != none)
    {
        CollisionComponent = SkeletalMeshComponent;        
    }
    else
    {
        // End:0x111
        if(StaticMeshComponent.StaticMesh != none)
        {
            CollisionComponent = StaticMeshComponent;
        }
    }
    ResetObjective();
    //return;    
}

simulated function NotifyHUDStateChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    // End:0x79
    foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
    {
        // End:0x78
        if(LPC.myLPHUD != none)
        {
            LPC.myLPHUD.DisableRepairPointChangedState(self);
        }        
    }    
    //return;    
}

simulated event Destroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPMI;
    local /*0x97E50000-0x00000000*/ private int iIndex;

    super(SkeletalMeshActor).Destroyed();
    LPMI = LPMapInfo(WorldInfo.GetMapInfo());
    iIndex = LPMI.DisableRepairItemList.Find(self);    
    // End:0xA3
    if(iIndex >= 0)
    {
        LPMI.DisableRepairItemList.Remove(iIndex, 1);        
    }
    SetDamageParticles(false);
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(Actor).Tick(DeltaTime);
    // End:0x5D
    if((WorldInfo.TimeSeconds - LastRepairTime) > 0.2500000)
    {
        bIsBeingRepaired = false;
        CurrentHealer = none;
    }
    //return;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    // End:0x1A8
    if((bEnabled && !bIgnoreDamage) && int(EventInstigator.GetTeamNum()) != int(OwningTeam))
    {
        super(SkeletalMeshActor).TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
        bIsDisabled = (Health - Damage) <= DisableHealth;
        // End:0x105
        if((Health > 0) && Damage > 0)
        {
            TriggerEventClass(Class'LPSeqEvent_ObjectiveTakingDamage', EventInstigator);
        }
        // End:0x162
        if((Health != 0) && (Health - Damage) <= DisableHealth)
        {
            TriggerEventClass(Class'LPSeqEvent_ObjectiveDisarmed', EventInstigator);
            SetDamageParticles(true);
        }
        Health = int(FMax(float(Health - Damage), 0.0000000));
        NotifyHUDStateChanged();
        LastDamager = EventInstigator;
    }
    //return;    
}

event HealDamage()
{
    local /*0x97E50000-0x00000000*/ private int Amount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Healer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!bEnabled)
    {
        return false;
    }
    // End:0x1B3
    if(Health < MaxHealth)
    {
        // End:0x78
        if((Health + Amount) >= MaxHealth)
        {
            bIsDisabled = false;
            TriggerEventClass(Class'LPSeqEvent_ObjectiveRepaired', Healer);            
        }
        else
        {
            // End:0xED
            if((Health < (MaxHealth / 2)) && (Health + Amount) >= RepairHealth)
            {
                bIsDisabled = false;
                TriggerEventClass(Class'LPSeqEvent_ObjectiveArmed', Healer);
                SetDamageParticles(false);
            }
        }
        Health = int(FMin(float(MaxHealth), float(Health + Amount)));
        // End:0x14A
        if(CurrentHealer == none)
        {
            TriggerEventClass(Class'LPSeqEvent_ObjectiveBeingRepaired', Healer);
        }
        bIsBeingRepaired = true;
        LastRepairTime = WorldInfo.TimeSeconds;
        CurrentHealer = Healer;
        LastHealer = Healer;
        NotifyHUDStateChanged();
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

simulated function SetDamageParticles()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    // End:0x179
    if(DamageParticleSystem != none)
    {
        // End:0x12D
        if(bOn)
        {
            // End:0x12A
            if(!DamageParticleComponent.bIsActive)
            {
                DamageParticleComponent.KillParticlesForced();
                DamageParticleComponent.DeactivateSystem();
                DamageParticleComponent.SetTemplate(DamageParticleSystem);
                SkeletalMeshComponent.AttachComponentToSocket(DamageParticleComponent, DamageParticleSocket);
                DamageParticleComponent.SetTranslation(DamageParticleOffset);
                DamageParticleComponent.ActivateSystem();
                ++ParticleRepCount;
            }            
        }
        else
        {
            // End:0x179
            if(DamageParticleComponent.bIsActive)
            {
                DamageParticleComponent.DeactivateSystem();
                ++ParticleRepCount;
            }
        }
    }
    //return;    
}

simulated function GetHealthPercent()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return (100.0000000 * float(Health)) / float(MaxHealth);
    //return ReturnValue;    
}

simulated function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bEnabled = true;        
    }
    else
    {
        // End:0x8C
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bEnabled = false;            
        }
        else
        {
            // End:0xDB
            if(inAction.InputLinks[2].bHasImpulse)
            {
                bEnabled = !bEnabled;
            }
        }
    }
    ResetObjective();
    // End:0x109
    if(bEnabled)
    {
        TriggerEventClass(Class'LPSeqEvent_ObjectiveBegin', self);
    }
    //return;    
}

function OnObjectiveFinish()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    CheckForLoneWolf();
    //return;    
}

simulated function UpdateEnabled()
{
    // End:0x2B
    if(int(Role) != int(ROLE_Authority))
    {
        bEnabled = EnabledRepCount > 0;
    }
    //return;    
}

simulated function Reset()
{
    ResetObjective();
    //return;    
}

function ResetObjective()
{
    bIsDisabled = InitialHealth <= DisableHealth;
    Health = InitialHealth;
    SetDamageParticles(bIsDisabled);
    // End:0x75
    if(int(Role) == int(ROLE_Authority))
    {
        EnabledRepCount = ((bEnabled) ? 1 : 0);
    }
    //return;    
}

function CheckForLoneWolf()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI;

    PRI = ((bIsDisabled) ? LPPRI(LastDamager.PlayerReplicationInfo) : LPPRI(LastHealer.PlayerReplicationInfo));
    // End:0xED
    if((PRI != none) && !PRI.CheckForNearbyPlayers(Class'LPAwardManager'.static.GetDefaultAwardParam('Emblem_LoneWolf'), true))
    {
        PRI.ServerGiveAward('Emblem_LoneWolf');
    }
    //return;    
}

function ExternalTriggerEvent()
{
    local /*0x97E50000-0x00000000*/ private class EventClassToTrigger[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(EventInstigator == none)
    {
        EventInstigator = self;
    }
    return TriggerEventClass(EventClassToTrigger, EventInstigator);
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: StaticMeshComponent'Default__LPDisableRepairObjective.StaticMeshComp'
    begin object name=StaticMeshComp class=Class'Engine.StaticMeshComponent'
    end object
    StaticMeshComponent=StaticMeshComp
    // Reference: LPRepairableObjectiveComponent'Default__LPDisableRepairObjective.RepairableComp'
    begin object name=RepairableComp class=Class'LPRepairableObjectiveComponent'
    end object
    RepairableComponent=RepairableComp
    EnabledRepCount=-1
    OwningTeam=ELPTeams.LPTeam_Neutral
    Health=1000
    InitialHealth=1000
    MaxHealth=1000
    RepairHealth=500
    // Reference: ParticleSystemComponent'Default__LPDisableRepairObjective.FXDamageComp'
    begin object name=FXDamageComp class=Class'Engine.ParticleSystemComponent'
    end object
    DamageParticleComponent=FXDamageComp
    IconOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
    // Reference: LPObjectiveComponentDisableRepair'Default__LPDisableRepairObjective.ObjectiveComp'
    begin object name=ObjectiveComp class=Class'LPObjectiveComponentDisableRepair'
    end object
    ObjectiveComponent=ObjectiveComp
    // Reference: SPHeadTrackComponent'Default__LPDisableRepairObjective.SPHeadTrackComponent0'
    begin object name=SPHeadTrackComponent0
    end object
    HeadTrackComponent=SPHeadTrackComponent0
    // Reference: SkeletalMeshComponent'Default__LPDisableRepairObjective.SkeletalMeshComp'
    begin object name=SkeletalMeshComp class=Class'Engine.SkeletalMeshComponent'
    end object
    SkeletalMeshComponent=SkeletalMeshComp
    // Reference: DynamicLightEnvironmentComponent'Default__LPDisableRepairObjective.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: AudioComponent'Default__LPDisableRepairObjective.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=MyLightEnvironment
    // Reference: SkeletalMeshComponent'Default__LPDisableRepairObjective.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    Components[1]=SkeletalMeshComponent0
    Components[2]=FaceAudioComponent
    Components[3]=SPHeadTrackComponent0
    Components[4]=SkeletalMeshComp
    Components[5]=StaticMeshComp
    Components[6]=RepairableComp
    Components[7]=FXDamageComp
    Components[8]=ObjectiveComp
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bAlwaysRelevant=true
    bCollideWhenPlacing=true
    bCollideActors=true
    bBlockActors=true
    CollisionComponent=SkeletalMeshComponent0
    SupportedEvents=/* Array type was not detected. */
}