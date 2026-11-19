class LPGFxFrontEnd_Options extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    //return;    
}

function OnViewClosed()
{
    super(SPGFxUIView).OnViewClosed();
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
    return false;
    //return ReturnValue;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    0
    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x7E
    if(LPPC != none)
    {
        // End:0x7E
        if(Class'LPGameViewportClient'.static.IsCaptivateDemo())
        {
            RemoveOptionItemByName("Difficulty");
        }
    }
    // End:0xB6
    if(LPFrontEndMoviePlayer.bIsMP)
    {
        RemoveOptionItemByName("Difficulty");
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

    super(SPGFxUIViewSettingsMenuBase).OnListItemPress(ev);
    SelectedIndex = GetSettingsListIndexFromDataIndex(ev.Index);
    mySettingsList = GetSettingsList();
    Selection = name(mySettingsList[SelectedIndex].OptionName);
    switch(Selection)
    {
        // End:0xB5
        case 'Audio':
            Select_Audio();
            // End:0x106
            break;
        // End:0xCE
        case 'Video':
            Select_Video();
            // End:0x106
            break;
        // End:0xE7
        case 'Controls':
            Select_Controls();
            // End:0x106
            break;
        // End:0x100
        case 'Import':
            Select_Import();
            // End:0x106
            break;
        // End:0xFFFF
        default:
            // End:0x106
            break;
            break;
    }
    //return;    
}

function Select_Audio()
{
    MenuViewLoader.PushViewByName('OptionsAudio', self);
    //return;    
}

function Select_Video()
{
    // End:0x50
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild())
    {
        MenuViewLoader.PushViewByName('OptionsVideo', self);        
    }
    else
    {
        MenuViewLoader.PushViewByName('OptionsVideoPC', self);
    }
    //return;    
}

function Select_Controls()
{
    MenuViewLoader.PushViewByName('OptionsControls', self);
    //return;    
}

function Select_Import()
{
    MenuViewLoader.PushViewByName('OptionsImport', self);
    //return;    
}

function Select_BackImpl()
{
    local /*0x97E50000-0x00000000*/ private @NULL SPPC, SPDSPGD;

    super(SPGFxUIViewSettingsMenuBase).Select_BackImpl();
    SPPC = SPPlayerController(MoviePlayer.GetPC());
    // End:0x12A
    if((SPPC != none) && SPPC.ProfileSettings != none)
    {
        SPDSPGD = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
        // End:0x127
        if(SPDSPGD != none)
        {
            SPDSPGD.SPGameDifficulty_SP = SPPC.ProfileSettings.GetSPGameDifficulty();            
        }        
    }
    //return;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.FrontEnd.Options>"
    SettingsList=/* Array type was not detected. */
}