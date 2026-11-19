interface OnlineSystemInterface extends Interface
    abstract;

function HasLinkConnection()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnLinkStatusChange()
{
    local /*0x35EA0000-0x00000000*/ private bool bIsConnected[8388609];

    //return;    
}

function AddLinkStatusChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> LinkStatusDelegate[8388609];

    //return;    
}

function ClearLinkStatusChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> LinkStatusDelegate[8388609];

    //return;    
}

function IsExternalUIOpen()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnExternalUIChange()
{
    local /*0x35EA0000-0x00000000*/ private bool bIsOpening[8388609];

    //return;    
}

function AddExternalUIChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ExternalUIDelegate[8388609];

    //return;    
}

function ClearExternalUIChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ExternalUIDelegate[8388609];

    //return;    
}

function GetNetworkNotificationPosition()
{
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];

    //return ReturnValue;    
}

function SetNetworkNotificationPosition()
{
    local /*0x35EA0000-0x00000000*/ private byte NewPos[8388609];

    //return;    
}

delegate OnControllerChange()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIsConnected[8388609];

    //return;    
}

function AddControllerChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ControllerChangeDelegate[8388609];

    //return;    
}

function ClearControllerChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ControllerChangeDelegate[8388609];

    //return;    
}

function IsControllerConnected()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnConnectionStatusChange()
{
    local /*0x35EA0000-0x00000000*/ private byte ConnectionStatus[8388609];

    //return;    
}

function AddConnectionStatusChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ConnectionStatusDelegate[8388609];

    //return;    
}

function ClearConnectionStatusChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ConnectionStatusDelegate[8388609];

    //return;    
}

function GetNATType()
{
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnStorageDeviceChange()
{
    //return;    
}

function AddStorageDeviceChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> StorageDeviceChangeDelegate[8388609];

    //return;    
}

function ClearStorageDeviceChangeDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> StorageDeviceChangeDelegate[8388609];

    //return;    
}

function GetLocale()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    //return ReturnValue;    
}
