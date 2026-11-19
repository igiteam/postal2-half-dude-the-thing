///////////////////////////////////////////////////////////////////////////////
// SteakPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Steak pickup.
//
///////////////////////////////////////////////////////////////////////////////

class SteakPickup extends OwnedPickup;


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bPaidFor=true
    Price=100
    LegalOwnerTag="fred"
    bUseForErrands=true
    bAllowMovement=false
    InventoryType=Class'SteakInv'
    PickupMessage="You picked up some Steaks."
    DrawType=8
    StaticMesh=StaticMesh'stuff.stuff1.Steaks'
}