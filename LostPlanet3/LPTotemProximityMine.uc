class LPTotemProximityMine extends LPTotemBase
    notplaceable
    hidecategories(AnimDependency,Navigation);

enum AnimNameEnum
{
    eAnimPlacement,                 // 0
    eAnimArming,                    // 1
    eAnimArmed,                     // 2
    AnimNameEnum_MAX                // 3
};

enum TriggerStateEnum
{
    eTriggerState_Armed,            // 0
    eTriggerState_Priming,          // 1
    eTriggerState_Launching,        // 2
    eTriggerState_MAX               // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimName[3];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SnowParticles[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ProximityMineTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPTotemProximityMine.TriggerStateEnum CurrentTriggerState[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BlastDamageMultiplier[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BlastRadiusMultiplier[2097153];

simulated function PostInitData()
{
    local /*0x97E50000-0x00000000*/ private int ExplosionTemplateIndex;

    super.PostInitData();
    ProximityMineTuneData = LPTuneDataPerkProximityMine(TuneDataTotem);
    // End:0x1E4
    if((ProximityMineTuneData != none) && Perk.MyPlayerController != none)
    {
        ExplosionTemplateIndex = int(ProximityMineTuneData.UseAlternateExplosion.GetValue(Perk.MyPlayerController));
        // End:0x12A
        if((ExplosionTemplateIndex >= 0) && ExplosionTemplateIndex < ProximityMineTuneData.AlternateExplosions.Length)
        {
            ExplosionTemplate = ProximityMineTuneData.AlternateExplosions[ExplosionTemplateIndex];
        }
        BlastDamageMultiplier = ProximityMineTuneData.BlastDamageMultiplier.GetValue(Perk.MyPlayerController);
        BlastRadiusMultiplier = ProximityMineTuneData.BlastRadiusMultiplier.GetValue(Perk.MyPlayerController);
    }
    //return;    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    SetPhysics(0);
    OrientAndDeploy();
    //return;    
}

simulated function NotifyDeployed()
{
    super.NotifyDeployed();
    // End:0x45
    if(!bDeployed)
    {
        SetTimer(3.0000000, false, 'EnableMine');
        PlayAnim(1, false);
        PlaySinkingParticles();        
    }
    else
    {
        EnableMine();
    }
    CurrentTriggerState = 0;
    //return;    
}

simulated function UpdateTouchRadius()
{
    CylinderComponent(CollisionComponent).SetCylinderSize(TouchRadius, 80.0000000);
    //return;    
}

simulated function EnableMine()
{
    SetCollision(true, false);
    //return;    
}

simulated event @NULL PlaySinkingParticles()
{
    local /*0x97E50000-0x00000400*/ private @NULL Comp;

    // End:0xBC
    if(SinkDepth > float(SinkThreshold))
    {
        // End:0xBC
        if((SnowParticles != none) && int(WorldInfo.NetMode) != int(NM_DedicatedServer))
        {
            Comp = new (self) SnowParticles.Class (SnowParticles);
            AttachComponent(Comp);
            Comp.SetActive(true);
        }
    }
    //return;    
}

simulated function PlayAnim()
{
    local /*0x97E50000-0x00000000*/ private int AnimIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLoop[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Slot;

    // End:0xA7
    if(VisibleSkelMesh != none)
    {
        Slot = SPAnimNodeSlot(VisibleSkelMesh.FindAnimNode('TotemSlotNode'));
        // End:0xA7
        if(Slot != none)
        {
            Slot.PlayCustomAnim(AnimName[AnimIndex], 1.0000000, 0.5000000, -1.0000000, bLoop, true);
        }
    }
    //return;    
}

simulated event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, TouchPawn;

    local /*0x97E50000-0x00000000*/ private bool bBeingHacked;

    // End:0x3B
    if((Team == none) || Team.TeamIndex == -1)
    {
        return;
    }
    // End:0x18B
    if((int(Role) == int(ROLE_Authority)) && !bExploded)
    {
        TouchPawn = LPPawn(Other);
        // End:0x154
        if((TouchPawn != none) && TouchPawn.Controller != none)
        {
            bBeingHacked = TouchPawn.Controller.GetStateName() == 'HackDeployable';
            // End:0x151
            if(!bBeingHacked && Team != TouchPawn.GetTeam())
            {
                bExploded = true;
                SetTimer(0.1000000, false, 'TimerExplode');
            }            
        }
        else
        {
            // End:0x18B
            if(LPSnowcatInterpTransportWheels(Other) != none)
            {
                bExploded = true;
                SetTimer(0.1000000, false, 'TimerExplode');
            }
        }
    }
    //return;    
}

simulated function EndBeacon()
{
    local /*0x97E50000-0x00000000*/ private bool bReplace[9437185];

    false
    super.EndBeacon(bReplace);
    GotoState('None');
    Destroy();
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x57
    if(VarName == 'CurrentTriggerState')
    {
        switch(CurrentTriggerState)
        {
            // End:0x3C
            case 1:
                BeginPriming();
                // End:0x54
                break;
            // End:0x4E
            case 2:
                BeginLaunching();
                // End:0x54
                break;
            // End:0xFFFF
            default:
                // End:0x54
                break;
                break;
        }        
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
    //return;    
}

simulated event TimerExplode()
{
    ClearTimer('TimerExplode');
    // End:0xAE
    if(ProximityMineTuneData.PrimerDuration.GetValue() <= 0.0000000)
    {
        // End:0xA1
        if(ProximityMineTuneData.LaunchDuration.GetValue() <= 0.0000000)
        {
            BeginExploding();            
        }
        else
        {
            BeginLaunching();
        }        
    }
    else
    {
        BeginPriming();
    }
    //return;    
}

simulated function DoExplosion()
{
    local /*0x97E50000-0x00000000*/ private float CachedDamage, CachedDamageToPlayerPawn, CachedCameraLensEffectRadius, CachedCamShakeInnerRadius, CachedCamShakeOuterRadius, CachedCringeRadius,
	    CachedDamageRadius, CachedExpansionStartRadius, CachedFractureMeshRadius, CachedKnockDownRadius, CachedExplosionEmitterScale;

    CachedDamage = ExplosionTemplate.Damage;
    CachedDamageToPlayerPawn = ExplosionTemplate.DamageToPlayerPawn;
    CachedCameraLensEffectRadius = ExplosionTemplate.CameraLensEffectRadius;
    CachedCamShakeInnerRadius = ExplosionTemplate.CamShakeInnerRadius;
    CachedCamShakeOuterRadius = ExplosionTemplate.CamShakeOuterRadius;
    CachedCringeRadius = ExplosionTemplate.CringeRadius;
    CachedDamageRadius = ExplosionTemplate.DamageRadius;
    CachedExpansionStartRadius = ExplosionTemplate.ExpansionStartRadius;
    CachedFractureMeshRadius = ExplosionTemplate.FractureMeshRadius;
    CachedKnockDownRadius = ExplosionTemplate.KnockDownRadius;
    CachedExplosionEmitterScale = ExplosionTemplate.ExplosionEmitterScale;
    ExplosionTemplate.Damage *= BlastDamageMultiplier;
    ExplosionTemplate.DamageToPlayerPawn *= BlastDamageMultiplier;
    ExplosionTemplate.CameraLensEffectRadius *= BlastRadiusMultiplier;
    ExplosionTemplate.CamShakeInnerRadius *= BlastRadiusMultiplier;
    ExplosionTemplate.CamShakeOuterRadius *= BlastRadiusMultiplier;
    ExplosionTemplate.CringeRadius *= BlastRadiusMultiplier;
    ExplosionTemplate.DamageRadius *= BlastRadiusMultiplier;
    ExplosionTemplate.ExpansionStartRadius *= BlastRadiusMultiplier;
    ExplosionTemplate.FractureMeshRadius *= BlastRadiusMultiplier;
    ExplosionTemplate.KnockDownRadius *= BlastRadiusMultiplier;
    ExplosionTemplate.ExplosionEmitterScale *= BlastRadiusMultiplier;
    super.DoExplosion();
    ExplosionTemplate.Damage = CachedDamage;
    ExplosionTemplate.DamageToPlayerPawn = CachedDamageToPlayerPawn;
    ExplosionTemplate.CameraLensEffectRadius = CachedCameraLensEffectRadius;
    ExplosionTemplate.CamShakeInnerRadius = CachedCamShakeInnerRadius;
    ExplosionTemplate.CamShakeOuterRadius = CachedCamShakeOuterRadius;
    ExplosionTemplate.CringeRadius = CachedCringeRadius;
    ExplosionTemplate.DamageRadius = CachedDamageRadius;
    ExplosionTemplate.ExpansionStartRadius = CachedExpansionStartRadius;
    ExplosionTemplate.FractureMeshRadius = CachedFractureMeshRadius;
    ExplosionTemplate.KnockDownRadius = CachedKnockDownRadius;
    ExplosionTemplate.ExplosionEmitterScale = CachedExplosionEmitterScale;
    //return;    
}

simulated function BeginPriming()
{
    CurrentTriggerState = 1;
    // End:0x5D
    if(ProximityMineTuneData.PrimerSoundCue != none)
    {
        PlaySound(ProximityMineTuneData.PrimerSoundCue, true, true, false);
    }
    // End:0xB5
    if(int(Role) == int(ROLE_Authority))
    {
        SetTimer(ProximityMineTuneData.PrimerDuration.GetValue(), false, 'BeginLaunching');
    }
    //return;    
}

simulated function @NULL BeginLaunching()
{
    local /*0x97E50000-0x00000400*/ private @NULL PS;

    CurrentTriggerState = 2;
    // End:0x5D
    if(ProximityMineTuneData.LaunchSoundCue != none)
    {
        PlaySound(ProximityMineTuneData.LaunchSoundCue, true, true, false);
    }
    // End:0xCB
    if(ProximityMineTuneData.LaunchParticleSystem != none)
    {
        PS = SpawnParticleSystem(ProximityMineTuneData.LaunchParticleSystem, Location);
        // End:0xCB
        if(PS != none)
        {
        }
    }
    // End:0x123
    if(int(Role) == int(ROLE_Authority))
    {
        SetTimer(ProximityMineTuneData.LaunchDuration.GetValue(), false, 'BeginExploding');
    }
    //return;    
}

simulated function BeginExploding()
{
    TimerExplode();
    //return;    
}

simulated function @NULL SpawnParticleSystem()
{
    local /*0x97E50000-0x00000000*/ private @NULL sys[8388609], Loc, ReturnValue, ThePool, PSComp;

    // End:0x11
    if(sys == none)
    {
        return none;
    }
    ThePool = SPEmitterPool(WorldInfo.MyEmitterPool);
    PSComp = ThePool.SPSpawnEmitter(sys, Loc);
    // End:0xB1
    if(PSComp != none)
    {
        PSComp.ActivateSystem();
    }
    return PSComp;
    //return ReturnValue;    
}

simulated state EMPShutdown
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PrevStateName[8388609];

        super.BeginState(PrevStateName);
        SetCollision(false, false);
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        EnableMine();
        //return;        
    }
    stop;    
}

