class Projectile extends Actor
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x3EB60000-0x00000000*/ private float Speed[65537];
var(*) /*0x3EB60000-0x00000000*/ private float MaxSpeed[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bSwitchToZeroCollision;
var(*) /*0x35EA0000-0x00000000*/ private bool bBlockedByInstigator;
var(*) /*0x35EA0000-0x00000000*/ private bool bBegunPlay;
var(*) /*0x35EA0000-0x00000000*/ private bool bRotationFollowsVelocity;
var(*) /*0x35EA0000-0x00000000*/ private bool bIgnoreFoliageTouch;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ZeroCollider;
var(*) /*0x35EA0000-0x00000400*/ private export @NULL ZeroColliderComponent[524289];
var(*) /*0x3EB60000-0x00000000*/ private float Damage[65537];
var(*) /*0x3EB60000-0x00000000*/ private float DamageRadius[65537];
var(*) /*0x3EB60000-0x00000000*/ private float MomentumTransfer[65537];
var(*) /*0x35EA0000-0x00000000*/ private class MyDamageType;
var(*) /*0x3EB60000-0x00000000*/ private @NULL SpawnSound[65537];
var(*) /*0x3EB60000-0x00000000*/ private @NULL ImpactSound[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL InstigatorController;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ImpactedActor;
var(*) /*0x35EA0000-0x00000000*/ private float NetCullDistanceSquared;
var(*) /*0x35EA0000-0x00000400*/ private export @NULL CylinderComponent[524289];

event EncroachingOn()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(Brush(Other) != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

event PreBeginPlay()
{
    // End:0x37
    if(Instigator != none)
    {
        InstigatorController = Instigator.Controller;
    }
    super.PreBeginPlay();
    // End:0x10C
    if(((!bDeleteMe && InstigatorController != none) && InstigatorController.ShotTarget != none) && InstigatorController.ShotTarget.Controller != none)
    {
        InstigatorController.ShotTarget.Controller.ReceiveProjectileWarning(self);
    }
    //return;    
}

simulated event PostBeginPlay()
{
    bBegunPlay = true;
    //return;    
}

// Export UProjectile::execInit(FFrame&, void* const)
native function Init()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Direction[8388609];


}

// Export UProjectile::execGetTeamNum(FFrame&, void* const)
native simulated function GetTeamNum()
{
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];


}

simulated function CanSplash()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return bBegunPlay;
    //return ReturnValue;    
}

function Reset()
{
    Destroy();
    //return;    
}

simulated function ProjectileHurtRadius()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HurtOrigin[8388609], HitNormal;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL AltOrigin, TraceHitLocation, TraceHitNormal, TraceHitActor;

    // End:0x0F
    if(bHurtEntry)
    {
        return false;
    }
    AltOrigin = HurtOrigin;
    // End:0x14F
    if((ImpactedActor != none) && ImpactedActor.bWorldGeometry)
    {
        AltOrigin = HurtOrigin + ((2.0000000 * Class'Pawn'.default.MaxStepHeight) * HitNormal);
        TraceHitActor = Trace(TraceHitLocation, TraceHitNormal, AltOrigin, HurtOrigin, false,,, 1);
        // End:0x11F
        if(TraceHitActor == none)
        {
            AltOrigin = HurtOrigin + (Class'Pawn'.default.MaxStepHeight * HitNormal);            
        }
        else
        {
            AltOrigin = HurtOrigin + (0.5000000 * (TraceHitLocation - HurtOrigin));
        }
    }
    return HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, AltOrigin);
    //return ReturnValue;    
}

simulated function HurtRadius()
{
    local /*0x35EA0000-0x00000000*/ private float DamageAmount[8388609], InDamageRadius;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private float Momentum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HurtOrigin[8388609], IgnoredActor, InstigatedByController;
    local /*0x35EA0000-0x00000000*/ private bool bDoFullDamage[9437185], ReturnValue, bCausedDamage, bResult;

    ((Instigator != none) ? Instigator.Controller : none);    
    // End:0x45
    if(bHurtEntry)
    {
        return false;
    }
    bCausedDamage = false;
    // End:0x73
    if(InstigatedByController == none)
    {
        InstigatedByController = InstigatorController;
    }
    // End:0x115
    if((ImpactedActor != none) && ImpactedActor != self)
    {
        ImpactedActor.TakeRadiusDamage(InstigatedByController, DamageAmount, InDamageRadius, DamageType, Momentum, HurtOrigin, true, self);
        bCausedDamage = ImpactedActor.bProjTarget;
    }
    bResult = super.HurtRadius(DamageAmount, InDamageRadius, DamageType, Momentum, HurtOrigin, ImpactedActor, InstigatedByController, bDoFullDamage);
    return bResult || bCausedDamage;
    //return ReturnValue;    
}

