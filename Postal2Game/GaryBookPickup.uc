///////////////////////////////////////////////////////////////////////////////
// GaryBookPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Gary Coleman autobiography book pickup.
//
///////////////////////////////////////////////////////////////////////////////

class GaryBookPickup extends BookPickup;


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bPaidFor=true
    bUseForErrands=true
    bAllowMovement=false
    InventoryType=Class'GaryBookInv'
    PickupMessage="You picked up Gary Coleman's autobiography."
    StaticMesh=StaticMesh'stuff.stuff1.GaryBook'
}