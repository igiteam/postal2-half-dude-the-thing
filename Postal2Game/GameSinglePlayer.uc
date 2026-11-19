///////////////////////////////////////////////////////////////////////////////
// GameSinglePlayer.uc
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// This defines the Postal 2 single-player game.
//
// History:
//	07/10/02 MJR	Started by copying errand stuff from DudePlayer.
//
///////////////////////////////////////////////////////////////////////////////
class GameSinglePlayer extends P2GameInfoSingle;


var float NewCatTime;	// When we'll make a new cat
var float CatRainTime;	// When we'll start raining again
var bool  bRainingCats;

const NEW_CAT_BASE_TIME	= 1;
const NEW_CAT_RAND_TIME	= 6;
const RAIN_BASE_TIME	= 25;
const RAIN_RAND_TIME	= 50;
const CAT_MAKE_RANGE_DIST=4000;
const CAT_MAKE_RANGE_XY = 1500;
const CAT_MAKE_BASE_DIST= 200;
const CAT_MAKE_Z		= 3000;
const CAT_RAIN_SPEED	= 100;
const CAT_RAIN_ACC		= -1200;

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

// Nightmare stuff that won't go in P2GameInfoSingle due to dependency issue
/*
function bool PickupQuery( Pawn Other, Pickup item )
{
	// In nightmare mode, prevent stored health pickups other than crack.
	if (P2Pawn(Other) != None)
		if (Item.Class == class'FastFoodPickup'
			|| Item.Class == class'PizzaPickup'
			|| Item.Class == class'DonutPickup'
			|| Item.Class == class'CrackPickup')
		{
			if (P2Pawn(Other).Health >= P2Pawn(Other).HealthMax)
				return false;
		}

	return Super.PickupQuery(Other, Item);
}
*/

event PostTravel(P2Pawn PlayerPawn)
	{
	local Inventory InvAdd;
	local P2PowerupInv ppinv;
	local ClothesPickup clothes;
	local RadarTargetPickup chompy;
	
	const NIGHTMARE_RADAR_MIN = 2000;
	const VETERAN_RADAR_MIN = 100;

	// Take away the clipboard mission in They Hate Me mode
	if (TheyHateMeMode())
		Days[1] = DayBase'DayBase1Impossible';

	Super.PostTravel(PlayerPawn);

	// In nightmare mode, give him a radar with a long battery life
	if (InNightmareMode())
	{
		// xPatch: no infinite radar in super-hard mode for masochists :)
		// But give them something to start with though.
		if(InVeteranMode())
		{
			// Only on the start of a day 
			if(TheGameState.bFirstLevelOfDay)
			{
				// Check if they have it, if not create it.
				invadd = PlayerPawn.FindInventoryType(class'RadarInv');
				if(invadd == None)
					invadd = PlayerPawn.CreateInventoryByClass(class'RadarInv');
					
				ppinv = P2PowerupInv(invadd);
				// And make sure they don't have less than this amount
				if(ppinv != None && ppinv.Amount < VETERAN_RADAR_MIN)
					ppinv.SetAmount(VETERAN_RADAR_MIN);
			}
		}
		else
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

		// xPatch: Instead of deleting clothes I modified 
		// DudeDressedAsCop and DudeDressedAsGimp in LambController.uc
		// to make sure they attack the player. Seems like a more reasonable solution.
/*		// Delete clothes pickups the dude could use to sneak around town.
		foreach DynamicActors(class'ClothesPickup', clothes)
		{
			if (!clothes.bUseForErrands
				&& DudeClothesPickup(Clothes) == None
				&& GimpClothesPickupErrand(Clothes) == None)
				clothes.Destroy();
		}
*/	
	}
	
	// xPatch: Delete chompy plug-in in this mode, it's "slightly" overpowered.
	if(InVeteranMode())
	{
		foreach DynamicActors(class'RadarTargetPickup', chompy)
			chompy.Destroy();
	}

	// Check for the dude's bandaged head
	CheckDudeHeadSkin();
}

///////////////////////////////////////////////////////////////////////////////
// xPatch: Make cats crazy on weekend and on Ludicrous difficulty
///////////////////////////////////////////////////////////////////////////////
function bool CrazyCats()
{
	return (IsWeekend() || InLudicrousMode());
}


