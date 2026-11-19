 /**
 * DOTZPlayerControllerBase - previously HGPlayerControllerBase.
 *
 * @version $1.0$
 * @author  Jesse (Jesse@digitalextremes.com)
 * @date    May 2003
 */
class DOTZPlayerController extends DOTZPlayerControllerBase;

/*****************************************************************
 * SetProfileConfiguration
 * Update the active configuration to reflect the currently loaded profile.
 *****************************************************************
 */
private function SetProfileConfiguration(){

    Log("Setting profile config from profile");

    //SET CURRENT PROFILE
    if (GetCurrentProfileName() != "" && IsLoadedProfileValid()){

        //Set the difficulty level
        AdvancedGameInfo(Level.Game).iDifficultyLevel = int(class'Profiler'.static.GetValue(constDIFFLEVEL));
        SetDifficultyLevel(AdvancedGameInfo(Level.Game).iDifficultyLevel);

   //DEFAULTS
    } else {
        SetDifficultyLevel(1);
    }

    SetUseSubtitles(true);
}

/*****************************************************************
 * SetInvertLook
 *****************************************************************
 */

function SetInvertLook(bool bShouldInvert){
   InvertLook(bShouldInvert);
}

/*****************************************************************
 *
 *****************************************************************
 */

state dead{
   exec function Fire( optional float F ) {
        HandlePlayerInput();
    }

    exec function AltFire( optional float F ) {
        HandlePlayerInput();
    }
    /**
     * Do clever stuff here to restart the game for the player...
     */
    function HandlePlayerInput() {

        if ( Level.NetMode == NM_Standalone ) {
            if ( Level.TimeSeconds - StartedSpectatingTime > MIN_SPECTATE_TIME ) {
                    AdvancedGameInfo(Level.Game).GameOver();
            }
        } else {
            //Log("MP game restarting player");
            ServerRestartPlayer();
        }
    }
}


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: DOTZHealthBar'DOTZPlayerController.LifeBar0'
    begin object name=LifeBar0 class=Class'DOTZHealthBar'
    end object
    MyLifeBar=LifeBar0
    AdvancedCheatClass=Class'PCCheatManager'
}