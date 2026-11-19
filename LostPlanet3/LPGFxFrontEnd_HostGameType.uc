class LPGFxFrontEnd_HostGameType extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

function GetDataStoreGameSettings()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], DataStoreManager, DataStoreGameSettings;

    DataStoreManager = Class'Engine.UIInteraction'.static.GetDataStoreClient();
    // End:0x3A
    if(DataStoreManager == none)
    {
        return none;
    }
    DataStoreGameSettings = LPUIDataStore_OnlineGameSettings(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'LPUIDataStore_OnlineGameSettings'.default.Tag));
    return DataStoreGameSettings;
    //return ReturnValue;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], DataStoreGameSettings, MPManager;
    local /*0x97E50000-0x00000000*/ private editfixedsize string SelectedValue;
    local /*0x97E50000-0x00000000*/ private name Selection;
    local /*0x97E50000-0x00000000*/ private int SettingsListIndex;

    super(SPGFxUIViewSettingsMenuBase).OnListItemPress(ev);
    DataStoreGameSettings = GetDataStoreGameSettings();
    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    SettingsListIndex = GetSettingsListIndexFromDataIndex(ev.Index);
    SelectedValue = GetSettingsList()[SettingsListIndex].OptionName;
    Selection = name(((int(MPManager.OnlineMode) == int(2)) ? SelectedValue $ "LAN" : SelectedValue));
    DataStoreGameSettings.SetCurrentByName(Selection);
    MPManager.HostGame(false);
    //return;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.FrontEnd.HostType>"
    SettingsList=/* Array type was not detected. */
}