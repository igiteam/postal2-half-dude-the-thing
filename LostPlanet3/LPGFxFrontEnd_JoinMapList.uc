class LPGFxFrontEnd_JoinMapList extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

const PROPERTY_FRIENDLYFIRE = 0x1000000A;
const PROPERTY_MAPNAME = 0x1000000B;
const PROPERTY_MATCHDIFFICULTY = 0x1000000C;
const PROPERTY_ROUNDSTOWIN = 0x1000000D;
const PROPERTY_SCORELIMIT = 0x1000000E;
const PROPERTY_TIMELIMIT = 0x1000000F;
const PROPERTY_MATCHSTATE = 0x10000010;
const PROPERTY_SCORELEFT = 0x10000011;
const PROPERTY_TIMELEFT = 0x10000012;
const PROPERTY_GAMETYPE = 0x10000013;
const PROPERTY_INVITEMODE = 0x10000014;
const PROPERTY_SESSIONTYPE = 0x10000015;
const PROPERTY_AVAIL_TEAM_SIZE = 0x10000016;
const PROPERTY_AVGPLAYERSKILL = 0x10000017;
const PROPERTY_REQUIRED_DLC = 0x1000003E;
const PROPERTY_INSTALLED_DLC = 0x1000003F;
const PROPERTY_TENGRUSHWINS = 0x20000002;
const PROPERTY_TENGCOLLECTED = 0x20000003;
const PROPERTY_TDMWINS = 0x20000004;
const PROPERTY_SCENARIO_WINS = 0x20000005;
const PROPERTY_CREDITS = 0x20000006;
const PROPERTY_PLAYTIME = 0x20000007;
const PROPERTY_REVIVALS = 0x20000008;
const PROPERTY_KILLS = 0x20000009;
const PROPERTY_SURVIVALWINS = 0x2000003D;
const SESSION_MATCH_QUERY_ALL = 0;
const SESSION_MATCH_QUERY_EXTRACTION = 2;
const SESSION_MATCH_QUERY_SCENARIO = 3;
const SESSION_MATCH_QUERY_TEAMDEATHMATCH = 4;
const SESSION_MATCH_QUERY_PARTY = 5;
const SESSION_MATCH_QUERY_SURVIVAL = 6;
const SESSION_MATCH_QUERY_ALL_DLCEXACT = 7;
const SESSION_MATCH_QUERY_ALL_DLCANY = 8;
const SESSION_MATCH_QUERY_EXTRACTION_DLCEXACT = 10;
const SESSION_MATCH_QUERY_EXTRACTION_DLCANY = 11;
const SESSION_MATCH_QUERY_SCENARIO_DLCEXACT = 12;
const SESSION_MATCH_QUERY_SCENARIO_DLCANY = 13;
const SESSION_MATCH_QUERY_TEAMDEATHMATCH_DLCEXACT = 14;
const SESSION_MATCH_QUERY_TEAMDEATHMATCH_DLCANY = 15;
const SESSION_MATCH_QUERY_PARTY_DLCEXACT = 16;
const SESSION_MATCH_QUERY_PARTY_DLCANY = 17;
const SESSION_MATCH_QUERY_SURVIVAL_DLCEXACT = 20;
const SESSION_MATCH_QUERY_SURVIVAL_DLCANY = 21;
const SESSION_MATCH_QUERY_ALL_DLCMINREQUIRED = 22;
const SESSION_MATCH_QUERY_EXTRACTION_DLCMINREQUIRED = 23;
const SESSION_MATCH_QUERY_SCENARIO_DLCMINREQUIRED = 24;
const SESSION_MATCH_QUERY_TEAMDEATHMATCH_DLCMINREQUIRED = 25;
const SESSION_MATCH_QUERY_PARTY_DLCMINREQUIRED = 26;
const SESSION_MATCH_QUERY_SURVIVAL_DLCMINREQUIRED = 27;
const CONTEXT_GAME_MODE = 0x0000800B;
const CONTEXT_PRESENCE_IDLE = 0;
const CONTEXT_PRESENCE_DEFAULT = 1;
const CONTEXT_PRESENCE_INMENU = 2;
const CONTEXT_PRESENCE_INLOBBY = 3;
const CONTEXT_PRESENCE_INGAME = 4;
const CONTEXT_PRESENCE_INCAMPAIGN = 5;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array GameSearchResults;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJoinInProgress;

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    UpdateListDataProviderAndSearch();
    bJoinInProgress = false;
    // End:0xA6
    if(previousView == 'InfoDialog')
    {
        ShutDown();
        MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
        return;
    }
    //return;    
}

function OnViewClosed()
{
    ShutDown();
    //return;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];

    0
    //return;    
}

