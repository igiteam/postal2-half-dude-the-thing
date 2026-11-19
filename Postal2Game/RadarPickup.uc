///////////////////////////////////////////////////////////////////////////////
// RadarPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Radar used to show other people right around you (through walls, terrain)
// It looks like a fish finder.
//
///////////////////////////////////////////////////////////////////////////////

class RadarPickup extends OwnedPickup;


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    AmountToAdd=60.0000000
    BounceSound=Sound'MiscSounds.PickupSounds.gun_bounce'
    InventoryType=Class'RadarInv'
    PickupMessage="You picked up a Fish Finder."
    DrawType=8
    StaticMesh=StaticMesh'Josh_mesh.signs.Bass_Sniffer'
}