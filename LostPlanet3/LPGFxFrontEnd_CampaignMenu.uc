class LPGFxFrontEnd_CampaignMenu extends LPGFxFrontEnd_MainMenuCommon within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplayContinueMenu;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplayLoadMenu;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplaySpecialCheckpointMenu;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bResetCheckpointNotifyStatusDone;

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL SPeng;

    false
    'None'
    SPeng = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0x8F
    if((SPeng != none) && !bResetCheckpointNotifyStatusDone)
    {
        SPeng.ResetCheckpointNotifyStatus();
        bResetCheckpointNotifyStatusDone = true;
    }
    // End:0xDD
    if(bSavingEnabled == false)
    {
        ConditionalShowLoginUI(MoviePlayer.GetLP().ControllerId);
    }
    super(LPGFxFrontEnd_Screen).OnTopMostView(bPlayOpenAnimation, previousView);
    //return;    
}

function OnViewLoaded()
{
    super.OnViewLoaded();
    FrontEndManager.AddCheckpointEnumerationSubscriber(self);
    //return;    
}

function OnViewUnloaded()
{
    super(LPGFxFrontEnd_Screen).OnViewUnloaded();
    //return;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    0
    UpdateMenuDisplayFlagsFromCheckpoints();
    LPPC = LPPlayerController(Outer.GetPC());
    // End:0xAB
    if(LPPC != none)
    {
        HideOptionItemByName("Continue", !bDisplayContinueMenu);
        HideOptionItemByName("Load", !bDisplayLoadMenu);
        HideOptionItemByName("Special", !bDisplaySpecialCheckpointMenu);
    }
    super(SPGFxUIViewSettingsMenuBase).UpdateListDataProvider(SelectedIndex);
    //return;    
}

function Select_Difficulty()
{
    MenuViewLoader.PushViewByName('SelectDifficulty', self);
    //return;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;
    local /*0x97E50000-0x00000000*/ private name Selection;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;

    // End:0x36
    if(bSoundEvents)
    {
        Outer.PlaySoundFromTheme(ListItemPressSoundEventName);
    }
    SelectedIndex = GetSettingsListIndexFromDataIndex(ev.Index);
    mySettingsList = GetSettingsList();
    Selection = name(mySettingsList[SelectedIndex].OptionName);
    switch(Selection)
    {
        // End:0xD8
        case 'Continue':
            Select_LoadLastCheckpoint();
            // End:0x129
            break;
        // End:0xF1
        case 'New Game':
            Select_Difficulty();
            // End:0x129
            break;
        // End:0x10A
        case 'Special':
            Select_Special();
            // End:0x129
            break;
        // End:0x123
        case 'Load':
            Select_Load();
            // End:0x129
            break;
        // End:0xFFFF
        default:
            // End:0x129
            break;
            break;
    }
    //return;    
}

function Select_Load()
{
    MenuViewLoader.PushViewByName('Load', self);
    //return;    
}

function Select_LoadLastCheckpoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(MoviePlayer.GetPC());
    // End:0xC6
    if(LPPC != none)
    {
        // End:0x83
        if(LPPC.UpdateSPGameMinDifficulty())
        {
            LPPC.SaveProfile();
        }
        // End:0xC6
        if(LPPC.LoadCheckpointNamed())
        {
            MoviePlayer.EndSPGFxMoviePlayer();
        }
    }
    //return;    
}

function Select_SpecialCPErrorCompleteCB()
{
    local /*0x97E50000-0x00000000*/ private int SlotIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InStatus[8388609];
    local /*0x97E50000-0x00000000*/ private bool bReturnToMainMenuOnCorrupt[8388609], bReloadCheckpointOnNonOwner;
    local /*0x97E50000-0x00000000*/ private @NULL SPeng, CPInfo;

    SPeng = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0x83
    if(SPeng.IsValidCheckpointExistForSlot(2, FrontEndManager.bCheckpointSlot2Exists, true))
    {
        DoSelect_Special();        
    }
    else
    {
        CPInfo = SPeng.GetCheckpointSlotInfo(2);
        // End:0x136
        if((CPInfo.Status.bNotOwnedByUser && CPInfo.bNotifiedNotOwner) && !SPeng.CheckpointWritesDisabled())
        {
            Select_Difficulty();            
        }
        else
        {
            SPeng.ResetCheckpointNotifyStatus();
            UpdateListDataProvider();
        }
    }
    //return;    
}

function Select_Special()
{
    local /*0x97E50000-0x00000000*/ private @NULL SPeng, CPInfo;

    SPeng = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0x83
    if(SPeng.IsValidCheckpointExistForSlot(2, FrontEndManager.bCheckpointSlot2Exists, true))
    {
        DoSelect_Special();        
    }
    else
    {
        CPInfo = SPeng.GetCheckpointSlotInfo(2);
        SPeng.NotifyCheckpointSlotStatus(2, CPInfo.Status, false, false, true, Select_SpecialCPErrorCompleteCB);
    }
    //return;    
}

function DoSelect_Special()
{
    local /*0x97E50000-0x00000000*/ private @NULL SPeng;

    DesiredSlot = 2;
    SPeng = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0x93
    if(!FrontEndManager.bMemoryCheckpointExists && SPeng.StorageAccessDisabled())
    {
        DoLoadSpecial();        
    }
    else
    {
        ConfirmOverwrite();
    }
    //return;    
}

