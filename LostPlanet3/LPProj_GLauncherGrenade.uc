class LPProj_GLauncherGrenade extends LPProj_Grenade
    config(AI)
    hidecategories(AnimDependency,Navigation);

simulated function GetVisibleLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return GetSkeletalMesh().GetBoneLocation('JO_positionTracker');
    //return ReturnValue;    
}

defaultproperties
{
    bAllowExplodeOnBeingRunOver=true
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_GLauncherGrenade.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    // Reference: CylinderComponent'Default__LPProj_GLauncherGrenade.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    CollisionComponent=CollisionCylinder
}