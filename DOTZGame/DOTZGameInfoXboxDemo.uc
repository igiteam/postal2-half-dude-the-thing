/**
 * DOTZGameInfoXboxDemo - Xbox Demo game info class
 *  -ripped off from DOTZGameInfo
 *
 * @version $1.0$
 * @author  Seelan Vamatheva (seelan@digitalextremes.com)
 * @date    June 2005
 */
class DOTZGameInfoXboxDemo extends DOTZGameInfoBase;



var config string PauseMenuSP;
var config string DeadMenuSP;
var config string DeadMenuSPParam;

var config string ProfileMenu;

//===========================================================================
// Internal data
//===========================================================================
var private ObjectivesManager theObjMgr;

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
   theObjMgr = Spawn( class'DOTZObjectivesManager' );

}

 /**
 * override normal hud with spectating overlay...
 */
function DrawToHud( Canvas c, float scaleX, float scaleY ) {
   local float textWidth, textHeight;
   local PlayerController pc;
   pc = Level.GetLocalPlayerController();

   if (pc.IsDead())
   {
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
         c.DrawText( SpectatingMsg );
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
        LevelStart();   // moved up in demo
        Tickcount++;
    } else if (tickcount == 1){
        tickcount++;
        //LevelStart();
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
    //local int ChapterNum, PageNum, RevealNum;

    // Pause everything
    pc = Level.GetLocalPlayerController();
//    bPauseWithMenu = false;
//    pc.SetPause(true);
    NoMenuPause(true,pc);
//    bPauseWithMenu = true;

    // Close any loading screen menus
    GuiController(pc.Player.InteractionMaster.GlobalInteractions[0]).CloseAll(true);

    // Load up profile info from DemoProfile (set to default or user-defined values)
   DOTZPlayerControllerBase(pc).DemoProfileConfig();

    // Open the Demo main menu
    OpenDemoMainMenu();

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


/******************************************************************
 * ToggleObjectivesDisplay
 * Turns on/off the objectives list
 ******************************************************************
 */
exec function ToggleObjectivesDisplay() {
    if ( theObjMgr.showObjectives ) theObjMgr.Hide();
    else theObjMgr.show();
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


/*****************************************************************
 * Opens the Demo Main Menu
 *****************************************************************
 */
function OpenDemoMainMenu()
{
    // Game should be paused



    GuiController(Level.GetLocalPlayerController().Player.InteractionMaster.GlobalInteractions[0]).OpenMenu("DOTZMenu.XDOTZMainMenuDemo");
}


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    SpectatingMsg="Game Over. Press START to continue."
    HUDType="DOTZGame.DOTZHud"
    PlayerControllerClass=Class'DOTZEngine.DOTZPlayerController'
}