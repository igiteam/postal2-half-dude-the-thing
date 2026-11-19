class LPVSPlatformConsole extends LPSkeletalMeshActor
    abstract
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x8ADC0000-0x00000000*/ private travel int Health[2162689];
var(0.25_Pct) /*0x8ADC0000-0x00000000*/ private int HealthMax[2162689];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPawn;
var(0.25_Pct) /*0x6C620000-0x00000400*/ private const export @NULL SPInteractionComponent[589825];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private const export @NULL CollisionCylinder[655361];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ConsoleTuneData;
var(0.25_Pct) /*0x8ADC0000-0x00000000*/ private bool bEnabled[2162689];
var(0.25_Pct) /*0x8ADC0000-0x00000000*/ private bool bAIAttackOnly[65537];
var(0.25_Pct) /*0xABD20000-0x00000400*/ private const export @NULL RepairableComponent[589825];
var(0.25_Pct) /*0xABD20000-0x00000000*/ private @NULL RepairInfographic[65537];
var(0.25_Pct) /*0x8ADC0000-0x00000400*/ private const export @NULL ConsoleMesh[589825];
var(0.25_Pct) /*0x8ADC0000-0x00000400*/ private const export @NULL DamagedConsoleMesh[589825];
var(0.25_Pct) /*0x8ADC0000-0x00000400*/ private const export @NULL DestroyedConsoleMesh[589825];
var(0.25_Pct) /*0x8ADC0000-0x00000400*/ private export @NULL HitParticles[589825];
var(0.25_Pct) /*0x8ADC0000-0x00000400*/ private export @NULL DestroyedParticles[589825];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ActiveSoundComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL DownSoundComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ConsoleActiveSoundCue;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ConsoleDownSoundCue;

simulated event GetMasterTuneDataReference()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ConsoleTuneData;
    //return ReturnValue;    
}

simulated function InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super(Actor).InitTuneData(TuneData);
    ConsoleTuneData = LPTuneDataVSPlayerPawn(TuneData);
    //return;    
}

simulated function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bEnabled = true;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bEnabled = false;            
        }
        else
        {
            // End:0xDB
            if(Action.InputLinks[2].bHasImpulse)
            {
                bEnabled = !bEnabled;
            }
        }
    }
    UpdateDamageState();
    //return;    
}

simulated function UpdateDamageState()
{
    local /*0x97E50000-0x00000000*/ private float Percent;

    // End:0x73
    if(!bEnabled)
    {
        SetHidden(true);
        ConsoleMesh.SetHidden(true);
        DamagedConsoleMesh.SetHidden(true);
        PlayActiveSound(false);
        PlayDownSound(false);        
    }
    else
    {
        Percent = float(Health) / float(HealthMax);
        // End:0xAF
        if(!bAIAttackOnly)
        {
            SetHidden(false);
        }
        // End:0x137
        if(Health < 1)
        {
            ConsoleMesh.SetHidden(true);
            DamagedConsoleMesh.SetHidden(true);
            DestroyedConsoleMesh.SetHidden(false);
            PlayActiveSound(false);
            PlayDownSound(true);            
        }
        else
        {
            PlayActiveSound(true);
            PlayDownSound(false);
            // End:0x1C3
            if(Percent < 0.8000000)
            {
                ConsoleMesh.SetHidden(true);
                DamagedConsoleMesh.SetHidden(false);
                DestroyedConsoleMesh.SetHidden(true);                
            }
            else
            {
                ConsoleMesh.SetHidden(false);
                DamagedConsoleMesh.SetHidden(true);
                DestroyedConsoleMesh.SetHidden(true);
            }
        }
    }
    //return;    
}

simulated event CanBeAttacked()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (Health > 0) && bEnabled;
    //return ReturnValue;    
}

simulated event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    // End:0xAE
    if((EventInstigator == none) || LPPlayerPawn(EventInstigator.Pawn) == none)
    {
        // End:0xAE
        if(vsPawn != none)
        {
            vsPawn.TakeDamage(DamageAmount, none, vsPawn.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypeForced',, self);
        }
    }
    //return;    
}

simulated function @NULL PlayParticles()
{
    local /*0x97E50000-0x00000400*/ private @NULL Particles[8388609], Comp;

    // End:0xB4
    if((!bAIAttackOnly && Particles != none) && int(WorldInfo.NetMode) != int(NM_DedicatedServer))
    {
        Comp = new (self) Particles.Class (Particles);
        AttachComponent(Comp);
        Comp.SetActive(true);
    }
    //return;    
}

simulated function PlayActiveSound()
{
    local /*0x97E50000-0x00000000*/ private bool bPlay[8388609];

    // End:0xD3
    if(bPlay && ActiveSoundComponent == none)
    {
        ActiveSoundComponent = CreateAudioComponent(ConsoleActiveSoundCue, false, true);
        // End:0xD3
        if(ActiveSoundComponent != none)
        {
            ActiveSoundComponent.bUseOwnerLocation = true;
            ActiveSoundComponent.bAutoDestroy = true;
            ActiveSoundComponent.bStopWhenOwnerDestroyed = true;
            ActiveSoundComponent.bShouldRemainActiveIfDropped = true;
        }
    }
    // End:0x176
    if(ActiveSoundComponent != none)
    {
        // End:0x135
        if(bPlay)
        {
            // End:0x132
            if(!ActiveSoundComponent.IsPlaying())
            {
                ActiveSoundComponent.Play();
            }            
        }
        else
        {
            // End:0x176
            if(ActiveSoundComponent.IsPlaying())
            {
                ActiveSoundComponent.Stop();
            }
        }
    }
    //return;    
}

