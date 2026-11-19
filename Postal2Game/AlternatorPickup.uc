///////////////////////////////////////////////////////////////////////////////
// AlternatorPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Alternator pickup.
//
//
///////////////////////////////////////////////////////////////////////////////

class AlternatorPickup extends OwnedPickup;


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bPaidFor=true
    Price=400
    LegalOwnerTag="JunkyardGuy"
    bUseForErrands=true
    bAllowMovement=false
    InventoryType=Class'AlternatorInv'
    PickupMessage="You picked up a Car Alternator."
    DrawType=8
    StaticMesh=StaticMesh'stuff.stuff1.Alternator'
}