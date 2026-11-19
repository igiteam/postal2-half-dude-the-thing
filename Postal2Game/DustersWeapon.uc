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
class DustersWeapon extends FistsWeapon;


// Removed by Man Chrzan: xPatch 2.0 (It's handled in FistsWeapon now)
/* var array<Material> FistBloodTextures;
var int FistBloodSkinIndex;

///////////////////////////////////////////////////////////////////////////////
// Set the texture that would handle the blood
///////////////////////////////////////////////////////////////////////////////
function SetFistBloodTexture(Material NewTex)
{
	Skins[FistBloodSkinIndex] = NewTex;
}

///////////////////////////////////////////////////////////////////////////////
// Add more blood the weapon by incrementing into the blood texture array for
// skins
///////////////////////////////////////////////////////////////////////////////
function DrewBlood()
{
	// Can add more blood, so do
	if(BloodTextureIndex < BloodTextures.Length)
	{
		// update the texture
		SetBloodTexture(BloodTextures[BloodTextureIndex]);
		SetFistBloodTexture(FistBloodTextures[BloodTextureIndex]);
		BloodTextureIndex++;
	}
	//log(self$" drew blood "$BloodTextureIndex$" new skin "$Skins[1]);
}

///////////////////////////////////////////////////////////////////////////////
// Remove all blood from blade
///////////////////////////////////////////////////////////////////////////////
function CleanWeapon()
{
	BloodTextureIndex = 0;
	SetBloodTexture(default.Skins[BloodSkinIndex]);
	SetFistBloodTexture(default.Skins[FistBloodSkinIndex]);
	//log(self$" clean weapon "$BloodTextureIndex$" new skin "$Skins[1]);
}
*/

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    BloodTextures=/* Array type was not detected. */
    bArrestableWeapon=true
    DropWeaponHint1="Press %KEY_ThrowWeapon% to drop your weapon."
    bBumpStartsFight=true
    WeaponSpeedShoot1=1.0000000
    WeaponSpeedShoot2=1.0000000
    bCannotBeStolen=false
    AmmoName=Class'DustersAmmoInv'
    bCanThrow=true
    GroupOffset=3
    PickupClass=Class'DustersPickup'
    AttachmentClass=Class'DustersAttachment'
    ItemName="Dusters"
    Skins[0]=Shader'AW7EDTex.Weapons.Dustersfinal'
    Skins[1]=Texture'MP_FPArms.LS_arms.LS_hands_dude'
}