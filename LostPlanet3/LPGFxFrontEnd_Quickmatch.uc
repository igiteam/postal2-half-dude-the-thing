class LPGFxFrontEnd_Quickmatch extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsMatching;

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    UpdateListDataProviderAndSearch();
    //return;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];

    0
    //return;    
}

function UpdateListDataProviderAndHost()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPManager, DataProvider, TempObj;

    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    ClearSettingsList();
    DataProvider = Outer.CreateArray();
    // End:0x1EA
    if(DataProvider != none)
    {
        TempObj = Outer.CreateObject("Object");
        TempObj.SetString("label", "<Strings:LostPlanetGame.FrontEnd.CreatingGame>");
        TempObj.SetString("control", "menu");
        DataProvider.SetElementObject(0, TempObj);
        ListMC.SetObject("dataProvider", DataProvider);
        ListDataProvider = ListMC.GetObject("dataProvider");
        bIsMatching = true;
        MPManager.HostGame();        
    }
    //return;    
}

function UpdateListDataProviderAndSearch()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPManager, DataProvider, TempObj;

    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    ClearSettingsList();
    DataProvider = Outer.CreateArray();
    // End:0x246
    if(DataProvider != none)
    {
        TempObj = Outer.CreateObject("Object");
        TempObj.SetString("label", "<Strings:LostPlanetGame.FrontEnd.Searching>");
        TempObj.SetString("control", "menu");
        DataProvider.SetElementObject(0, TempObj);
        ListMC.SetObject("dataProvider", DataProvider);
        ListDataProvider = ListMC.GetObject("dataProvider");
        ListMC.AddEventListener('CLIK_change', OnListChange);
        MPManager.__OnFindOnlineGamesComplete__Delegate = OnSearchComplete;
        MPManager.FindOnlineGames();        
    }
    //return;    
}

function OnSearchComplete()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array Results[8519681];
    local /*0x97E50000-0x00000000*/ private @NULL MPManager;
    local /*0x97E50000-0x00000000*/ private byte I;
    local /*0x97E50000-0x00000000*/ private @NULL DataProvider, TempObj;
    local /*0x97E50000-0x00000000*/ private int NumResults;
    local /*0x97E50000-0x00000000*/ private @NULL Result;
    local /*0x97E50000-0x00000000*/ private int BestGameToJoin, NextBestGameToJoin;
    local /*0x97E50000-0x00000000*/ private @NULL ResultSettings;

    BestGameToJoin = -1;
    NextBestGameToJoin = -1;
    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    MPManager.__OnFindOnlineGamesComplete__Delegate = None;
    NumResults = Results.Length;
    // End:0xA6
    if(NumResults == 0)
    {
        UpdateListDataProviderAndHost();
        return;
    }
    I = 0;
    J0xB2:

    // End:0x2B8 [Loop If]
    if(int(I) < NumResults)
    {
        Result = Results[int(I)];
        ResultSettings = LPOnlineGameSettings(Result.GameSettings);
        // End:0x12B
        if(ResultSettings == none)
        {            
        }
        else
        {
            // End:0x184
            if((int(ResultSettings.GetSessionType()) == int(2)) && int(ResultSettings.GetInviteMode()) != int(3))
            {                
            }
            else
            {
                // End:0x1B1
                if(int(ResultSettings.GetMatchState()) == int(3))
                {                    
                }
                else
                {
                    // End:0x1D8
                    if(ResultSettings.NumOpenPublicConnections == 0)
                    {                        
                    }
                    else
                    {
                        // End:0x200
                        if(ResultSettings.NumOpenPublicConnections > 10)
                        {                            
                        }
                        else
                        {
                            // End:0x292
                            if(int(ResultSettings.GetMatchState()) == int(1))
                            {
                                // End:0x27A
                                if((ResultSettings.GetTimeRemaining() >= 0) && ResultSettings.GetTimeRemaining() < 120)
                                {
                                    // [Explicit Continue]
                                    goto J0x2AA;
                                }
                                NextBestGameToJoin = int(I);                                
                            }
                            else
                            {
                                BestGameToJoin = int(I);
                                // [Explicit Break]
                                goto J0x2B8;
                            }
                        }
                    }
                }
            }
        }
        J0x2AA:

        I++;
        // [Loop Continue]
        goto J0xB2;
    }
    J0x2B8:

    // End:0x2EB
    if((BestGameToJoin < 0) && NextBestGameToJoin >= 0)
    {
        BestGameToJoin = NextBestGameToJoin;
    }
    // End:0x306
    if(BestGameToJoin < 0)
    {
        UpdateListDataProviderAndHost();
        return;
    }
    DataProvider = Outer.CreateArray();
    // End:0x4A0
    if(DataProvider != none)
    {
        Result = Results[0];
        TempObj = Outer.CreateObject("Object");
        TempObj.SetString("label", "<Strings:LostPlanetGame.FrontEnd.JoiningGame>");
        TempObj.SetString("control", "menu");
        DataProvider.SetElementObject(0, TempObj);
        ListMC.SetObject("dataProvider", DataProvider);
        ListMC.SetFloat("selectedIndex", 0.0000000);        
    }
    bIsMatching = true;
    MPManager.JoinGame(Results[BestGameToJoin]);
    //return;    
}

function Select_BackImpl()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPManager;

    // End:0x0F
    if(bIsMatching)
    {
        return;
    }
    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    MPManager.CancelFindOnlineGames();
    super(SPGFxUIViewSettingsMenuBase).Select_BackImpl();
    //return;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.FrontEnd.QuickmatchGame>"
}