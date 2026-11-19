class LPInterpActor_PlayerTransport extends LPInterpActor_PlayerTransportBase
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x80100000-0x00000000*/ private @NULL WheelActor[536936449];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private const class WheelActorClass[131073];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL EditorWheelsPreviewMesh[537395201];
var(0.25_Pct) /*0x80100000-0x00000000*/ private bool bNoAudio[196609];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayerAudioIsPlaying[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNonPlayerAudioIsPlaying[536870913];
var(0.25_Pct) /*0x80100000-0x00000000*/ private travel bool bEngineRunning[2162689];
var(0.25_Pct) /*0x80100000-0x00000000*/ private bool bNoJiggle[196609];
var(0.25_Pct) /*0x80100000-0x00000000*/ private bool bAlwaysUpdateWheels[65537];
var(0.25_Pct) /*0x80100000-0x00000000*/ private float EngineRPM[536936449];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastEngineRPM[536870913];
var(0.25_Pct) /*0x80100000-0x00000000*/ private float EngineRPMInterpSpeed[196609];
var(0.25_Pct) /*0x80100000-0x00000000*/ private @NULL EngineRPMAccelRange[196609];
var(0.25_Pct) /*0x80100000-0x00000000*/ private @NULL EngineRPMVelRange[196609];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastActualVelocity[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ReplicatedZ[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ReplicatedPitch[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DesiredZ;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DesiredPitch;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL PlayerEngineMainLoop[524289];
var(0.25_Pct) /*0x80100000-0x00000000*/ private @NULL PlayerEngineMainLoopCue[536936449];
var(0.25_Pct) /*0x80100000-0x00000000*/ private @NULL StopEngineSound[196609];
var(0.25_Pct) /*0x80100000-0x00000000*/ private @NULL StartEngineSound[196609];

// Export ULPInterpActor_PlayerTransport::execInterpBodyRotation(FFrame&, void* const)
native function InterpBodyRotation()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private int DesiredYaw[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

protected simulated function @NULL CreateTransportAudioComponent()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cue[8388609], A;
    local /*0x97E50000-0x00000000*/ private bool bSpatialized[9437185];
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689], AC;

    true
    // End:0x27
    if((A == none) || Cue == none)
    {
        return none;
    }
    AC = A.CreateAudioComponent(Cue, false, true);
    // End:0x119
    if(AC != none)
    {
        AC.bUseOwnerLocation = true;
        AC.bAllowSpatialization = bSpatialized;
        AC.bAutoDestroy = false;
        AC.bShouldRemainActiveIfDropped = true;
        AC.Play();
    }
    return AC;
    //return ReturnValue;    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x41
    if(StaticMeshComponent != none)
    {
        StaticMeshComponent.SetLightEnvironment(LightEnvironment);
    }
    // End:0x96
    if(int(self.Role) == int(ROLE_Authority))
    {
        WheelActor = Spawn(WheelActorClass, self,, Location, Rotation,, true);
    }
    // End:0xC5
    if(WheelActor != none)
    {
        WheelActor.AttachToTransport(self);
    }
    DetachComponent(EditorWheelsPreviewMesh);
    EditorWheelsPreviewMesh = none;
    // End:0x10C
    if(bShouldShadowParentAllAttachedActors)
    {
        SetShadowParentOnAllAttachedComponents(StaticMeshComponent, LightEnvironment);
    }
    //return;    
}

protected simulated event SetupAudio()
{
    local /*0x97E50000-0x00000000*/ private bool bDoingPlayerAudio[8388609], bDoingNonPlayerAudio;
    local /*0x97E50000-0x00000000*/ private @NULL LocallyControlledPawn[8388609];

    // End:0x74
    if(bDoingPlayerAudio)
    {
        // End:0x43
        if(PlayerEngineMainLoop == none)
        {
            PlayerEngineMainLoop = CreateTransportAudioComponent(PlayerEngineMainLoopCue, LocallyControlledPawn);
        }
        // End:0x71
        if(PlayerEngineMainLoop != none)
        {
            PlayerEngineMainLoop.Play();
        }        
    }
    else
    {
        // End:0xA2
        if(PlayerEngineMainLoop != none)
        {
            PlayerEngineMainLoop.Stop();
        }
    }
    WheelActor.SetupAudio(bDoingPlayerAudio, bDoingNonPlayerAudio);
    bPlayerAudioIsPlaying = bDoingPlayerAudio;
    bNonPlayerAudioIsPlaying = bDoingNonPlayerAudio;
    //return;    
}

simulated event ShutDown()
{
    super(InterpActor).ShutDown();
    WheelActor.Destroy();
    WheelActor = none;
    //return;    
}

simulated function OnToggleHidden()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    super.OnToggleHidden(Action);
    // End:0x6A
    if(bHidden != WheelActor.bHidden)
    {
        WheelActor.SetWheelsHidden(bHidden);
    }
    // End:0x87
    if(bHidden)
    {
        SetupAudio(false, false, none);        
    }
    else
    {
        bPlayerAudioIsPlaying = false;
        bNonPlayerAudioIsPlaying = false;
    }
    //return;    
}

simulated function StopEngine()
{
    SetupAudio(false, false, none);
    PlaySound(StopEngineSound, true);
    bEngineRunning = false;
    //return;    
}

simulated function StartEngine()
{
    PlaySound(StartEngineSound, true);
    bEngineRunning = true;
    bPlayerAudioIsPlaying = false;
    bNonPlayerAudioIsPlaying = false;
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x3E
    if(VarName == 'bEngineRunning')
    {
        // End:0x31
        if(bEngineRunning)
        {
            StartEngine();            
        }
        else
        {
            StopEngine();
        }        
    }
    else
    {
        super(DynamicSMActor).ReplicatedEvent(VarName);
    }
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25296897];

    super.ApplyCheckpointRecord(Record);
    // End:0x4B
    if(WheelActor != none)
    {
        WheelActor.SetWheelsHidden(bHidden);
    }
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x1F0
    if(int(Role) != int(ROLE_Authority))
    {
        // End:0x52
        if(DesiredZ == float(-12345))
        {
            DesiredZ = ReplicatedZ;
            DesiredPitch = ReplicatedPitch;            
        }
        else
        {
            // End:0xBB
            if(DesiredZ < ReplicatedZ)
            {
                DesiredZ += ((ReplicatedZ - DesiredZ) / float(10));
                // End:0xB8
                if(DesiredZ > ReplicatedZ)
                {
                    DesiredZ = ReplicatedZ;
                }                
            }
            else
            {
                // End:0x121
                if(DesiredZ > ReplicatedZ)
                {
                    DesiredZ -= ((DesiredZ - ReplicatedZ) / float(10));
                    // End:0x121
                    if(DesiredZ < ReplicatedZ)
                    {
                        DesiredZ = ReplicatedZ;
                    }
                }
            }
            // End:0x18A
            if(DesiredPitch < ReplicatedPitch)
            {
                DesiredPitch += ((ReplicatedPitch - DesiredPitch) / float(10));
                // End:0x187
                if(DesiredPitch > ReplicatedPitch)
                {
                    DesiredPitch = ReplicatedPitch;
                }                
            }
            else
            {
                // End:0x1F0
                if(DesiredPitch > ReplicatedPitch)
                {
                    DesiredPitch -= ((DesiredPitch - ReplicatedPitch) / float(10));
                    // End:0x1F0
                    if(DesiredPitch < ReplicatedPitch)
                    {
                        DesiredPitch = ReplicatedPitch;
                    }
                }
            }
        }
    }
    //return;    
}

simulated event AdjustInterpMoveTrackParameters()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL OldLoc[8388609], oldRot, NewLoc, NewRot;

    super(InterpActor).AdjustInterpMoveTrackParameters(DeltaTime, OldLoc, oldRot, NewLoc, NewRot);
    // End:0x177
    if(int(Role) == int(ROLE_Authority))
    {
        NewRot = InterpBodyRotation(DeltaTime, NewRot.Yaw);
        NewRot.Pitch = int(WheelActor.ActorPitch);
        NewRot.Roll = 0;
        NewLoc.Z = WheelActor.ActorLocationDisplacement;
        ReplicatedZ = NewLoc.Z;
        ReplicatedPitch = float(NewRot.Pitch);
        bNetDirty = true;        
    }
    else
    {
        // End:0x1DA
        if(DesiredZ != float(-12345))
        {
            NewLoc.Z = DesiredZ;
            NewRot.Pitch = int(DesiredPitch);
        }
    }
    //return;    
}

defaultproperties
{
    bEngineRunning=true
    bNoJiggle=true
    EngineRPMInterpSpeed=0.3500000
    EngineRPMAccelRange=(X=30.0000000,Y=2500.0000000)
    EngineRPMVelRange=(X=100.0000000,Y=1400.0000000)
    ReplicatedZ=-12345.0000000
    DesiredZ=-12345.0000000
    DesiredPitch=-12345.0000000
    bAlwaysConfineToClampedBase=true
    bStopOnEncroach=false
    // Reference: StaticMeshComponent'Default__LPInterpActor_PlayerTransport.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__LPInterpActor_PlayerTransport.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__LPInterpActor_PlayerTransport.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    // Reference: StaticMeshComponent'Default__LPInterpActor_PlayerTransport.RBCollision0'
    begin object name=RBCollision0 class=Class'Engine.StaticMeshComponent'
    end object
    Components[2]=RBCollision0
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    CollisionType=ECollisionType.COLLIDE_BlockAll
    BlockRigidBody=true
    bBlockActors=true
    CollisionComponent=StaticMeshComponent0
}