simulated function PlayDownSound()
{
    local /*0x97E50000-0x00000000*/ private bool bPlay[8388609];

    // End:0xD3
    if(bPlay && DownSoundComponent == none)
    {
        DownSoundComponent = CreateAudioComponent(ConsoleDownSoundCue, false, true);
        // End:0xD3
        if(DownSoundComponent != none)
        {
            DownSoundComponent.bUseOwnerLocation = true;
            DownSoundComponent.bAutoDestroy = true;
            DownSoundComponent.bStopWhenOwnerDestroyed = true;
            DownSoundComponent.bShouldRemainActiveIfDropped = true;
        }
    }
    // End:0x176
    if(DownSoundComponent != none)
    {
        // End:0x135
        if(bPlay)
        {
            // End:0x132
            if(!DownSoundComponent.IsPlaying())
            {
                DownSoundComponent.Play();
            }            
        }
        else
        {
            // End:0x176
            if(DownSoundComponent.IsPlaying())
            {
                DownSoundComponent.Stop();
            }
        }
    }
    //return;    
}

event HealDamage()
{
    local /*0x97E50000-0x00000000*/ private int Amount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Healer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x74
    if(vsPawn != none)
    {
        // End:0x74
        if(vsPawn.HealDamage(Amount, Healer, DamageType))
        {
            Health = vsPawn.Health;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function SetVSPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPVS[8388609];

    vsPawn = LPVS;
    // End:0x72
    if(vsPawn != none)
    {
        HealthMax = vsPawn.HealthMax;
        Health = vsPawn.Health;
    }
    //return;    
}

simulated function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(Actor).Tick(DeltaTime);
    // End:0x68
    if(bEnabled && vsPawn != none)
    {
        // End:0x68
        if(!bAIAttackOnly)
        {
            Health = vsPawn.Health;
        }
    }
    //return;    
}

simulated event Destroyed()
{
    super(SkeletalMeshActor).Destroyed();
    // End:0x43
    if(ActiveSoundComponent != none)
    {
        ActiveSoundComponent.Stop();
        ActiveSoundComponent = none;
    }
    // End:0x7C
    if(DownSoundComponent != none)
    {
        DownSoundComponent.Stop();
        DownSoundComponent = none;
    }
    //return;    
}

defaultproperties
{
    Health=400
    HealthMax=400
    // Reference: SPAISmartObjectInteractionComponent'Default__LPVSPlatformConsole.SPAISmartObjectInteractionComponent'
    begin object name=SPAISmartObjectInteractionComponent class=Class'SPAI.SPAISmartObjectInteractionComponent'
    end object
    SPInteractionComponent=SPAISmartObjectInteractionComponent
    // Reference: CylinderComponent'Default__LPVSPlatformConsole.CollisionCylinder0'
    begin object name=CollisionCylinder0 class=Class'Engine.CylinderComponent'
    end object
    CollisionCylinder=CollisionCylinder0
    // Reference: LPRepairableConsoleComponent'Default__LPVSPlatformConsole.RepairObj'
    begin object name=RepairObj class=Class'LPRepairableConsoleComponent'
    end object
    RepairableComponent=RepairObj
    // Reference: StaticMeshComponent'Default__LPVSPlatformConsole.ConsoleMesh0'
    begin object name=ConsoleMesh0 class=Class'Engine.StaticMeshComponent'
    end object
    ConsoleMesh=ConsoleMesh0
    // Reference: StaticMeshComponent'Default__LPVSPlatformConsole.DamagedConsoleMesh0'
    begin object name=DamagedConsoleMesh0 class=Class'Engine.StaticMeshComponent'
    end object
    DamagedConsoleMesh=DamagedConsoleMesh0
    // Reference: StaticMeshComponent'Default__LPVSPlatformConsole.DestroyedConsoleMesh0'
    begin object name=DestroyedConsoleMesh0 class=Class'Engine.StaticMeshComponent'
    end object
    DestroyedConsoleMesh=DestroyedConsoleMesh0
    // Reference: ParticleSystemComponent'Default__LPVSPlatformConsole.HitParticles0'
    begin object name=HitParticles0 class=Class'Engine.ParticleSystemComponent'
    end object
    HitParticles=HitParticles0
    // Reference: ParticleSystemComponent'Default__LPVSPlatformConsole.DestroyedParticles0'
    begin object name=DestroyedParticles0 class=Class'Engine.ParticleSystemComponent'
    end object
    DestroyedParticles=DestroyedParticles0
    // Reference: SPHeadTrackComponent'Default__LPVSPlatformConsole.SPHeadTrackComponent0'
    begin object name=SPHeadTrackComponent0
    end object
    HeadTrackComponent=SPHeadTrackComponent0
    // Reference: SkeletalMeshComponent'Default__LPVSPlatformConsole.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    SkeletalMeshComponent=SkeletalMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPVSPlatformConsole.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: AudioComponent'Default__LPVSPlatformConsole.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=MyLightEnvironment
    Components[1]=SkeletalMeshComponent0
    Components[2]=FaceAudioComponent
    Components[3]=SPHeadTrackComponent0
    Components[4]=ConsoleMesh0
    Components[5]=DamagedConsoleMesh0
    Components[6]=DestroyedConsoleMesh0
    Components[7]=CollisionCylinder0
    Components[8]=SPAISmartObjectInteractionComponent
    Components[9]=RepairObj
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    CollisionType=ECollisionType.COLLIDE_TouchAllButWeapons
    bHidden=true
    bAlwaysRelevant=true
    bGameRelevant=true
    bCollideWhenPlacing=true
    bCollideActors=true
    InteractionComponent=SPAISmartObjectInteractionComponent
    CollisionComponent=ConsoleMesh0
    SupportedEvents=/* Array type was not detected. */
}