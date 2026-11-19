///////////////////////////////////////////////////////////////////////////////
// Beta Shotgun.
// Edited by Man Chrzan.
//
// Added alt-fire, cat-silencer, removed unnecessary spaghetti code.
///////////////////////////////////////////////////////////////////////////////

class BetaShotgunWeapon extends CatableWeapon;

///////////////////////////////////////////////////////////////////////////////
// Vars, structs, consts
///////////////////////////////////////////////////////////////////////////////
var int AltShotCountMaxForNotify;
var int AltShotAmmoUse;
var texture BetaGimpHands;
var texture BetaCopHands;

// Network replication
replication
{
	reliable if( bNetOwner && bNetDirty && (Role==ROLE_Authority) )
		Notify_AltFire;
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
		// Based on the difficulty, bump up the number of times AI will continuously
		// shoot this weapon
		diffoffset = P2GameInfo(Level.Game).GetDifficultyOffset();
		if(diffoffset > 0)
		{
			AI_BurstCountExtra+=(diffoffset/2);
		}
	}
	
	// If it's enhanced game we don't do reloads.
	if(P2GameInfoSingle(Level.Game).VerifySeqTime()
		&& Pawn(Owner).Controller.bIsPlayer )
	{
	    default.ReloadCount=0;
		ReloadCount=0;
	}
	else if(default.ReloadCount == 0)
	{
		default.ReloadCount=6;
	}
	
	// Give new HudHint2 in place of HudHint1
	// Do this this way to prevent problems with outdated .int localizations etc.
	HudHint1=HudHint2;	
	HudHint2="";
}

///////////////////////////////////////////////////////////////////////////////
// Called after a saved game has been loaded
///////////////////////////////////////////////////////////////////////////////
event PostLoadGame()
{
	Super.PostLoadGame();
	
	// If it's enhanced game we don't do reloads.
	if(P2GameInfoSingle(Level.Game).VerifySeqTime()
		&& Pawn(Owner).Controller.bIsPlayer )
	{
	    default.ReloadCount=0;
		ReloadCount=0;
	}
	else if(default.ReloadCount == 0)
	{
		default.ReloadCount=6;
	}
}

///////////////////////////////////////////////////////////////////////////////
// Reloading
///////////////////////////////////////////////////////////////////////////////
simulated function PlayReloading()
{
	// First-Person Reload
	PlayAnim('Reload', WeaponSpeedReload, 0.05);
	
	// Third-Person Reload
	P2MocapPawn(Instigator).PlayWeaponReload(self);
}

simulated function ServerForceReload()
{
	bForceReload = true;

	PlayReloading();
	
	if (ReloadCount != default.ReloadCount && HasAmmo())
	{
        GotoState('Reloading');
    }
}

///////////////////////////////////////////////////////////////////////////////
// Alternative Fire
///////////////////////////////////////////////////////////////////////////////
simulated function PlayAltFiring()
{
	PlayAnim('Shoot2', WeaponSpeedShoot2, 0.05);
}

function bool CanAltFire()
{
	if(P2GameInfoSingle(Level.Game).VerifySeqTime() && Pawn(Owner).Controller.bIsPlayer)
		return (AmmoType.AmmoAmount >= AltShotAmmoUse);
	else
		return (ReloadCount >= AltShotAmmoUse);
}

simulated function AltFire( float Value )
{
	// Needs 2 shells to alt fire
	if (!CanAltFire()) 
		return;

	if ( !RepeatFire() )
		ServerAltFire();

	if ( Role < ROLE_Authority
		&& bUsesAltFire)
	{
		LocalAltFire();
		GotoState('ClientFiring');
	}
}

function ServerAltFire()
{
	TurnOffHint();
		
	if ( AmmoType == None )
	{
		log("WARNING "$self$" HAS NO AMMO!!!");
		GiveAmmo(Pawn(Owner));
	}
	if ( HasAmmo()
		&& bUsesAltFire)
	{
		bAltFiring=true;
		
		GotoState('NormalFire');
		LocalAltFire();	
	}
}

simulated function LocalAltFire()
{
	bPointing = true;
	PlayAltFiring();
}

