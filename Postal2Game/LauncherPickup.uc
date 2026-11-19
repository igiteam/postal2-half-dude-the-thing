///////////////////////////////////////////////////////////////////////////////
// LauncherPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
class LauncherPickup extends P2DualWieldWeaponPickup;


// Decompiled with UE Explorer.
defaultproperties
{
    AmmoGiveCount=100
    DeadNPCAmmoGiveRange=(Min=10.0000000,Max=100.0000000)
    BounceSound=Sound'MiscSounds.Doors.MetalCrateDoor'
    MPAmmoGiveCount=35
    ShortSleeveType=Class'LauncherWeaponSS'
    bNoBotPickup=true
    MaxDesireability=-1.0000000
    InventoryType=Class'LauncherWeapon'
    PickupMessage="You picked up a Rocket Launcher."
    DrawType=8
    StaticMesh=StaticMesh'stuff.stuff1.Launcher'
    CollisionRadius=60.0000000
    CollisionHeight=20.0000000
}