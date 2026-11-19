class LPDSpitterTail extends LPDSkeletalMesh
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MySpitterPawn;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL Mesh[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataSpitter;

// Export ULPDSpitterTail::execInitPhysics(FFrame&, void* const)
protected native simulated function @NULL InitPhysics()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelMeshComp[8388609];
    local /*0x97E50000-0x00000000*/ private float Weight[8388609];


}

// Export ULPDSpitterTail::execMatchBoneOrientations(FFrame&, void* const)
protected native simulated function @NULL MatchBoneOrientations()
{
    local /*0x97E50000-0x00000400*/ private @NULL Source[8388609], Destination;


}

// Export ULPDSpitterTail::execInitRagdoll(FFrame&, void* const)
protected native function InitRagdoll()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPDSpitterTail::execGetRandomBonePos(FFrame&, void* const)
protected native function GetRandomBonePos()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

simulated function InitRBPhys()
{
    SetPhysics(10);
    SkeletalMeshComponent.WakeRigidBody();
    //return;    
}

simulated function StartRagdoll()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL StoredVelocity;

    StoredVelocity = Velocity * vect(1.5000000, 1.5000000, 0.0000000);
    Mesh.MinDistFactorForKinematicUpdate = 0.0000000;
    // End:0xC9
    if(Mesh.bNotUpdatingKinematicDueToDistance)
    {
        Mesh.ForceSkelUpdate();
        Mesh.UpdateRBBonesFromSpaceBases(true, true);
        Mesh.SetBlockRigidBody(true);
    }
    // End:0x2AF
    if(InitRagdoll())
    {
        // End:0x1FC
        if(Mesh.PhysicsAssetInstance != none)
        {
            Mesh.PhysicsAssetInstance.SetAllMotorsAngularPositionDrive(false, false, Mesh, true);
            Mesh.PhysicsAssetInstance.SetAllMotorsAngularDriveParams(0.0000000, 0.0000000, 0.0040000, Mesh, true);
            Mesh.PhysicsAssetInstance.SetAllMotorsAngularVelocityDrive(true, true, Mesh, true);
            Mesh.PhysicsAssetInstance.SetAllBodiesFixed(false);
        }
        Mesh.SetBlockRigidBody(true);
        Mesh.bUpdateJointsFromAnimation = false;
        Mesh.bUpdateKinematicBonesFromAnimation = false;
        SetCollision(true, false);
        Mesh.WakeRigidBody();
        Mesh.SetRBLinearVelocity(StoredVelocity, false);
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function array MatchActorBoneOrientations()
{
    local /*0x97E50000-0x00000000*/ private @NULL SrcActor[8388609], SrcComponent;
    local /*0x97E50000-0x00000400*/ private editfixedsize array ComponentArray;

    SrcActor.GetComponentsOfClass(Class'Engine.SkeletalMeshComponent', ComponentArray);
    // End:0x5F
    if(ComponentArray.Length > 0)
    {
        SrcComponent = SkeletalMeshComponent(ComponentArray[0]);
    }
    MatchBoneOrientations(SrcComponent, SkeletalMeshComponent);
    SkeletalMeshComponent.UpdateRBBonesFromSpaceBases(true, true);
    //return;    
}

static simulated function CreateInstance()
{
    local /*0x97E50000-0x00000000*/ private @NULL InSpitterPawn[8388609], ReturnValue, tail;

    tail = InSpitterPawn.Spawn(default.Class,,, InSpitterPawn.Location, InSpitterPawn.Rotation,, true);
    // End:0x2A6
    if(tail != none)
    {
        tail.MySpitterPawn = InSpitterPawn;
        tail.SetCollisionType(2);
        tail.SkeletalMeshComponent.SetRBCollidesWithChannel(5, true);
        tail.Mesh = tail.SkeletalMeshComponent;
        tail.Mesh.SetShadowParent(InSpitterPawn.Mesh);
        tail.Mesh.SetLightingChannels(InSpitterPawn.Mesh.LightingChannels);
        tail.Mesh.SetLightEnvironment(InSpitterPawn.Mesh.LightEnvironment);
        tail.MatchActorBoneOrientations(InSpitterPawn);
        tail.StartRagdoll();
    }
    return tail;
    //return ReturnValue;    
}

auto state TailActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super(SPStateObject).BeginState(PreviousState);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextState[8388609];

        super(SPStateObject).EndState(NextState);
        ClearTimer('TailTimer', self);
        //return;        
    }

    simulated function GiveInitialVelocity()
    {
        local /*0x97E50000-0x00000000*/ private @NULL InitialVelocity;

        // End:0x93
        if((MySpitterPawn == none) || !MySpitterPawn.IsGrabbed())
        {
            InitialVelocity = -Vector(Rotation);
            InitialVelocity = Normal(InitialVelocity) * float(1000);
            Mesh.SetRBLinearVelocity(InitialVelocity, true);
        }
        //return;        
    }

    simulated function StartTailDestructTimer()
    {
        local /*0x97E50000-0x00000000*/ private float Time;

        Time = TuneDataSpitter.TimeBetweenDismembermentAndExplosion.GetValue();
        SetTimer(Time, false, 'TailTimer', self);
        //return;        
    }

    simulated function TailTimer()
    {
        GotoState('TailBlowUp');
        //return;        
    }

    simulated function RandomImpulse()
    {
        local /*0x97E50000-0x00000000*/ private @NULL pos;
        local /*0x97E50000-0x00000000*/ private float ImpulseStrength;

        pos = GetRandomBonePos();
        ImpulseStrength = RandRange(TuneDataSpitter.TailTwitchStrengthMin.GetValue(), TuneDataSpitter.TailTwitchStrengthMax.GetValue());
        Mesh.AddRadialImpulse(pos, ImpulseStrength, 1000.0000000, 1, true);
        //return;        
    }
