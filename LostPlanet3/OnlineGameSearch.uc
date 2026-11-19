class OnlineGameSearch extends Settings;

enum EOnlineGameSearchEntryType
{
    OGSET_Property,                 // 0
    OGSET_LocalizedSetting,         // 1
    OGSET_ObjectProperty,           // 2
    OGSET_MAX                       // 3
};

enum EOnlineGameSearchComparisonType
{
    OGSCT_Equals,                   // 0
    OGSCT_NotEquals,                // 1
    OGSCT_GreaterThan,              // 2
    OGSCT_GreaterThanEquals,        // 3
    OGSCT_LessThan,                 // 4
    OGSCT_LessThanEquals,           // 5
    OGSCT_MAX                       // 6
};

enum EOnlineGameSearchSortType
{
    OGSSO_Ascending,                // 0
    OGSSO_Descending,               // 1
    OGSSO_MAX                       // 2
};

struct native OnlineGameSearchResult
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL GameSettings[131073];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL PlatformData[268566529];

    structdefaultproperties
    {
        GameSettings=none
    }
};

struct native OverrideSkill
{
    var(*) /*0x35EA0000-0x00000000*/ private int LeaderboardId;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Players;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Mus;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Sigmas;

    structdefaultproperties
    {
        LeaderboardId=0
        Players=none
        Mus=none
        Sigmas=none
    }
};

struct native NamedObjectProperty
{
    var(*) /*0x35EA0000-0x00000000*/ private name ObjectPropertyName;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ObjectPropertyValue;

    structdefaultproperties
    {
        ObjectPropertyName="None"
        ObjectPropertyValue=""
    }
};

struct native OnlineGameSearchParameter
{
    var(*) /*0x35EA0000-0x00000000*/ private int EntryId;
    var(*) /*0x35EA0000-0x00000000*/ private name ObjectPropertyName;
    var(*) /*0x35EA0000-0x00000000*/ private byte EntryType;
    var(*) /*0x35EA0000-0x00000000*/ private byte ComparisonType;

    structdefaultproperties
    {
        EntryId=0
        ObjectPropertyName="None"
        EntryType=EOnlineGameSearchEntryType.OGSET_Property
        ComparisonType=EOnlineGameSearchComparisonType.OGSCT_Equals
    }
};

struct native OnlineGameSearchSortClause
{
    var(*) /*0x35EA0000-0x00000000*/ private int EntryId;
    var(*) /*0x35EA0000-0x00000000*/ private name ObjectPropertyName;
    var(*) /*0x35EA0000-0x00000000*/ private byte EntryType;
    var(*) /*0x35EA0000-0x00000000*/ private byte SortType;

    structdefaultproperties
    {
        EntryId=0
        ObjectPropertyName="None"
        EntryType=EOnlineGameSearchEntryType.OGSET_Property
        SortType=EOnlineGameSearchSortType.OGSSO_Ascending
    }
};

struct native OnlineGameSearchORClause
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array OrParams;

    structdefaultproperties
    {
        OrParams=none
    }
};

struct native OnlineGameSearchQuery
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array OrClauses;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SortClauses;

    structdefaultproperties
    {
        OrClauses=none
        SortClauses=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private int MaxSearchResults;
var(*) /*0x35EA0000-0x00000000*/ private @NULL Query;
var(*) /*0x35EA0000-0x00000000*/ private config bool bIsLanQuery;
var(*) /*0x35EA0000-0x00000000*/ private config bool bUsesArbitration;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsSearchInProgress[131073];
var(*) /*0x35EA0000-0x00000000*/ private class GameSettingsClass;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Results[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL ManualSkillOverride;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array NamedProperties;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL FilterQuery;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string AdditionalSearchCriteria;
var(*) /*0x35EA0000-0x00000000*/ private int PingBucketSize;
var(*) /*0x35EA0000-0x00000000*/ private int NumPingProbes;
var(*) /*0x35EA0000-0x00000000*/ private int MaxPingBytes;

function SetSkillOverride()
{
    local /*0x35EA0000-0x00000000*/ private int LeaderboardId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Players[25296897];

    ManualSkillOverride.LeaderboardId = LeaderboardId;
    ManualSkillOverride.Players = Players;
    ManualSkillOverride.Mus.Length = 0;
    ManualSkillOverride.Sigmas.Length = 0;
    //return;    
}

// Export UOnlineGameSearch::execSortSearchResults(FFrame&, void* const)
native event SortSearchResults();

defaultproperties
{
    MaxSearchResults=25
    GameSettingsClass=Class'OnlineGameSettings'
    PingBucketSize=50
}