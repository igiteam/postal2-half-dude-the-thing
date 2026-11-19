///////////////////////////////////////////////////////////////////////////////
// MolotovWeapon
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Molotovs that you throw.
//
///////////////////////////////////////////////////////////////////////////////

class MolotovWeapon extends GrenadeWeapon;

///////////////////////////////////////////////////////////////////////////////
// Vars, structs, consts
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Play firing animation/sound/etc
// Set here that we want to reload after each throw
///////////////////////////////////////////////////////////////////////////////
simulated function PlayFiring()
{
	Super.PlayFiring();
	bForceReload=true;
}
simulated function PlayAltFiring()
{
	Super.PlayAltFiring();
	bForceReload=true;
}

///////////////////////////////////////////////////////////////////////////////
// Normal projectile fire, plus check where to make the danger marker to 
// alert people of the noise.
///////////////////////////////////////////////////////////////////////////////
function ProjectileFire()
{
	// STUB
}
///////////////////////////////////////////////////////////////////////////////
// Normal projectile fire, plus check where to make the danger marker to 
// alert people of the noise.
///////////////////////////////////////////////////////////////////////////////
function ProjectileAltFire()
{
	// STUB
}

///////////////////////////////////////////////////////////////////////////////
// WE don't throw grenades
///////////////////////////////////////////////////////////////////////////////
function ThrowGrenade()
{
	// STUB
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function Notify_ThrowMolotov()
{
	local vector HitLocation, HitNormal, StartTrace, EndTrace, X,Y,Z;
	local actor HitActor;
	local MolotovProjectile molot;
	
	if(P2AmmoInv(AmmoType) != None
		&& AmmoType.HasAmmo())
	{
		CalcAIChargeTime();
		// Alt-firing the grenade, drops it at your feet, and doesn't
		// arm it
		if(bAltFiring)
		{
			ChargeTime = 0.0;
			FireOffset = AltFireOffset;
		}
		else
		{
			FireOffset = default.FireOffset;
		}

		GetAxes(Instigator.GetViewRotation(),X,Y,Z);
		StartTrace = GetFireStart(X,Y,Z); 
		AdjustedAim = Instigator.AdjustAim(AmmoType, StartTrace, 2*AimError);	
		// Make sure we're not generating this on the other side of a thin wall
		//if(FastTrace(Instigator.Location, StartTrace))
		HitActor = Trace(HitLocation, HitNormal, Instigator.Location, StartTrace, true);
		if(HitActor == None
			|| (!HitActor.bStatic
				&& !HitActor.bWorldGeometry))
		{
			if(bAltFiring)
				molot = spawn(class'MolotovAltProjectile',Instigator,,StartTrace, AdjustedAim);
			else
				molot = spawn(class'MolotovProjectile',Instigator,,StartTrace, AdjustedAim);

			// Only use up the shot and perform the setup if we successfully spawned
			// a cocktail
			if(molot != None)
			{
				molot.Instigator = Instigator;
				
				// Compensate for catnip time, if necessary. Don't do this for NPCs
				if(FPSPawn(Instigator) != None
					&& FPSPawn(Instigator).bPlayer)
					ChargeTime /= Level.TimeDilation;

				molot.SetupThrown(ChargeTime);
				P2AmmoInv(AmmoType).UseAmmoForShot();
				// Touch any actor that was in between, just in case.
				if(HitActor != None)
					HitActor.Bump(molot);
			}
		}
	}
	// Turn off the thing in his hand as it leaves
	if(ThirdPersonActor != None)
		ThirdPersonActor.bHidden=true;
}

///////////////////////////////////////////////////////////////////////////////
// If you drop your weapon, and you were charging (probably when you were dying)
// then drop a molotov too.
///////////////////////////////////////////////////////////////////////////////
function DropFrom(vector StartLocation)
{
	// If you were charging, throw out a live one now
	if(IsInState('BeforeCharging')
		|| IsInState('Charging')
		|| IsInState('ChargeWaitGrenade'))
	{
		ChargeTime = ChargeTimeMinAI;
		Notify_ThrowMolotov();
	}

	Super.DropFrom(StartLocation);
}

// xPatch: Make sure that this gun is not extension!
function bool CanSwapHands()
{
	return (Class == Class'MolotovWeapon');
}


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    ChargeDistRatio=1600.0000000
    ChargeTimeMinAI=0.7000000
    WeaponSpeedCharge=0.5000000
    AltHint1="Press %KEY_AltFire% to place bombs."
    AltHint2="They explode after several seconds."
    ViolenceRank=2
    RecognitionDist=500.0000000
    MinRange=512.0000000
    FirstPersonMeshSuffix="Molotov"
    WeaponSpeedShoot1Rand=0.1000000
    WeaponSpeedShoot2=1.1000000
    WeaponSpeedIdle=0.5000000
    OldMesh=SkeletalMesh'FP_Weapons.FP_Dude_Molotov'
    AmmoName=Class'MolotovAmmoInv'
    TraceAccuracy=0.1000000
    AIRating=0.5300000
    FireSound=Sound'WeaponSounds.molotov_fire'
    GroupOffset=2
    PickupClass=Class'MolotovPickup'
    AttachmentClass=Class'MolotovAttachment'
    ItemName="Molotov Cocktail"
    Mesh=SkeletalMesh'MP_Weapons.MP_LS_Molotov'
}