class LPGFxFrontEnd_OnlineGameType extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

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
    local /*0x97E50000-0x00000000*/ private int SettingsListIndex;

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
            // End:0x159
            if(SelectedValue == "TeamDeathmatch")
            {
                MPManager.SetDataStoreByGameType(3);                
            }
            else
            {
                // End:0x1D0
                if(SelectedValue == "Survival")
                {
                    // End:0x1AF
                    if(MPManager.GetPartySize() >= 5)
                    {
                        ErrorResponseDialog("TooMany");
                        return;                        
                    }
                    else
                    {
                        MPManager.SetDataStoreByGameType(4);
                    }
                }
            }
        }
    }
    MenuViewLoader.PushViewByName('OnlineGameStart', self);
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
    ViewTitle="<Strings:LostPlanetGame.FrontEnd.HostType>"
    SettingsList=/* Array type was not detected. */
}