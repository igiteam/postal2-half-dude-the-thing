///////////////////////////////////////////////////////////////////////////////
// MoneyPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Money pickup.
//
//	If it's been dropped by the dude, it can lure greedy people to it.
// They will bend down and take it, if they notice it.
//
///////////////////////////////////////////////////////////////////////////////

class MoneyPickup extends OwnedPickup;

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    AmountToAdd=10.0000000
    bBreaksWindows=false
    DesireMarkerClass=Class'Postal2Game.MoneyMarker'
    BounceSound=Sound'MiscSounds.PickupSounds.BookDropping'
    InventoryType=Class'MoneyInv'
    PickupMessage="You picked up some Money."
    DrawType=8
    StaticMesh=StaticMesh'stuff.stuff1.Money'
}