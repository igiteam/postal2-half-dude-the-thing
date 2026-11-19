//=============================================================================
// PistolWeapon
// Copyright 2001 Running With Scissors, Inc.  All Rights Reserved.
//
// Pistol weapon (first and third person).
//
// For AI characters, this weapon scales the number of times it's shot continuously
// with the difficulty level. Higher difficulty--more they shoot in one burst.
//
//	History:
//		07/22/03 NPF	Fires faster per click only in single player. In MP, it
//						fires faster just by holding down the fire button.
//
//		01/11/03 NPF	Allowed pistol to fire faster than firing animation
//						normally permits, if player clicks Fire again.
//
//		01/29/02 MJR	Started history, probably won't be updated again until
//							the pace of change slows down.
//
//
//=============================================================================

class PistolWeapon extends DualCatableWeapon;
//P2DualWieldWeapon;


var bool bCanFireAgain;		// If you're the player and this is set to true, then you
							// shoot again if even you're still in NormalFire

var float WeaponSpeedShoot1MP;	// Allow faster shooting in multiplayer.
var float SPAccuracy;				// How accurate we are in single player games.

const FIRING_WAIT_TIME = 0.4;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
simulated function PostBeginPlay()
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
}

///////////////////////////////////////////////////////////////////////////////
// Fire the weapon
///////////////////////////////////////////////////////////////////////////////
simulated function PlayFiring()
	{
	// Change by Man Chrzan: xPatch 2.0
/*	// Basics
	IncrementFlashCount();
	if(Level.Game == None
		|| !FPSGameInfo(Level.Game).bIsSinglePlayer)
	{
		// Play your sound in MP in your attachment to save bandwidth
		PlayAnim('Shoot1', WeaponSpeedShoot1MP + (WeaponSpeedShoot1Rand*FRand()), 0.05);
	}
	else
	{
		Instigator.PlaySound(FireSound, SLOT_None, 1.0, true, , WeaponFirePitchStart + (FRand()*WeaponFirePitchRand));
		PlayAnim('Shoot1', WeaponSpeedShoot1 + (WeaponSpeedShoot1Rand*FRand()), 0.05);
	}

	// Adv.
	SetupMuzzleFlash();
	// Once the player started his fire, don't let it fire again
	// until the sleep in the NormalFire state let's him
	if(PlayerController(Instigator.Controller) != None)
		bCanFireAgain=false;
	*/
	IncrementFlashCount();
	
	if(Level.Game == None || !FPSGameInfo(Level.Game).bIsSinglePlayer)
		PlayAnim('Shoot1', WeaponSpeedShoot1MP + (WeaponSpeedShoot1Rand*FRand()), 0.05);
	else
		PlayAnim('Shoot1', WeaponSpeedShoot1 + (WeaponSpeedShoot1Rand*FRand()), 0.05);
		
	SetupMuzzleFlash();

	if(PlayerController(Instigator.Controller) != None)
		bCanFireAgain=false;
	
	Super.PlayFiring();
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
	LightHue=12+FRand()*15;
	LightRadius=12+FRand()*6;
}

