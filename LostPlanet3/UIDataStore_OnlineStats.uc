class UIDataStore_OnlineStats extends UIDataStore_Remote
    abstract
    transient
    config(Engine)
    hidecategories(Object,UIRoot);

enum EStatsFetchType
{
    SFT_Player,                     // 0
    SFT_CenteredOnPlayer,           // 1
    SFT_Friends,                    // 2
    SFT_TopRankings,                // 3
    SFT_MAX                         // 4
};

struct native PlayerNickMetaData
{
    var(*) /*0x35EA0000-0x00000000*/ private name PlayerNickName[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string PlayerNickColumnName;

    structdefaultproperties
    {
        PlayerNickName="None"
        PlayerNickColumnName=""
    }
};

struct native RankMetaData
{
    var(*) /*0x35EA0000-0x00000000*/ private name RankName[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string RankColumnName;

    structdefaultproperties
    {
        RankName="None"
        RankColumnName=""
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array StatsReadClasses;
var(*) /*0x35EA0000-0x00000000*/ private name StatsReadName[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL PlayerNickData[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL RankNameMetaData[131073];
var(*) /*0x35EA0000-0x00000000*/ private name TotalRowsName[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array StatsReadObjects;
var(*) /*0x35EA0000-0x00000000*/ private @NULL StatsRead;
var(*) /*0x35EA0000-0x00000000*/ private byte CurrentReadType;
var(*) /*0x35EA0000-0x00000000*/ private @NULL StatsInterface;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PlayerInterface;

event Init()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xB9
    if(OnlineSub != none)
    {
        StatsInterface = OnlineSub.StatsInterface;
        PlayerInterface = OnlineSub.PlayerInterface;
        StatsInterface.AddReadOnlineStatsCompleteDelegate(OnReadComplete);
    }
    //return;    
}

function SetStatsReadInfo()
{
    StatsRead = StatsReadObjects[0];
    CurrentReadType = 0;
    //return;    
}

event RefreshStats()
{
    local /*0x35EA0000-0x00000000*/ private byte ControllerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Players;
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID;

    SetStatsReadInfo();
    StatsInterface.FreeStats(StatsRead);
    OnReadComplete(true);
    switch(CurrentReadType)
    {
        // End:0xD9
        case 0:
            PlayerInterface.GetUniquePlayerId(ControllerIndex, PlayerID);
            Players[0] = PlayerID;
            // End:0xD7
            if(StatsInterface.ReadOnlineStats(Players, StatsRead) == false)
            {
                return false;
            }
            return true;
        // End:0x11C
        case 1:
            // End:0x11A
            if(StatsInterface.ReadOnlineStatsByRankAroundPlayer(ControllerIndex, StatsRead, 10) == false)
            {
                return false;
            }
            return true;
        // End:0x15D
        case 2:
            // End:0x15B
            if(StatsInterface.ReadOnlineStatsForFriends(ControllerIndex, StatsRead) == false)
            {
                return false;
            }
            return true;
        // End:0x197
        case 3:
            // End:0x195
            if(StatsInterface.ReadOnlineStatsByRank(StatsRead) == false)
            {
                return false;
            }
            return true;
        // End:0xFFFF
        default:
            //return ReturnValue;
            break;
    }    
}

event ShowGamercard()
{
    local /*0x35EA0000-0x00000000*/ private byte ConrollerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private int ListIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, PlayerExt, PlayerID;

    // End:0x13F
    if((ListIndex >= 0) && ListIndex < StatsRead.Rows.Length)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        // End:0x13C
        if(OnlineSub != none)
        {
            PlayerExt = OnlineSub.PlayerInterfaceEx;
            // End:0x139
            if(NotEqual_InterfaceInterface(PlayerExt, OnlinePlayerInterfaceEx(none)))
            {
                PlayerID = StatsRead.Rows[ListIndex].PlayerID;
                return PlayerExt.ShowGamerCardUI(ConrollerIndex, PlayerID);                
            }            
        }        
    }
    //return ReturnValue;    
}

function OnReadComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    // End:0x20
    if(bWasSuccessful)
    {
        SortResultsByRank(StatsRead);
    }
    RefreshSubscribers();
    //return;    
}

// Export UUIDataStore_OnlineStats::execSortResultsByRank(FFrame&, void* const)
native static function SortResultsByRank()
{
    local /*0x35EA0000-0x00000000*/ private @NULL StatsToSort[8388609];


}

defaultproperties
{
    StatsReadName="StatsReadResults"
    PlayerNickData=(PlayerNickName="Player Nick",PlayerNickColumnName="Player Nick")
    RankNameMetaData=(RankName="Rank",RankColumnName="Rank")
    TotalRowsName="TotalRows"
    Tag="OnlineStats"
}