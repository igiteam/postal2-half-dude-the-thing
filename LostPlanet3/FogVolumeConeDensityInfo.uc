class FogVolumeConeDensityInfo extends FogVolumeDensityInfo
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation,Collision)
    autoexpandcategories(FogVolumeDensityInfo);

defaultproperties
{
    // Reference: FogVolumeConeDensityComponent'Default__FogVolumeConeDensityInfo.FogVolumeComponent0'
    begin object name=FogVolumeComponent0 class=Class'FogVolumeConeDensityComponent'
    end object
    DensityComponent=FogVolumeComponent0
    // Reference: StaticMeshComponent'Default__FogVolumeConeDensityInfo.AutomaticMeshComponent0'
    begin object name=AutomaticMeshComponent0
    end object
    AutomaticMeshComponent=AutomaticMeshComponent0
    Components[0]=none
    Components[1]=AutomaticMeshComponent0
    Components[2]=none
    Components[3]=FogVolumeComponent0
}