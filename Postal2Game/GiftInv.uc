///////////////////////////////////////////////////////////////////////////////
// GiftInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Uncle dave's gift inventory item.
//
///////////////////////////////////////////////////////////////////////////////

class GiftInv extends KrotchyInv;

///////////////////////////////////////////////////////////////////////////////
// Check to give this to whoever you're talking to
///////////////////////////////////////////////////////////////////////////////
state Activated
{
Begin:
	CheckToGiveToInterest();
	GotoState('');
}

///////////////////////////////////////////////////////////////////////////////
// Give hints about this item
///////////////////////////////////////////////////////////////////////////////
function GetHints(P2Pawn PawnOwner, out String str1, out String str2, out String str3,
				  out byte InfiniteHintTime)
{
	local P2Player checkp;

	checkp = P2Player(PawnOwner.Controller);
	
	if(checkp.InterestPawn != None
		&& PersonController(checkp.InterestPawn.Controller) != None
		&& (PersonController(checkp.InterestPawn.Controller).InterestInventoryClass == class))
	{
		str1 = Hint1;
	}
	else
	{
		Super.GetHints(PawnOwner, str1, str2, str3, InfiniteHintTime);
	}
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bPaidFor=false
    LegalOwnerTag="UncleDave"
    bUseCashierHints=true
    bUsePaidHints=false
    bCanThrow=false
    Hint1="Press %KEY_InventoryActivate% to hand it over."
    Hint2="Give to Uncle Dave."
    PowerupName="Uncle Dave's Gift"
    PowerupDesc="Take this to the Cult Compound."
    GroupOffset=11
    PickupClass=Class'GiftPickup'
    Icon=Texture'HUDPack.Icons.Icon_Inv_Gift'
}