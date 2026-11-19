class FogVolumeSphericalDensityInfo extends FogVolumeDensityInfo
    placeable
    hidecategories(AnimDependency,Navigation,Collision)
    autoexpandcategories(FogVolumeDensityInfo);

defaultproperties
{
    // Reference: FogVolumeSphericalDensityComponent'Default__FogVolumeSphericalDensityInfo.FogVolumeComponent0'
    begin object name=FogVolumeComponent0 class=Class'FogVolumeSphericalDensityComponent'
    end object
    DensityComponent=FogVolumeComponent0
    // Reference: StaticMeshComponent'Default__FogVolumeSphericalDensityInfo.AutomaticMeshComponent0'
    begin object name=AutomaticMeshComponent0
    end object
    AutomaticMeshComponent=AutomaticMeshComponent0
    Components[0]=none
    Components[1]=AutomaticMeshComponent0
    Components[2]=none
    Components[3]=FogVolumeComponent0
}