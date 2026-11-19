// abstract stub class to allow third-person anims in awperson
class FistsWeapon extends ShovelWeapon;

var int ThirdAnimUsed;
var int AnimPlayed;
var bool bRightFist;

// Added by Man Chrzan: xPatch 2.0
var travel int FistsBloodTextureIndex;			   // index into following array
var array<Material> FistsBloodTextures;    // bloodier versions of this weapon skin
var() int FistBloodSkinIndex;			   // Index of hands model that gets more and more bloody.
var Texture CurrentHandsTex;


simulated function PlayFiring()
{
	if (bRightFist)
	{
		//randomly pick the animation to use (right)
		AnimPlayed = rand(2);
		switch (AnimPlayed)
		{
		   case 0:
				PlayAnim('right_jab', WeaponSpeedShoot2 + (WeaponSpeedShoot2Rand*FRand()));
				break;
		   case 1:
				PlayAnim('right_uppercut', WeaponSpeedShoot2 + (WeaponSpeedShoot2Rand*FRand()));
				break;
		}
		ThirdAnimUsed = AnimPlayed + 2;
		if ( WeaponAttachment(ThirdPersonActor) != None )
		{
			WeaponAttachment(ThirdPersonActor).ThirdPersonEffects();
		}
	}
	else
	{	
		//randomly pick the animation to use (left)
		AnimPlayed = rand(2);
		switch (AnimPlayed)
		{
		   case 0:
				PlayAnim('left_jab', WeaponSpeedShoot1 + (WeaponSpeedShoot1Rand*FRand()));
				break;
	//       case 1:
	//            PlayAnim('left_downwards', WeaponSpeedShoot1 + (WeaponSpeedShoot1Rand*FRand()));
	//            break;
		   case 1:
				PlayAnim('left_uppercut', WeaponSpeedShoot1 + (WeaponSpeedShoot1Rand*FRand()));
				break;
		}
		ThirdAnimUsed = AnimPlayed;
		if ( WeaponAttachment(ThirdPersonActor) != None )
		{
			WeaponAttachment(ThirdPersonActor).ThirdPersonEffects();
		}
	}
	bRightFist = !bRightFist;

	if(bShowHint1)
	{
		bShowHint1=false;
		UpdateHudHints();
	}
}

simulated function PlayAltFiring()
{
	PlayAnim('left_downwards', WeaponSpeedShoot1 + (WeaponSpeedShoot1Rand*FRand()));
	ThirdAnimUsed = 1;
	if ( WeaponAttachment(ThirdPersonActor) != None )
	{
		WeaponAttachment(ThirdPersonActor).ThirdPersonEffects();
	}
	if(!bShowHint1)
		TurnOffHint();
}

///////////////////////////////////////////////////////////////////////////////
// Changed by Man Chrzan: xPatch 2.0
// Set first person hands texture
///////////////////////////////////////////////////////////////////////////////
simulated function ChangeHandTexture(Texture NewHandsTexture, Texture DefHandsTexture, Texture NewFootTexture)
{
	CurrentHandsTex = NewHandsTexture;
	Skins[BloodSkinIndex] = Default.Skins[BloodSkinIndex];
	Skins[FistBloodSkinIndex] = NewHandsTexture;
}

///////////////////////////////////////////////////////////////////////////////
// Added by Man Chrzan: xPatch 2.0
// Set our super-duper hands texture combiner
///////////////////////////////////////////////////////////////////////////////
function SetHandsBloodTexture(Material NewTex)
{
	local Combiner usetex;

	usetex = new(Outer) class'Combiner';
	usetex.CombineOperation = CO_Multiply;

	if(CurrentHandsTex != None)
		usetex.Material1 = CurrentHandsTex;
	else
		usetex.Material1 = Default.Skins[FistBloodSkinIndex];
	usetex.Material2 = NewTex;
	Skins[FistBloodSkinIndex] = usetex;
}


///////////////////////////////////////////////////////////////////////////////
// Added by Man Chrzan: xPatch 2.0
// Remove all blood from hands and dusters
///////////////////////////////////////////////////////////////////////////////
function CleanWeapon()
{
	BloodTextureIndex = 0;
	FistsBloodTextureIndex = 0;
	
	//Skins[0] = default.Skins[0];
	SetBloodTexture(default.Skins[BloodSkinIndex]);
	if(CurrentHandsTex != None)
		Skins[FistBloodSkinIndex] = CurrentHandsTex;
	else
		Skins[FistBloodSkinIndex] = default.Skins[FistBloodSkinIndex];
	//log(self$" clean weapon "$BloodTextureIndex$" new skin "$Skins[1]);
}


