class OnlineSubsystem extends Object
    abstract
    config(Engine);

enum EBrowseTarget
{
    BT_Category,                    // 0
    BT_Product,                     // 1
    BT_ProductCode,                 // 2
    BT_MAX                          // 3
};

enum ELoginStatus
{
    LS_NotLoggedIn,                 // 0
    LS_UsingLocalProfile,           // 1
    LS_LoggedIn,                    // 2
    LS_MAX                          // 3
};

enum EFeaturePrivilegeLevel
{
    FPL_Disabled,                   // 0
    FPL_EnabledFriendsOnly,         // 1
    FPL_Enabled,                    // 2
    FPL_MAX                         // 3
};

enum ENetworkNotificationPosition
{
    NNP_TopLeft,                    // 0
    NNP_TopCenter,                  // 1
    NNP_TopRight,                   // 2
    NNP_CenterLeft,                 // 3
    NNP_Center,                     // 4
    NNP_CenterRight,                // 5
    NNP_BottomLeft,                 // 6
    NNP_BottomCenter,               // 7
    NNP_BottomRight,                // 8
    NNP_MAX                         // 9
};

enum EOnlineGameState
{
    OGS_NoSession,                  // 0
    OGS_Pending,                    // 1
    OGS_Starting,                   // 2
    OGS_InProgress,                 // 3
    OGS_Ending,                     // 4
    OGS_Ended,                      // 5
    OGS_MAX                         // 6
};

enum EOnlineEnumerationReadState
{
    OERS_NotStarted,                // 0
    OERS_InProgress,                // 1
    OERS_Done,                      // 2
    OERS_Failed,                    // 3
    OERS_MAX                        // 4
};

enum EOnlineFriendState
{
    OFS_Offline,                    // 0
    OFS_Online,                     // 1
    OFS_Away,                       // 2
    OFS_Busy,                       // 3
    OFS_MAX                         // 4
};

enum EOnlineContentType
{
    OCT_Downloaded,                 // 0
    OCT_SaveGame,                   // 1
    OCT_MAX                         // 2
};

enum EOnlineServerConnectionStatus
{
    OSCS_NotConnected,              // 0
    OSCS_Connected,                 // 1
    OSCS_ConnectionDropped,         // 2
    OSCS_NoNetworkConnection,       // 3
    OSCS_ServiceUnavailable,        // 4
    OSCS_UpdateRequired,            // 5
    OSCS_ServersTooBusy,            // 6
    OSCS_DuplicateLoginDetected,    // 7
    OSCS_InvalidUser,               // 8
    OSCS_MAX                        // 9
};

enum ENATType
{
    NAT_Unknown,                    // 0
    NAT_Open,                       // 1
    NAT_Moderate,                   // 2
    NAT_Strict,                     // 3
    NAT_MAX                         // 4
};

enum ELanBeaconState
{
    LANB_NotUsingLanBeacon,         // 0
    LANB_Hosting,                   // 1
    LANB_Searching,                 // 2
    LANB_MAX                        // 3
};

enum EOnlineAccountCreateStatus
{
    OACS_CreateSuccessful,          // 0
    OACS_UnknownError,              // 1
    OACS_InvalidUserName,           // 2
    OACS_InvalidPassword,           // 3
    OACS_InvalidUniqueUserName,     // 4
    OACS_UniqueUserNameInUse,       // 5
    OACS_ServiceUnavailable,        // 6
    OACS_MAX                        // 7
};

enum EOnlineNewsType
{
    ONT_Unknown,                    // 0
    ONT_GameNews,                   // 1
    ONT_ContentAnnouncements,       // 2
    ONT_Misc,                       // 3
    ONT_MAX                         // 4
};

struct native FriendsQuery
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL UniqueId;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsFriend;

    structdefaultproperties
    {
        UniqueId=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        bIsFriend=false
    }
};

