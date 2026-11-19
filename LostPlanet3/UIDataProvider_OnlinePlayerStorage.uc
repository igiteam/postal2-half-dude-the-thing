class UIDataProvider_OnlinePlayerStorage extends UIDataProvider_OnlinePlayerDataBase
    transient
    config(Game)
    hidecategories(Object,UIRoot);

struct native PlayerStorageArrayProvider
{
    var(*) /*0x35EA0000-0x00000000*/ private int PlayerStorageId;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Provider;

    structdefaultproperties
    {
        PlayerStorageId=0
        Provider=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL Profile;
var(*) /*0x35EA0000-0x00000000*/ private name ProviderName[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bWasErrorLastRead;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsExternalUIOpen;
var(*) /*0x35EA0000-0x00000000*/ private bool bNeedsDeferredRefresh;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PlayerStorageArrayProviders;
var(*) /*0x35EA0000-0x00000000*/ private int DeviceStorageSizeNeeded[1073741825];

function ReadData()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int DeviceID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerStorage[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return PlayerInterface.ReadPlayerStorage(LocalUserNum, PlayerStorage, DeviceID);
    //return ReturnValue;    
}

function WriteData()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int DeviceID[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerStorage[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return PlayerInterface.WritePlayerStorage(LocalUserNum, PlayerStorage, DeviceID);
    //return ReturnValue;    
}

function GetData()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL CachedStorage;

    CachedStorage = PlayerInterface.GetPlayerStorage(LocalUserNum);
    // End:0x8A
    if(CachedStorage != none)
    {
        Profile = CachedStorage;
        PlayerInterface.ReadPlayerStorage(LocalUserNum, Profile);
        return true;
    }
    return false;
    //return ReturnValue;    
}

function AddReadCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];

    PlayerInterface.AddReadPlayerStorageCompleteDelegate(LocalUserNum, OnReadStorageComplete);
    //return;    
}

function ClearReadCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerInterface[8388609];
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];

    PlayerInterface.ClearReadPlayerStorageCompleteDelegate(LocalUserNum, OnReadStorageComplete);
    //return;    
}

event OnRegister()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InPlayer[8388609], OnlineSub, PlayerInterface;

    super.OnRegister(InPlayer);
    // End:0x1DE
    if(PlayerControllerId != -1)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        // End:0x11D
        if(OnlineSub != none)
        {
            PlayerInterface = OnlineSub.PlayerInterface;
            // End:0x11D
            if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
            {
                PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
                AddReadCompleteDelegate(PlayerInterface, byte(PlayerControllerId));
                GetData(PlayerInterface, byte(PlayerControllerId));
                RefreshStorageData();
            }
        }
        // End:0x1DE
        if(NotEqual_InterfaceInterface(OnlineSub.SystemInterface, OnlineSystemInterface(none)))
        {
            OnlineSub.SystemInterface.AddStorageDeviceChangeDelegate(OnStorageDeviceChange);
            OnlineSub.SystemInterface.AddExternalUIChangeDelegate(OnExternalUIChange);
        }
    }
    //return;    
}

event OnUnregister()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, PlayerInterface;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0x190
    if(OnlineSub != none)
    {
        PlayerInterface = OnlineSub.PlayerInterface;
        // End:0xCF
        if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
        {
            PlayerInterface.ClearLoginChangeDelegate(OnLoginChange);
            ClearReadCompleteDelegate(PlayerInterface, byte(PlayerControllerId));
        }
        // End:0x190
        if(NotEqual_InterfaceInterface(OnlineSub.SystemInterface, OnlineSystemInterface(none)))
        {
            OnlineSub.SystemInterface.ClearStorageDeviceChangeDelegate(OnStorageDeviceChange);
            OnlineSub.SystemInterface.ClearExternalUIChangeDelegate(OnExternalUIChange);
        }
    }
    super.OnUnregister();
    //return;    
}

