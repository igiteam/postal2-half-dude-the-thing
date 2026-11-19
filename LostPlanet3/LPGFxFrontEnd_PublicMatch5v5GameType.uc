class LPGFxFrontEnd_PublicMatch5v5GameType extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

function SetupConnectionToLobbyPanel()
{
    LPFrontEndMoviePlayer.ShowMPConnectingToLobby();
    LPFrontEndMoviePlayer.SetMPConnectingToLobbyText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.MatchmakingSearch_Waiting_Message>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.MatchmakingMatchesFound_Waiting_Message>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.MatchmakingConnecting_Waiting_Message>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.MatchmakingTraveling_Waiting_Message>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.MatchmakingSearch_Pending_Message>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.MatchmakingMatchesFound_Pending_Message>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.MatchmakingConnecting_Pending_Message>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.MatchmakingTraveling_Pending_Message>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.MatchmakingSearch_Complete_Message>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.MatchmakingMatchesFound_Complete_Message>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.MatchmakingConnecting_Complete_Message>"), GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.MatchmakingTraveling_Complete_Message>"));
    LPFrontEndMoviePlayer.SetMPLobbyConnectionProgress("waiting", "waiting", "waiting", "waiting");
    LPFrontEndMoviePlayer.setButtonIcon(0, "");
    LPFrontEndMoviePlayer.setButtonIcon(1, "<Strings:LostPlanetGame.UI.ButtonCancel>");
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
    // End:0x71
    if(MPMgr.bIsTraveling || MPMgr.bIsCancelPending)
    {
        return true;
    }
    // End:0x32D
    if(MPMgr.bIsMatchmaking)
    {
        // End:0x32B
        if(((ButtonName == 'XboxTypeS_B') || ButtonName == 'Escape') && int(InputEvent) == int(0))
        {
            MPMgr.CancelQuickMatch();
            MPMgr.__OnQuickMatchComplete__Delegate = None;
            MPMgr.__OnQuickMatchUpdate__Delegate = None;
            LPFrontEndMoviePlayer.SetMPConnectingToLobbyText(GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.MatchmakingCancel_Waiting_Message>"), "", "", "", GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.MatchmakingCancel_Pending_Message>"), "", "", "", GetLocalizedString("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobby.MatchmakingCancel_Complete_Message>"), "", "", "");
            LPFrontEndMoviePlayer.SetMPLobbyConnectionProgress("inProgress", "waiting", "waiting", "waiting");
            Outer.GetPC().SetTimer(0.1000000, true, 'OnCheckCancelComplete', self);
        }
        return true;
    }
    return super(SPGFxUIViewSettingsMenuBase).FilterButtonInput(ControllerId, ButtonName, InputEvent);
    //return ReturnValue;    
}

function OnCheckCancelComplete()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0xBC
    if(!MPMgr.bInProgress && !MPMgr.bIsCancelPending)
    {
        ClearConnectionToLobbyPanel();
        Outer.GetPC().ClearTimer('OnCheckCancelComplete', self);
    }
    //return;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], MPManager;
    local /*0x97E50000-0x00000000*/ private editfixedsize string SelectedValue;
    local /*0x97E50000-0x00000000*/ private int SettingsListIndex;
    local /*0x97E50000-0x00000000*/ private @NULL DesiredGameSettings;

    super(SPGFxUIViewSettingsMenuBase).OnListItemPress(ev);
    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    SettingsListIndex = GetSettingsListIndexFromDataIndex(ev.Index);
    SelectedValue = GetSettingsList()[SettingsListIndex].OptionName;
    // End:0xDB
    if(SelectedValue == "Extraction")
    {
        MPManager.SetDataStoreByGameType(1);        
    }
    else
    {
        // End:0x117
        if(SelectedValue == "Scenario")
        {
            MPManager.SetDataStoreByGameType(2);            
        }
        else
        {
            // End:0x156
            if(SelectedValue == "TeamDeathmatch")
            {
                MPManager.SetDataStoreByGameType(3);
            }
        }
    }
    DesiredGameSettings = LPOnlineGameSettings(MPManager.GetDataStoreGameSettings().GetCurrentGameSettings());
    DesiredGameSettings.CalculateRequiredDLC();
    // End:0x2CB
    if(!MPManager.CheckPlayersDLC(DesiredGameSettings))
    {
        Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.MatchErrorMissingDLC_Msg>", "<Strings:SPGameUI.MessageBoxErrorStrings.MatchErrorMissingDLC_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        return;
    }
    SetupConnectionToLobbyPanel();
    MPManager.__OnQuickMatchComplete__Delegate = OnQuickMatchComplete;
    MPManager.__OnQuickMatchUpdate__Delegate = OnQuickMatchUpdate;
    MPManager.StartQuickMatch();
    //return;    
}

