//=============================================================================
// ShotGunWeapon
// Copyright 2001 Running With Scissors, Inc.  All Rights Reserved.
//
// Shotgun weapon (first and third person).
// This can have a cat put on the end on the of the weapon.
//
// For AI characters, this weapon scales the number of times it's shot continuously
// with the difficulty level. Higher difficulty--more they shoot in one burst.
//
//	History:
//		01/29/02 MJR	Started history, probably won't be updated again until
//							the pace of change slows down.
//
//=============================================================================

class ShotGunWeapon extends DualCatableWeapon;

///////////////////////////////////////////////////////////////////////////////
// Vars, structs, consts
///////////////////////////////////////////////////////////////////////////////

var float SPAccuracy;				// How accurate we are in single player games.

//const BASE_FLASH_OFFSET_X = 0.06;
//const BASE_FLASH_OFFSET_Y = 0.015;
const BASE_FLASH_OFFSET_X = 0.055;
const BASE_FLASH_OFFSET_Y = 0.01;
const RAND_OFFSET = 0.01;

var sound PumpSound; 				// xPatch

///////////////////////////////////////////////////////////////////////////////
// Fire the weapon
///////////////////////////////////////////////////////////////////////////////
simulated function PlayFiring()
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
			if(RepeatCatGun == 0)
				{
				SwapCatOff();
				ShootOffCat();
				CatOnGun=0;
				}
			else // Cheat
				{
				CatAmmoLeft=1;
				ShootOffCat();
				}
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


	if ( (bDualWielding || (RightWeapon != none && RightWeapon.bDualWielding)) && !DoSwapHands() ) // xPatch: DoSwapHands Fix
		PlayAnim('DualFire', WeaponSpeedShoot1 + (WeaponSpeedShoot1Rand*FRand()), 0.05);
	else
	    PlayAnim('Shoot1', WeaponSpeedShoot1 + (WeaponSpeedShoot1Rand*FRand()), 0.05);

	SetupMuzzleFlash();

	// Man Chrzan: xPatch
	SetupMuzzleFlashEmitter(); 
	if( Cat != None )
		Cat.PlayAnim(CatFireAnim);
	if (P2WeaponAttachment(ThirdPersonActor).CatSilencer3rd != None)
		P2WeaponAttachment(ThirdPersonActor).CatSilencer3rd.PlayAnim(CatFireAnim);
}

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
	SetupMuzzleFlashEmitter();	// Man Chrzan: xPatch
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
// AltFire - shoots gyrojets
// Enhanced only.
///////////////////////////////////////////////////////////////////////////////
simulated function AltFire( float Value )
{
	if(P2GameInfoSingle(Level.Game) != None
		&& P2GameInfoSingle(Level.Game).VerifySeqTime()
		&& Pawn(Owner).Controller.bIsPlayer)
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
			AI_BurstCountExtra+=(diffoffset/2);
		}
	}
	
	// xPatch: Give it's primary fire a little buff in Enhanced Game too!
	if(P2GameInfoSingle(Level.Game).VerifySeqTime() && Pawn(Owner).Controller.bIsPlayer)
		ShotCountMaxForNotify=ShotCountMaxForNotify * 2;
}

