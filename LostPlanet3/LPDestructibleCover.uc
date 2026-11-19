class LPDestructibleCover extends SPGFDestructibleCover
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: AudioComponent'Default__LPDestructibleCover.AmbientSoundComponent0'
    begin object name=AmbientSoundComponent0
    end object
    AmbientSoundComponent=AmbientSoundComponent0
    bUseSinkDepthForGroundClamping=true
    // Reference: DynamicLightEnvironmentComponent'Default__LPDestructibleCover.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: DynamicLightEnvironmentComponent'Default__LPDestructibleCover.MyLightEnvironment2'
    begin object name=MyLightEnvironment2
    end object
    LightEnvironmentToUseForActorSpawnParams=MyLightEnvironment2
    // Reference: SPGFKynapseObstacleComponent'Default__LPDestructibleCover.DefaultSPKynapseObstacleComponent'
    begin object name=DefaultSPKynapseObstacleComponent
    end object
    SPKynapseObstacle=DefaultSPKynapseObstacleComponent
}