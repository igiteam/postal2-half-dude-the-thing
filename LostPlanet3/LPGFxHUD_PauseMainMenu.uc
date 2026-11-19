class LPGFxHUD_PauseMainMenu extends SPGFxUIViewSettingsMenuBase within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPPauseMoviePlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ViewTitle[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSavingEnabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplayLoadLastCheckpointMenu;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMemoryCheckpointExists;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDesiredSlotExists;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowCheatMapList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DesiredSlot;

function OnViewLoaded()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyEngine, LPPC;

    MyEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
    super(SPGFxUIView).OnViewLoaded();
    LPPauseMoviePlayer = LPGFxMoviePlayerPauseMenu(MoviePlayer);
    SetMPMode(LPPauseMoviePlayer.bMPMode);
    LPPC = LPPlayerController(MoviePlayer.GetPC());
    // End:0x11A
    if(LPPC != none)
    {
        DesiredSlot = LPPC.ProfileSettings.GetLastCheckpointSlot();
        // End:0x11A
        if(DesiredSlot < 0)
        {
            DesiredSlot = 0;
        }
    }
    bDesiredSlotExists = false;
    bDisplayLoadLastCheckpointMenu = false;
    // End:0x186
    if(MyEngine != none)
    {
        bMemoryCheckpointExists = MyEngine.CurrentCheckpoint != none;
        // End:0x186
        if(bMemoryCheckpointExists)
        {
            bDisplayLoadLastCheckpointMenu = true;
        }
    }
    // End:0x1B4
    if(!MyEngine.StorageAccessDisabled())
    {
        GetCheckpointEnumeration();
    }
    //return;    
}

function OnEscapeKeyPress()
{
    Outer.PlaySoundFromTheme('MenuSelect');
    super.OnEscapeKeyPress();
    //return;    
}

function OnViewUnloaded()
{
    local /*0x97E50000-0x00000000*/ private @NULL GameDataStore;

    super(SPGFxUIView).OnViewUnloaded();
    GameDataStore = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0xC4
    if(GameDataStore.CheckpointEnumerator != none)
    {
        GameDataStore.CheckpointEnumerator.ClearCheckpointEnumerationDelegate(CheckpointEnumerationDelegate);
    }
    //return;    
}

function SetMPMode()
{
    local /*0x97E50000-0x00000000*/ private bool bInMPMode[8388609];

    ActionScriptVoid("setMPMode");
    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    bShowCheatMapList = false;
    UpdateTitle();
    //return;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    0
    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x158
    if(LPPC != none)
    {
        // End:0x92
        if(Class'LPGameViewportClient'.static.IsCaptivateDemo())
        {
            RemoveOptionItemByName("MapList");
            SetNumOptions(SettingsList.Length);            
        }
        else
        {
            // End:0x10F
            if(LPPC.bMinimalPauseMenu)
            {
                HideOptionItemByName("MapList", true);
                HideOptionItemByName("Options", true);
                HideOptionItemByName("LoadLastCheckpoint", true);
                HideOptionItemByName("Quit", true);                
            }
            else
            {
                DisableOptionItemByName("LoadLastCheckpoint", !bDisplayLoadLastCheckpointMenu);
                HideOptionItemByName("MapList", !bShowCheatMapList);
            }
        }
    }
    // End:0x197
    if((ListMC != none) && LPPauseMoviePlayer != none)
    {
        LPPauseMoviePlayer.ResumeRendering();
    }
    super.UpdateListDataProvider(SelectedIndex);
    //return;    
}

