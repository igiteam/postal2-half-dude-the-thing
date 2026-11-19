class UIDataProvider_OnlinePartyChatList extends UIDataProvider_OnlinePlayerDataBase
    transient
    config(Engine)
    hidecategories(Object,UIRoot);

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PartyMembersList;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array NatTypes;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string NickNameCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string NatTypeCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string IsLocalCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string IsInPartyVoiceCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string IsTalkingCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string IsInGameSessionCol;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string IsPlayingThisGameCol;

event OnRegister()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InPlayer[8388609], OnlineSub, PlayerInterface;

    super.OnRegister(InPlayer);
    // End:0xD7
    if(PlayerControllerId != -1)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        // End:0xD7
        if(OnlineSub != none)
        {
            PlayerInterface = OnlineSub.PlayerInterface;
            // End:0xD7
            if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
            {
                PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
            }
        }
    }
    //return;    
}

event OnUnregister()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, PlayerInterface;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xB1
    if(OnlineSub != none)
    {
        PlayerInterface = OnlineSub.PlayerInterface;
        // End:0xB1
        if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
        {
            PlayerInterface.ClearLoginChangeDelegate(OnLoginChange);
        }
    }
    super.OnUnregister();
    //return;    
}

function OnLoginChange()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, PlayerInterface;

    PartyMembersList.Length = 0;
    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xC4
    if(OnlineSub != none)
    {
        PlayerInterface = OnlineSub.PlayerInterface;
        // End:0xC4
        if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)) && int(PlayerInterface.GetLoginStatus(byte(PlayerControllerId))) > int(0))
        {
        }
    }
    //return;    
}

event RefreshMembersList()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, PlayerInterface;

    // End:0x93
    if(PlayerControllerId != -1)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        // End:0x93
        if(OnlineSub != none)
        {
            PlayerInterface = OnlineSub.PlayerInterface;
            // End:0x93
            if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
            {
            }
        }
    }
    //return;    
}

defaultproperties
{
    NatTypes=/* Array type was not detected. */
}