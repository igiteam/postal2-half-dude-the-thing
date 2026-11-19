class LPMenuGame extends SPGameMP_Base
    config(Game)
    hidecategories(AnimDependency,Navigation,Movement,Collision);

function GetPlayerControllerClass()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC[8388609], StartSpot;
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return PlayerControllerClass;
    //return ReturnValue;    
}

function GetCurrentGameSettings()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], DataStore;

    DataStore = GetDataStoreGameSettings();
    // End:0x25
    if(DataStore == none)
    {
        return none;
    }
    return LPOnlineGameSettings(DataStore.GetCurrentGameSettings());
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

function GetPlayerOwner()
{
    local /*0x97E50000-0x00000000*/ private int PlayerIndex[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], UIController, Result;

    0
    UIController = Class'Engine.UIRoot'.static.GetCurrentUIController();
    // End:0xF2
    if((PlayerIndex >= 0) && PlayerIndex < UIController.Outer.Outer.GamePlayers.Length)
    {
        Result = UIController.Outer.Outer.GamePlayers[PlayerIndex];
    }
    return Result;
    //return ReturnValue;    
}

function GetProfile()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LP, LPPlayerOwner;
    local /*0x97E50000-0x00000000*/ private int PlayerIndex;

    PlayerIndex = Class'Engine.UIInteraction'.static.GetPlayerIndex(ControllerId);
    LP = GetPlayerOwner(PlayerIndex);
    LPPlayerOwner = LPPlayerController(LP.Actor);
    return LPProfileSettings(LPPlayerOwner.ProfileSettings);
    //return ReturnValue;    
}

event PostLogin()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewPlayer[8388609];

    NewPlayer.PlayerReplicationInfo.bOnlySpectator = false;
    super.PostLogin(NewPlayer);
    //return;    
}

function GenericPlayerInitialization()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609], PC;

    super.GenericPlayerInitialization(C);
    PC = LPPlayerController(C);
    // End:0x5D
    if(PC != none)
    {
        PC.ClientRegisterWithParty();
    }
    //return;    
}

event InitGame()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Options[8388609], ErrorMessage;

    super.InitGame(Options, ErrorMessage);
    RoundDuration = 0;
    TimeLimit = 0;
    // End:0x11C
    if(HasOption(Options, "OnlineMode"))
    {
        // End:0xBC
        if((ParseOption(Options, "OnlineMode")) == "Internet")
        {
            Class'LPMultiplayerManager'.static.GetInstance().SetOnlineMode(1);            
        }
        else
        {
            // End:0x11C
            if((ParseOption(Options, "OnlineMode")) == "LAN")
            {
                Class'LPMultiplayerManager'.static.GetInstance().SetOnlineMode(2);
            }
        }
    }
    //return;    
}

function InitGameReplicationInfo()
{
    super.InitGameReplicationInfo();
    LPGRI(GetGRI()).InitServerDLCInfos();
    //return;    
}

function SetGameRules()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function SpawnPlayerController()
{
    local /*0x97E50000-0x00000000*/ private class SpawnPlayerControllerClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SpawnLocation[8388609], SpawnRotation, StartingSpot, ReturnValue;

    return Spawn(SpawnPlayerControllerClass,,, SpawnLocation, SpawnRotation);
    //return ReturnValue;    
}

function StartMatch()
{
    local /*0x97E50000-0x00000000*/ private bool bFireLevelStartup[9437185], bFireLevelBegin;

    true
    true
    bWaitingToStartMatch = false;
    StartOnlineGame();
    WorldInfo.NotifyMatchStarted(bFireLevelStartup, bFireLevelBegin);
    //return;    
}

event HandleSeamlessTravelPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[25165825];
    local /*0x97E50000-0x00000000*/ private int TeamNum;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    C.PlayerReplicationInfo.bOnlySpectator = false;
    TeamNum = 0;
    LPPC = LPPlayerController(C);
    // End:0xBB
    if((LPPC != none) && LPPC.PickedTeamNum != 255)
    {
        TeamNum = LPPC.PickedTeamNum;
    }
    super(GameInfo).HandleSeamlessTravelPlayer(C);
    ChangeTeam(C, TeamNum, false);
    //return;    
}

event KickIdler()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC[8388609];

    //return;    
}

function StartOnlineGame()
{
    GameReplicationInfo.StartMatch();
    //return;    
}

function EndOnlineGame()
{
    //return;    
}

defaultproperties
{
    // Reference: SPAIVisibilityManager'Default__LPMenuGame.VisMan0'
    begin object name=VisMan0
    end object
    AIVisMan=VisMan0
    AccessControlClass=Class'LPAccessControl'
    GameReplicationInfoClass=Class'LPMenuGameGRI'
    BusyIndicators[1]=(Material=Material'HUD.loadingRing',EdgeOffsetY=0.3000000)
    BusyIndicators[2]=(Material=Material'HUD.saveWheel',EdgeOffsetY=0.3000000)
}