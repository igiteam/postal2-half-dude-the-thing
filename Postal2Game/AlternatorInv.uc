///////////////////////////////////////////////////////////////////////////////
// AlternatorInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Alternator inventory item.
//
///////////////////////////////////////////////////////////////////////////////

class AlternatorInv extends OwnedInv;

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bPaidFor=true
    Price=400
    LegalOwnerTag="JunkyardGuy"
    UseForErrands=1
    PowerupName="Alternator"
    PowerupDesc="For an '87 DaFuQue"
    InventoryGroup=102
    GroupOffset=10
    PickupClass=Class'AlternatorPickup'
    Icon=Texture'HUDPack.Icons.Icon_Inv_Alternator'
}