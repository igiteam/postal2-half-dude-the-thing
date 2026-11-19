class CubemapMaker extends Keypoint;

var() bool bEnabled;			// If true, playing this map will automatically take a cubemap screenshot at this location. NORMAL PLAY WILL BE IMPOSSIBLE.

var PlayerController Player;

var array<Rotator> Rotations;

simulated event PostBeginPlay()
{
	GotoState('Init');
}

function FindPlayer()
{
	local PlayerController PC;
	local Pawn P;
	
	if (!bEnabled) // Not used
	{
		Destroy();
		return;
	}
	
	// Turn off all pawns
	foreach DynamicActors(class'Pawn', P)
		P.bHidden = true;
		
	foreach DynamicActors(class'PlayerController', PC)
	{
		// Prep player for screenshots		
		PC.SetViewTarget(Self);
		PC.bZeroRoll = false;
		PC.Player.InteractionMaster = None; // hide all interactions
		
		/*
		while (PC.Player.LocalInteractions.Length > 0)
			PC.Player.InteractionMaster.RemoveInteraction(PC.Player.LocalInteractions[0]);
			
		while (PC.Player.InteractionMaster.GlobalInteractions.Length > 0)
			PC.Player.InteractionMaster.RemoveInteraction(PC.Player.InteractionMaster.GlobalInteractions[0]);
		*/

		Player = PC;
		break;
	}
	
	if (Player != None)
		GotoState('Screenshotting');
}

auto state() Init
{
Begin:
	// Wait for "saving start of new day" message to go away since we can't seem to hide it
	Sleep(5);
	FindPlayer();
}

state Screenshotting
{
	// Set resolution to 1024x1024, take six screenshots, then quit
Begin:
	Player.ConsoleCommand("DEBUG NONE");		// Hide map name output if on beta
	Player.ConsoleCommand("SETRES 1024x1024");	// Set to a proper texture size
	Sleep(0.1);									// Wait for refresh
	SetRotation(Rotations[0]);					// Take six cubemap screenshots, waiting a short time between each
	Sleep(0.1);
	Player.ConsoleCommand("shot");
	SetRotation(Rotations[1]);
	Sleep(0.1);
	Player.ConsoleCommand("shot");
	SetRotation(Rotations[2]);
	Sleep(0.1);
	Player.ConsoleCommand("shot");
	SetRotation(Rotations[3]);
	Sleep(0.1);
	Player.ConsoleCommand("shot");
	SetRotation(Rotations[4]);
	Sleep(0.1);
	Player.ConsoleCommand("shot");
	SetRotation(Rotations[5]);
	Sleep(0.1);
	Player.ConsoleCommand("shot");
	Sleep(0.1);
	Player.Consolecommand("quit");				// Quit the game because the game cannot be played now
}


// Decompiled with UE Explorer.
defaultproperties
{
    bEnabled=true
    Rotations[0]=none
    Rotations[1]=none
    Rotations[2]=none
    Rotations[3]=none
    Rotations[4]=none
    Rotations[5]=none
    bStatic=false
    InitialState="Init"
}