class OnlineStatsRead extends OnlineStats
    abstract;

struct native OnlineStatsColumn
{
    var(*) /*0x35EA0000-0x00000000*/ private int ColumnNo;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL StatValue;

    structdefaultproperties
    {
        ColumnNo=0
        StatValue=(Type=ESettingsDataType.SDT_Empty,Value1=0)
    }
};

struct native OnlineStatsRow
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL PlayerID[131073];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Rank[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string NickName[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Columns;

    structdefaultproperties
    {
        PlayerID=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        Rank=(Type=ESettingsDataType.SDT_Empty,Value1=0)
        NickName=""
        Columns=none
    }
};

struct native ColumnMetaData
{
    var(*) /*0x35EA0000-0x00000000*/ private int Id[131073];
    var(*) /*0x35EA0000-0x00000000*/ private name Name[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ColumnName;

    structdefaultproperties
    {
        Id=0
        Name="None"
        ColumnName=""
    }
};

var(*) /*0x35EA0000-0x00000000*/ private int ViewId;
var(*) /*0x35EA0000-0x00000000*/ private int SortColumnId[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ColumnIds[131073];
var(*) /*0x35EA0000-0x00000000*/ private int TotalRowsInView[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Rows;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ColumnMappings[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ViewName[131073];
var(*) /*0x35EA0000-0x00000000*/ private int TitleId[131073];

event OnReadComplete()
{
    //return;    
}

// Export UOnlineStatsRead::execGetIntStatValueForPlayer(FFrame&, void* const)
native function GetIntStatValueForPlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private int StatColumnNo[8388609], StatValue;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlineStatsRead::execSetIntStatValueForPlayer(FFrame&, void* const)
native function SetIntStatValueForPlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private int StatColumnNo[8388609], StatValue;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlineStatsRead::execGetFloatStatValueForPlayer(FFrame&, void* const)
native function GetFloatStatValueForPlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private int StatColumnNo[8388609];
    local /*0x35EA0000-0x00000000*/ private float StatValue[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlineStatsRead::execSetFloatStatValueForPlayer(FFrame&, void* const)
native function SetFloatStatValueForPlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private int StatColumnNo[8388609];
    local /*0x35EA0000-0x00000000*/ private float StatValue[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlineStatsRead::execGetStatValueForPlayerAsString(FFrame&, void* const)
native function GetStatValueForPlayerAsString()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private int StatColumnNo[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string StatValue[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlineStatsRead::execIsStatZero(FFrame&, void* const)
native function IsStatZero()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private int StatColumnNo[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlineStatsRead::execAddPlayer(FFrame&, void* const)
native function AddPlayer()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string PlayerName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];


}

// Export UOnlineStatsRead::execGetRankForPlayer(FFrame&, void* const)
native function GetRankForPlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}
