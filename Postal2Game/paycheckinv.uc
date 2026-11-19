///////////////////////////////////////////////////////////////////////////////
// PaycheckInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Paycheck inventory item.
//
///////////////////////////////////////////////////////////////////////////////

class PaycheckInv extends OwnedInv;

///////////////////////////////////////////////////////////////////////////////
// Active state: this inventory item is armed and ready to rock!
///////////////////////////////////////////////////////////////////////////////
state Activated
{
Begin:
	CheckToGiveToInterest();
	GotoState('');
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    LegalOwnerTag="jenny"
    bUseCashierHints=true
    bUsePaidHints=false
    UseForErrands=1
    Hint1="Press %KEY_InventoryActivate% to hand it over."
    Hint2="Head to the bank."
    PowerupName="Paycheck"
    PowerupDesc="Cash this at the Bank."
    InventoryGroup=102
    GroupOffset=1
    PickupClass=Class'PaycheckPickup'
    Icon=Texture'HUDPack.Icons.Icon_Inv_Paycheck'
}