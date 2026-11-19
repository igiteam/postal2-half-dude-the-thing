///////////////////////////////////////////////////////////////////////////////
// HandCuffsWeapon
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// HandCuffs weapon--no violent hand cuffs
//
//	History:
//		02/12/02 NPF	Started history, probably won't be updated again until
//							the pace of change slows down.
//
///////////////////////////////////////////////////////////////////////////////

class HandCuffsWeapon extends P2Weapon;

///////////////////////////////////////////////////////////////////////////////
// Vars, structs, consts
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Stub these two out so the handCuffs can't 'fire'
///////////////////////////////////////////////////////////////////////////////
function ServerFire()
{
	log("no serverfire "$self);
}
function LocalFire()
{
	log("no localfire "$self);
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bNoHudReticle=true
    bBumpStartsFight=false
    FirstPersonMeshSuffix="Nothing"
    AmmoName=Class'HandCuffsAmmoInv'
    bCanThrow=false
    AutoSwitchPriority=0
    AIRating=0.0100000
    MaxRange=150.0000000
    SelectSound=none
    InventoryGroup=0
    GroupOffset=3
    BobDamping=0.9750000
    AttachmentClass=Class'HandCuffsAttachment'
    ItemName="Handcuffs"
    Mesh=SkeletalMesh'FP_Weapons.FP_Dude_Nothing'
    Skins[0]=Texture'WeaponSkins.Dude_Hands'
}