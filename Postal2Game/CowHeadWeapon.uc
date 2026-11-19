///////////////////////////////////////////////////////////////////////////////
// CowHeadWeapon
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Cow heads that you throw.
//
///////////////////////////////////////////////////////////////////////////////

class CowHeadWeapon extends CowHeadBaseWeapon;

///////////////////////////////////////////////////////////////////////////////
// Vars, structs, consts
///////////////////////////////////////////////////////////////////////////////

var Sound BuzzingSound;

///////////////////////////////////////////////////////////////////////////////
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
// Alt projectile fire, plus check where to make the danger marker to
// alert people of the noise.
///////////////////////////////////////////////////////////////////////////////
function ProjectileAltFire()
{
	// STUB
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
simulated function PlayReloading()
{
	PlayAnim('Load', WeaponSpeedReload, 0.05);
}

///////////////////////////////////////////////////////////////////////////////
// Called on client's side to make the gun fire
// Check here to throw out danger markers to let people know the gun has gone
// off.
///////////////////////////////////////////////////////////////////////////////
simulated function LocalFire()
{
	local P2Player P;

	bPointing = true;

	// Same as the one in P2Weapon, but we don't do the camera shake here
	// We make it shake when he throws

	if ( Affector != None )
		Affector.FireEffect();
	PlayFiring();
	if(Role < ROLE_Authority)
		GotoState('ClientFiring');
}

///////////////////////////////////////////////////////////////////////////////
// Same as above.. we don't want the shake here
///////////////////////////////////////////////////////////////////////////////
simulated function LocalAltFire()
{
	local PlayerController P;

	bPointing = true;

	// Same as the one in P2Weapon, but we don't do the camera shake here
	// We make it shake when he throws

	if ( Affector != None )
		Affector.FireEffect();
	PlayAltFiring();
	if(Role < ROLE_Authority)
		GotoState('ClientFiring');
}

///////////////////////////////////////////////////////////////////////////////
// Actually throw the head
///////////////////////////////////////////////////////////////////////////////
function ThrowIt(float StartSpeed)
{
	local vector HitLocation, HitNormal, StartTrace, EndTrace, X,Y,Z;
	local actor HitActor;
	local CowheadProjectile cowh;
	local P2Player p2p;

	if(AmmoType != None
		&& AmmoType.HasAmmo())
	{
		GetAxes(Instigator.GetViewRotation(),X,Y,Z);
		StartTrace = GetFireStart(X,Y,Z);
		AdjustedAim = Instigator.AdjustAim(AmmoType, StartTrace, 2*AimError);
		// Make sure we're not generating this on the other side of a thin wall
		// Also, bump anything along the way, so the grenade can break a window if
		// you're standing really close to one.
		HitActor = Trace(HitLocation, HitNormal, Instigator.Location, StartTrace, true);
		if(HitActor == None
			|| (!HitActor.bStatic
				&& !HitActor.bWorldGeometry))
		{
			cowh = spawn(class'CowheadProjectile',Instigator,,StartTrace, AdjustedAim);
			if(cowh != None)
			{
				P2AmmoInv(AmmoType).UseAmmoForShot();
				cowh.Instigator = Instigator;
				cowh.CalcStartVelocity(StartSpeed);
				cowh.AddRelativeVelocity(Instigator.Velocity);

				// Shake the view when you throw it (primary fire only)
				if(!bAltFiring)
				{
					if ( Instigator != None)
					{
						p2p = P2Player(Instigator.Controller);
						if (p2p!=None)
						{
							p2p.ClientShakeView(ShakeRotMag, ShakeRotRate, ShakeRotTime,
										ShakeOffsetMag, ShakeOffsetRate, ShakeOffsetTime);
						}
					}
				}
				// Touch any actor that was in between, just in case.
				if(HitActor != None)
					HitActor.Bump(cowh);
			}
		}
	}
	// Turn off the thing in his hand as it leaves
	if(ThirdPersonActor != None)
		ThirdPersonActor.bHidden=true;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function Notify_ThrowCowhead()
{
	ThrowIt(1.0);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function Notify_AltThrowCowhead()
{
	ThrowIt(0.15);
	TurnOffHint();
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// Idle
//////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state Idle
{
	simulated function EndState()
	{
		Super.EndState();
		Instigator.AmbientSound=None;
	}
	///////////////////////////////////////////////////////////////////////////////
	// Make sure you're attachment is visible on idle start
	///////////////////////////////////////////////////////////////////////////////
	simulated function BeginState()
	{
		Super.BeginState();
		if(ThirdPersonActor != None)
			ThirdPersonActor.bHidden=false;
		Instigator.AmbientSound = BuzzingSound;
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// DownWeapon
// Make sure if you're told to put down a weapon when already putting down
// one, you short circuit and say it's down now.
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state DownWeapon
{
	///////////////////////////////////////////////////////////////////////////////
	// Turn off buzzing, just in case Idle was short-circuited
	///////////////////////////////////////////////////////////////////////////////
	simulated function BeginState()
	{
		if (Instigator.AmbientSound == BuzzingSound)
			Instigator.AmbientSound = None;
			
		Super.BeginState();
	}
}

// xPatch: Make sure that this gun is not extension!
function bool CanSwapHands()
{
	return (Class == Class'CowHeadWeapon');
}


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    BuzzingSound=Sound'WeaponSounds.cowhead_idle_loop'
    bUsesAltFire=true
    ViolenceRank=1
    RecognitionDist=900.0000000
    ShotCountMaxForNotify=0
    holdstyle=7
    switchstyle=7
    firingstyle=7
    bThrownByFiring=true
    NoAmmoChangeState="EmptyDownWeapon"
    bNoHudReticle=true
    ShakeOffsetTime=2.5000000
    bAllowHints=true
    bShowHints=true
    HudHint1="Stand still and press %KEY_AltFire% to place it safely."
    HudHint2="Then shoot it at a distance to trigger."
    bBumpStartsFight=false
    FirstPersonMeshSuffix="Cowhead"
    WeaponSpeedShoot1Rand=0.5000000
    bDropInVeteranMode=1
    VeteranModeDropChance=0.0500000
    OldMesh=SkeletalMesh'FP_Weapons.FP_Dude_CowHead'
    AmmoName=Class'CowHeadAmmoInv'
    AutoSwitchPriority=7
    FireOffset=(X=20.0000000,Y=0.0000000,Z=-10.0000000)
    ShakeRotMag=(X=400.0000000,Y=50.0000000,Z=200.0000000)
    ShakeRotTime=2.5000000
    ShakeOffsetMag=(X=20.0000000,Y=3.0000000,Z=3.0000000)
    TraceAccuracy=0.1000000
    aimerror=500.0000000
    MaxRange=1024.0000000
    FireSound=Sound'WeaponSounds.cowhead_fire'
    InventoryGroup=7
    GroupOffset=3
    PickupClass=Class'CowHeadPickup'
    BobDamping=1.1200000
    AttachmentClass=Class'CowHeadAttachment'
    ItemName="Cow Head"
    Mesh=SkeletalMesh'MP_Weapons.MP_LS_Cowhead'
    Skins[0]=Texture'MP_FPArms.LS_arms.LS_hands_dude'
}