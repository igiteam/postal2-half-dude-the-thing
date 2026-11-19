class FogVolumeLinearHalfspaceDensityInfo extends FogVolumeDensityInfo
    placeable
    hidecategories(AnimDependency,Navigation,Collision)
    autoexpandcategories(FogVolumeDensityInfo);

defaultproperties
{
    // Reference: FogVolumeLinearHalfspaceDensityComponent'Default__FogVolumeLinearHalfspaceDensityInfo.FogVolumeComponent0'
    begin object name=FogVolumeComponent0 class=Class'FogVolumeLinearHalfspaceDensityComponent'
    end object
    DensityComponent=FogVolumeComponent0
    // Reference: StaticMeshComponent'Default__FogVolumeLinearHalfspaceDensityInfo.AutomaticMeshComponent0'
    begin object name=AutomaticMeshComponent0
    end object
    AutomaticMeshComponent=AutomaticMeshComponent0
    Components[0]=none
    Components[1]=AutomaticMeshComponent0
    Components[2]=FogVolumeComponent0
}