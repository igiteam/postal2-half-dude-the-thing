///////////////////////////////////////////////////////////////////////////////
// CopRadarPlugInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Plug-in for the radar. Show's 'fish' that are *authority figures* as
// having a little cop hat on their heads. Using the GunRadar plug-in with this
// *won't* show cop fish with guns. You already know they have guns, cause
// they are cops.
// 
// This is good for seeing cops on the other sides of walls.
//
// Toggle it on and off by using it.
//
///////////////////////////////////////////////////////////////////////////////

class CopRadarPlugInv extends GunRadarPlugInv;

///////////////////////////////////////////////////////////////////////////////
// vars
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Only code that should change with each plug-in
///////////////////////////////////////////////////////////////////////////////
function SetPlayerVar(bool bSet)
{
	local P2Pawn CheckPawn;

	CheckPawn = P2Pawn(Owner);

	if(P2Player(CheckPawn.Controller) != None)
		P2Player(CheckPawn.Controller).SetRadarShowCops(bActive);
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    Hint4="'Largemouth Bass' Plug-in is Off."
    Hint2="to see the fish who police the pond."
    Hint3="'Largemouth Bass' Plug-in is On."
    PowerupName="'Largemouth Bass' Plug-In"
    PowerupDesc="Shows the fish who police the pond on your Bass Sniffer Radar."
    GroupOffset=8
    PickupClass=Class'CopRadarPlugPickup'
    Icon=Texture'HUDPack.Icons.icon_inv_Largemouth'
}