class LPGFxFrontEnd_LoadMenu extends LPGFxFrontEnd_MainMenuCommon within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSelectedLoadPrevious[536870913];

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
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

function NotifyCheckpointEnumerationComplete()
{
    UpdateListDataProvider();
    //return;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];
    local /*0x97E50000-0x00000000*/ private byte I;
    local /*0x97E50000-0x00000000*/ private int ItemIndex;
    local /*0x97E50000-0x00000000*/ private @NULL DataProvider, TempObj;
    local /*0x97E50000-0x00000000*/ private bool bFoundMostRecent;
    local /*0x97E50000-0x00000000*/ private editfixedsize string FriendlyName;
    local /*0x97E50000-0x00000000*/ private @NULL SPeng, CPInfo;

    0
    SPeng = SPEngine(Class'Engine.Engine'.static.GetEngine());
    DataProvider = Outer.CreateArray();
    ItemIndex = 0;
    I = 0;
    J0x77:

    // End:0x53E [Loop If]
    if(int(I) < FrontEndManager.LoadedInfoArray.Length)
    {
        // End:0x131
        if((FrontEndManager.LoadedInfoArray[int(I)].SlotIndex < 0) || FrontEndManager.LoadedInfoArray[int(I)].SlotIndex > 1)
        {            
        }
        else
        {
            CPInfo = SPeng.GetCheckpointSlotInfo(FrontEndManager.LoadedInfoArray[int(I)].SlotIndex);
            // End:0x24C
            if(((FrontEndManager.LoadedInfoArray[int(I)].DisplayName == "") && !CPInfo.Status.bIsCorruptFile) && !CPInfo.Status.bNotOwnedByUser)
            {                
            }
            else
            {
                // End:0x25E
                if(ItemIndex > 1)
                {                    
                }
                else
                {
                    TempObj = Outer.CreateObject("Object");
                    // End:0x2F0
                    if(bFoundMostRecent == false)
                    {
                        FriendlyName = "<Strings:LostPlanetGame.FrontEnd.LoadLastCheckpoint>";
                        bFoundMostRecent = true;                        
                    }
                    else
                    {
                        FriendlyName = "<Strings:LostPlanetGame.FrontEnd.LoadPrevCheckpoint>";
                    }
                    TempObj.SetString("label", FriendlyName);
                    TempObj.SetString("control", "menu");
                    TempObj.SetFloat("optIndex", 0.0000000);
                    TempObj.SetFloat("prevOptIndex", 0.0000000);
                    TempObj.SetFloat("value", 0.0000000);
                    TempObj.SetFloat("prevValue", 0.0000000);
                    TempObj.SetFloat("SettingsListIndex", float(I));
                    // End:0x4F4
                    if(!SPeng.IsValidCheckpointExistForSlot(CPInfo.SlotIndex, true))
                    {
                        TempObj.SetBool("isDisabled", true);
                    }
                    DataProvider.SetElementObject(ItemIndex, TempObj);
                    ItemIndex++;
                }
            }
        }
        I++;
        // [Loop Continue]
        goto J0x77;
    }
    // End:0x63D
    if(ListMC != none)
    {
        ListMC.SetString("wrapping", ((ItemIndex > 0) ? "wrap" : "normal"));
        ListMC.SetObject("dataProvider", DataProvider);
        ListDataProvider = ListMC.GetObject("dataProvider");
        ListMC.SetFloat("selectedIndex", float(SelectedIndex));
    }
    // End:0x654
    if(bIsTopView)
    {
        UpdateDescription();
    }
    //return;    
}

function Select_BackImpl()
{
    Outer.GetPC().ClearTimer('TimerTick', self);
    super(SPGFxUIViewSettingsMenuBase).Select_BackImpl();
    //return;    
}

function UpdateDescription()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Description;
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;

    SelectedIndex = int(ListMC.GetFloat("selectedIndex"));
    SelectedIndex = GetSettingsListIndexFromDataIndex(SelectedIndex);
    Description = "";
    // End:0x13F
    if(LPFrontEndMoviePlayer != none)
    {
        // End:0x101
        if((SelectedIndex >= 0) && SelectedIndex < FrontEndManager.LoadedInfoArray.Length)
        {
            Description = FrontEndManager.GetCheckpointDescription(FrontEndManager.LoadedInfoArray[SelectedIndex]);
        }
        LPFrontEndMoviePlayer.Description.SetText(Description);
    }
    //return;    
}

