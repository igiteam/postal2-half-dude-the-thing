class LPProj_GLauncherBiotox extends LPProj_GLauncherGrenade
    config(AI)
    hidecategories(AnimDependency,Navigation);

simulated function DoExplosion()
{
    // End:0x4C
    if(int(Role) == int(ROLE_Authority))
    {
        Spawn(LPTuneDataBiotoxGrenade(TuneDataGrenade).CloudObjectClass, self);
    }
    super(LPProj_Grenade).DoExplosion();
    //return;    
}

defaultproperties
{
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_GLauncherBiotox.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    // Reference: CylinderComponent'Default__LPProj_GLauncherBiotox.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    CollisionComponent=CollisionCylinder
}