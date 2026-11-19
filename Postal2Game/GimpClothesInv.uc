///////////////////////////////////////////////////////////////////////////////
// GimpClothesInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Clothing inventory item. You're not wearing this, you have it
// folded up right now, so it's not active.
//
// Wear this to act like the Gimp.
//
///////////////////////////////////////////////////////////////////////////////

class GimpClothesInv extends ClothesInv;

///////////////////////////////////////////////////////////////////////////////
// Kamek 5-2 Record that we used dressed up like a cop
///////////////////////////////////////////////////////////////////////////////
function ChangeWorked(P2Player p2p)
{
	if(P2GameInfoSingle(Level.Game) != None
		&& P2GameInfoSingle(Level.Game).TheGameState != None)
	{
		P2GameInfoSingle(Level.Game).TheGameState.DressedAsGimp++;
		// Kamek 5-1 give them an achievement
		if (P2GameInfoSingle(Level.Game).TheGameState.DressedAsCop >= 1)
		{
		if(Level.NetMode != NM_DedicatedServer ) 	p2p.GetEntryLevel().EvaluateAchievement(p2p,'Fabulous');
		}
	}
}


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    HandsTexture=Texture'MP_FPArms.LS_arms.LS_hands_gimp'
    FootTexture=Texture'ChameleonSkins.Special.Gimp'
    BodyMesh=SkeletalMesh'Characters.Avg_Gimp'
    BodySkin=Texture'ChameleonSkins.Special.Gimp'
    HeadMesh=SkeletalMesh'heads.Masked'
    HeadSkin=Texture'ChamelHeadSkins.Special.Gimp'
    HudSplats=/* Array type was not detected. */
    bPaidFor=true
    Hint1="Press %KEY_InventoryActivate% to wear"
    Hint2="gimp outfit."
    PowerupName="Gimp Clothes"
    PowerupDesc="Eww, they appear to be slightly used..."
    InventoryGroup=103
    GroupOffset=3
    PickupClass=Class'GimpClothesPickup'
    Icon=Texture'HUDPack.Icons.Icon_Inv_GimpUniform'
}