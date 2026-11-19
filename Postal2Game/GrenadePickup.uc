///////////////////////////////////////////////////////////////////////////////
// GrenadePickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
class GrenadePickup extends P2WeaponPickup;


// Decompiled with UE Explorer.
defaultproperties
{
    AmmoGiveCount=4
    BounceSound=Sound'WeaponSounds.grenade_bounce'
    MPAmmoGiveCount=4
    ShortSleeveType=Class'GrenadeWeaponSS'
    bNoBotPickup=true
    MaxDesireability=-1.0000000
    InventoryType=Class'GrenadeWeapon'
    PickupMessage="You picked up some Grenades."
    DrawType=8
    StaticMesh=StaticMesh'stuff.stuff1.Grenade'
    CollisionRadius=35.0000000
    CollisionHeight=20.0000000
}