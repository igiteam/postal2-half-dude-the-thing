class SPBaseActorDestructComponent extends ActorComponent
    abstract
    hidecategories(Object);

struct native SPSpawnedStaticMeshInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL StaticMesh;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL DrawScale;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL PositionOffset;

    structdefaultproperties
    {
        StaticMesh=none
        DrawScale=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        PositionOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

// Export USPBaseActorDestructComponent::execGetProperties(FFrame&, void* const)
native simulated function GetProperties()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPBaseActorDestructComponent::execSetProperties(FFrame&, void* const)
native simulated function SetProperties()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewProperties[8388609];


}

simulated function ClientCauseDestruction()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];

    //return;    
}

function NotifyLanded()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitNormal[25296897], FloorActor;

    //return;    
}

function NotifyDamage()
{
    local /*0x35EA0000-0x00000000*/ private float Damage[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    //return;    
}
