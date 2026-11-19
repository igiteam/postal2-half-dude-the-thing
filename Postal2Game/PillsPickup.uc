///////////////////////////////////////////////////////////////////////////////
// PillsPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Pills pickup.
//
//
///////////////////////////////////////////////////////////////////////////////

class PillsPickup extends OwnedPickup;


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bPaidFor=true
    bUseForErrands=true
    bAllowMovement=false
    bBreaksWindows=false
    BounceSound=Sound'MiscSounds.PickupSounds.BookDropping'
    InventoryType=Class'PillsInv'
    PickupMessage="You picked up some Gonorrhea medicine."
    DrawType=8
    StaticMesh=StaticMesh'stuff.stuff1.Penicillin'
}