interface OnlineNewsInterface extends Interface
    abstract;

function ReadNews()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], NewsType;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnReadNewsCompleted()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private byte NewsType[8388609];

    //return;    
}

function AddReadNewsCompletedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadNewsDelegate[8388609];

    //return;    
}

function ClearReadNewsCompletedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ReadNewsDelegate[8388609];

    //return;    
}

function GetNews()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609], NewsType;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    //return ReturnValue;    
}
