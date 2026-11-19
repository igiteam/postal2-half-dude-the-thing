///////////////////////////////////////////////////////////////////////////////
// FlameWeapon
// By: Dopamine, Kamek
// For: Eternal Damnation
//
// Flamethrower weapon for ED.
// Uses a Zippo Lighter and a spray can of some flammable material to shoot
// flames at hapless bystanders.
///////////////////////////////////////////////////////////////////////////////

class FlameWeapon extends P2WeaponStreaming;

///////////////////////////////////////////////////////////////////////////////
// Vars, consts, etc.
///////////////////////////////////////////////////////////////////////////////
var() class<P2Projectile> ProjClass;	// Class of projectile spawned

var bool bBotFiring;
var bool bBotDone;
var() float BotFireTime;				// How often AI pawns should fire this

///////////////////////////////////////////////////////////////////////////////
// BotFire()
//  called by NPC firing weapon.  Weapon chooses appropriate firing mode to use (typically no change)
//  bFinished should only be true if called from the Finished() function
//  FiringMode can be passed in to specify a firing mode (used by scripted sequences)
//
// This was copied from Weapon but changed a lot.
///////////////////////////////////////////////////////////////////////////////
function bool BotFire(bool bFinished, optional name FiringMode)
{
	if ( !bFinished && !IsIdle() )
		return false;
	Instigator.Controller.bFire = 1;
	Instigator.Controller.bAltFire = 0;

	bBotFiring = True;
	bBotDone = False;
	Fire(1.0);

	return true;
}

///////////////////////////////////////////////////////////////////////////////
// Initialize the spawned projectile
///////////////////////////////////////////////////////////////////////////////
function SpecificInits(P2Projectile SpawnedProj)
{
	// STUB. Nothing needed here yet.
}

/*
///////////////////////////////////////////////////////////////////////////////
// Set first person hands texture
///////////////////////////////////////////////////////////////////////////////
simulated function ChangeHandTexture(Texture NewHandsTexture, Texture DefHandsTexture, Texture NewFootTexture)
{
	Skins[2] = NewHandsTexture;
}
*/

///////////////////////////////////////////////////////////////////////////////
// Spawn the flamethrower projectile
// Technically, we're supposed to do this in the ammo, not here in the weapon
///////////////////////////////////////////////////////////////////////////////
function SpawnFlame()
{
	local vector StartTrace, X,Y,Z;
	local P2Projectile FProj;

	// Get spawn location
	GetAxes(Instigator.GetViewRotation(),X,Y,Z);
	StartTrace = GetFireStart(X,Y,Z);
	AdjustedAim = Instigator.AdjustAim(AmmoType, StartTrace, 2*AimError);

	// Spawn the projectile
	FProj = spawn(ProjClass, Instigator,, StartTrace, AdjustedAim);

	// Initialize the projectile
	SpecificInits(FProj);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// Streaming
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state Streaming
{
	///////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////
	simulated function AnimEnd(int Channel)
	{
		// If it's the guy playing that hosts the listen server
		// or it's a typical client/stand alone game.
		if(NotDedOnServer())
		{
			// Let bystanders shoot us
			if(AmmoType.HasAmmo() && (
			Instigator.PressingFire()
			|| (bBotFiring && bBotDone)
			)
			)
			{
				PlayFiring();
			}
			else
			{
				EndStreaming();
				ServerEndStreaming();
			}
		}
	}

	///////////////////////////////////////////////////////////////////////////////
	// Reduce our ammo, spawn flames
	///////////////////////////////////////////////////////////////////////////////
	simulated event Tick( float DeltaTime )
	{
		if (Role == ROLE_Authority)
			if (ReduceAmmo(DeltaTime))
				SpawnFlame();

		Super.Tick(DeltaTime);
/*
		// If it's the guy playing that hosts the listen server
		// or it's a typical client/stand alone game.
		if(NotDedOnServer())
		{
			// Cut immediately if you stop early
			if(!Instigator.PressingFire())
			{
				// Replicate to the tell the server to stop
				ServerEndStreaming();
				// Client stops using this
				if(Level.NetMode != NM_Standalone)
					EndStreaming();
			}
		}
*/
	}
	///////////////////////////////////////////////////////////////////////////////
	// Set to seeking when you get to this state
	///////////////////////////////////////////////////////////////////////////////
	simulated event BeginState()
	{
		PlayFiring();
		if (bBotFiring)
			SetTimer(BotFireTime, false);
	}

	simulated event Timer()
	{
		bBotDone = True;
	}
}

///////////////////////////////////////////////////////////////////////////////
// Added by Man Chrzan: xPatch 2.0 
// Fix for sometimes skiping PrepFire animation.
///////////////////////////////////////////////////////////////////////////////
state Idle
{
	simulated function BeginState()
		{
		// If instigator doesn't want to fire anymore then we can finally
		// end the whole pouring sequence.
		if (!Instigator.PressingFire())
			{
			if (Owner != None)
				ForceEndFire();
			}
		}
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////


// Decompiled with UE Explorer.
defaultproperties
{
    ProjClass=Class'FlameProjectile'
    BotFireTime=5.0000000
    soundStart=Sound'AW7Sounds.flame.FlameIn'
    soundLoop1=Sound'AW7Sounds.flame.FlameLoop'
    soundEnd=Sound'AW7Sounds.flame.FlameOut'
    AmmoUseRate=10.0000000
    bDelayedStartSound=true
    WeaponSpeedPrep=0.8000000
    WeaponSpeedEnd=0.8000000
    ViolenceRank=1
    RecognitionDist=500.0000000
    AI_BurstCountExtra=10
    AI_BurstCountMin=5
    holdstyle=8
    switchstyle=1
    firingstyle=1
    bNoHudReticle=true
    ShakeOffsetTime=0.0000000
    PlayerMeleeDist=120.0000000
    NPCMeleeDist=80.0000000
    CombatRating=1.2000000
    WeaponSpeedLoad=1.2000000
    WeaponSpeedReload=1.2500000
    WeaponSpeedShoot1Rand=1.0000000
    AmmoName=Class'FlameAmmoInv'
    FireOffset=(X=50.0000000,Y=-7.0000000,Z=-20.0000000)
    ShakeRotMag=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    ShakeRotRate=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    ShakeRotTime=0.0000000
    ShakeOffsetMag=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    ShakeOffsetRate=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    TraceAccuracy=0.0100000
    aimerror=0.0000000
    AIRating=0.1000000
    MaxRange=100.0000000
    InventoryGroup=5
    GroupOffset=10
    PickupClass=Class'FlamePickup'
    PlayerViewOffset=(X=0.0000000,Y=-8.0000000,Z=-10.0000000)
    BobDamping=1.1200000
    ThirdPersonRelativeLocation=(X=8.0000000,Y=-3.0000000,Z=-5.0000000)
    AttachmentClass=Class'FlameAttachment'
    ItemName="Flamethrower"
    Mesh=SkeletalMesh'ED_Weapons.ED_FlameThrower_NEW'
    Skins[0]=Texture'ED_WeaponSkins.Melee.trippo'
    Skins[1]=Texture'ED_WeaponSkins.Melee.lynx'
    Skins[2]=Texture'MP_FPArms.LS_arms.LS_hands_dude'
}