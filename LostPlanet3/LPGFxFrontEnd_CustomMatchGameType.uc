class LPGFxFrontEnd_CustomMatchGameType extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSelected;

function SetupConnectionToLobbyPanel()
{
    LPFrontEndMoviePlayer.ShowMPConnectingToLobby();
    LPFrontEndMoviePlayer.SetMPConnectingToLobbyText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.HostGame_Waiting_Message>"), "", "", "", GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.HostGame_Pending_Message>"), "", "", "", GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.HostGame_Complete_Message>"), "", "", "");
    LPFrontEndMoviePlayer.SetMPLobbyConnectionProgress("waiting", "waiting", "waiting", "waiting");
    LPFrontEndMoviePlayer.setButtonIcon(1, "");
    LPFrontEndMoviePlayer.setButtonIcon(0, "");
    //return;    
}

function ClearConnectionToLobbyPanel()
{
    LPFrontEndMoviePlayer.DisplayContent.GotoAndStop("default");
    LPFrontEndMoviePlayer.setButtonIcon(1, "<Strings:LostPlanetGame.UI.ButtonAcceptSelect>");
    LPFrontEndMoviePlayer.SetOptionBackButton(true);
    RefreshListFocus();
    //return;    
}

function ErrorResponseDialog()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ErrorPostfix[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmMC;

    ConfirmMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, true));
    // End:0x221
    if(ConfirmMC != none)
    {
        ConfirmMC.SetDefaultFocusedButton(0);
        ConfirmMC.EnableDialogBackground(true);
        ConfirmMC.SetNumberOfOptions(1);
        ConfirmMC.SetTitle("<Strings:LostPlanetGame.LPGFxFrontEnd_Online.ErrorResponseDialog_Title>");
        ConfirmMC.SetInfo(("<Strings:LostPlanetGame.LPGFxFrontEnd_Online.ErrorResponseDialogBody_" $ ErrorPostfix) $ ">");
        ConfirmMC.SetButtonLabel(0, "<Strings:LostPlanetGame.LPGFxFrontEnd_Online.ErrorResponseDialog_OK>");
        ConfirmMC.SetButtonOnPress(0, cbErrorResponseDialog_OK);
    }
    //return;    
}

function cbErrorResponseDialog_OK()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

function FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0x95
    if((MPMgr.bInProgress || MPMgr.bIsTraveling) || MPMgr.bIsCancelPending)
    {
        return true;
    }
    return super(SPGFxUIViewSettingsMenuBase).FilterButtonInput(ControllerId, ButtonName, InputEvent);
    //return ReturnValue;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], MPManager;
    local /*0x97E50000-0x00000000*/ private editfixedsize string SelectedValue;
    local /*0x97E50000-0x00000000*/ private bool bSuccess;
    local /*0x97E50000-0x00000000*/ private int SettingsListIndex;
    local /*0x97E50000-0x00000000*/ private @NULL DesiredGameSettings;

    // End:0x0F
    if(bSelected)
    {
        return;
    }
    super(SPGFxUIViewSettingsMenuBase).OnListItemPress(ev);
    bSuccess = false;
    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    SettingsListIndex = GetSettingsListIndexFromDataIndex(ev.Index);
    SelectedValue = GetSettingsList()[SettingsListIndex].OptionName;
    // End:0x102
    if(SelectedValue == "Extraction")
    {
        MPManager.SetDataStoreByGameType(1);
        bSuccess = true;        
    }
    else
    {
        // End:0x14A
        if(SelectedValue == "Scenario")
        {
            MPManager.SetDataStoreByGameType(2);
            bSuccess = true;            
        }
        else
        {
            // End:0x198
            if(SelectedValue == "TeamDeathmatch")
            {
                MPManager.SetDataStoreByGameType(3);
                bSuccess = true;                
            }
            else
            {
                // End:0x219
                if(SelectedValue == "Survival")
                {
                    // End:0x1EC
                    if(MPManager.GetPartySize() > 6)
                    {
                        ErrorResponseDialog("TooMany");                        
                    }
                    else
                    {
                        MPManager.SetDataStoreByGameType(4);
                        bSuccess = true;
                    }
                }
            }
        }
    }
    DesiredGameSettings = LPOnlineGameSettings(MPManager.GetDataStoreGameSettings().GetCurrentGameSettings());
    DesiredGameSettings.CalculateRequiredDLC();
    // End:0x388
    if(!MPManager.CheckPlayersDLC(DesiredGameSettings))
    {
        Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.MatchErrorMissingDLC_Msg>", "<Strings:SPGameUI.MessageBoxErrorStrings.ErrorTitle>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        bSuccess = false;
    }
    // End:0x462
    if(bSuccess)
    {
        SetupConnectionToLobbyPanel();
        MPManager.bIsQuickMatch = false;
        MPManager.__OnCreateGameComplete__Delegate = OnCreateGameComplete;
        MPManager.HostGame(false);
        LPFrontEndMoviePlayer.SetMPLobbyConnectionProgress("inProgress", "waiting", "waiting", "waiting");
        bSelected = true;
    }
    //return;    
}

function OnCreateGameComplete()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, MPManager;

    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    LPPC = LPPlayerController(Outer.GetPC());
    MPManager.__OnCreateGameComplete__Delegate = None;
    // End:0xDF
    if(bWasSuccessful)
    {
        LPFrontEndMoviePlayer.SetMPLobbyConnectionProgress("complete", "waiting", "waiting", "waiting");        
    }
    else
    {
        ClearConnectionToLobbyPanel();
        // End:0x4AC
        if(!MPManager.CheckIsPlayerOnline(MPManager.OwningControllerIndex))
        {
            // End:0x260
            if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
            {
                Class'SPEngine.SPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.LostLiveConnection_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.LostLiveConnection_Title>", "<Strings:SPGameUI.MessageBoxErrorStrings.GenericAccept>",, LPPC.ReturnToMainMenuUponAccept);                
            }
            else
            {
                // End:0x393
                if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
                {
                    Class'SPEngine.SPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.LostPSNConnection_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.LostPSNConnection_Title>", "<Strings:SPGameUI.MessageBoxErrorStrings.GenericAccept>",, LPPC.ReturnToMainMenuUponAccept);                    
                }
                else
                {
                    Class'SPEngine.SPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.LostInternetConnection_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.LostInternetConnection_Title>", "<Strings:SPGameUI.MessageBoxErrorStrings.GenericAccept>",, LPPC.ReturnToMainMenuUponAccept);
                }
            }            
        }
        else
        {
            Class'SPEngine.SPUIManager'.static.DisplayErrorMessage("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.HostMatchFail_Message>", "<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.HostMatchFail_Title>", "<Strings:SPGameUI.MessageBoxErrorStrings.GenericAccept>");
        }
    }
    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnim[9437185];
    local /*0x97E50000-0x00000000*/ private name prevView[9437185];

    bSelected = false;
    super.OnTopMostView(bPlayOpenAnim, prevView);
    //return;    
}

function OnViewClosed()
{
    super(SPGFxUIView).OnViewClosed();
    ClearConnectionToLobbyPanel();
    //return;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.FrontEnd.HostType>"
    SettingsList=/* Array type was not detected. */
}