struct native OnlineFriend
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL UniqueId[131073];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SessionId[131073];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL RoomId[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string NickName[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string PresenceInfo[131073];
    var(*) /*0x35EA0000-0x00000000*/ private byte FriendState[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsOnline[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsPlaying[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsPlayingThisGame[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsJoinable[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool bHasVoiceSupport[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool bHaveInvited;
    var(*) /*0x35EA0000-0x00000000*/ private bool bHasInvitedYou[131073];

    structdefaultproperties
    {
        UniqueId=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        SessionId=none
        RoomId=none
        NickName=""
        PresenceInfo=""
        FriendState=EOnlineFriendState.OFS_Offline
        bIsOnline=false
        bIsPlaying=false
        bIsPlayingThisGame=false
        bIsJoinable=false
        bHasVoiceSupport=false
        bHaveInvited=false
        bHasInvitedYou=false
    }
};

struct native OnlineContent
{
    var(*) /*0x35EA0000-0x00000000*/ private byte ContentType;
    var(*) /*0x35EA0000-0x00000000*/ private byte UserIndex;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsCorrupt;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsNonPackageContent;
    var(*) /*0x35EA0000-0x00000000*/ private int DeviceID;
    var(*) /*0x35EA0000-0x00000000*/ private int LicenseMask;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string FriendlyName;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Filename;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ContentPath;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string InternalName;
    var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} SHAHashMap[805437441];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ContentPackages;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ContentFiles;

    structdefaultproperties
    {
        ContentType=EOnlineContentType.OCT_Downloaded
        UserIndex=0
        bIsCorrupt=false
        bIsNonPackageContent=false
        DeviceID=0
        LicenseMask=0
        FriendlyName=""
        Filename=""
        ContentPath=""
        InternalName=""
        ContentPackages=none
        ContentFiles=none
    }
};

struct native OnlineCrossTitleContent extends OnlineContent
{
    var(*) /*0x35EA0000-0x00000000*/ private int TitleId;
};

struct native OnlineRegistrant
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL PlayerNetId[131073];

    structdefaultproperties
    {
        PlayerNetId=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
    }
};

struct native OnlineArbitrationRegistrant extends OnlineRegistrant
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL MachineId[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int Trustworthiness[131073];
};

struct SpeechRecognizedWord
{
    var(*) /*0x35EA0000-0x00000000*/ private int WordId;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string WordText;
    var(*) /*0x35EA0000-0x00000000*/ private float Confidence;

    structdefaultproperties
    {
        WordId=0
        WordText=""
        Confidence=0.0000000
    }
};

struct native OnlinePlayerScore
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL PlayerID;
    var(*) /*0x35EA0000-0x00000000*/ private int TeamID;
    var(*) /*0x35EA0000-0x00000000*/ private int Score;

    structdefaultproperties
    {
        PlayerID=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        TeamID=0
        Score=0
    }
};

struct native LocalTalker
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bHasVoice;
    var(*) /*0x35EA0000-0x00000000*/ private bool bHasNetworkedVoice;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsRecognizingSpeech;
    var(*) /*0x35EA0000-0x00000000*/ private bool bWasTalking;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsTalking;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsRegistered;

    structdefaultproperties
    {
        bHasVoice=false
        bHasNetworkedVoice=false
        bIsRecognizingSpeech=false
        bWasTalking=false
        bIsTalking=false
        bIsRegistered=false
    }
};

struct native RemoteTalker
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL TalkerId;
    var(*) /*0x35EA0000-0x00000000*/ private float LastNotificationTime;
    var(*) /*0x35EA0000-0x00000000*/ private bool bWasTalking;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsTalking;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsRegistered;

    structdefaultproperties
    {
        TalkerId=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        LastNotificationTime=0.0000000
        bWasTalking=false
        bIsTalking=false
        bIsRegistered=false
    }
};

struct native OnlineFriendMessage
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SendingPlayerId;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string SendingPlayerNick;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsFriendInvite;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsGameInvite;
    var(*) /*0x35EA0000-0x00000000*/ private bool bWasAccepted;
    var(*) /*0x35EA0000-0x00000000*/ private bool bWasDenied;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Message;

    structdefaultproperties
    {
        SendingPlayerId=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        SendingPlayerNick=""
        bIsFriendInvite=false
        bIsGameInvite=false
        bWasAccepted=false
        bWasDenied=false
        Message=""
    }
};

struct native NamedInterface
{
    var(*) /*0x35EA0000-0x00000000*/ private name InterfaceName;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL InterfaceObject;

    structdefaultproperties
    {
        InterfaceName="None"
        InterfaceObject=none
    }
};

struct native NamedInterfaceDef
{
    var(*) /*0x35EA0000-0x00000000*/ private name InterfaceName;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string InterfaceClassName;

    structdefaultproperties
    {
        InterfaceName="None"
        InterfaceClassName=""
    }
};

struct native EmsFile
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Hash;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string DLName;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Filename;
    var(*) /*0x35EA0000-0x00000000*/ private int FileSize;

    structdefaultproperties
    {
        Hash=""
        DLName=""
        Filename=""
        FileSize=0
    }
};

