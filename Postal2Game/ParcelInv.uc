///////////////////////////////////////////////////////////////////////////////
// ParcelInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Parcel inventory item.
//
///////////////////////////////////////////////////////////////////////////////

class ParcelInv extends OwnedInv;

///////////////////////////////////////////////////////////////////////////////
// Active state: this inventory item is armed and ready to rock!
///////////////////////////////////////////////////////////////////////////////
state Activated
{
	/*
	function UseIt()
	{
		local P2Pawn CheckPawn;

		CheckPawn = P2Pawn(Owner);

		if(CheckPawn.CureGonorrhea())
		{
		}
		ReduceAmount(1);
	}
Begin:
	UseIt();
	GotoState('');
	*/
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bPaidFor=true
    Price=20
    LegalOwnerTag="Lucy"
    UseForErrands=1
    PowerupName="Package"
    PowerupDesc="It seems to be making ticking sounds..."
    InventoryGroup=102
    GroupOffset=12
    PickupClass=Class'ParcelPickup'
    Icon=Texture'HUDPack.Icons.Icon_Inv_Package'
}