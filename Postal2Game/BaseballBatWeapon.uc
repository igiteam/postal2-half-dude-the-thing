///////////////////////////////////////////////////////////////////////////////
// BaseBallBat
///////////////////////////////////////////////////////////////////////////////
class BaseballBatWeapon extends ShovelWeapon;

const IDLE_PLAY_FREQ = 0.25;

var float AlertRadius;

///////////////////////////////////////////////////////////////////////////////
// Called on client's side to make the gun fire
// Check here to throw out danger markers to let people know the gun has gone
// off.
///////////////////////////////////////////////////////////////////////////////
simulated function LocalFire()
{
	SendSwingAlert(AlertRadius);
	Super.LocalFire();
}

///////////////////////////////////////////////////////////////////////////////
// Called on client's side to make the gun fire
// Check here to throw out danger markers to let people know the gun has gone
// off.
///////////////////////////////////////////////////////////////////////////////
simulated function LocalAltFire()
{
	SendSwingAlert(AlertRadius);
	Super.LocalAltFire();
}

///////////////////////////////////////////////////////////////////////////////
// Tell them your about to smash things
///////////////////////////////////////////////////////////////////////////////
function SendSwingAlert(float UseRadius)
{
	local vector endpt;
	local P2MoCapPawn Victims;

	//log(self$" send swing alert ");
	if(Owner != None)
	{
		endpt = Owner.Location + UseMeleeDist*vector(Owner.Rotation);
	}
	else
	{
		endpt = Location;
	}

	foreach VisibleCollidingActors( class'P2MoCapPawn', Victims, UseRadius, endpt )
	{
		//log(self$" seeing "$victims);
		// If they're valid, tell them about your swing
		if(Victims != None
			&& !Victims.bDeleteMe
			&& Victims.Health > 0)
		{
			Victims.BigWeaponAlert(P2MoCapPawn(Owner));
		}
	}
}

/*
///////////////////////////////////////////////////////////////////////////////
// Start hurting things
///////////////////////////////////////////////////////////////////////////////
function Notify_StartHit()
{
	local PersonController perc;
	local vector dir;

	perc = PersonController(Instigator.Controller);

	if(perc != None
		&& perc.Target != None)
	{
		if(perc.MyPawn.bAdvancedFiring)
			bAltFiring=true;
	}

	Super.Notify_StartHit();
}

///////////////////////////////////////////////////////////////////////////////
// Set first person hands texture
///////////////////////////////////////////////////////////////////////////////
simulated function ChangeHandTexture(Texture NewHandsTexture, Texture DefHandsTexture, Texture NewFootTexture)
{
	Skins[1] = NewHandsTexture;
}
*/

///////////////////////////////////////////////////////////////////////////////
// Play our proper idling animation
///////////////////////////////////////////////////////////////////////////////
simulated function PlayIdleAnim()
{
	if (FRand() <= IDLE_PLAY_FREQ)
		PlayAnim('Idle_playing', WeaponSpeedIdle, 0.0);
	else
		PlayAnim('Idle', WeaponSpeedIdle, 0.0);
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    AlertRadius=200.0000000
    BloodTextures=/* Array type was not detected. */
    BloodSkinIndex=0
    bNoHudReticle=false
    HudHint2="Press %KEY_AltFire% to smash."
    FirstPersonMeshSuffix="ED_BaseballBat_NEW"
    WeaponSpeedLoad=2.0000000
    WeaponSpeedHolster=0.7500000
    WeaponSpeedShoot1=1.0000000
    WeaponSpeedShoot2=1.0000000
    bCanThrowMP=true
    AmmoName=Class'BaseballBatAmmoInv'
    GroupOffset=9
    PickupClass=Class'BaseballBatPickup'
    AttachmentClass=Class'BaseballBatAttachment'
    ItemName="Baseball Bat"
    Mesh=SkeletalMesh'AW7_EDWeapons.ED_BaseballBat_NEW'
    Skins[0]=Texture'ED_WeaponSkins.Melee.WoodenBat'
    Skins[1]=Texture'MP_FPArms.LS_arms.LS_hands_dude'
}