///////////////////////////////////////////////////////////////////////////////
// Added by Man Chrzan: xPatch 2.0
// Add more blood the weapon by incrementing into the blood texture array for
// skins
///////////////////////////////////////////////////////////////////////////////
function DrewBlood()
{
	// Can add blood, so do
    if(BloodTextureIndex < BloodTextures.Length)
	{
		// update the texture
	    SetBloodTexture(BloodTextures[BloodTextureIndex]);
		BloodTextureIndex++;
	}
	//log(self$" drew blood "$BloodTextureIndex$" new skin "$Skins[1]);

	// Can add more blood, so do
    if(FistsBloodTextureIndex < FistsBloodTextures.Length)
	{
		// update the texture
	    SetHandsBloodTexture(FistsBloodTextures[FistsBloodTextureIndex]);
		FistsBloodTextureIndex++;
	}
	//log(self$" drew blood "$BloodTextureIndex$" new skin "$Skins[1]);
}

// xPatch: Returns if we should clean or not + restores blood if needed. 
function bool RestoreBlood()
{
	if((P2GameInfoSingle(Level.Game) != None && P2GameInfoSingle(Level.Game).xManager.bKeepBlood && BloodTextureIndex != 0)
	|| (bForceBlood && BloodTextureIndex != 0))
	{
		SetBloodTexture(BloodTextures[BloodTextureIndex - 1]);	// NOTE: BloodTextureIndex defines the next blood skin so do -1
		SetHandsBloodTexture(FistsBloodTextures[FistsBloodTextureIndex - 1]);
		bForceBlood=False;
		return true;
	}
	return false;
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    FistsBloodTextures[0]=Texture'xPatchTex.Weapons.Fists_Bloody1'
    FistsBloodTextures[1]=Texture'xPatchTex.Weapons.Fists_Bloody2'
    FistsBloodTextures[2]=Texture'xPatchTex.Weapons.Fists_Bloody3'
    FistBloodSkinIndex=1
    BloodTextures=/* Array type was not detected. */
    BloodSkinIndex=0
    RecognitionDist=600.0000000
    AI_BurstCountExtra=2
    AI_BurstTime=1.0000000
    switchstyle=1
    ShakeOffsetTime=3.0000000
    PlayerMeleeDist=100.0000000
    NPCMeleeDist=90.0000000
    HudHint1="Press %KEY_Fire% to punch."
    HudHint2="Press %KEY_AltFire% for a powerful knockout blow!"
    DropWeaponHint1="Press %KEY_ToggleToHands% to put down your fists."
    CombatRating=1.0000000
    FirstPersonMeshSuffix="ED_Dusters_NEW"
    WeaponsPackageStr="AW7_EDWeapons."
    WeaponSpeedLoad=1.2500000
    WeaponSpeedShoot1=1.1000000
    WeaponSpeedShoot2=1.1000000
    WeaponSpeedShoot2Rand=0.1000000
    WeaponSpeedIdle=0.3000000
    bCannotBeStolen=true
    AmmoName=Class'FistsAmmoInv'
    bCanThrow=false
    FireOffset=(X=2.0000000,Y=0.0000000,Z=-1.0000000)
    ShakeRotMag=(X=30.0000000,Y=250.0000000,Z=30.0000000)
    ShakeRotTime=3.0000000
    ShakeOffsetMag=(X=0.0000000,Y=6.0000000,Z=0.0000000)
    TraceAccuracy=0.1000000
    AIRating=0.0500000
    MaxRange=90.0000000
    GroupOffset=99
    PickupClass=none
    PlayerViewOffset=(X=4.5000000,Y=0.0000000,Z=-7.5000000)
    BobDamping=0.9750000
    AttachmentClass=Class'FistsAttachment'
    ItemName="Fists"
    Mesh=SkeletalMesh'ED_Weapons.ED_Dusters_NEW'
    Skins[0]=Shader'AW7Tex.Weapons.InvisiblePistol'
    Skins[1]=Texture'MP_FPArms.LS_arms.LS_hands_dude'
}