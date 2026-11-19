///////////////////////////////////////////////////////////////////////////////
// MilkPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Milk pickup.
//
//	History:
//		03/19/02 NPF	Started history, probably won't be updated again until
//							the pace of change slows down.
//
///////////////////////////////////////////////////////////////////////////////

class MilkPickup extends OwnedPickup;


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    Price=5
    bAllowMovement=false
    InventoryType=Class'MilkInv'
    PickupMessage="You picked up a carton of Milk."
    DrawType=8
    StaticMesh=StaticMesh'stuff.stuff1.MilkCarton'
    CollisionHeight=20.0000000
}