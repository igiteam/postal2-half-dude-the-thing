///////////////////////////////////////////////////////////////////////////////
// MilkInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Milk inventory item.
//
//	History:
//		03/19/02 NPF	Started history, probably won't be updated again until
//							the pace of change slows down.
//
///////////////////////////////////////////////////////////////////////////////

class MilkInv extends OwnedInv;

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bCanThrow=false
    PowerupName="Milk"
    PowerupDesc="...'Jihad' Goat Milk?"
    InventoryGroup=102
    GroupOffset=2
    PickupClass=Class'MilkPickup'
    Icon=Texture'nathans.Inventory.MilkInv'
}