///////////////////////////////////////////////////////////////////////////////
// GrenadeAmmoInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Grenade ammo inventory item (as opposed to pickup).
//
///////////////////////////////////////////////////////////////////////////////

class GrenadeAmmoInv extends P2AmmoInv;

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    DamageAmount=13.0000000
    MomentumHitMag=10000.0000000
    DamageTypeInflicted=Class'BaseFX.GrenadeDamage'
    MaxAmmoMP=40
    MaxAmmo=50
    bLeadTarget=true
    ProjectileClass=Class'GrenadeProjectile'
    WarnTargetPct=0.2000000
    RefireRate=0.9900000
    PickupClass=Class'GrenadePickup'
    Texture=Texture'HUDPack.Icons.Icon_Weapon_Grenade'
}