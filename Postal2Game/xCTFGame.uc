class xCTFGame extends CTFGame;

var RedFlag GameRedFlag;
var BlueFlag GameBlueFlag;

State MatchInProgress
{
	// Merged from ut2199, styled after bombing run, this replicates the two
	// flag positions all the time
	function Timer()
	{
        Super.Timer();

		if ( GameRedFlag == None 
			|| GameRedFlag.bDeleteMe)
			ForEach DynamicActors(class'RedFlag',GameRedFlag)
				break;
		if ( GameBlueFlag == None 
			|| GameBlueFlag.bDeleteMe)
			ForEach DynamicActors(class'BlueFlag',GameBlueFlag)
				break;

		if ( GameRedFlag != None )
			GameReplicationInfo.FlagPos[0] = GameRedFlag.Position().Location;
		if ( GameBlueFlag != None )
			GameReplicationInfo.FlagPos[1] = GameBlueFlag.Position().Location;
	}
}

State MatchOver
{
Begin:
	// Start party right away so nobody notices that there's only one chick
	PartyForTheWinner(EndGameFocus);
	Sleep(WaitForWinnerAnnouncement);
	PlayEndOfMatchMessage();
}


// Decompiled with UE Explorer.
defaultproperties
{
    LevelRulesClass=Class'LevelGamePlay'
    MatchIntroClassName="MultiGame.TeamIntro"
    GameBaseEquipment=/* Array type was not detected. */
    MapNameGameCode="s"
    ScoreBoardType="MultiGame.CTFScoreboard"
    HUDType="MultiGame.CTFHUD"
    MapListType="MultiGame.CTFmaplist"
    DeathMessageClass=Class'xDeathMessage'
    MutatorClass="MultiGame.xMutator"
    GameReplicationInfoClass=Class'MultiBase.CTFGameReplicationInfo'
}