function OnReadStorageComplete()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, PlayerInterface;

    // End:0x108
    if(bWasSuccessful == true)
    {
        // End:0x22
        if(!bWasErrorLastRead)
        {            
        }
        else
        {
            OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
            // End:0x105
            if(OnlineSub != none)
            {
                PlayerInterface = OnlineSub.PlayerInterface;
                // End:0x105
                if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
                {
                    bWasErrorLastRead = false;
                    // End:0x105
                    if((ReadData(PlayerInterface, byte(PlayerControllerId), Profile.DeviceID, Profile)) == false)
                    {
                        bWasErrorLastRead = true;
                    }
                }
            }
        }        
    }
    else
    {
        bWasErrorLastRead = true;
    }
    //return;    
}

function OnLoginChange()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, PlayerInterface;
    local /*0x35EA0000-0x00000000*/ private byte LoginStatus;
    local /*0x35EA0000-0x00000000*/ private @NULL NetId;

    // End:0x17C
    if(int(LocalUserNum) == PlayerControllerId)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        // End:0x172
        if(OnlineSub != none)
        {
            PlayerInterface = OnlineSub.PlayerInterface;
            // End:0x172
            if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
            {
                LoginStatus = PlayerInterface.GetLoginStatus(byte(PlayerControllerId));
                PlayerInterface.GetUniquePlayerId(byte(PlayerControllerId), NetId);
                // End:0x172
                if(int(LoginStatus) == int(0))
                {
                    // End:0x172
                    if(Class'WorldInfo'.static.GetWorldInfo().IsConsoleBuild() == true)
                    {
                        Profile.SetToDefaults();
                    }
                }
            }
        }
        RefreshStorageData();
    }
    //return;    
}

function RefreshStorageData()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;
    local /*0x35EA0000-0x00000000*/ private bool bFoundCachedData;

    // End:0x181
    if(!bIsExternalUIOpen)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        // End:0x17E
        if(((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none))) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterfaceEx, OnlinePlayerInterfaceEx(none)))
        {
            bFoundCachedData = GetData(OnlineSub.PlayerInterface, byte(PlayerControllerId));
            // End:0x17E
            if(!bFoundCachedData || bFoundCachedData && !OnlineSub.PlayerInterfaceEx.IsDeviceValid(Profile.DeviceID, DeviceStorageSizeNeeded))
            {
                ShowDeviceSelection();
            }
        }        
    }
    else
    {
        bNeedsDeferredRefresh = true;
    }
    //return;    
}

function ShowDeviceSelection()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0x142
    if(((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none))) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterfaceEx, OnlinePlayerInterfaceEx(none)))
    {
        OnlineSub.PlayerInterfaceEx.AddDeviceSelectionDoneDelegate(byte(PlayerControllerId), OnDeviceSelectionComplete);
        OnlineSub.PlayerInterfaceEx.ShowDeviceSelectionUI(byte(PlayerControllerId), DeviceStorageSizeNeeded);
    }
    //return;    
}

function OnDeviceSelectionComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Ignored;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterfaceEx.ClearDeviceSelectionDoneDelegate(byte(PlayerControllerId), OnDeviceSelectionComplete);
    // End:0x152
    if(bWasSuccessful)
    {
        Profile.DeviceID = OnlineSub.PlayerInterfaceEx.GetDeviceSelectionResults(byte(PlayerControllerId), Ignored);
        // End:0x14F
        if((ReadData(OnlineSub.PlayerInterface, byte(PlayerControllerId), Profile.DeviceID, Profile)) == false)
        {
        }        
    }
    else
    {
        Profile.DeviceID = -1;
    }
    //return;    
}

function OnStorageDeviceChange()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xFE
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.SystemInterface, OnlineSystemInterface(none)))
    {
        // End:0xFE
        if(!OnlineSub.PlayerInterfaceEx.IsDeviceValid(Profile.DeviceID, DeviceStorageSizeNeeded))
        {
            Profile.DeviceID = -1;
            RefreshStorageData();
        }
    }
    //return;    
}

function OnExternalUIChange()
{
    local /*0x35EA0000-0x00000000*/ private bool bIsOpening[8388609];

    bIsExternalUIOpen = bIsOpening;
    // End:0x3D
    if(!bIsOpening && bNeedsDeferredRefresh)
    {
        RefreshStorageData();
    }
    //return;    
}

defaultproperties
{
    ProviderName="PlayerStorageData"
}