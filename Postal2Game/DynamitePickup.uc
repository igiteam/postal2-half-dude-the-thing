///////////////////////////////////////////////////////////////////////////////
// GrenadePickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
class DynamitePickup extends P2WeaponPickup;


// Decompiled with UE Explorer.
defaultproperties
{
    AmmoGiveCount=3
    BounceSound=Sound'WeaponSounds.grenade_bounce'
    bNoBotPickup=true
    MaxDesireability=-1.0000000
    InventoryType=Class'DynamiteWeapon'
    PickupMessage="You picked up a stick of Dynamite."
    DrawType=8
    StaticMesh=StaticMesh'ED_TPMeshes.Emitter.dynamite'
    CollisionRadius=35.0000000
    CollisionHeight=20.0000000
}