Begin:

    GiveInitialVelocity();
    StartTailDestructTimer();
    J0x14:

    // End:0x9A [Loop If]
    if(true)
    {
        Sleep(RandRange(TuneDataSpitter.TailTwitchDelayMin.GetValue(), TuneDataSpitter.TailTwitchDelayMax.GetValue()));
        RandomImpulse();
        // [Loop Continue]
        goto J0x14;
    }
    stop;        
}

state TailBlowUp
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super(SPStateObject).BeginState(PreviousState);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextState[8388609];

        super(SPStateObject).EndState(NextState);
        //return;        
    }

    simulated function DoExplosion()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ExplosionLoc[8388609], explosionActor;

        // End:0x1DC
        if(TuneDataSpitter.TailExplosionTemplate != none)
        {
            explosionActor = Spawn(Class'LPExplosionActor',,, ExplosionLoc, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
            // End:0x1DC
            if(explosionActor != none)
            {
                explosionActor.TheWeaponThatSpawnedMe = self;
                explosionActor.Instigator = MySpitterPawn;
                explosionActor.InstigatorController = MySpitterPawn.Controller;
                explosionActor.bDrawDebug = TuneDataSpitter.bDebugDrawTailExplosion;
                explosionActor.ExplosionPhysMaterial = ((Mesh.PhysMaterialOverride != none) ? SPPhysicalMaterial(Mesh.PhysMaterialOverride) : none);
                explosionActor.Explode(TuneDataSpitter.TailExplosionTemplate);
            }
        }
        //return;        
    }

    simulated function StartExplosion()
    {
        local /*0x97E50000-0x00000000*/ private @NULL pos;

        pos = Mesh.GetBoneLocation('JO_Tail_J');
        DoExplosion(pos);
        //return;        
    }
Begin:

    StartExplosion();
    SetHidden(true);
    Destroy();
    bForceNetUpdate = true;
    stop;                
}

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__LPDSpitterTail.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    Mesh=SkeletalMeshComponent0
    // Reference: SPHeadTrackComponent'Default__LPDSpitterTail.SPHeadTrackComponent0'
    begin object name=SPHeadTrackComponent0
    end object
    HeadTrackComponent=SPHeadTrackComponent0
    SkeletalMeshComponent=SkeletalMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPDSpitterTail.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: AudioComponent'Default__LPDSpitterTail.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=MyLightEnvironment
    Components[1]=SkeletalMeshComponent0
    Components[2]=FaceAudioComponent
    Components[3]=SPHeadTrackComponent0
    // Reference: SPActorDestructComponent'Default__LPDSpitterTail.SPActorDestructComponent0'
    begin object name=SPActorDestructComponent0
    end object
    Components[4]=SPActorDestructComponent0
    // Reference: SPDestructibleStateComponent'Default__LPDSpitterTail.SPDestructibleStateComponent0'
    begin object name=SPDestructibleStateComponent0
    end object
    Components[5]=SPDestructibleStateComponent0
    DestructComponent=SPActorDestructComponent0
    CollisionComponent=SkeletalMeshComponent0
}