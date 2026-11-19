class FractureManager extends Actor
    notplaceable
    hidecategories(AnimDependency,Navigation);

const FSM_DEFAULTRECYCLETIME = 0.2;

var(*) /*0x35EA0000-0x00000000*/ private int FSMPartPoolSize;
var(*) /*0x24830000-0x00000000*/ private bool bEnableAntiVibration[65537];
var(*) /*0x24830000-0x00000000*/ private bool bEnableSpawnChunkEffectForRadialDamage[65537];
var(*) /*0x24830000-0x00000000*/ private float DestroyVibrationLevel[65537];
var(*) /*0x24830000-0x00000000*/ private float DestroyMinAngVel[65537];
var(*) /*0x24830000-0x00000000*/ private float ExplosionVelScale[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PartPool;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FreeParts;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ActorsWithDeferredPartsToSpawn[536870913];
var(*) /*0x35EA0000-0x00000000*/ private name FracturedClassName;

simulated event @NULL SpawnChunkDestroyEffect()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Effect[8388609], ChunkBox, ChunkDir;
    local /*0x35EA0000-0x00000000*/ private float Scale[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ChunkMiddle, EffectComp;

    ChunkMiddle = 0.5000000 * (ChunkBox.Min + ChunkBox.Max);
    EffectComp = WorldInfo.MyEmitterPool.SpawnEmitter(Effect, ChunkMiddle, Rotator(ChunkDir));
    EffectComp.SetScale(Scale);
    //return;    
}

// Export UFractureManager::execGetNumFSMPartsScale(FFrame&, void* const)
native function GetNumFSMPartsScale()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UFractureManager::execGetFSMDirectSpawnChanceScale(FFrame&, void* const)
native function GetFSMDirectSpawnChanceScale()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UFractureManager::execGetFSMRadialSpawnChanceScale(FFrame&, void* const)
native function GetFSMRadialSpawnChanceScale()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UFractureManager::execGetFSMFractureCullDistanceScale(FFrame&, void* const)
native function GetFSMFractureCullDistanceScale()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

simulated event PreBeginPlay()
{
    super.PreBeginPlay();
    CreateFSMParts();
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    CleanUpFSMParts();
    //return;    
}

final simulated function CleanUpFSMParts()
{
    local /*0x35EA0000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x68 [Loop If]
    if(Idx < PartPool.Length)
    {
        PartPool[Idx].Destroy();
        PartPool[Idx] = none;
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

// Export UFractureManager::execCreateFSMParts(FFrame&, void* const)
native function CreateFSMParts();

// Export UFractureManager::execResetPoolVisibility(FFrame&, void* const)
native simulated function ResetPoolVisibility();

// Export UFractureManager::execGetFSMPart(FFrame&, void* const)
native function GetFSMPart()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Parent[8388609], SpawnLocation, SpawnRotation, ReturnValue;


}

simulated event SpawnPartActor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Parent[8388609], SpawnLocation, SpawnRotation, ReturnValue, NewPart;

    NewPart = GetFSMPart(Parent, SpawnLocation, SpawnRotation);
    // End:0x156
    if(NewPart != none)
    {
        // End:0x12E
        if((Parent.KynapseObstacleComponent == none) || !Parent.KynapseObstacleComponent.bAttached)
        {
            // End:0x12E
            if((NewPart.KynapseObstacleComponent != none) && NewPart.KynapseObstacleComponent.bAttached)
            {
                NewPart.KynapseObstacleComponent.DetachFromAny();
            }
        }
        NewPart.SetTimer(10.0000000, false, 'TryToCleanUp');
    }
    return NewPart;
    //return ReturnValue;    
}

simulated event ReturnPartActor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Part[8388609];

    FreeParts.AddItem(Part.PartPoolIndex);    
    //return;    
}

simulated function Tick()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private int CurActorIndex;

    // End:0x8D
    if(ActorsWithDeferredPartsToSpawn.Length > 0)
    {
        CurActorIndex = 0;
        J0x1B:

        // End:0x8D [Loop If]
        if(CurActorIndex < ActorsWithDeferredPartsToSpawn.Length)
        {
            // End:0x7F
            if(ActorsWithDeferredPartsToSpawn[CurActorIndex].SpawnDeferredParts())
            {
                ActorsWithDeferredPartsToSpawn.Remove(CurActorIndex, 1);                
                --CurActorIndex;
            }
            ++CurActorIndex;
            // [Loop Continue]
            goto J0x1B;
        }
    }
    //return;    
}

defaultproperties
{
    FSMPartPoolSize=50
    DestroyVibrationLevel=3.0000000
    DestroyMinAngVel=2.5000000
    ExplosionVelScale=1.0000000
    FracturedClassName="Engine.FracturedStaticMeshPart"
}