defaultproperties
{
    AnimName[0]="PRP_ProxMine_Placement_Core"
    AnimName[1]="PRP_ProxMine_Activating_Core"
    AnimName[2]="PRP_ProxMine_Armed_Core"
    PerkIndex=EPerks.EPERK_PROXIMITYMINE
    // Reference: SkeletalMeshComponent'Default__LPTotemProximityMine.TotemMeshComp'
    begin object name=TotemMeshComp
    end object
    SkelMesh=TotemMeshComp
    // Reference: SkeletalMeshComponent'Default__LPTotemProximityMine.EnemyTotemMeshComp'
    begin object name=EnemyTotemMeshComp
    end object
    EnemySkelMesh=EnemyTotemMeshComp
    // Reference: LPHackableTotemBaseComponent'Default__LPTotemProximityMine.HackComponentA'
    begin object name=HackComponentA
    end object
    HackComponent=HackComponentA
    // Reference: CylinderComponent'Default__LPTotemProximityMine.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    Components[0]=CollisionCylinder
    Components[1]=HackComponentA
    bCollideWorld=false
    // Reference: LPTotemInteractionMetaData'Default__LPTotemProximityMine.TotemInteract0'
    begin object name=TotemInteract0
    end object
    InteractionMetaData=TotemInteract0
    CollisionComponent=CollisionCylinder
}