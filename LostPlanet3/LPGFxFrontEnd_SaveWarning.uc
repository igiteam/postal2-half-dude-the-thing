class LPGFxFrontEnd_SaveWarning extends SPGFxUIView within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TitleWidget;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BodyTextWidget;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ConfirmLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BackLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBootupMode;

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL dummyButton, saveWheel, DI;
    local /*0x97E50000-0x00000000*/ private bool bCanSave;
    local /*0x97E50000-0x00000000*/ private editfixedsize string PlatformSaveWarningStringTag;
    local /*0x97E50000-0x00000000*/ private @NULL FrontEndManager;
    local /*0x97E50000-0x00000000*/ private bool bShowingMessage;

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    dummyButton = GetObject("dummyButton");
    MenuViewLoader.SetSelectionFocus(dummyButton);
    FrontEndManager = LPGFxMoviePlayerFrontEndManager(MoviePlayer);
    bBootupMode = false;
    // End:0xDA
    if(FrontEndManager != none)
    {
        bBootupMode = FrontEndManager.bShouldDisplayBootupSequence;
    }
    RefreshButtonPrompts();
    // End:0x129
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
    {
        PlatformSaveWarningStringTag = "SaveWarningPS3Desc";        
    }
    else
    {
        // End:0x16F
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
        {
            PlatformSaveWarningStringTag = "SaveWarningXBOXDesc";            
        }
        else
        {
            PlatformSaveWarningStringTag = "SaveWarningPCDesc";
        }
    }
    bCanSave = Class'LPCheckpoint'.static.CanSaveCheckpoints();
    // End:0x298
    if(bBootupMode)
    {
        TitleWidget.SetText(GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.SaveWarningTitle>"));
        BodyTextWidget.SetString("htmlText", GetLocalizedString(("<Strings:LostPlanetGame.FrontEnd." $ PlatformSaveWarningStringTag) $ ">"));
        bShowingMessage = true;        
    }
    else
    {
        // End:0x462
        if(!bCanSave)
        {
            // End:0x38D
            if(IsPlayerLoggedIn())
            {
                TitleWidget.SetText(GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.NoSaveWarningTitle>"));
                BodyTextWidget.SetString("htmlText", GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.NoSaveWarningDesc>"));
                bShowingMessage = true;                
            }
            else
            {
                TitleWidget.SetText(GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.NoSaveWarningTitle>"));
                BodyTextWidget.SetString("htmlText", GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.NoSaveWarningDesc>"));
                bShowingMessage = true;
            }
        }
    }
    // End:0x47B
    if(!bShowingMessage)
    {
        StartGame();
    }
    saveWheel = GetObject("saveWheel");
    DI = saveWheel.GetDisplayInfo();
    DI.Visible = bBootupMode;
    saveWheel.SetDisplayInfo(DI);
    MoviePlayer.SetExternalInterface(self);
    //return;    
}

function IsPlayerLoggedIn()
{
    local /*0x97E50000-0x00000000*/ private byte ControllerId[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;
    local /*0x97E50000-0x00000000*/ private byte LoginStatus;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0xCE
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        LoginStatus = OnlineSub.PlayerInterface.GetLoginStatus(ControllerId);
        // End:0xCE
        if(int(LoginStatus) != int(0))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function NotifyUsingGamepad()
{
    local /*0x97E50000-0x00000000*/ private bool bGamepad[8388609];

    RefreshButtonPrompts();
    //return;    
}

function RefreshButtonPrompts()
{
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x64
    if(ConfirmLabel != none)
    {
        ConfirmLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonConfirm>"));
    }
    // End:0x140
    if(BackLabel != none)
    {
        DI = BackLabel.GetDisplayInfo();
        DI.Visible = !bBootupMode;
        BackLabel.SetDisplayInfo(DI);
        BackLabel.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonBack>"));
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
        // End:0x41
        case 'TitleString':
            TitleWidget = Widget;
            // End:0xCD
            break;
        // End:0x6D
        case 'ConfirmString':
            ConfirmLabel = Widget;
            RefreshButtonPrompts();
            // End:0xCD
            break;
        // End:0x99
        case 'BackString':
            BackLabel = Widget;
            RefreshButtonPrompts();
            // End:0xCD
            break;
        // End:0xBB
        case 'BodyText':
            BodyTextWidget = Widget;
            // End:0xCD
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0xCD
            break;
            break;
    }
    // End:0x10F
    if(!bWasHandled)
    {
        bWasHandled = super.WidgetInitialized(WidgetName, WidgetPath, Widget);        
    }
    return bWasHandled;
    //return ReturnValue;    
}

event FilterButtonInput()
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
    // End:0x97
    if((ButtonName == 'XboxTypeS_A') || ButtonName == 'Enter')
    {
        // End:0x95
        if(int(InputEvent) == int(0))
        {
            // End:0x8B
            if(bBootupMode)
            {
                Accept();                
            }
            else
            {
                StartGame();
            }
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

function MoveBackImpl()
{
    // End:0x0F
    if(bBootupMode)
    {
        return;
    }
    super.MoveBackImpl();
    //return;    
}

function Accept()
{
    local /*0x97E50000-0x00000000*/ private @NULL FrontEndManager;

    MenuViewLoader.PopView();
    FrontEndManager = LPGFxMoviePlayerFrontEndManager(MoviePlayer);
    // End:0x6A
    if(FrontEndManager != none)
    {
        FrontEndManager.OnSaveWarningClosed();
    }
    //return;    
}

function StartGame()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPGameDataStore, FrontEndManager;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x15A
    if((LPPC != none) && Class'LPGameViewportClient'.static.IsCaptivateDemo())
    {
        LPGameDataStore = LPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'LPDataStorePersistentGameData'.default.Tag));
        // End:0xE4
        if(LPGameDataStore != none)
        {
            LPGameDataStore.ResetForNewGame();
        }
        LPPC.ClientPlayMovie("1060_JimToRelay");        
        LPPC.ConsoleCommand("open shack_a1_p_gc");
        return;
    }
    // End:0x1C8
    if(LPPC != none)
    {
        LPPC.ResetProfileForNewGame(true);
        LPPC.UpdateSPGameMinDifficulty(true);
        LPPC.SaveProfile();
    }
    Outer.PlaySoundFromTheme('AutoSaveConfirm');
    FrontEndManager = LPGFxMoviePlayerFrontEndManager(MoviePlayer);
    // End:0x28D
    if((FrontEndManager != none) && FrontEndManager.bShowCheatMapList)
    {
        MenuViewLoader.PopView();
        MenuViewLoader.SpawnDialog('MapList', self);        
    }
    else
    {
        LPPC.ClientPlayMovie("0020_JimDiaIntr");        
        LPPC.ConsoleCommand("start PodCrash_A1_P");
    }
    //return;    
}

defaultproperties
{
    bShouldHideViewStack=false
}