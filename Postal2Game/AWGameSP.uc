///////////////////////////////////////////////////////////////////////////////
// Apocalypse Weekend Single Player game info
// Copyright 2023 Running With Scissors Studios LLC.  All Rights Reserved.
//
// Game info that drives the add on pack.
//
// Kamek 8/11 backport from AW.
///////////////////////////////////////////////////////////////////////////////
//class AWGameSP extends AWInvGameSP;
class AWGameSP extends P2GameInfoSingle;

const DAY_SUNDAY = 1;
var() string SundayUrl;

///////////////////////////////////////////////////////////////////////////////
// Don't allow reminder hints in add-on. No map here.
///////////////////////////////////////////////////////////////////////////////
function bool AllowReminderHints()
{
	return false;
}

// Always the weekend in AW.
function bool IsWeekend()
{
	return true;
}
// returns true for AW-only game
function bool WeekendOnlyGame()
{
	return true;
}
// returns true if we use saturday or sunday at all
function bool WeekendGame()
{
	return true;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function RecordEnding()
{
	GOver = GOVER_SUM - GameRefVal;
	TimesBeatenAW++;
	ConsoleCommand("set "@GOverPath@GOver);
	ConsoleCommand("set "@TimesBeatenAWPath@TimesBeatenAW);
}	

// NOTE: Not needed anymore, we have days with StartDayURL
/*
///////////////////////////////////////////////////////////////////////////////
// Send player to the next day
///////////////////////////////////////////////////////////////////////////////
function SendPlayerToNextDay(PlayerController player)
{
	// See if there's any more days
	if (TheGameState.CurrentDay + 1 < Days.length)
	{
		TheGameState.bChangeDayPostTravel = true;
		TheGameState.NextDay = TheGameState.CurrentDay + 1;
		if (TheGameState.NextDay == DAY_SUNDAY)
			SendPlayerTo(player, SundayURL);
		else
			SendPlayerTo(player, StartNextDayURL);
	}
	else
	{
		// This shouldn't happen because the end-of-game movie
		// should end up calling EndOfGame() instead.  If it does
		// happen we'll treat it like a quit.
		QuitGame();
	}
}
*/


// Decompiled with UE Explorer.
defaultproperties
{
    SundayUrl="VincesHouse.fuk#Pad1?peer"
    Days=/* Array type was not detected. */
    IntroURL="MovieIntro.fuk"
    StartFirstDayURL="Hospital.fuk"
    StartNextDayURL="custest.fuk"
    GameStateClass=Class'AWGameState'
    StatsScreenClassName="GameTypes.AWStatsScreen"
    DayNames=/* Array type was not detected. */
    MainMenuURL="AWstartup"
    ChameleonClass=Class'ChameleonPlus'
    DefaultPlayerClassName="AWPawns.AWDude"
    DefaultPlayerName="TheDude"
    GameName="Apocalypse Weekend"
    PlayerControllerClassName="GameTypes.AWPlayer"
}