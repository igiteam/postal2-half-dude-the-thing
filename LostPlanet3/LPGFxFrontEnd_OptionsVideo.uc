class LPGFxFrontEnd_OptionsVideo extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    // End:0x90
    if(LPFrontEndMoviePlayer != none)
    {
        LPFrontEndMoviePlayer.SetOptionDefaultButton(true, "<Strings:LostPlanetGame.FrontEnd.OptionDefaults>");
    }
    //return;    
}

function OnViewClosed()
{
    super(SPGFxUIView).OnViewClosed();
    // End:0x3A
    if(LPFrontEndMoviePlayer != none)
    {
        LPFrontEndMoviePlayer.SetOptionDefaultButton(false);
    }
    //return;    
}

function ResetSettingsToDefaults()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private float Gamma;

    LPPC = LPPlayerController(Outer.GetPC());
    super.ResetSettingsToDefaults();
    ResetProfileSettingToDefault(LPProfileSettings(LPPC.ProfileSettings), LPPC.ProfileSettings.49);
    Gamma = LPPC.ProfileSettings.GetGammaSetting();
    LPPC.SetGamma(Gamma);
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2D
    if(super(SPGFxUIViewSettingsMenuBase).FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    // End:0x63
    if(IsOptionDefaultsButton(ButtonName))
    {
        // End:0x61
        if(int(InputEvent) == int(0))
        {
            ConfirmDefaults();
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;
    local /*0x97E50000-0x00000000*/ private name Selection;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;

    super(SPGFxUIViewSettingsMenuBase).OnListItemPress(ev);
    SelectedIndex = GetSettingsListIndexFromDataIndex(ev.Index);
    mySettingsList = GetSettingsList();
    Selection = name(mySettingsList[SelectedIndex].OptionName);
    switch(Selection)
    {
        // End:0xB5
        case 'Gamma':
            Select_Gamma();
            // End:0xBB
            break;
        // End:0xFFFF
        default:
            // End:0xBB
            break;
            break;
    }
    //return;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private bool bIsMPHUD;

    0
    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x128
    if(LPGFxMoviePlayerPauseMenu(MoviePlayer) != none)
    {
        // End:0xA0
        if(LPPC != none)
        {
            bIsMPHUD = LPPC.HUDContentClass.default.bIsMultiplayerHUD;            
        }
        else
        {
            bIsMPHUD = int(Outer.GetPC().WorldInfo.NetMode) != int(NM_Standalone);
        }
        // End:0x128
        if(bIsMPHUD == false)
        {
            RemoveOptionItemByName("CreditsForDamage");
        }
    }
    super(SPGFxUIViewSettingsMenuBase).UpdateListDataProvider(SelectedIndex);
    //return;    
}

function Select_Gamma()
{
    MenuViewLoader.SpawnDialog('Gamma', self);
    //return;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.FrontEnd.Video>"
    SettingsList=/* Array type was not detected. */
}