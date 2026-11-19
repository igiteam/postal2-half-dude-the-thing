///////////////////////////////////////////////////////////////////////////////
// MoneyInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Money inventory item.
//
//
// GroupOffsets for powerups arbitrarily start at 100 so we have some space from
// the weapons.
//
///////////////////////////////////////////////////////////////////////////////

class MoneyInv extends OwnedInv;

///////////////////////////////////////////////////////////////////////////////
// Active state: this inventory item is armed and ready to rock!
///////////////////////////////////////////////////////////////////////////////
state Activated
{
	function CheckToPayInterest()
	{
		local P2Pawn thispawn;
		local P2Player checkp;
		local PersonController Personc;
		local float AmountTaken;


		thispawn = P2Pawn(Owner);
		checkp = P2Player(thispawn.Controller);
		if(checkp.InterestPawn != None)
		{
			Personc = PersonController(checkp.InterestPawn.Controller);

//			log(self$" interest pawn "$checkp.InterestPawn);
//			log(self$" Person is "$Personc);

			if(Personc != None)
			{
				if(Personc.AcceptItem(thispawn, self, AmountTaken, Amount))
					ReduceAmount(AmountTaken);
			}
		}
	}
Begin:
	CheckToPayInterest();
	
	GotoState('');
}
/*
///////////////////////////////////////////////////////////////////////////////
// Give hints about this item
///////////////////////////////////////////////////////////////////////////////
function GetHints(P2Pawn PawnOwner, out String str1, out String str2, out String str3,
				  out byte InfiniteHintTime)
{
	local P2Player checkp;

	checkp = P2Player(PawnOwner.Controller);

	if(checkp.InterestPawn != None
		&& PersonController(checkp.InterestPawn.Controller) != None)
		PersonController(checkp.InterestPawn.Controller).GetInvHint(self, str1);
}
*/
///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bUseCashierHints=true
    bUsePaidHints=false
    bThrowIndividually=false
    ExamineAnimType="Book"
    Hint1="Press %KEY_InventoryActivate% to pay."
    PowerupName="Money"
    PowerupDesc="Makes the world go round."
    InventoryGroup=103
    GroupOffset=51
    PickupClass=Class'MoneyPickup'
    Icon=Texture'nathans.Inventory.MoneyInv'
}