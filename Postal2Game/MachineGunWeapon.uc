//=============================================================================
// MachineGunWeapon
// Copyright 2001 Running With Scissors, Inc.  All Rights Reserved.
//
// Machine gun weapon (first and third person).
//
// For AI characters, this weapon scales the number of times it's shot continuously
// with the difficulty level. Higher difficulty--more they shoot in one burst.
//
//	History:
//		01/29/02 MJR	Started history, probably won't be updated again until
//							the pace of change slows down.
//
//=============================================================================

class MachineGunWeapon extends DualCatableWeapon;

///////////////////////////////////////////////////////////////////////////////
// Vars, structs, consts
///////////////////////////////////////////////////////////////////////////////
var travel byte ShootScissors;		// Cheat that makes you shoot bouncing scissors instead
var float SPAccuracy;				// How accurate we are in single player games.
var float ActualFireRate;			// HACK to adjust actual fire rate.

///////////////////////////////////////////////////////////////////////////////
// Fire the weapon
///////////////////////////////////////////////////////////////////////////////
simulated function PlayAltFiring()
{
	local float UsePitch;
	local vector StartTrace, X,Y,Z;

	// If the cat is on the gun and we want it to fly off, then set it up to fly off,
	// by switching the animation
	if(CatOnGun==1)
		{
		// Switch to special sound
		FireSound=CatFireSound;
		// Pitch higher with each consecutive shot
		UsePitch = WeaponFirePitchStart + (CAT_PITCH_INCREASE*(StartShotsWithCat - CatAmmoLeft));

		if (CatAmmoLeft==0
			|| !AmmoType.HasAmmo())
			{
			// Remove our cat and shoot him off, unless we have a cheat set to
			// keep shooting them off
			CatAmmoLeft=1;
			ShootOffCat();
			}
		}
	else
		{
		// Use normal firing sound
		FireSound=Default.FireSound;
		UsePitch = WeaponFirePitchStart + (FRand()*WeaponFirePitchRand);
		}

	// Normal playfiring for P2Weapon, but we pitch the fire sound for a cat, higher and
	// higher with each shot, if we're shooting with a cat.
	IncrementFlashCount();

	// Play it here (instead of in the attachment) in SP games
	if(Level.Game != None
		&& FPSGameInfo(Level.Game).bIsSinglePlayer)
		Instigator.PlaySound(FireSound, SLOT_None, 1.0, true, , UsePitch);

	PlayAnim('Shoot1', WeaponSpeedShoot1 + (WeaponSpeedShoot1Rand*FRand()), 0.05);

	SetupMuzzleFlash();
	SetupMuzzleFlashEmitter();
}

