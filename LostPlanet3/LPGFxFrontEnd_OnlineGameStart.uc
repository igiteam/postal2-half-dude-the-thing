class LPGFxFrontEnd_OnlineGameStart extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInProgress;

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
    bInProgress = false;
    //return;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private bool bSuccess;
    local /*0x97E50000-0x00000000*/ private @NULL MPManager;
    local /*0x97E50000-0x00000000*/ private editfixedsize string SelectedValue;
    local /*0x97E50000-0x00000000*/ private int SettingsListIndex;

    super(SPGFxUIViewSettingsMenuBase).OnListItemPress(ev);
    // End:0x22
    if(bInProgress)
    {
        return;
    }
    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    SettingsListIndex = GetSettingsListIndexFromDataIndex(ev.Index);
    SelectedValue = GetSettingsList()[SettingsListIndex].OptionName;
    LPPlayerController(Outer.GetPC()).ClientShowLoadingMovie(true);
    // End:0x137
    if(SelectedValue == "QuickMatch")
    {
        bSuccess = MPManager.StartQuickMatch();        
    }
    else
    {
        // End:0x197
        if(SelectedValue == "Host")
        {
            MPManager.bIsQuickMatch = false;
            bSuccess = MPManager.HostGame(false);
        }
    }
    // End:0x1FF
    if(!bSuccess)
    {
        LPPlayerController(Outer.GetPC()).ClientShowLoadingMovie(false);
        ErrorResponseDialog("Unknown");
        return;
    }
    bInProgress = true;
    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnim[9437185];
    local /*0x97E50000-0x00000000*/ private name prevView[9437185];

    super.OnTopMostView(bPlayOpenAnim, prevView);
    //return;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.FrontEnd.OnlineStart>"
    SettingsList=/* Array type was not detected. */
}