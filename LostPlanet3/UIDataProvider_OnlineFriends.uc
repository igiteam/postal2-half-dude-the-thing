class UIDataProvider_OnlineFriends extends UIDataProvider_OnlinePlayerDataBase
    transient
    config(Engine)
    hidecategories(Object,UIRoot);

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FriendsList;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string NickNameCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string PresenceInfoCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string FriendStateCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string bIsOnlineCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string bIsPlayingCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string bIsPlayingThisGameCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string bIsJoinableCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string bHasVoiceSupportCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string bHaveInvitedCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string bHasInvitedYouCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string OfflineText;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string OnlineText;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string AwayText;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string BusyText;

event OnRegister()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InPlayer[8388609], OnlineSub, PlayerInterface;

    super.OnRegister(InPlayer);
    // End:0x1A8
    if(PlayerControllerId != -1)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        // End:0x1A8
        if(OnlineSub != none)
        {
            PlayerInterface = OnlineSub.PlayerInterface;
            // End:0x1A8
            if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
            {
                PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
                PlayerInterface.AddReadFriendsCompleteDelegate(byte(PlayerControllerId), OnFriendsReadComplete);
                // End:0x1A8
                if((int(PlayerInterface.GetLoginStatus(byte(PlayerControllerId))) > int(0)) && !PlayerInterface.IsGuestLogin(byte(PlayerControllerId)))
                {
                    PlayerInterface.ReadFriendsList(byte(PlayerControllerId));
                }
            }
        }
    }
    //return;    
}

event OnUnregister()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, PlayerInterface;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xED
    if(OnlineSub != none)
    {
        PlayerInterface = OnlineSub.PlayerInterface;
        // End:0xED
        if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
        {
            PlayerInterface.ClearReadFriendsCompleteDelegate(byte(PlayerControllerId), OnFriendsReadComplete);
            PlayerInterface.ClearLoginChangeDelegate(OnLoginChange);
        }
    }
    super.OnUnregister();
    //return;    
}

function OnFriendsReadComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, PlayerInterface;

    // End:0xC9
    if(bWasSuccessful == true)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        // End:0xC6
        if(OnlineSub != none)
        {
            PlayerInterface = OnlineSub.PlayerInterface;
            // End:0xC6
            if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
            {
                PlayerInterface.GetFriendsList(byte(PlayerControllerId), FriendsList);
            }
        }        
    }
    //return;    
}

function OnLoginChange()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, PlayerInterface;

    FriendsList.Length = 0;
    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0x123
    if(OnlineSub != none)
    {
        PlayerInterface = OnlineSub.PlayerInterface;
        // End:0x123
        if((NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)) && int(PlayerInterface.GetLoginStatus(byte(PlayerControllerId))) > int(0)) && !PlayerInterface.IsGuestLogin(byte(PlayerControllerId)))
        {
            PlayerInterface.ReadFriendsList(byte(PlayerControllerId));
        }
    }
    //return;    
}

event RefreshFriendsList()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, PlayerInterface;

    // End:0x12A
    if(PlayerControllerId != -1)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        // End:0x12A
        if(OnlineSub != none)
        {
            PlayerInterface = OnlineSub.PlayerInterface;
            // End:0x12A
            if((NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)) && int(PlayerInterface.GetLoginStatus(byte(PlayerControllerId))) > int(0)) && !PlayerInterface.IsGuestLogin(byte(PlayerControllerId)))
            {
                PlayerInterface.ReadFriendsList(byte(PlayerControllerId));
            }
        }
    }
    //return;    
}

defaultproperties
{
    NickNameCol="Name"
    PresenceInfoCol="Online Status"
    bIsOnlineCol="Is Online"
    bIsPlayingCol="Is Playing"
    bIsPlayingThisGameCol="Is Playing This Game"
    bIsJoinableCol="Is Joinable"
    bHasVoiceSupportCol="Has Voice Support"
    OfflineText="Offline"
    OnlineText="Online"
    AwayText="Away"
    BusyText="Busy"
}