///////////////////////////////////////////////////////////////////////////////
// Give hints about this item
///////////////////////////////////////////////////////////////////////////////
function bool GetHints(out String str1, out String str2, out String str3,
				out byte InfiniteHintTime)
{
	if(bShowHints
		&& bAllowHints
		&& P2GameInfoSingle(Level.Game) != None
		&& P2GameInfoSingle(Level.Game).VerifySeqTime()
		&& Pawn(Owner).Controller.bIsPlayer)
	{
		str1=HudHint1;
		return true;
	}
	return false;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function ServerAltFire()
{
	TurnOffHint();
	Super.ServerAltFire();
}

///////////////////////////////////////////////////////////////////////////////
// AltFire - shoots scissors
// Enhanced only.
///////////////////////////////////////////////////////////////////////////////
simulated function AltFire( float Value )
{
	if(P2GameInfoSingle(Level.Game) != None
		&& P2GameInfoSingle(Level.Game).VerifySeqTime()
		&& Pawn(Owner).Controller.bIsPlayer
		|| ShootScissors==1)
	{
		Super.AltFire(Value);
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function PostBeginPlay()
{
	local float diffoffset;

	Super.PostBeginPlay();

	// If it's a single player game, make our accuracy much worse
	if(Level.Game != None
		&& FPSGameInfo(Level.Game).bIsSinglePlayer)
	{
		TraceAccuracy = SPAccuracy;

		// Based on the difficulty, bump up the number of times AI will continuously
		// shoot this weapon
		diffoffset = P2GameInfo(Level.Game).GetDifficultyOffset();
		if(diffoffset > 0)
		{
			AI_BurstCountExtra+=diffoffset;
		}
	}


}

///////////////////////////////////////////////////////////////////////////////
// This will randomly change the color and the size of the dynamic
// light associate with the flash. Change in each weapon's file,
// but call each time you start up the flash again.
// This function is also used by the third-person muzzle flash, so the
// colors will look the same
///////////////////////////////////////////////////////////////////////////////
simulated function PickLightValues()
{
	LightBrightness=150;
	LightSaturation=180;
	LightHue=12+FRand()*15;
	LightRadius=16+FRand()*16;
}

///////////////////////////////////////////////////////////////////////////////
// Tell ammo to make this scissors type
///////////////////////////////////////////////////////////////////////////////
function SpawnScissors(bool bMakeSpinner)
{
	local vector HitLocation, HitNormal, StartTrace, EndTrace, X,Y,Z;
	local actor HitActor;
	local ScissorsProjectile sic;
	local P2Player p2p;

	GetAxes(Instigator.GetViewRotation(),X,Y,Z);
	StartTrace = GetFireStart(X,Y,Z);
	AdjustedAim = Instigator.AdjustAim(AmmoType, StartTrace, 2*AimError);
	HitActor = Trace(HitLocation, HitNormal, Instigator.Location, StartTrace, true);
	//log("traced from"@StartTrace@"to"@Instigator.Location@"hit"@HitActor);
	if(HitActor == None
		|| (!HitActor.bStatic
			&& !HitActor.bWorldGeometry
			&& ScissorsProjectile(HitActor) == None))
		sic = spawn(class'ScissorsAltProjectile',Instigator,,StartTrace, AdjustedAim);

	// If we didn't make it, give the ammo back
	if (sic == None)
		AmmoType.AddAmmo(1);
}

///////////////////////////////////////////////////////////////////////////////
// See what we hit
///////////////////////////////////////////////////////////////////////////////
function TraceFire( float Accuracy, float YOffset, float ZOffset )
{
	local int i;

	// Reduce the ammo only by 1 here, for the shotgun, but shoot
	// ShotCountMaxForNotify number of pellets each time.
	P2AmmoInv(AmmoType).UseAmmoForShot();

	// Reduce the cat ammo if we're using one
	if(CatOnGun == 1)
		CatAmmoLeft--;
/*
	if (P2GameInfoSingle(Level.Game) != None
		&& P2GameInfoSingle(Level.Game).VerifySeqTime()
		&& Pawn(Owner).Controller.bIsPlayer)
		ShootScissors = 1;

	if(ShootScissors==1)
		SpawnScissors(true);
	else
*/
		Super.TraceFire(Accuracy, YOffset, ZOffset);
}

simulated event RenderOverlays(Canvas canvas)
{
    super.RenderOverlays(canvas);
 	// Checks for Ultra WS and corrections draw scale, fov, and position.
    // Sorry for the hacky method, but cannot seem to fix the view model clipping.
	// ApplyPositionHack(0.25,133,vect(2.0000,0.000000,-4.3000),,0.2,vect(1.0000,0.300000,-1.3000));

}

///////////////////////////////////////////////////////////////////////////////
// DrawMuzzleFlash()
//Default implementation assumes that flash texture can be drawn inverted in X and/or Y direction to increase apparent
//number of flash variations
// We might need to draw a dark blood splat
///////////////////////////////////////////////////////////////////////////////
simulated function DrawMuzzleFlash(Canvas Canvas)
{
	local float Scale, ULength, VLength, UStart, VStart;

	// Form dynamic muzzle flash size
	MuzzleScale = FRand()*(default.MuzzleScale);
	// Form offset based on that
//	FlashOffsetX = -(MuzzleScale/500) + default.FlashOffsetX;
//	FlashOffsetY = -(MuzzleScale/500) + default.FlashOffsetY;

	MuzzleScale += 1.0;

	if(CatOnGun == 0
		|| !class'P2Player'.static.BloodMode())
		Super.DrawMuzzleFlash(Canvas);
	else	// if a cat, then draw it alpha blended with a gross blood splat
	{
		Scale = MuzzleScale * Canvas.ClipX/640.0;
		Canvas.Style = ERenderStyle.STY_Alpha;
		ULength = MFTexture.USize;
		if ( FRand() <= 0.5 )
		{
			UStart = ULength;
			ULength = -1 * ULength;
		}
		VLength = MFTexture.VSize;
		if ( FRand() <= 0.5 )
		{
			VStart = VLength;
			VLength = -1 * VLength;
		}

		Canvas.DrawTile(MFTexture, Scale * MFTexture.USize, Scale * MFTexture.VSize,
					UStart, VStart, ULength, VLength);
		Canvas.Style = ERenderStyle.STY_Normal;
	}
}
///////////////////////////////////////////////////////////////////////////////
// See what we hit - alt-fire
///////////////////////////////////////////////////////////////////////////////
function TraceAltFire( float Accuracy, float YOffset, float ZOffset )
{
	local int i;
	local bool bProj;

	// Reduce the ammo only by 1 here, for the shotgun, but shoot
	// ShotCountMaxForNotify number of pellets each time.
	P2AmmoInv(AmmoType).UseAmmoForShot();

	// If we have a cat on our gun, alt-fire shoots it off every time and doesn't use "cat ammo"
	// (like the Rockin' Cats cheat)

	// Don't do this -- the scissors make the cat explode every time. Instead, make the alt-fire NOT decrease "cat ammo".
	/*
	if(CatOnGun == 1)
		ShootOffCat();
	*/

	SpawnScissors(true);
}
state ClientFiring
{
}
state NormalFire
{
// HACK to improve machinegun fire rate
Begin:
	if (Class == class'MachineGunWeapon')
		Goto('BeginHack');
	else
		Goto('');
BeginHack:
	Sleep(1/ActualFireRate);
	Finish();
	Goto('BeginHack');
}

///////////////////////////////////////////////////////////////////////////////
// Modify your speed based on your owners body speed
///////////////////////////////////////////////////////////////////////////////
function ChangeSpeed(float NewSpeed)
{
	Super.ChangeSpeed(NewSpeed);
	ActualFireRate = default.ActualFireRate*NewSpeed;
}

// xPatch: Make sure that this gun is not extension!
function bool CanSwapHands()
{
	return (Class == Class'MachineGunWeapon');
}

// xPatch: So apparently the old cat mesh has no Cylinder01 bone huh...
function SwapCatOn()
{
	Super.SwapCatOn();
	
	if(Mesh == OldCatMesh)
	{
		MFBoneName=CatBoneName;
		MFRelativeLocation.X=-40;
		MFRelativeLocation.Y=-12;
		MFRelativeLocation.Z=1;
	}
}
function SwapCatOff()
{
	Super.SwapCatOff();
	MFBoneName=default.MFBoneName;
	MFRelativeLocation=default.MFRelativeLocation;
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    SPAccuracy=0.7000000
    ActualFireRate=7.5000000
    CatMesh=SkeletalMesh'MP_Weapons.MP_LS_MachinegunCat'
    OldCatMesh=SkeletalMesh'FP_Weapons.FP_Dude_MachinegunCat'
    MFBloodTexture=Texture'nathans.muzzleflashes.bloodmuzzleflash'
    StartShotsWithCat=9
    CatFireSound=Sound'WeaponSounds.machinegun_catfire'
    CatBoneName="MESH_Clip"
    bUsesAltFire=true
    ViolenceRank=5
    RecognitionDist=1300.0000000
    ShotCountMaxForNotify=20
    AI_BurstCountExtra=10
    AI_BurstCountMin=6
    AI_BurstTime=0.1500000
    holdstyle=4
    switchstyle=4
    firingstyle=4
    MinRange=300.0000000
    bAllowHints=true
    bShowHints=true
    HudHint1="Press %KEY_AltFire% to fire something a bit sharper than a bullet."
    CombatRating=5.0000000
    FirstPersonMeshSuffix="MachineGun"
    WeaponSpeedLoad=1.5000000
    WeaponSpeedReload=1.5000000
    WeaponSpeedHolster=1.5000000
    WeaponSpeedShoot1=25.0000000
    VeteranModeDropChance=0.4500000
    OldMesh=SkeletalMesh'FP_Weapons.FP_Dude_Machinegun'
    bSpawnMuzzleFlash=true
    MFClass[2]=Class'FX2.MuzzleFlash01'
    MFBoneName="Cylinder01"
    MFRelativeLocation=(X=0.0000000,Y=0.0000000,Z=98.0000000)
    MFTex=Texture'Timb.muzzle_flash.machine_gun_corona'
    MFScale=(Min=1.6000000,Max=1.6000000)
    MFSizeRange=(Min=20.0000000,Max=25.0000000)
    MFLifetime=(Min=0.0500000,Max=0.0500000)
    MFSpinRan=(Min=-0.0500000,Max=0.0500000)
    MFSpinsPerSec=(Max=1.0000000)
    ShellClass=Class'FX2.P2Shell_MachineGun'
    ShellBoneName="MESH_Rnd01"
    ShellRelativeLocation=(X=0.0000000,Y=5.0000000,Z=12.0000000)
    ShellSpeedY=650.0000000
    ShellSpeedZ=450.0000000
    ShellTex=Texture'WeaponSkins.brass-01'
    bCheckShell=true
    AmmoName=Class'MachineGunBulletAmmoInv'
    AutoSwitchPriority=4
    TraceAccuracy=0.1100000
    aimerror=600.0000000
    AIRating=0.4000000
    MaxRange=1200.0000000
    FireSound=Sound'WeaponSounds.Machinegun_fire'
    MuzzleScale=0.2000000
    FlashOffsetY=-0.0300000
    FlashOffsetX=0.0300000
    MuzzleFlashSize=128.0000000
    MFTexture=Texture'Timb.muzzle_flash.machine_gun_corona'
    MuzzleFlashScale=2.4000000
    MuzzleFlashStyle=1
    InventoryGroup=4
    GroupOffset=1
    PickupClass=Class'MachineGunPickup'
    PlayerViewOffset=(X=1.0000000,Y=0.3000000,Z=-10.3000000)
    BobDamping=1.1500000
    AttachmentClass=Class'MachinegunAttachment'
    ItemName="Machine Gun"
    Mesh=SkeletalMesh'MP_Weapons.MP_LS_Machinegun'
    Skins[0]=Texture'MP_FPArms.LS_arms.LS_hands_dude'
    Skins[1]=Texture'WeaponSkins.m-16_timb'
    Skins[2]=Texture'WeaponSkins.brass-01'
    Skins[3]=Texture'AnimalSkins.Cat_Orange'
    SoundRadius=255.0000000
}