function DoLoadSpecial()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, PersistentGameDataStore;

    LPPC = LPPlayerController(Outer.GetPC());
    PersistentGameDataStore = LPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    PersistentGameDataStore.bNextCheckpointSaveOverLast = false;
    // End:0xE6
    if(LPPC.UpdateSPGameMinDifficulty())
    {
        LPPC.SaveProfile();
    }
    LPPC.LoadCheckpointNamed("SPCheckpoint0", DesiredSlot);
    //return;    
}

function ConfirmOverwrite()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmDialogMC;

    ConfirmDialogMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, false));
    // End:0x2E9
    if(ConfirmDialogMC != none)
    {
        ConfirmDialogMC.SetDefaultFocusedButton(0);
        ConfirmDialogMC.EnableDialogBackground(true);
        ConfirmDialogMC.SetNumberOfOptions(2);
        ConfirmDialogMC.SetTitle("<Strings:LostPlanetGame.FrontEnd.ConfirmCheckpointOvewriteTitle>");
        // End:0x198
        if(Class'SPEngine.SPUtil'.static.IsConsoleBuild(2))
        {
            ConfirmDialogMC.SetInfo("<Strings:LostPlanetGame.FrontEnd.ConfirmCheckpointOvewriteInfoPS3>");            
        }
        else
        {
            ConfirmDialogMC.SetInfo("<Strings:LostPlanetGame.FrontEnd.ConfirmCheckpointOvewriteInfo>");
        }
        ConfirmDialogMC.SetButtonLabel(0, "<Strings:LostPlanetGame.PauseMenu.No>");
        ConfirmDialogMC.SetButtonLabel(1, "<Strings:LostPlanetGame.PauseMenu.Yes>");
        ConfirmDialogMC.SetButtonOnPress(0, ConfirmDialog_No);
        ConfirmDialogMC.SetButtonOnPress(1, ConfirmDialog_Yes);
    }
    //return;    
}

function ConfirmDialog_Yes()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    DoLoadSpecial();
    //return;    
}

function ConfirmDialog_No()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], SPeng;

    SPeng = SPEngine(Class'Engine.Engine'.static.GetEngine());
    SPeng.ResetCheckpointNotifyStatus();
    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

function NotifyCheckpointEnumerationComplete()
{
    UpdateListDataProvider();
    //return;    
}

function UpdateMenuDisplayFlagsFromCheckpoints()
{
    local /*0x97E50000-0x00000000*/ private bool bSlot0ValidExists, bSlot1ValidExists;
    local /*0x97E50000-0x00000000*/ private @NULL SPeng;
    local /*0x97E50000-0x00000000*/ private int NumExists;

    SPeng = SPEngine(Class'Engine.Engine'.static.GetEngine());
    bSlot0ValidExists = SPeng.IsValidCheckpointExistForSlot(0, FrontEndManager.bCheckpointSlot0Exists);
    // End:0x95
    if(bSlot0ValidExists)
    {
        NumExists++;
    }
    bSlot1ValidExists = SPeng.IsValidCheckpointExistForSlot(1, FrontEndManager.bCheckpointSlot1Exists);
    // End:0xF8
    if(bSlot1ValidExists)
    {
        NumExists++;
    }
    // End:0x21C
    if(FrontEndManager.bMemoryCheckpointExists && (((!bSlot0ValidExists && !bSlot1ValidExists) || SPeng.StorageAccessDisabled()) || !SPeng.IsSlotOwned(0) && !SPeng.IsSlotOwned(1)) || (NumExists == 1) && !SPeng.IsSlotOwned(0) || !SPeng.IsSlotOwned(1))
    {
        bDisplayContinueMenu = true;        
    }
    else
    {
        bDisplayContinueMenu = false;
    }
    // End:0x253
    if(bSlot0ValidExists || bSlot1ValidExists)
    {
        bDisplayLoadMenu = true;        
    }
    else
    {
        bDisplayLoadMenu = false;
    }
    // End:0x2B2
    if(SPeng.IsValidCheckpointExistForSlot(2, FrontEndManager.bCheckpointSlot2Exists))
    {
        bDisplaySpecialCheckpointMenu = true;        
    }
    else
    {
        bDisplaySpecialCheckpointMenu = false;
    }
    //return;    
}

function UpdateDescription()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Description;
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize string Selection;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;

    SelectedIndex = int(ListMC.GetFloat("selectedIndex"));
    mySettingsList = GetSettingsList();
    SelectedIndex = GetSettingsListIndexFromDataIndex(SelectedIndex);
    Selection = mySettingsList[SelectedIndex].OptionName;
    // End:0x17C
    if(Selection == "Special")
    {
        Description = mySettingsList[SelectedIndex].Description;
        Description = (Description $ "\n") $ FrontEndManager.GetCheckpointDescription(FrontEndManager.LoadedInfoArray[2]);
        LPFrontEndMoviePlayer.Description.SetText(Description);
        return;
    }
    super(LPGFxFrontEnd_Screen).UpdateDescription();
    //return;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.FrontEnd.Campaign>"
    SettingsList=/* Array type was not detected. */
}