class LPProj_BounceShot extends LPProj_Grenade
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BounceDamageMultiplier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PerBounceDamageMultiplier;

simulated function PostBeginPlay()
{
    super(SPInventoryProjectile).PostBeginPlay();
    //return;    
}

simulated function @NULL HitWall()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], Wall, WallComp;

    super.HitWall(HitNormal, Wall, WallComp);
    //return;    
}

simulated event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    super(SPInventoryProjectile).Touch(Other, OtherComp, HitLocation, HitNormal);
    //return;    
}

simulated event ShouldBounce()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super.ShouldBounce(Other, HitNormal) && (Other.bWorldGeometry || Other.bStatic) || LPTotemDeployableShieldEmitter(Other) != none;
    //return ReturnValue;    
}

simulated function @NULL Bounce()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, HitInfo;

    super.Bounce(Other, OtherComp, HitLocation, HitNormal, HitInfo);
    //return;    
}

simulated function StopBounce()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609];

    KillPooledProjectile();
    //return;    
}

simulated function @NULL DoImpact()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, HitInfo;

    local /*0x97E50000-0x00000000*/ private float ScaledDamage;

    HitInfo = ComputeHitInfo(Other, OtherComp, HitLocation, HitNormal);
    // End:0x12C
    if(int(Other.Role) <= int(Role))
    {
        ScaledDamage = Damage;
        // End:0xBD
        if(bHasBounced)
        {
            ScaledDamage *= BounceDamageMultiplier;
            ScaledDamage *= (PerBounceDamageMultiplier ** float(BounceCount));
        }
        NotifyHit(Other);
        Other.TakeDamage(int(ScaledDamage), InstigatorController, HitLocation, vect(0.0000000, 0.0000000, 0.0000000), MyDamageType, HitInfo, self);
    }
    // End:0x1ED
    if(!Class'Engine.Weapon'.static.PassThroughDamage(Other))
    {
        // End:0x1E3
        if(HitInfo.PhysMaterial != none)
        {
            SPPhysicalMaterial(HitInfo.PhysMaterial).PlayImpactEffects(self, HitInfo, HitLocation, -Vector(Rotation), MyDamageType, false, false, false);
        }
        KillPooledProjectile();
    }
    //return;    
}

simulated function DoExplosion()
{
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
    bIsGrenade=false
    bPlayImpactFXOnLastImpact=true
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_BounceShot.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    MaxBounceCount=2
    bUsePooling=true
    bPooledInstance_UseLifetime=true
    MaxActivePooledProjectiles=100
    PooledInstance_LifeTime=0.5000000
    // Reference: CylinderComponent'Default__LPProj_BounceShot.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    bUpdateSimulatedPosition=true
    LifeSpan=0.5000000
    CollisionComponent=CollisionCylinder
}