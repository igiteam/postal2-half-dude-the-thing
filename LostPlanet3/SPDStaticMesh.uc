class SPDStaticMesh extends SPDynamicSMActorSpawnable
    abstract
    hidecategories(AnimDependency,Navigation);

struct CheckpointRecord
{
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL MyGuid;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private bool bHidden;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL Location;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL Rotation;

    structdefaultproperties
    {
        MyGuid=(A=0,B=0,C=0,D=0)
        bHidden=false
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Rotation=(Pitch=0,Yaw=0,Roll=0)
    }
};

var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL MyGuid;

function CreateCheckpointRecord()
{
    local /*0x01C00000-0x00000000*/ private @NULL Record[25165825];

    Record.MyGuid = MyGuid;
    Record.bHidden = bHidden;
    Record.Location = Location;
    Record.Rotation = Rotation;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x01C00000-0x00000000*/ private @NULL Record[25296897];

    MyGuid = Record.MyGuid;
    SetHidden(Record.bHidden);
    SetLocation(Record.Location);
    SetRotation(Record.Rotation);
    //return;    
}

defaultproperties
{
    // Reference: StaticMeshComponent'Default__SPDStaticMesh.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__SPDStaticMesh.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__SPDStaticMesh.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    // Reference: SPActorDestructComponent'Default__SPDStaticMesh.SPActorDestructComponent0'
    begin object name=SPActorDestructComponent0 class=Class'SPActorDestructComponent'
    end object
    Components[2]=SPActorDestructComponent0
    // Reference: SPDestructibleStateComponent'Default__SPDStaticMesh.SPDestructibleStateComponent0'
    begin object name=SPDestructibleStateComponent0 class=Class'SPDestructibleStateComponent'
    end object
    Components[3]=SPDestructibleStateComponent0
    DestructComponent=SPActorDestructComponent0
    CollisionComponent=StaticMeshComponent0
}