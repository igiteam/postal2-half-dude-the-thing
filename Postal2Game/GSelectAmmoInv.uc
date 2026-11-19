///////////////////////////////////////////////////////////////////////////////
// NOTE! Glock uses now NineAmmoInv. This is old not used anymore class.
///////////////////////////////////////////////////////////////////////////////
class GSelectAmmoInv extends P2AmmoInv;

const FLESH_HIT_MAX	=	4;

var Sound FleshHit[FLESH_HIT_MAX];
var float FleshRad;
var array<Sound> BotHit, SkelHit;

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
    DamageAmount=15.0000000
    MomentumHitMag=10000.0000000
    DamageTypeInflicted=Class'BaseFX.BulletDamage'
    AltDamageTypeInflicted=Class'BaseFX.BulletDamage'
    MaxAmmoMP=500
    MaxAmmo=400
    bLeadTarget=true
    bInstantHit=true
    WarnTargetPct=0.2000000
    RefireRate=0.9900000
    PickupClass=Class'GSelectAmmoPickup'
    Texture=Texture'EDHud.hud_Glock'
}