function OnQuickMatchUpdate()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];
    local /*0x97E50000-0x00000000*/ private bool bCancelable;

    switch(NewState)
    {
        // End:0x6A
        case 0:
            LPFrontEndMoviePlayer.SetMPLobbyConnectionProgress("waiting", "waiting", "waiting", "waiting");
            bCancelable = true;
            // End:0x16B
            break;
        // End:0xC4
        case 1:
            LPFrontEndMoviePlayer.SetMPLobbyConnectionProgress("inProgress", "waiting", "waiting", "waiting");
            bCancelable = true;
            // End:0x16B
            break;
        // End:0x113
        case 2:
            LPFrontEndMoviePlayer.SetMPLobbyConnectionProgress("complete", "inProgress", "waiting", "waiting");
            // End:0x16B
            break;
        // End:0x118
        case 3:
        // End:0x168
        case 4:
            LPFrontEndMoviePlayer.SetMPLobbyConnectionProgress("complete", "complete", "inProgress", "waiting");
            // End:0x16B
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x1C5
    if(bCancelable)
    {
        LPFrontEndMoviePlayer.setButtonIcon(1, "<Strings:LostPlanetGame.UI.ButtonCancel>");        
    }
    else
    {
        LPFrontEndMoviePlayer.setButtonIcon(1, "");
    }
    //return;    
}

function OnQuickMatchComplete()
{
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PC, MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    MPMgr.__OnQuickMatchComplete__Delegate = None;
    MPMgr.__OnQuickMatchUpdate__Delegate = None;
    // End:0xE2
    if(bWasSuccessful)
    {
        LPFrontEndMoviePlayer.SetMPLobbyConnectionProgress("complete", "complete", "complete", "inProgress");        
    }
    else
    {
        ClearConnectionToLobbyPanel();
        PC = LPPlayerController(Outer.GetPC());
        PC.ClientStopMovie(0.0000000, false, true, true);
        // End:0x508
        if(!MPMgr.CheckIsPlayerOnline(MPMgr.OwningControllerIndex))
        {
            // End:0x2BC
            if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
            {
                Class'SPEngine.SPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.LostLiveConnection_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.LostLiveConnection_Title>", "<Strings:SPGameUI.MessageBoxErrorStrings.GenericAccept>",, PC.ReturnToMainMenuUponAccept);                
            }
            else
            {
                // End:0x3EF
                if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
                {
                    Class'SPEngine.SPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.LostPSNConnection_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.LostPSNConnection_Title>", "<Strings:SPGameUI.MessageBoxErrorStrings.GenericAccept>",, PC.ReturnToMainMenuUponAccept);                    
                }
                else
                {
                    Class'SPEngine.SPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.LostInternetConnection_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.LostInternetConnection_Title>", "<Strings:SPGameUI.MessageBoxErrorStrings.GenericAccept>",, PC.ReturnToMainMenuUponAccept);
                }
            }            
        }
        else
        {
            Class'SPEngine.SPUIManager'.static.DisplayErrorMessage("<Strings:LostPlanetGame.MultiplayerMessages.QuickMatchFail_Message>", "<Strings:LostPlanetGame.MultiplayerMessages.QuickMatchFail_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        }
    }
    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnim[9437185];
    local /*0x97E50000-0x00000000*/ private name prevView[9437185];

    super.OnTopMostView(bPlayOpenAnim, prevView);
    //return;    
}

function OnViewClosed()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPManager;

    super(SPGFxUIView).OnViewClosed();
    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    MPManager.__OnQuickMatchComplete__Delegate = None;
    MPManager.__OnQuickMatchUpdate__Delegate = None;
    // End:0xD4
    if(MPManager.bIsMatchmaking)
    {
        MPManager.CancelQuickMatch();
    }
    ClearConnectionToLobbyPanel();
    Outer.GetPC().ClearTimer('OnCheckCancelComplete', self);
    //return;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.FrontEnd.HostType>"
    SettingsList=/* Array type was not detected. */
}