class LPGFxFrontEnd_QuickmatchGameType extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSelected;

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

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], MPManager;
    local /*0x97E50000-0x00000000*/ private editfixedsize string SelectedValue;
    local /*0x97E50000-0x00000000*/ private bool bSuccess;
    local /*0x97E50000-0x00000000*/ private int SettingsListIndex;

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
    LPPlayerController(Outer.GetPC()).ClientShowLoadingMovie(true);
    // End:0x194
    if(SelectedValue == "Extraction")
    {
        MPManager.SetDataStoreByGameType(1);
        MPManager.__OnQuickMatchComplete__Delegate = OnQuickMatchComplete;
        bSuccess = MPManager.StartQuickMatch();        
    }
    else
    {
        // End:0x22A
        if(SelectedValue == "Scenario")
        {
            MPManager.SetDataStoreByGameType(2);
            MPManager.__OnQuickMatchComplete__Delegate = OnQuickMatchComplete;
            bSuccess = MPManager.StartQuickMatch();            
        }
        else
        {
            // End:0x2C6
            if(SelectedValue == "TeamDeathmatch")
            {
                MPManager.SetDataStoreByGameType(3);
                MPManager.__OnQuickMatchComplete__Delegate = OnQuickMatchComplete;
                bSuccess = MPManager.StartQuickMatch();                
            }
            else
            {
                // End:0x395
                if(SelectedValue == "Survival")
                {
                    // End:0x31A
                    if(MPManager.GetPartySize() >= 5)
                    {
                        ErrorResponseDialog("TooMany");                        
                    }
                    else
                    {
                        MPManager.SetDataStoreByGameType(4);
                        MPManager.__OnQuickMatchComplete__Delegate = OnQuickMatchComplete;
                        bSuccess = MPManager.StartQuickMatch();
                    }
                }
            }
        }
    }
    // End:0x3E8
    if(!bSuccess)
    {
        LPPlayerController(Outer.GetPC()).ClientShowLoadingMovie(false);
    }
    bSelected = bSuccess;
    //return;    
}

function OnQuickMatchComplete()
{
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PC, MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    MPMgr.__OnQuickMatchComplete__Delegate = None;
    // End:0x55F
    if(!bWasSuccessful)
    {
        PC = LPPlayerController(Outer.GetPC());
        PC.ClientShowLoadingMovie(false);
        // End:0x482
        if(!MPMgr.CheckIsPlayerOnline(MPMgr.OwningControllerIndex))
        {
            // End:0x236
            if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
            {
                Class'SPEngine.SPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.LostLiveConnection_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.LostLiveConnection_Title>", "<Strings:SPGameUI.MessageBoxErrorStrings.GenericAccept>",, PC.ReturnToMainMenuUponAccept);                
            }
            else
            {
                // End:0x369
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

    bSelected = false;
    super.OnTopMostView(bPlayOpenAnim, prevView);
    //return;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.FrontEnd.HostType>"
    SettingsList=/* Array type was not detected. */
}