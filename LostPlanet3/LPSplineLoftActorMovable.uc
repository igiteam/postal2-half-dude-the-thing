class LPSplineLoftActorMovable extends SPSplineLoftActorMovable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: DynamicLightEnvironmentComponent'Default__LPSplineLoftActorMovable.MyMeshLightEnvironment'
    begin object name=MyMeshLightEnvironment
    end object
    MeshLightEnvironment=MyMeshLightEnvironment
    Components[0]=none
    Components[1]=MyMeshLightEnvironment
}