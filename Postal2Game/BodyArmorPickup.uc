///////////////////////////////////////////////////////////////////////////////
// BodyArmorPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Silicon Carbide ceramic plates inside a kevlar vest. Tougher than Kevlar armor
//
// Armor powerup. Once touched, its used and goes into your armor which
// absorbs certain damage types.
//
///////////////////////////////////////////////////////////////////////////////

class BodyArmorPickup extends KevlarPickup;

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    ArmorAmount=150.0000000
    InventoryType=Class'BodyArmorInv'
    PickupMessage="You put on SiC Body Armor."
    Skins[0]=Texture'StuffSkins.Items.KevlarHeavy'
}