/**
 * FOTZGameInfo - the single player game type for DOTZ
 *
 * @version $1.0$
 * @author  Jesse Lachapelle (jesse@digitalextremes.com)
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @date    June 2004
 */
class DOTZGameInfo extends DOTZGameInfoBase;

var config string PauseMenuSP;
var config string DeadMenuSP;
var config string DeadMenuSPParam;

var config string ProfileMenu;

//===========================================================================
// Internal data
//===========================================================================


var int tickcount;

//dead message stuff
var Material SpectatingOverlay;

/*******************************************************************
 * Initialize the game.  The GameInfo's InitGame() function is called
 * before any other scripts (including PreBeginPlay() ), and is used
 * by the GameInfo to initialize parameters and spawn its helper
 * classes.  Warning: this is called before actors' PreBeginPlay.
 *******************************************************************
 */
event InitGame(String options, out String error){
   Super.InitGame(options, error);
   //Level.NetMode = NM_StandAlone;
   theObjMgr = Spawn( class'DOTZObjectivesManager' );
}

 /**
 * override normal hud with spectating overlay...
 */
function DrawToHud( Canvas c, float scaleX, float scaleY ) {
   local PlayerController pc;
   local float textWidth, textHeight;

   pc = Level.GetLocalPlayerController();


   if (pc.IsDead())
   {
      if (pc.IsA('XDotzPlayerController') == true){
        SpectatingMsg = "Game Over. Press START to continue.";
      } else {
        SpectatingMsg = "Game Over. Press fire to continue." ;
      }

      if ( SpectatingOverlay != none ) {
         c.SetPos( 384 * scaleX, 352 * scaleY );
         c.SetDrawColor( 255, 255, 255 );
         c.DrawTile( SpectatingOverlay, 512 * scaleX, 256 * scaleY,
                                              0, 0, 512, 256 );
      } else if ( SpectatingMsg != "" ) {
         c.TextSize( SpectatingMsg, textWidth, textHeight );
         c.SetPos( 640 * scaleX - (textWidth/2), 480 * scaleY );
         //c.Font = c.
         c.SetDrawColor( 255, 255, 255 );
//         c.bCenter = true;
         c.DrawText(SpectatingMsg );
  //       c.bCenter = false;
      }
   }
}

/*****************************************************************
 * SetPause
 *****************************************************************
 */
function bool SetPause( bool bPause, PlayerController pc ) {
   //if you are pausing and there is a pawn then bring up the menu
   // and pause the game, if you have no pawn and are still alive
   // (you are in a cinematic) then do nothing

   //short circuit the normal menu pause crap
   if (AdvancedPlayerController(pc).objVideoPlayer.VideoIsPlaying() )
   {
        if (AdvancedPlayerController(pc).objVideoPlayer.VideoIsPlaying() && bPause == false){
            AdvancedPlayerController(pc).objVideoPlayer.StopVideo();
        }
        return super.SetPause(bPause,pc);
   }

   //if you are dead
   if (pc.IsDead()){
      GuiController(pc.Player.InteractionMaster.GlobalInteractions[0])
           .OpenMenu(DeadMenuSP, DeadMenuSPParam);
      return Super.SetPause(bPause, pc);
   }

   //pausing and not in a cinematic
   if (bPause && !(pc.Pawn == None && pc.IsDead()==false))
   {
      GuiController(pc.Player.InteractionMaster.GlobalInteractions[0])
               .OpenMenu(PauseMenuSP);
      return Super.SetPause(bPause, pc);
   }
   //if you are unpausing then unpause
   else if (!bPause){
       return Super.SetPause(bPause, pc);
   }

   return true;
}

/*****************************************************************
 * Tick
 *****************************************************************
 */
event Tick(float delta){
    super.Tick(delta);
    if (Tickcount == 0){
        Tickcount++;
    } else if (tickcount == 1){
        tickcount++;
        LevelStart();
    }
}


/*****************************************************************
 *
 *****************************************************************
 */
function PostLoad(){
    local Projector temp;

    super.PostLoad();

    foreach Allactors(class'Projector', temp){
            if (ShadowProjector(temp) == none){
                temp.AttachProjector();
            }
    }
}


/*****************************************************************
 * LevelStart
 *****************************************************************
 */
function LevelStart(){
    local PlayerController pc;
    //local DOTZCheckpoint cp;

   // local int ChapterNum, PageNum, RevealNum;

    pc = Level.GetLocalPlayerController();
   // bPauseWithMenu = false;
    //pc.SetPause(true);
   // bPauseWithMenu = true;

    //ChapterNum = GameSpecificLevelInfo(Level.GameSpecificLevelInfo).ChapterNumber;
   // PageNum = GameSpecificLevelInfo(Level.GameSpecificLevelInfo).PageNumber;
    //RevealNum = GameSpecificLevelInfo(Level.GameSpecificLevelInfo).RevealledTo;

    //close any loading screen menus
    GuiController(pc.Player.InteractionMaster.GlobalInteractions[0]).CloseAll(true);
    /*
    //ensure that menus are set to display proper chapters
    RevealChapter(ChapterNum, RevealNum);

    //open the level start page
    GuiController(pc.Player.InteractionMaster.GlobalInteractions[0])
          .OpenMenu("DOTZMenu.DOTZStoryPageMenu",
          string(ChapterNum),
          string(PageNum));
*/
/* commentted out because FindPlayerStart() below returns the checkpoint to load to
    // SV: lets move player to checkpoint
    if( Level.ActiveCheckPointID > 0 )
    {
        foreach AllActors( class'DOTZCheckPoint', cp )
        {
            if( Level.ActiveCheckPointID == cp.id )
            {
                cp.TransportPlayer();
                //Level.ActiveCheckPointID = cp.id;
                break;
            }
        }
    }
*/
}


/* Return the checkpoint to spawn at.
 */
function NavigationPoint FindPlayerStart( Controller Player, optional byte InTeam, optional string incomingName )
{
    local DOTZCheckPoint cp;

    foreach AllActors( class'DOTZCheckPoint', cp )
    {
        if( ( cp.id == 1 ) && ( Level.ActiveCheckPointID == -1 ) )
        {
            // If we are new to this level, then just return the first checkpoint
            cp.bTouchable = true;
            return cp;
        }

        if( Level.ActiveCheckPointID == cp.id )
        {
            cp.bTouchable = true;
            return cp;
        }
    }

    // If we didnt find anything, just return the playerstart
    //tmp.bTouchable = true;
    return super.FindPlayerStart( Player, InTeam, incomingName );
}

//===========================================================================
// Exec functions
//===========================================================================


/******************************************************************
 * TestEvent
 * Triggers the specified event.  Handy for debugging.
 ******************************************************************
 */
exec function TestEvent( Name eventName ) {
    Log( "Triggering [" $ eventName $ "]" );
    TriggerEvent( eventName, self, none );
}


/******************************************************************
 * NoMusic
 * Stops any music currently playing.
 ******************************************************************
 */
exec function NoMusic() {
   StopAllMusic( 2 );
}





/*****************************************************************
 *
 *****************************************************************
 */
exec function CheckSearchable(){
    local ActionableSkeletalMesh temp;
    foreach AllActors(class'ActionableSkeletalMesh', temp){
        temp.Check();
    }
}

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    HUDType="DOTZGame.DOTZHud"
    PlayerControllerClass=Class'DOTZEngine.DOTZPlayerController'
}