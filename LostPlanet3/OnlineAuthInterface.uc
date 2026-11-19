interface OnlineAuthInterface extends Interface
    abstract;

enum EAuthStatus
{
    AUS_NotStarted,                 // 0
    AUS_Pending,                    // 1
    AUS_Authenticated,              // 2
    AUS_Failed,                     // 3
    AUS_MAX                         // 4
};

struct native BaseAuthSession
{
    var(*) /*0x35EA0000-0x00000000*/ private int EndPointIP[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int EndPointPort[131073];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL EndPointUID[131073];

    structdefaultproperties
    {
        EndPointIP=0
        EndPointPort=0
        EndPointUID=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
    }
};

struct native LocalAuthSession extends BaseAuthSession
{
    var(*) /*0x35EA0000-0x00000000*/ private int SessionUID[131073];
};

struct native AuthSession extends BaseAuthSession
{
    var(*) /*0x35EA0000-0x00000000*/ private byte AuthStatus[131073];
    var(*) /*0x35EA0000-0x00000000*/ private int AuthTicketUID[131073];
};

function IsReady()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnAuthReady()
{
    //return;    
}

function AddAuthReadyDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> AuthReadyDelegate[8388609];

    //return;    
}

function ClearAuthReadyDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> AuthReadyDelegate[8388609];

    //return;    
}

delegate OnClientAuthRequest()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ServerUID[8388609];
    local /*0x35EA0000-0x00000000*/ private int ServerIP[8388609], ServerPort;
    local /*0x35EA0000-0x00000000*/ private bool bSecure[8388609];

    //return;    
}

function AddClientAuthRequestDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ClientAuthRequestDelegate[8388609];

    //return;    
}

function ClearClientAuthRequestDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ClientAuthRequestDelegate[8388609];

    //return;    
}

delegate OnServerAuthRequest()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClientConnection[8388609], ClientUID;
    local /*0x35EA0000-0x00000000*/ private int ClientIP[8388609], ClientPort;

    //return;    
}

function AddServerAuthRequestDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ServerAuthRequestDelegate[8388609];

    //return;    
}

function ClearServerAuthRequestDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ServerAuthRequestDelegate[8388609];

    //return;    
}

delegate OnClientAuthResponse()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClientUID[8388609];
    local /*0x35EA0000-0x00000000*/ private int ClientIP[8388609], AuthTicketUID;

    //return;    
}

function AddClientAuthResponseDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ClientAuthResponseDelegate[8388609];

    //return;    
}

function ClearClientAuthResponseDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ClientAuthResponseDelegate[8388609];

    //return;    
}

delegate OnServerAuthResponse()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ServerUID[8388609];
    local /*0x35EA0000-0x00000000*/ private int ServerIP[8388609], AuthTicketUID;

    //return;    
}

function AddServerAuthResponseDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ServerAuthResponseDelegate[8388609];

    //return;    
}

function ClearServerAuthResponseDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ServerAuthResponseDelegate[8388609];

    //return;    
}

delegate OnClientAuthComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bSuccess[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ClientUID[8388609], ClientConnection;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ExtraInfo[8388609];

    //return;    
}

function AddClientAuthCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ClientAuthCompleteDelegate[8388609];

    //return;    
}

function ClearClientAuthCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ClientAuthCompleteDelegate[8388609];

    //return;    
}

delegate OnServerAuthComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bSuccess[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ServerUID[8388609], ServerConnection;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ExtraInfo[8388609];

    //return;    
}

function AddServerAuthCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ServerAuthCompleteDelegate[8388609];

    //return;    
}

function ClearServerAuthCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ServerAuthCompleteDelegate[8388609];

    //return;    
}

delegate OnClientAuthEndSessionRequest()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ServerConnection[8388609];

    //return;    
}

function AddClientAuthEndSessionRequestDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ClientAuthEndSessionRequestDelegate[8388609];

    //return;    
}

function ClearClientAuthEndSessionRequestDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ClientAuthEndSessionRequestDelegate[8388609];

    //return;    
}

delegate OnServerAuthRetryRequest()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClientConnection[8388609];

    //return;    
}

function AddServerAuthRetryRequestDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ServerAuthRetryRequestDelegate[8388609];

    //return;    
}

function ClearServerAuthRetryRequestDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ServerAuthRetryRequestDelegate[8388609];

    //return;    
}

delegate OnClientConnectionClose()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClientConnection[8388609];

    //return;    
}

function AddClientConnectionCloseDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ClientConnectionCloseDelegate[8388609];

    //return;    
}

function ClearClientConnectionCloseDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ClientConnectionCloseDelegate[8388609];

    //return;    
}

delegate OnServerConnectionClose()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ServerConnection[8388609];

    //return;    
}

function AddServerConnectionCloseDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ServerConnectionCloseDelegate[8388609];

    //return;    
}

function ClearServerConnectionCloseDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> ServerConnectionCloseDelegate[8388609];

    //return;    
}

function SendClientAuthRequest()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClientConnection[8388609], ClientUID;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function SendServerAuthRequest()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ServerUID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function SendClientAuthResponse()
{
    local /*0x35EA0000-0x00000000*/ private int AuthTicketUID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function SendServerAuthResponse()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClientConnection[8388609];
    local /*0x35EA0000-0x00000000*/ private int AuthTicketUID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function SendClientAuthEndSessionRequest()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClientConnection[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function SendServerAuthRetryRequest()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function CreateClientAuthSession()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ServerUID[8388609];
    local /*0x35EA0000-0x00000000*/ private int ServerIP[8388609], ServerPort;
    local /*0x35EA0000-0x00000000*/ private bool bSecure[8388609];
    local /*0x35EA0000-0x00000000*/ private int OutAuthTicketUID[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function VerifyClientAuthSession()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClientUID[8388609];
    local /*0x35EA0000-0x00000000*/ private int ClientIP[8388609], ClientPort, AuthTicketUID;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function EndLocalClientAuthSession()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ServerUID[8388609];
    local /*0x35EA0000-0x00000000*/ private int ServerIP[8388609], ServerPort;

    //return;    
}

function EndRemoteClientAuthSession()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClientUID[8388609];
    local /*0x35EA0000-0x00000000*/ private int ClientIP[8388609];

    //return;    
}

function EndAllLocalClientAuthSessions()
{
    //return;    
}

function EndAllRemoteClientAuthSessions()
{
    //return;    
}

function CreateServerAuthSession()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClientUID[8388609];
    local /*0x35EA0000-0x00000000*/ private int ClientIP[8388609], ClientPort, OutAuthTicketUID;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function VerifyServerAuthSession()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ServerUID[8388609];
    local /*0x35EA0000-0x00000000*/ private int ServerIP[8388609], AuthTicketUID;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function EndLocalServerAuthSession()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClientUID[8388609];
    local /*0x35EA0000-0x00000000*/ private int ClientIP[8388609];

    //return;    
}

function EndRemoteServerAuthSession()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ServerUID[8388609];
    local /*0x35EA0000-0x00000000*/ private int ServerIP[8388609];

    //return;    
}

function EndAllLocalServerAuthSessions()
{
    //return;    
}

function EndAllRemoteServerAuthSessions()
{
    //return;    
}

// Export UOnlineAuthInterface::execAllClientAuthSessions(FFrame&, void* const)
native iterator function AllClientAuthSessions()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OutSessionInfo[25165825];


}

// Export UOnlineAuthInterface::execAllLocalClientAuthSessions(FFrame&, void* const)
native iterator function AllLocalClientAuthSessions()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OutSessionInfo[25165825];


}

// Export UOnlineAuthInterface::execAllServerAuthSessions(FFrame&, void* const)
native iterator function AllServerAuthSessions()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OutSessionInfo[25165825];


}

// Export UOnlineAuthInterface::execAllLocalServerAuthSessions(FFrame&, void* const)
native iterator function AllLocalServerAuthSessions()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OutSessionInfo[25165825];


}

function FindClientAuthSession()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClientConnection[8388609], OutSessionInfo;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function FindLocalClientAuthSession()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ServerConnection[8388609], OutSessionInfo;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function FindServerAuthSession()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ServerConnection[8388609], OutSessionInfo;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function FindLocalServerAuthSession()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClientConnection[8388609], OutSessionInfo;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function GetServerUniqueId()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OutServerUID[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function GetServerAddr()
{
    local /*0x35EA0000-0x00000000*/ private int OutServerIP[25165825], OutServerPort;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}
