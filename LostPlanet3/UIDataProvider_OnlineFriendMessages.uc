class UIDataProvider_OnlineFriendMessages extends UIDataProvider_OnlinePlayerDataBase
    transient
    config(Engine)
    hidecategories(Object,UIRoot);

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Messages;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string SendingPlayerNameCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string bIsFriendInviteCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string bWasAcceptedCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string bWasDeniedCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string MessageCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string LastInviteFrom;

event OnRegister()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InPlayer[8388609], OnlineSub, PlayerInterface;

    super.OnRegister(InPlayer);
    // End:0x195
    if(PlayerControllerId != -1)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        // End:0x195
        if(OnlineSub != none)
        {
            PlayerInterface = OnlineSub.PlayerInterface;
            // End:0x195
            if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
            {
                PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
                PlayerInterface.AddFriendMessageReceivedDelegate(byte(PlayerControllerId), OnFriendMessageReceived);
                PlayerInterface.AddFriendInviteReceivedDelegate(byte(PlayerControllerId), OnFriendInviteReceived);
                PlayerInterface.AddReceivedGameInviteDelegate(byte(PlayerControllerId), OnGameInviteReceived);
                ReadMessages();
            }
        }
    }
    //return;    
}

event OnUnregister()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, PlayerInterface;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0x165
    if(OnlineSub != none)
    {
        PlayerInterface = OnlineSub.PlayerInterface;
        // End:0x165
        if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
        {
            PlayerInterface.ClearLoginChangeDelegate(OnLoginChange);
            PlayerInterface.ClearFriendMessageReceivedDelegate(byte(PlayerControllerId), OnFriendMessageReceived);
            PlayerInterface.ClearFriendInviteReceivedDelegate(byte(PlayerControllerId), OnFriendInviteReceived);
            PlayerInterface.ClearReceivedGameInviteDelegate(byte(PlayerControllerId), OnGameInviteReceived);
        }
    }
    super.OnUnregister();
    //return;    
}

function ReadMessages()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, PlayerInterface;

    Messages.Length = 0;
    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xF8
    if(OnlineSub != none)
    {
        PlayerInterface = OnlineSub.PlayerInterface;
        // End:0xF8
        if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)) && int(PlayerInterface.GetLoginStatus(byte(PlayerControllerId))) > int(0))
        {
            PlayerInterface.GetFriendMessages(byte(PlayerControllerId), Messages);
        }
    }
    //return;    
}

function OnFriendInviteReceived()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL RequestingPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string RequestingNick[8388609], Message;

    ReadMessages();
    //return;    
}

function OnFriendMessageReceived()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL SendingPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string SendingNick[8388609], Message;

    ReadMessages();
    //return;    
}

function OnLoginChange()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];

    // End:0x23
    if(int(LocalUserNum) == PlayerControllerId)
    {
        ReadMessages();
    }
    //return;    
}

function OnGameInviteReceived()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InviterName[8388609];

    LastInviteFrom = InviterName;
    ReadMessages();
    //return;    
}

defaultproperties
{
    SendingPlayerNameCol="Sender's Name"
    bIsFriendInviteCol="Friend Invitation"
    bWasAcceptedCol="Friend Was Accepted"
    bWasDeniedCol="Friend Was Denied"
    MessageCol="Message"
}