function SetNumOptions()
{
    local /*0x97E50000-0x00000000*/ private int Num[8388609];

    ActionScriptVoid("setNumOptions");
    //return;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;
    local /*0x97E50000-0x00000000*/ private name Selection;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;

    super.OnListItemPress(ev);
    SelectedIndex = GetSettingsListIndexFromDataIndex(ev.Index);
    mySettingsList = GetSettingsList();
    Selection = name(mySettingsList[SelectedIndex].OptionName);
    switch(Selection)
    {
        // End:0xB5
        case 'Resume':
            Select_Resume();
            // End:0x1B5
            break;
        // End:0xCE
        case 'MapList':
            Select_MapList();
            // End:0x1B5
            break;
        // End:0xE7
        case 'Options':
            Select_Options();
            // End:0x1B5
            break;
        // End:0x100
        case 'LoadLastCheckpoint':
            Select_LoadLastCheckpoint();
            // End:0x1B5
            break;
        // End:0x119
        case 'ChangeSaveSlot':
            Select_ChangeSaveSlot();
            // End:0x1B5
            break;
        // End:0x132
        case 'Quit':
            Select_Quit();
            // End:0x1B5
            break;
        // End:0x14B
        case 'Audio':
            Select_Audio();
            // End:0x1B5
            break;
        // End:0x164
        case 'Video':
            Select_Video();
            // End:0x1B5
            break;
        // End:0x17D
        case 'Controls':
            Select_Controls();
            // End:0x1B5
            break;
        // End:0x196
        case 'Gamma':
            Select_Gamma();
            // End:0x1B5
            break;
        // End:0x1AF
        case 'ControlConfig':
            Select_ControlConfig();
            // End:0x1B5
            break;
        // End:0xFFFF
        default:
            // End:0x1B5
            break;
            break;
    }
    //return;    
}

function Select_Resume()
{
    UnPause();
    //return;    
}

function Select_MapList()
{
    MenuViewLoader.SpawnDialog('MapList', self);
    //return;    
}

function Select_Options()
{
    MenuViewLoader.PushViewByName('Options', self);
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

function Select_Gamma()
{
    MenuViewLoader.SpawnDialog('Gamma', self);
    //return;    
}

function Select_ControlConfig()
{
    MenuViewLoader.SpawnDialog('ControlConfig', self);
    //return;    
}

function Select_LoadLastCPErrorCompleteCB()
{
    local /*0x97E50000-0x00000000*/ private int SlotIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InStatus[8388609];
    local /*0x97E50000-0x00000000*/ private bool bReturnToMainMenuOnCorrupt[8388609], bReloadCheckpointOnNonOwner;
    local /*0x97E50000-0x00000000*/ private @NULL SPeng;

    SPeng = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0x6C
    if(SPeng.IsValidCheckpointExistForSlot(DesiredSlot, true, true))
    {
        DOSelect_LoadLastCheckpoint();        
    }
    else
    {
        bDesiredSlotExists = false;
        bDisplayLoadLastCheckpointMenu = bMemoryCheckpointExists;
        // End:0xA5
        if(bIsTopView)
        {
            UpdateListDataProvider();
        }
    }
    //return;    
}

function Select_LoadLastCheckpoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL SPeng, CPInfo;

    // End:0x19
    if(bMemoryCheckpointExists)
    {
        DOSelect_LoadLastCheckpoint();
        return;
    }
    SPeng = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0x11E
    if(bDesiredSlotExists)
    {
        // End:0x92
        if(SPeng.IsValidCheckpointExistForSlot(DesiredSlot, true, true))
        {
            DOSelect_LoadLastCheckpoint();            
        }
        else
        {
            CPInfo = SPeng.GetCheckpointSlotInfo(DesiredSlot);
            SPeng.NotifyCheckpointSlotStatus(DesiredSlot, CPInfo.Status, false, false, false, Select_LoadLastCPErrorCompleteCB);
        }
        return;
    }
    bDisplayLoadLastCheckpointMenu = false;
    // End:0x142
    if(bIsTopView)
    {
        UpdateListDataProvider();
    }
    //return;    
}

function DOSelect_LoadLastCheckpoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL LLCDialogMC;

    LLCDialogMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, false));
    // End:0x5F
    if(LLCDialogMC != none)
    {
        SetUpLLCDialog(LLCDialogMC);
    }
    //return;    
}

