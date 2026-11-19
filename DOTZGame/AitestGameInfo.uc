class AitestGameInfo extends DOTZGameInfo;




///
/*****************************************************************
 * GameOver
 * Call to game over whenever a human pawn dies in singleplayer
 * set the local player controller to 'dead'
 *****************************************************************
 */
function GameOver(){


    AdvancedPlayerController(Level.GetLocalPlayerController()).GameOver();
    Level.Game.SetPause(true,Level.GetLocalPlayerController());

}
/////////////////////

