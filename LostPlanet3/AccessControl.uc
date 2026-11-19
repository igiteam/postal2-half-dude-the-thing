class AccessControl extends Info
    config(Game)
    notplaceable
    hidecategories(AnimDependency,Navigation,Movement,Collision);

struct PendingClientAuth
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ClientConnection;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ClientUID;
    var(*) /*0x35EA0000-0x00000000*/ private float AuthTimestamp;
    var(*) /*0x35EA0000-0x00000000*/ private int AuthRetryCount;

    structdefaultproperties
    {
        ClientConnection=none
        ClientUID=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        AuthTimestamp=0.0000000
        AuthRetryCount=0
    }
};

struct ServerAuthRetry
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ClientUID;
    var(*) /*0x35EA0000-0x00000000*/ private int AuthRetryCount;

    structdefaultproperties
    {
        ClientUID=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        AuthRetryCount=0
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input array IPPolicies[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input array BannedIDs[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string IPBanned;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string WrongPassword;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string NeedPassword;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string SessionBanned;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string KickedMsg;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string DefaultKickReason;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string IdleKickReason;
var(*) /*0x35EA0000-0x00000000*/ private class AdminClass;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string AdminPassword[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize input string GamePassword[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ACDisplayText;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ACDescText;
var(*) /*0x35EA0000-0x00000000*/ private bool bDontAddDefaultAdmin;
var(*) /*0x35EA0000-0x00000000*/ private input bool bAuthenticateClients[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input bool bAuthenticateServer[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input bool bAuthenticateListenHost[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bAuthDelegatesRegistered;
var(*) /*0x35EA0000-0x00000000*/ private bool bPendingListenAuth;
var(*) /*0x35EA0000-0x00000000*/ private input int MaxAuthRetryCount[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input int AuthRetryDelay[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedAuthInt;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ClientsPendingAuth;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ServerAuthRetries;
var(*) /*0x35EA0000-0x00000000*/ private int ListenAuthTicketUID;
var(*) /*0x35EA0000-0x00000000*/ private int ListenAuthRetryCount;

function PostBeginPlay()
{
    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    InitAuthHooks();
    //return;    
}

function Destroyed()
{
    Cleanup();
    //return;    
}

function IsAdmin()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x88
    if(P != none)
    {
        // End:0x29
        if(Admin(P) != none)
        {
            return true;
        }
        // End:0x88
        if((P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.bAdmin)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function SetAdminPassword()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string P[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    AdminPassword = P;
    return true;
    //return ReturnValue;    
}

function SetGamePassword()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string P[8388609];

    GamePassword = P;
    WorldInfo.Game.UpdateGameSettings();
    //return;    
}

function RequiresPassword()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return GamePassword != "";
    //return ReturnValue;    
}

function GetControllerFromString()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Target[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], C, FinalC;
    local /*0x35EA0000-0x00000000*/ private int I;

    FinalC = none;
    // End:0x100
    foreach WorldInfo.AllControllers(Class'Controller', C)
    {
        // End:0xFF
        if((C.PlayerReplicationInfo != none) && (C.PlayerReplicationInfo.PlayerName ~= Target) || C.PlayerReplicationInfo.PlayerName ~= Target)
        {
            FinalC = C;
            // End:0x100
            break;
        }        
    }    
    // End:0x26C
    if(((C == none) && WorldInfo != none) && WorldInfo.GRI != none)
    {
        I = 0;
        J0x152:

        // End:0x26C [Loop If]
        if(I < WorldInfo.GRI.PRIArray.Length)
        {
            // End:0x25E
            if(string(WorldInfo.GRI.PRIArray[I].PlayerID) == Target)
            {
                FinalC = Controller(WorldInfo.GRI.PRIArray[I].Owner);
                // [Explicit Break]
                goto J0x26C;
            }
            I++;
            // [Loop Continue]
            goto J0x152;
        }
    }
    J0x26C:

    return FinalC;
    //return ReturnValue;    
}

function Kick()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Target[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL C;

    C = GetControllerFromString(Target);
    // End:0x12E
    if((C != none) && C.PlayerReplicationInfo != none)
    {
        // End:0x92
        if(PlayerController(C) != none)
        {
            KickPlayer(PlayerController(C), DefaultKickReason);            
        }
        else
        {
            // End:0x12E
            if(C.PlayerReplicationInfo != none)
            {
                // End:0x107
                if(C.Pawn != none)
                {
                    C.Pawn.Destroy();
                }
                // End:0x12E
                if(C != none)
                {
                    C.Destroy();
                }
            }
        }
    }
    //return;    
}

function KickBan()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Target[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL P;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string IP;

    P = PlayerController(GetControllerFromString(Target));
    // End:0x21F
    if(NetConnection(P.Player) != none)
    {
        // End:0x107
        if(!WorldInfo.IsConsoleBuild())
        {
            IP = P.GetPlayerNetworkAddress();
            // End:0x107
            if(CheckIPPolicy(IP))
            {
                IP = Left(IP, InStr(IP, ":"));
                IPPolicies[IPPolicies.Length] = "DENY," $ IP;
                SaveConfig();
            }
        }
        // End:0x201
        if(NotEqual_UniqueNetIdUniqueNetId(P.PlayerReplicationInfo.UniqueId, P.PlayerReplicationInfo.default.UniqueId) && !IsIDBanned(P.PlayerReplicationInfo.UniqueId))
        {
            BannedIDs.AddItem(P.PlayerReplicationInfo.UniqueId);            
            SaveConfig();
        }
        KickPlayer(P, DefaultKickReason);
        return;
    }
    //return;    
}

function ForceKickPlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL C[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string KickReason[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xDE
    if((C != none) && NetConnection(C.Player) != none)
    {
        // End:0x96
        if(C.Pawn != none)
        {
            C.Pawn.Suicide();
        }
        C.ClientWasKicked();
        // End:0xDC
        if(C != none)
        {
            C.Destroy();
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

function KickPlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL C[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string KickReason[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x75
    if(((C != none) && !IsAdmin(C)) && NetConnection(C.Player) != none)
    {
        return ForceKickPlayer(C, KickReason);
    }
    return false;
    //return ReturnValue;    
}

function AdminLogin()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Password[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x12
    if(AdminPassword == "")
    {
        return false;
    }
    // End:0x61
    if(Password == AdminPassword)
    {
        P.PlayerReplicationInfo.bAdmin = true;
        return true;
    }
    return false;
    //return ReturnValue;    
}

function AdminLogout()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xAF
    if(P.PlayerReplicationInfo.bAdmin)
    {
        P.PlayerReplicationInfo.bAdmin = false;
        P.bGodMode = false;
        P.Suicide();
        return true;
    }
    return false;
    //return ReturnValue;    
}

function AdminEntered()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string LoginString;

    LoginString = P.PlayerReplicationInfo.PlayerName @ "logged in as a server administrator.";
    WorldInfo.Game.Broadcast(P, LoginString);
    //return;    
}

function AdminExited()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string LogoutString;

    LogoutString = P.PlayerReplicationInfo.PlayerName $ "is no longer logged in as a server administrator.";
    WorldInfo.Game.Broadcast(P, LogoutString);
    //return;    
}

function ParseAdminOptions()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Options[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InAdminName, InPassword;

    InPassword = Class'GameInfo'.static.ParseOption(Options, "Password");
    InAdminName = Class'GameInfo'.static.ParseOption(Options, "AdminName");
    return ValidLogin(InAdminName, InPassword);
    //return ReturnValue;    
}

function ValidLogin()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserName[8388609], Password;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (AdminPassword != "") && Password == AdminPassword;
    //return ReturnValue;    
}

function CheckIPPolicy()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Address[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int I, J;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Policy, Mask;
    local /*0x35EA0000-0x00000000*/ private bool bAcceptAddress, bAcceptPolicy;

    J = InStr(Address, ":");
    // End:0x4C
    if(J != -1)
    {
        Address = Left(Address, J);
    }
    bAcceptAddress = true;
    I = 0;
    J0x63:

    // End:0x202 [Loop If]
    if(I < IPPolicies.Length)
    {
        J = InStr(IPPolicies[I], ",");
        // End:0xB6
        if(J == -1)
        {            
        }
        else
        {
            Policy = Left(IPPolicies[I], J);
            Mask = Mid(IPPolicies[I], J + 1);
            // End:0x12F
            if(Policy ~= "ACCEPT")
            {
                bAcceptPolicy = true;                
            }
            else
            {
                // End:0x152
                if(Policy ~= "DENY")
                {
                    bAcceptPolicy = false;                    
                }
                else
                {
                    goto J0x1F4;
                }
            }
            J = InStr(Mask, "*");
            // End:0x1C8
            if(J != -1)
            {
                // End:0x1C5
                if(Left(Mask, J) == Left(Address, J))
                {
                    bAcceptAddress = bAcceptPolicy;
                }                
            }
            else
            {
                // End:0x1F4
                if(Mask == Address)
                {
                    bAcceptAddress = bAcceptPolicy;
                }
            }
        }
        J0x1F4:

        I++;
        // [Loop Continue]
        goto J0x63;
    }
    // End:0x211
    if(!bAcceptAddress)
    {
    }
    return bAcceptAddress;
    //return ReturnValue;    
}

function IsIDBanned()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NetId[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x5C [Loop If]
    if(I < BannedIDs.Length)
    {
        // End:0x4E
        if(EqualEqual_UniqueNetIdUniqueNetId(BannedIDs[I], NetId))
        {
            return true;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

function InitAuthHooks()
{
    local /*0x35EA0000-0x00000000*/ private @NULL GameSettings;
    local /*0x35EA0000-0x00000000*/ private bool bIsLanMatch;

    // End:0x198
    if(OnlineSub != none)
    {
        CachedAuthInt = OnlineSub.AuthInterface;
        // End:0xF3
        if(NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none)))
        {
            GameSettings = OnlineSub.GameInterface.GetGameSettings(WorldInfo.Game.PlayerReplicationInfoClass.default.SessionName);
        }
        // End:0x195
        if((((int(WorldInfo.NetMode) == int(NM_DedicatedServer)) || int(WorldInfo.NetMode) == int(NM_ListenServer)) && GameSettings != none) && GameSettings.bIsLanMatch)
        {
            // End:0x189
            if(bAuthenticateClients)
            {
            }
            bIsLanMatch = true;
        }        
    }
    else
    {
        bIsLanMatch = true;
    }
    // End:0x1CC
    if(!bIsLanMatch && bAuthenticateClients)
    {
        RegisterAuthDelegates();
    }
    //return;    
}

function RegisterAuthDelegates()
{
    // End:0x23B
    if(NotEqual_InterfaceInterface(CachedAuthInt, OnlineAuthInterface(none)))
    {
        // End:0x76
        if(!CachedAuthInt.IsReady())
        {
            CachedAuthInt.AddAuthReadyDelegate(OnAuthReady);
        }
        CachedAuthInt.AddServerAuthRequestDelegate(ProcessServerAuthRequest);
        CachedAuthInt.AddClientAuthResponseDelegate(ProcessClientAuthResponse);
        CachedAuthInt.AddClientAuthCompleteDelegate(OnClientAuthComplete);
        CachedAuthInt.AddClientConnectionCloseDelegate(OnClientConnectionClose);
        CachedAuthInt.AddServerAuthRetryRequestDelegate(ProcessServerAuthRetryRequest);
        CachedAuthInt.ClearClientConnectionCloseDelegate(Class'AccessControl'.StaticOnClientConnectionClose);
        // End:0x22C
        if(NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none)))
        {
            OnlineSub.GameInterface.AddDestroyOnlineGameCompleteDelegate(OnDestroyOnlineGameComplete);
        }
        bAuthDelegatesRegistered = true;        
    }
    else
    {
        // End:0x27C
        if(OnlineSub.Class.Name != 'OnlineSubsystemSteamworks')
        {
        }
        bAuthDelegatesRegistered = false;
    }
    //return;    
}

function ClearAuthDelegates()
{
    local /*0x35EA0000-0x00000000*/ private bool bExiting[8388609];

    // End:0x22A
    if(NotEqual_InterfaceInterface(CachedAuthInt, OnlineAuthInterface(none)))
    {
        CachedAuthInt.ClearAuthReadyDelegate(OnAuthReady);
        CachedAuthInt.ClearServerAuthRequestDelegate(ProcessServerAuthRequest);
        CachedAuthInt.ClearClientAuthResponseDelegate(ProcessClientAuthResponse);
        CachedAuthInt.ClearClientAuthCompleteDelegate(OnClientAuthComplete);
        CachedAuthInt.ClearClientConnectionCloseDelegate(OnClientConnectionClose);
        CachedAuthInt.ClearServerAuthRetryRequestDelegate(ProcessServerAuthRetryRequest);
        // End:0x19B
        if(!bExiting)
        {
            CachedAuthInt.AddClientConnectionCloseDelegate(Class'AccessControl'.StaticOnClientConnectionClose);
        }
        // End:0x227
        if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none)))
        {
            OnlineSub.GameInterface.ClearDestroyOnlineGameCompleteDelegate(OnDestroyOnlineGameComplete);
        }        
    }
    bAuthDelegatesRegistered = false;
    //return;    
}

event PreLogin()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Options[8388609], Address;
    local /*0x35EA0000-0x00000000*/ private @NULL UniqueId[8519681];
    local /*0x35EA0000-0x00000000*/ private bool bSupportsAuth[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string OutError[25165825];
    local /*0x35EA0000-0x00000000*/ private bool bSpectator[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InPassword;
    local /*0x35EA0000-0x00000000*/ private int I, CurIP, CurPort, ClientIP, LingeringPort;

    local /*0x35EA0000-0x00000000*/ private bool bFound, bSuccess;
    local /*0x35EA0000-0x00000000*/ private @NULL NullId, HostUID, ClientConn, CurConn, CurClientSession, GameSettings;

    OutError = "";
    InPassword = WorldInfo.Game.ParseOption(Options, "Password");
    // End:0x127
    if((int(WorldInfo.NetMode) != int(NM_Standalone)) && WorldInfo.Game.AtCapacity(bSpectator))
    {
        OutError = PathName(WorldInfo.Game.GameMessageClass) $ ".MaxedOutMessage";        
    }
    else
    {
        // End:0x1E2
        if(((GamePassword != "") && !InPassword == GamePassword) && (AdminPassword == "") || !InPassword == AdminPassword)
        {
            OutError = ((InPassword == "") ? "Engine.AccessControl.NeedPassword" : "Engine.AccessControl.WrongPassword");
        }
    }
    // End:0x223
    if(!CheckIPPolicy(Address))
    {
        OutError = "Engine.AccessControl.IPBanned";
    }
    // End:0xB37
    if(((bAuthenticateClients && OutError == "") && NotEqual_InterfaceInterface(CachedAuthInt, OnlineAuthInterface(none))) && bAuthDelegatesRegistered)
    {
        // End:0xB37
        if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none)))
        {
            GameSettings = OnlineSub.GameInterface.GetGameSettings(WorldInfo.Game.PlayerReplicationInfoClass.default.SessionName);
            // End:0xB37
            if((((int(WorldInfo.NetMode) == int(NM_DedicatedServer)) || int(WorldInfo.NetMode) == int(NM_ListenServer)) && GameSettings != none) && !GameSettings.bIsLanMatch)
            {
                // End:0x475
                if(!bSupportsAuth)
                {
                    // End:0x44B
                    if(OnlineSub.Class.Name == 'OnlineSubsystemSteamworks')
                    {
                        OutError = "Engine.Errors.SteamClientRequired";                        
                    }
                    else
                    {
                        OutError = "Server requires authentication";
                    }
                }
                // End:0x4C3
                if(OutError == "")
                {
                    ClientConn = WorldInfo.Game.PauseLogin();
                }
                // End:0xAFB
                if(ClientConn != none)
                {
                    // End:0x53D
                    foreach WorldInfo.AllClientConnections(CurConn, CurIP, CurPort)
                    {
                        // End:0x53C
                        if(CurConn == ClientConn)
                        {
                            ClientIP = CurIP;
                            // End:0x53D
                            break;
                        }                        
                    }                    
                    LingeringPort = 0;
                    // End:0x5FD
                    foreach CachedAuthInt.AllClientAuthSessions(CurClientSession)
                    {
                        // End:0x5FC
                        if((CurClientSession.EndPointIP == ClientIP) && EqualEqual_UniqueNetIdUniqueNetId(CurClientSession.EndPointUID, UniqueId))
                        {
                            LingeringPort = CurClientSession.EndPointPort;
                            // End:0x5FD
                            break;
                        }                        
                    }                    
                    // End:0x6D7
                    if(LingeringPort != 0)
                    {
                        // End:0x6D6
                        foreach WorldInfo.AllClientConnections(CurConn, CurIP, CurPort)
                        {
                            // End:0x6D5
                            if(((CurConn != ClientConn) && CurIP == ClientIP) && CurPort == LingeringPort)
                            {
                                WorldInfo.Game.RejectLogin(CurConn, "");
                                // End:0x6D6
                                break;
                            }                            
                        }                        
                    }
                    I = 0;
                    J0x6E2:

                    // End:0x753 [Loop If]
                    if(I < ClientsPendingAuth.Length)
                    {
                        // End:0x745
                        if(EqualEqual_UniqueNetIdUniqueNetId(ClientsPendingAuth[I].ClientUID, UniqueId))
                        {
                            bFound = true;
                            // [Explicit Break]
                            goto J0x753;
                        }
                        I++;
                        // [Loop Continue]
                        goto J0x6E2;
                    }
                    J0x753:

                    // End:0x7FD
                    if(!bFound)
                    {
                        // End:0x7FC
                        foreach CachedAuthInt.AllClientAuthSessions(CurClientSession)
                        {
                            // End:0x7FB
                            if(EqualEqual_UniqueNetIdUniqueNetId(CurClientSession.EndPointUID, UniqueId) && CurClientSession.EndPointIP != ClientIP)
                            {
                                bFound = true;
                                // End:0x7FC
                                break;
                            }                            
                        }                        
                    }
                    // End:0x8CF
                    if((((int(WorldInfo.NetMode) == int(NM_ListenServer)) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none))) && OnlineSub.PlayerInterface.GetUniquePlayerId(0, HostUID)) && EqualEqual_UniqueNetIdUniqueNetId(UniqueId, HostUID))
                    {
                        bFound = true;
                    }
                    // End:0xAB8
                    if(!bFound && NotEqual_UniqueNetIdUniqueNetId(UniqueId, NullId))
                    {
                        // End:0x99D
                        if(CachedAuthInt.IsReady())
                        {
                            bSuccess = CachedAuthInt.SendClientAuthRequest(ClientConn, UniqueId);
                            // End:0x99A
                            if(bSuccess && !IsTimerActive('PendingAuthTimer'))
                            {
                                SetTimer(3.0000000, true, 'PendingAuthTimer');
                            }                            
                        }
                        else
                        {
                            bSuccess = true;
                        }
                        // End:0xA89
                        if(bSuccess)
                        {
                            I = ClientsPendingAuth.Length;
                            ClientsPendingAuth.Length = I + 1;
                            ClientsPendingAuth[I].ClientConnection = ClientConn;
                            ClientsPendingAuth[I].ClientUID = UniqueId;
                            ClientsPendingAuth[I].AuthTimestamp = WorldInfo.RealTimeSeconds;                            
                        }
                        else
                        {
                            OutError = "Failed to kickoff authentication";
                        }                        
                    }
                    else
                    {
                        // End:0xAE1
                        if(bFound)
                        {
                            OutError = "Duplicate UID";                            
                        }
                        else
                        {
                            OutError = "Invalid UID";
                        }
                    }                    
                }
                else
                {
                    // End:0xB37
                    if(OutError == "")
                    {
                        OutError = "Failed to kickoff authentication";
                    }
                }
            }
        }
    }
    //return;    
}

function PendingAuthTimer()
{
    local /*0x35EA0000-0x00000000*/ private int I, OldLength;
    local /*0x35EA0000-0x00000000*/ private bool bFailed;
    local /*0x35EA0000-0x00000000*/ private @NULL CurClientSession;

    I = 0;
    J0x0B:

    // End:0x445 [Loop If]
    if(I < ClientsPendingAuth.Length)
    {
        // End:0x72
        if(ClientsPendingAuth[I].ClientConnection == none)
        {
            ClientsPendingAuth.Remove(I, 1);            
            I--;            
        }
        else
        {
            // End:0x103
            if(WorldInfo.RealTimeSeconds < ClientsPendingAuth[I].AuthTimestamp)
            {
                ClientsPendingAuth[I].AuthTimestamp = WorldInfo.RealTimeSeconds;                
            }
            else
            {
                // End:0x437
                if((WorldInfo.RealTimeSeconds - ClientsPendingAuth[I].AuthTimestamp) >= float(AuthRetryDelay))
                {
                    // End:0x437
                    if(CachedAuthInt.FindClientAuthSession(ClientsPendingAuth[I].ClientConnection, CurClientSession))
                    {
                        // End:0x361
                        if(ClientsPendingAuth[I].AuthRetryCount < MaxAuthRetryCount)
                        {
                            CachedAuthInt.EndRemoteClientAuthSession(CurClientSession.EndPointUID, CurClientSession.EndPointIP);
                            CachedAuthInt.SendClientAuthEndSessionRequest(ClientsPendingAuth[I].ClientConnection);
                            // End:0x352
                            if(CachedAuthInt.SendClientAuthRequest(ClientsPendingAuth[I].ClientConnection, CurClientSession.EndPointUID))
                            {
                                ClientsPendingAuth[I].AuthTimestamp = WorldInfo.RealTimeSeconds;
                                ClientsPendingAuth[I].AuthRetryCount++;                                
                            }
                            else
                            {
                                bFailed = true;
                            }                            
                        }
                        else
                        {
                            bFailed = true;
                        }
                        // End:0x437
                        if(bFailed)
                        {
                            OldLength = ClientsPendingAuth.Length;
                            WorldInfo.Game.RejectLogin(ClientsPendingAuth[I].ClientConnection, "Authentication failed");
                            // End:0x42C
                            if(OldLength == ClientsPendingAuth.Length)
                            {
                                ClientsPendingAuth.Remove(I, 1);                                
                            }
                            I--;
                        }
                    }
                }
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    // End:0x469
    if(ClientsPendingAuth.Length == 0)
    {
        ClearTimer('PendingAuthTimer');
    }
    //return;    
}

function OnAuthReady()
{
    local /*0x35EA0000-0x00000000*/ private int I, OldLength;

    // End:0x279
    if(bAuthDelegatesRegistered)
    {
        I = 0;
        J0x18:

        // End:0x204 [Loop If]
        if(I < ClientsPendingAuth.Length)
        {
            // End:0x7F
            if(ClientsPendingAuth[I].ClientConnection == none)
            {
                ClientsPendingAuth.Remove(I, 1);                
                I--;                
            }
            else
            {
                // End:0x136
                if(CachedAuthInt.SendClientAuthRequest(ClientsPendingAuth[I].ClientConnection, ClientsPendingAuth[I].ClientUID))
                {
                    ClientsPendingAuth[I].AuthTimestamp = WorldInfo.RealTimeSeconds;                    
                }
                else
                {
                    OldLength = ClientsPendingAuth.Length;
                    WorldInfo.Game.RejectLogin(ClientsPendingAuth[I].ClientConnection, "Authentication failed");
                    // End:0x1E8
                    if(OldLength == ClientsPendingAuth.Length)
                    {
                        ClientsPendingAuth.Remove(I, 1);                        
                    }
                    I--;                    
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x18;
        }
        // End:0x227
        if(ClientsPendingAuth.Length > 0)
        {
            SetTimer(3.0000000, true, 'PendingAuthTimer');
        }
        // End:0x279
        if((bAuthenticateListenHost && int(WorldInfo.NetMode) == int(NM_ListenServer)) && bPendingListenAuth)
        {
            BeginListenHostAuth();
        }
    }
    //return;    
}

function ProcessClientAuthResponse()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClientUID[8388609];
    local /*0x35EA0000-0x00000000*/ private int ClientIP[8388609], AuthTicketUID;
    local /*0x35EA0000-0x00000000*/ private bool bSuccess;
    local /*0x35EA0000-0x00000000*/ private int I, PendingIdx, OldLength;

    PendingIdx = -1;
    I = 0;
    J0x1A:

    // End:0x92 [Loop If]
    if(I < ClientsPendingAuth.Length)
    {
        // End:0x84
        if(EqualEqual_UniqueNetIdUniqueNetId(ClientsPendingAuth[I].ClientUID, ClientUID))
        {
            PendingIdx = I;
            // [Explicit Break]
            goto J0x92;
        }
        I++;
        // [Loop Continue]
        goto J0x1A;
    }
    J0x92:

    // End:0x1B0
    if(PendingIdx != -1)
    {
        bSuccess = CachedAuthInt.VerifyClientAuthSession(ClientUID, ClientIP, 0, AuthTicketUID);
        // End:0x1AD
        if(!bSuccess)
        {
            OldLength = ClientsPendingAuth.Length;
            WorldInfo.Game.RejectLogin(ClientsPendingAuth[I].ClientConnection, "Authentication failed");
            // End:0x1AD
            if(OldLength == ClientsPendingAuth.Length)
            {
                ClientsPendingAuth.Remove(PendingIdx, 1);                
            }
        }        
    }
    //return;    
}

function OnClientAuthComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bSuccess[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ClientUID[8388609], ClientConnection;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ExtraInfo[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HostUID;
    local /*0x35EA0000-0x00000000*/ private int I, PendingLen, PendingIdx;
    local /*0x35EA0000-0x00000000*/ private @NULL P, PRI;
    local /*0x35EA0000-0x00000000*/ private bool bResumeLogin;
    local /*0x35EA0000-0x00000000*/ private @NULL CurClientSession;

    // End:0xFD
    if((((int(WorldInfo.NetMode) == int(NM_ListenServer)) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none))) && OnlineSub.PlayerInterface.GetUniquePlayerId(0, HostUID)) && EqualEqual_UniqueNetIdUniqueNetId(HostUID, ClientUID))
    {
        // End:0xFB
        if(bSuccess)
        {
            ClearTimer('ListenHostAuthTimeout');
            ClearTimer('ContinueListenHostAuth');
        }
        return;
    }
    PendingLen = ClientsPendingAuth.Length;
    PendingIdx = -1;
    I = 0;
    J0x12B:

    // End:0x1FA [Loop If]
    if(I < PendingLen)
    {
        // End:0x1EC
        if(((ClientConnection != none) && ClientsPendingAuth[I].ClientConnection == ClientConnection) || (ClientConnection == none) && EqualEqual_UniqueNetIdUniqueNetId(ClientsPendingAuth[I].ClientUID, ClientUID))
        {
            PendingIdx = I;
            // [Explicit Break]
            goto J0x1FA;
        }
        I++;
        // [Loop Continue]
        goto J0x12B;
    }
    J0x1FA:

    // End:0x431
    if(PendingIdx != -1)
    {
        // End:0x401
        if(ClientConnection != none)
        {
            // End:0x3AD
            if(bSuccess)
            {
                // End:0x2B5
                foreach WorldInfo.AllControllers(Class'PlayerController', P)
                {
                    // End:0x2B4
                    if(P.Player == ClientConnection)
                    {
                        PRI = P.PlayerReplicationInfo;
                        // End:0x2B5
                        break;
                    }                    
                }                
                // End:0x305
                if(PRI != none)
                {
                    P.PlayerReplicationInfo.SetUniqueId(ClientUID);                    
                }
                bResumeLogin = true;
                // End:0x3AA
                if(bAuthenticateServer)
                {
                    // End:0x3AA
                    if(CachedAuthInt.FindClientAuthSession(ClientConnection, CurClientSession))
                    {
                        ProcessServerAuthRequest(ClientConnection, ClientUID, CurClientSession.EndPointIP, CurClientSession.EndPointPort);                        
                    }
                }                
            }
            else
            {
                WorldInfo.Game.RejectLogin(ClientConnection, "Authentication failed");
            }
        }
        // End:0x42E
        if(ClientsPendingAuth.Length == PendingLen)
        {
            ClientsPendingAuth.Remove(PendingIdx, 1);            
        }        
    }
    // End:0x47B
    if(bResumeLogin)
    {
        WorldInfo.Game.ResumeLogin(ClientConnection);
    }
    //return;    
}

function ProcessServerAuthRequest()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClientConnection[8388609], ClientUID;
    local /*0x35EA0000-0x00000000*/ private int ClientIP[8388609], ClientPort, AuthTicketUID;
    local /*0x35EA0000-0x00000000*/ private @NULL CurServerSession;
    local /*0x35EA0000-0x00000000*/ private bool bFound;

    // End:0x135
    if(bAuthenticateServer)
    {
        // End:0xA4
        foreach CachedAuthInt.AllLocalServerAuthSessions(CurServerSession)
        {
            // End:0xA3
            if(EqualEqual_UniqueNetIdUniqueNetId(CurServerSession.EndPointUID, ClientUID) && CurServerSession.EndPointIP == ClientIP)
            {
                bFound = true;
            }            
        }        
        // End:0x135
        if(!bFound)
        {
            // End:0x135
            if(CachedAuthInt.CreateServerAuthSession(ClientUID, ClientIP, ClientPort, AuthTicketUID))
            {
                // End:0x132
                if(!CachedAuthInt.SendServerAuthResponse(ClientConnection, AuthTicketUID))
                {
                }                
            }
        }
    }
    //return;    
}

function ProcessServerAuthRetryRequest()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClientConnection[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bFoundAndAuthenticated;
    local /*0x35EA0000-0x00000000*/ private int ClientIP, ClientPort, I, CurRetryIdx;
    local /*0x35EA0000-0x00000000*/ private @NULL ClientUID, CurClientSession, CurServerSession;

    // End:0x3DF
    if(bAuthenticateServer && ClientConnection != none)
    {
        bFoundAndAuthenticated = CachedAuthInt.FindClientAuthSession(ClientConnection, CurClientSession) && int(CurClientSession.AuthStatus) == int(2);
        // End:0x3DF
        if(bFoundAndAuthenticated)
        {
            ClientUID = CurClientSession.EndPointUID;
            ClientIP = CurClientSession.EndPointIP;
            ClientPort = CurClientSession.EndPointPort;
            CurRetryIdx = -1;
            I = 0;
            J0x11D:

            // End:0x195 [Loop If]
            if(I < ServerAuthRetries.Length)
            {
                // End:0x187
                if(EqualEqual_UniqueNetIdUniqueNetId(ServerAuthRetries[I].ClientUID, ClientUID))
                {
                    CurRetryIdx = I;
                    // [Explicit Break]
                    goto J0x195;
                }
                ++I;
                // [Loop Continue]
                goto J0x11D;
            }
            J0x195:

            // End:0x203
            if(CurRetryIdx == -1)
            {
                CurRetryIdx = ServerAuthRetries.Length;
                ServerAuthRetries.Length = CurRetryIdx + 1;
                ServerAuthRetries[CurRetryIdx].ClientUID = ClientUID;
            }
            // End:0x325
            if(ServerAuthRetries[CurRetryIdx].AuthRetryCount < MaxAuthRetryCount)
            {
                // End:0x2CB
                foreach CachedAuthInt.AllLocalServerAuthSessions(CurServerSession)
                {
                    // End:0x2CA
                    if(EqualEqual_UniqueNetIdUniqueNetId(CurServerSession.EndPointUID, ClientUID))
                    {
                        CachedAuthInt.EndLocalServerAuthSession(ClientUID, ClientIP);
                        // End:0x2CB
                        break;
                    }                    
                }                
                ProcessServerAuthRequest(ClientConnection, ClientUID, ClientIP, ClientPort);
                ServerAuthRetries[CurRetryIdx].AuthRetryCount++;                
            }
            else
            {
                // End:0x3B7
                if(ServerAuthRetries[CurRetryIdx].AuthRetryCount > Max(30, MaxAuthRetryCount + 20))
                {
                    WorldInfo.Game.RejectLogin(ClientConnection, "Spamming server auth");                    
                }
                else
                {
                    ServerAuthRetries[CurRetryIdx].AuthRetryCount++;
                }
            }
        }
    }
    //return;    
}

function NotifyStartOnlineGame()
{
    // End:0xA6
    if(((bAuthDelegatesRegistered && bAuthenticateListenHost) && int(WorldInfo.NetMode) == int(NM_ListenServer)) && NotEqual_InterfaceInterface(CachedAuthInt, OnlineAuthInterface(none)))
    {
        // End:0x9A
        if(CachedAuthInt.IsReady())
        {
            BeginListenHostAuth();            
        }
        else
        {
            bPendingListenAuth = true;
        }
    }
    //return;    
}

function BeginListenHostAuth()
{
    local /*0x35EA0000-0x00000000*/ private bool bRetry[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ServerUID, HostUID;
    local /*0x35EA0000-0x00000000*/ private int ServerIP, ServerPort;
    local /*0x35EA0000-0x00000000*/ private @NULL GameSettings;
    local /*0x35EA0000-0x00000000*/ private bool bGotHostInfo, bFound, bSecure;
    local /*0x35EA0000-0x00000000*/ private @NULL CurClientSession, ListenSession;

    bPendingListenAuth = false;
    // End:0xE0
    if(CachedAuthInt.IsReady())
    {
        bGotHostInfo = (CachedAuthInt.GetServerUniqueId(ServerUID) && CachedAuthInt.GetServerAddr(ServerIP, ServerPort)) && OnlineSub.PlayerInterface.GetUniquePlayerId(0, HostUID);
    }
    // End:0x38C
    if(bGotHostInfo)
    {
        // End:0x19A
        foreach CachedAuthInt.AllClientAuthSessions(CurClientSession)
        {
            // End:0x199
            if(EqualEqual_UniqueNetIdUniqueNetId(CurClientSession.EndPointUID, HostUID) && CurClientSession.EndPointIP == ServerIP)
            {
                ListenSession = CurClientSession;
                bFound = true;
                // End:0x19A
                break;
            }            
        }        
        // End:0x32E
        if(!bFound || bRetry)
        {
            // End:0x275
            if(NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none)))
            {
                GameSettings = OnlineSub.GameInterface.GetGameSettings(WorldInfo.Game.PlayerReplicationInfoClass.default.SessionName);
            }
            // End:0x2AE
            if(GameSettings != none)
            {
                bSecure = GameSettings.bAntiCheatProtected;
            }
            // End:0x312
            if(CachedAuthInt.CreateClientAuthSession(ServerUID, ServerIP, ServerPort, bSecure, ListenAuthTicketUID))
            {
                SetTimer(1.0000000, false, 'ContinueListenHostAuth');
            }
            SetTimer(float(AuthRetryDelay), false, 'ListenHostAuthTimeout');            
        }
        else
        {
            // End:0x389
            if((int(ListenSession.AuthStatus) != int(2)) && !IsTimerActive('ListenHostAuthTimeout'))
            {
                SetTimer(float(AuthRetryDelay), false, 'ListenHostAuthTimeout');
            }
        }        
    }
    else
    {
        OnlineSub.PlayerInterface.GetUniquePlayerId(0, HostUID);
        OnClientAuthComplete(false, HostUID, none, "Failed to kickoff listen host authentication");
    }
    //return;    
}

function ContinueListenHostAuth()
{
    local /*0x35EA0000-0x00000000*/ private bool bGotHostInfo;
    local /*0x35EA0000-0x00000000*/ private @NULL HostUID;
    local /*0x35EA0000-0x00000000*/ private int ServerIP, ServerPort;

    // End:0xB7
    if(NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        bGotHostInfo = OnlineSub.PlayerInterface.GetUniquePlayerId(0, HostUID) && CachedAuthInt.GetServerAddr(ServerIP, ServerPort);
    }
    // End:0x196
    if(!bGotHostInfo || !CachedAuthInt.VerifyClientAuthSession(HostUID, ServerIP, ServerPort, ListenAuthTicketUID))
    {
        OnlineSub.PlayerInterface.GetUniquePlayerId(0, HostUID);
        OnClientAuthComplete(false, HostUID, none, "VerifyClientAuthSession failed for listen host");
    }
    //return;    
}

function EndListenHostAuth()
{
    local /*0x35EA0000-0x00000000*/ private bool bGotHostInfo;
    local /*0x35EA0000-0x00000000*/ private @NULL ServerUID, HostUID;
    local /*0x35EA0000-0x00000000*/ private int ServerIP, ServerPort;

    // End:0xE5
    if(NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        bGotHostInfo = (CachedAuthInt.GetServerUniqueId(ServerUID) && CachedAuthInt.GetServerAddr(ServerIP, ServerPort)) && OnlineSub.PlayerInterface.GetUniquePlayerId(0, HostUID);
    }
    // End:0x162
    if(bGotHostInfo)
    {
        CachedAuthInt.EndLocalClientAuthSession(ServerUID, ServerIP, ServerPort);
        CachedAuthInt.EndRemoteClientAuthSession(HostUID, ServerIP);        
    }
    //return;    
}

function ListenHostAuthTimeout()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HostUID;

    ClearTimer('ListenHostAuthTimeout');
    ClearTimer('ContinueListenHostAuth');
    // End:0x58
    if(ListenAuthRetryCount < MaxAuthRetryCount)
    {
        ListenAuthRetryCount++;
        BeginListenHostAuth(true);        
    }
    else
    {
        OnlineSub.PlayerInterface.GetUniquePlayerId(0, HostUID);
        OnClientAuthComplete(false, HostUID, none, "VerifyClientAuthSession failed for listen host");
        EndListenHostAuth();
    }
    //return;    
}

function OnClientConnectionClose()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClientConnection[8388609];
    local /*0x35EA0000-0x00000000*/ private int I;

    // End:0xB0
    if(ClientConnection != none)
    {
        StaticOnClientConnectionClose(ClientConnection);
        I = 0;
        J0x2D:

        // End:0xB0 [Loop If]
        if(I < ClientsPendingAuth.Length)
        {
            // End:0xA2
            if((ClientConnection != none) && ClientsPendingAuth[I].ClientConnection == ClientConnection)
            {
                ClientsPendingAuth.Remove(I, 1);                
                // [Explicit Break]
                goto J0xB0;
            }
            ++I;
            // [Loop Continue]
            goto J0x2D;
        }
    }
    J0xB0:

    //return;    
}

static final function StaticOnClientConnectionClose()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ClientConnection[8388609], CurOnlineSub, CurAuthInt;
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private @NULL WI, CurClientSession, CurServerSession;

    CurOnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0x60
    if(CurOnlineSub != none)
    {
        CurAuthInt = CurOnlineSub.AuthInterface;
    }
    // End:0x3C3
    if(NotEqual_InterfaceInterface(CurAuthInt, OnlineAuthInterface(none)) && ClientConnection != none)
    {
        // End:0x147
        if(CurAuthInt.FindClientAuthSession(ClientConnection, CurClientSession) && int(CurClientSession.AuthStatus) == int(2))
        {
            CurAuthInt.EndRemoteClientAuthSession(CurClientSession.EndPointUID, CurClientSession.EndPointIP);
        }
        // End:0x3C3
        if(CurAuthInt.FindLocalServerAuthSession(ClientConnection, CurServerSession))
        {
            CurAuthInt.EndLocalServerAuthSession(CurServerSession.EndPointUID, CurServerSession.EndPointIP);
            WI = Class'WorldInfo'.static.GetWorldInfo();
            // End:0x3C3
            if(((WI != none) && WI.Game != none) && WI.Game.AccessControl != none)
            {
                I = 0;
                J0x279:

                // End:0x3C3 [Loop If]
                if(I < WI.Game.AccessControl.ServerAuthRetries.Length)
                {
                    // End:0x3B5
                    if(EqualEqual_UniqueNetIdUniqueNetId(WI.Game.AccessControl.ServerAuthRetries[I].ClientUID, CurServerSession.EndPointUID))
                    {
                        WI.Game.AccessControl.ServerAuthRetries.Remove(I, 1);                        
                        // [Explicit Break]
                        goto J0x3C3;
                    }
                    ++I;
                    // [Loop Continue]
                    goto J0x279;
                }
            }
        }
    }
    J0x3C3:

    //return;    
}

function OnDestroyOnlineGameComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private int CurIP, CurPort;
    local /*0x35EA0000-0x00000000*/ private @NULL ClientConn, CurConn, CurClientSession;

    // End:0x33
    if(int(WorldInfo.NetMode) == int(NM_ListenServer))
    {
        EndListenHostAuth();
    }
    // End:0x1CA
    foreach CachedAuthInt.AllClientAuthSessions(CurClientSession)
    {
        // End:0x1C9
        if(int(CurClientSession.AuthStatus) == int(2))
        {
            CachedAuthInt.EndRemoteClientAuthSession(CurClientSession.EndPointUID, CurClientSession.EndPointIP);
            // End:0x188
            foreach WorldInfo.AllClientConnections(CurConn, CurIP, CurPort)
            {
                // End:0x187
                if((CurIP == CurClientSession.EndPointIP) && CurPort == CurClientSession.EndPointPort)
                {
                    ClientConn = CurConn;
                    // End:0x188
                    break;
                }                
            }            
            // End:0x1C9
            if(ClientConn != none)
            {
                // End:0x1C6
                if(!CachedAuthInt.SendClientAuthEndSessionRequest(ClientConn))
                {
                }
                // End:0x1C9
                continue;
            }
        }        
    }    
    CachedAuthInt.EndAllLocalServerAuthSessions();
    ServerAuthRetries.Length = 0;
    //return;    
}