function SetUpLLCDialog()
{
    local /*0x97E50000-0x00000000*/ private @NULL LLCDialogMC[8388609];

    LLCDialogMC.SetDefaultFocusedButton(0);
    LLCDialogMC.EnableDialogBackground(true);
    LLCDialogMC.SetNumberOfOptions(2);
    LLCDialogMC.SetTitle("<Strings:LostPlanetGame.PauseMenu.LoadLastCheckpointTitle>");
    LLCDialogMC.SetInfo("<Strings:LostPlanetGame.PauseMenu.LoadLastCheckpointInfo>");
    LLCDialogMC.SetButtonLabel(0, "<Strings:LostPlanetGame.PauseMenu.No>");
    LLCDialogMC.SetButtonLabel(1, "<Strings:LostPlanetGame.PauseMenu.Yes>");
    LLCDialogMC.SetButtonOnPress(0, LLCDialog_SelectBack);
    LLCDialogMC.SetButtonOnPress(1, LLCDialog_SelectOK);
    //return;    
}

function LLCDialog_SelectOK()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], LPPC;

    LPPC = LPPlayerController(MoviePlayer.GetPC());
    // End:0xA9
    if(LPPC != none)
    {
        // End:0x88
        if(bDesiredSlotExists)
        {
            LPPC.LoadCheckpointNamed("SPCheckpoint0", DesiredSlot);            
        }
        else
        {
            LPPC.LoadCheckpointNamed();
        }
    }
    //return;    
}

function LLCDialog_SelectBack()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

function Select_ChangeSaveSlot()
{
    MenuViewLoader.PushViewByName('PickSaveSlot', self);
    //return;    
}

function Select_Quit()
{
    local /*0x97E50000-0x00000000*/ private @NULL ExitDialogMC;

    ExitDialogMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, false));
    // End:0x5F
    if(ExitDialogMC != none)
    {
        SetUpExitDialog(ExitDialogMC);
    }
    //return;    
}

function SetUpExitDialog()
{
    local /*0x97E50000-0x00000000*/ private @NULL ExitDialogMC[8388609];

    ExitDialogMC.SetDefaultFocusedButton(0);
    ExitDialogMC.EnableDialogBackground(true);
    ExitDialogMC.SetNumberOfOptions(2);
    ExitDialogMC.SetTitle("<Strings:LostPlanetGame.PauseMenu.QuitTitle>");
    ExitDialogMC.SetInfo("<Strings:LostPlanetGame.PauseMenu.QuitInfo>");
    ExitDialogMC.SetButtonLabel(0, "<Strings:LostPlanetGame.PauseMenu.No>");
    ExitDialogMC.SetButtonLabel(1, "<Strings:LostPlanetGame.PauseMenu.Yes>");
    ExitDialogMC.SetButtonOnPress(0, ExitDialog_SelectBack);
    ExitDialogMC.SetButtonOnPress(1, ExitDialog_SelectOK);
    //return;    
}

function NotifyViewLoaded()
{
    local /*0x97E50000-0x00000000*/ private @NULL View[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bHandled;
    local /*0x97E50000-0x00000000*/ private @NULL ExitDialogMC;

    bHandled = super(SPGFxUIView).NotifyViewLoaded(View);
    // End:0x106
    if(bHandled == false)
    {
        // End:0x106
        if((MenuViewLoader.PendingViewLoad.ViewName == 'InfoDialog') && View.ViewName == 'InfoDialog')
        {
            ExitDialogMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, false));
            // End:0xFA
            if(ExitDialogMC != none)
            {
                SetUpExitDialog(ExitDialogMC);
            }
            bHandled = true;
        }
    }
    return bHandled;
    //return ReturnValue;    
}

