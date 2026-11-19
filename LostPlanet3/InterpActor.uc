class InterpActor extends DynamicSMActor
    placeable
    hidecategories(AnimDependency,Navigation)
    classgroup(Common);

struct CheckpointRecord
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SavedGuid;
    var(*) /*0x35EA0000-0x00000000*/ private int Health;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Location;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Rotation;
    var(*) /*0x35EA0000-0x00000000*/ private byte CollisionType;
    var(*) /*0x35EA0000-0x00000000*/ private bool bHidden;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsShutdown;
    var(*) /*0x35EA0000-0x00000000*/ private bool bNeedsPositionReplication;

    structdefaultproperties
    {
        SavedGuid=(A=0,B=0,C=0,D=0)
        Health=0
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Rotation=(Pitch=0,Yaw=0,Roll=0)
        CollisionType=ECollisionType.COLLIDE_CustomDefault
        bHidden=false
        bIsShutdown=false
        bNeedsPositionReplication=false
    }
};

var(*) /*0x35EA0000-0x00000000*/ private bool bShouldSaveForCheckpoint;
var(*) /*0x35EA0000-0x00000000*/ private bool bMonitorMover;
var(*) /*0x35EA0000-0x00000000*/ private bool bMonitorZVelocity;
var(*) /*0x2BB70000-0x00000000*/ private bool bDestroyProjectilesOnEncroach[65537];
var(*) /*0x2BB70000-0x00000000*/ private bool bContinueOnEncroachPhysicsObject[65537];
var(*) /*0x2BB70000-0x00000000*/ private bool bStopOnEncroach[65537];
var(*) /*0x2BB70000-0x00000000*/ private bool bShouldShadowParentAllAttachedActors[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsLift;
var(*) /*0x35EA0000-0x00000000*/ private @NULL MyMarker;
var(*) /*0x35EA0000-0x00000000*/ private float MaxZVelocity;
var(*) /*0x35EA0000-0x00000000*/ private float StayOpenTime;
var(*) /*0x2BB70000-0x00000000*/ private @NULL OpenSound[65537];
var(*) /*0x2BB70000-0x00000000*/ private @NULL OpeningAmbientSound[65537];
var(*) /*0x2BB70000-0x00000000*/ private @NULL OpenedSound[65537];
var(*) /*0x2BB70000-0x00000000*/ private @NULL CloseSound[65537];
var(*) /*0x2BB70000-0x00000000*/ private @NULL ClosingAmbientSound[65537];
var(*) /*0x2BB70000-0x00000000*/ private @NULL ClosedSound[65537];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL AmbientSoundComponent[524289];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MyGuid;

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x33
    if(bShouldShadowParentAllAttachedActors)
    {
        SetShadowParentOnAllAttachedComponents(StaticMeshComponent, LightEnvironment);
    }
    // End:0x7E
    if((OpeningAmbientSound != none) || ClosingAmbientSound != none)
    {
        AmbientSoundComponent = new (self) Class'AudioComponent';
        AttachComponent(AmbientSoundComponent);
    }
    // End:0xD2
    if((Base != none) && bHardAttach || (BaseSkelComponent != none) && BaseBoneName != 'None')
    {
        bShouldSaveForCheckpoint = false;
    }
    //return;    
}