singular simulated event @NULL Touch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x35
    if((Other == none) || Other.bDeleteMe)
    {
        return;
    }
    // End:0x5E
    if(bIgnoreFoliageTouch && InteractiveFoliageActor(Other) != none)
    {
        return;
    }
    // End:0x111
    if((Other.StopsProjectile(self) && (int(Role) == int(ROLE_Authority)) || bBegunPlay) && bBlockedByInstigator || Other != Instigator)
    {
        ImpactedActor = Other;
        ProcessTouch(Other, HitLocation, HitNormal);
        ImpactedActor = none;
    }
    //return;    
}

simulated function ProcessTouch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], HitLocation, HitNormal;

    // End:0xC9
    if(Other != Instigator)
    {
        // End:0xAD
        if(!Other.bStatic && DamageRadius == 0.0000000)
        {
            Other.TakeDamage(int(Damage), InstigatorController, Location, MomentumTransfer * Normal(Velocity), MyDamageType,, self);
        }
        Explode(HitLocation, HitNormal);
    }
    //return;    
}

singular simulated event @NULL HitWall()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitNormal[8388609], Wall, WallComp, NewKActor, HitStaticMesh;

    super.HitWall(HitNormal, Wall, WallComp);
    // End:0xEA
    if(Wall.bWorldGeometry)
    {
        HitStaticMesh = StaticMeshComponent(WallComp);
        // End:0xEA
        if((HitStaticMesh != none) && HitStaticMesh.CanBecomeDynamic())
        {
            NewKActor = Class'KActorFromStatic'.static.MakeDynamic(HitStaticMesh);
            // End:0xEA
            if(NewKActor != none)
            {
                Wall = NewKActor;
            }
        }
    }
    ImpactedActor = Wall;
    // End:0x191
    if(!Wall.bStatic && DamageRadius == float(0))
    {
        Wall.TakeDamage(int(Damage), InstigatorController, Location, MomentumTransfer * Normal(Velocity), MyDamageType,, self);
    }
    Explode(Location, HitNormal);
    ImpactedActor = none;
    //return;    
}

simulated event EncroachedBy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    HitWall(Normal(Location - Other.Location), Other, none);
    //return;    
}

simulated function Explode()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitLocation[8388609], HitNormal;

    // End:0x5D
    if((Damage > float(0)) && DamageRadius > float(0))
    {
        // End:0x41
        if(int(Role) == int(ROLE_Authority))
        {
            MakeNoise(1.0000000);
        }
        ProjectileHurtRadius(HitLocation, HitNormal);
    }
    Destroy();
    //return;    
}

final simulated function RandSpin()
{
    local /*0x35EA0000-0x00000000*/ private float spinRate[8388609];

    RotationRate.Yaw = int(((spinRate * float(2)) * FRand()) - spinRate);
    RotationRate.Pitch = int(((spinRate * float(2)) * FRand()) - spinRate);
    RotationRate.Roll = int(((spinRate * float(2)) * FRand()) - spinRate);
    //return;    
}

function IsStationary()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated event FellOutOfWorld()
{
    local /*0x35EA0000-0x00000000*/ private class dmgType[8388609];

    Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
    //return;    
}

simulated function GetTimeToLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TargetLoc[8388609];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return VSize(TargetLoc - Location) / Speed;
    //return ReturnValue;    
}

static simulated function StaticGetTimeToLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TargetLoc[8388609], StartLoc, RequestedBy;
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return VSize(TargetLoc - StartLoc) / default.Speed;
    //return ReturnValue;    
}

static simulated function GetRange()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x1C
    if(default.LifeSpan == 0.0000000)
    {
        return 15000.0000000;        
    }
    else
    {
        return default.MaxSpeed * default.LifeSpan;
    }
    //return ReturnValue;    
}

simulated function ApplyFluidSurfaceImpact()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Fluid[8388609], HitLocation;

    super.ApplyFluidSurfaceImpact(Fluid, HitLocation);
    // End:0x119
    if(CanSplash())
    {
        // End:0x119
        if((((int(WorldInfo.NetMode) != int(NM_DedicatedServer)) && Instigator != none) && Instigator.IsPlayerPawn()) && Instigator.IsLocallyControlled())
        {
            WorldInfo.MyEmitterPool.SpawnEmitter(Fluid.ProjectileEntryEffect, HitLocation, Rotator(vect(0.0000000, 0.0000000, 1.0000000)), self);
        }
    }
    //return;    
}

defaultproperties
{
    Speed=2000.0000000
    MaxSpeed=2000.0000000
    bBlockedByInstigator=true
    DamageRadius=220.0000000
    MyDamageType=Class'DamageType'
    NetCullDistanceSquared=400000000.0000000
    // Reference: CylinderComponent'Default__Projectile.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'CylinderComponent'
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Physics=EPhysics.PHYS_Projectile
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bNetTemporary=true
    bReplicateInstigator=true
    bGameRelevant=true
    bCanBeDamaged=true
    bCollideActors=true
    bCollideWorld=true
    NetPriority=2.5000000
    LifeSpan=14.0000000
    CollisionComponent=CollisionCylinder
}