function ExitDialog_SelectOK()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], SPPC;

    SPPC = SPPlayerController(MoviePlayer.GetPC());
    // End:0x82
    if(SPPC != none)
    {
        Class'LPUIDataStore_FrontEnd'.static.SetSkipTitleScreen(true);
        SPPC.ReturnToMainMenu();
    }
    //return;    
}

function ExitDialog_SelectBack()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

function Select_BackImpl()
{
    LPPauseMoviePlayer.CheckSaveProfile();
    // End:0x31
    if((PopSettings()) == true)
    {
        return;
    }
    UnPause();
    //return;    
}

function UnPause()
{
    LPPauseMoviePlayer.PauseMenuClose();
    //return;    
}

function UpdateTitle()
{
    // End:0x62
    if(LPPauseMoviePlayer.Title != none)
    {
        LPPauseMoviePlayer.Title.SetText(ViewTitle);
    }
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bWasHandled;

    bWasHandled = true;
    switch(WidgetName)
    {
        // End:0x60
        case 'TitleString':
            LPPauseMoviePlayer.Title = Widget;
            UpdateTitle();
            // End:0x177
            break;
        // End:0xC9
        case 'SelectString':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonAcceptSelect>"));
            // End:0x177
            break;
        // End:0x12A
        case 'ConfirmString':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonBack>"));
            // End:0x177
            break;
        // End:0x165
        case 'BackString':
            Widget.SetText(GetLocalizedString(""));
            // End:0x177
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x177
            break;
            break;
    }
    // End:0x1B6
    if(!bWasHandled)
    {
        bWasHandled = super.WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

function GetCheckpointEnumeration()
{
    local /*0x97E50000-0x00000000*/ private @NULL GameDataStore;
    local /*0x97E50000-0x00000000*/ private editfixedsize array AdditionalSlotIndices;

    GameDataStore = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0x10B
    if(GameDataStore.CheckpointEnumerator != none)
    {
        SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).GetDLCCheckpointSlots(AdditionalSlotIndices);
        GameDataStore.CheckpointEnumerator.GetCheckpointEnumeration(CheckpointEnumerationDelegate, true, AdditionalSlotIndices);
    }
    //return;    
}

function CheckpointEnumerationDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array InLoadedInfoArray[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL MyEngine, CPInfo;

    // End:0x0F
    if(bDisplayLoadLastCheckpointMenu)
    {
        return;
    }
    bSavingEnabled = Class'LPCheckpoint'.static.CanSaveCheckpoints();
    MyEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0x7D
    if(MyEngine == none)
    {
        return;
    }
    bMemoryCheckpointExists = MyEngine.CurrentCheckpoint != none;
    bDesiredSlotExists = false;
    // End:0x242
    if(bSavingEnabled)
    {
        I = 0;
        J0xCD:

        // End:0x242 [Loop If]
        if(I < InLoadedInfoArray.Length)
        {
            CPInfo = MyEngine.GetCheckpointSlotInfo(InLoadedInfoArray[I].SlotIndex);
            // End:0x234
            if(((InLoadedInfoArray[I].DisplayName != "") || CPInfo.Status.bIsCorruptFile) || CPInfo.Status.bNotOwnedByUser)
            {
                // End:0x234
                if(InLoadedInfoArray[I].SlotIndex == DesiredSlot)
                {
                    bDesiredSlotExists = MyEngine.IsValidCheckpointExistForSlot(DesiredSlot, true);
                }
            }
            I++;
            // [Loop Continue]
            goto J0xCD;
        }
    }
    // End:0x26A
    if(bMemoryCheckpointExists || bDesiredSlotExists)
    {
        bDisplayLoadLastCheckpointMenu = true;
    }
    // End:0x282
    if(bIsTopView)
    {
        UpdateListDataProvider();
    }
    //return;    
}

function FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2D
    if(super.FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.PauseMenu.PauseTitle>"
    SettingsList=/* Array type was not detected. */
    bDisableRenderer3DEffects=true
}