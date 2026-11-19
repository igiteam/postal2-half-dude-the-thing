class KActor extends DynamicSMActor
    nativereplication
    placeable
    hidecategories(AnimDependency)
    classgroup(Physics);

struct CheckpointRecord
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SavedGuid;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Location;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Rotation;
    var(*) /*0x35EA0000-0x00000000*/ private byte CollisionType;
    var(*) /*0x35EA0000-0x00000000*/ private bool bHidden;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsShutdown;
    var(*) /*0x35EA0000-0x00000000*/ private bool bNeedsPositionReplication;

    structdefaultproperties
    {
        SavedGuid=(A=0,B=0,C=0,D=0)
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Rotation=(Pitch=0,Yaw=0,Roll=0)
        CollisionType=ECollisionType.COLLIDE_CustomDefault
        bHidden=false
        bIsShutdown=false
        bNeedsPositionReplication=false
    }
};

var(*) /*0x2D1A0000-0x00000000*/ private bool bDamageAppliesImpulse[65537];
var(*) /*0x2D1A0000-0x00000000*/ private travel bool bWakeOnLevelStart[2162689];
var(*) /*0x35EA0000-0x00000000*/ private bool bCurrentSlide;
var(*) /*0x35EA0000-0x00000000*/ private bool bSlideActive;
var(*) /*0x4A560000-0x00000000*/ private bool bEnableStayUprightSpring[65537];
var(*) /*0x2D1A0000-0x00000000*/ private bool bLimitMaxPhysicsVelocity[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bNeedsRBStateReplication[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bDisableClientSidePawnInteractions;
var(*) /*0x35EA0000-0x00000000*/ private bool bShouldSaveForCheckpoint;
var(*) /*0x35EA0000-0x00000400*/ private export @NULL ImpactEffectComponent[524289];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL ImpactSoundComponent[524289];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL ImpactSoundComponent2[524289];
var(*) /*0x35EA0000-0x00000000*/ private float LastImpactTime;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ImpactEffectInfo;
var(*) /*0x35EA0000-0x00000400*/ private export @NULL SlideEffectComponent[524289];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL SlideSoundComponent[524289];
var(*) /*0x35EA0000-0x00000000*/ private float LastSlideTime;
var(*) /*0x35EA0000-0x00000000*/ private @NULL SlideEffectInfo;
var(*) /*0x4A560000-0x00000000*/ private float StayUprightTorqueFactor[65537];
var(*) /*0x4A560000-0x00000000*/ private float StayUprightMaxTorque[65537];
var(*) /*0x2D1A0000-0x00000000*/ private float MaxPhysicsVelocity[65537];
var(*) /*0x35EA0000-0x00000000*/ private RigidBodyState RBState[270663681];
var(*) /*0x35EA0000-0x00000000*/ private float AngErrorAccumulator[268566529];
var(*) /*0x35EA0000-0x00000000*/ private travel @NULL ReplicatedDrawScale3D[2097153];
var(*) /*0x35EA0000-0x00000000*/ private @NULL InitialLocation[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL InitialRotation[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MyGuid;

// Export UKActor::execGetKActorPhysMaterial(FFrame&, void* const)
native final function GetKActorPhysMaterial()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UKActor::execResolveRBState(FFrame&, void* const)
native final function ResolveRBState();

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x4B
    if(bWakeOnLevelStart && StaticMeshComponent != none)
    {
        StaticMeshComponent.WakeRigidBody();        
    }
    else
    {
        bNeedsRBStateReplication = !bNoDelete;
    }
    ReplicatedDrawScale3D = DrawScale3D * 1000.0000000;
    // End:0xB9
    if((StaticMeshComponent != none) && StaticMeshComponent.bNotifyRigidBodyCollision)
    {
        SetPhysicalCollisionProperties();
    }
    InitialLocation = Location;
    InitialRotation = Rotation;
    // End:0x135
    if((bDisableClientSidePawnInteractions && int(Role) != int(ROLE_Authority)) && StaticMeshComponent != none)
    {
        StaticMeshComponent.SetRBCollidesWithChannel(2, false);
    }
    //return;    
}

simulated event FellOutOfWorld()
{
    local /*0x35EA0000-0x00000000*/ private class dmgType[8388609];

    ShutDown();
    super(Actor).FellOutOfWorld(dmgType);
    //return;    
}

simulated event Destroyed()
{
    // End:0x82
    if(ImpactEffectInfo.Sound != none)
    {
        // End:0x52
        if(ImpactSoundComponent != none)
        {
            ImpactSoundComponent.bAutoDestroy = true;
        }
        // End:0x82
        if(ImpactSoundComponent2 != none)
        {
            ImpactSoundComponent2.bAutoDestroy = true;
        }
    }
    // End:0xC5
    if(SlideEffectInfo.Sound != none)
    {
        SlideSoundComponent.bAutoDestroy = true;
    }
    super(Actor).Destroyed();
    //return;    
}

simulated function SetPhysicalCollisionProperties()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PhysMat;

    PhysMat = GetKActorPhysMaterial();
    ImpactEffectInfo = PhysMat.FindPhysEffectInfo(0);
    SlideEffectInfo = PhysMat.FindPhysEffectInfo(1);
    // End:0x100
    if(ImpactEffectInfo.Effect != none)
    {
        ImpactEffectComponent = new (self) Class'ParticleSystemComponent';
        ImpactEffectComponent.bAutoActivate = false;
        ImpactEffectComponent.SetTemplate(ImpactEffectInfo.Effect);
    }
    // End:0x1C8
    if(ImpactEffectInfo.Sound != none)
    {
        ImpactSoundComponent = new (self) Class'AudioComponent';
        ImpactSoundComponent.SoundCue = ImpactEffectInfo.Sound;
        ImpactSoundComponent2 = new (self) Class'AudioComponent';
        ImpactSoundComponent2.SoundCue = ImpactEffectInfo.Sound;
    }
    // End:0x25E
    if(SlideEffectInfo.Effect != none)
    {
        SlideEffectComponent = new (self) Class'ParticleSystemComponent';
        SlideEffectComponent.bAutoActivate = false;
        SlideEffectComponent.SetTemplate(SlideEffectInfo.Effect);
    }
    // End:0x2D3
    if(SlideEffectInfo.Sound != none)
    {
        SlideSoundComponent = new (self) Class'AudioComponent';
        SlideSoundComponent.SoundCue = SlideEffectInfo.Sound;
    }
    //return;    
}

simulated event SpawnedByKismet()
{
    // End:0x2C
    if(StaticMeshComponent.bNotifyRigidBodyCollision)
    {
        SetPhysicalCollisionProperties();
    }
    InitialLocation = Location;
    InitialRotation = Rotation;
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL NewDrawScale3D;

    // End:0x47
    if(VarName == 'bWakeOnLevelStart')
    {
        // End:0x44
        if(bWakeOnLevelStart)
        {
            StaticMeshComponent.WakeRigidBody();
        }        
    }
    else
    {
        // End:0x8E
        if(VarName == 'ReplicatedDrawScale3D')
        {
            NewDrawScale3D = ReplicatedDrawScale3D / 1000.0000000;
            SetDrawScale3D(NewDrawScale3D);            
        }
        else
        {
            super.ReplicatedEvent(VarName);
        }
    }
    //return;    
}

event ApplyImpulse()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ImpulseDir[8388609];
    local /*0x35EA0000-0x00000000*/ private float ImpulseMag[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitLocation[8388609], HitInfo;
    local /*0x35EA0000-0x00000000*/ private class DamageType[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL AppliedImpulse;

    AppliedImpulse = Normal(ImpulseDir) * ImpulseMag;
    // End:0xA8
    if(HitInfo.HitComponent != none)
    {
        HitInfo.HitComponent.AddImpulse(AppliedImpulse, HitLocation, HitInfo.BoneName);        
    }
    else
    {
        CollisionComponent.AddImpulse(AppliedImpulse, HitLocation);
    }
    //return;    
}

event TakeDamage()
{
    local /*0x35EA0000-0x00000000*/ private int Damage[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
    local /*0x35EA0000-0x00000000*/ private float Impulse;

    super(Actor).TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    Impulse = DamageType.default.KDamageImpulse * (GetImpulseScale());
    // End:0xED
    if(bDamageAppliesImpulse && Impulse > float(0))
    {
        // End:0xB6
        if(VSize(Momentum) < 0.0010000)
        {
            return;
        }
        ApplyImpulse(Momentum, Impulse, HitLocation, HitInfo, DamageType);
    }
    //return;    
}

simulated function TakeRadiusDamage()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InstigatedBy[8388609];
    local /*0x35EA0000-0x00000000*/ private float BaseDamage[8388609], DamageRadius;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private float Momentum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HurtOrigin[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bFullDamage[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x35EA0000-0x00000000*/ private float DamageFalloffExponent[9437185];
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private @NULL DmgEvt;
    local /*0x35EA0000-0x00000000*/ private float RadialImpulse;

    1.0000000
    Idx = 0;
    J0x14:

    // End:0xAC [Loop If]
    if(Idx < GeneratedEvents.Length)
    {
        DmgEvt = SeqEvent_TakeDamage(GeneratedEvents[Idx]);
        // End:0x9E
        if(DmgEvt != none)
        {
            DmgEvt.HandleDamage(self, InstigatedBy, DamageType, int(BaseDamage));
        }
        Idx++;
        // [Loop Continue]
        goto J0x14;
    }
    RadialImpulse = DamageType.default.RadialDamageImpulse * (GetRadialImpulseScale());
    // End:0x171
    if((bDamageAppliesImpulse && RadialImpulse > float(0)) && int(Role) == int(ROLE_Authority))
    {
        CollisionComponent.AddRadialImpulse(HurtOrigin, DamageRadius, RadialImpulse, 1, DamageType.default.bRadialDamageVelChange);
    }
    NotifyDestructComponentOfDamage(int(BaseDamage), InstigatedBy, Location, Momentum * (Location - HurtOrigin), DamageType,, DamageCauser);
    //return;    
}

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x57
    if(Action.InputLinks[0].bHasImpulse)
    {
        StaticMeshComponent.WakeRigidBody();
    }
    //return;    
}

simulated function OnTeleport()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array objVars;
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private @NULL destActor;

    inAction.GetObjectVars(objVars, "Destination");
    Idx = 0;
    J0x40:

    // End:0x9D [Loop If]
    if((Idx < objVars.Length) && destActor == none)
    {
        destActor = Actor(objVars[Idx]);
        Idx++;
        // [Loop Continue]
        goto J0x40;
    }
    // End:0x134
    if(destActor != none)
    {
        StaticMeshComponent.SetRBPosition(destActor.Location);
        StaticMeshComponent.SetRBRotation(destActor.Rotation);
        PlayTeleportEffect(false, true);
    }
    //return;    
}

simulated function Reset()
{
    StaticMeshComponent.SetRBLinearVelocity(vect(0.0000000, 0.0000000, 0.0000000));
    StaticMeshComponent.SetRBAngularVelocity(vect(0.0000000, 0.0000000, 0.0000000));
    StaticMeshComponent.SetRBPosition(InitialLocation);
    StaticMeshComponent.SetRBRotation(InitialRotation);
    // End:0xDE
    if(!bWakeOnLevelStart)
    {
        StaticMeshComponent.PutRigidBodyToSleep();        
    }
    else
    {
        StaticMeshComponent.WakeRigidBody();
    }
    ResolveRBState();
    bForceNetUpdate = true;
    super(Actor).Reset();
    //return;    
}

simulated function GetImpulseScale()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000;
    //return ReturnValue;    
}

simulated function GetRadialImpulseScale()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000;
    //return ReturnValue;    
}

function ShouldSaveForCheckpoint()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return bShouldSaveForCheckpoint || int(RemoteRole) == int(ROLE_SimulatedProxy);
    //return ReturnValue;    
}

function CreateCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25165825];

    Record.SavedGuid = MyGuid;
    Record.Location = Location;
    Record.Rotation = Rotation;
    Record.bHidden = bHidden;
    Record.CollisionType = ReplicatedCollisionType;
    Record.bNeedsPositionReplication = (int(RemoteRole) == int(ROLE_SimulatedProxy)) && bUpdateSimulatedPosition;
    Record.bIsShutdown = (int(Physics) == int(0)) && bHidden;
    //return;    
}

function @NULL ApplyCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25296897], OldBase, OldBaseComp;
    local /*0x35EA0000-0x00000000*/ private name OldBaseBoneName;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array OldAttached, OldLocations;
    local /*0x35EA0000-0x00000000*/ private int I;

    // End:0x2D
    if(Record.bIsShutdown)
    {
        ShutDown();        
    }
    else
    {
        OldAttached = Attached;
        J0x40:

        // End:0x101 [Loop If]
        if(I < OldAttached.Length)
        {
            // End:0xE9
            if((OldAttached[I] != none) && OldAttached[I].bJustTeleported)
            {
                OldLocations[I] = OldAttached[I].Location;
                I++;                
            }
            else
            {
                OldAttached.Remove(I, 1);                
            }
            // [Loop Continue]
            goto J0x40;
        }
        OldBase = Base;
        OldBaseComp = BaseSkelComponent;
        OldBaseBoneName = BaseBoneName;
        SetLocation(Record.Location);
        SetRotation(Record.Rotation);
        SetBase(OldBase,, OldBaseComp, OldBaseBoneName);
        I = 0;
        J0x1A9:

        // End:0x243 [Loop If]
        if(I < OldAttached.Length)
        {
            // End:0x235
            if(OldAttached[I] != none)
            {
                OldAttached[I].SetLocation(OldLocations[I]);
                OldAttached[I].SetBase(self);
            }
            I++;
            // [Loop Continue]
            goto J0x1A9;
        }
        // End:0x2A1
        if(int(Record.CollisionType) != int(ReplicatedCollisionType))
        {
            SetCollisionType(Record.CollisionType);
            ForceNetRelevant();
        }
        // End:0x327
        if(Record.bHidden != bHidden)
        {
            SetHidden(Record.bHidden);
            SetForcedInitialReplicatedProperty(BoolProperty'Actor.bHidden', bHidden == default.bHidden);
            ForceNetRelevant();
        }
        // End:0x369
        if(Record.bNeedsPositionReplication)
        {
            bUpdateSimulatedPosition = true;
            bReplicateMovement = true;
            ForceNetRelevant();
        }
    }
    bShouldSaveForCheckpoint = true;
    //return;    
}

defaultproperties
{
    bDamageAppliesImpulse=true
    bNeedsRBStateReplication=true
    bDisableClientSidePawnInteractions=true
    StayUprightTorqueFactor=1000.0000000
    StayUprightMaxTorque=1500.0000000
    MaxPhysicsVelocity=350.0000000
    ReplicatedDrawScale3D=(X=1000.0000000,Y=1000.0000000,Z=1000.0000000)
    // Reference: StaticMeshComponent'Default__KActor.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__KActor.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__KActor.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    bPawnCanBaseOn=false
    bSafeBaseIfAsleep=true
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    Physics=EPhysics.PHYS_RigidBody
    TickGroup=ETickingGroup.TG_PostAsyncWork
    bNoDelete=true
    bAlwaysRelevant=true
    bUpdateSimulatedPosition=true
    bNetInitialRotation=true
    bBlocksNavigation=true
    bCollideActors=true
    bBlockActors=true
    bProjTarget=true
    bBlocksTeleport=true
    bNoEncroachCheck=true
    CollisionComponent=StaticMeshComponent0
    SupportedEvents=/* Array type was not detected. */
}