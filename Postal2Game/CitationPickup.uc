///////////////////////////////////////////////////////////////////////////////
// CitationPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Citation pickup.
//
///////////////////////////////////////////////////////////////////////////////

class CitationPickup extends BookPickup;


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    Price=300
    LegalOwnerTag="Dick"
    bUseForErrands=true
    bAllowMovement=false
    bBreaksWindows=false
    InventoryType=Class'CitationInv'
    PickupMessage="You picked up your Traffic Citation."
    StaticMesh=StaticMesh'stuff.stuff1.Citation'
}