///////////////////////////////////////////////////////////////////////////////
// Apocalypse Weekend Single Player game info
// Copyright 2004 Running With Scissors, Inc.  All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
class AWGameSPFinal extends AWGameSP;

// In nightmare mode, give the dude a fish radar
event PostTravel(P2Pawn PlayerPawn)
	{
	local Inventory InvAdd;
	local P2PowerupInv ppinv;

	const NIGHTMARE_RADAR_MIN = 2000;
	
	Super.PostTravel(PlayerPawn);

	// In nightmare mode, give him a radar with a long battery life
	if (InNightmareMode())
	{
		// xPatch: no infinite radar in super-hard Veteran Mode :)
		if(!InVeteranMode())
		{
			invadd = PlayerPawn.CreateInventoryByClass(class'RadarInv');
			//log(Self$" invadd "$invadd);
			// Make sure they have enough--if you have more than this, that's fine.
			ppinv = P2PowerupInv(invadd);
			if(ppinv != None
				&& ppinv.Amount < NIGHTMARE_RADAR_MIN)
				ppinv.SetAmount(NIGHTMARE_RADAR_MIN);

			// Force it to activate immediately if not already active.
			if (ppinv != None
				&& !ppinv.IsInState('Operating'))
			{
				ppinv.bDisplayAmount = False;	// xPatch: No need to show amount in expert mode (it's infinite)
				if(TheGameState.bFirstLevelOfDay)
					ppinv.Activate();
			}
		}
	}
	
	CheckDudeHeadSkin();	// xPatch:
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
/*
function bool PickupQuery( Pawn Other, Pickup item )
{
	if(P2WeaponPickup(item) == None
		|| AWDude(Other) == None
		|| AWDude(Other).GaryHeads <= 0
		|| AWDudePlayer(AWDude(Other).Controller).bNeverSwitchOnPickup)	// This variable gets stored and
		// switched to true on creation of a gary head, but if the user goes into the
		// options and switches it manually back and forth, it will come undone. We don't
		// want them doing this, so if they do, don't let them pick up the gun at all.
		// It'll all be back to normal when the heads are gone anyway.
		return Super.PickupQuery(Other, item);
	else
		return false;
}*/


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// xPatch: Not really needed for the head but for the HD Dude skin.
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Check to swap out the postal dude's bandaged head skin.
///////////////////////////////////////////////////////////////////////////////
function CheckDudeHeadskin()
{
	local AWPostalDude TheDude;

	foreach DynamicActors(class'AWPostalDude', TheDude)
		TheDude.DudeCheckHeadSkin();
}

///////////////////////////////////////////////////////////////////////////////
// As soon as we have a valid game state, check for the dude's bandaged head
///////////////////////////////////////////////////////////////////////////////
event PostLoadGame()
{
	Super.PostLoadGame();
	CheckDudeHeadSkin();
}


// Decompiled with UE Explorer.
defaultproperties
{
    Days=/* Array type was not detected. */
    GameNameShort="Apocalypse Weekend"
    GameDescription="The expansion pack for POSTAL 2. It's the weekend, and your trailer's been impounded, your dog is about to be put to sleep, and your hateful wife has left you... well, at least it isn't all bad."
    KissEmitterClass=Class'FX2.KissEmitter'
    HolidaySpawnerClassName="Postal2Holidays.HolidaySpawner"
    MenuTitleTex="AW_ProductName.ProductMenu"
    LoadoutDays=/* Array type was not detected. */
    bAllowBehindView=true
    DefaultPlayerClassName="GameTypes.AWPostalDude"
    HUDType="GameTypes.AWWrapHUD"
    GameName="POSTAL 2: Apocalypse Weekend"
    PlayerControllerClassName="GameTypes.AWDudePlayer"
}