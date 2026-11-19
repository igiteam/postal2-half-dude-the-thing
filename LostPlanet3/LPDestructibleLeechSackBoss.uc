class LPDestructibleLeechSackBoss extends SPGFDestructibleObject
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: AudioComponent'Default__LPDestructibleLeechSackBoss.AmbientSoundComponent0'
    begin object name=AmbientSoundComponent0
    end object
    AmbientSoundComponent=AmbientSoundComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPDestructibleLeechSackBoss.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: DynamicLightEnvironmentComponent'Default__LPDestructibleLeechSackBoss.MyLightEnvironment2'
    begin object name=MyLightEnvironment2
    end object
    LightEnvironmentToUseForActorSpawnParams=MyLightEnvironment2
    // Reference: SPGFKynapseObstacleComponent'Default__LPDestructibleLeechSackBoss.DefaultSPKynapseObstacleComponent'
    begin object name=DefaultSPKynapseObstacleComponent
    end object
    SPKynapseObstacle=DefaultSPKynapseObstacleComponent
}