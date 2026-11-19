class LPProj_CannonShell extends LPProj_Rocket
    config(AI)
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_CannonShell.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    GravityZ=-500.0000000
    // Reference: CylinderComponent'Default__LPProj_CannonShell.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    CollisionComponent=CollisionCylinder
}