event EncroachingOn()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private @NULL MoverEvent, P, Height, HitLocation, HitNormal;

    local /*0x35EA0000-0x00000000*/ private bool bLandingPawn;

    // End:0x3A
    if(bContinueOnEncroachPhysicsObject && int(Other.Physics) == int(10))
    {
        return false;
    }
    // End:0x76
    if(Other.bDestroyedByInterpActor)
    {
        Other.Destroy();
        return false;
    }
    // End:0x4F2
    if((Other.Base == self) || (Normal(Velocity) Dot Normal(Other.Location - Location)) >= 0.0000000)
    {
        P = Pawn(Other);
        // End:0x3C3
        if(P != none)
        {
            // End:0x2BA
            if((int(P.Physics) == int(2)) && Velocity.Z > 0.0000000)
            {
                Height = P.GetCollisionHeight() * vect(0.0000000, 0.0000000, 1.0000000);
                // End:0x2B7
                if(TraceComponent(HitLocation, HitNormal, StaticMeshComponent, P.Location - Height, P.Location + Height, P.GetCollisionExtent()))
                {
                    // End:0x2AB
                    if(P.Location.Z < Location.Z)
                    {
                        P.SetLocation(HitLocation + Height);
                    }
                    bLandingPawn = true;
                }                
            }
            else
            {
                // End:0x3C0
                if((((P.Base != self) && P.Controller != none) && P.Controller.PendingMover != none) && P.Controller.PendingMover == self)
                {
                    P.Controller.UnderLift(LiftCenter(MyMarker));
                }
            }            
        }
        else
        {
            // End:0x44A
            if(bDestroyProjectilesOnEncroach && Other.IsA('Projectile'))
            {
                Projectile(Other).Explode(Other.Location, -Normal(Velocity));
                return false;
            }
        }
        // End:0x4F2
        if(!bLandingPawn)
        {
            I = 0;
            J0x464:

            // End:0x4E7 [Loop If]
            if(I < GeneratedEvents.Length)
            {
                MoverEvent = SeqEvent_Mover(GeneratedEvents[I]);
                // End:0x4D9
                if(MoverEvent != none)
                {
                    MoverEvent.NotifyEncroachingOn(Other);
                }
                I++;
                // [Loop Continue]
                goto J0x464;
            }
            return bStopOnEncroach;
        }
    }
    return false;
    //return ReturnValue;    
}

event RanInto()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private @NULL MoverEvent;

    // End:0x88
    if(bDestroyProjectilesOnEncroach && Other.IsA('Projectile'))
    {
        Projectile(Other).Explode(Other.Location, -Normal(Velocity));        
    }
    else
    {
        // End:0xC5
        if(Other.bDestroyedByInterpActor)
        {
            Other.Destroy();            
        }
        else
        {
            // End:0xD7
            if(bIsLift)
            {
                return;                
            }
            else
            {
                I = 0;
                J0xE2:

                // End:0x165 [Loop If]
                if(I < GeneratedEvents.Length)
                {
                    MoverEvent = SeqEvent_Mover(GeneratedEvents[I]);
                    // End:0x157
                    if(MoverEvent != none)
                    {
                        MoverEvent.NotifyEncroachingOn(Other);
                    }
                    I++;
                    // [Loop Continue]
                    goto J0xE2;
                }
            }
        }
    }
    //return;    
}

event Attach()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private @NULL MoverEvent;

    // End:0xA7
    if(!IsTimerActive('FinishedOpen'))
    {
        I = 0;
        J0x24:

        // End:0xA7 [Loop If]
        if(I < GeneratedEvents.Length)
        {
            MoverEvent = SeqEvent_Mover(GeneratedEvents[I]);
            // End:0x99
            if(MoverEvent != none)
            {
                MoverEvent.NotifyAttached(Other);
            }
            I++;
            // [Loop Continue]
            goto J0x24;
        }
    }
    //return;    
}

