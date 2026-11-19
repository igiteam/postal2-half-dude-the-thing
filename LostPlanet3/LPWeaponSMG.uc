class LPWeaponSMG extends LPWeapon
    abstract
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentSeekTarget;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SeekerMaxAccel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SeekerSeekDelay;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SeekerLifetime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SeekRadius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SeekRequiredDot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SeekTargetFoundTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SeekTargetFindInterval;

reliable server function ServerProjectileFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL SpawnLoc[8388609], AimDir, SpawnedProjectile;
    local /*0x97E50000-0x00000000*/ private class ProjectileClass;

    ProjectileClass = class<LPProj_Seeker>(GetProjectileClass());
    // End:0x124
    if(ProjectileClass != none)
    {
        AimDir *= 0.0100000;
        // End:0xD0
        if(ProjectileClass.default.bUsePooling)
        {
            SpawnedProjectile = LPProj_Seeker(GetPoolManager().SpawnProjectile(ProjectileClass, Instigator, self, SpawnLoc, Rotator(AimDir), SpawnLoc + AimDir));            
        }
        else
        {
            SpawnedProjectile = Spawn(ProjectileClass, self,, SpawnLoc);
            SpawnedProjectile.Init(AimDir);
        }
    }
    SpawnedProjectile.TrackingMaxAccel = SeekerMaxAccel;
    SpawnedProjectile.TrackingDelay = SeekerSeekDelay;
    SpawnedProjectile.Velocity = TuneDataBaseWeapon.SupportedAmmoTypes[AmmoTypeInfo.CurrentAmmoMode].ProjectileVelocity * AimDir;
    SpawnedProjectile.GravityZ = TuneDataBaseWeapon.SupportedAmmoTypes[AmmoTypeInfo.CurrentAmmoMode].ProjectileGravity;
    SpawnedProjectile.Damage = InstantHitDamage[0];
    SpawnedProjectile.SetLifetime(SeekerLifetime);
    SpawnedProjectile.SetSeekTarget(GetSeekTarget(SpawnLoc, AimDir));
    SetFlashLocation(vect(1.0000000, 1.0000000, 1.0000000));
    //return;    
}

simulated function FireRecycledProjectile()
{
    local /*0x97E50000-0x00000000*/ private @NULL Proj[8388609], SpawnLocation, SpawnRotation, AimDir, SpawnedProjectile;

    AimDir = Vector(SpawnRotation);
    SpawnedProjectile = LPProj_Seeker(Proj);
    SpawnedProjectile.ActivateFromPool(Instigator, self, SpawnLocation, SpawnRotation, SpawnLocation + AimDir, SpawnLocation + AimDir);
    SpawnedProjectile.TrackingMaxAccel = SeekerMaxAccel;
    SpawnedProjectile.TrackingDelay = SeekerSeekDelay;
    SpawnedProjectile.Velocity = TuneDataBaseWeapon.SupportedAmmoTypes[AmmoTypeInfo.CurrentAmmoMode].ProjectileVelocity * AimDir;
    SpawnedProjectile.GravityZ = TuneDataBaseWeapon.SupportedAmmoTypes[AmmoTypeInfo.CurrentAmmoMode].ProjectileGravity;
    SpawnedProjectile.SetLifetime(SeekerLifetime);
    SpawnedProjectile.SetSeekTarget(GetSeekTarget(SpawnLocation, AimDir));
    //return;    
}

simulated function CalcRemoteImpactEffects()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GivenHitLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool bViaReplication[8388609];

    AbortWeaponReload(true);
    super(SPInventoryWeapon).CalcRemoteImpactEffects(FireModeNum, GivenHitLocation, bViaReplication);
    //return;    
}

simulated function GetSeekTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL SpawnLoc[8388609], AimDir, ReturnValue, P, NormTargetDir, NormAimDir;

    local /*0x97E50000-0x00000000*/ private float BestDot, dotVal;
    local /*0x97E50000-0x00000000*/ private int MyTeamNum;
    local /*0x97E50000-0x00000000*/ private @NULL VS;

    // End:0x239
    if((WorldInfo.TimeSeconds - SeekTargetFoundTime) > SeekTargetFindInterval)
    {
        BestDot = SeekRequiredDot;
        CurrentSeekTarget = none;
        MyTeamNum = int(Instigator.GetTeamNum());
        NormAimDir = Normal(AimDir);
        // End:0x210
        foreach WorldInfo.AllPawns(Class'LPPawn', P, SpawnLoc, SeekRadius)
        {
            VS = LPBaseVSPlayerPawn(P);
            // End:0x20F
            if((P.IsAlive() && int(P.GetTeamNum()) != MyTeamNum) && (VS == none) || VS.bIsPossessedByPlayer)
            {
                NormTargetDir = Normal(P.Location - SpawnLoc);
                dotVal = NormTargetDir Dot NormAimDir;
                // End:0x20F
                if(dotVal > BestDot)
                {
                    BestDot = dotVal;
                    CurrentSeekTarget = P;
                }
            }            
        }        
        SeekTargetFoundTime = WorldInfo.TimeSeconds;
    }
    return CurrentSeekTarget;
    //return ReturnValue;    
}

defaultproperties
{
    SeekRadius=8000.0000000
    SeekTargetFindInterval=0.5000000
    bAllowTracers=true
    bRequiresInputForNewPickup=true
    // Reference: StaticMeshComponent'Default__LPWeaponSMG.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponSMG.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    HUDIconName="pigSMG"
    HUDReticleName="pigSMG"
    HUDReticleName_SecondaryAmmomode="pigSMG"
    FriendlyName="P.I.G."
    Description="Pneumatic Injector Gun. Uses compressed gas to rapid fire heavy metal rivets. A solid close quarters weapon."
    WeaponFireTypes=/* Array type was not detected. */
    EquipTime=0.2500000
    // Reference: SkeletalMeshComponent'Default__LPWeaponSMG.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    PickupMessage="P.I.G. Rivets"
    // Reference: StaticMeshComponent'Default__LPWeaponSMG.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
}