class GameViewportClient extends ScriptViewportClient within Engine
    transient
    config(Engine);

enum ESplitScreenType
{
    eSST_NONE,                      // 0
    eSST_2P_HORIZONTAL,             // 1
    eSST_2P_VERTICAL,               // 2
    eSST_3P_FAVOR_TOP,              // 3
    eSST_3P_FAVOR_BOTTOM,           // 4
    eSST_4P,                        // 5
    eSST_MAX                        // 6
};

enum ESafeZoneType
{
    eSZ_TOP,                        // 0
    eSZ_BOTTOM,                     // 1
    eSZ_LEFT,                       // 2
    eSZ_RIGHT,                      // 3
    eSZ_MAX                         // 4
};

enum ESetMode
{
    SetMode_Toggle,                 // 0
    SetMode_Enable,                 // 1
    SetMode_Disable,                // 2
    SetMode_MAX                     // 3
};

struct native ShowFlags_Mirror
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL flags0[268566529];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL flags1[268566529];
};

struct ExportShowFlags_Mirror extends ShowFlags_Mirror
{
};

struct native TitleSafeZoneArea
{
    var(*) /*0x35EA0000-0x00000000*/ private float MaxPercentX;
    var(*) /*0x35EA0000-0x00000000*/ private float MaxPercentY;
    var(*) /*0x35EA0000-0x00000000*/ private float RecommendedPercentX;
    var(*) /*0x35EA0000-0x00000000*/ private float RecommendedPercentY;

    structdefaultproperties
    {
        MaxPercentX=0.0000000
        MaxPercentY=0.0000000
        RecommendedPercentX=0.0000000
        RecommendedPercentY=0.0000000
    }
};

struct native PerPlayerSplitscreenData
{
    var(*) /*0x35EA0000-0x00000000*/ private float SizeX;
    var(*) /*0x35EA0000-0x00000000*/ private float SizeY;
    var(*) /*0x35EA0000-0x00000000*/ private float OriginX;
    var(*) /*0x35EA0000-0x00000000*/ private float OriginY;

    structdefaultproperties
    {
        SizeX=0.0000000
        SizeY=0.0000000
        OriginX=0.0000000
        OriginY=0.0000000
    }
};

struct native SplitscreenData
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PlayerData;

    structdefaultproperties
    {
        PlayerData=none
    }
};

