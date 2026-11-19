interface SPOnlineNPInterface extends Interface
    abstract;

function ExecuteStoreBrowse()
{
    local /*0x35EA0000-0x00000000*/ private byte TargetType[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string TargetId[8388609];
    local /*0x35EA0000-0x00000000*/ private int UserData[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function OpenInvites()
{
    //return;    
}

delegate OnStoreBrowseEnded()
{
    //return;    
}

function AddStoreBrowseEndedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> Callback[8388609];

    //return;    
}

function ClearStoreBrowseEndedDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> Callback[8388609];

    //return;    
}

delegate OnGameSpyLoginFailure()
{
    local /*0x35EA0000-0x00000000*/ private int NumberOfRetries[8388609];

    //return;    
}

function AddGameSpyLoginFailureDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> Callback[8388609];

    //return;    
}

function ClearGameSpyLoginFailureDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> Callback[8388609];

    //return;    
}

delegate OnGameSpyLoginRecovered()
{
    local /*0x35EA0000-0x00000000*/ private int NumberOfRetries[8388609];

    //return;    
}

function AddGameSpyLoginRecoveredDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> Callback[8388609];

    //return;    
}

function ClearGameSpyLoginRecoveredDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> Callback[8388609];

    //return;    
}

function ForceGameSpyLoginsToFail()
{
    local /*0x35EA0000-0x00000000*/ private bool bOn[8388609];

    //return;    
}

function DidAcceptInviteFromXMB()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}
