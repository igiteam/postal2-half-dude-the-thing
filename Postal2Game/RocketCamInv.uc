///////////////////////////////////////////////////////////////////////////////
// RocketCamInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Rocket camera inventory item.
//
// Camera that attaches to the rocket as it travels.
// This *does not* plug in to the radar. It just acts very similar to those
// plug-ins. It only requires the rocket launcher to be useful.
//
///////////////////////////////////////////////////////////////////////////////

class RocketCamInv extends GunRadarPlugInv;

///////////////////////////////////////////////////////////////////////////////
// vars
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Tell the player you're into the rocket cameras
///////////////////////////////////////////////////////////////////////////////
function SetPlayerVar(bool bSet)
{
	local P2Pawn CheckPawn;

	CheckPawn = P2Pawn(Owner);

	if(P2Player(CheckPawn.Controller) != None)
		P2Player(CheckPawn.Controller).bUseRocketCameras = bSet;
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    Hint4="Rocket Cameras are Off."
    bThrowIndividually=false
    Hint1="Press %KEY_InventoryActivate% to attach cameras to any"
    Hint2="rockets you shoot."
    Hint3="Rocket Cameras are On."
    PowerupName="Raimi Rocket Cam"
    PowerupDesc="Holy crap -- a camera for your rockets! Activate to toggle on or off."
    GroupOffset=9
    PickupClass=Class'RocketCamPickup'
    Icon=Texture'HUDPack.Icons.Rocket_Cam_Icon'
}