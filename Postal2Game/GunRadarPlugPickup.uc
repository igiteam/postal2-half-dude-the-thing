///////////////////////////////////////////////////////////////////////////////
// GunRadarPlugPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Plug-in for the radar. Show's 'fish' that are authority figures as
// having a little cop hat on their heads. Using the GunRadar plug-in with this
// *won't* show cop fish with guns. You already know they have guns, cause
// they are cops
//
///////////////////////////////////////////////////////////////////////////////

class GunRadarPlugPickup extends OwnedPickup;


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    BounceSound=Sound'MiscSounds.PickupSounds.BookDropping'
    InventoryType=Class'GunRadarPlugInv'
    PickupMessage="You picked up the 'Piranha' Plug-in for BassSniffer Radar."
    DrawType=8
    StaticMesh=StaticMesh'Josh_mesh.signs.Fish_Cartridge'
    CollisionHeight=6.0000000
}