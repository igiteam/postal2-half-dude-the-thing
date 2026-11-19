///////////////////////////////////////////////////////////////////////////////
// GameSinglePlayerDemo.uc
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// This defines the Postal 2 single-player DEMO game
//
// History:
//	10/15/02 MJR	Started.
//
///////////////////////////////////////////////////////////////////////////////
class GameSinglePlayerDemo extends P2GameInfoSingle;


var	localized string YouHaveMessage;		// Helpful text telling the player how much time
var localized string MinutesMessage;		// he has left to enjoy the demo.
var localized string MinuteMessage;
var localized string SecondsMessage;

var float	LastDemoTime;					// Used for determining which message to display



const SEC_CHECK_1	=	30;					// Second time checks for timing out of the demo.
const SEC_CHECK_2	=	15;


///////////////////////////////////////////////////////////////////////////////
// Quit the demo game.
// NOTE: Player may not have a pawn if he's dead or a cinematic is playing.
///////////////////////////////////////////////////////////////////////////////
function QuitDemoGame(P2Player p2p)
{
	P2RootWindow(p2p.Player.InteractionMaster.BaseMenu).TimedOutDemo();

	//bQuitting = true;

	// Send player to main menu (set flag to indicate that pawn might be none)
	//SendPlayerTo(GetPlayer(), MainMenuURL, true);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// StartUp
// Do things at the absolute last moment before the game starts
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
auto state StartUp
{
	///////////////////////////////////////////////////////////////////////////////
	// The gameinfo has everything ready so now we tell the player controller
	// to prepare itself for a save. Make sure though, that it's allowed--demo versions can't save.	
	// Instead, the demo version forces the map to come up, since the Intro movie isn't there
	// to have the map come up. Only do this though, on the start of the first day
	// in the first level.
	///////////////////////////////////////////////////////////////////////////////
	function PrepPlayerStartup()
	{
		local P2Player p2p;

		p2p = GetPlayer();

		//log(self$" PrepPlayerStartup "$p2p$" first "$TheGameState.bFirstLevelOfDay);
		if(p2p != None
			&& TheGameState.bFirstLevelOfDay)
		{
			//log(self$" requesting map ");
			p2p.ForceMapUp();
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// RunningDemo
// Monitor things in the game as it runs, including the temp timer for 
// limiting per-play demo time.
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state RunningDemo
{
/*	///////////////////////////////////////////////////////////////////////////////
	// Decide if it's time to display a new message saying how much longer you have
	// and which one.
	// TheGameState has the demo time so it can be travelled.
	///////////////////////////////////////////////////////////////////////////////
	function CheckDisplayTime()
	{
		local int min;
		local int lastmin;
		local P2Player p2p;
		local string UseMess;

		// Only move time along if you're not paused and you have a valid player (so if
		// he's dead, don't do anything with time)
		p2p = GetPlayer();

		if(p2p != None
			&& p2p.Pawn != None
			&& p2p.Pawn.Health > 0
			&& p2p.Level.Pauser == None
			&& TheGameState != None)
		{
			LastDemoTime = TheGameState.DemoTime;
			TheGameState.DemoTime -= REVIVE_CHECK_TIME;

			//log(self$" demo time "$TheGameState.DemoTime$" last time "$LastDemoTime);

			// Actually end the demo
			if(TheGameState.DemoTime <= 0)
			{
				QuitDemoGame(p2p);
			}
			// Put up time till end message
			else if(TheGameState.DemoTime > SEC_CHECK_1)
			{
				min = TheGameState.DemoTime/60;
				lastmin = LastDemoTime/60;

				if(min != lastmin)
				{
					if(lastmin == 1)
						UseMess = YouHaveMessage$lastmin$MinuteMessage;
					else
						UseMess = YouHaveMessage$lastmin$MinutesMessage;
				}
			}
			else
			{
				if(LastDemoTime > SEC_CHECK_1
					&& TheGameState.DemoTime <= SEC_CHECK_1)
					UseMess = YouHaveMessage$SEC_CHECK_1$SecondsMessage;
				else if(LastDemoTime > SEC_CHECK_2
					&& TheGameState.DemoTime <= SEC_CHECK_2)
					UseMess = YouHaveMessage$SEC_CHECK_2$SecondsMessage;
			}

			//log(self$" use mess "$UseMess);
			if(UseMess != "")
			{
				p2p.ClientMessage(UseMess);
			}
		}
	} */

Begin:
	Sleep(REVIVE_CHECK_TIME);
	CheckToRevivePawns();
//	CheckDisplayTime();
	Goto('Begin');
}



// Decompiled with UE Explorer.
defaultproperties
{
    YouHaveMessage="You have "
    MinutesMessage=" minutes remaining in the demo."
    MinuteMessage=" minute remaining in the demo."
    SecondsMessage=" seconds remaining in the demo."
    Days=/* Array type was not detected. */
    IntroURL="Intro.fuk"
    StartFirstDayURL="Suburbs-demo.fuk"
    StartNextDayURL="Suburbs-demo.fuk"
    FinishedDayURL="HomeAtNight.fuk"
    JailURL="Police.fuk#cell"
    RunningStateName="RunningDemo"
    bIsDemo=true
    DefaultPlayerName="TheDude"
    GameName="Postal2 Single Player"
}