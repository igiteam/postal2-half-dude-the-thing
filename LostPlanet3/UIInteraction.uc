class UIInteraction extends Interaction within GameViewportClient
    transient
    config(UI)
    hidecategories(Object,UIRoot);

struct native transient UIKeyRepeatData
{
    var(*) /*0x35EA0000-0x00000010*/ private name CurrentRepeatKey;
    var(*) /*0x35EA0000-0x00000010*/ private @NULL NextRepeatTime;

    structdefaultproperties
    {
        CurrentRepeatKey="None"
        NextRepeatTime=none
    }
};

struct native transient UIAxisEmulationData extends UIKeyRepeatData
{
    var(*) /*0x35EA0000-0x00000010*/ private bool bEnabled;
};

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_FExec[268566529];
var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_FGlobalDataStoreClientManager[268566529];
var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_FCallbackEventDevice[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL UIManager;
var(*) /*0x35EA0000-0x00000000*/ private class UIManagerClass;
var(*) /*0x35EA0000-0x00000000*/ private class SceneClientClass;
var(*) /*0x35EA0000-0x00000000*/ private @NULL SceneClient[537001985];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SupportedDoubleClickKeys[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DataStoreManager[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bProcessInput[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float UIJoystickDeadZone[1073872897];
var(*) /*0x35EA0000-0x00000000*/ private float UIAxisMultiplier[1073872897];
var(*) /*0x35EA0000-0x00000000*/ private float AxisRepeatDelay[1073872897];
var(*) /*0x35EA0000-0x00000000*/ private float MouseButtonRepeatDelay[1073872897];
var(*) /*0x35EA0000-0x00000000*/ private float DoubleClickTriggerSeconds[1073872897];
var(*) /*0x35EA0000-0x00000000*/ private int DoubleClickPixelTolerance[1073872897];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MouseButtonRepeatInfo[537001985];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ConfiguredAxisEmulationDefinitions[1073872897];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} AxisEmulationDefinitions[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL AxisInputEmulation[536870916];

// Export UUIInteraction::execGetPlayerCount(FFrame&, void* const)
native static final function GetPlayerCount()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UUIInteraction::execGetPlayerIndex(FFrame&, void* const)
native static final function GetPlayerIndex()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609], ReturnValue;


}

// Export UUIInteraction::execGetPlayerControllerId(FFrame&, void* const)
native static final function GetPlayerControllerId()
{
    local /*0x35EA0000-0x00000000*/ private int PlayerIndex[8388609], ReturnValue;


}

// Export UUIInteraction::execGetDataStoreClient(FFrame&, void* const)
native static final function GetDataStoreClient()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

static final function GetLocalPlayer()
{
    local /*0x35EA0000-0x00000000*/ private int PlayerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], CurrentUIController, Result;

    CurrentUIController = Class'UIRoot'.static.GetCurrentUIController();
    // End:0xFE
    if(((CurrentUIController != none) && PlayerIndex >= 0) && PlayerIndex < CurrentUIController.Outer.Outer.GamePlayers.Length)
    {
        Result = CurrentUIController.Outer.Outer.GamePlayers[PlayerIndex];
    }
    return Result;
    //return ReturnValue;    
}

function NotifyPlayerAdded()
{
    local /*0x35EA0000-0x00000000*/ private int PlayerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL AddedPlayer[8388609], Empty;

    // End:0x64
    if((PlayerIndex >= 0) && PlayerIndex < 4)
    {
        Empty.CurrentRepeatKey = 'None';
        AxisInputEmulation[PlayerIndex] = Empty;
    }
    // End:0xA4
    if(SceneClient != none)
    {
        SceneClient.NotifyPlayerAdded(PlayerIndex, AddedPlayer);
    }
    // End:0xE4
    if(UIManager != none)
    {
        UIManager.NotifyPlayerAdded(PlayerIndex, AddedPlayer);
    }
    //return;    
}

function NotifyPlayerRemoved()
{
    local /*0x35EA0000-0x00000000*/ private int PlayerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL RemovedPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private int PlayerCount, NextPlayerIndex, I;
    local /*0x35EA0000-0x00000000*/ private @NULL Empty;

    // End:0x1AF
    if((PlayerIndex >= 0) && PlayerIndex < 4)
    {
        PlayerCount = GetPlayerCount();
        I = PlayerIndex;
        J0x48:

        // End:0x16C [Loop If]
        if(I < PlayerCount)
        {
            NextPlayerIndex = I + 1;
            AxisInputEmulation[I].NextRepeatTime = AxisInputEmulation[NextPlayerIndex].NextRepeatTime;
            AxisInputEmulation[I].CurrentRepeatKey = AxisInputEmulation[NextPlayerIndex].CurrentRepeatKey;
            AxisInputEmulation[I].bEnabled = AxisInputEmulation[NextPlayerIndex].bEnabled;
            I++;
            // [Loop Continue]
            goto J0x48;
        }
        Empty.CurrentRepeatKey = 'None';
        AxisInputEmulation[PlayerCount] = Empty;
    }
    // End:0x1EF
    if(SceneClient != none)
    {
        SceneClient.NotifyPlayerRemoved(PlayerIndex, RemovedPlayer);
    }
    // End:0x22F
    if(UIManager != none)
    {
        UIManager.NotifyPlayerRemoved(PlayerIndex, RemovedPlayer);
    }
    //return;    
}

static final event GetLoginStatus()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689], Result;
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, PlayerInterface;

    Result = 0;
    // End:0xD4
    if(ControllerId != -1)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        // End:0xD4
        if(OnlineSub != none)
        {
            PlayerInterface = OnlineSub.PlayerInterface;
            // End:0xD4
            if(NotEqual_InterfaceInterface(PlayerInterface, OnlinePlayerInterface(none)))
            {
                Result = PlayerInterface.GetLoginStatus(byte(ControllerId));
            }
        }
    }
    return Result;
    //return ReturnValue;    
}

