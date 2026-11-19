class LPGFxFrontEnd_PlayerRecords extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

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
        case 'Leaderboards':
            Select_Leaderboards();
            // End:0xED
            break;
        // End:0xCE
        case 'Awards':
            Select_Awards();
            // End:0xED
            break;
        // End:0xE7
        case 'Statistics':
            Select_Statistics();
            // End:0xED
            break;
        // End:0xFFFF
        default:
            // End:0xED
            break;
            break;
    }
    //return;    
}

function Select_Leaderboards()
{
    MenuViewLoader.SpawnDialog('Leaderboards', self);
    //return;    
}

function Select_Awards()
{
    MenuViewLoader.SpawnDialog('Awards', self);
    //return;    
}

function Select_Statistics()
{
    local /*0x97E50000-0x00000000*/ private @NULL StatsMC;

    StatsMC = LPGFxFrontEnd_Statistics(MenuViewLoader.SpawnDialog('Statistics', self, true));
    // End:0xB4
    if(StatsMC != none)
    {
        StatsMC.SetUniqueNetId(MoviePlayer.GetPC().PlayerReplicationInfo.UniqueId);
    }
    //return;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.FrontEnd.PlayerRecords>"
    SettingsList=/* Array type was not detected. */
}