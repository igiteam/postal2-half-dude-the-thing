///////////////////////////////////////////////////////////////////////////////
// ACTION_TakeInventoryFromPlayer
// Removes inventory item from player if they have it.
///////////////////////////////////////////////////////////////////////////////
class ACTION_TakeInventoryFromPlayer extends P2ScriptedAction;

///////////////////////////////////////////////////////////////////////////////
// Public vars
///////////////////////////////////////////////////////////////////////////////
var(Action) class<Inventory> InvType;	// Class of inventory to take

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function bool InitActionFor(ScriptedController C)
{
	local P2Pawn P;
	local Inventory ThisInv;
	local bool bWasHands;

	P = GetPlayerPawn(C);

	if (P != None && InvType != None)
	{
		for (ThisInv = P.Inventory; ThisInv != None; ThisInv = ThisInv.Inventory)
		{
			if (ThisInv.Class == InvType)
			{
				// If this is their current weapon, switch 'em out to hands first.
				if (P.Weapon == ThisInv)
					bWasHands = true;
				P.DeleteInventory(ThisInv);
				if (bWasHands)
					P2Player(P.Controller).ToggleToHands(true);				
			}
		}
	}

	return false;
}

function string GetActionString()
	{
		return ActionString@InvType;
	}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="Take inventory"
}