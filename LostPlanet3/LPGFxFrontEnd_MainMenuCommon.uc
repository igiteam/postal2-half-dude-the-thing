class LPGFxFrontEnd_MainMenuCommon extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    abstract
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSavingEnabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNewGame;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DesiredSlot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FrontEndManager;

function OnViewLoaded()
{
    super.OnViewLoaded();
    FrontEndManager = LPGFxMoviePlayerFrontEndManager(MoviePlayer);
    bSavingEnabled = Class'LPCheckpoint'.static.CanSaveCheckpoints();
    //return;    
}

function Select_NewGame()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPGameDataStore, MyEngine;
    local /*0x97E50000-0x00000000*/ private int SlotIndex;

    MyEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x20F
    if((LPPC != none) && Class'LPGameViewportClient'.static.IsCaptivateDemo())
    {
        SlotIndex = 0;
        MyEngine.PendingCheckpointDirectoryName = "SaveSlot" $ string(SlotIndex);
        MyEngine.PendingCheckpointSlot = SlotIndex;
        LPGameDataStore = LPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'LPDataStorePersistentGameData'.default.Tag));
        // End:0x17F
        if(LPGameDataStore != none)
        {
            LPGameDataStore.ResetForNewGame();
        }
        LPPC.ClientPlayMovie("1060_JimToRelay");        
        LPPC.ConsoleCommand("open shack_a1_p_GC?PlayerStartName=demoStart");
        return;
    }
    // End:0x321
    if(bSavingEnabled)
    {
        DesiredSlot = 0;
        // End:0x2F4
        if(FrontEndManager.bMemoryCheckpointExists || !MyEngine.StorageAccessDisabled() && (FrontEndManager.bCheckpointSlot0Exists || FrontEndManager.bCheckpointSlot1Exists) || FrontEndManager.bCheckpointSlot2Exists)
        {
            bNewGame = true;
            ConfirmOverwrite();            
        }
        else
        {
            MenuViewLoader.SpawnDialog('SaveWarning', self);
        }        
    }
    else
    {
        ConditionalShowLoginUI(MoviePlayer.GetLP().ControllerId);
    }
    //return;    
}

function CheckForCheckpointsAsync()
{
    // End:0x2F
    if(FrontEndManager != none)
    {
        FrontEndManager.GetCheckpointEnumeration(true);
    }
    //return;    
}

function CheckForCheckPoints()
{
    bSavingEnabled = Class'LPCheckpoint'.static.CanSaveCheckpoints();
    // End:0x59
    if(FrontEndManager != none)
    {
        FrontEndManager.CheckForCheckPoints();
    }
    UpdateListDataProvider();
    CheckForCheckpointsAsync();
    //return;    
}

function ConditionalShowLoginUI()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0x195
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        // End:0x180
        if(int(OnlineSub.PlayerInterface.GetLoginStatus(byte(ControllerId))) == int(0))
        {
            OnlineSub.PlayerInterface.AddLoginChangeDelegate(NotifyLoginChange);
            OnlineSub.PlayerInterface.AddLoginCancelledDelegate(NotifyLoginCancelled);
            OnlineSub.PlayerInterface.ShowLoginUI(false, false);            
        }
        else
        {
            NotifyLoginChange(byte(ControllerId));
        }
    }
    return false;
    //return ReturnValue;    
}

function NotifyLoginChange()
{
    local /*0x97E50000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub, LP;

    LP = LocalPlayer(Outer.GetPC().Player);
    // End:0x18E
    if((LP != none) && LP.ControllerId == int(LocalUserNum))
    {
        OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
        // End:0x18B
        if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
        {
            OnlineSub.PlayerInterface.ClearLoginChangeDelegate(NotifyLoginChange);
            OnlineSub.PlayerInterface.ClearLoginCancelledDelegate(NotifyLoginCancelled);
            SelectDevice();
        }        
    }
    //return;    
}

function NotifyLoginCancelled()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0xFB
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        OnlineSub.PlayerInterface.ClearLoginChangeDelegate(NotifyLoginChange);
        OnlineSub.PlayerInterface.ClearLoginCancelledDelegate(NotifyLoginCancelled);
    }
    OnNotifyLoginCancelled();
    //return;    
}

function OnNotifyLoginCancelled()
{
    //return;    
}

function SelectDevice()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub, Engine;

    // End:0x15C
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
    {
        ControllerId = FrontEndManager.ActiveController;
        Engine = SPEngine(Class'Engine.Engine'.static.GetEngine());
        // End:0x148
        if(!Engine.IsCurrentDeviceValid())
        {
            OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
            FrontEndManager.NotifyDeviceSelectCompleteOverride = NotifyDeviceSelectComplete;
            OnlineSub.PlayerInterfaceEx.ShowDeviceSelectionUI(byte(ControllerId), 2097152, false);
            return;            
        }
        else
        {
            CheckForCheckPoints();
            OnSuccessfulDeviceSelect();
        }
    }
    //return;    
}

function NotifyDeviceSelectComplete()
{
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub, PC, MyEngine;
    local /*0x97E50000-0x00000000*/ private int PlayerIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize string DeviceName;
    local /*0x97E50000-0x00000000*/ private int DeviceID;

    PC = LPPlayerController(Outer.GetPC());
    PlayerIndex = MoviePlayer.GetLP().ControllerId;
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    FrontEndManager.NotifyDeviceSelectCompleteOverride = None;
    // End:0x28D
    if(bWasSuccessful)
    {
        // End:0x276
        if(PC != none)
        {
            MyEngine = SPEngine(PC.Player.Outer);
            // End:0x276
            if((MyEngine != none) && OnlineSub != none)
            {
                DeviceID = OnlineSub.PlayerInterfaceEx.GetDeviceSelectionResults(byte(PlayerIndex), DeviceName);
                PC.ProfileSettings.SetCurrentDeviceID(DeviceID);
                MyEngine.SetCurrentDeviceID(DeviceID);
                PC.OnlinePlayerData.StorageProvider.OnDeviceSelectionComplete(bWasSuccessful);
                PC.SaveProfile();
            }
        }
        CheckForCheckPoints();
        OnSuccessfulDeviceSelect();        
    }
    else
    {
        OnUnSuccessfulDeviceSelect();
    }
    //return;    
}

