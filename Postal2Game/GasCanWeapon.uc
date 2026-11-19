///////////////////////////////////////////////////////////////////////////////
// GasCanWeapon
// Copyright 2001 Running With Scissors, Inc.  All Rights Reserved.
//
// Gas can weapon (first and third person).
//
//	History:
//		01/29/02 MJR	Started history, probably won't be updated again until
//							the pace of change slows down.
//
///////////////////////////////////////////////////////////////////////////////

class GasCanWeapon extends P2WeaponStreaming;

///////////////////////////////////////////////////////////////////////////////
// Vars, structs, consts
///////////////////////////////////////////////////////////////////////////////

var GasPourFeeder gaspour;
var bool	bPerformingAltFire;
var Sound	soundMatchStrike;
var() Rotator FireRotator;

const MATCH_LAUNCH_VEL_MAG	=	800;

// Change by NickP: MP fix
replication
{
	// functions client sends to server
	reliable if (Role < ROLE_Authority)
		xCallEndStream;
}

function xCallEndStream()
{
	GotoState('EndStream');
}
// End

///////////////////////////////////////////////////////////////////////////////
// Play animation/sound/etc
///////////////////////////////////////////////////////////////////////////////
simulated function PlayAltFiring()
	{
	// This "throw the match" animation must include a notification that
	// call Notify_LightMatch() in order for the match to actually work!
	PlayAnim('Shoot2', WeaponSpeedShoot2, 0.05);
	}

///////////////////////////////////////////////////////////////////////////////
// we don't shoot things
///////////////////////////////////////////////////////////////////////////////
function TraceFire( float Accuracy, float YOffset, float ZOffset )
	{
	// STUB
	}

///////////////////////////////////////////////////////////////////////////////
// Make the gas pour go to the end of the gun and orient itself
///////////////////////////////////////////////////////////////////////////////
function SnapGasPourToGun(optional bool bInitArc)
	{
	local vector startpos, X,Y,Z;
	local vector forward;
	local Rotator myrot;

	// orient gas pour and reposition
	myrot = Instigator.GetViewRotation();
	myrot.Pitch += FireRotator.Pitch;
	myrot.Pitch = myrot.Pitch & 65535;
	myrot.Yaw += FireRotator.Yaw;
	myrot.Yaw = myrot.Yaw & 65535;
	myrot.Roll += FireRotator.Roll;
	myrot.Roll = myrot.Roll & 65535;

	GetAxes(myrot,X,Y,Z);
	forward = Normal(vector(myrot));
	startpos = GetFireStart(X,Y,Z);// + forward*4;
	gaspour.SetLocation(startpos);
	gaspour.SetDir(startpos, vector(myrot),,bInitArc);
	}


///////////////////////////////////////////////////////////////////////////////
// Generate a match
///////////////////////////////////////////////////////////////////////////////
function GenerateMatch()
	{
	local vector HitLocation, HitNormal, StartTrace, EndTrace, X,Y,Z;
	local actor Other;
	local FireMatch thematch;

	GetAxes(Instigator.GetViewRotation(),X,Y,Z);
	StartTrace = GetFireStart(X,Y,Z);
	AdjustedAim = Instigator.AdjustAim(AmmoType, StartTrace, 2*AimError);
	thematch = spawn(class'FireMatch',Instigator,,StartTrace, AdjustedAim);
	if(thematch != None)
		thematch.Velocity = MATCH_LAUNCH_VEL_MAG*Normal(vector(thematch.Rotation));
	}
/*
///////////////////////////////////////////////////////////////////////////////
//
///////////////////////////////////////////////////////////////////////////////
simulated function LocalAltFire()
	{
	PlayAltFiring();
	}
*/

///////////////////////////////////////////////////////////////////////////////
//
///////////////////////////////////////////////////////////////////////////////
function ServerAltFire()
	{
	bPerformingAltFire=true;

	GotoState('AltFireState');
	LocalAltFire();
	}


///////////////////////////////////////////////////////////////////////////////
//
///////////////////////////////////////////////////////////////////////////////
function ServerFire()
	{
	bPerformingAltFire=false;

	Super.ServerFire();
	}

///////////////////////////////////////////////////////////////////////////////
// Terminate the stream
///////////////////////////////////////////////////////////////////////////////
simulated function bool ForceEndFire()
	{
	if(gaspour != None)
		{
		gaspour.ToggleFlow(0.0, false);
		gaspour = None;
		return Super.ForceEndFire();
		}
	return false;
	}

