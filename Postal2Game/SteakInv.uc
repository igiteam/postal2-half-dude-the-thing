///////////////////////////////////////////////////////////////////////////////
// SteakInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Steak inventory item.
//
///////////////////////////////////////////////////////////////////////////////

class SteakInv extends OwnedInv;

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bPaidFor=true
    Price=200
    LegalOwnerTag="fred"
    UseForErrands=1
    PowerupName="Steaks"
    PowerupDesc="For the Psychotic Friends Network BBQ"
    InventoryGroup=102
    GroupOffset=9
    PickupClass=Class'SteakPickup'
    Icon=Texture'HUDPack.Icons.Icon_Inv_Steaks'
}