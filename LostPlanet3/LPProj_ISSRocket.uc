class LPProj_ISSRocket extends LPProj_Rocket
    config(AI)
    hidecategories(AnimDependency,Navigation);

simulated event @NULL ShouldIgnoreCollision()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(LPProj_ISSRocket(Other) != none)
    {
        return true;
    }
    return super(LPProj_Grenade).ShouldIgnoreCollision(Other, OtherComp, HitLocation, HitNormal);
    //return ReturnValue;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    //return;    
}

function DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];

    //return;    
}

defaultproperties
{
    bIgnoreInstigatorCollision=true
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_ISSRocket.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    // Reference: CylinderComponent'Default__LPProj_ISSRocket.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    CollisionComponent=CollisionCylinder
}