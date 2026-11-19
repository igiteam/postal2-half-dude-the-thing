class LPGFxFrontEnd_SelectDifficultyMenu extends LPGFxFrontEnd_MainMenuCommon within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PreviousMenuSelection;

function OnViewLoaded()
{
    super.OnViewLoaded();
    PreviousMenuSelection = -1;
    //return;    
}

function Select_BackImpl()
{
    local /*0x97E50000-0x00000000*/ private @NULL SPeng;

    PreviousMenuSelection = int(ListMC.GetFloat("selectedIndex"));
    super(SPGFxUIViewSettingsMenuBase).Select_BackImpl();
    SPeng = SPEngine(Class'Engine.Engine'.static.GetEngine());
    SPeng.ResetCheckpointNotifyStatus();
    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super(LPGFxFrontEnd_Screen).OnTopMostView(bPlayOpenAnimation, previousView);
    // End:0x5F
    if(FrontEndManager != none)
    {
        FrontEndManager.bShowCheatMapList = false;
    }
    //return;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];

    0
    // End:0x23
    if(PreviousMenuSelection == -1)
    {
        SelectedIndex = 1;
    }
    super(SPGFxUIViewSettingsMenuBase).UpdateListDataProvider(SelectedIndex);
    //return;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;
    local /*0x97E50000-0x00000000*/ private name Selection;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;
    local /*0x97E50000-0x00000000*/ private byte newDifficultyLevel;

    // End:0x36
    if(bSoundEvents)
    {
        Outer.PlaySoundFromTheme(ListItemPressSoundEventName);
    }
    SelectedIndex = GetSettingsListIndexFromDataIndex(ev.Index);
    mySettingsList = GetSettingsList();
    Selection = name(mySettingsList[SelectedIndex].OptionName);
    newDifficultyLevel = 3;
    switch(Selection)
    {
        // End:0xE6
        case 'Normal':
            newDifficultyLevel = 1;
            // End:0x122
            break;
        // End:0x101
        case 'easy':
            newDifficultyLevel = 0;
            // End:0x122
            break;
        // End:0x11C
        case 'hard':
            newDifficultyLevel = 2;
            // End:0x122
            break;
        // End:0xFFFF
        default:
            // End:0x122
            break;
            break;
    }
    // End:0x170
    if(FrontEndManager.bShowCheatMapList)
    {
        MenuViewLoader.SpawnDialog('MapList', self);
        return;
    }
    // End:0x1A1
    if(int(newDifficultyLevel) != int(3))
    {
        SetDifficulty(newDifficultyLevel);
        Select_NewGame();
    }
    //return;    
}

function SetDifficulty()
{
    local /*0x97E50000-0x00000000*/ private byte newDifficultyLevel[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, ProfileSettings, SPDSPGD;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x149
    if(LPPC != none)
    {
        ProfileSettings = LPProfileSettings(LPPC.ProfileSettings);
        // End:0x149
        if(ProfileSettings != none)
        {
            ProfileSettings.SetSPGameDifficulty(int(newDifficultyLevel));
            SPDSPGD = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
            // End:0x149
            if(SPDSPGD != none)
            {
                SPDSPGD.SPGameDifficulty_SP = ProfileSettings.GetSPGameDifficulty();
            }
        }
    }
    //return;    
}

function OnNotifyLoginCancelled()
{
    super.OnNotifyLoginCancelled();
    MenuViewLoader.SpawnDialog('SaveWarning', self);
    //return;    
}

function OnSuccessfulDeviceSelect()
{
    super.OnSuccessfulDeviceSelect();
    Select_NewGame();
    //return;    
}

function OnUnSuccessfulDeviceSelect()
{
    super.OnUnSuccessfulDeviceSelect();
    ConfirmNoDevice();
    //return;    
}

function FilterButtonInput()
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
    return false;
    //return ReturnValue;    
}

function UpdateDescription()
{
    // End:0x78
    if(LPFrontEndMoviePlayer != none)
    {
        // End:0x78
        if(LPFrontEndMoviePlayer.bShowCheatMapList)
        {
            LPFrontEndMoviePlayer.Description.SetText("CHEAT MAP LIST");
            return;
        }
    }
    super(LPGFxFrontEnd_Screen).UpdateDescription();
    //return;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.FrontEnd.SelectDifficulty>"
    SettingsList=/* Array type was not detected. */
}