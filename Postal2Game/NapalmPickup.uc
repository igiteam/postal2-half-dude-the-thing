///////////////////////////////////////////////////////////////////////////////
// NapalmPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
class NapalmPickup extends P2WeaponPickup;


// Decompiled with UE Explorer.
defaultproperties
{
    AmmoGiveCount=3
    DeadNPCAmmoGiveRange=(Min=1.0000000,Max=3.0000000)
    BounceSound=Sound'MiscSounds.PickupSounds.gun_bounce'
    MPAmmoGiveCount=3
    InventoryType=Class'NapalmWeapon'
    PickupMessage="You picked up a Napalm Cannister Launcher."
    DrawType=8
    StaticMesh=StaticMesh'stuff.stuff1.NapalmGun'
    CollisionRadius=60.0000000
}