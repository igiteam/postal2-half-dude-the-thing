///////////////////////////////////////////////////////////////////////////////
// Added by Man Chrzan: xPatch 2.0
// New shared 9mm ammo class for MP5 and Glock. 
///////////////////////////////////////////////////////////////////////////////

class NineAmmoInv extends P2AmmoInv;

const FLESH_HIT_MAX	=	4;

var Sound FleshHit[FLESH_HIT_MAX];
var float FleshRad;
var array<Sound> BotHit, SkelHit;

var	class<Pickup>  AltPickupClass;
var float AltDamageAmount;
var MP5Weapon MP5;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function ProcessTraceHit(Weapon W, Actor Other, Vector HitLocation, Vector HitNormal, Vector X, Vector Y, Vector Z)
{
	local Rotator NewRot;

	// Reduce ammo only if it's not reloadable weapon
	if (!P2Weapon(W).bReloadableWeapon)
		UseAmmoForShot();

	if ( Other == None )
		return;

	if(Other.bStatic)
	{
		spawn(class'PistolBulletHitPack',Owner, ,HitLocation, Rotator(HitNormal));
	}
	else 
	{
		if (W.IsA('MP5Weapon'))
		{
			if(PickupClass == default.PickupClass)
				PickupClass = AltPickupClass;
				
			Other.TakeDamage(AltDamageAmount, Pawn(Owner), HitLocation, MomentumHitMag*X, AltDamageTypeInflicted);
		}
		else
			Other.TakeDamage(DamageAmount, Pawn(Owner), HitLocation, MomentumHitMag*X, DamageTypeInflicted);

		if (P2MocapPawn(Other) != None)
		{
			if (P2MocapPawn(Other).MyRace < RACE_Automaton)
				Other.PlaySound(FleshHit[Rand(ArrayCount(FleshHit))],SLOT_Pain,,,FleshRad,GetRandPitch());
			else if (P2MocapPawn(Other).MyRace == RACE_Automaton)
				Other.PlaySound(BotHit[Rand(BotHit.Length)],SLOT_Pain,,,FleshRad,GetRandPitch());
			else if (P2MocapPawn(Other).MyRace == RACE_Skeleton)
				Other.PlaySound(SkelHit[Rand(SkelHit.Length)],SLOT_Pain,,,FleshRad,GetRandPitch());
		}
		else if((Pawn(Other) != None && Other != Owner)
			|| PeoplePart(Other) != None
			|| CowheadProjectile(Other) != None)
		{
			Other.PlaySound(FleshHit[Rand(ArrayCount(FleshHit))],SLOT_Pain,,,FleshRad,GetRandPitch());
		}
		else // anything else--make a spark hit
		{
			spawn(class'PistolBulletHitPack',W.Owner, ,HitLocation, Rotator(HitNormal));
		}
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    FleshHit[0]=Sound'WeaponSounds.bullet_hitflesh1'
    FleshHit[1]=Sound'WeaponSounds.bullet_hitflesh2'
    FleshHit[2]=Sound'WeaponSounds.bullet_hitflesh3'
    FleshHit[3]=Sound'WeaponSounds.bullet_hitflesh4'
    FleshRad=200.0000000
    BotHit[0]=Sound'WeaponSounds.bullet_ricochet1'
    BotHit[1]=Sound'WeaponSounds.bullet_ricochet2'
    SkelHit[0]=Sound'WeaponSounds.bullet_ricochet1'
    SkelHit[1]=Sound'WeaponSounds.bullet_ricochet2'
    AltPickupClass=Class'MP5AmmoPickup'
    AltDamageAmount=12.0000000
    DamageAmount=13.0000000
    MomentumHitMag=10000.0000000
    DamageTypeInflicted=Class'BaseFX.MachineGunDamage'
    AltDamageTypeInflicted=Class'BaseFX.MachineGunDamage'
    MaxAmmoMP=500
    MaxAmmo=500
    bLeadTarget=true
    bInstantHit=true
    WarnTargetPct=0.2000000
    RefireRate=0.9900000
    PickupClass=Class'GSelectAmmoPickup'
    Texture=Texture'EDHud.hud_mp5'
}