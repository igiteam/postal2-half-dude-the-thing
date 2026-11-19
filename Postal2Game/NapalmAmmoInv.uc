///////////////////////////////////////////////////////////////////////////////
// NapalmAmmoInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Napalm ammo inventory item (as opposed to pickup).
//
///////////////////////////////////////////////////////////////////////////////

class NapalmAmmoInv extends P2AmmoInv;



///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    DamageAmount=13.0000000
    MomentumHitMag=10000.0000000
    DamageTypeInflicted=Class'BaseFX.ExplodedDamage'
    MaxAmmo=12
    bLeadTarget=true
    ProjectileClass=Class'NapalmProjectile'
    WarnTargetPct=0.2000000
    RefireRate=0.9900000
    PickupClass=Class'NapalmAmmoPickup'
    Texture=Texture'HUDPack.Icons.Icon_Weapon_Napalm'
}