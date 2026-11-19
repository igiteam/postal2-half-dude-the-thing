///////////////////////////////////////////////////////////////////////////////
// ParcelPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Parcel pickup.
//
//
///////////////////////////////////////////////////////////////////////////////

class ParcelPickup extends OwnedPickup;


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bPaidFor=true
    Price=20
    LegalOwnerTag="Lucy"
    bUseForErrands=true
    bAllowMovement=false
    InventoryType=Class'ParcelInv'
    PickupMessage="You picked up a Special Delivery parcel."
    DrawType=8
    StaticMesh=StaticMesh'stuff.stuff1.Package'
}