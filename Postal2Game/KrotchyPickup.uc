///////////////////////////////////////////////////////////////////////////////
// KrotchyPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Krotchy toy in a box pickup.
//
//
///////////////////////////////////////////////////////////////////////////////

class KrotchyPickup extends OwnedPickup;


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bPaidFor=true
    LegalOwnerTag="Krotchy"
    bUseForErrands=true
    bAllowMovement=false
    InventoryType=Class'KrotchyInv'
    PickupMessage="You picked up a Krotchy doll."
    DrawType=8
    StaticMesh=StaticMesh'stuff.stuff1.KrotchyToy'
    CollisionHeight=20.0000000
}