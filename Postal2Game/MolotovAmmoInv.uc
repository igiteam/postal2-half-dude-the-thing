///////////////////////////////////////////////////////////////////////////////
// MolotovAmmoInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Molotov ammo inventory item (as opposed to pickup).
//
///////////////////////////////////////////////////////////////////////////////

class MolotovAmmoInv extends P2AmmoInv;



///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    DamageAmount=13.0000000
    MomentumHitMag=10000.0000000
    DamageTypeInflicted=Class'BaseFX.ExplodedDamage'
    MaxAmmo=20
    bLeadTarget=true
    ProjectileClass=Class'MolotovProjectile'
    WarnTargetPct=0.2000000
    RefireRate=0.9900000
    Texture=Texture'HUDPack.Icons.Icon_Weapon_Molotov'
}