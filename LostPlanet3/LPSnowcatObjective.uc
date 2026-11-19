class LPSnowcatObjective extends LPSkeletalMeshActorMAT
    abstract
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0xABD20000-0x00000400*/ private const export @NULL RepairableComponent[589825];
var(0.25_Pct) /*0x9AE30000-0x00000400*/ private const export @NULL ObjectiveComponent[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int Health[2097153];
var(0.25_Pct) /*0x65FC0000-0x00000000*/ private int MaxHealth[65537];
var(0.25_Pct) /*0xCE810000-0x00000000*/ private float TouchRadius[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private const export @NULL CollisionCylinder[655361];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDisabled[2097153];
var(0.25_Pct) /*0xCE810000-0x00000000*/ private bool bAttacking[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ProximityCount;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ParticleDamageComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DamageParticleSystem;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int ParticleRepCount[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WheelCircumference;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WheelSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DrillSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlowLSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlowRSkelControl;
var(0.25_Pct) /*0x4B000000-0x00000000*/ private float DrillRotationSpeed[65537];
var(0.25_Pct) /*0x4B000000-0x00000000*/ private @NULL DrillTeethPhysicalMaterial[65537];
var(0.25_Pct) /*0x4B000000-0x00000000*/ private int DamageToPlayerFromDrill[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TeamNumber[2097153];

// Export ULPSnowcatObjective::execCheckBumpPrimitive(FFrame&, void* const)
native function @NULL CheckBumpPrimitive()
{
    local /*0x97E50000-0x00000400*/ private @NULL HitComponent[8388609], Position, Extent, OutHitInfo;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

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
        // End:0x4F
        if(VarName == 'Health')
        {
            NotifyHUDStateChanged();
        }
    }
    super(SkeletalMeshActor).ReplicatedEvent(VarName);
    //return;    
}

simulated function NotifyHUDStateChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    // End:0x44
    foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
    {
        // End:0x43
        if(LPC.myLPHUD != none)
        {
        }        
    }    
    //return;    
}

simulated event PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private float fWheelDiameter;
    local /*0x97E50000-0x00000000*/ private @NULL GRI, TI;

    ProximityCount = 0;
    ParticleRepCount = 0;
    // End:0x3D
    if(int(Role) == int(ROLE_Authority))
    {
        SetTimer(0.5000000, true, 'CheckPlayerProximity');
    }
    fWheelDiameter = 200.0000000;
    WheelCircumference = fWheelDiameter * 3.1415900;
    WheelSkelControl = SkelControlSingleBone(SkeletalMeshComponent.FindSkelControl('BO_Wheels'));
    DrillSkelControl = SkelControlSingleBone(SkeletalMeshComponent.FindSkelControl('BO_Drill'));
    PlowLSkelControl = SkelControlSingleBone(SkeletalMeshComponent.FindSkelControl('BO_L_Plow'));
    PlowRSkelControl = SkelControlSingleBone(SkeletalMeshComponent.FindSkelControl('BO_R_Plow'));
    Health = MaxHealth;
    TeamNumber = 0;
    // End:0x272
    if(int(WorldInfo.NetMode) != int(NM_Client))
    {
        GRI = WorldInfo.GRI;
        // End:0x272
        if(GRI != none)
        {
            // End:0x272
            if(GRI.Teams.Length > 1)
            {
                TI = LPTeamInfo_MP(GRI.Teams[1]);
                // End:0x272
                if((TI != none) && bAttacking == TI.bAttackingTeam)
                {
                    TeamNumber = 1;
                }
            }
        }
    }
    super(SPSkeletalMeshActorMAT).PostBeginPlay();
    //return;    
}

simulated event Destroyed()
{
    SetDamageParticles(false);
    ClearTimer('CheckPlayerProximity');
    super(SkeletalMeshActorMAT).Destroyed();
    //return;    
}

function CheckPlayerProximity()
{
    local /*0x97E50000-0x00000000*/ private int Count;
    local /*0x97E50000-0x00000000*/ private @NULL LPP, A, GRI, TI;

    GRI = WorldInfo.GRI;
    // End:0x44
    if(GRI == none)
    {
        ProximityCount = 0;
        return;
    }
    // End:0x137
    foreach Touching(A)
    {
        LPP = LPBasePlayerPawn(A);
        // End:0x136
        if((LPP != none) && LPP.IsAliveAndWell())
        {
            TI = LPTeamInfo_MP(GRI.Teams[int(LPP.GetTeamNum())]);
            // End:0x136
            if(bAttacking == TI.bAttackingTeam)
            {
                ++Count;
            }
        }        
    }    
    // End:0x1AD
    if(Count != ProximityCount)
    {
        // End:0x178
        if(Count == 0)
        {
            TriggerEventClass(Class'LPSeqEvent_ObjectiveUntouched', self);            
        }
        else
        {
            // End:0x1AD
            if(ProximityCount == 0)
            {
                // End:0x1AD
                if(!bIsDisabled)
                {
                    TriggerEventClass(Class'LPSeqEvent_ObjectiveTouched', self);
                }
            }
        }
    }
    ProximityCount = Count;
    //return;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser, GRI, TI;

    // End:0xE3
    if(EventInstigator != none)
    {
        GRI = WorldInfo.GRI;
        // End:0xE3
        if(GRI != none)
        {
            TI = LPTeamInfo_MP(GRI.Teams[int(LPPlayerController(EventInstigator).GetTeamNum())]);
            // End:0xE3
            if(TI != none)
            {
                // End:0xE3
                if(bAttacking == TI.bAttackingTeam)
                {
                    return;
                }
            }
        }
    }
    super(SkeletalMeshActor).TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    // End:0x16B
    if((Health > 0) && Damage > 0)
    {
        TriggerEventClass(Class'LPSeqEvent_ObjectiveTakingDamage', EventInstigator);
    }
    // End:0x1C0
    if((Health != 0) && (Health - Damage) <= 0)
    {
        TriggerEventClass(Class'LPSeqEvent_ObjectiveDisarmed', EventInstigator);
        SetDamageParticles(true);
    }
    Health -= Damage;
    // End:0x1FA
    if(Health <= 0)
    {
        Health = 0;
        bIsDisabled = true;
    }
    NotifyHUDStateChanged();
    //return;    
}

event HealDamage()
{
    local /*0x97E50000-0x00000000*/ private int Amount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Healer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x12D
    if(Health < MaxHealth)
    {
        // End:0x48
        if((Health + Amount) >= MaxHealth)
        {
            bIsDisabled = false;            
        }
        else
        {
            // End:0xD6
            if((Health < (MaxHealth / 2)) && (Health + Amount) >= (MaxHealth / 2))
            {
                TriggerEventClass(Class'LPSeqEvent_ObjectiveRepaired', Healer);
                bIsDisabled = false;
                SetDamageParticles(false);
                ProximityCount = 0;
                CheckPlayerProximity();
            }
        }
        TriggerEventClass(Class'LPSeqEvent_ObjectiveBeingRepaired', Healer);
        Health = Min(MaxHealth, Health + Amount);
        NotifyHUDStateChanged();
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

simulated function GetHealthPercent()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return (100.0000000 * float(Health)) / float(MaxHealth);
    //return ReturnValue;    
}

simulated function SetDamageParticles()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    // End:0xF6
    if(bOn)
    {
        // End:0xF3
        if(!ParticleDamageComponent.bIsActive)
        {
            ParticleDamageComponent.KillParticlesForced();
            ParticleDamageComponent.DeactivateSystem();
            ParticleDamageComponent.SetTemplate(DamageParticleSystem);
            SkeletalMeshComponent.AttachComponentToSocket(ParticleDamageComponent, 'Engine');
            ParticleDamageComponent.ActivateSystem();
            ++ParticleRepCount;
        }        
    }
    else
    {
        // End:0x161
        if(ParticleDamageComponent.bIsActive)
        {
            ParticleDamageComponent.KillParticlesForced();
            ParticleDamageComponent.DeactivateSystem();
            ++ParticleRepCount;
        }
    }
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], fDistance, fRotationDelta, F;

    fDistance = VSize2D(Velocity);
    // End:0x118
    if(fDistance > float(0))
    {
        fRotationDelta = (fDistance * DeltaTime) / WheelCircumference;
        F = float(WheelSkelControl.BoneRotation.Roll);
        F += (fRotationDelta * float(65536));
        J0xB1:

        // End:0xDB [Loop If]
        if(F >= float(65536))
        {
            F -= float(65536);
            // [Loop Continue]
            goto J0xB1;
        }
        WheelSkelControl.BoneRotation.Roll = int(F);
    }
    F = float(DrillSkelControl.BoneRotation.Yaw);
    F += (DeltaTime * float(65536));
    J0x172:

    // End:0x19C [Loop If]
    if(F >= float(65536))
    {
        F -= float(65536);
        // [Loop Continue]
        goto J0x172;
    }
    DrillSkelControl.BoneRotation.Yaw = int(F);
    PlowLSkelControl.BoneRotation.Pitch = int(F);
    PlowRSkelControl.BoneRotation.Pitch = int(float(65536) - F);
    super(Actor).Tick(DeltaTime);
    //return;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal, HitInfo;
    local /*0x97E50000-0x00000000*/ private bool bHit;
    local /*0x97E50000-0x00000000*/ private @NULL Position;
    local /*0x97E50000-0x00000000*/ private float ColRadius, ColHeight;
    local /*0x97E50000-0x00000000*/ private @NULL Extent;

    super(Actor).Bump(Other, OtherComp, HitNormal);
    // End:0x210
    if(LPBasePlayerPawn(Other) != none)
    {
        Other.GetBoundingCylinder(ColRadius, ColHeight);
        Extent.X = ColRadius;
        Extent.Y = ColRadius;
        Extent.Z = ColHeight;
        Position = Other.Location;
        bHit = CheckBumpPrimitive(SkeletalMeshComponent, Position, Extent, HitInfo);
        // End:0x210
        if(!bHit)
        {
            // End:0x210
            if((DrillTeethPhysicalMaterial != none) && HitInfo.PhysMaterial == DrillTeethPhysicalMaterial)
            {
                Other.TakeDamage(DamageToPlayerFromDrill, LPBasePlayerPawn(Other).Controller, Other.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypeSnowcatTeeth',, self);
            }
        }
    }
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, HitInfo;

    local /*0x97E50000-0x00000000*/ private bool bHit;
    local /*0x97E50000-0x00000000*/ private float ColRadius, ColHeight;
    local /*0x97E50000-0x00000000*/ private @NULL Extent;

    super(Actor).Touch(Other, OtherComp, HitLocation, HitNormal);
    // End:0x1E6
    if(LPBasePlayerPawn(Other) != none)
    {
        Other.GetBoundingCylinder(ColRadius, ColHeight);
        Extent.X = ColRadius;
        Extent.Y = ColRadius;
        Extent.Z = ColHeight;
        bHit = CheckBumpPrimitive(SkeletalMeshComponent, HitLocation, Extent, HitInfo);
        // End:0x1DC
        if(!bHit)
        {
            // End:0x1DC
            if((DrillTeethPhysicalMaterial != none) && HitInfo.PhysMaterial == DrillTeethPhysicalMaterial)
            {
                Other.TakeDamage(DamageToPlayerFromDrill, LPBasePlayerPawn(Other).Controller, HitLocation, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypeSnowcatTeeth',, self);
            }
        }
        CheckPlayerProximity();
    }
    //return;    
}

simulated event @NULL RigidBodyCollision()
{
    local /*0x97E50000-0x00000400*/ private @NULL HitComponent[8388609], OtherComponent, RigidCollisionData;
    local /*0x97E50000-0x00000000*/ private int ContactIndex[8388609];

    super(Actor).RigidBodyCollision(HitComponent, OtherComponent, RigidCollisionData, ContactIndex);
    //return;    
}

defaultproperties
{
    // Reference: LPObjectiveComponentEscort'Default__LPSnowcatObjective.ObjectiveComp'
    begin object name=ObjectiveComp class=Class'LPObjectiveComponentEscort'
    end object
    ObjectiveComponent=ObjectiveComp
    Health=1000
    MaxHealth=1000
    TouchRadius=850.0000000
    // Reference: CylinderComponent'Default__LPSnowcatObjective.CollisionCylinder0'
    begin object name=CollisionCylinder0 class=Class'Engine.CylinderComponent'
    end object
    CollisionCylinder=CollisionCylinder0
    bAttacking=true
    DrillRotationSpeed=524288.0000000
    DamageToPlayerFromDrill=1000
    // Reference: SPHeadTrackComponent'Default__LPSnowcatObjective.SPHeadTrackComponent0'
    begin object name=SPHeadTrackComponent0
    end object
    HeadTrackComponent=SPHeadTrackComponent0
    // Reference: SkeletalMeshComponent'Default__LPSnowcatObjective.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    SkeletalMeshComponent=SkeletalMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPSnowcatObjective.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: AudioComponent'Default__LPSnowcatObjective.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=MyLightEnvironment
    Components[1]=SkeletalMeshComponent0
    Components[2]=FaceAudioComponent
    Components[3]=SPHeadTrackComponent0
    Components[4]=CollisionCylinder0
    Components[5]=ObjectiveComp
    Physics=EPhysics.PHYS_Interpolating
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bAlwaysRelevant=true
    bCollideActors=true
    bCollideComplex=true
    bNoEncroachCheck=false
    // Reference: LPSnowcatObjectiveInteractionMetaData'Default__LPSnowcatObjective.SnowcatInteract0'
    begin object name=SnowcatInteract0 class=Class'LPSnowcatObjectiveInteractionMetaData'
    end object
    InteractionMetaData=SnowcatInteract0
    CollisionComponent=CollisionCylinder0
    SupportedEvents=/* Array type was not detected. */
}