interface OnlineAccountInterface extends Interface
    abstract;

function CreateOnlineAccount()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserName[8388609], Password, EmailAddress, ProductKey;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnCreateOnlineAccountCompleted()
{
    local /*0x35EA0000-0x00000000*/ private byte ErrorStatus[8388609];

    //return;    
}

function AddCreateOnlineAccountCompletedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> AccountCreateDelegate[8388609];

    //return;    
}

function ClearCreateOnlineAccountCompletedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> AccountCreateDelegate[8388609];

    //return;    
}

function CreateLocalAccount()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserName[8388609], Password;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function RenameLocalAccount()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string NewUserName[8388609], OldUserName, Password;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function DeleteLocalAccount()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserName[8388609], Password;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function GetLocalAccountNames()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Accounts[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}