final function GetLowestLoginStatusOfControllers()
{
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689], Result, LoginStatus;
    local /*0x35EA0000-0x00000000*/ private int PlayerIndex;

    Result = 2;
    PlayerIndex = 0;
    J0x17:

    // End:0xFB [Loop If]
    if(PlayerIndex < Outer.Outer.GamePlayers.Length)
    {
        LoginStatus = GetLoginStatus(Outer.Outer.GamePlayers[PlayerIndex].ControllerId);
        // End:0xED
        if(int(LoginStatus) < int(Result))
        {
            Result = LoginStatus;
        }
        PlayerIndex++;
        // [Loop Continue]
        goto J0x17;
    }
    return Result;
    //return ReturnValue;    
}

static final event HasLinkConnection()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689], bResult;
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, SystemInterface;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xAB
    if(OnlineSub != none)
    {
        SystemInterface = OnlineSub.SystemInterface;
        // End:0xAB
        if(NotEqual_InterfaceInterface(SystemInterface, OnlineSystemInterface(none)))
        {
            bResult = SystemInterface.HasLinkConnection();
        }
    }
    return bResult;
    //return ReturnValue;    
}

static final event IsLoggedIn()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bRequireOnlineLogin[9437185], ReturnValue, bResult;
    local /*0x35EA0000-0x00000000*/ private byte LoginStatus;

    LoginStatus = GetLoginStatus(ControllerId);
    bResult = (int(LoginStatus) == int(2)) || (int(LoginStatus) == int(1)) && !bRequireOnlineLogin;
    return bResult;
    //return ReturnValue;    
}

