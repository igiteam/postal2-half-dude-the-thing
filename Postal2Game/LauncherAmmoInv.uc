///////////////////////////////////////////////////////////////////////////////
// LauncherAmmoInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Launcher ammo inventory item (as opposed to pickup).
//
///////////////////////////////////////////////////////////////////////////////

class LauncherAmmoInv extends P2AmmoInv;



///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    MaxAmmoMP=150
    MaxAmmo=300
    bLeadTarget=true
    ProjectileClass=Class'LauncherProjectile'
    WarnTargetPct=0.2000000
    RefireRate=0.9900000
    PickupClass=Class'LauncherAmmoPickup'
    Texture=Texture'HUDPack.Icons.Icon_Weapon_Launcher'
}