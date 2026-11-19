//-----------------------------------------------------------
//
//-----------------------------------------------------------
class DOTZDeathMatch extends DOTZMPGameBase;


/*****************************************************************
 * ScoreKill
 *****************************************************************
 */
function ScoreKill(Controller Killer, Controller Other)
{
    if( (killer == Other) || (killer == None) )
    {
        if (Other!=None)
        {
        Other.PlayerReplicationInfo.Score -= 1;
            ScoreEvent(Other.PlayerReplicationInfo,-1,"self_frag");
        }
    }
    else if ( killer.PlayerReplicationInfo != None )
    {
      //don't count zombies as a score in deathmatch
      if (Other.IsA('PlayerController')){

         //if not a team game, give the guy a personal kill when a player dies
         if (bTeamGame == false){
            Killer.PlayerReplicationInfo.Score += 1;
         }

       //add a point (if this is a team game) to the team score
         //give the killer a personal point too, just for their interest
         if (Killer.PlayerReplicationInfo.Team != none &&
             Killer.PlayerReplicationInfo.Team.TeamIndex != Other.PlayerReplicationInfo.Team.TeamIndex ){
             Killer.PlayerReplicationInfo.Team.Score+=1;
            Killer.PlayerReplicationInfo.Score += 1;
         }

         // CARROT: Added this so if you kill someone on your own team, your score goes down. Bug 875
         if (bTeamGame == true &&
             Killer.PlayerReplicationInfo.Team != none &&
             Killer.PlayerReplicationInfo.Team.TeamIndex == Other.PlayerReplicationInfo.Team.TeamIndex ){
            Killer.PlayerReplicationInfo.Score -= 1;
            Killer.PlayerReplicationInfo.Kills -= 2;    // One added later
         }
      }

       Killer.PlayerReplicationInfo.Kills++;
        ScoreEvent(Killer.PlayerReplicationInfo,1,"frag");
    }

    if ( GameRulesModifiers != None )
        GameRulesModifiers.ScoreKill(Killer, Other);

    if ( (Killer != None) || (MaxLives > 0) )
    CheckScore(Killer.PlayerReplicationInfo);
}

/*****************************************************************
 * InitGameReplicationInfo
 * Set up data that players will use
 *****************************************************************
 */
function InitGameReplicationInfo()
{
    super.InitGameReplicationInfo();
    if( bTeamGame )
        GameReplicationInfo.MatchID = ID_TDM;
    else
        GameReplicationInfo.MatchID = ID_DM;
}


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    HUDType="DOTZGame.DOTZDeathMatchHUD"
}