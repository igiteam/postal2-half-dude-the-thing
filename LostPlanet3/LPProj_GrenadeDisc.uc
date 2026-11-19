class LPProj_GrenadeDisc extends LPProj_Grenade
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL DiscParticles[524289];

// Export ULPProj_GrenadeDisc::execSpawnTrail(FFrame&, void* const)
protected native simulated function SpawnTrail();

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x43
    if(DiscParticles != none)
    {
        SpawnParticles();
        Mesh.SetHidden(true);
    }
    //return;    
}

simulated event @NULL SpawnParticles()
{
    local /*0x97E50000-0x00000400*/ private @NULL CustomParticleComp;

    // End:0xB4
    if((!bIsSimulating && DiscParticles != none) && int(WorldInfo.NetMode) != int(NM_DedicatedServer))
    {
        CustomParticleComp = new (self) DiscParticles.Class (DiscParticles);
        AttachComponent(CustomParticleComp);
        CustomParticleComp.SetActive(true);
    }
    //return;    
}

simulated function GetVisibleLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return GetSkeletalMesh().GetBoneLocation('JO_positionTracker');
    //return ReturnValue;    
}

simulated function @NULL DoImpact()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x25
    if(!bExploded)
    {
        bExploded = true;
        DoExplosion();
    }
    //return;    
}

defaultproperties
{
    bWantsMeshUsingPhysX=false
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_GrenadeDisc.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    // Reference: CylinderComponent'Default__LPProj_GrenadeDisc.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    bBounce=false
    CollisionComponent=CollisionCylinder
}