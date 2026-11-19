///////////////////////////////////////////////////////////////////////////////
// PlagueAmmoInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Plague ammo inventory item (as opposed to pickup).
//
///////////////////////////////////////////////////////////////////////////////

class PlagueAmmoInv extends P2AmmoInv;



///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    DamageAmount=15.0000000
    MomentumHitMag=10000.0000000
    DamageTypeInflicted=Class'BaseFX.ExplodedDamage'
    MaxAmmo=12
    bLeadTarget=true
    ProjectileClass=Class'PlagueProjectile'
    WarnTargetPct=0.2000000
    RefireRate=0.9900000
    PickupClass=Class'PlagueAmmoPickup'
    Texture=Texture'Patch1_skins.Weapons.WMD_inv'
}