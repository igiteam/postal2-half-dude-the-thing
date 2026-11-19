///////////////////////////////////////////////////////////////////////////////
// CopClothesInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Clothing inventory item. You're not wearing this, you have it
// folded up right now, so it's not active.
//
// This is the dudes original clothes for when he's wearing some other
// outfit.
//
///////////////////////////////////////////////////////////////////////////////

class CopClothesInv extends ClothesInv;

var mesh ActualDefaultHeadMesh;	// Some Player Mutators do change the clothes default mesh so we need some way to tell if it was changed.

///////////////////////////////////////////////////////////////////////////////
// Record that we used dressed up like a cop
///////////////////////////////////////////////////////////////////////////////
function ChangeWorked(P2Player p2p)
{
	if(P2GameInfoSingle(Level.Game) != None
		&& P2GameInfoSingle(Level.Game).TheGameState != None)
	{
		P2GameInfoSingle(Level.Game).TheGameState.DressedAsCop++;
		// Kamek 5-1 give them an achievement
		if (P2GameInfoSingle(Level.Game).TheGameState.DressedAsGimp >= 1)
		{
				if(Level.NetMode != NM_DedicatedServer ) p2p.GetEntryLevel().EvaluateAchievement(p2p,'Fabulous');
		}
		p2p.BecomingCop();
	}
}

///////////////////////////////////////////////////////////////////////////////
// xPatch: Don't allow the new boltons for classic game / workshop player mods
// it's a "ducktape fix" but it can look bad with player models not designed for it 
///////////////////////////////////////////////////////////////////////////////
event PostBeginPlay()
{
	BoltonsCheck();
	Super.PostBeginPlay();
}
event PostLoadGame()
{
	BoltonsCheck();	
	Super.PostLoadGame();
}
function BoltonsCheck()
{
	if(P2GameInfoSingle(Level.Game) != None
		&& !P2GameInfoSingle(Level.Game).GetChameleon().UseExtendedBoltons() 
		|| HeadMesh != ActualDefaultHeadMesh)
	{
		default.xBoltons[1] = xBoltons[0];
		default.xBoltons[2] = xBoltons[0];
		default.xBoltons[3] = xBoltons[0];
	}
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    ActualDefaultHeadMesh=SkeletalMesh'heads.AvgDude'
    HandsTexture=Texture'MP_FPArms.LS_arms.LS_hands_robber'
    FootTexture=Texture'ChameleonSkins.Special.Dude_Cop'
    BodyMesh=SkeletalMesh'Characters.Avg_M_SS_Pants'
    BodySkin=Texture'ChameleonSkins.Special.Dude_Cop'
    HudSplats=/* Array type was not detected. */
    bAllowKeep=false
    bIsCopUniform=true
    xBoltons[0]=none
    xBoltons[1]=ObjectProperty'CatnipPickup.CatnipPuff'
    xBoltons[2]=ObjectProperty'RifleProjectile.Moving.ProcessTraceHit.Other'
    xBoltons[3]=StructProperty'MolotovProjectile.GenExplosion.HitNormal'
    xBoltonsRelativeLocation[0]=none
    xBoltonsRelativeLocation[1]=none
    bPaidFor=true
    Hint1="Press %KEY_InventoryActivate% to wear"
    Hint2="police uniform."
    PowerupName="Police Uniform"
    PowerupDesc="Gee, I wonder what you could do with this?"
    InventoryGroup=103
    GroupOffset=2
    PickupClass=Class'CopClothesPickup'
    Icon=Texture'HUDPack.Icons.Icon_Inv_CopUniform'
}