static final function GetLoggedInPlayerCount()
{
    local /*0x35EA0000-0x00000000*/ private bool bRequireOnlineLogin[9437185];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689], ControllerId, Result;

    ControllerId = 0;
    J0x0C:

    // End:0x55 [Loop If]
    if(ControllerId < 4)
    {
        // End:0x47
        if(IsLoggedIn(ControllerId, bRequireOnlineLogin))
        {
            Result++;
        }
        ControllerId++;
        // [Loop Continue]
        goto J0x0C;
    }
    return Result;
    //return ReturnValue;    
}

static final function GetNumGuestsLoggedIn()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;
    local /*0x35EA0000-0x00000000*/ private int ControllerId, GuestCount;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xE6
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        ControllerId = 0;
        J0x7A:

        // End:0xE6 [Loop If]
        if(ControllerId < 4)
        {
            // End:0xD8
            if(OnlineSub.PlayerInterface.IsGuestLogin(byte(ControllerId)))
            {
                GuestCount++;
            }
            ControllerId++;
            // [Loop Continue]
            goto J0x7A;
        }
    }
    return GuestCount;
    //return ReturnValue;    
}

static final function IsGamepadConnected()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689], bResult;
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, SystemInterface;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xB4
    if(OnlineSub != none)
    {
        SystemInterface = OnlineSub.SystemInterface;
        // End:0xB4
        if(NotEqual_InterfaceInterface(SystemInterface, OnlineSystemInterface(none)))
        {
            bResult = SystemInterface.IsControllerConnected(ControllerId);
        }
    }
    return bResult;
    //return ReturnValue;    
}

static final function GetConnectedGamepadCount()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ControllerConnectionStatusOverrides[9437185];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689], I, Result;

    I = 0;
    J0x0C:

    // End:0x87 [Loop If]
    if(I < 4)
    {
        // End:0x58
        if(I < ControllerConnectionStatusOverrides.Length)
        {
            // End:0x55
            if(ControllerConnectionStatusOverrides[I])
            {
                Result++;
            }            
        }
        else
        {
            // End:0x79
            if(IsGamepadConnected(I))
            {
                Result++;
            }
        }
        I++;
        // [Loop Continue]
        goto J0x0C;
    }
    return Result;
    //return ReturnValue;    
}

static final event GetNATType()
{
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub, SystemInterface;
    local /*0x35EA0000-0x00000000*/ private byte Result;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0xAA
    if(OnlineSub != none)
    {
        SystemInterface = OnlineSub.SystemInterface;
        // End:0xAA
        if(NotEqual_InterfaceInterface(SystemInterface, OnlineSystemInterface(none)))
        {
            Result = SystemInterface.GetNATType();
        }
    }
    return Result;
    //return ReturnValue;    
}

function NotifyGameSessionEnded()
{
    // End:0x2E
    if(SceneClient != none)
    {
        SceneClient.NotifyGameSessionEnded();
    }
    // End:0x5C
    if(DataStoreManager != none)
    {
        DataStoreManager.super(DataStoreClient).NotifyGameSessionEnded();
    }
    //return;    
}

defaultproperties
{
    UIManagerClass=Class'UIManager'
    SceneClientClass=Class'GameUISceneClient'
    UIJoystickDeadZone=0.5000000
    UIAxisMultiplier=1.0000000
    AxisRepeatDelay=0.2000000
    MouseButtonRepeatDelay=0.1500000
    DoubleClickTriggerSeconds=0.5000000
    DoubleClickPixelTolerance=1
    ConfiguredAxisEmulationDefinitions=/* Array type was not detected. */
    AxisInputEmulation[0]=(bEnabled=true,CurrentRepeatKey="None",NextRepeatTime=none)
    AxisInputEmulation[1]=(bEnabled=true,CurrentRepeatKey="None",NextRepeatTime=none)
    AxisInputEmulation[2]=(bEnabled=true,CurrentRepeatKey="None",NextRepeatTime=none)
    AxisInputEmulation[3]=(bEnabled=true,CurrentRepeatKey="None",NextRepeatTime=none)
}