class LPDataProvider_PlayerStorage extends UIDataProvider_OnlinePlayerStorage
    transient
    config(Game)
    hidecategories(Object,UIRoot);

function OnReadStorageComplete()
{
    local /*0x97E50000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    super.OnReadStorageComplete(LocalUserNum, bWasSuccessful);
    // End:0x4B
    if(!bWasSuccessful)
    {
        Profile.SetToDefaults();
    }
    //return;    
}

function RefreshStorageData()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;
    local /*0x97E50000-0x00000000*/ private bool bFoundCachedData;

    // End:0x173
    if(!bIsExternalUIOpen)
    {
        OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
        // End:0x170
        if(((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none))) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterfaceEx, OnlinePlayerInterfaceEx(none)))
        {
            // End:0x164
            if(OnlineSub.PlayerInterfaceEx.IsDeviceValid(Profile.DeviceID, DeviceStorageSizeNeeded))
            {
                bFoundCachedData = GetData(OnlineSub.PlayerInterface, byte(PlayerControllerId));
                // End:0x161
                if(!bFoundCachedData)
                {
                }                
            }
            else
            {
                bNeedsDeferredRefresh = true;
            }
        }        
    }
    else
    {
        bNeedsDeferredRefresh = true;
    }
    //return;    
}

function ReadData()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerInterface[8388609];
    local /*0x97E50000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x97E50000-0x00000000*/ private int DeviceID[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerStorage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x36
    if(int(PlayerInterface.GetLoginStatus(LocalUserNum)) != int(2))
    {
        return false;
    }
    return super.ReadData(PlayerInterface, LocalUserNum, DeviceID, PlayerStorage);
    //return ReturnValue;    
}
