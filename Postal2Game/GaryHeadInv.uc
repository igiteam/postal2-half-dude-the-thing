///////////////////////////////////////////////////////////////////////////////
// GaryHeadInv
// Copyright 2004 Running With Scissors, Inc.  All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
class GaryHeadInv extends OwnedInv;

///////////////////////////////////////////////////////////////////////////////
// vars/consts
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Active state: this inventory item is armed and ready to rock!
///////////////////////////////////////////////////////////////////////////////
state Activated
{
	ignores Activate;

	function bool PowerDudeUp()
	{
		local P2Pawn CheckPawn;

		CheckPawn = P2Pawn(Owner);

		TurnOffHints();	// When you use it, turn off the hints

		if(P2Player(Pawn(Owner).Controller) != None
			&& P2Player(Pawn(Owner).Controller).DoGaryPowers())
		{
			ReduceAmount(1);
			return true;
		}
		return false;
	}
Begin:
	PowerDudeUp();
	GotoState('');
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////


// Decompiled with UE Explorer.
defaultproperties
{
    Hint1="Press %KEY_InventoryActivate% for a"
    Hint2="rockin' good time!"
    PowerupName="Flaming Gary Autobiography"
    PowerupDesc="Warning: Holds a forbidden power!"
    InventoryGroup=100
    GroupOffset=5
    PickupClass=Class'GaryHeadPickup'
    Icon=Texture'AW_Textures.Gary_Bookfire_Icon'
}