function OnSuccessfulDeviceSelect()
{
    //return;    
}

function OnUnSuccessfulDeviceSelect()
{
    //return;    
}

function ConfirmNoDevice()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmDialogMC;

    ConfirmDialogMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', none, false));
    // End:0x247
    if(ConfirmDialogMC != none)
    {
        ConfirmDialogMC.SetDefaultFocusedButton(0);
        ConfirmDialogMC.EnableDialogBackground(true);
        ConfirmDialogMC.SetNumberOfOptions(2);
        ConfirmDialogMC.SetTitle("<Strings:LostPlanetGame.FrontEnd.ConfirmNoSaveTitle>");
        ConfirmDialogMC.SetInfo("<Strings:LostPlanetGame.FrontEnd.ConfirmNoSaveInfo>");
        ConfirmDialogMC.SetButtonLabel(0, "<Strings:LostPlanetGame.PauseMenu.No>");
        ConfirmDialogMC.SetButtonLabel(1, "<Strings:LostPlanetGame.PauseMenu.Yes>");
        ConfirmDialogMC.SetButtonOnPress(0, ConfirmNoDevice_No);
        ConfirmDialogMC.SetButtonOnPress(1, ConfirmNoDevice_Yes);
    }
    //return;    
}

function ConfirmNoDevice_Yes()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    SelectDevice();
    //return;    
}

function ConfirmNoDevice_No()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    MenuViewLoader.SpawnDialog('SaveWarning', self);
    //return;    
}

function ConfirmOverwrite()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmDialogMC;

    ConfirmDialogMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, false));
    // End:0x345
    if(ConfirmDialogMC != none)
    {
        ConfirmDialogMC.SetDefaultFocusedButton(0);
        ConfirmDialogMC.EnableDialogBackground(true);
        ConfirmDialogMC.SetNumberOfOptions(2);
        // End:0x197
        if(Class'SPEngine.SPUtil'.static.IsConsoleBuild(2))
        {
            ConfirmDialogMC.SetTitle("<Strings:LostPlanetGame.FrontEnd.ConfirmNewGameOverwriteTitlePS3>");
            ConfirmDialogMC.SetInfo("<Strings:LostPlanetGame.FrontEnd.ConfirmNewGameOverwriteInfoPS3>");            
        }
        else
        {
            ConfirmDialogMC.SetTitle("<Strings:LostPlanetGame.FrontEnd.ConfirmNewGameOverwriteTitle>");
            ConfirmDialogMC.SetInfo("<Strings:LostPlanetGame.FrontEnd.ConfirmNewGameOverwriteInfo>");
        }
        ConfirmDialogMC.SetButtonLabel(0, "<Strings:LostPlanetGame.PauseMenu.No>");
        ConfirmDialogMC.SetButtonLabel(1, "<Strings:LostPlanetGame.PauseMenu.Yes>");
        ConfirmDialogMC.SetButtonOnPress(0, ConfirmOverwrite_No);
        ConfirmDialogMC.SetButtonOnPress(1, ConfirmOverwrite_Yes);
    }
    //return;    
}

function ConfirmOverwrite_Yes()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], LPPC;

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    LPPC = LPPlayerController(Outer.GetPC());
    // End:0xAA
    if(bNewGame)
    {
        MenuViewLoader.SpawnDialog('SaveWarning', self);        
    }
    else
    {
        // End:0xEC
        if(LPPC.UpdateSPGameMinDifficulty())
        {
            LPPC.SaveProfile();
        }
        LPPC.LoadCheckpointNamed("SPCheckpoint0", DesiredSlot);
    }
    //return;    
}

function ConfirmOverwrite_No()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

defaultproperties
{
    DesiredSlot=-1
}