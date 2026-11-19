///////////////////////////////////////////////////////////////////////////////
// TreePickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Christmas tree pickup. It's a pretty small tree.
//
///////////////////////////////////////////////////////////////////////////////

class TreePickup extends OwnedPickup;


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bPaidFor=true
    bUseForErrands=true
    bAllowMovement=false
    InventoryType=Class'TreeInv'
    PickupMessage="You picked up a Christmas Tree."
    DrawType=8
    StaticMesh=StaticMesh'Timb_mesh.street.x-mas_tree'
    CollisionRadius=30.0000000
    CollisionHeight=30.0000000
}