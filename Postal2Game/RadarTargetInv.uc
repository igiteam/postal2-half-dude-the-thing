///////////////////////////////////////////////////////////////////////////////
// RadarTargetInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Backup for radar inv, plugs into it (when used with radar)
//
///////////////////////////////////////////////////////////////////////////////

class RadarTargetInv extends OwnedInv;

///////////////////////////////////////////////////////////////////////////////
// vars
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Active state: this inventory item is armed and ready to rock!
///////////////////////////////////////////////////////////////////////////////
state Activated
{
	function bool PlugIn()
	{
		local P2Pawn CheckPawn;

		CheckPawn = P2Pawn(Owner);

		if(P2Player(CheckPawn.Controller) != None
			&& P2Player(CheckPawn.Controller).StartRadarTarget())
		{
			TurnOffHints();
			ReduceAmount(1);
			return true;
		}
		return false;
	}
Begin:
	PlugIn();
	GotoState('');
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    ExamineAnimType="Letter"
    ExamineDialog=Sound'DudeDialog.dude_ithinkineedthat'
    Hint1="Press %KEY_InventoryActivate% when your BassSniffer Fish Radar is active to"
    Hint2="play a happy game! Try to play when you have fish on your radar."
    PowerupName="'Chompy' Plug-In"
    PowerupDesc="Plays a fun game on your Bass Sniffer Radar! Try to play when you have fish on the radar."
    InventoryGroup=101
    GroupOffset=10
    PickupClass=Class'RadarTargetPickup'
    Icon=Texture'HUDPack.Icons.Icon_Inv_Chompy'
}