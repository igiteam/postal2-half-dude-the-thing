class LPGFxHUD_PauseOptionsAudio extends LPGFxFrontEnd_OptionsAudio within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPHUDMenuManager;

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    // End:0xA2
    if(LPGFxMoviePlayerPauseMenu(MoviePlayer) != none)
    {
        LPGFxMoviePlayerPauseMenu(MoviePlayer).SetOptionDefaultButton(true, "<Strings:LostPlanetGame.FrontEnd.OptionDefaults>");
    }
    //return;    
}

function OnViewClosed()
{
    super.OnViewClosed();
    // End:0x4C
    if(LPGFxMoviePlayerPauseMenu(MoviePlayer) != none)
    {
        LPGFxMoviePlayerPauseMenu(MoviePlayer).SetOptionDefaultButton(false);
    }
    //return;    
}

function OnViewLoaded()
{
    super(LPGFxFrontEnd_Screen).OnViewLoaded();
    LPHUDMenuManager = LPGFxMoviePlayerHUD(MoviePlayer);
    //return;    
}

defaultproperties
{
    bDisableRenderer3DEffects=true
}