struct native TitleFile
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Filename;
    var(*) /*0x35EA0000-0x00000000*/ private byte AsyncState;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Data;

    structdefaultproperties
    {
        Filename=""
        AsyncState=EOnlineEnumerationReadState.OERS_NotStarted
        Data=none
    }
};

struct native CommunityContentFile
{
    var(*) /*0x35EA0000-0x00000000*/ private int ContentId;
    var(*) /*0x35EA0000-0x00000000*/ private int FileId;
    var(*) /*0x35EA0000-0x00000000*/ private int ContentType;
    var(*) /*0x35EA0000-0x00000000*/ private int FileSize;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Owner;
    var(*) /*0x35EA0000-0x00000000*/ private int DownloadCount;
    var(*) /*0x35EA0000-0x00000000*/ private float AverageRating;
    var(*) /*0x35EA0000-0x00000000*/ private int RatingCount;
    var(*) /*0x35EA0000-0x00000000*/ private int LastRatingGiven;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string LocalFilePath;

    structdefaultproperties
    {
        ContentId=0
        FileId=0
        ContentType=0
        FileSize=0
        Owner=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        DownloadCount=0
        AverageRating=0.0000000
        RatingCount=0
        LastRatingGiven=0
        LocalFilePath=""
    }
};

struct native CommunityContentMetadata
{
    var(*) /*0x35EA0000-0x00000000*/ private int ContentType;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array MetadataItems;

    structdefaultproperties
    {
        ContentType=0
        MetadataItems=none
    }
};

struct native NamedSession
{
    var(*) /*0x35EA0000-0x00000000*/ private name SessionName;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SessionInfo[805437441];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL GameSettings;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Registrants;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ArbitrationRegistrants;

    structdefaultproperties
    {
        SessionName="None"
        GameSettings=none
        Registrants=none
        ArbitrationRegistrants=none
    }
};

