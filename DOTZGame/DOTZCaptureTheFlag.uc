//-----------------------------------------------------------
//
//-----------------------------------------------------------
class DOTZCaptureTheFlag extends DOTZMPGameBase;

var array<Sound> RedTeamScores;
var array<Sound> BlueTeamScores;
var array<Sound> RedTeamTakesLead;
var array<Sound> BlueTeamTakesLead;

/*****************************************************************
 * PostBeginPlay
 *****************************************************************
 */
function PostBeginPlay(){
    Super.PostBeginPlay();
    SetTeamFlags();
}
/*****************************************************************
 * SetTeamFlags
 *****************************************************************
 */
function SetTeamFlags(){
    local CTFFlag F;

    // associate flags with teams
    foreach AllActors(Class'CTFFlag',F) {
        F.Team = GameReplicationInfo.Teams[F.TeamType];
        F.Team.HomeBase = F.HomeBase;
    }
}

/*****************************************************************
 * ScoreKill
 *****************************************************************
 */
/*****************************************************************
 * ScoreKill
 *****************************************************************
 */
function ScoreKill(Controller Killer, Controller Other)
{
//  if( (killer == Other) || (killer == None) )
//  {
//      if (Other!=None)
  //      {
    //      Other.PlayerReplicationInfo.Score -= 1;
        //  ScoreEvent(Other.PlayerReplicationInfo,-1,"self_frag");
//        }
    //}
    if ( killer.PlayerReplicationInfo != None &&
         Killer.PlayerReplicationInfo.Team.TeamIndex != Other.PlayerReplicationInfo.Team.TeamIndex)
    {
      //don't count zombies as a score in deathmatch
      //if (Other.IsA('PlayerController')){
            //Killer.PlayerReplicationInfo.Score += 1;
//      }
        Killer.PlayerReplicationInfo.Kills++;
    }
}


/*****************************************************************
 * Killed
 * Monitor killed messages for fraglimit
 *****************************************************************
 */
//function Killed( Controller Killer, Controller Killed, Pawn KilledPawn, class<DamageType> damageType )
//{
   //super.Killed(Killer, Killed, KilledPawn, damageType);
   //CheckScore(Killer.PlayerReplicationInfo);
//}

/*****************************************************************
 * DiscardInventory
 *****************************************************************
 */
function DiscardInventory( Pawn Other )
{
    if ( (Other.PlayerReplicationInfo != None) && (Other.PlayerReplicationInfo.HasFlag != None) )
        CTFFlag(Other.PlayerReplicationInfo.HasFlag).Drop(0.5 * Other.Velocity);

    Super.DiscardInventory(Other);

}

/*****************************************************************
 * Logout
 *****************************************************************
 */
function Logout(Controller Exiting)
{
    if ( Exiting.PlayerReplicationInfo.HasFlag != None )
        CTFFlag(Exiting.PlayerReplicationInfo.HasFlag).Drop(vect(0,0,0));
    Super.Logout(Exiting);
}


/*****************************************************************
 * ScoreObjective
 *****************************************************************
 */
function ScoreObjective(PlayerReplicationInfo Scorer, Int Score)
{
   local int TeamNum;
   TeamNum = Scorer.Team.TeamIndex;
   super.ScoreObjective(Scorer, Score);

   //give the player a personal point, just for the record
   Scorer.Score += Score;

   if (TeamNum == 0){
      TeamAnnounce(0,RedTeamScores);
      TeamAnnounce(1,RedTeamScores);
   } else {
      TeamAnnounce(0,BlueTeamScores);
      TeamAnnounce(1,BlueTeamScores);
   }
}

/*****************************************************************
 * InitGameReplicationInfo
 * Set up data that players will use
 *****************************************************************
 */
function InitGameReplicationInfo()
{
    super.InitGameReplicationInfo();
    GameReplicationInfo.MatchID = ID_CTF;
}



//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    RedTeamScores[0]=Sound'DOTZXAnnouncer.CTF.CTFRedScore01'
    RedTeamScores[1]=Sound'DOTZXAnnouncer.CTF.CTFRedScore02'
    BlueTeamScores[0]=Sound'DOTZXAnnouncer.CTF.CTFBlueScore01'
    BlueTeamScores[1]=Sound'DOTZXAnnouncer.CTF.CTFBlueScore02'
    RedTeamTakesLead[0]=Sound'DOTZXAnnouncer.CTF.CTFRedLead'
    BlueTeamTakesLead[0]=Sound'DOTZXAnnouncer.CTF.CTFBlueLead'
    bTeamGame=true
    HUDType="DOTZGame.DOTZCaptureTheFlagHUD"
}