class LPFracturedSMActorMovable extends SPFracturedSMActorMovable
    hidecategories(AnimDependency,Navigation);

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    //return;    
}

defaultproperties
{
    DamageTypePlayerMeleeClass=Class'LPDamageTypePlayerMelee'
    // Reference: FracturedStaticMeshComponent'Default__LPFracturedSMActorMovable.FracturedStaticMeshComponent0'
    begin object name=FracturedStaticMeshComponent0
    end object
    FracturedStaticMeshComponent=FracturedStaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__LPFracturedSMActorMovable.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: SPFracturedSkinnedMeshComponent'Default__LPFracturedSMActorMovable.SPFracturedSkinnedComponent0'
    begin object name=SPFracturedSkinnedComponent0
    end object
    SkinnedComponent=SPFracturedSkinnedComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPFracturedSMActorMovable.LightEnvironment0'
    begin object name=LightEnvironment0
    end object
    Components[0]=LightEnvironment0
    Components[1]=FracturedStaticMeshComponent0
    Components[2]=SPFracturedSkinnedComponent0
    CollisionComponent=FracturedStaticMeshComponent0
}