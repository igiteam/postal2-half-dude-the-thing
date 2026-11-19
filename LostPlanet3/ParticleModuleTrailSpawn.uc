class ParticleModuleTrailSpawn extends ParticleModuleTrailBase
    editinlinenew
    hidecategories(Object,Object,Object);

enum ETrail2SpawnMethod
{
    PET2SM_Emitter,                 // 0
    PET2SM_Velocity,                // 1
    PET2SM_Distance,                // 2
    PET2SM_MAX                      // 3
};

var(*) /*0x48AF0000-0x00000600*/ private export @NULL SpawnDistanceMap[589825];
var(*) /*0x48AF0000-0x00000000*/ private float MinSpawnVelocity[65537];

defaultproperties
{
    // Reference: DistributionFloatParticleParameter'Default__ParticleModuleTrailSpawn.DistributionSpawnDistanceMap'
    begin object name=DistributionSpawnDistanceMap class=Class'DistributionFloatParticleParameter'
    end object
    SpawnDistanceMap=DistributionSpawnDistanceMap
}