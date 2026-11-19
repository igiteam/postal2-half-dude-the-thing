///////////////////////////////////////////////////////////////////////////////
// GrenadePickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
class GSelectPickup extends P2DualWieldWeaponPickup;


// Decompiled with UE Explorer.
defaultproperties
{
    AmmoGiveCount=20
    DeadNPCAmmoGiveRange=(Min=10.0000000,Max=20.0000000)
    BounceSound=Sound'MiscSounds.PickupSounds.gun_bounce'
    MPAmmoGiveCount=20
    InventoryType=Class'GSelectWeapon'
    PickupMessage="You picked up a Machine Pistol."
    DrawType=8
    StaticMesh=StaticMesh'ED_TPMeshes.WeaponPickups.PU_Glock'
    CollisionRadius=40.0000000
    CollisionHeight=5.0000000
}