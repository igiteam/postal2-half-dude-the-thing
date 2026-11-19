///////////////////////////////////////////////////////////////////////////////
// RocketCamPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Camera that attaches to the rocket as it travels
//
///////////////////////////////////////////////////////////////////////////////

class RocketCamPickup extends GunRadarPlugPickup;


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    BounceSound=Sound'MiscSounds.PickupSounds.gun_bounce'
    InventoryType=Class'RocketCamInv'
    PickupMessage="You picked up some Rocket Cameras."
    Skins[0]=Texture'Josh-textures.Skins.RocketCam_pack'
}