event Detach()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private @NULL MoverEvent;

    I = 0;
    J0x0B:

    // End:0x8E [Loop If]
    if(I < GeneratedEvents.Length)
    {
        MoverEvent = SeqEvent_Mover(GeneratedEvents[I]);
        // End:0x80
        if(MoverEvent != none)
        {
            MoverEvent.NotifyDetached(Other);
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function Restart()
{
    local /*0x35EA0000-0x00000000*/ private @NULL A;

    // End:0x2C
    foreach BasedActors(Class'Actor', A)
    {
        Attach(A);        
    }    
    //return;    
}

function FinishedOpen()
{
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private @NULL MoverEvent;

    I = 0;
    J0x0B:

    // End:0x85 [Loop If]
    if(I < GeneratedEvents.Length)
    {
        MoverEvent = SeqEvent_Mover(GeneratedEvents[I]);
        // End:0x77
        if(MoverEvent != none)
        {
            MoverEvent.NotifyFinishedOpen();
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated function PlayMovingSound()
{
    local /*0x35EA0000-0x00000000*/ private bool bClosing[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL SoundToPlay, AmbientToPlay;

    // End:0x36
    if(bClosing)
    {
        SoundToPlay = CloseSound;
        AmbientToPlay = OpeningAmbientSound;        
    }
    else
    {
        SoundToPlay = OpenSound;
        AmbientToPlay = ClosingAmbientSound;
    }
    // End:0x83
    if(SoundToPlay != none)
    {
        PlaySound(SoundToPlay, true);
    }
    // End:0xF8
    if(AmbientToPlay != none)
    {
        AmbientSoundComponent.Stop();
        AmbientSoundComponent.SoundCue = AmbientToPlay;
        AmbientSoundComponent.Play();
    }
    //return;    
}

simulated event InterpolationStarted()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InterpAction[8388609], GroupInst;

    ClearTimer('Restart');
    ClearTimer('FinishedOpen');
    PlayMovingSound(InterpAction.bReversePlayback);
    bShouldSaveForCheckpoint = true;
    //return;    
}

simulated event InterpolationFinished()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InterpAction[8388609], DoorNav, C, StoppedSound;

    // End:0x2E
    if(AmbientSoundComponent != none)
    {
        AmbientSoundComponent.Stop();
    }
    StoppedSound = ((InterpAction.bReversePlayback) ? ClosedSound : OpenedSound);
    // End:0x95
    if(StoppedSound != none)
    {
        PlaySound(StoppedSound, true);
    }
    DoorNav = DoorMarker(MyMarker);
    // End:0x12B
    if(InterpAction.bReversePlayback)
    {
        // End:0xFA
        if(Attached.Length > 0)
        {
            SetTimer(StayOpenTime, false, 'Restart');
        }
        // End:0x128
        if(DoorNav != none)
        {
            DoorNav.MoverClosed();
        }        
    }
    else
    {
        SetTimer(StayOpenTime, false, 'FinishedOpen');
        // End:0x170
        if(DoorNav != none)
        {
            DoorNav.MoverOpened();
        }
    }
    // End:0x1F6
    if(bMonitorMover)
    {
        // End:0x1F5
        foreach WorldInfo.AllControllers(Class'Controller', C)
        {
            // End:0x1F4
            if(C.PendingMover == self)
            {
                C.MoverFinished();
            }            
        }        
    }
    // End:0x25E
    if(InterpAction.bNoResetOnRewind && InterpAction.bRewindOnPlay)
    {
        ForceNetRelevant();
        bUpdateSimulatedPosition = true;
        bReplicateMovement = true;
    }
    //return;    
}

simulated event InterpolationChanged()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InterpAction[8388609];

    PlayMovingSound(InterpAction.bReversePlayback);
    //return;    
}

simulated event AdjustInterpMoveTrackParameters()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OldLoc[8388609], oldRot, NewLoc, NewRot;

    //return;    
}

simulated function ShutDown()
{
    super(Actor).ShutDown();
    bShouldSaveForCheckpoint = true;
    //return;    
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
    bShouldSaveForCheckpoint=true
    bDestroyProjectilesOnEncroach=true
    bContinueOnEncroachPhysicsObject=true
    bStopOnEncroach=true
    bShouldShadowParentAllAttachedActors=true
    // Reference: StaticMeshComponent'Default__InterpActor.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__InterpActor.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__InterpActor.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    Physics=EPhysics.PHYS_Interpolating
    RemoteRole=ENetRole.ROLE_None
    bNoDelete=true
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true
    bBlocksTeleport=true
    NetUpdateFrequency=1.0000000
    NetPriority=2.7000000
    CollisionComponent=StaticMeshComponent0
    SupportedEvents=/* Array type was not detected. */
}