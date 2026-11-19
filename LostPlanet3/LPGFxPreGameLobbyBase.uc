class LPGFxPreGameLobbyBase extends GFxObject within GFxMoviePlayer;

struct SettingsListObjectPoolInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MC;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RendererDataProvider;

    structdefaultproperties
    {
        MC=none
        RendererDataProvider=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsHost;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSoundEvents;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyGameInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyGRI[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPRI[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyParentLobbyView[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyFrontEndManager[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DLCMan[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UIManagerInstance[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPPC[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RootMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoviePlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array SettingsListObjectPool[536870913];

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL GRI[8388609], PRI;

    MyLPPC = LPPlayerController(Outer.GetPC());
    MyGRI = GRI;
    MyPRI = PRI;
    MyGameInfo = LPPreGameLobby(Class'Engine.WorldInfo'.static.GetWorldInfo().Game);
    MyParentLobbyView = LPGFxFrontEnd_PreGameLobby(RootMC);
    MyFrontEndManager = LPGFxMoviePlayerFrontEndManager(MoviePlayer);
    UIManagerInstance = Class'LPUIManager'.static.GetLPUIManager();
    DLCMan = LPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager());
    bIsHost = int(Outer.GetPC().Role) == int(ROLE_Authority);
    InitCommon();
    MyLPPC.SendServerPlayerPreferences();
    switch(MyGRI.LobbyMode)
    {
        // End:0x1DD
        case 1:
            InitCustomMatch();
            // End:0x1F5
            break;
        // End:0x1EF
        case 2:
            InitQuickMatch();
            // End:0x1F5
            break;
        // End:0xFFFF
        default:
            // End:0x1F5
            break;
            break;
    }
    bIsInitialized = true;
    //return;    
}

function InitCommon()
{
    //return;    
}

function InitCustomMatch()
{
    //return;    
}

function InitQuickMatch()
{
    //return;    
}

function Cleanup()
{
    //return;    
}

function PopSettingsListObjectPool()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Result;

    // End:0x95
    if(SettingsListObjectPool.Length <= 0)
    {
        Result.MC = Outer.CreateObject("Object");
        Result.RendererDataProvider = Outer.CreateArray();        
    }
    else
    {
        Result = SettingsListObjectPool[SettingsListObjectPool.Length - 1];
        SettingsListObjectPool.Remove(SettingsListObjectPool.Length - 1, 1);        
        // End:0x137
        if(Result.MC == none)
        {
            Result.MC = Outer.CreateObject("Object");
        }
        // End:0x195
        if(Result.RendererDataProvider == none)
        {
            Result.RendererDataProvider = Outer.CreateArray();
        }
    }
    return Result;
    //return ReturnValue;    
}

function PushSettingsListObjectPool()
{
    local /*0x97E50000-0x00000000*/ private @NULL InPoolInfo[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private bool bFound;

    bFound = false;
    I = 0;
    J0x17:

    // End:0xDC [Loop If]
    if(I < SettingsListObjectPool.Length)
    {
        // End:0xCE
        if((SettingsListObjectPool[I].MC == InPoolInfo.MC) || SettingsListObjectPool[I].RendererDataProvider == InPoolInfo.RendererDataProvider)
        {
            bFound = true;
            // [Explicit Break]
            goto J0xDC;
        }
        I++;
        // [Loop Continue]
        goto J0x17;
    }
    J0xDC:

    // End:0x101
    if(!bFound)
    {
        SettingsListObjectPool.AddItem(InPoolInfo);        
    }
    //return;    
}

function ClearSettingsListObjectPool()
{
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL PoolInfoDefault;

    Idx = 0;
    J0x0B:

    // End:0x4E [Loop If]
    if(Idx < SettingsListObjectPool.Length)
    {
        SettingsListObjectPool[Idx] = PoolInfoDefault;
        ++Idx;
        // [Loop Continue]
        goto J0x0B;
    }
    SettingsListObjectPool.Length = 0;
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

event OnReceiveFocus()
{
    //return;    
}

event OnRemoveFocus()
{
    //return;    
}

function Tick()
{
    //return;    
}

static function GetLocalizedString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Label[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL TransContext;
    local /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedString;

    TransContext = Class'Engine.UIInteraction'.static.GetLocalPlayer(0).GetTranslationContext();
    LocalizedString = Class'GFxUI.GFxObject'.static.TranslateString(Label, TransContext);
    return LocalizedString;
    //return ReturnValue;    
}

function SuppressDefaultSoundEvents()
{
    local /*0x97E50000-0x00000000*/ private bool bSuppress[8388609];

    bSoundEvents = ((bSuppress) ? false : default.bSoundEvents);
    //return;    
}

function ASSetFocusedTab()
{
    local /*0x97E50000-0x00000000*/ private int Tab[8388609];

    RootMC.ActionScriptVoid("setLeftPanelFocusedTab");
    //return;    
}

defaultproperties
{
    bSoundEvents=true
}