class LPGFxHUD_PauseOptions extends LPGFxFrontEnd_Options within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPHUDMenuManager;

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    //return;    
}

function OnViewClosed()
{
    super.OnViewClosed();
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
    SettingsList=/* Array type was not detected. */
    bDisableRenderer3DEffects=true
}