///////////////////////////////////////////////////////////////////////////////
// Make sure the muzzle flash renders, and move it around some
///////////////////////////////////////////////////////////////////////////////
simulated function SetupMuzzleFlash()
{
	bMuzzleFlash = true;
	bSetFlashTime = false;
	// Gets turned off in weapon, in RenderOverlays
	// Slightly change colors each time
	if(IsFirstPersonView()
		&& bDrawMuzzleFlash)
	{
		PickLightValues();
		bDynamicLight=bAllowDynamicLights;
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// NormalFire
// If we're in here, and it's the player and he presses fire before the fire
// anim is done and *after* the FIRING_WAIT_TIME sleep is over, then we
// let him fire again.
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state NormalFire
{
	ignores AltFire;	// Added by Man Chrzan: bug fix
	
	///////////////////////////////////////////////////////////////////////////////
	// Same as standard ServerFire
	///////////////////////////////////////////////////////////////////////////////
	function ServerFire()
	{
		if(FPSPawn(Instigator).bPlayer
			&& bCanFireAgain)
		{
			if ( AmmoType == None )
			{
				// ammocheck
				log("WARNING "$self$" HAS NO AMMO!!!");
				GiveAmmo(Pawn(Owner));
			}
			if ( AmmoType.HasAmmo() )
			{
				GotoState('NormalFire');
				if ( AmmoType.bInstantHit )
					TraceFire(TraceAccuracy,0,0);
				else
					ProjectileFire();
				LocalFire();
			}
		}
		else
			Super.ServerFire();
	}
	///////////////////////////////////////////////////////////////////////////////
	// Same as standard Fire
	///////////////////////////////////////////////////////////////////////////////
	simulated function Fire( float Value )
	{
		if (FPSPawn(Instigator).bPlayer && bCanFireAgain)
		{
			if ( AmmoType == None
				|| !AmmoType.HasAmmo() )
			{
			ClientForceFinish();
			ServerForceFinish();
				return;
			}

			if ( !RepeatFire() )
				ServerFire();
			else if ( StopFiringTime < Level.TimeSeconds + 0.3 )
			{
				StopFiringTime = Level.TimeSeconds + 0.6;
				ServerRapidFire();
			}
			if ( Role < ROLE_Authority )
			{
				bCanFireAgain=false;
				LocalFire();
				GotoState('ClientFiring');
			}
		}
		else
			Super.Fire(Value);
	}

	///////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////
	simulated function EndState()
	{
		bCanFireAgain=true;
		Super.EndState();
	}
Begin:
	Sleep(FIRING_WAIT_TIME);
	bCanFireAgain=true;
}
state ClientFiring
{
}

///////////////////////////////////////////////////////////////////////////////
// Added by Man Chrzan: xPatch 2.0
///////////////////////////////////////////////////////////////////////////////
function TraceFire( float Accuracy, float YOffset, float ZOffset )
{
	// Reduce the cat ammo if we're using one
	if(CatOnGun == 1)
		CatAmmoLeft--;

	Super.TraceFire(Accuracy, YOffset, ZOffset);
}

// xPatch: Make sure that this gun is not extension!
function bool CanSwapHands()
{
	return (Class == Class'PistolWeapon');
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bCanFireAgain=true
    WeaponSpeedShoot1MP=1.7000000
    SPAccuracy=0.1500000
    StartShotsWithCat=9
    CatFireSound=Sound'WeaponSounds.machinegun_catfire'
    bAttachCat=true
    CatBoneName="MESH_Barrel"
    CatRelativeLocation=(X=0.0000000,Y=-2.0000000,Z=-2.0000000)
    CatRelativeRotation=(Pitch=-16384,Yaw=-16384,Roll=0)
    ViolenceRank=3
    RecognitionDist=900.0000000
    AI_BurstCountExtra=3
    AI_BurstTime=0.8000000
    holdstyle=1
    switchstyle=1
    firingstyle=1
    MinRange=250.0000000
    ShakeOffsetTime=2.2000000
    CombatRating=3.0000000
    FirstPersonMeshSuffix="Pistol"
    WeaponSpeedLoad=1.5000000
    WeaponSpeedReload=1.5000000
    WeaponSpeedHolster=1.5000000
    WeaponSpeedShoot1Rand=0.0400000
    bDropInVeteranMode=2
    OldMesh=SkeletalMesh'FP_Weapons.FP_Dude_Pistol'
    bSpawnMuzzleFlash=true
    MFClass[2]=Class'FX2.MuzzleFlash01'
    MFBoneName="MESH_Barrel"
    MFRelativeLocation=(X=0.0000000,Y=0.0000000,Z=-6.0000000)
    MFTex=Texture'Timb.muzzle_flash.pistol_corona'
    MFScale[0]=(Min=0.8000000,Max=0.8000000)
    MFScale[2]=(Min=0.3000000,Max=0.5000000)
    MFSizeRange[0]=(Min=15.0000000,Max=20.0000000)
    MFSizeRange[2]=(Min=12.0000000,Max=15.0000000)
    MFLifetime[0]=(Min=0.0500000,Max=0.0500000)
    MFLifetime[2]=(Min=0.1000000,Max=0.1500000)
    ShellClass=Class'FX2.P2Shell_Pistol'
    ShellBoneName="MESH_Slide"
    ShellRelativeLocation=(X=0.0000000,Y=2.0000000,Z=-10.0000000)
    ShellSpeedY=350.0000000
    ShellSpeedZ=400.0000000
    ShellTex=Texture'WeaponSkins.brass-01'
    bCheckShell=true
    AmmoName=Class'PistolBulletAmmoInv'
    AutoSwitchPriority=2
    ShakeRotMag=(X=220.0000000,Y=30.0000000,Z=30.0000000)
    ShakeRotTime=2.2000000
    ShakeOffsetMag=(X=10.0000000,Y=2.0000000,Z=2.0000000)
    TraceAccuracy=0.0200000
    aimerror=400.0000000
    AIRating=0.2000000
    MaxRange=1024.0000000
    FireSound=Sound'WeaponSounds.pistol_fire'
    FlashOffsetY=0.1500000
    FlashOffsetX=0.2150000
    FlashLength=0.0100000
    MuzzleFlashSize=128.0000000
    MFTexture=Texture'Timb.muzzle_flash.pistol_corona'
    MuzzleFlashScale=2.4000000
    MuzzleFlashStyle=1
    InventoryGroup=2
    GroupOffset=1
    PickupClass=Class'PistolPickup'
    PlayerViewOffset=(X=0.0000000,Y=0.0000000,Z=-7.0000000)
    BobDamping=1.1200000
    AttachmentClass=Class'PistolAttachment'
    ItemName="Pistol"
    Mesh=SkeletalMesh'MP_Weapons.MP_LS_Pistol'
    Skins[0]=Texture'MP_FPArms.LS_arms.LS_hands_dude'
    Skins[1]=none
    Skins[2]=Texture'WeaponSkins.brass-01'
    SoundRadius=255.0000000
}