// Moved to their respective inventory classes.
/*
event InitGame(out string Options, out string Error)
{
	Super.InitGame(Options, Error);

	// Nightmare mode stuff
	if (InNightmareMode())
	{
		// In nightmare mode, prevent stored health pickups other than crack.
		class'FastFoodPickup'.Default.InventoryType = class'FastFoodInvAuto';
		class'PizzaPickup'.Default.InventoryType = class'PizzaInvAuto';
		class'DonutPickup'.Default.InventoryType = class'DonutInvAuto';
		class'CrackPickup'.Default.InventoryType = class'MedKitInv';
//		class'MaDBeerPickup'.Default.InventoryType = class'AW7Inventory.MadBeerInvAuto';

		// Animals go crazy
		//foreach DynamicActors(class'AnimalPawn', Animal)
		//	Animal.bGunCrazy = True;
	}
	else
	{
		class'FastFoodPickup'.Default.InventoryType = class'FastFoodInv';
		class'PizzaPickup'.Default.InventoryType = class'PizzaInv';
		class'DonutPickup'.Default.InventoryType = class'DonutInv';
		class'CrackPickup'.Default.InventoryType = class'CrackInv';
//		class'MaDBeerPickup'.Default.InventoryType = class'MadBeerInv';
	}
}
*/
///////////////////////////////////////////////////////////////////////////////
// Reach into entry and put a new reference to every chameleon texture/meshes in this
// level.
///////////////////////////////////////////////////////////////////////////////
function StoreChams()
{
	local LevelInfo lev;
	local TextureLoader texl;
	local MeshLoader mesher;
	local Actor checkme;
	local PersonPawn checkpawn;

	lev = GetPlayer().GetEntryLevel();

	//log(self$" StoreChams "$lev);

	foreach lev.AllActors(class'Actor', checkme)
	{
		if(TextureLoader(checkme) != None)
			texl = TextureLoader(checkme);
		else if(MeshLoader(checkme) != None)
			mesher = MeshLoader(checkme);
	}

	//log(self$" checking texture loader "$mesher$" mesh loader "$mesher);
	if(texl != None
		&& mesher != None)
	{
		// Clear the lists
		texl.ClearArray();
		mesher.ClearArray();
		// Now go through each pawn and put their textures/meshes into the list
		foreach DynamicActors(class'PersonPawn', checkpawn)
		{
			texl.AddTexture(checkpawn.Skins[0]);
			mesher.AddMesh(checkpawn.Mesh);
			if(checkpawn.MyHead != None)
			{
				texl.AddTexture(checkpawn.MyHead.Skins[0]);
				mesher.AddMesh(checkpawn.MyHead.Mesh);
			}
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
// Check to rain cats during the apocalypse
///////////////////////////////////////////////////////////////////////////////
function CheckCatRain(float DeltaTime)
{
	local P2Player p2p;
	local CatRocket catr;
	local vector dir, StartLoc;
	local float tempf;

	CatRainTime -= DeltaTime;

	// Check to toggle rain
	if(CatRainTime <= 0)
	{
		bRainingCats = !bRainingCats;
		if(bRainingCats)
			CatRainTime = RAIN_BASE_TIME + Rand(RAIN_RAND_TIME);
		else
			CatRainTime = Rand(RAIN_BASE_TIME);
	}

	if(bRainingCats)
	{
		NewCatTime -= DeltaTime;
		if(NewCatTime <= 0)
		{
			p2p = GetPlayer();
			if(p2p != None
				&& p2p.MyPawn != None)
			{
				NewCatTime = NEW_CAT_BASE_TIME + Rand(NEW_CAT_RAND_TIME);
				// Make it generally in front of the player
				// Move it in front of him
				StartLoc = vector(p2p.MyPawn.Rotation);
				StartLoc.z = 0;
				StartLoc = (FRand()*CAT_MAKE_RANGE_DIST + CAT_MAKE_BASE_DIST) * StartLoc;
				// Vaguely center the rain if he's dead
				if(p2p.MyPawn.Health <= 0)
				{
					tempf = 0.5*(CAT_MAKE_RANGE_DIST + CAT_MAKE_BASE_DIST);
					StartLoc.x += tempf;
					StartLoc.y += tempf;
				}
				// Now create a range around that point
				tempf = (0.5*CAT_MAKE_RANGE_XY);
				StartLoc.x = StartLoc.x + (FRand()*CAT_MAKE_RANGE_XY - tempf);
				StartLoc.y = StartLoc.y + (FRand()*CAT_MAKE_RANGE_XY - tempf);
				// Move it above him
				StartLoc.z += CAT_MAKE_Z;
				StartLoc = StartLoc + p2p.MyPawn.Location;
				dir = VRand();
				dir.z=-1;
				catr = spawn(class'CatRocket',,,StartLoc,Rotator(dir));
				if(catr != None)
				{
					catr.AmbientGlow=255;	// make them pulse so they're easier to see.
					// modify speed for a gentle rain
					Dir = vector(catr.Rotation);
					catr.Velocity = CAT_RAIN_SPEED * Dir;
					catr.Acceleration.z = CAT_RAIN_ACC;
				}
			}
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// Monitor things in the game, and rain cats
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state RunningApocalypse
{
	function BeginState()
	{
		Super.BeginState();
		// Init new cat time, the first time the level starts
		NewCatTime = NEW_CAT_BASE_TIME + Rand(NEW_CAT_RAND_TIME);
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    Days=/* Array type was not detected. */
    GameNameShort="POSTAL 2"
    GameDescription="The original POSTAL 2. Live a life in the week of 'The POSTAL Dude', a hapless everyman just trying to check off some chores."
    IntroURL="intro.fuk"
    StartFirstDayURL="suburbs-3"
    StartNextDayURL="suburbs-3"
    FinishedDayURL="homeatnight"
    JailURL="police.fuk#cell"
    ApocalypseTex="AW7Tex.Misc.ApocalypseNewspaper"
    KissEmitterClass=Class'FX2.KissEmitter'
    HolidaySpawnerClassName="Postal2Holidays.HolidaySpawner"
    GameStateClass=Class'AWGameState'
    LoadoutDays=/* Array type was not detected. */
    ChameleonClass=Class'ChameleonPlus'
    HUDType="GameTypes.AWWrapHUD"
    DefaultPlayerName="TheDude"
    GameName="POSTAL 2"
    PlayerControllerClassName="GameTypes.AWDudePlayer"
}