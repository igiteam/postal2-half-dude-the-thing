///////////////////////////////////////////////////////////////////////////////
// MatchesWeapon
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Gas can weapon (first and third person).
//
//	History:
//		05/31/02 NPF	Started history, probably won't be updated again until
//							the pace of change slows down.
//
///////////////////////////////////////////////////////////////////////////////

class MatchesWeapon extends P2Weapon;


///////////////////////////////////////////////////////////////////////////////
// Vars, structs, consts
///////////////////////////////////////////////////////////////////////////////

var Sound	soundMatchStrike;
var bool bAltFiring;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
simulated function PlayFiring()
	{
	// This "throw the match" animation must include a notification that
	// call Notify_LightMatch() in order for the match to actually work!
	bAltFiring = false;
	PlayAnim('Shoot1', WeaponSpeedShoot1, 0.05);
	IncrementFlashCount();
	}
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
simulated function PlayAltFiring()
	{
	// This "throw the match" animation must include a notification that
	// call Notify_LightMatch() in order for the match to actually work!
	bAltFiring = true;
	PlayAnim('Shoot1', WeaponSpeedShoot1, 0.05);
	IncrementFlashCount();
	}

///////////////////////////////////////////////////////////////////////////////
// Stub these two out so this doesn't 'fire'
///////////////////////////////////////////////////////////////////////////////
function TraceFire( float Accuracy, float YOffset, float ZOffset );
function ProjectileFire();

