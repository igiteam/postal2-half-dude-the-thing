class SplineLoftActorMovable extends SplineLoftActor
    placeable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: DynamicLightEnvironmentComponent'Default__SplineLoftActorMovable.MyMeshLightEnvironment'
    begin object name=MyMeshLightEnvironment class=Class'DynamicLightEnvironmentComponent'
    end object
    MeshLightEnvironment=MyMeshLightEnvironment
    Components[0]=none
    Components[1]=MyMeshLightEnvironment
    Physics=EPhysics.PHYS_Interpolating
    bStatic=false
    bNoDelete=true
    bMovable=true
}