class FracturedStaticMeshPart extends FracturedStaticMeshActor
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000000*/ private float DestroyPartRadiusFactor;
var(*) /*0x35EA0000-0x00000000*/ private @NULL BaseFracturedMeshActor[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasBeenRecycled;
var(*) /*0x35EA0000-0x00000000*/ private bool bChangeRBChannelWhenAsleep;
var(*) /*0x35EA0000-0x00000000*/ private bool bCompositeThatExplodesOnImpact;
var(*) /*0x35EA0000-0x00000000*/ private float LastSpawnTime;
var(*) /*0x35EA0000-0x00000000*/ private int PartPoolIndex;
var(*) /*0x35EA0000-0x00000000*/ private float FracPartGravScale;
var(*) /*0x35EA0000-0x00000000*/ private byte AsleepRBChannel;
var(*) /*0x35EA0000-0x00000000*/ private @NULL OldVelocity;
var(*) /*0x35EA0000-0x00000000*/ private float CurrentVibrationLevel;
var(*) /*0x35EA0000-0x00000000*/ private float LastImpactSoundTime;

// Export UFracturedStaticMeshPart::execInitialize(FFrame&, void* const)
native simulated function Initialize();

// Export UFracturedStaticMeshPart::execRecyclePart(FFrame&, void* const)
native simulated function RecyclePart()
{
    local /*0x35EA0000-0x00000000*/ private bool bAddToFreePool[8388609];


}

event PostSpawnPart()
{
    //return;    
}

simulated event TakeDamage()
{
    local /*0x35EA0000-0x00000000*/ private int Damage[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    super.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    FracturedStaticMeshComponent.AddImpulse(Normal(Momentum) * DamageType.default.KDamageImpulse, HitLocation);
    //return;    
}

simulated function TryToCleanUp()
{
    // End:0x7C
    if((BaseFracturedMeshActor == none) || (WorldInfo.TimeSeconds - BaseFracturedMeshActor.SkinnedComponent.LastRenderTime) > 1.0000000)
    {
        RecyclePart(true);        
    }
    else
    {
        SetTimer(2.0000000, false, 'TryToCleanUp');
    }
    //return;    
}

simulated event FellOutOfWorld()
{
    local /*0x35EA0000-0x00000000*/ private class dmgType[8388609];

    RecyclePart(true);
    //return;    
}

simulated event Explode()
{
    // End:0x24
    if(!bHasBeenRecycled)
    {
        super.Explode();
        RecyclePart(true);
    }
    //return;    
}

// Export UFracturedStaticMeshPart::execBreakOffPartsInRadius(FFrame&, void* const)
native simulated function BreakOffPartsInRadius()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Origin[8388609];
    local /*0x35EA0000-0x00000000*/ private float Radius[8388609], RBStrength;
    local /*0x35EA0000-0x00000000*/ private bool bWantPhysChunksAndParticles[8388609];


}

defaultproperties
{
    DestroyPartRadiusFactor=10.0000000
    FracPartGravScale=2.0000000
    AsleepRBChannel=ERBCollisionChannel.RBCC_GameplayPhysics
    // Reference: FracturedStaticMeshComponent'Default__FracturedStaticMeshPart.FracturedStaticMeshComponent0'
    begin object name=FracturedStaticMeshComponent0
    end object
    FracturedStaticMeshComponent=FracturedStaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__FracturedStaticMeshPart.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    SkinnedComponent=none
    Components[0]=FracturedStaticMeshComponent0
    Physics=EPhysics.PHYS_RigidBody
    TickGroup=ETickingGroup.TG_PostAsyncWork
    bNoDelete=false
    bWorldGeometry=false
    bNetInitialRotation=true
    bMovable=true
    bBlockActors=false
    bNoEncroachCheck=true
    bPathColliding=false
    LifeSpan=15.0000000
    CollisionComponent=FracturedStaticMeshComponent0
}