///////////////////////////////////////////////////////////////////////////////
// Generate a match
//
// MP don't make this simulated or it will generate two matches
///////////////////////////////////////////////////////////////////////////////
function GenerateMatch()
{
	local vector HitLocation, HitNormal, StartTrace, EndTrace, X,Y,Z;
	local actor HitActor;
	local FireMatch thematch;
	
	GetAxes(Instigator.GetViewRotation(),X,Y,Z);
	StartTrace = GetFireStart(X,Y,Z); 
	AdjustedAim = Instigator.AdjustAim(AmmoType, StartTrace, 2*AimError);	
	HitActor = Trace(HitLocation, HitNormal, Instigator.Location, StartTrace, true);
	if(HitActor == None
		|| (!HitActor.bStatic
			&& !HitActor.bWorldGeometry))
	{
		thematch = spawn(class'FireMatch',Instigator,,StartTrace, AdjustedAim);
		if(thematch != None)
		{
			// Touch any actor that was in between, just in case.
			if(HitActor != None)
			{
				HitActor.Touch(thematch);
				thematch.Touch(HitActor);
			}
		}
	}
}
function GenerateMatches()
{
	local vector HitLocation, HitNormal, StartTrace, EndTrace, X,Y,Z;
	local actor HitActor;
	local FireMatch thematch;
	local int i,j;	
	const MAX = 2.0;
	const ANGLE = 2048;
	const FUZZ = 1024;
	
	for (i=0-MAX; i<=MAX; i++)
	{
		for (j=0-MAX; j<=MAX; j++)
		{
			GetAxes(Instigator.GetViewRotation(),X,Y,Z);
			StartTrace = GetFireStart(X,Y,Z); 
			AdjustedAim = Instigator.AdjustAim(AmmoType, StartTrace, 2*AimError);
			AdjustedAim.Yaw = (AdjustedAim.Yaw + int(ANGLE*j/MAX) + FRand() * FUZZ - FUZZ / 2);
			AdjustedAim.Pitch = (AdjustedAim.Pitch + int(ANGLE*i/MAX) + FRand() * FUZZ - FUZZ / 2);
			HitActor = Trace(HitLocation, HitNormal, Instigator.Location, StartTrace, true);
			if(HitActor == None
				|| (!HitActor.bStatic
					&& !HitActor.bWorldGeometry))
			{
				thematch = spawn(class'FireMatch',Instigator,,StartTrace, AdjustedAim);
				if(thematch != None)
				{
					// Touch any actor that was in between, just in case.
					if(HitActor != None)
					{
						HitActor.Touch(thematch);
						thematch.Touch(HitActor);
					}
				}
			}
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
// Animation notification called when the correct point is reached in the
// "light the match" animation.
//
// MP don't make this simulated or it will generate two matches
///////////////////////////////////////////////////////////////////////////////
function Notify_LightMatch()
	{
	// Sound is happening in the anim
	//Instigator.PlayOwnedSound(soundMatchStrike, SLOT_None, 1.0,,,GetRandPitch());
	if (P2GameInfoSingle(Level.Game) != None
		&& P2GameInfoSingle(Level.Game).VerifySeqTime()
		&& bAltFiring
		&& Pawn(Owner).Controller.bIsPlayer)
		GenerateMatches();
	else
		GenerateMatch();
	}


///////////////////////////////////////////////////////////////////////////////
// Return the switch priority of the weapon (normally AutoSwitchPriority, but may be
// modified by environment (or by other factors for bots)
///////////////////////////////////////////////////////////////////////////////
simulated function float SwitchPriority() 
{
	local float temp;

	//log(self$" switch priority");
	//log("Instigator "$Instigator);
	//log("AmmoType "$AmmoType);
	//log("Owner "$Owner);

	if (Instigator != None 
		&& !Instigator.IsHumanControlled() )
		return RateSelf();
	else if ( !bJustMade
		&& (AmmoType != None && !AmmoType.HasAmmo()) )
	{
		if ( Pawn(Owner).Weapon == self )
			return -0.5;
		else
			return -1;
	}
	else 
	{
		if(Instigator != None
			&& Instigator.Weapon != None
			&& Instigator.Weapon.IsA('GasCanWeapon'))
			return 1000;	// if you're a gas can,and you ran out of ammo, you definitely want
							// to switch the matches next.
		else
			return default.AutoSwitchPriority;
	}
}

// xPatch: Make sure that this gun is not extension!
function bool CanSwapHands()
{
	return (Class == Class'MatchesWeapon');
}


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    soundMatchStrike=Sound'WeaponSounds.match_light'
    bUsesAltFire=true
    bArrestableWeapon=true
    holdstyle=8
    switchstyle=8
    firingstyle=8
    ShakeOffsetTime=0.0000000
    DropWeaponHint1="They've seen your weapon!"
    DropWeaponHint2="Press %KEY_ThrowWeapon% to drop it."
    bBumpStartsFight=false
    FirstPersonMeshSuffix="MatchBox"
    WeaponSpeedLoad=2.0000000
    WeaponSpeedReload=2.0000000
    WeaponSpeedHolster=2.0000000
    WeaponSpeedShoot1=2.4000000
    WeaponSpeedShoot1Rand=0.6000000
    WeaponSpeedShoot2=2.4000000
    WeaponSpeedShoot2Rand=0.6000000
    bCannotBeStolen=true
    OldMesh=SkeletalMesh'FP_Weapons.FP_Dude_MatchBox'
    AmmoName=Class'MatchesAmmoInv'
    bCanThrow=false
    AutoSwitchPriority=0
    FireOffset=(X=40.0000000,Y=5.0000000,Z=-10.0000000)
    ShakeRotMag=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    ShakeRotRate=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    ShakeRotTime=0.0000000
    ShakeOffsetMag=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    ShakeOffsetRate=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    TraceAccuracy=0.9000000
    aimerror=0.0000000
    AIRating=0.0200000
    SelectSound=none
    InventoryGroup=5
    GroupOffset=1
    BobDamping=1.1200000
    AttachmentClass=Class'MatchesAttachment'
    ItemName="Matches"
    Mesh=SkeletalMesh'MP_Weapons.MP_LS_Matchbox'
    Skins[0]=Texture'MP_FPArms.LS_arms.LS_hands_dude'
}