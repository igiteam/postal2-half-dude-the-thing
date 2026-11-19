class UIDataStore_OnlinePlayerData extends UIDataStore_Remote
    transient
    config(Engine)
    hidecategories(Object,UIRoot);

var(*) /*0x35EA0000-0x00000000*/ private @NULL FriendsProvider;
var(*) /*0x35EA0000-0x00000000*/ private int PlayerControllerId;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string PlayerNick;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ProfileSettingsClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private class ProfileSettingsClass;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ProfileProvider;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ProfileProviderClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private class ProfileProviderClass;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string PlayerStorageClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private class PlayerStorageClass;
var(*) /*0x35EA0000-0x00000000*/ private @NULL StorageProvider;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string StorageProviderClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private class StorageProviderClass;
var(*) /*0x35EA0000-0x00000000*/ private @NULL FriendMessagesProvider;
var(*) /*0x35EA0000-0x00000000*/ private @NULL AchievementsProvider;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string FriendsProviderClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private class FriendsProviderClass;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string FriendMessagesProviderClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private class FriendMessagesProviderClass;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string AchievementsProviderClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private class AchievementsProviderClass;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string PartyChatProviderClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private class PartyChatProviderClass;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PartyChatProvider;

event OnRegister()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InPlayer[8388609], OnlineSub, PlayerInterface;

    // End:0x1F9
    if(InPlayer != none)
    {
        PlayerControllerId = InPlayer.ControllerId;
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        // End:0x171
        if(OnlineSub != none)
        {
            PlayerInterface = OnlineSub.PlayerInterface;
            // End:0xE8
            if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
            {
                PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
            }
            // End:0x16E
            if(NotEqual_InterfaceInterface(OnlineSub.PlayerInterfaceEx, OnlinePlayerInterfaceEx(none)))
            {
                OnlineSub.PlayerInterfaceEx.AddProfileDataChangedDelegate(byte(PlayerControllerId), OnPlayerDataChange);
            }            
        }
        else
        {
            // End:0x1DA
            if((ProfileProvider != none) && ProfileProvider.Profile != none)
            {
                ProfileProvider.Profile.SetToDefaults();
            }
        }
        RegisterDelegates();
        OnLoginChange(byte(PlayerControllerId));
    }
    //return;    
}

event OnUnregister()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, PlayerInterface;

    // End:0x154
    if(PlayerControllerId != -1)
    {
        ClearDelegates();
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        // End:0x154
        if(OnlineSub != none)
        {
            PlayerInterface = OnlineSub.PlayerInterface;
            // End:0xCE
            if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
            {
                PlayerInterface.ClearLoginChangeDelegate(OnLoginChange);
            }
            // End:0x154
            if(NotEqual_InterfaceInterface(OnlineSub.PlayerInterfaceEx, OnlinePlayerInterfaceEx(none)))
            {
                OnlineSub.PlayerInterfaceEx.ClearProfileDataChangedDelegate(byte(PlayerControllerId), OnPlayerDataChange);
            }
        }
    }
    //return;    
}

function OnLoginChange()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, PlayerInterface;

    // End:0x1C8
    if(int(LocalUserNum) == PlayerControllerId)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        // End:0x1BA
        if(OnlineSub != none)
        {
            PlayerInterface = OnlineSub.PlayerInterface;
            // End:0x109
            if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)) && int(PlayerInterface.GetLoginStatus(byte(PlayerControllerId))) > int(0))
            {
                PlayerNick = PlayerInterface.GetPlayerNickname(byte(PlayerControllerId));                
            }
            else
            {
                // End:0x1BA
                if(Class'WorldInfo'.static.GetWorldInfo().IsConsoleBuild() == true)
                {
                    PlayerNick = "";
                    ProfileProvider.Profile.SetToDefaults();
                    StorageProvider.Profile.SetToDefaults();
                }
            }
        }
        RefreshSubscribers();
    }
    //return;    
}

function OnPlayerDataChange()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xC5
    if(OnlineSub != none)
    {
        // End:0xC5
        if(NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
        {
            PlayerNick = OnlineSub.PlayerInterface.GetPlayerNickname(byte(PlayerControllerId));
            RefreshSubscribers();
        }
    }
    //return;    
}

function RegisterDelegates()
{
    //return;    
}

function ClearDelegates()
{
    //return;    
}

event GetCachedPlayerProfile()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], OnlineSub, PlayerInterface, Result;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xB5
    if(OnlineSub != none)
    {
        PlayerInterface = OnlineSub.PlayerInterface;
        // End:0xB5
        if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
        {
            Result = PlayerInterface.GetProfileSettings(byte(ControllerId));
        }
    }
    return Result;
    //return ReturnValue;    
}

event GetCachedPlayerStorage()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], OnlineSub, PlayerInterface, Result;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xB5
    if(OnlineSub != none)
    {
        PlayerInterface = OnlineSub.PlayerInterface;
        // End:0xB5
        if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
        {
            Result = PlayerInterface.GetPlayerStorage(byte(ControllerId));
        }
    }
    return Result;
    //return ReturnValue;    
}

defaultproperties
{
    PlayerControllerId=-1
    PlayerNick="PlayerNickNameHere"
    ProfileSettingsClassName="LostPlanetGame.LPProfileSettings"
    PlayerStorageClassName="LostPlanetGame.LPProfilePersistentData"
    StorageProviderClassName="LostPlanetGame.LPDataProvider_PlayerStorage"
    PartyChatProviderClassName="Engine.UIDataProvider_OnlinePartyChatList"
    Tag="OnlinePlayerData"
}