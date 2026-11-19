///////////////////////////////////////////////////////////////////////////////
// GrenadeAmmoInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Grenade ammo inventory item (as opposed to pickup).
//
///////////////////////////////////////////////////////////////////////////////

class DynamiteAmmoInv extends P2AmmoInv;

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////


// Decompiled with UE Explorer.
defaultproperties
{
    DamageAmount=13.0000000
    MomentumHitMag=10000.0000000
    DamageTypeInflicted=Class'BaseFX.ScytheDamage'
    MaxAmmoMP=5
    MaxAmmo=30
    bLeadTarget=true
    ProjectileClass=Class'DynamiteProjectile'
    WarnTargetPct=0.2000000
    RefireRate=0.9900000
    Texture=Texture'EDHud.hud_Dynamite'
}