function UpdateListDataProviderAndSearch()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPManager, DataProvider, TempObj, MenuGame, GameSearch;

    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    MenuGame = LPMenuGame(Class'Engine.WorldInfo'.static.GetWorldInfo().Game);
    GameSearchResults.Length = 0;
    ClearSettingsList();
    DataProvider = Outer.CreateArray();
    // End:0x42F
    if(DataProvider != none)
    {
        TempObj = Outer.CreateObject("Object");
        TempObj.SetString("label", "<Strings:LostPlanetGame.FrontEnd.Searching>");
        TempObj.SetString("control", "menu");
        DataProvider.SetElementObject(0, TempObj);
        ListMC.SetObject("dataProvider", DataProvider);
        ListDataProvider = ListMC.GetObject("dataProvider");
        ListMC.AddEventListener('CLIK_itemPress', OnListItemPress);
        ListMC.AddEventListener('CLIK_change', OnListChange);
        // End:0x2EF
        if(int(MPManager.OnlineMode) == int(2))
        {
            MPManager.GetDataStoreGameSearch().SetCurrentByName('DefaultLAN');            
        }
        else
        {
            MPManager.GetDataStoreGameSearch().SetCurrentByName('Default');
        }
        // End:0x3DD
        if((MenuGame != none) && MenuGame.bInDevMode)
        {
            GameSearch = LPOnlineGameSearch(MPManager.GetDataStoreGameSearch().GetCurrentGameSearch());
            // End:0x3DD
            if(GameSearch != none)
            {
                GameSearch.SetIntProperty(268435476, 0);
            }
        }
        MPManager.__OnFindOnlineGamesComplete__Delegate = OnSearchComplete;
        MPManager.FindOnlineGames();        
    }
    //return;    
}

function BuildNoGamesFoundDialog()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmMC;

    ConfirmMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, true));
    // End:0x28F
    if(ConfirmMC != none)
    {
        ConfirmMC.SetDefaultFocusedButton(0);
        ConfirmMC.EnableDialogBackground(true);
        ConfirmMC.SetNumberOfOptions(1);
        ConfirmMC.SetTitle("<Strings:LostPlanetGame.LPGFxFrontEnd_JoinMapList.NoGamesTitle>");
        // End:0x19B
        if(int(Class'LPMultiplayerManager'.static.GetOnlineMode()) == int(2))
        {
            ConfirmMC.SetInfo("<Strings:LostPlanetGame.LPGFxFrontEnd_JoinMapList.NoGamesBodyLAN>");            
        }
        else
        {
            ConfirmMC.SetInfo("<Strings:LostPlanetGame.LPGFxFrontEnd_JoinMapList.NoGamesBodyInternet>");
        }
        ConfirmMC.SetButtonLabel(0, "<Strings:LostPlanetGame.LPGFxFrontEnd_JoinMapList.Back>");
        ConfirmMC.SetButtonOnPress(0, cbNoGamesFound_Back);        
    }
    else
    {
        MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    }
    //return;    
}

function OnSearchComplete()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array Results[8519681];
    local /*0x97E50000-0x00000000*/ private @NULL MPManager;
    local /*0x97E50000-0x00000000*/ private byte I, Count;
    local /*0x97E50000-0x00000000*/ private @NULL DataProvider, TempObj;
    local /*0x97E50000-0x00000000*/ private int NumResults;
    local /*0x97E50000-0x00000000*/ private @NULL Result, ResultGameSettings;

    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    MPManager.__OnFindOnlineGamesComplete__Delegate = None;
    NumResults = Results.Length;
    // End:0x88
    if(NumResults == 0)
    {
        BuildNoGamesFoundDialog();
        return;
    }
    DataProvider = Outer.CreateArray();
    // End:0x3CB
    if(DataProvider != none)
    {
        Count = 0;
        I = 0;
        J0xD8:

        // End:0x2C7 [Loop If]
        if(int(I) < NumResults)
        {
            Result = Results[int(I)];
            ResultGameSettings = LPOnlineGameSettings(Result.GameSettings);
            // End:0x151
            if(ResultGameSettings == none)
            {                
            }
            else
            {
                // End:0x17E
                if(int(ResultGameSettings.GetSessionType()) == int(2))
                {                    
                }
                else
                {
                    // End:0x1AB
                    if(int(ResultGameSettings.GetMatchState()) == int(3))
                    {                        
                    }
                    else
                    {
                        TempObj = Outer.CreateObject("Object");
                        TempObj.SetString("label", Result.GameSettings.OwningPlayerName);
                        TempObj.SetString("control", "menu");
                        DataProvider.SetElementObject(int(Count), TempObj);
                        GameSearchResults.AddItem(Result);                        
                        Count++;
                    }
                }
            }
            I++;
            // [Loop Continue]
            goto J0xD8;
        }
        // End:0x2E7
        if(int(Count) == int(0))
        {
            BuildNoGamesFoundDialog();
            return;
        }
        ListMC.SetObject("dataProvider", DataProvider);
        ListMC.SetFloat("selectedIndex", 0.0000000);
        ListMC.AddEventListener('CLIK_itemPress', OnListItemPress);
        ListMC.AddEventListener('CLIK_change', OnListChange);        
    }
    //return;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], MPManager;
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;

    super(SPGFxUIViewSettingsMenuBase).OnListItemPress(ev);
    SelectedIndex = ev.Index;
    // End:0xB2
    if(bJoinInProgress == false)
    {
        MPManager = Class'LPMultiplayerManager'.static.GetInstance();
        MPManager.JoinGame(GameSearchResults[SelectedIndex]);
        bJoinInProgress = true;
    }
    //return;    
}

function cbNoGamesFound_Back()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    ReturnToPrevious();
    //return;    
}

function ReturnToPrevious()
{
    // End:0x4D
    if(!bJoinInProgress)
    {
        MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    }
    //return;    
}

function ShutDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPManager;

    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    MPManager.__OnFindOnlineGamesComplete__Delegate = None;
    MPManager.CancelFindOnlineGames();
    //return;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.FrontEnd.JoinGame>"
}