class DynamicBlockingVolume extends BlockingVolume
    placeable
    hidecategories(AnimDependency,Navigation,Object,Display);

struct CheckpointRecord
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Location;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Rotation;
    var(*) /*0x35EA0000-0x00000000*/ private bool bCollideActors;
    var(*) /*0x35EA0000-0x00000000*/ private bool bBlockActors;
    var(*) /*0x35EA0000-0x00000000*/ private bool bNeedsReplication;
    var(*) /*0x35EA0000-0x00000000*/ private bool bBlockZeroExtent;
    var(*) /*0x35EA0000-0x00000000*/ private bool bBlockNonZeroExtent;
    var(*) /*0x35EA0000-0x00000000*/ private bool bComponentCollideActors;
    var(*) /*0x35EA0000-0x00000000*/ private bool bComponentBlockActors;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string BasePathName;

    structdefaultproperties
    {
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Rotation=(Pitch=0,Yaw=0,Roll=0)
        bCollideActors=false
        bBlockActors=false
        bNeedsReplication=false
        bBlockZeroExtent=false
        bBlockNonZeroExtent=false
        bComponentCollideActors=false
        bComponentBlockActors=false
        BasePathName=""
    }
};

var(*) /*0x1E9E0000-0x00000000*/ private bool bEnabled[65537];

simulated event PostBeginPlay()
{
    super(Volume).PostBeginPlay();
    SetCollision(bEnabled, bBlockActors);
    //return;    
}

function CreateCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Record[25165825];

    Record.Location = Location;
    Record.Rotation = Rotation;
    Record.bCollideActors = bCollideActors;
    Record.bBlockActors = bBlockActors;
    Record.bNeedsReplication = int(RemoteRole) != int(ROLE_None);
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Record[25296897];

    // End:0x54
    if(!bHardAttach)
    {
        SetLocation(Record.Location);
        SetRotation(Record.Rotation);
    }
    CollisionComponent.SetActorCollision(true, true);
    CollisionComponent.SetTraceBlocking(false, true);
    CollisionComponent.SetBlockRigidBody(Record.bCollideActors);
    SetCollision(Record.bCollideActors, Record.bBlockActors);
    // End:0x13B
    if(Record.bNeedsReplication)
    {
        ForceNetRelevant();
    }
    //return;    
}

defaultproperties
{
    bEnabled=true
    BrushColor=(R=255,G=255,B=100,A=255)
    // Reference: BrushComponent'Default__DynamicBlockingVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    Physics=EPhysics.PHYS_Interpolating
    bStatic=false
    bWorldGeometry=false
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true
    bMovable=true
    CollisionComponent=BrushComponent0
}