function NotifyServerTravel()
{
    local /*0x35EA0000-0x00000000*/ private bool bSeamless[8388609];

    // End:0x1A
    if(!bSeamless)
    {
        Cleanup();
    }
    //return;    
}

function NotifyGameEnding()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Engine;

    Engine = GameEngine(Class'Engine'.static.GetEngine());
    // End:0x8C
    if((WorldInfo.NextURL != "") || Engine.TravelURL != "")
    {
        Cleanup();        
    }
    else
    {
        NotifyExit();
    }
    //return;    
}

function NotifyExit()
{
    Cleanup(true);
    //return;    
}

function Cleanup()
{
    local /*0x35EA0000-0x00000000*/ private bool bExit[9437185];

    // End:0x8E
    if(NotEqual_InterfaceInterface(CachedAuthInt, OnlineAuthInterface(none)))
    {
        ClearAuthDelegates(bExit);
        // End:0x8E
        if(bExit)
        {
            CachedAuthInt.EndAllRemoteClientAuthSessions();
            CachedAuthInt.EndAllLocalServerAuthSessions();
            ServerAuthRetries.Length = 0;
        }
    }
    CachedAuthInt = none;
    OnlineSub = none;
    //return;    
}

function IsPendingAuth()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerUID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x6F [Loop If]
    if(I < ClientsPendingAuth.Length)
    {
        // End:0x61
        if(EqualEqual_UniqueNetIdUniqueNetId(ClientsPendingAuth[I].ClientUID, PlayerUID))
        {
            return true;
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    IPPolicies=/* Array type was not detected. */
    IPBanned="Your IP address has been banned on this server."
    WrongPassword="The password you entered is incorrect."
    NeedPassword="You need to enter a password to join this game."
    SessionBanned="Your IP address has been banned from the current game session."
    KickedMsg="You have been forcibly removed from the game."
    DefaultKickReason="None specified"
    IdleKickReason="Kicked for idling."
    AdminClass=Class'Admin'
    ACDisplayText[0]="Game Password"
    ACDisplayText[1]="Access Policies"
    ACDisplayText[2]="Admin Password"
    ACDescText[0]="If this password is set, players will have to enter it to join this server."
    ACDescText[1]="Specifies IP addresses or address ranges which have been banned."
    ACDescText[2]="Password required to login with administrator privileges on this server."
    bAuthenticateClients=true
    bAuthenticateServer=true
    bAuthenticateListenHost=true
    MaxAuthRetryCount=3
    AuthRetryDelay=5
    bAlwaysTick=true
}