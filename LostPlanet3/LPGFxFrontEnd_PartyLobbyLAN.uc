class LPGFxFrontEnd_PartyLobbyLAN extends LPGFxFrontEnd_PartyLobby within GFxMoviePlayer
    config(UI);

function SetDefaultGameType()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPManager;

    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0x59
    if(MPManager != none)
    {
        MPManager.SetDataStoreByGameType(2);
    }
    //return;    
}

function Select_Custom()
{
    SetDefaultGameType();
    super.Select_Custom();
    //return;    
}

function Select_Host()
{
    SetDefaultGameType();
    super.Select_Host();
    //return;    
}

function Select_Quickmatch()
{
    SetDefaultGameType();
    super.Select_Quickmatch();
    //return;    
}

defaultproperties
{
    bLANLobby=true
    ViewTitle="<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.ViewTitleLAN>"
    SettingsList=/* Array type was not detected. */
}