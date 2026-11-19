///////////////////////////////////////////////////////////////////////////////
// BatonWeapon
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Police baton weapon (first and third person).
//
// Low damage bludgeoning attacks.
//
// Enhanced mode: explodes heads with one hit.
//
///////////////////////////////////////////////////////////////////////////////

class BatonWeapon extends ShovelWeapon;

///////////////////////////////////////////////////////////////////////////////
// xPatch: Classic Mode Stuff + Fix for some old Baton Extensions
///////////////////////////////////////////////////////////////////////////////
function DrewBlood()
{
	if( class != class'BatonWeapon' || P2GameInfoSingle(Level.Game).GetClassicMelee())
		return;
		
	Super(P2BloodWeapon).DrewBlood();
}

// xPatch: Make sure that this gun is not extension!
function bool CanSwapHands()
{
	return (Class == Class'BatonWeapon');
}


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    BloodTextures=/* Array type was not detected. */
    RecognitionDist=600.0000000
    AI_BurstCountExtra=2
    AI_BurstTime=1.0000000
    switchstyle=1
    ShakeOffsetTime=3.0000000
    PlayerMeleeDist=100.0000000
    NPCMeleeDist=90.0000000
    HudHint2="Press %KEY_AltFire% to bash."
    CombatRating=1.0000000
    FirstPersonMeshSuffix="Baton"
    WeaponSpeedLoad=1.2500000
    WeaponSpeedShoot1=0.9000000
    WeaponSpeedShoot1Rand=0.2000000
    WeaponSpeedShoot2=0.9000000
    WeaponSpeedIdle=0.3000000
    bAllowMiddleFinger=true
    OldMesh=SkeletalMesh'FP_Weapons.FP_Dude_Baton'
    AmmoName=Class'BatonAmmoInv'
    FireOffset=(X=2.0000000,Y=0.0000000,Z=-1.0000000)
    ShakeRotMag=(X=30.0000000,Y=250.0000000,Z=30.0000000)
    ShakeRotTime=3.0000000
    ShakeOffsetMag=(X=0.0000000,Y=6.0000000,Z=0.0000000)
    TraceAccuracy=0.1000000
    AIRating=0.1000000
    MaxRange=90.0000000
    GroupOffset=2
    PickupClass=Class'BatonPickup'
    PlayerViewOffset=(X=1.0000000,Y=0.0000000,Z=-18.0000000)
    AttachmentClass=Class'BatonAttachment'
    ItemName="Baton"
    Mesh=SkeletalMesh'MP_Weapons.MP_LS_Baton'
    Skins[0]=Texture'MP_FPArms.LS_arms.LS_hands_dude'
    Skins[1]=Texture'WeaponSkins.baton_timb'
}