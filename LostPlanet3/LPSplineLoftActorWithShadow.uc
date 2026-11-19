class LPSplineLoftActorWithShadow extends LPSplineLoftActorSpawnable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: DynamicLightEnvironmentComponent'Default__LPSplineLoftActorWithShadow.MeshLightEnvironmentA'
    begin object name=MeshLightEnvironmentA class=Class'Engine.DynamicLightEnvironmentComponent'
    end object
    MeshLightEnvironment=MeshLightEnvironmentA
    Components[0]=none
    Components[1]=MeshLightEnvironmentA
}