//////////////////////////////////////////////////////////////////////////////////////////////////
// SawnOffWeapon.uc
//
// Edited by Man Chrzan
// Brand new clean code, better balancing and new feature -- dual wielding!
//
// Short summary of the rebalance. Weapon now uses 2 shells per shot.
// ShotCountMaxForNotify (pellets) is now 12, should be 8 (2x Normal Shotgun) but whatever, 
// it was 16 originally but it was way too much for performance, I increased DamageAmount 
// per pellet instead (see ShotgunBulletAmmoInv) to keep the original damage per shot close to original. 
// 
// Also to let them have some fun with the whole "overpowerd" feeling
// This weapon can be now dual-wielded allowing to fire 2 times as it used to originally.
// The only difference being that it will still use up 2x more ammunition and is time limited.
//
// PS. Hopefully I wont get cricificated for the whole rebalance thing.
// But just in case, if it's my last message... I regret nothing!
//////////////////////////////////////////////////////////////////////////////////////////////////
class SawnOffWeapon extends DualCatableWeapon;

var int ShotAmmoUse;

///////////////////////////////////////////////////////////////////////////////
// Fire the weapon
///////////////////////////////////////////////////////////////////////////////
simulated function Fire( float Value )
{
	if (!HasAmmo())		
	{
		ClientForceFinish();
		ServerForceFinish();
		return;
	}
	
	Super.Fire(Value);
	
	// We do that reload stuff only if it's not Enhanced Game or if its NPC using the gun.
	if(!P2GameInfoSingle(Level.Game).VerifySeqTime() || !Pawn(Owner).Controller.bIsPlayer)
	{	
		if(HasAmmo())
			bForceReload=True;
	}
}

///////////////////////////////////////////////////////////////////////////////
// See what we hit
///////////////////////////////////////////////////////////////////////////////
function TraceFire( float Accuracy, float YOffset, float ZOffset )
{
	local int i;
	local bool bProj;

	P2AmmoInv(AmmoType).UseAmmoForShot(ShotAmmoUse);

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
// Reloading 
///////////////////////////////////////////////////////////////////////////////
simulated function PlayReloading()
{
	// First-Person Reload
	if (bDualWielding && LeftWeapon != none || RightWeapon != none) 
	{
		PlayAnim('DualReload', WeaponSpeedReload, 0.05);
		return;	// Return to prevent 3rd person reload issues.
	}
	else
		PlayAnim('Reload', WeaponSpeedReload, 0.05);
	
	// Third-Person Reload
	P2MocapPawn(Instigator).PlayWeaponReload(self);
}

///////////////////////////////////////////////////////////////////////////////
// Sawn-Off needs to have more than 1 ammo to be used
///////////////////////////////////////////////////////////////////////////////
simulated function bool HasAmmo()
{
	if(P2AmmoInv(AmmoType) != None)
	{
		return ( AmmoType.AmmoAmount > 1 ); 	
	}
	return false;
}

simulated function bool HasAmmoFinished()
{
	return HasAmmo();	
}

///////////////////////////////////////////////////////////////////////////////
// Cat-Silencer 
///////////////////////////////////////////////////////////////////////////////
function SwapCatOn()
{
	Super.SwapCatOn();
	
	TraceAccuracy=0.8;
}

function SwapCatOff()
{
	Super.SwapCatOff();
	
	TraceAccuracy=default.TraceAccuracy;
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    ShotAmmoUse=2
    StartShotsWithCat=4
    CatFireSound=Sound'WeaponSounds.shotgun_catfire'
    bAttachCat=true
    CatBoneName="MESH_Barrel"
    CatRelativeLocation=(X=0.0000000,Y=-4.5000000,Z=16.0000000)
    CatRelativeRotation=(Pitch=16384,Yaw=0,Roll=-16384)
    ViolenceRank=8
    RecognitionDist=1100.0000000
    ShotCountMaxForNotify=12
    AI_BurstCountMin=12
    holdstyle=5
    switchstyle=5
    firingstyle=5
    MinRange=200.0000000
    ShakeOffsetTime=3.5000000
    HudHint1="Press %KEY_AltFire% to reload manually."
    CombatRating=4.0000000
    WeaponSpeedLoad=1.5000000
    WeaponSpeedReload=1.3500000
    WeaponSpeedHolster=1.5000000
    WeaponSpeedShoot1Rand=0.3000000
    WeaponSpeedIdle=0.8000000
    OverrideHUDIcon=Texture'EDHud.hud_SawnOffShotgun'
    bSpawnMuzzleFlash=true
    MFClass[0]=Class'FX2.MuzzleFlash_SawnOff'
    MFClass[2]=Class'FX2.MuzzleFlash02'
    MFBoneName="tube2"
    MFRelativeRotation=(Pitch=0,Yaw=15000,Roll=0)
    MFScale=(Min=0.8000000,Max=1.3000000)
    MFSizeRange=(Min=20.0000000,Max=25.0000000)
    MFLifetime=(Min=0.1000000,Max=0.1000000)
    AmmoName=Class'Inventory.ShotGunBulletAmmoInv'
    AutoSwitchPriority=3
    ShakeRotMag=(X=800.0000000,Y=100.0000000,Z=100.0000000)
    ShakeRotTime=3.5000000
    ShakeOffsetMag=(X=40.0000000,Y=8.0000000,Z=8.0000000)
    TraceAccuracy=2.0000000
    aimerror=400.0000000
    AIRating=1.0000000
    MaxRange=512.0000000
    FireSound=Sound'AW7Sounds.MiscWeapons.Sawnoff_fire'
    InventoryGroup=3
    GroupOffset=3
    PickupClass=Class'SawnOffPickup'
    BobDamping=1.1250000
    AttachmentClass=Class'SawnOffAttachment'
    ItemName="Sawed-Off Shotgun"
    Mesh=SkeletalMesh'AW7_EDWeapons.ED_Sawnoff_NEW'
    Skins[0]=Texture'AW7EDTex.Weapons.sawnoff'
    Skins[1]=Texture'MP_FPArms.LS_arms.LS_hands_dude'
    SoundRadius=255.0000000
}