///////////////////////////////////////////////////////////////////////////////
// Animation notification called when the correct point is reached in the
// "light the match" animation.
///////////////////////////////////////////////////////////////////////////////
simulated function Notify_LightMatch()
	{
	// Generates this in anim
	//Instigator.PlaySound(soundMatchStrike, SLOT_None, 1.0);
	GenerateMatch();
	TurnOffHint();
	}

///////////////////////////////////////////////////////////////////////////////
// Streaming, make gas come out in this mode
///////////////////////////////////////////////////////////////////////////////
simulated state Streaming
{
	simulated function Tick( float DeltaTime )
	{
		// Change by NickP: MP fix
		/*// Cut immediately if you stop early
		if(!Instigator.PressingFire())
			GotoState('EndStream');
		else
		{
			SnapGasPourToGun();

			ReduceAmmo(DeltaTime);
		}*/
		// Cut immediately if you stop early
		if( NotDedOnServer() )
		{
			if( !Instigator.PressingFire() )
			{
				xCallEndStream();
				GotoState('EndStream');
			}
		}
		///steam 12/10/2016
		if( AmmoType != None && AmmoType.HasAmmo() 
			&& gaspour != None ) // Change by Man Chrzan: Possible Crash Fix
		{
			SnapGasPourToGun();
			ReduceAmmo(DeltaTime);
		}
		else
		{
			xCallEndStream();
			GotoState('EndStream');
		}
		// End
	}

	simulated function EndState()
	{
		Super.EndState();
		ForceEndFire();
	}

	simulated function BeginState()
	{
		Super.BeginState();
		gaspour = spawn(class'GasPourFeeder',Instigator,,,Rotation);
		gaspour.MyOwner = Owner;
		SnapGasPourToGun(true);
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state Idle
	{
	function BeginState()
		{

		bPerformingAltFire=false;

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
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state AltFireState extends NormalFire
{
	function Tick( float DeltaTime )
		{
		if(!bPerformingAltFire)
			SnapGasPourToGun();
		}
}

// xPatch: Make sure that this gun is not extension!
function bool CanSwapHands()
{
	return (Class == Class'GasCanWeapon');
}


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    soundMatchStrike=Sound'WeaponSounds.match_light'
    FireRotator=(Pitch=0,Yaw=-1500,Roll=0)
    soundStart=Sound'WeaponSounds.GasCan_Start'
    soundLoop1=Sound'WeaponSounds.GasCan_Loop'
    soundLoop2=Sound'WeaponSounds.GasCan_Loop'
    soundEnd=Sound'WeaponSounds.GasCan_End'
    bUsesAltFire=true
    ViolenceRank=1
    RecognitionDist=900.0000000
    holdstyle=6
    switchstyle=7
    firingstyle=6
    bNoHudReticle=true
    ShakeOffsetTime=2.0000000
    PlayerMeleeDist=200.0000000
    NPCMeleeDist=200.0000000
    bAllowHints=true
    bShowHints=true
    HudHint1="Press %KEY_AltFire% to toss a match."
    bBumpStartsFight=false
    FirstPersonMeshSuffix="GasCan"
    WeaponSpeedLoad=1.5000000
    WeaponSpeedReload=1.5000000
    WeaponSpeedHolster=1.5000000
    WeaponSpeedShoot1Rand=0.2000000
    OldMesh=SkeletalMesh'FP_Weapons.FP_Dude_GasCan'
    AmmoName=Class'GasCanBulletAmmoInv'
    AutoSwitchPriority=5
    FireOffset=(X=40.0000000,Y=10.0000000,Z=-1.0000000)
    TraceAccuracy=0.9000000
    bMeleeWeapon=true
    aimerror=0.0000000
    AIRating=0.1500000
    InventoryGroup=5
    GroupOffset=2
    PickupClass=Class'GasCanPickup'
    PlayerViewOffset=(X=4.0000000,Y=0.0000000,Z=-6.0000000)
    BobDamping=1.1200000
    AttachmentClass=Class'GasCanAttachment'
    ItemName="Gas Can"
    Mesh=SkeletalMesh'MP_Weapons.MP_LS_GasCan'
    Skins[0]=Texture'MP_FPArms.LS_arms.LS_hands_dude'
}