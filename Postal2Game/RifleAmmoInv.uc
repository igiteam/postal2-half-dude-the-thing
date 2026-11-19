///////////////////////////////////////////////////////////////////////////////
// In gun ammo
///////////////////////////////////////////////////////////////////////////////
class RifleAmmoInv extends P2AmmoInv;

var class<P2Projectile> SilentProjectileClass;
var class<DamageType> DamageTypeEnhanced;

///////////////////////////////////////////////////////////////////////////////
// Add in the instigator
///////////////////////////////////////////////////////////////////////////////
function SpawnRifleProjectile(vector Start, vector Dir)
{
	local RifleProjectile rp;

	// 1407 bug below
	//AmmoAmount -= 1;
	// Fix: use function so npc's can properly have infinite ammo and drop the proper amount on death.
	UseAmmoForShot();

	rp = RifleProjectile(spawn(ProjectileClass,Instigator,, Start));
	rp.SetVelocity(Dir);
	//log(self$" spawned rifle proj "$rp$" at "$rp.Location$" player loc "$Instigator.Location$" speed "$rp.Velocity$" rot "$Instigator.Rotation);
}

function SpawnSilentRifleProjectile(vector Start, vector Dir)
{
	local RifleProjectile rp;

	UseAmmoForShot();

	rp = RifleProjectile(spawn(SilentProjectileClass,Instigator,, Start));
	rp.SetVelocity(Dir);
	//log(self$" spawned rifle proj "$rp$" at "$rp.Location$" player loc "$Instigator.Location$" speed "$rp.Velocity$" rot "$Instigator.Rotation);
}




// Decompiled with UE Explorer.
defaultproperties
{
    SilentProjectileClass=Class'RifleProjectileSilent'
    DamageTypeEnhanced=Class'BaseFX.SuperRifleDamage'
    DamageAmount=25.0000000
    MomentumHitMag=10000.0000000
    DamageTypeInflicted=Class'BaseFX.RifleDamage'
    MaxAmmoMP=8
    MaxAmmo=40
    bLeadTarget=true
    ProjectileClass=Class'RifleProjectile'
    WarnTargetPct=0.2000000
    RefireRate=0.9900000
    PickupClass=Class'RifleAmmoPickup'
    Texture=Texture'HUDPack.Icons.Icon_Weapon_Rifle'
}