function UpdateDisabledStatus()
{
    local /*0x97E50000-0x00000000*/ private int NumDisable;
    local /*0x97E50000-0x00000000*/ private @NULL SPeng;

    SPeng = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0x64
    if(!SPeng.IsValidCheckpointExistForSlot(0, true))
    {
        NumDisable++;
    }
    // End:0x96
    if(!SPeng.IsValidCheckpointExistForSlot(1, true))
    {
        NumDisable++;
    }
    // End:0xB2
    if(NumDisable == 2)
    {
        Select_BackImpl();
        return;
    }
    UpdateListDataProvider();
    //return;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private int CheckpointFileIndex;
    local /*0x97E50000-0x00000000*/ private @NULL SPeng, CPInfo;
    local /*0x97E50000-0x00000000*/ private int MenuIndex;

    super(SPGFxUIViewSettingsMenuBase).OnListItemPress(ev);
    MenuIndex = ev.Index;
    bSelectedLoadPrevious = MenuIndex == 1;
    CheckpointFileIndex = GetSettingsListIndexFromDataIndex(MenuIndex);
    // End:0x2BC
    if((CheckpointFileIndex >= 0) && CheckpointFileIndex < FrontEndManager.LoadedInfoArray.Length)
    {
        SPeng = SPEngine(Class'Engine.Engine'.static.GetEngine());
        DesiredSlot = FrontEndManager.LoadedInfoArray[CheckpointFileIndex].SlotIndex;
        // End:0x1F8
        if(MenuIndex == 0)
        {
            // End:0x16B
            if(SPeng.IsValidCheckpointExistForSlot(DesiredSlot, true, true))
            {
                DoLoadSlot();                
            }
            else
            {
                CPInfo = SPeng.GetCheckpointSlotInfo(DesiredSlot);
                SPeng.NotifyCheckpointSlotStatus(DesiredSlot, CPInfo.Status, false, false, true, OnCPErrorCompleteCB);
            }            
        }
        else
        {
            // End:0x232
            if(SPeng.IsValidCheckpointExistForSlot(DesiredSlot, true, true))
            {
                ConfirmOverwrite();                
            }
            else
            {
                CPInfo = SPeng.GetCheckpointSlotInfo(DesiredSlot);
                SPeng.NotifyCheckpointSlotStatus(DesiredSlot, CPInfo.Status, false, false, true, OnCPErrorCompleteCB);
            }
        }
    }
    //return;    
}

function OnCPErrorCompleteCB()
{
    local /*0x97E50000-0x00000000*/ private int SlotIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InStatus[8388609];
    local /*0x97E50000-0x00000000*/ private bool bReturnToMainMenuOnCorrupt[8388609], bReloadCheckpointOnNonOwner;
    local /*0x97E50000-0x00000000*/ private @NULL SPeng, CPInfo, CampaignMenu;

    SPeng = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0x140
    if(SPeng.IsValidCheckpointExistForSlot(DesiredSlot, true, true))
    {
        // End:0x7B
        if(DesiredSlot == 0)
        {
            DoLoadSlot();            
        }
        else
        {
            CPInfo = SPeng.GetCheckpointSlotInfo(DesiredSlot);
            // End:0x133
            if((CPInfo.Status.bNotOwnedByUser && CPInfo.bNotifiedNotOwner) && SPeng.StorageAccessDisabled())
            {
                DoLoadSlot();                
            }
            else
            {
                ConfirmOverwrite();
            }
        }        
    }
    else
    {
        CPInfo = SPeng.GetCheckpointSlotInfo(DesiredSlot);
        // End:0x28D
        if((CPInfo.Status.bNotOwnedByUser && CPInfo.bNotifiedNotOwner) && !SPeng.CheckpointWritesDisabled())
        {
            MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
            CampaignMenu = LPGFxFrontEnd_CampaignMenu(MenuViewLoader.GetTopMostview());
            // End:0x28D
            if(CampaignMenu != none)
            {
                CampaignMenu.Select_Difficulty();
                return;
            }
        }
        SPeng.ResetCheckpointNotifyStatus();
        UpdateDisabledStatus();
    }
    //return;    
}

function DoLoadSlot()
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
    local /*0x97E50000-0x00000000*/ private @NULL SPeng, ConfirmDialogMC;

    SPeng = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0x86
    if(!FrontEndManager.bMemoryCheckpointExists && SPeng.StorageAccessDisabled())
    {
        DoLoadSlot();
        return;
    }
    ConfirmDialogMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, false));
    // End:0x36F
    if(ConfirmDialogMC != none)
    {
        ConfirmDialogMC.SetDefaultFocusedButton(0);
        ConfirmDialogMC.EnableDialogBackground(true);
        ConfirmDialogMC.SetNumberOfOptions(2);
        ConfirmDialogMC.SetTitle("<Strings:LostPlanetGame.FrontEnd.ConfirmCheckpointOvewriteTitle>");
        // End:0x21E
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
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], PersistentGameDataStore;

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    DoLoadSlot();
    // End:0xD3
    if(bSelectedLoadPrevious)
    {
        PersistentGameDataStore = LPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
        PersistentGameDataStore.bNextCheckpointSaveOverLast = true;
        bSelectedLoadPrevious = false;
    }
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

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.FrontEnd.LoadMenu>"
}