///////////////////////////////////////////////////////////////////////////////
// MapInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Inventory item that is the paper, folded map of the town
// of Paradise that the player is walking around in.
//
// Activating it, pauses the game and brings it up
//
///////////////////////////////////////////////////////////////////////////////

class MapInv extends P2PowerupInv;

///////////////////////////////////////////////////////////////////////////////
// Active state: this inventory item is armed and ready to rock!
///////////////////////////////////////////////////////////////////////////////
state Activated
{
	function LookAtIt()
	{
		local P2Player Player;

		Player = P2Player(P2Pawn(Owner).Controller);
		if (Player != None)
		{
			TurnOffHints();	// When you use it, turn off the hints

			Player.RequestMap();
		}
	}
Begin:
	LookAtIt();
	GotoState('');
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bCanThrow=false
    Hint1="Press %KEY_InventoryActivate%"
    Hint2="to view the map."
    bCannotBeStolen=true
    PowerupName="Town Map"
    PowerupDesc="Useful for getting around town."
    InventoryGroup=103
    GroupOffset=53
    Icon=Texture'HUDPack.Icons.Icon_Inv_Map'
}