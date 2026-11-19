class SkyLightToggleable extends SkyLight
    placeable
    hidecategories(AnimDependency,Navigation)
    classgroup(Lights,SkyLights);

defaultproperties
{
    // Reference: SkyLightComponent'Default__SkyLightToggleable.SkyLightComponent0'
    begin object name=SkyLightComponent0
    end object
    LightComponent=SkyLightComponent0
    Components[0]=none
    Components[1]=SkyLightComponent0
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bStatic=false
    bHardAttach=true
}