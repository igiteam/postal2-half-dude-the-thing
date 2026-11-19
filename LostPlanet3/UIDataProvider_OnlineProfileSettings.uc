class UIDataProvider_OnlineProfileSettings extends UIDataProvider_OnlinePlayerStorage
    transient
    config(Game)
    hidecategories(Object,UIRoot);

function ReadData()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int DeviceID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerStorage[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return PlayerInterface.ReadProfileSettings(LocalUserNum, OnlineProfileSettings(PlayerStorage));
    //return ReturnValue;    
}

function WriteData()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int DeviceID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerStorage[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return PlayerInterface.WriteProfileSettings(LocalUserNum, OnlineProfileSettings(PlayerStorage));
    //return ReturnValue;    
}

function GetData()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL CachedProfile;

    CachedProfile = PlayerInterface.GetProfileSettings(LocalUserNum);
    // End:0x91
    if(CachedProfile != none)
    {
        Profile = CachedProfile;
        return PlayerInterface.ReadProfileSettings(LocalUserNum, OnlineProfileSettings(Profile));
    }
    return false;
    //return ReturnValue;    
}

function AddReadCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];

    PlayerInterface.AddReadProfileSettingsCompleteDelegate(LocalUserNum, OnReadStorageComplete);
    //return;    
}

function ClearReadCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];

    PlayerInterface.ClearReadProfileSettingsCompleteDelegate(LocalUserNum, OnReadStorageComplete);
    //return;    
}

function RefreshStorageData()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, PlayerInterface;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xCA
    if(OnlineSub != none)
    {
        PlayerInterface = OnlineSub.PlayerInterface;
        // End:0xCA
        if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
        {
            // End:0xCA
            if(!ReadData(PlayerInterface, byte(PlayerControllerId), Profile.DeviceID, Profile))
            {
            }
        }
    }
    //return;    
}

function OnStorageDeviceChange()
{
    //return;    
}

defaultproperties
{
    ProviderName="ProfileData"
}