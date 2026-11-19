//=============================================================================
// PistolPickup
// Copyright 2001 Running With Scissors, Inc.  All Rights Reserved.
//
// Pistol weapon pickup.
//
//	History:
//		01/29/02 MJR	Started history, probably won't be updated again until
//							the pace of change slows down.
//
//=============================================================================

class PistolPickup extends P2DualWieldWeaponPickup;


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    AmmoGiveCount=9
    DeadNPCAmmoGiveRange=(Min=2.0000000,Max=5.0000000)
    BounceSound=Sound'MiscSounds.PickupSounds.gun_bounce'
    MPAmmoGiveCount=20
    ShortSleeveType=Class'PistolWeaponSS'
    InventoryType=Class'PistolWeapon'
    PickupMessage="You picked up a Pistol."
    DrawType=8
    StaticMesh=StaticMesh'stuff.stuff1.Pistol'
    CollisionRadius=40.0000000
    CollisionHeight=5.0000000
}