///////////////////////////////////////////////////////////////////////////////
// See what we hit 
///////////////////////////////////////////////////////////////////////////////
simulated function TraceFire( float Accuracy, float YOffset, float ZOffset )
{
	local int i;
	
	// Reduce the cat ammo if we're using one
	if(CatOnGun == 1)
		CatAmmoLeft--;
	
	// Reduce ammo if we are not reloadable (enhanced game)
	if(default.ReloadCount == 0)
		P2AmmoInv(AmmoType).UseAmmoForShot(); 
	
	for(i=0; i<ShotCountMaxForNotify; i++)
	{
	    Super.TraceFire(TraceAccuracy,0,0);
    }
}

///////////////////////////////////////////////////////////////////////////////
// See what we hit - alt-fire
///////////////////////////////////////////////////////////////////////////////
simulated function TraceAltFire( float Accuracy, float YOffset, float ZOffset )
{
	local int i;
	
	for(i=0; i<AltShotCountMaxForNotify; i++)
	{
	    Super.TraceFire(TraceAccuracy,0,0);
    }
}

function Notify_AltFire()
{
	local bool bEnhancedMode;
	local PlayerController P;
	local float UsePitch;
	
	bEnhancedMode = P2GameInfoSingle(Level.Game).VerifySeqTime();
	
	// Reduce the cat ammo if we're using one
	if(CatOnGun == 1)
	{
		if (CatAmmoLeft >= AltShotAmmoUse)
			CatAmmoLeft-=AltShotAmmoUse;
		else
			CatAmmoLeft--;
	}
	
	// If the cat is on the gun and we want it to fly off, then set it up to fly off,
	// by switching the animation
	if(CatOnGun==1)
		{
		// Switch to special sound
		AltFireSound=CatFireSound;
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
		AltFireSound=Default.AltFireSound;
		UsePitch = WeaponFirePitchStart + (FRand()*WeaponFirePitchRand);
		}
	
	
    // Notified in Amnimation? FIRE!
	if ( AmmoType.bInstantHit )
			TraceAltFire(TraceAccuracy,0,0);
		else
			ProjectileAltFire();
	
	// MuzzleFlash
	bAltFiring=True;
	SetupMuzzleFlashEmitter();
	
	// 3rd Person MuzzleFlash
	IncrementFlashCount();

	// Use ammo (or ReloadCount)
	if(bEnhancedMode) 
		P2AmmoInv(AmmoType).UseAmmoForShot(AltShotAmmoUse); 
    else 
		ReloadCount -= AltShotAmmoUse;
	
	// camera shake effect
	if ( (Instigator != None) && Instigator.IsLocallyControlled() )
	{
		P = PlayerController(Instigator.Controller);
		if (P!=None)
		{
			if ( InstFlash != 0.0 )
				P.ClientInstantFlash( InstFlash, InstFog);

			P.ShakeView(ShakeRotMag * AltShotAmmoUse, ShakeRotRate, ShakeRotTime,
						ShakeOffsetMag * AltShotAmmoUse, ShakeOffsetRate, ShakeOffsetTime);
		}
	}
	
	// Play MP sounds on everyone's computers
	if(Level.Game == None
		|| !FPSGameInfo(Level.Game).bIsSinglePlayer)
		PlayOwnedSound(AltFireSound,SLOT_Interact,1.5,,,WeaponFirePitchStart + (FRand()*WeaponFirePitchRand),false);
	else // just on yours in SP games
		Instigator.PlaySound(AltFireSound, SLOT_None, 1.5, true, , WeaponFirePitchStart + (FRand()*WeaponFirePitchRand));
}

///////////////////////////////////////////////////////////////////////////////
// Set first person hands texture
///////////////////////////////////////////////////////////////////////////////
simulated function ChangeHandTexture(Texture NewHandsTexture, Texture DefHandsTexture, Texture NewFootTexture)
{
	local Texture GimpHands;
	local Texture CopHands;
	
	GimpHands = Class'GimpClothesInv'.default.HandsTexture;
	CopHands = Class'CopClothesInv'.default.HandsTexture;
	
	if(NewHandsTexture == GimpHands)
		Skins[0] = BetaGimpHands;
	else if(NewHandsTexture == CopHands)
		Skins[0] = BetaCopHands;	
	else
		Skins[0] = Default.Skins[0];
}

