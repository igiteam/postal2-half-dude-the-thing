class LPHostJoinGameCommon extends Object;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte GameType;

function GetGameInterface()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], OnlineSubx, GameInterface;

    OnlineSubx = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0x60
    if(OnlineSubx != none)
    {
        GameInterface = OnlineSubx.GameInterface;
    }
    return GameInterface;
    //return ReturnValue;    
}

function GetDataStoreGameSettings()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], DataStoreManager, DataStoreGameSettings;

    DataStoreManager = Class'Engine.UIInteraction'.static.GetDataStoreClient();
    // End:0x3A
    if(DataStoreManager == none)
    {
        return none;
    }
    DataStoreGameSettings = LPUIDataStore_OnlineGameSettings(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'LPUIDataStore_OnlineGameSettings'.default.Tag));
    return DataStoreGameSettings;
    //return ReturnValue;    
}

function GetDataStoreGameSearch()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], DataStoreManager, DataStoreGameSearch;

    DataStoreManager = Class'Engine.UIInteraction'.static.GetDataStoreClient();
    // End:0x3A
    if(DataStoreManager == none)
    {
        return none;
    }
    DataStoreGameSearch = LPUIDataStore_OnlineGameSearch(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'LPUIDataStore_OnlineGameSearch'.default.Tag));
    return DataStoreGameSearch;
    //return ReturnValue;    
}

function GetLP()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Eng;

    Eng = Class'Engine.Engine'.static.GetEngine();
    return Eng.GamePlayers[0];
    //return ReturnValue;    
}

function GetPC()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LocalPlayerOwner;

    LocalPlayerOwner = GetLP();
    // End:0x25
    if(LocalPlayerOwner == none)
    {
        return none;
    }
    return LocalPlayerOwner.Actor;
    //return ReturnValue;    
}

function ConsoleCommand()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Command[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    PC = GetPC();
    // End:0x55
    if(PC != none)
    {        
        PC.ConsoleCommand(Command);
    }
    //return;    
}

function GetPlayerName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LP;

    LP = GetLP();
    return LP.Actor.WorldInfo.ComputerName;
    //return ReturnValue;    
}

function GetPlayerControllerId()
{
    local /*0x97E50000-0x00000000*/ private int PlayerIndex[9437185], ReturnValue;

    0
    return Class'Engine.UIInteraction'.static.GetPlayerControllerId(PlayerIndex);
    //return ReturnValue;    
}

function DestroyOnlineGame()
{
    local /*0x97E50000-0x00000000*/ private @NULL GameInterface;

    GameInterface = GetGameInterface();
    // DebugMode: 0
    assert(NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none)));
    GameInterface.DestroyOnlineGame('Game');
    //return;    
}
