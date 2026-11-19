///////////////////////////////////////////////////////////////////////////////
// CitationInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Citation inventory item for a traffic violation.
//
///////////////////////////////////////////////////////////////////////////////

class CitationInv extends BookInv;

///////////////////////////////////////////////////////////////////////////////
// Active state: this inventory item is armed and ready to rock!
///////////////////////////////////////////////////////////////////////////////
state Activated
{
Begin:
	CheckToGiveToInterestAndPay();
	GotoState('');
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    Price=300
    LegalOwnerTag="Dick"
    bUseCashierHints=true
    PaidHint1="Take to the police department"
    PaidHint2="You owe: $"
    UseForErrands=1
    Hint1="Press %KEY_InventoryActivate% to pay."
    Hint2="Take to the police department."
    PowerupName="Traffic Ticket"
    PowerupDesc="Go to the Police Station."
    GroupOffset=7
    PickupClass=Class'CitationPickup'
    Icon=Texture'HUDPack.Icons.Icon_Inv_Citation'
}