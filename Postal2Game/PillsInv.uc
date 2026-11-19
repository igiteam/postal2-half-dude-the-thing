///////////////////////////////////////////////////////////////////////////////
// PillsInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Pills inventory item.
//
///////////////////////////////////////////////////////////////////////////////

class PillsInv extends OwnedInv;

///////////////////////////////////////////////////////////////////////////////
// Active state: this inventory item is armed and ready to rock!
///////////////////////////////////////////////////////////////////////////////
state Activated
{
	function UseIt()
	{
		local P2Pawn CheckPawn;

		CheckPawn = P2Pawn(Owner);

		TurnOffHints();	// When you use it, turn off the hints

		if(CheckPawn.CureGonorrhea())
		{
		}
		ReduceAmount(1);
	}
Begin:
	UseIt();
	GotoState('');
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bPaidFor=true
    UseForErrands=1
    Hint1="Label reads:"
    Hint2="'Cures gonorrhea fast!'"
    PowerupName="Pills"
    PowerupDesc="Label reads: 'Cures gonorrhea fast!'"
    InventoryGroup=102
    GroupOffset=13
    PickupClass=Class'PillsPickup'
    Icon=Texture'HUDPack.Icons.Icon_Inv_Penicillin'
}