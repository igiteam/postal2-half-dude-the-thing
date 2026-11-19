class LPProj_BolSepiaLob extends LPProj_AkridBase
    hidecategories(AnimDependency,Navigation);

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super.InitTuneData(TuneData);
    //return;    
}

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
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_BolSepiaLob.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    CustomGravityScale=2.0000000
    // Reference: CylinderComponent'Default__LPProj_BolSepiaLob.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    CollisionComponent=CollisionCylinder
}