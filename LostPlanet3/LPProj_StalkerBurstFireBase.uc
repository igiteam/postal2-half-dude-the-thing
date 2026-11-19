class LPProj_StalkerBurstFireBase extends LPProj_AkridBase
    hidecategories(AnimDependency,Navigation);

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    //return;    
}

defaultproperties
{
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_StalkerBurstFireBase.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    // Reference: CylinderComponent'Default__LPProj_StalkerBurstFireBase.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    CollisionComponent=CollisionCylinder
}