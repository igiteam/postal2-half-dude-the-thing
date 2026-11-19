class FogVolumeConstantDensityInfo extends FogVolumeDensityInfo
    placeable
    hidecategories(AnimDependency,Navigation,Collision)
    autoexpandcategories(FogVolumeDensityInfo);

defaultproperties
{
    // Reference: FogVolumeConstantDensityComponent'Default__FogVolumeConstantDensityInfo.FogVolumeComponent0'
    begin object name=FogVolumeComponent0 class=Class'FogVolumeConstantDensityComponent'
    end object
    DensityComponent=FogVolumeComponent0
    // Reference: StaticMeshComponent'Default__FogVolumeConstantDensityInfo.AutomaticMeshComponent0'
    begin object name=AutomaticMeshComponent0
    end object
    AutomaticMeshComponent=AutomaticMeshComponent0
    Components[0]=none
    Components[1]=AutomaticMeshComponent0
    Components[2]=FogVolumeComponent0
}