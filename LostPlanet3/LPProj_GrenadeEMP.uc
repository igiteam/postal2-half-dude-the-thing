class LPProj_GrenadeEMP extends LPProj_Grenade
    config(AI)
    hidecategories(AnimDependency,Navigation);

simulated function @NULL DoImpact()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x1A
    if(CylinderComponent(OtherComp) != none)
    {
        return;
    }
    // End:0x3F
    if(!bExploded)
    {
        bExploded = true;
        DoExplosion();
    }
    //return;    
}

simulated function GetVisibleLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return GetSkeletalMesh().GetBoneLocation('JO_positionTracker');
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_GrenadeEMP.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    // Reference: CylinderComponent'Default__LPProj_GrenadeEMP.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    bBounce=false
    CollisionComponent=CollisionCylinder
}