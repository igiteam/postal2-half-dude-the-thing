/**
 * DOTZMenuGameType -
 *
 * @version $1.0$
 * @author  Jesse Lachapelle (jesse@digitalextremes.com)
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @date    Nov 2003
 */
class DOTZMenuGameType extends DOTZGameInfoBase;

//===========================================================================
// GameInfo hooks
//===========================================================================

/**
 * Initialize the game.  The GameInfo's InitGame() function is called
 * before any other scripts (including PreBeginPlay() ), and is used
 * by the GameInfo to initialize parameters and spawn its helper
 * classes.  Warning: this is called before actors' PreBeginPlay.
 */
event InitGame( String options, out String error ) {
   //Level.NetMode = NM_StandAlone;
   super.InitGame( options, error );
}


/**
 */
function PostBeginPlay(){
    super.PostBeginPlay();
}

/**
 * Start the game - inform all actors that the match is starting, and
 * spawn player pawns.
 */
function PostLogin( PlayerController newPlayer ) {
    super.PostLogin( newPlayer );
}

/*
 * Called whenever a player needs to be spawned.
 */
function RestartPlayer( Controller c ) {
   super.RestartPlayer( c );
}

/**
 * Normally notifies all players (AI and human) when someone dies.
 * This does not include other NPCs, so this version ensures that all
 * of the AI opponents are notified.
 */
function NotifyKilled(Controller killer, Controller killed, Pawn killedPawn) {
   Super.NotifyKilled( killer, killed, killedPawn );
}

/**
 * Called when a player leaves the level.
 */
function Logout( Controller Exiting ) {
    super.logout( exiting );
}

function bool SetPause( bool bPause, PlayerController pc ) {
   if (AdvancedPlayerController(pc).objVideoPlayer.VideoIsPlaying() )
   {
        if (AdvancedPlayerController(pc).objVideoPlayer.VideoIsPlaying() && bPause == false){
            AdvancedPlayerController(pc).objVideoPlayer.StopVideo();
        }
        return super.SetPause(bPause,pc);
   } else {
      Level.Pauser=None;
		return True;
   }
}

/******************************************************************
 * TestEvent
 * Triggers the specified event.  Handy for debugging.
 ******************************************************************
 */
exec function TestEvent( Name eventName ) {
    Log( "Triggering [" $ eventName $ "]" );
    TriggerEvent( eventName, self, none );
}


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    DefaultPlayerClassName="XDOTZCharacters.JackSlade"
    HUDType="DOTZGame.DOTZHud"
    PlayerControllerClass=Class'DOTZEngine.DOTZPlayerControllerBase'
    DebugFlags=1
}