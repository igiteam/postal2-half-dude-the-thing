interface OnlineGameInterface extends Interface
    abstract;

function CreateOnlineGame()
{
    local /*0x35EA0000-0x00000000*/ private byte HostingPlayerNum[8388609];
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL NewGameSettings[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnCreateOnlineGameComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddCreateOnlineGameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> CreateOnlineGameCompleteDelegate[8388609];

    //return;    
}

function ClearCreateOnlineGameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> CreateOnlineGameCompleteDelegate[8388609];

    //return;    
}

function UpdateOnlineGame()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL UpdatedGameSettings[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bShouldRefreshOnlineData[9437185], ReturnValue;

    false
    //return ReturnValue;    
}

delegate OnUpdateOnlineGameComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddUpdateOnlineGameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> UpdateOnlineGameCompleteDelegate[8388609];

    //return;    
}

function ClearUpdateOnlineGameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> UpdateOnlineGameCompleteDelegate[8388609];

    //return;    
}

function GetGameSettings()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    //return ReturnValue;    
}

function DestroyOnlineGame()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnDestroyOnlineGameComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddDestroyOnlineGameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> DestroyOnlineGameCompleteDelegate[8388609];

    //return;    
}

function ClearDestroyOnlineGameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> DestroyOnlineGameCompleteDelegate[8388609];

    //return;    
}

function FindOnlineGames()
{
    local /*0x35EA0000-0x00000000*/ private byte SearchingPlayerNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL SearchSettings[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnFindOnlineGamesComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddFindOnlineGamesCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> FindOnlineGamesCompleteDelegate[8388609];

    //return;    
}

function ClearFindOnlineGamesCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> FindOnlineGamesCompleteDelegate[8388609];

    //return;    
}

function CancelFindOnlineGames()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnCancelFindOnlineGamesComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddCancelFindOnlineGamesCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> CancelFindOnlineGamesCompleteDelegate[8388609];

    //return;    
}

function ClearCancelFindOnlineGamesCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> CancelFindOnlineGamesCompleteDelegate[8388609];

    //return;    
}

delegate OnQosStatusChanged()
{
    local /*0x35EA0000-0x00000000*/ private int NumComplete[8388609], NumTotal;

    //return;    
}

function AddQosStatusChangedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> QosStatusChangedDelegate[8388609];

    //return;    
}

function ClearQosStatusChangedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> QosStatusChangedDelegate[8388609];

    //return;    
}

function ReadPlatformSpecificSessionInfo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL DesiredGame[25296897];
    local /*0x35EA0000-0x00000000*/ private byte PlatformSpecificInfo[25165964];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ReadPlatformSpecificSessionInfoBySessionName()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private byte PlatformSpecificInfo[25165964];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function BindPlatformSpecificSessionToSearch()
{
    local /*0x35EA0000-0x00000000*/ private byte SearchingPlayerNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL SearchSettings[8388609];
    local /*0x35EA0000-0x00000000*/ private byte PlatformSpecificInfo[8388748];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function GetGameSearch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    //return ReturnValue;    
}

function FreeSearchResults()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Search[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function QueryNonAdvertisedData()
{
    local /*0x35EA0000-0x00000000*/ private int StartAt[8388609], NumberToQuery;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function JoinOnlineGame()
{
    local /*0x35EA0000-0x00000000*/ private byte PlayerNum[8388609];
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL DesiredGame[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnJoinOnlineGameComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddJoinOnlineGameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> JoinOnlineGameCompleteDelegate[8388609];

    //return;    
}

function ClearJoinOnlineGameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> JoinOnlineGameCompleteDelegate[8388609];

    //return;    
}

function GetResolvedConnectString()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ConnectInfo[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function RegisterPlayer()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasInvited[8388609], ReturnValue;

    //return ReturnValue;    
}

function RegisterPlayers()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Players[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnRegisterPlayerComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddRegisterPlayerCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> RegisterPlayerCompleteDelegate[8388609];

    //return;    
}

function ClearRegisterPlayerCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> RegisterPlayerCompleteDelegate[8388609];

    //return;    
}

function UnregisterPlayer()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function UnregisterPlayers()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Players[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnUnregisterPlayerComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddUnregisterPlayerCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> UnregisterPlayerCompleteDelegate[8388609];

    //return;    
}

function ClearUnregisterPlayerCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> UnregisterPlayerCompleteDelegate[8388609];

    //return;    
}

function StartOnlineGame()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnStartOnlineGameComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddStartOnlineGameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> StartOnlineGameCompleteDelegate[8388609];

    //return;    
}

function ClearStartOnlineGameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> StartOnlineGameCompleteDelegate[8388609];

    //return;    
}

function EndOnlineGame()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnEndOnlineGameComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddEndOnlineGameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> EndOnlineGameCompleteDelegate[8388609];

    //return;    
}

function ClearEndOnlineGameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> EndOnlineGameCompleteDelegate[8388609];

    //return;    
}

function RegisterForArbitration()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnArbitrationRegistrationComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddArbitrationRegistrationCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ArbitrationRegistrationCompleteDelegate[8388609];

    //return;    
}

function ClearArbitrationRegistrationCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ArbitrationRegistrationCompleteDelegate[8388609];

    //return;    
}

function GetArbitratedPlayers()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnGameInviteAccepted()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InviteResult[25296897];

    //return;    
}

function AddGameInviteAcceptedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> GameInviteAcceptedDelegate[8388609];

    //return;    
}

function ClearGameInviteAcceptedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> GameInviteAcceptedDelegate[8388609];

    //return;    
}

function AcceptGameInvite()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function RecalculateSkillRating()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Players[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnRecalculateSkillRatingComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddRecalculateSkillRatingCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> RecalculateSkillRatingCompleteDelegate[8388609];

    //return;    
}

function ClearRecalculateSkillRatingCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> RecalculateSkillRatingGameCompleteDelegate[8388609];

    //return;    
}

function MigrateOnlineGame()
{
    local /*0x35EA0000-0x00000000*/ private byte HostingPlayerNum[8388609];
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnMigrateOnlineGameComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddMigrateOnlineGameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> MigrateOnlineGameCompleteDelegate[8388609];

    //return;    
}

function ClearMigrateOnlineGameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> MigrateOnlineGameCompleteDelegate[8388609];

    //return;    
}

function JoinMigratedOnlineGame()
{
    local /*0x35EA0000-0x00000000*/ private byte PlayerNum[8388609];
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL DesiredGame[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnJoinMigratedOnlineGameComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function AddJoinMigratedOnlineGameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> JoinMigratedOnlineGameCompleteDelegate[8388609];

    //return;    
}

function ClearJoinMigratedOnlineGameCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> JoinMigratedOnlineGameCompleteDelegate[8388609];

    //return;    
}

function GetGameSearchResults()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ReturnValue[92274689];

    //return ReturnValue;    
}

function SetGameSearchResultsLengthToZero()
{
    //return;    
}

function AppendToGameSearchResults()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Results[8388609];

    //return;    
}

function CancelNATNegotiation()
{
    //return;    
}