struct native AchievementDetails
{
    var(*) /*0x35EA0000-0x00000000*/ private int Id[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string AchievementName[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Description[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string HowTo[131073];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Image;
    var(*) /*0x35EA0000-0x00000000*/ private byte MonthEarned[131073];
    var(*) /*0x35EA0000-0x00000000*/ private byte DayEarned[131073];
    var(*) /*0x35EA0000-0x00000000*/ private byte YearEarned[131073];
    var(*) /*0x35EA0000-0x00000000*/ private byte DayOfWeekEarned[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int GamerPoints[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsSecret[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool bWasAchievedOnline[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool bWasAchievedOffline[131073];

    structdefaultproperties
    {
        Id=0
        AchievementName=""
        Description=""
        HowTo=""
        Image=none
        MonthEarned=0
        DayEarned=0
        YearEarned=0
        DayOfWeekEarned=0
        GamerPoints=0
        bIsSecret=false
        bWasAchievedOnline=false
        bWasAchievedOffline=false
    }
};

struct native OnlinePartyMember
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL UniqueId[131073];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string NickName[131073];
    var(*) /*0x35EA0000-0x00000000*/ private byte LocalUserNum[131073];
    var(*) /*0x35EA0000-0x00000000*/ private byte NatType[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int TitleId[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsLocal[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsInPartyVoice[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsTalking[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsInGameSession[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsPlayingThisGame[131073];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SessionId[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int Data1[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int Data2[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int Data3[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int Data4[131073];

    structdefaultproperties
    {
        UniqueId=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        NickName=""
        LocalUserNum=0
        NatType=ENATType.NAT_Unknown
        TitleId=0
        bIsLocal=false
        bIsInPartyVoice=false
        bIsTalking=false
        bIsInGameSession=false
        bIsPlayingThisGame=false
        SessionId=none
        Data1=0
        Data2=0
        Data3=0
        Data4=0
    }
};

struct native SocialPostPrivileges
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bCanPostImage[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool bCanPostLink[131073];

    structdefaultproperties
    {
        bCanPostImage=false
        bCanPostLink=false
    }
};

struct native SocialPostImageFlags
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsUserGeneratedImage;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsGameGeneratedImage;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsAchievementImage;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsMediaImage;

    structdefaultproperties
    {
        bIsUserGeneratedImage=false
        bIsGameGeneratedImage=false
        bIsAchievementImage=false
        bIsMediaImage=false
    }
};

struct native SocialPostImageInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Flags;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string MessageText;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string TitleText;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string PictureCaption;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string PictureDescription;

    structdefaultproperties
    {
        Flags=(bIsUserGeneratedImage=false,bIsGameGeneratedImage=false,bIsAchievementImage=false,bIsMediaImage=false)
        MessageText=""
        TitleText=""
        PictureCaption=""
        PictureDescription=""
    }
};

struct native SocialPostLinkInfo extends SocialPostImageInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string TitleURL;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string PictureURL;
};

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_FTickableObject[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL AccountInterface;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PlayerInterface;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PlayerInterfaceEx;
var(*) /*0x35EA0000-0x00000000*/ private @NULL SystemInterface;
var(*) /*0x35EA0000-0x00000000*/ private @NULL GameInterface;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ContentInterface;
var(*) /*0x35EA0000-0x00000000*/ private @NULL VoiceInterface;
var(*) /*0x35EA0000-0x00000000*/ private @NULL StatsInterface;
var(*) /*0x35EA0000-0x00000000*/ private @NULL NewsInterface;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PartyChatInterface;
var(*) /*0x35EA0000-0x00000000*/ private @NULL TitleFileInterface;
var(*) /*0x35EA0000-0x00000000*/ private @NULL TitleFileCacheInterface;
var(*) /*0x35EA0000-0x00000000*/ private @NULL UserCloudInterface;
var(*) /*0x35EA0000-0x00000000*/ private @NULL SharedCloudInterface;
var(*) /*0x35EA0000-0x00000000*/ private @NULL SocialInterface;
var(*) /*0x35EA0000-0x00000000*/ private @NULL AuthInterface;
var(*) /*0x35EA0000-0x00000000*/ private @NULL NP;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array NamedInterfaces;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array NamedInterfaceDefs[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Sessions[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bUseBuildIdOverride[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int BuildIdOverride[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string IniLocPatcherClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Patcher[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float AsyncMinCompletionTime[1073741825];

// Export UOnlineSubsystem::execInit(FFrame&, void* const)
native event Init()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

event PostInit()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private class IniLocPatcherClass;

    // End:0x8B
    if(IniLocPatcherClassName != "")
    {
        IniLocPatcherClass = class<IniLocPatcher>(DynamicLoadObject(IniLocPatcherClassName, Class'Core.Class'));
        Patcher = new IniLocPatcherClass;
        // End:0x89
        if(Patcher != none)
        {
            Patcher.Init();            
        }
        else
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

event Exit()
{
    //return;    
}

event SetAccountInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    AccountInterface = OnlineAccountInterface(NewInterface);
    return NotEqual_InterfaceInterface(AccountInterface, OnlineAccountInterface(none));
    //return ReturnValue;    
}

event SetPlayerInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    PlayerInterface = OnlinePlayerInterface(NewInterface);
    return NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none));
    //return ReturnValue;    
}

event SetPlayerInterfaceEx()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    PlayerInterfaceEx = OnlinePlayerInterfaceEx(NewInterface);
    return NotEqual_InterfaceInterface(PlayerInterfaceEx, OnlinePlayerInterfaceEx(none));
    //return ReturnValue;    
}

event SetSystemInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    SystemInterface = OnlineSystemInterface(NewInterface);
    return NotEqual_InterfaceInterface(SystemInterface, OnlineSystemInterface(none));
    //return ReturnValue;    
}

event SetGameInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    GameInterface = OnlineGameInterface(NewInterface);
    return NotEqual_InterfaceInterface(GameInterface, OnlineGameInterface(none));
    //return ReturnValue;    
}

event SetContentInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    ContentInterface = OnlineContentInterface(NewInterface);
    return NotEqual_InterfaceInterface(ContentInterface, OnlineContentInterface(none));
    //return ReturnValue;    
}

event SetVoiceInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    VoiceInterface = OnlineVoiceInterface(NewInterface);
    return NotEqual_InterfaceInterface(VoiceInterface, OnlineVoiceInterface(none));
    //return ReturnValue;    
}

event SetStatsInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    StatsInterface = OnlineStatsInterface(NewInterface);
    return NotEqual_InterfaceInterface(StatsInterface, OnlineStatsInterface(none));
    //return ReturnValue;    
}

event SetNewsInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    NewsInterface = OnlineNewsInterface(NewInterface);
    return NotEqual_InterfaceInterface(NewsInterface, OnlineNewsInterface(none));
    //return ReturnValue;    
}

event SetPartyChatInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    PartyChatInterface = OnlinePartyChatInterface(NewInterface);
    return NotEqual_InterfaceInterface(PartyChatInterface, OnlinePartyChatInterface(none));
    //return ReturnValue;    
}

event SetTitleFileInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    TitleFileInterface = OnlineTitleFileInterface(NewInterface);
    return NotEqual_InterfaceInterface(TitleFileInterface, OnlineTitleFileInterface(none));
    //return ReturnValue;    
}

event SetTitleFileCacheInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    TitleFileCacheInterface = OnlineTitleFileCacheInterface(NewInterface);
    return NotEqual_InterfaceInterface(TitleFileCacheInterface, OnlineTitleFileCacheInterface(none));
    //return ReturnValue;    
}

event SetSocialInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InSocialInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    SocialInterface = OnlineSocialInterface(InSocialInterface);
    return NotEqual_InterfaceInterface(SocialInterface, OnlineSocialInterface(none));
    //return ReturnValue;    
}

event SetNPInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    NP = SPOnlineNPInterface(NewInterface);
    return NotEqual_InterfaceInterface(SPOnlineNPInterface(none), NP);
    //return ReturnValue;    
}

event SetAuthInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InAuthInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    AuthInterface = OnlineAuthInterface(InAuthInterface);
    return NotEqual_InterfaceInterface(AuthInterface, OnlineAuthInterface(none));
    //return ReturnValue;    
}

event SetUserCloudInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InCloudInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    UserCloudInterface = UserCloudFileInterface(InCloudInterface);
    return NotEqual_InterfaceInterface(UserCloudInterface, UserCloudFileInterface(none));
    //return ReturnValue;    
}

event SetSharedCloudInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InCloudInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    SharedCloudInterface = SharedCloudFileInterface(InCloudInterface);
    return NotEqual_InterfaceInterface(SharedCloudInterface, SharedCloudFileInterface(none));
    //return ReturnValue;    
}

event SetNamedInterface()
{
    local /*0x35EA0000-0x00000000*/ private name InterfaceName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL NewInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private int InterfaceIndex;

    InterfaceIndex = NamedInterfaces.Find('InterfaceName', InterfaceName);    
    // End:0x98
    if(InterfaceIndex == -1)
    {
        InterfaceIndex = NamedInterfaces.Length;
        NamedInterfaces.Length = NamedInterfaces.Length + 1;
        NamedInterfaces[InterfaceIndex].InterfaceName = InterfaceName;
    }
    NamedInterfaces[InterfaceIndex].InterfaceObject = NewInterface;
    //return;    
}

event GetNamedInterface()
{
    local /*0x35EA0000-0x00000000*/ private name InterfaceName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int InterfaceIndex;

    InterfaceIndex = NamedInterfaces.Find('InterfaceName', InterfaceName);    
    // End:0x63
    if(InterfaceIndex != -1)
    {
        return NamedInterfaces[InterfaceIndex].InterfaceObject;
    }
    return none;
    //return ReturnValue;    
}

// Export UOnlineSubsystem::execUniqueNetIdToString(FFrame&, void* const)
native static final function UniqueNetIdToString()
{
    local /*0x35EA0000-0x00000000*/ private @NULL IdToConvert[25296897];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UOnlineSubsystem::execStringToUniqueNetId(FFrame&, void* const)
native static final function StringToUniqueNetId()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UniqueNetIdString[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL out_UniqueId[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

event GetPlayerUniqueNetIdFromIndex()
{
    local /*0x35EA0000-0x00000000*/ private int UserIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], ReturnVal, NullId;

    // End:0x6E
    if(EqualEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)) || !PlayerInterface.GetUniquePlayerId(byte(UserIndex), ReturnVal))
    {
        ReturnVal = NullId;
    }
    return ReturnVal;
    //return ReturnValue;    
}

// Export UOnlineSubsystem::execGetBuildUniqueId(FFrame&, void* const)
native function GetBuildUniqueId()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UOnlineSubsystem::execGetNumSupportedLogins(FFrame&, void* const)
native static final function GetNumSupportedLogins()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

function IsInSession()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerNetId[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int IdxSession, IdxPlayer;
    local /*0x35EA0000-0x00000000*/ private @NULL IdThatCanBePassedAsOutParm;

    IdxSession = 0;
    J0x0B:

    // End:0x123 [Loop If]
    if(IdxSession < Sessions.Length)
    {
        // End:0x115
        if(Sessions[IdxSession].SessionName == SessionName)
        {
            IdxPlayer = 0;
            J0x62:

            // End:0x113 [Loop If]
            if(IdxPlayer < Sessions[IdxSession].Registrants.Length)
            {
                IdThatCanBePassedAsOutParm = Sessions[IdxSession].Registrants[IdxPlayer].PlayerNetId;
                // End:0x105
                if(AreUniqueNetIdsEqual(IdThatCanBePassedAsOutParm, PlayerNetId))
                {
                    return true;
                }
                ++IdxPlayer;
                // [Loop Continue]
                goto J0x62;
            }
            return false;
        }
        ++IdxSession;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

// Export UOnlineSubsystem::execRegisterRecentlyMetPlayers(FFrame&, void* const)
native function RegisterRecentlyMetPlayers();

static function DumpGameSettings()
{
    local /*0x35EA0000-0x00000000*/ private @NULL GameSettings[8519681];

    //return;    
}

function DumpSessionState()
{
    local /*0x35EA0000-0x00000000*/ private int Index, PlayerIndex;
    local /*0x35EA0000-0x00000000*/ private @NULL NetId, ZeroId;

    NetId = ZeroId;
    ZeroId = NetId;
    Index = 0;
    J0x31:

    // End:0x1BD [Loop If]
    if(Index < Sessions.Length)
    {
        DumpGameSettings(Sessions[Index].GameSettings);
        PlayerIndex = 0;
        J0x84:

        // End:0x114 [Loop If]
        if(PlayerIndex < Sessions[Index].Registrants.Length)
        {
            NetId = Sessions[Index].Registrants[PlayerIndex].PlayerNetId;
            PlayerIndex++;
            // [Loop Continue]
            goto J0x84;
        }
        PlayerIndex = 0;
        J0x11F:

        // End:0x1AF [Loop If]
        if(PlayerIndex < Sessions[Index].ArbitrationRegistrants.Length)
        {
            NetId = Sessions[Index].ArbitrationRegistrants[PlayerIndex].PlayerNetId;
            PlayerIndex++;
            // [Loop Continue]
            goto J0x11F;
        }
        Index++;
        // [Loop Continue]
        goto J0x31;
    }
    //return;    
}

function DumpVoiceRegistration()
{
    //return;    
}

function SetDebugSpewLevel()
{
    local /*0x35EA0000-0x00000000*/ private int DebugSpewLevel[8388609];

    //return;    
}

function ClearCachedProfiles()
{
    //return;    
}

function SetActiveController()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];

    //return;    
}

defaultproperties
{
    NamedInterfaceDefs=/* Array type was not detected. */
    bUseBuildIdOverride=true
    BuildIdOverride=13069
    IniLocPatcherClassName="SPEngine.SPIniLocPatcher"
}