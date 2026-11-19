///////////////////////////////////////////////////////////////////////////////
// NapalmPickupErrand
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Normal napalm pickup, only different because it checks to complete
// the napalm errand.
// 
// This is here becuase this is the only weapon in the game that checks
// for errand completetion. If more need it, then move it down to P2WeaponPickup.
//
///////////////////////////////////////////////////////////////////////////////
class NapalmPickupErrand extends P2WeaponPickupErrand;


// Decompiled with UE Explorer.
defaultproperties
{
    AmmoGiveCount=6
    MPAmmoGiveCount=6
    InventoryType=Class'NapalmWeapon'
    PickupMessage="You picked up a Napalm Cannister Launcher."
    DrawType=8
    StaticMesh=StaticMesh'stuff.stuff1.NapalmSixpack'
    CollisionRadius=60.0000000
    CollisionHeight=20.0000000
}