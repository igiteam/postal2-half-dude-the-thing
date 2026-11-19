///////////////////////////////////////////////////////////////////////////////
// ScissorsAmmoInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Scissors ammo inventory item (as opposed to pickup or projectile).
//
///////////////////////////////////////////////////////////////////////////////

class ScissorsAmmoInv extends P2AmmoInv;


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    DamageAmount=20.0000000
    MomentumHitMag=10000.0000000
    DamageTypeInflicted=Class'BaseFX.CuttingDamage'
    MaxAmmoMP=48
    MaxAmmo=144
    ProjectileClass=Class'ScissorsProjectile'
    WarnTargetPct=0.2000000
    RefireRate=0.9900000
    Texture=Texture'HUDPack.Icons.Icon_Weapon_Scissors'
}