struct native DebugDisplayProperty
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Obj;
    var(*) /*0x35EA0000-0x00000000*/ private name PropertyName;
    var(*) /*0x35EA0000-0x00000000*/ private bool bSpecialProperty;

    structdefaultproperties
    {
        Obj=none
        PropertyName="None"
        bSpecialProperty=false
    }
};

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_FExec[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Viewport[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ViewportFrame[131073];
var(*) /*0x35EA0000-0x00000010*/ private editfixedsize array GlobalInteractions;
var(*) /*0x35EA0000-0x00000000*/ private class UIControllerClass;
var(*) /*0x35EA0000-0x00000000*/ private @NULL UIController;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ViewportConsole;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ShowFlags[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string LoadingMessage;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string SavingMessage;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ConnectingMessage;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string PausedMessage;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string PrecachingMessage;
var(*) /*0x35EA0000-0x00000000*/ private bool bShowTitleSafeZone;
var(*) /*0x35EA0000-0x00000000*/ private bool bDisplayHardwareMouseCursor[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bOverrideDiffuseAndSpecular[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsPlayInEditorViewport[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bShowSystemMouseCursor[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bDisableWorldRendering;
var(*) /*0x35EA0000-0x00000000*/ private bool bDebugNoGFxUI[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bRenderSubtitlesAfterFullscreenScaleformMovies[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bIntegrateButtonSubSamples;
var(*) /*0x35EA0000-0x00000000*/ private @NULL TitleSafeZone;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SplitscreenInfo;
var(*) /*0x35EA0000-0x00000000*/ private byte DesiredSplitscreenType;
var(*) /*0x35EA0000-0x00000000*/ private byte ActiveSplitscreenType;
var(*) /*0x35EA0000-0x00000000*/ private byte Default2PSplitType[131073];
var(*) /*0x35EA0000-0x00000000*/ private byte Default3PSplitType[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ProgressMessage[2];
var(*) /*0x35EA0000-0x00000000*/ private float ProgressTimeOut;
var(*) /*0x35EA0000-0x00000000*/ private float ProgressFadeTime;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array DebugProperties;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ScaleformInteraction[268566529];
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __HandleInputKey__Delegate;
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __HandleInputAxis__Delegate;
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __HandleInputChar__Delegate;

delegate HandleInputKey()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private name Key[8388609];
    local /*0x35EA0000-0x00000000*/ private byte EventType[8388609];
    local /*0x35EA0000-0x00000000*/ private float AmountDepressed[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bGamepad[9437185], ReturnValue;

    //return ReturnValue;    
}

delegate HandleInputAxis()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private name Key[8388609];
    local /*0x35EA0000-0x00000000*/ private float Delta[8388609], DeltaTime;
    local /*0x35EA0000-0x00000000*/ private bool bGamepad[8388609], ReturnValue;

    //return ReturnValue;    
}

delegate HandleInputChar()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Unicode[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

// Export UGameViewportClient::execConsoleCommand(FFrame&, void* const)
native function ConsoleCommand()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Command[8388609], ReturnValue;


}

// Export UGameViewportClient::execGetViewportSize(FFrame&, void* const)
native final function GetViewportSize()
{
    local /*0x35EA0000-0x00000000*/ private @NULL out_ViewportSize[25165825];


}

// Export UGameViewportClient::execIsFullScreenViewport(FFrame&, void* const)
native final function IsFullScreenViewport()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UGameViewportClient::execGetMousePosition(FFrame&, void* const)
native final function GetMousePosition()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UGameViewportClient::execShouldForceFullscreenViewport(FFrame&, void* const)
native final function ShouldForceFullscreenViewport()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UGameViewportClient::execGetNumCustomInteractions(FFrame&, void* const)
native function GetNumCustomInteractions()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UGameViewportClient::execGetCustomInteractionClass(FFrame&, void* const)
native function GetCustomInteractionClass()
{
    local /*0x35EA0000-0x00000000*/ private int InIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private class ReturnValue[92274689];


}

// Export UGameViewportClient::execSetCustomInteractionObject(FFrame&, void* const)
native function SetCustomInteractionObject()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InInteraction[8388609];


}

// Export UGameViewportClient::execNotifySplitscreenLayoutChanged(FFrame&, void* const)
native function NotifySplitscreenLayoutChanged();

// Export UGameViewportClient::execForceUpdateMouseCursor(FFrame&, void* const)
native function ForceUpdateMouseCursor()
{
    local /*0x35EA0000-0x00000000*/ private bool bSetCursor[8388609];


}

// Export UGameViewportClient::execSetMouse(FFrame&, void* const)
native function SetMouse()
{
    local /*0x35EA0000-0x00000000*/ private int X[8388609], Y;


}

event CreatePlayer()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string OutError[25165825];
    local /*0x35EA0000-0x00000000*/ private bool bSpawnActor[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], NewPlayer;
    local /*0x35EA0000-0x00000000*/ private int InsertIndex;

    InsertIndex = Outer.GamePlayers.Length;
    // End:0xA6
    if(InsertIndex == 0)
    {
        // End:0xA6
        if(Class'SPObject'.static.ParseCmdLineInteger(Class'SPObject'.static.AppCmdLine(), "-ControllerID=", InsertIndex, 0))
        {
            ControllerId = InsertIndex;
        }
    }
    // DebugMode: 0
    assert(Outer.LocalPlayerClass != none);
    NewPlayer = new (Outer) Outer.LocalPlayerClass;
    NewPlayer.ViewportClient = self;
    NewPlayer.ControllerId = ControllerId;
    InsertIndex = AddLocalPlayer(NewPlayer);
    // End:0x235
    if(bSpawnActor && InsertIndex != -1)
    {
        // End:0x216
        if(int(Outer.GetCurrentWorldInfo().NetMode) != int(NM_Client))
        {
            // End:0x213
            if(!NewPlayer.SpawnPlayActor("", OutError))
            {
                RemoveLocalPlayer(NewPlayer);
                NewPlayer = none;
            }            
        }
        else
        {
            NewPlayer.SendSplitJoin();
        }
    }
    // End:0x248
    if(OutError != "")
    {        
    }
    else
    {
        // End:0x288
        if((NewPlayer != none) && InsertIndex != -1)
        {
            NotifyPlayerAdded(InsertIndex, NewPlayer);
        }
    }
    return NewPlayer;
    //return ReturnValue;    
}

event RemovePlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ExPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int OldIndex, I;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array IDMappings;

    // End:0x1DF
    if(int(ExPlayer.Actor.Role) == int(ROLE_Authority))
    {
        ExPlayer.ViewportClient = none;
        // End:0xAF
        if(ExPlayer.Actor != none)
        {
            ExPlayer.Actor.Destroy();
        }
        OldIndex = RemoveLocalPlayer(ExPlayer);
        // End:0xFB
        if(OldIndex != -1)
        {
            NotifyPlayerRemoved(OldIndex, ExPlayer);
        }
        // End:0x1B7
        if(OldIndex != Outer.GamePlayers.Length)
        {
            I = 0;
            J0x133:

            // End:0x1B7 [Loop If]
            if(I < Outer.GamePlayers.Length)
            {
                // End:0x190
                if(I < OldIndex)
                {
                    IDMappings.AddItem(I);                                        
                }
                else
                {
                    IDMappings.AddItem(I + 1);                    
                }
                I++;
                // [Loop Continue]
                goto J0x133;
            }
        }
        // End:0x1DA
        if(IDMappings.Length > 0)
        {
            FixupOwnerReferences(IDMappings);
        }
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

final event FindPlayerByControllerId()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int PlayerIndex;

    PlayerIndex = 0;
    J0x0B:

    // End:0xBA [Loop If]
    if(PlayerIndex < Outer.GamePlayers.Length)
    {
        // End:0xAC
        if(Outer.GamePlayers[PlayerIndex].ControllerId == ControllerId)
        {
            return Outer.GamePlayers[PlayerIndex];
        }
        PlayerIndex++;
        // [Loop Continue]
        goto J0x0B;
    }
    return none;
    //return ReturnValue;    
}

exec function ShowTitleSafeArea()
{
    bShowTitleSafeZone = !bShowTitleSafeZone;
    //return;    
}

event Init()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string OutError[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerInteraction;
    local /*0x35EA0000-0x00000000*/ private int NumCustomInteractions;
    local /*0x35EA0000-0x00000000*/ private class CustomInteractionClass;
    local /*0x35EA0000-0x00000000*/ private @NULL CustomInteraction;
    local /*0x35EA0000-0x00000000*/ private int Idx;

    // DebugMode: 0
    assert(Outer.ConsoleClass != none);
    ActiveSplitscreenType = DesiredSplitscreenType;
    // End:0xE1
    if(ShouldCreateViewportConsole())
    {
        ViewportConsole = new (self) Outer.ConsoleClass;
        // End:0xE1
        if((InsertInteraction(ViewportConsole)) == -1)
        {
            OutError = "Failed to add interaction to GlobalInteractions array:" @ string(ViewportConsole);
            return false;
        }
    }
    NumCustomInteractions = GetNumCustomInteractions();
    Idx = 0;
    J0x100:

    // End:0x1DC [Loop If]
    if(Idx < NumCustomInteractions)
    {
        CustomInteractionClass = GetCustomInteractionClass(Idx);
        CustomInteraction = new (self) CustomInteractionClass;
        // End:0x1BB
        if((InsertInteraction(CustomInteraction)) == -1)
        {
            OutError = "Failed to add interaction to GlobalInteractions array:" @ string(CustomInteraction);
            return false;
        }
        SetCustomInteractionObject(CustomInteraction);
        Idx++;
        // [Loop Continue]
        goto J0x100;
    }
    // DebugMode: 0
    assert(UIControllerClass != none);
    UIController = new (self) UIControllerClass;
    // End:0x273
    if((InsertInteraction(UIController)) == -1)
    {
        OutError = "Failed to add interaction to GlobalInteractions array:" @ string(UIController);
        return false;
    }
    PlayerInteraction = new (self) Class'PlayerManagerInteraction';
    // End:0x2FA
    if((InsertInteraction(PlayerInteraction)) == -1)
    {
        OutError = "Failed to add interaction to GlobalInteractions array:" @ string(PlayerInteraction);
        return false;
    }
    // End:0x313
    if(bDebugNoGFxUI)
    {
        DebugSetUISystemEnabled(true, false);
    }
    return CreateInitialPlayer(OutError);
    //return ReturnValue;    
}

function ShouldCreateViewportConsole()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function CreateInitialPlayer()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string OutError[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int ControllerId;
    local /*0x35EA0000-0x00000000*/ private bool bFoundInitialGamepad, bResult;

    ControllerId = 0;
    J0x0B:

    // End:0x8F [Loop If]
    if(ControllerId < 4)
    {
        // End:0x81
        if(UIController.IsLoggedIn(ControllerId))
        {
            bFoundInitialGamepad = true;
            bResult = (CreatePlayer(ControllerId, OutError, false)) != none;
            // [Explicit Break]
            goto J0x8F;
        }
        ControllerId++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x8F:

    // End:0x13D
    if(!bFoundInitialGamepad || !bResult)
    {
        ControllerId = 0;
        J0xBA:

        // End:0x13D [Loop If]
        if(ControllerId < 4)
        {
            // End:0x12F
            if(UIController.IsGamepadConnected(ControllerId))
            {
                bFoundInitialGamepad = true;
                bResult = (CreatePlayer(ControllerId, OutError, false)) != none;
                // [Explicit Break]
                goto J0x13D;
            }
            ControllerId++;
            // [Loop Continue]
            goto J0xBA;
        }
    }
    J0x13D:

    // End:0x180
    if(!bFoundInitialGamepad || !bResult)
    {
        bResult = (CreatePlayer(0, OutError, false)) != none;
    }
    return bResult;
    //return ReturnValue;    
}

event InsertInteraction()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewInteraction[8388609];
    local /*0x35EA0000-0x00000000*/ private int InIndex[9437185], ReturnValue, Result;

    -1
    Result = -1;
    // End:0xF9
    if(NewInteraction != none)
    {
        // End:0x4E
        if(InIndex == -1)
        {
            InIndex = GlobalInteractions.Length;
        }
        // End:0xF9
        if(InIndex >= 0)
        {
            Result = Clamp(InIndex, 0, GlobalInteractions.Length);
            GlobalInteractions.Insert(Result, 1);            
            GlobalInteractions[Result] = NewInteraction;
            NewInteraction.Init();
            NewInteraction.OnInitialize();            
        }
    }
    return Result;
    //return ReturnValue;    
}

event GameSessionEnded()
{
    local /*0x35EA0000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x5A [Loop If]
    if(I < GlobalInteractions.Length)
    {
        GlobalInteractions[I].NotifyGameSessionEnded();
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function SetSplitscreenConfiguration()
{
    local /*0x35EA0000-0x00000000*/ private byte SplitType[8388609];

    DesiredSplitscreenType = SplitType;
    //return;    
}

function GetSplitscreenConfiguration()
{
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];

    return ActiveSplitscreenType;
    //return ReturnValue;    
}

function UpdateActiveSplitscreenType()
{
    local /*0x35EA0000-0x00000000*/ private byte SplitType;

    SplitType = DesiredSplitscreenType;
    switch(Outer.GamePlayers.Length)
    {
        // End:0x40
        case 0:
        // End:0x53
        case 1:
            SplitType = 0;
            // End:0xEF
            break;
        // End:0x98
        case 2:
            // End:0x95
            if((int(SplitType) != int(1)) && int(SplitType) != int(2))
            {
                SplitType = Default2PSplitType;
            }
            // End:0xEF
            break;
        // End:0xDD
        case 3:
            // End:0xDA
            if((int(SplitType) != int(3)) && int(SplitType) != int(4))
            {
                SplitType = Default3PSplitType;
            }
            // End:0xEF
            break;
        // End:0xFFFF
        default:
            SplitType = 5;
            // End:0xEF
            break;
            break;
    }
    ActiveSplitscreenType = SplitType;
    //return;    
}

event LayoutPlayers()
{
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private byte SplitType, PreviousSplitType;

    PreviousSplitType = GetSplitscreenConfiguration();
    UpdateActiveSplitscreenType();
    SplitType = GetSplitscreenConfiguration();
    Idx = 0;
    J0x3D:

    // End:0x47E [Loop If]
    if(Idx < Outer.GamePlayers.Length)
    {
        // End:0x318
        if((int(SplitType) < SplitscreenInfo.Length) && Idx < SplitscreenInfo[int(SplitType)].PlayerData.Length)
        {
            Outer.GamePlayers[Idx].Size.X = SplitscreenInfo[int(SplitType)].PlayerData[Idx].SizeX;
            Outer.GamePlayers[Idx].Size.Y = SplitscreenInfo[int(SplitType)].PlayerData[Idx].SizeY;
            Outer.GamePlayers[Idx].Origin.X = SplitscreenInfo[int(SplitType)].PlayerData[Idx].OriginX;
            Outer.GamePlayers[Idx].Origin.Y = SplitscreenInfo[int(SplitType)].PlayerData[Idx].OriginY;            
        }
        else
        {
            Outer.GamePlayers[Idx].Size.X = 0.0000000;
            Outer.GamePlayers[Idx].Size.Y = 0.0000000;
            Outer.GamePlayers[Idx].Origin.X = 0.0000000;
            Outer.GamePlayers[Idx].Origin.Y = 0.0000000;
        }
        Idx++;
        // [Loop Continue]
        goto J0x3D;
    }
    // End:0x4A3
    if(int(PreviousSplitType) != int(SplitType))
    {
        NotifySplitscreenLayoutChanged();
    }
    //return;    
}

event GetSubtitleRegion()
{
    local /*0x35EA0000-0x00000000*/ private @NULL MinPos[25165825], MaxPos;

    MaxPos.X = 1.0000000;
    MaxPos.Y = ((Outer.GamePlayers.Length == 1) ? 0.9000000 : 0.5000000);
    //return;    
}

final function ConvertLocalPlayerToGamePlayerIndex()
{
    local /*0x35EA0000-0x00000000*/ private @NULL LPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return Outer.GamePlayers.Find(LPlayer);    
    //return ReturnValue;    
}

final function HasTopSafeZone()
{
    local /*0x35EA0000-0x00000000*/ private int LocalPlayerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    switch(GetSplitscreenConfiguration())
    {
        // End:0x19
        case 0:
        // End:0x20
        case 2:
            return true;
        // End:0x25
        case 1:
        // End:0x3E
        case 3:
            return ((LocalPlayerIndex == 0) ? true : false);
        // End:0x43
        case 4:
        // End:0x5D
        case 5:
            return ((LocalPlayerIndex < 2) ? true : false);
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return ReturnValue;    
}

final function HasBottomSafeZone()
{
    local /*0x35EA0000-0x00000000*/ private int LocalPlayerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    switch(GetSplitscreenConfiguration())
    {
        // End:0x19
        case 0:
        // End:0x20
        case 2:
            return true;
        // End:0x25
        case 1:
        // End:0x3E
        case 3:
            return ((LocalPlayerIndex == 0) ? false : true);
        // End:0x43
        case 4:
        // End:0x5C
        case 5:
            return ((LocalPlayerIndex > 1) ? true : false);
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return ReturnValue;    
}

final function HasLeftSafeZone()
{
    local /*0x35EA0000-0x00000000*/ private int LocalPlayerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    switch(GetSplitscreenConfiguration())
    {
        // End:0x19
        case 0:
        // End:0x20
        case 1:
            return true;
        // End:0x39
        case 2:
            return ((LocalPlayerIndex == 0) ? true : false);
        // End:0x53
        case 3:
            return ((LocalPlayerIndex < 2) ? true : false);
        // End:0x58
        case 4:
        // End:0x83
        case 5:
            return (((LocalPlayerIndex == 0) || LocalPlayerIndex == 2) ? true : false);
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return ReturnValue;    
}

final function HasRightSafeZone()
{
    local /*0x35EA0000-0x00000000*/ private int LocalPlayerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    switch(GetSplitscreenConfiguration())
    {
        // End:0x19
        case 0:
        // End:0x20
        case 1:
            return true;
        // End:0x25
        case 2:
        // End:0x3E
        case 4:
            return ((LocalPlayerIndex > 0) ? true : false);
        // End:0x57
        case 3:
            return ((LocalPlayerIndex == 1) ? false : true);
        // End:0x82
        case 5:
            return (((LocalPlayerIndex == 0) || LocalPlayerIndex == 2) ? false : true);
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return ReturnValue;    
}

final function GetPixelSizeOfScreen()
{
    local /*0x35EA0000-0x00000000*/ private float out_Width[25165825], out_Height;
    local /*0x35EA0000-0x00000000*/ private @NULL Canvas[8388609];
    local /*0x35EA0000-0x00000000*/ private int LocalPlayerIndex[8388609];

    switch(GetSplitscreenConfiguration())
    {
        // End:0x6B
        case 0:
            out_Width = Canvas.ClipX;
            out_Height = Canvas.ClipY;
            return;
        // End:0xC8
        case 1:
            out_Width = Canvas.ClipX;
            out_Height = Canvas.ClipY * float(2);
            return;
        // End:0x125
        case 2:
            out_Width = Canvas.ClipX * float(2);
            out_Height = Canvas.ClipY;
            return;
        // End:0x1C2
        case 3:
            // End:0x164
            if(LocalPlayerIndex == 0)
            {
                out_Width = Canvas.ClipX;                
            }
            else
            {
                out_Width = Canvas.ClipX * float(2);
            }
            out_Height = Canvas.ClipY * float(2);
            return;
        // End:0x260
        case 4:
            // End:0x202
            if(LocalPlayerIndex == 2)
            {
                out_Width = Canvas.ClipX;                
            }
            else
            {
                out_Width = Canvas.ClipX * float(2);
            }
            out_Height = Canvas.ClipY * float(2);
            return;
        // End:0x2C3
        case 5:
            out_Width = Canvas.ClipX * float(2);
            out_Height = Canvas.ClipY * float(2);
            return;
        // End:0xFFFF
        default:
            //return;
            break;
    }    
}

final function CalculateSafeZoneValues()
{
    local /*0x35EA0000-0x00000000*/ private float out_Horizontal[25165825], out_Vertical;
    local /*0x35EA0000-0x00000000*/ private @NULL Canvas[8388609];
    local /*0x35EA0000-0x00000000*/ private int LocalPlayerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bUseMaxPercent[8388609];
    local /*0x35EA0000-0x00000000*/ private float ScreenWidth, ScreenHeight, XSafeZoneToUse, YSafeZoneToUse;

    XSafeZoneToUse = ((bUseMaxPercent) ? TitleSafeZone.MaxPercentX : TitleSafeZone.RecommendedPercentX);
    YSafeZoneToUse = ((bUseMaxPercent) ? TitleSafeZone.MaxPercentY : TitleSafeZone.RecommendedPercentY);
    GetPixelSizeOfScreen(ScreenWidth, ScreenHeight, Canvas, LocalPlayerIndex);
    out_Horizontal = (ScreenWidth * (float(1) - XSafeZoneToUse)) / 2.0000000;
    out_Vertical = (ScreenHeight * (float(1) - YSafeZoneToUse)) / 2.0000000;
    //return;    
}

final function CalculateDeadZoneForAllSides()
{
    local /*0x35EA0000-0x00000000*/ private @NULL LPlayer[8388609], Canvas;
    local /*0x35EA0000-0x00000000*/ private float fTopSafeZone[25165825], fBottomSafeZone, fLeftSafeZone, fRightSafeZone;
    local /*0x35EA0000-0x00000000*/ private bool bUseMaxPercent[9437185], ReturnValue, bHasTopSafeZone, bHasBottomSafeZone, bHasRightSafeZone, bHasLeftSafeZone;

    local /*0x35EA0000-0x00000000*/ private int LocalPlayerIndex;
    local /*0x35EA0000-0x00000000*/ private float HorizSafeZoneValue, VertSafeZoneValue;

    // End:0x1F4
    if(LPlayer != none)
    {
        LocalPlayerIndex = ConvertLocalPlayerToGamePlayerIndex(LPlayer);
        // End:0x1F4
        if(LocalPlayerIndex != -1)
        {
            bHasTopSafeZone = HasTopSafeZone(LocalPlayerIndex);
            bHasBottomSafeZone = HasBottomSafeZone(LocalPlayerIndex);
            bHasLeftSafeZone = HasLeftSafeZone(LocalPlayerIndex);
            bHasRightSafeZone = HasRightSafeZone(LocalPlayerIndex);
            // End:0x1F4
            if(((bHasTopSafeZone || bHasBottomSafeZone) || bHasLeftSafeZone) || bHasRightSafeZone)
            {
                CalculateSafeZoneValues(HorizSafeZoneValue, VertSafeZoneValue, Canvas, LocalPlayerIndex, bUseMaxPercent);
                // End:0x14D
                if(bHasTopSafeZone)
                {
                    fTopSafeZone = VertSafeZoneValue;                    
                }
                else
                {
                    fTopSafeZone = 0.0000000;
                }
                // End:0x17F
                if(bHasBottomSafeZone)
                {
                    fBottomSafeZone = VertSafeZoneValue;                    
                }
                else
                {
                    fBottomSafeZone = 0.0000000;
                }
                // End:0x1B1
                if(bHasLeftSafeZone)
                {
                    fLeftSafeZone = HorizSafeZoneValue;                    
                }
                else
                {
                    fLeftSafeZone = 0.0000000;
                }
                // End:0x1E3
                if(bHasRightSafeZone)
                {
                    fRightSafeZone = HorizSafeZoneValue;                    
                }
                else
                {
                    fRightSafeZone = 0.0000000;
                }
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

event Tick()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

function DrawTitleSafeArea()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Canvas[8388609];

    Canvas.SetDrawColor(255, 0, 0, 255);
    Canvas.SetPos((Canvas.ClipX * (float(1) - TitleSafeZone.MaxPercentX)) / 2.0000000, (Canvas.ClipY * (float(1) - TitleSafeZone.MaxPercentY)) / 2.0000000);
    Canvas.DrawBox(Canvas.ClipX * TitleSafeZone.MaxPercentX, Canvas.ClipY * TitleSafeZone.MaxPercentY);
    Canvas.SetDrawColor(255, 255, 0, 255);
    Canvas.SetPos((Canvas.ClipX * (float(1) - TitleSafeZone.RecommendedPercentX)) / 2.0000000, (Canvas.ClipY * (float(1) - TitleSafeZone.RecommendedPercentY)) / 2.0000000);
    Canvas.DrawBox(Canvas.ClipX * TitleSafeZone.RecommendedPercentX, Canvas.ClipY * TitleSafeZone.RecommendedPercentY);
    //return;    
}

event PostRender()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Canvas[8388609];

    // End:0x20
    if(bShowTitleSafeZone)
    {
        DrawTitleSafeArea(Canvas);
    }
    // End:0x57
    if(ViewportConsole != none)
    {
        ViewportConsole.PostRender_Console(Canvas);
    }
    DrawTransition(Canvas);
    //return;    
}

function DisplayProgressMessage()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Canvas[8388609];
    local /*0x35EA0000-0x00000000*/ private int I, LineCount;
    local /*0x35EA0000-0x00000000*/ private float FontDX, FontDY, X, Y;
    local /*0x35EA0000-0x00000000*/ private byte Alpha;
    local /*0x35EA0000-0x00000000*/ private float TimeLeft;

    TimeLeft = ProgressTimeOut - Class'Engine'.static.GetCurrentWorldInfo().TimeSeconds;
    Alpha = ((TimeLeft >= ProgressFadeTime) ? 255 : byte((float(255) * TimeLeft) / ProgressFadeTime));
    LineCount = 0;
    I = 0;
    J0xA0:

    // End:0xE3 [Loop If]
    if(I < 2)
    {
        // End:0xD5
        if(ProgressMessage[I] != "")
        {
            LineCount++;
        }
        I++;
        // [Loop Continue]
        goto J0xA0;
    }
    Canvas.Font = Class'Engine'.static.GetMediumFont();
    Canvas.TextSize("A", FontDX, FontDY);
    X = 0.5000000 * float(Canvas.SizeX);
    Y = 0.5000000 * float(Canvas.SizeY);
    Y -= (FontDY * (float(LineCount) / 2.0000000));
    Canvas.DrawColor.R = 255;
    Canvas.DrawColor.G = 255;
    Canvas.DrawColor.B = 255;
    I = 0;
    J0x288:

    // End:0x3CF [Loop If]
    if(I < 2)
    {
        // End:0x3C1
        if(ProgressMessage[I] != "")
        {
            Canvas.DrawColor.A = Alpha;
            Canvas.TextSize(ProgressMessage[I], FontDX, FontDY);
            Canvas.SetPos(X - (FontDX / 2.0000000), Y);
            Canvas.DrawText(ProgressMessage[I]);
            Y += FontDY;
        }
        I++;
        // [Loop Continue]
        goto J0x288;
    }
    //return;    
}

function DrawTransition()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Canvas[8388609];

    switch(Outer.TransitionType)
    {
        // End:0x4C
        case 2:
            DrawTransitionMessage(Canvas, LoadingMessage);
            // End:0xDF
            break;
        // End:0x70
        case 3:
            DrawTransitionMessage(Canvas, SavingMessage);
            // End:0xDF
            break;
        // End:0x94
        case 4:
            DrawTransitionMessage(Canvas, ConnectingMessage);
            // End:0xDF
            break;
        // End:0xB8
        case 5:
            DrawTransitionMessage(Canvas, PrecachingMessage);
            // End:0xDF
            break;
        // End:0xDC
        case 1:
            DrawTransitionMessage(Canvas, PausedMessage);
            // End:0xDF
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function DrawTransitionMessage()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Canvas[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Message[8388609];
    local /*0x35EA0000-0x00000000*/ private float XL, YL;

    Canvas.Font = Class'Engine'.static.GetLargeFont();
    Canvas.bCenter = false;
    Canvas.StrLen(Message, XL, YL);
    Canvas.SetPos((0.5000000 * (Canvas.ClipX - XL)) + float(1), ((0.6600000 * Canvas.ClipY) - (YL * 0.5000000)) + float(1));
    Canvas.SetDrawColor(0, 0, 0);
    Canvas.DrawText(Message, false);
    Canvas.SetPos(0.5000000 * (Canvas.ClipX - XL), (0.6600000 * Canvas.ClipY) - (YL * 0.5000000));
    Canvas.SetDrawColor(0, 0, 255);
    Canvas.DrawText(Message, false);
    //return;    
}

final function NotifyPlayerAdded()
{
    local /*0x35EA0000-0x00000000*/ private int PlayerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL AddedPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private int InteractionIndex;

    LayoutPlayers();
    InteractionIndex = 0;
    J0x15:

    // End:0x8F [Loop If]
    if(InteractionIndex < GlobalInteractions.Length)
    {
        // End:0x81
        if(GlobalInteractions[InteractionIndex] != none)
        {
            GlobalInteractions[InteractionIndex].NotifyPlayerAdded(PlayerIndex, AddedPlayer);
        }
        InteractionIndex++;
        // [Loop Continue]
        goto J0x15;
    }
    //return;    
}

final function NotifyPlayerRemoved()
{
    local /*0x35EA0000-0x00000000*/ private int PlayerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL RemovedPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private int InteractionIndex;

    LayoutPlayers();
    InteractionIndex = GlobalInteractions.Length - 1;
    J0x21:

    // End:0x92 [Loop If]
    if(InteractionIndex >= 0)
    {
        // End:0x84
        if(GlobalInteractions[InteractionIndex] != none)
        {
            GlobalInteractions[InteractionIndex].NotifyPlayerRemoved(PlayerIndex, RemovedPlayer);
        }
        InteractionIndex--;
        // [Loop Continue]
        goto J0x21;
    }
    //return;    
}

private final function AddLocalPlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689], InsertIndex;

    InsertIndex = -1;
    // End:0x79
    if(NewPlayer != none)
    {
        InsertIndex = Outer.GamePlayers.Length;
        Outer.GamePlayers[InsertIndex] = NewPlayer;
    }
    return InsertIndex;
    //return ReturnValue;    
}

private final function RemoveLocalPlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ExistingPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689], Index;

    Index = Outer.GamePlayers.Find(ExistingPlayer);    
    // End:0x72
    if(Index != -1)
    {
        Outer.GamePlayers.Remove(Index, 1);        
    }
    return Index;
    //return ReturnValue;    
}

event SetProgressMessage()
{
    local /*0x35EA0000-0x00000000*/ private byte MessageType[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Message[8388609], Title;
    local /*0x35EA0000-0x00000000*/ private bool bIgnoreFutureNetworkMessages[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL WI;

    WI = Class'Engine'.static.GetCurrentWorldInfo();
    // End:0x4C
    if(int(MessageType) == int(0))
    {
        ClearProgressMessages();        
    }
    else
    {
        // End:0x14F
        if((int(MessageType) == int(4)) || int(MessageType) == int(7))
        {
            // End:0xD7
            if(((WI != none) && int(WI.NetMode) == int(NM_Client)) && WI.BeginHostMigration())
            {                
            }
            else
            {
                // End:0x14C
                if(!Outer.GamePlayers[0].Actor.bIgnoreNetworkMessages)
                {
                    NotifyConnectionError(MessageType, Message, Title);
                }
            }            
        }
        else
        {
            // End:0x1D8
            if(int(MessageType) == int(6))
            {
                Outer.GamePlayers[0].Actor.bIgnoreNetworkMessages = false;
                NotifyConnectionError(MessageType, Message, Title);                
            }
            else
            {
                // End:0x215
                if(Title != "")
                {
                    ProgressMessage[0] = Title;
                    ProgressMessage[1] = Message;                    
                }
                else
                {
                    ProgressMessage[1] = "";
                    ProgressMessage[0] = Message;
                }
            }
        }
    }
    // End:0x2DE
    if(!Outer.GamePlayers[0].Actor.bIgnoreNetworkMessages)
    {
        Outer.GamePlayers[0].Actor.bIgnoreNetworkMessages = bIgnoreFutureNetworkMessages;
    }
    //return;    
}

function NotifyConnectionError()
{
    local /*0x35EA0000-0x00000000*/ private byte MessageType[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Message[9437185], Title;
    local /*0x35EA0000-0x00000000*/ private @NULL WI;

    Localize("Errors", "ConnectionFailed", "Engine");
    Localize("Errors", "ConnectionFailed_Title", "Engine");
    WI = Class'Engine'.static.GetCurrentWorldInfo();
    // End:0x134
    if(int(WI.NetMode) != int(NM_Standalone))
    {
        // End:0x112
        if(WI.Game != none)
        {
            WI.Game.bHasNetworkError = true;
        }        
        ConsoleCommand("start ?failed");
    }
    //return;    
}

exec event SetProgressTime()
{
    local /*0x35EA0000-0x00000000*/ private float T[8388609];

    ProgressTimeOut = T + Class'Engine'.static.GetCurrentWorldInfo().TimeSeconds;
    //return;    
}

exec function ClearProgressMessages()
{
    local /*0x35EA0000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x3F [Loop If]
    if(I < 2)
    {
        ProgressMessage[I] = "";
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

// Export UGameViewportClient::execGetPlayerOwner(FFrame&, void* const)
native final function GetPlayerOwner()
{
    local /*0x35EA0000-0x00000000*/ private int PlayerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UGameViewportClient::execFixupOwnerReferences(FFrame&, void* const)
native final function FixupOwnerReferences()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array IDMappings[8388609];


}

function OnPrimaryPlayerSwitch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OldPrimaryPlayer[8388609], NewPrimaryPlayer;

    //return;    
}

function BecomePrimaryPlayer()
{
    local /*0x35EA0000-0x00000000*/ private int PlayerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array OtherPlayers;
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerOwner, NextPlayer, OriginalPrimaryPlayer;
    local /*0x35EA0000-0x00000000*/ private int NumPlayersRemoved, I, Count;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array IDMappings;

    // End:0x3E9
    if(((UIController != none) && PlayerIndex > 0) && PlayerIndex < UIController.GetPlayerCount())
    {
        OriginalPrimaryPlayer = GetPlayerOwner(0);
        PlayerOwner = GetPlayerOwner(PlayerIndex);
        // End:0x92
        if(PlayerOwner == none)
        {
            return;
        }
        // End:0x350
        if(PlayerOwner != none)
        {
            NextPlayer = OriginalPrimaryPlayer;
            NumPlayersRemoved = 0;
            J0xBF:

            // End:0x195 [Loop If]
            if((NextPlayer != none) && NextPlayer != PlayerOwner)
            {
                UIController.NotifyPlayerRemoved(0, NextPlayer);
                UIController.Outer.Outer.GamePlayers.Remove(0, 1);                
                OtherPlayers.AddItem(NextPlayer);                
                NextPlayer = GetPlayerOwner(0);
                NumPlayersRemoved++;
                // [Loop Continue]
                goto J0xBF;
            }
            I = 0;
            J0x1A0:

            // End:0x226 [Loop If]
            if(I < UIController.Outer.Outer.GamePlayers.Length)
            {
                IDMappings.AddItem(I + NumPlayersRemoved);                
                I++;
                // [Loop Continue]
                goto J0x1A0;
            }
            Count = 0;
            J0x231:

            // End:0x350 [Loop If]
            if(OtherPlayers.Length > 0)
            {
                NextPlayer = OtherPlayers[0];
                UIController.Outer.Outer.GamePlayers.AddItem(NextPlayer);                
                UIController.NotifyPlayerAdded(UIController.Outer.Outer.GamePlayers.Length - 1, NextPlayer);
                OtherPlayers.Remove(0, 1);                
                IDMappings.AddItem(Count);                
                Count++;
                // [Loop Continue]
                goto J0x231;
            }
        }
        NextPlayer = GetPlayerOwner(0);
        // End:0x3E9
        if(OriginalPrimaryPlayer != NextPlayer)
        {
            LayoutPlayers();
            FixupOwnerReferences(IDMappings);
            NextPlayer.Actor.ReloadProfileSettings();
            OnPrimaryPlayerSwitch(OriginalPrimaryPlayer, NextPlayer);
        }
    }
    //return;    
}

// Export UGameViewportClient::execDebugSetUISystemEnabled(FFrame&, void* const)
native function DebugSetUISystemEnabled()
{
    local /*0x35EA0000-0x00000000*/ private bool bOldUISystemActive[8388609], bGFxUISystemActive;


}

simulated event SetHardwareMouseCursorVisibility()
{
    local /*0x35EA0000-0x00000000*/ private bool bIsVisible[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ViewportSize;

    // End:0x83
    if(bIsVisible && !bDisplayHardwareMouseCursor)
    {
        GetViewportSize(ViewportSize);
        SetMouse(int(ViewportSize.X / float(2)), int(ViewportSize.Y / float(2)));
    }
    bDisplayHardwareMouseCursor = bIsVisible;
    ForceUpdateMouseCursor(true);
    //return;    
}

defaultproperties
{
    UIControllerClass=Class'UIInteraction'
    LoadingMessage="LOADING"
    SavingMessage="SAVING"
    ConnectingMessage="CONNECTING"
    PausedMessage="PAUSED"
    PrecachingMessage="PRECACHING"
    bRenderSubtitlesAfterFullscreenScaleformMovies=true
    bIntegrateButtonSubSamples=true
    TitleSafeZone=(MaxPercentX=0.9000000,MaxPercentY=0.9000000,RecommendedPercentX=0.8000000,RecommendedPercentY=0.8000000)
    SplitscreenInfo=/* Array type was not detected. */
    Default2PSplitType=ESplitScreenType.eSST_2P_HORIZONTAL
    Default3PSplitType=ESplitScreenType.eSST_3P_FAVOR_TOP
    ProgressTimeOut=8.0000000
    ProgressFadeTime=1.0000000
}