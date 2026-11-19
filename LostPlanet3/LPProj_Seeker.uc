class LPProj_Seeker extends LPProj_Rocket
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TrackingMaxAccel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TrackingDelay;

simulated function PostBeginPlay()
{
    super(SPInventoryProjectile).PostBeginPlay();
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    //return;    
}

function WarnNearbyPlayers()
{
    //return;    
}

simulated function @NULL DoImpact()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, HitInfo;

    // End:0x0F
    if(bExploded)
    {
        return;
    }
    HitInfo = ComputeHitInfo(Other, OtherComp, HitLocation, HitNormal);
    // End:0xE6
    if(int(Other.Role) <= int(Role))
    {
        NotifyHit(Other);
        Other.TakeDamage(int(Damage), InstigatorController, HitLocation, vect(0.0000000, 0.0000000, 0.0000000), MyDamageType, HitInfo, self);
    }
    // End:0x1A7
    if(!Class'Engine.Weapon'.static.PassThroughDamage(Other))
    {
        // End:0x19D
        if(HitInfo.PhysMaterial != none)
        {
            SPPhysicalMaterial(HitInfo.PhysMaterial).PlayImpactEffects(self, HitInfo, HitLocation, -Vector(Rotation), MyDamageType, false, false, false);
        }
        DoExplosion();
    }
    //return;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmt[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    //return;    
}

defaultproperties
{
    TrackingMaxAccel=10000.0000000
    bStopTrackingAfterMovingPassedPos=true
    bSuppressAudio=true
    bAutoStartInFlightAudio=false
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_Seeker.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    bUsePooling=true
    bPooledInstance_UseLifetime=true
    PooledInstance_LifeTime=2.0000000
    // Reference: CylinderComponent'Default__LPProj_Seeker.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    LifeSpan=2.0000000
    CollisionComponent=CollisionCylinder
}