// xPatch
event PostLoadGame()
{
	Super.PostLoadGame();
	
	// Give it's primary fire a little buff in Enhanced Game too!
	if(P2GameInfoSingle(Level.Game).VerifySeqTime() && Pawn(Owner).Controller.bIsPlayer)
		ShotCountMaxForNotify=ShotCountMaxForNotify * 2;
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
	LightSaturation=150;
	LightHue=22+FRand()*10;
	LightRadius=24+FRand()*6;
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

//	FlashOffsetX = BASE_FLASH_OFFSET_X + FRand()*RAND_OFFSET;
//	FlashOffsetY = BASE_FLASH_OFFSET_Y + FRand()*RAND_OFFSET;

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

simulated event RenderOverlays(Canvas canvas)
{
    super.RenderOverlays(canvas);
 	// Checks for Ultra WS and corrections draw scale, fov, and position.
    // Sorry for the hacky method, but cannot seem to fix the view model clipping.
	//ApplyPositionHack(0.25,133,vect(2.0000,0.000000,-4.3000),,0.2,vect(1.0000,0.300000,-1.3000));

}

///////////////////////////////////////////////////////////////////////////////
// SpawnRocket
// Spawns "gyrojet" projectiles in Enhanced
///////////////////////////////////////////////////////////////////////////////
function SpawnRocket()
{
	local vector StartTrace, X,Y,Z, markerpos, HitNormal, HitLocation;
	local actor HitActor;
	local ShotgunProjectile spro;
	local float giveback;

	GetAxes(Instigator.GetViewRotation(),X,Y,Z);
	StartTrace = GetFireStart(X,Y,Z);
	AdjustedAim = Instigator.AdjustAim(AmmoType, StartTrace, 2*AimError);
	// Make sure we're not generating this on the other side of a thin wall
	HitActor = Trace(HitLocation, HitNormal, Instigator.Location, StartTrace, true);
	if(HitActor == None
		|| (!HitActor.bStatic
			&& !HitActor.bWorldGeometry))
	{
			spro = spawn(class'ShotGunProjectile',Instigator,,StartTrace, AdjustedAim);
			if(spro != None)
			{
				spro.Instigator = Instigator;
				// Compensate for catnip time, if necessary. Don't do this for NPCs
				spro.SetupShot();
				spro.AddRelativeVelocity(Instigator.Velocity);
				// Touch any actor that was in between, just in case.
				if(HitActor != None)
					HitActor.Bump(spro);
			}
	}
}

///////////////////////////////////////////////////////////////////////////////
// See what we hit
///////////////////////////////////////////////////////////////////////////////
function TraceFire( float Accuracy, float YOffset, float ZOffset )
{
	local int i;
	local bool bProj;

	// Reduce the ammo only by 1 here, for the shotgun, but shoot
	// ShotCountMaxForNotify number of pellets each time.
	P2AmmoInv(AmmoType).UseAmmoForShot();

	// Reduce the cat ammo if we're using one
	if(CatOnGun == 1)
		CatAmmoLeft--;
		
	for(i=0; i<ShotCountMaxForNotify; i++)
	{	
		// FIXME this could probably be handled better by having the aim assist pick a vector to fire in and then let the gun's accuracy handle the
		// pellet hits but... whatever, we're on a time constraint here.
		if (i == 0)
			bAllowAimAssist = Default.bAllowAimAssist;
		else
			bAllowAimAssist = false;
		Super.TraceFire(Accuracy, YOffset, ZOffset);
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
	if(CatOnGun == 1)
		ShootOffCat();
		
	for(i=0; i<ShotCountMaxForNotify; i++)
		SpawnRocket();
}

state ClientFiring
{
}
state NormalFire
{
}

///////////////////////////////////////////////////////////////////////////////
// Added by Man Chrzan: xPatch 2.0
///////////////////////////////////////////////////////////////////////////////
function Notify_Pump()
{
	// Allow only for players. This pump sound can be a little annoying when made by NPCs...
	if ( Instigator.IsHumanControlled() )
	{
        Instigator.PlaySound(PumpSound, SLOT_None, 1.0, true, , WeaponFirePitchStart + (FRand()*WeaponFirePitchRand));
	}
}

// xPatch: Make sure that this gun is not extension!
function bool CanSwapHands()
{
	return (Class == Class'ShotgunWeapon');
}


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    SPAccuracy=1.4000000
    PumpSound=Sound'WeaponSounds.shotgun_ejectshell'
    CatMesh=SkeletalMesh'MP_Weapons.MP_LS_ShotgunCat'
    OldCatMesh=SkeletalMesh'FP_Weapons.FP_Dude_ShotgunCat'
    MFBloodTexture=Texture'nathans.muzzleflashes.bloodmuzzleflash'
    StartShotsWithCat=9
    CatFireSound=Sound'WeaponSounds.shotgun_catfire'
    CatSkinIndex=2
    bUsesAltFire=true
    ViolenceRank=3
    RecognitionDist=1100.0000000
    ShotCountMaxForNotify=4
    AI_BurstCountMin=3
    holdstyle=5
    switchstyle=5
    firingstyle=5
    MinRange=200.0000000
    ShakeOffsetTime=2.5000000
    bAllowHints=true
    bShowHints=true
    HudHint1="Press %KEY_AltFire% for an explosive shot."
    CombatRating=4.0000000
    FirstPersonMeshSuffix="Shotgun"
    WeaponSpeedLoad=1.5000000
    WeaponSpeedHolster=1.5000000
    WeaponSpeedShoot1Rand=0.3000000
    WeaponSpeedIdle=0.8000000
    VeteranModeDropChance=0.1500000
    OldMesh=SkeletalMesh'FP_Weapons.FP_Dude_Shotgun'
    bSpawnMuzzleFlash=true
    MFClass[2]=Class'FX2.MuzzleFlash02'
    MFBoneName="MESH_Shotgun"
    MFRelativeLocation=(X=46.5000000,Y=0.0000000,Z=-1.0000000)
    MFTex=Texture'Timb.muzzle_flash.shotgun_corona'
    MFScale=(Min=1.3000000,Max=1.3000000)
    MFSizeRange=(Min=25.0000000,Max=30.0000000)
    MFLifetime=(Min=0.0500000,Max=0.0500000)
    ShellClass=Class'FX2.P2Shell_12Gauge'
    ShellBoneName="MESH_Shell"
    ShellRelativeLocation=(X=0.0000000,Y=-5.0000000,Z=0.0000000)
    ShellSpeedY=-600.0000000
    ShellSpeedZ=-200.0000000
    AmmoName=Class'ShotGunBulletAmmoInv'
    AutoSwitchPriority=3
    ShakeRotMag=(X=400.0000000,Y=50.0000000,Z=50.0000000)
    ShakeRotTime=2.5000000
    ShakeOffsetMag=(X=20.0000000,Y=4.0000000,Z=4.0000000)
    TraceAccuracy=0.7000000
    aimerror=400.0000000
    AIRating=0.3000000
    MaxRange=512.0000000
    FireSound=Sound'WeaponSounds.shotgun_fire'
    FlashOffsetY=-0.0500000
    FlashOffsetX=0.0600000
    FlashLength=0.0500000
    MuzzleFlashSize=128.0000000
    MFTexture=Texture'Timb.muzzle_flash.shotgun_corona'
    MuzzleFlashScale=2.4000000
    MuzzleFlashStyle=1
    InventoryGroup=3
    GroupOffset=2
    PickupClass=Class'ShotGunPickup'
    BobDamping=1.1200000
    AttachmentClass=Class'ShotgunAttachment'
    ItemName="Shotgun"
    Mesh=SkeletalMesh'MP_Weapons.MP_LS_Shotgun'
    Skins[0]=Texture'MP_FPArms.LS_arms.LS_hands_dude'
    Skins[1]=Texture'WeaponSkins.shotgun_timb'
    Skins[2]=Texture'AnimalSkins.Cat_Orange'
    Skins[3]=Texture'AnimalSkins.Cat_Orange'
    SoundRadius=255.0000000
}