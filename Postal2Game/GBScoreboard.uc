///////////////////////////////////////////////////////////////////////////////
// Copyright 2023 Running With Scissors Studios LLC.  All Rights Reserved.
//
// GrabBag version of multiplayer scoreboard.
//
///////////////////////////////////////////////////////////////////////////////
class GBScoreBoard extends MpScoreBoard;


var localized string			GBHints[48];
var const int					GBHintMax;


///////////////////////////////////////////////////////////////////////////////
// Add our hints to pool of hints
// Returns the number of game-specific hints that were added.
///////////////////////////////////////////////////////////////////////////////
function int AddHints()
{
	local int i;
	local int existing;

	// This is written to allow this class to be extended and to have the
	// extended class add additional game-specific hints before calling this.
	existing = AllHints.length;
	for (i = 0; i < GBHintMax; i++)
	{
		AllHints.insert(existing + i, 1);
		AllHints[existing + i] = GBHints[i];
	}
	i = AllHints.length;

	Super.AddHints();

	return i;
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    GBHints[0]="Grab 10 Bags to Win!"
    GBHints[1]="You gain more attack power with each bag!"
    GBHints[2]="You get 25% more powerful with each bag you grab."
    GBHints[4]="The extra power you get from grabbing bags helps you defend"
    GBHints[5]="yourself when everyone else tries to get them from you!"
    GBHints[6]="Each of your weapons gets stronger the more bags you have!"
    GBHints[8]="Pistol headshots normally kill with 2 shots but get more powerful"
    GBHints[9]="with each bag you have.  With 4 bags they take just 1 shot."
    GBHints[10]="When people are killed they drop all their bags."
    GBHints[11]="That's the time to sweep in and grab them!"
    GBHints[12]="Dropped bags show up as yellow starfish on the radar."
    GBHints[14]="People without bags show up as WHITE fish on the radar."
    GBHints[15]="People with bags show up as RED fish -- go after them!"
    GBHints[16]="Bags automatically return to their original positions 30 seconds"
    GBHints[17]="after being dropped -- if they aren't picked up before then."
    GBHints[18]="Players with bags will ALWAYS show up on the radar!"
    GBHintMax=20
    ScoreGoalString="Bag Goal:"
    ScoreString="Bags"
    MatchHintText1="Grab 10 Bags to Win!"
    MatchHintText2="You gain more attack power with each bag!"
    OldDeathCount=0
}