///////////////////////////////////////////////////////////////////////////////
// TreeInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Christmas tree inventory item.
// (it's a really small tree)
//
///////////////////////////////////////////////////////////////////////////////

class TreeInv extends OwnedInv;

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bPaidFor=true
    bCanThrow=false
    UseForErrands=1
    PowerupName="Christmas Tree"
    PowerupDesc="The little tree that could."
    InventoryGroup=102
    GroupOffset=6
    PickupClass=Class'TreePickup'
    Icon=Texture'nathans.Inventory.TreeInv'
}