///////////////////////////////////////////////////////////////////////////////
// NapalmWeapon
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Napalm cannister launcher
//
///////////////////////////////////////////////////////////////////////////////

class NapalmWeapon extends P2DualWieldWeapon; //P2Weapon;

///////////////////////////////////////////////////////////////////////////////
// Vars, structs, consts
///////////////////////////////////////////////////////////////////////////////
var travel bool bShowHint1;
var bool bAltFired;

var sound HandleSound;
var sound CanisterSound;

///////////////////////////////////////////////////////////////////////////////
// Give hints about this item
///////////////////////////////////////////////////////////////////////////////
function bool GetHints(out String str1, out String str2, out String str3,
				out byte InfiniteHintTime)
{
	if(bAllowHints)
	{
		if(bShowHint1)
			str1=HudHint1;
		else
			str2=HudHint2;
		return true;
	}
	return false;
}
///////////////////////////////////////////////////////////////////////////////
// Allow hints again
///////////////////////////////////////////////////////////////////////////////
function RefreshHints()
{
	Super.RefreshHints();
	bShowHint1=true;
}

simulated function PlayFiring()
{
	bForceReload=true;
	Super.PlayFiring();
	if(bShowHint1)
	{
		bShowHint1=false;
		UpdateHudHints();
	}
}
simulated function PlayAltFiring()
{
	bForceReload=true;
	Super.PlayAltFiring();
	if(!bShowHint1)
		TurnOffHint();
}

///////////////////////////////////////////////////////////////////////////////
// play reloading sounds
///////////////////////////////////////////////////////////////////////////////
simulated function PlayReloading()
{
	// Dual Wielding
	if (bDualWielding || (RightWeapon != none && RightWeapon.bDualWielding)) 
		PlayAnim('Holster', WeaponSpeedHolster, 0.05);
	else
		PlayAnim('Shoot1Unload', WeaponSpeedReload, 0.05);
	Instigator.PlayOwnedSound(ReloadSound, SLOT_Misc, 1.0);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
simulated function PlayDownAnim()
{
	if(HasAmmo())
		Super.PlayDownAnim();
	else
		PlayAnim('HolsterEmpty', WeaponSpeedHolster, 0.05);
		Instigator.PlayOwnedSound(HolsterSound, SLOT_Misc, 1.0);
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
function Notify_ShootNapalm()
{
	local vector HitLocation, HitNormal, StartTrace, EndTrace, X,Y,Z;
	local actor HitActor;
	local NapalmProjectile npro;

	if(AmmoType != None
		&& AmmoType.HasAmmo())
	{
		GetAxes(Instigator.GetViewRotation(),X,Y,Z);
		StartTrace = GetFireStart(X,Y,Z);
		AdjustedAim = Instigator.AdjustAim(AmmoType, StartTrace, 2*AimError);
		//  Make sure there's nothing right in the way
		HitActor = Trace(HitLocation, HitNormal, Instigator.Location, StartTrace, true);
		if(HitActor == None
			|| (!HitActor.bStatic
				&& !HitActor.bWorldGeometry))
		{
			// Reset our dude's burn count
			if (P2Pawn(Instigator) != None)
				P2Pawn(Instigator).PeopleBurned = 0;
			npro = spawn(class'NapalmProjectile',Instigator,,StartTrace, AdjustedAim);
			if(npro != None)
			{
				P2AmmoInv(AmmoType).UseAmmoForShot();
				npro.Instigator = Instigator;
				npro.SetupShot(!bAltFiring, !bAltFiring);
				npro.AddRelativeVelocity(Instigator.Velocity);
			}
			// Touch any actor that was in between, just in case.
			if(HitActor != None)
				HitActor.Bump(npro);
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
// Added by Man Chrzan: xPatch 2.0
///////////////////////////////////////////////////////////////////////////////
function Notify_CanisterSound()
{
    if (Level.Game == None || !FPSGameInfo(Level.Game).bIsSinglePlayer)
            PlayOwnedSound(CanisterSound,SLOT_Interact,1.0,,,WeaponFirePitchStart + (FRand()*WeaponFirePitchRand),false);
        else
            Instigator.PlaySound(CanisterSound, SLOT_None, 1.0, true, , WeaponFirePitchStart + (FRand()*WeaponFirePitchRand));

}

function Notify_HandleSound()
{
    if (Level.Game == None || !FPSGameInfo(Level.Game).bIsSinglePlayer)
            PlayOwnedSound(HandleSound,SLOT_Interact,1.0,,,WeaponFirePitchStart + (FRand()*WeaponFirePitchRand),false);
        else
            Instigator.PlaySound(HandleSound, SLOT_None, 1.0, true, , WeaponFirePitchStart + (FRand()*WeaponFirePitchRand));

}

// xPatch: Make sure that this gun is not extension!
function bool CanSwapHands()
{
	return (Class == Class'NapalmWeapon');
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bShowHint1=true
    HandleSound=Sound'WeaponSounds.napalm_lockhandle'
    CanisterSound=Sound'WeaponSounds.napalm_beattop'
    bDisableDualWielding=true
    bUsesAltFire=true
    ViolenceRank=8
    RecognitionDist=1500.0000000
    ShotCountMaxForNotify=0
    holdstyle=4
    switchstyle=4
    firingstyle=4
    MinRange=512.0000000
    ShakeOffsetTime=2.5000000
    ErrandPickupClass=Class'NapalmPickupErrand'
    bAllowHints=true
    bShowHints=true
    HudHint1="Press %KEY_Fire% for a straight ahead shot."
    HudHint2="Press %KEY_AltFire% and be careful with this in-doors."
    FirstPersonMeshSuffix="Napalm"
    WeaponSpeedReload=0.5000000
    WeaponSpeedHolster=1.5000000
    WeaponSpeedShoot1=0.9000000
    WeaponSpeedShoot1Rand=0.1000000
    WeaponSpeedShoot2Rand=0.1000000
    WeaponSpeedIdle=0.4000000
    AltFireSound=Sound'WeaponSounds.napalm_fire'
    OldMesh=SkeletalMesh'FP_Weapons.FP_Dude_Napalm'
    AmmoName=Class'NapalmAmmoInv'
    AutoSwitchPriority=10
    FireOffset=(X=20.0000000,Y=20.0000000,Z=0.0000000)
    ShakeRotMag=(X=400.0000000,Y=50.0000000,Z=50.0000000)
    ShakeRotTime=2.5000000
    ShakeOffsetMag=(X=20.0000000,Y=3.0000000,Z=3.0000000)
    TraceAccuracy=0.3000000
    aimerror=300.0000000
    AIRating=0.9900000
    MaxRange=2048.0000000
    FireSound=Sound'WeaponSounds.napalm_fire'
    InventoryGroup=10
    GroupOffset=1
    PickupClass=Class'NapalmPickup'
    PlayerViewOffset=(X=1.7000000,Y=0.0000000,Z=-6.3000000)
    BobDamping=1.1200000
    AttachmentClass=Class'NapalmAttachment'
    ItemName="Napalm Launcher"
    Mesh=SkeletalMesh'MP_Weapons.MP_LS_Napalm'
    Skins[0]=Texture'MP_FPArms.LS_arms.LS_hands_dude'
}