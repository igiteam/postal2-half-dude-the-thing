///////////////////////////////////////////////////////////////////////////////
// AWNukeInv
// Copyright 2004 Running With Scissors, Inc.  All Rights Reserved.
//
// Nuclear warhead inventory item.
//
///////////////////////////////////////////////////////////////////////////////

class AWNukeInv extends OwnedInv;

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////


// Decompiled with UE Explorer.
defaultproperties
{
    bPaidFor=true
    bCanThrow=false
    UseForErrands=1
    PowerupName="Nuclear Warhead"
    PowerupDesc="Guaranteed to make a nice fireball."
    InventoryGroup=102
    GroupOffset=14
    PickupClass=Class'AWNukePickup'
    Icon=Texture'AW_Textures.Nuke_Icon'
}