///////////////////////////////////////////////////////////////////////////////
// Decides which effects to spawn
///////////////////////////////////////////////////////////////////////////////
simulated function SetupMuzzleFlashEmitter() 
{
	if (IsFirstPersonView() && bSpawnMuzzleFlash)
	{
		// Spawn Effect
		if(bAltFiring && MFClass[1] != none && MFType == 0)
			PlayFireEffects(MFClass[1], 1);
		else 
		{
			if (MFType == 1 && MFClass[2] != None)
				PlayFireEffects(MFClass[2], 2); 
			else
				PlayFireEffects(MFClass[0], 0);
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    AltShotCountMaxForNotify=12
    AltShotAmmoUse=2
    BetaGimpHands=Texture'xPatchTex.Weapons.BetaShotgun_gimpArms'
    BetaCopHands=Texture'xPatchTex.Weapons.BetaShotgun_copArms'
    StartShotsWithCat=9
    CatFireSound=Sound'WeaponSounds.shotgun_catfire'
    bAttachCat=true
    CatBoneName="MESH_Trigger"
    CatRelativeLocation=(X=-70.0000000,Y=-8.0000000,Z=0.0000000)
    CatRelativeRotation=(Pitch=32768,Yaw=0,Roll=-16384)
    bUsesAltFire=true
    ViolenceRank=3
    RecognitionDist=1100.0000000
    ShotCountMaxForNotify=6
    AI_BurstCountMin=3
    holdstyle=5
    switchstyle=5
    firingstyle=5
    MinRange=200.0000000
    ShakeOffsetTime=2.5000000
    bAllowHints=true
    bShowHints=true
    HudHint1="Press %KEY_AltFire% to reload manually."
    HudHint2="Press %KEY_AltFire% to fire two shells."
    CombatRating=4.0000000
    FirstPersonMeshSuffix="Hidden_Shotgun"
    WeaponSpeedLoad=1.5000000
    WeaponSpeedHolster=1.5000000
    WeaponSpeedShoot1Rand=0.3000000
    WeaponSpeedIdle=0.8000000
    AltFireSound=Sound'WeaponSoundsToo.BetaShotgunAlt'
    OverrideHUDIcon=Texture'EDHud.hud_OriginalShotgun'
    bReloadableWeapon=true
    bNoHudReticleReload=true
    bAllowReloadHints=true
    bSpawnMuzzleFlash=true
    MFClass[1]=Class'Postal2Game.xMuzzleFlashEmitter'
    MFClass[2]=Class'FX2.MuzzleFlash02'
    MFBoneName="MESH_Trigger"
    MFRelativeLocation=(X=-73.0000000,Y=-3.5000000,Z=0.0000000)
    MFTex[0]=Texture'nathans.muzzleflashes.mf_shotgun_new'
    MFTex[1]=Texture'nathans.muzzleflashes.mf_shotgun_new'
    MFScale[0]=(Min=1.3000000,Max=1.3000000)
    MFScale[1]=(Min=2.2000000,Max=2.2000000)
    MFSizeRange[0]=(Min=25.0000000,Max=30.0000000)
    MFSizeRange[1]=(Min=50.0000000,Max=60.0000000)
    MFLifetime[0]=(Min=0.0500000,Max=0.0500000)
    MFLifetime[1]=(Min=0.0500000,Max=0.0500000)
    AmmoName=Class'Inventory.ShotGunBulletAmmoInv'
    ReloadCount=6
    AutoSwitchPriority=3
    ShakeRotMag=(X=400.0000000,Y=50.0000000,Z=50.0000000)
    ShakeRotTime=2.5000000
    ShakeOffsetMag=(X=20.0000000,Y=4.0000000,Z=4.0000000)
    TraceAccuracy=1.4000000
    aimerror=400.0000000
    AIRating=0.3000000
    MaxRange=512.0000000
    FireSound=Sound'WeaponSoundsToo.BetaShotgun'
    InventoryGroup=3
    GroupOffset=4
    PickupClass=Class'BetaShotgunPickup'
    PlayerViewOffset=(X=-2.5000000,Y=-0.7500000,Z=-7.5000000)
    BobDamping=1.1500000
    ThirdPersonRelativeLocation=(X=14.0000000,Y=0.0000000,Z=1.0000000)
    ThirdPersonRelativeRotation=(Pitch=-512,Yaw=0,Roll=0)
    AttachmentClass=Class'BetaShotgunAttachment'
    ItemName="Beta Shotgun"
    Mesh=SkeletalMesh'ED_Weapons.Hidden_Shotgun'
    Skins[0]=Texture'xPatchTex.Weapons.BetaShotgun_dudeArms'
    Skins[1]=Texture'ED_WeaponSkins.shotgun'
    SoundRadius=255.0000000
}