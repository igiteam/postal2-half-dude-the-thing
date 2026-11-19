class LPHUD extends SPHUDGFx
    transient
    config(UI)
    hidecategories(AnimDependency,Navigation);

enum EHUDMessageLayerID
{
    EHML_MissionFailed,             // 0
    EHML_Tutorial,                  // 1
    EHML_Struggle,                  // 2
    EHML_QuestObjectiveProgress,    // 3
    EHML_Scrap,                     // 4
    EHML_TapIn,                     // 5
    EHML_Bomb,                      // 6
    EHML_PerkDeployment,            // 7
    EHML_MeleeTakedown,             // 8
    EHML_MeleeStomp,                // 9
    EHML_Revive,                    // 10
    EHML_Repair,                    // 11
    EHML_Pickup,                    // 12
    EHML_GeneralInteractionObject,  // 13
    EHML_TPost,                     // 14
    EHML_CourierItem,               // 15
    EHML_HackDeployable,            // 16
    EHML_FastTravel,                // 17
    EHML_ExitPoint,                 // 18
    EHML_MunitionsLocker,           // 19
    EHML_PlatformMode,              // 20
    EHML_RotateVS,                  // 21
    EHML_EnterVS,                   // 22
    EHML_WeaponPickup,              // 23
    EHML_ExitVS,                    // 24
    EHML_ExitVSKingCrab,            // 25
    EHML_MAX                        // 26
};

enum HUDDisplayStates
{
    EHUDDisplayState_VS_Unknown,    // 0
    EHUDDisplayState_VS,            // 1
    EHUDDisplayState_POF_InUmbilicalRange,// 2
    EHUDDisplayState_POF_InBetweenUmbilicalRange,// 3
    EHUDDisplayState_POF_OutUmbilicalRange,// 4
    EHUDDisplayState_MAX            // 5
};

struct native HUDMessageMessageLayerEntry
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MessageId;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToNextCheckFunc;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte LayerID;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedMessage;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DisplayTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> CheckFunc;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplayTextBox;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OffsetWidth;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OffsetHeight;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL UIElementInfo;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedHeaderMessage;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ModeString;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MessageSound;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string SubModeString;

    structdefaultproperties
    {
        MessageId=0
        TimeToNextCheckFunc=0.0000000
        LayerID=EHUDMessageLayerID.EHML_MissionFailed
        LocalizedMessage=""
        DisplayTime=0.0000000
        CheckFunc=None
        bDisplayTextBox=false
        OffsetWidth=0.0000000
        OffsetHeight=0.0000000
        UIElementInfo=(UIElementClass=none,UIElementButtonDisplay=none,InputCalloutMarkupString="",UIElementOffSetXScreenWidthPct=0.0000000,UIElementOffSetYScreenHeightPct=0.0000000)
        LocalizedHeaderMessage=""
        ModeString=""
        MessageSound=none
        SubModeString=""
    }
};

struct native VSEnvironmentalMessageInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MessageEndTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Action;

    structdefaultproperties
    {
        MessageEndTime=0.0000000
        Action=none
    }
};

struct native VSIncomingMessageInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIncomingMessage;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIncomingMessageClicked;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIncomingMessageTimedOut;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVideoMessagePlaying;

    structdefaultproperties
    {
        bIncomingMessage=false
        bIncomingMessageClicked=false
        bIncomingMessageTimedOut=false
        bVideoMessagePlaying=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPGFxMovie[536870913];
var(0.25_Pct_15663103) /*0x97E50000-0x00000000*/ private @NULL VSHUD_Panels[2];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVSHUD_Panels_Created;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFutureVSHUD_Panels_Created;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUmbilicalRangeInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWeaponInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowGFxDebug;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNoGRI;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowRadarInMP[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOwnerHasScopedWeapon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisableHUDDamageEffects;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVSHUDHidden;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldUpdateTemperature;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWinLossSplashShown;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHUDMessagesAsleep;
var(0.25_Pct_15728639) /*0x97E50000-0x00000000*/ private @NULL VSFutureHUD_Panels[2];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentDisplayedTemperature;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DirectionalDamageTimeoutTime[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float VSDirectionalDamageTimeoutTime[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float VSInstrumentDamageTimeoutTime[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SixthSenseDamageInterruptTime[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HullIntegrityTimeoutTime[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IncomingMessageTimeoutTime[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DpadClusterTimeoutTime[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AwardTimeoutTime[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ObjectiveCompleteMessageTimeoutTime[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MusicPlayerTimeoutTime[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSEnvironmentalMessage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte HUDDisplayState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSIncomingMessage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NotificationGFxFlashMovie[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class NotificationGFxFlashMovieClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPGFxMoviePlayerScoreboardInstance[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPHUDFont1;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string LastActiveScopeType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ObjectiveUnlockedSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ObjectiveCompleteSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ShowVSRadioMsgRefCount[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL MessageLayerManager[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int VSEnvironmentalMessageID;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InteractiveUnlockMovieInstance[536870913];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnHUDMessageConditionCheck__Delegate;

// Export ULPHUD::execSetScreenResolution(FFrame&, void* const)
native function SetScreenResolution()
{
    local /*0x97E50000-0x00000000*/ private int ResX[8388609], ResY;
    local /*0x97E50000-0x00000000*/ private bool bFullScreen[8388609];


}

// Export ULPHUD::execGetProjectedPosAndScale(FFrame&, void* const)
native function GetProjectedPosAndScale()
{
    local /*0x97E50000-0x00000000*/ private @NULL pos[25296897], Pos2D;
    local /*0x97E50000-0x00000000*/ private float Scale[25165825];


}

// Export ULPHUD::execCreateGrapplePoint(FFrame&, void* const)
native final function CreateGrapplePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrapplePoint[8388609];


}

// Export ULPHUD::execStopGrapplePoint(FFrame&, void* const)
native final function StopGrapplePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrapplePoint[8388609];


}

// Export ULPHUD::execSetGrapplePointValid(FFrame&, void* const)
native final function SetGrapplePointValid()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrapplePoint[8388609];
    local /*0x97E50000-0x00000000*/ private bool bValid[8388609];


}

// Export ULPHUD::execRemoveAllGrapplePoints(FFrame&, void* const)
native final function RemoveAllGrapplePoints();

// Export ULPHUD::execVSHUDInstrumentDamageIsActive(FFrame&, void* const)
native final function VSHUDInstrumentDamageIsActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPHUD::execGetVSJobLogFocused(FFrame&, void* const)
native final function GetVSJobLogFocused()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPHUD::execGetVSJobLogFocusedTime(FFrame&, void* const)
native final function GetVSJobLogFocusedTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

delegate OnHUDMessageConditionCheck()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

simulated event PostBeginPlay()
{
    MessageLayerManager.InitManager(self);
    super.PostBeginPlay();
    //return;    
}

function SetDisplayState()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];

    HUDDisplayState = NewState;
    //return;    
}

function GetDisplayState()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return HUDDisplayState;
    //return ReturnValue;    
}

function CreateHUDMovie()
{
    local /*0x97E50000-0x00000000*/ private @NULL P;
    local /*0x97E50000-0x00000000*/ private bool bShowRadar;
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    SetDisplayState(2);
    bUmbilicalRangeInitialized = false;
    super.CreateHUDMovie();
    bShowRadar = ShouldDisplayRadar();
    MyLPGFxMovie = LPGFxMoviePlayerHUD(GetHUDMovieReference());
    // End:0x101
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.myHUD = self;
        MyLPGFxMovie.SetMasterDisplaySwitchRadar(bShowRadar);
        MyLPGFxMovie.ShowRadar(bShowRadar);
        // End:0x101
        if(bOwnerHasScopedWeapon)
        {
            MyLPGFxMovie.LoadScope();
        }
    }
    InitPauseMenu();
    P = PlayerOwner.Pawn;
    // End:0x16A
    if(P != none)
    {
        ChangedWeapon(P.Weapon);
    }
    PC = LPPlayerController(PlayerOwner);
    // End:0x1DD
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        // End:0x1DD
        if(PC.bAlwaysDisplayDPAD)
        {
            ShowDPadCluster(true, false);
        }
    }
    //return;    
}

private final simulated function DisplayHUDMessage()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string strLocalizedMessage[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForceDisplay[8388609];
    local /*0x97E50000-0x00000000*/ private float fDisplayTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDisplayTextBox[9437185];
    local /*0x97E50000-0x00000000*/ private float OffsetWidth[9437185], OffsetHeight;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL UIElementInfo[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize string strLocalizedHeaderMessage[9437185], ModeString;
    local /*0x97E50000-0x00000000*/ private @NULL MessageSound[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize string SubModeString[9437185];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Format;
    local /*0x97E50000-0x00000000*/ private editfixedsize array InputAliases;
    local /*0x97E50000-0x00000000*/ private int MessageId;
    local /*0x97E50000-0x00000000*/ private bool bQueueMessage;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL QueueMessage;

    true
    0.0000000
    0.2500000    
    ""
    "Normal"
    none
    ""
    // End:0xA6
    if(((ModeString == "MissionObjective") || ModeString == "MissionComplete") || ModeString == "LocationDiscovered")
    {
        bQueueMessage = true;
    }
    // End:0x109
    if((GFxFlashMovieInstanceKismetMessage != none) && GFxFlashMovieInstanceKismetMessage.IsGameMsgVisible())
    {
        // End:0x109
        if(!bQueueMessage)
        {
            // End:0x103
            if(bForceDisplay)
            {
                CloseKismetMessageScene(false);                
            }
            else
            {
                return -1;
            }
        }
    }
    // End:0x134
    if(GFxFlashMovieInstanceKismetMessage == none)
    {
        GFxFlashMovieInstanceKismetMessage = SPGFxMoviePlayerHUD(GFxFlashMovieInstance);
    }
    Format.bDisplayTextBox = bDisplayTextBox;
    Format.OffSetXScreenWidthPct = OffsetWidth;
    Format.OffSetYScreenHeightPct = OffsetHeight;
    Format.MessageMode = name(ModeString);
    Format.MessageSubMode = name(SubModeString);
    // End:0x230
    if(ModeString == "Normal")
    {
        Format.bPlayOutro = false;        
    }
    else
    {
        Format.bPlayOutro = true;
    }
    // End:0x3F7
    if(bQueueMessage)
    {
        // End:0x3F4
        if(GFxFlashMovieInstanceKismetMessage != none)
        {
            InputAliases.Length = 0;
            QueueMessage.MessageString = strLocalizedMessage;
            QueueMessage.HeaderString = strLocalizedHeaderMessage;
            QueueMessage.Format = Format;
            QueueMessage.InputMode = 3;
            QueueMessage.InputAliases = InputAliases;
            QueueMessage.bPauseGameWhileActive = false;
            QueueMessage.bCloseSceneOnInputSuccess = false;
            QueueMessage.fDisplayTime = fDisplayTime;
            QueueMessage.MessageSound = MessageSound;
            MessageId = GFxFlashMovieInstanceKismetMessage.QueueMessage(QueueMessage);
            return MessageId;
        }        
    }
    else
    {
        // End:0x451
        if(fDisplayTime > float(0))
        {
            KismetMessage.MessageEndTime = WorldInfo.TimeSeconds + fDisplayTime;            
        }
        else
        {
            KismetMessage.MessageEndTime = -1.0000000;
        }
        // End:0x50C
        if(GFxFlashMovieInstanceKismetMessage != none)
        {
            MessageId = GFxFlashMovieInstanceKismetMessage.SetUpGameMsgScene(strLocalizedMessage, strLocalizedHeaderMessage, Format, 3, InputAliases, false, false, UIElementInfo);
            // End:0x4FF
            if(MessageId < 0)
            {
                CloseKismetMessageScene();
                return -1;                
            }
            else
            {
                return MessageId;
            }            
        }
        else
        {
            CloseKismetMessageScene();
        }
    }
    return -1;
    //return ReturnValue;    
}

private final simulated event DisplayHUDMessageLayerFromStruct()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL InEntry[25296897];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return DisplayHUDMessage(InEntry.LocalizedMessage, true, InEntry.DisplayTime, InEntry.bDisplayTextBox, InEntry.OffsetWidth, InEntry.OffsetHeight, InEntry.UIElementInfo, InEntry.LocalizedHeaderMessage, InEntry.ModeString, InEntry.MessageSound, InEntry.SubModeString);
    //return ReturnValue;    
}

simulated function DisplayHUDMessageLayer()
{
    local /*0x97E50000-0x00000000*/ private byte LayerID[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string strLocalizedMessage[8388609];
    local /*0x97E50000-0x00000000*/ private float fDisplayTime[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> CheckFunc[9437185];
    local /*0x97E50000-0x00000000*/ private bool bDisplayTextBox[9437185];
    local /*0x97E50000-0x00000000*/ private float OffsetWidth[9437185], OffsetHeight;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL UIElementInfo[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize string strLocalizedHeaderMessage[9437185], ModeString;
    local /*0x97E50000-0x00000000*/ private @NULL MessageSound[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize string SubModeString[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL NewLayer;

    -1.0000000    
    true
    0.0000000
    0.2500000    
    ""
    "Normal"
    none
    ""
    NewLayer.MessageId = -1;
    NewLayer.TimeToNextCheckFunc = 0.0000000;
    NewLayer.LayerID = LayerID;
    NewLayer.LocalizedMessage = strLocalizedMessage;
    NewLayer.DisplayTime = fDisplayTime;
    NewLayer.CheckFunc = CheckFunc;
    NewLayer.bDisplayTextBox = bDisplayTextBox;
    NewLayer.OffsetWidth = OffsetWidth;
    NewLayer.OffsetHeight = OffsetHeight;
    NewLayer.UIElementInfo = UIElementInfo;
    NewLayer.LocalizedHeaderMessage = strLocalizedHeaderMessage;
    NewLayer.ModeString = ModeString;
    NewLayer.MessageSound = MessageSound;
    NewLayer.SubModeString = SubModeString;
    MessageLayerManager.AddMessageLayer(NewLayer);
    //return;    
}

simulated function RemoveMessageLayer()
{
    local /*0x97E50000-0x00000000*/ private byte LayerID[8388609];

    MessageLayerManager.super(LPHUD).RemoveMessageLayer(LayerID);
    //return;    
}

simulated function IsMessageLayerActive()
{
    local /*0x97E50000-0x00000000*/ private byte LayerID[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return MessageLayerManager.super(LPHUD).IsMessageLayerActive(LayerID);
    //return ReturnValue;    
}

simulated function IsMessageLayerTopmost()
{
    local /*0x97E50000-0x00000000*/ private byte LayerID[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return MessageLayerManager.super(LPHUD).IsMessageLayerTopmost(LayerID);
    //return ReturnValue;    
}

exec function SleepHUDMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bSleep[8388609];

    bHUDMessagesAsleep = bSleep;
    // End:0x40
    if(GFxFlashMovieInstanceKismetMessage == none)
    {
        GFxFlashMovieInstanceKismetMessage = SPGFxMoviePlayerHUD(GFxFlashMovieInstance);
    }
    // End:0x78
    if(GFxFlashMovieInstanceKismetMessage != none)
    {
        GFxFlashMovieInstanceKismetMessage.SleepInteractiveMessages(bSleep);
    }
    //return;    
}

simulated event AreHUDMessagesAsleep()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bHUDMessagesAsleep;
    //return ReturnValue;    
}

private final simulated event ClearHUDMessage()
{
    local /*0x97E50000-0x00000000*/ private int MessageId[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    -1
    // End:0x1A
    if(MessageId == 0)
    {
        return false;
    }
    // End:0x8C
    if((MessageId == -1) || (GFxFlashMovieInstanceKismetMessage != none) && GFxFlashMovieInstanceKismetMessage.GameMsgInfo.UniqueMessageID == MessageId)
    {
        CloseKismetMessageScene();
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated event GetCurrentHUDMessageID()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x65
    if((GFxFlashMovieInstanceKismetMessage != none) && GFxFlashMovieInstanceKismetMessage.IsGameMsgVisible())
    {
        return GFxFlashMovieInstanceKismetMessage.GameMsgInfo.UniqueMessageID;
    }
    return -1;
    //return ReturnValue;    
}

protected simulated function ClearKismetMessageData()
{
    local /*0x97E50000-0x00000000*/ private bool bSuccess[9437185];

    false
    super.ClearKismetMessageData(bSuccess);
    //return;    
}

function NotifyHUDMessageIDCleared()
{
    local /*0x97E50000-0x00000000*/ private int InMessageID[8388609];

    MessageLayerManager.NotifyMessageCleared(InMessageID);
    super.NotifyHUDMessageIDCleared(InMessageID);
    //return;    
}

simulated function GetGameMessageUIElementForLayer()
{
    local /*0x97E50000-0x00000000*/ private byte InLayerID[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x38
    if(MessageLayerManager != none)
    {
        return MessageLayerManager.GetGameMessageUIElementForLayer(InLayerID);
    }
    return none;
    //return ReturnValue;    
}

simulated function DisplayMPObjective()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL MessageInfo[8388609];

    MyLPGFxMovie.DisplayMPObjective(MessageInfo);
    //return;    
}

function InitPauseMenu()
{
    // End:0x22
    if(ShouldKeepPauseMenuInMemory())
    {
        CreatePauseMenu();
        ClosePauseMenu();
    }
    //return;    
}

function CreatePauseMenu()
{
    local /*0x97E50000-0x00000000*/ private bool bNoGamePause[9437185];

    super.CreatePauseMenu(bNoGamePause);
    // End:0xA5
    if(ScoreboardIsShown())
    {
        // End:0x9A
        if(PlayerOwner.IsInState('Dead') || PlayerOwner.IsInState('RoundEnded'))
        {
            LPGFxMoviePlayerScoreboard(LPGFxMoviePlayerScoreboardInstance).OnPauseMenuVisible(true);            
        }
        else
        {
            CloseRoundScoreboard(true);
        }
    }
    // End:0xFE
    if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
    {
        VSHUD_Panels[0].MyLPGFxMovie_VS.PauseVideoMessage(true);
    }
    // End:0x18F
    if(MyLPGFxMovie.LoopingUmbilicalAC != none)
    {
        MyLPGFxMovie.LoopingUmbilicalAC.Pause();
        MyLPGFxMovie.LoopingUmbilicalAC.VolumeMultiplier = 0.0000000;
    }
    //return;    
}

function ClosePauseMenu()
{
    super.ClosePauseMenu();
    // End:0x40
    if(ScoreboardIsShown())
    {
        LPGFxMoviePlayerScoreboard(LPGFxMoviePlayerScoreboardInstance).OnPauseMenuVisible(false);
    }
    // End:0x99
    if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
    {
        VSHUD_Panels[0].MyLPGFxMovie_VS.PauseVideoMessage(false);
    }
    // End:0xEB
    if((GFxFlashMovieInstanceKismetMessage != none) && GFxFlashMovieInstanceKismetMessage.IsGameMsgVisible())
    {
        GFxFlashMovieInstanceKismetMessage.ResetPriority();
    }
    // End:0x17C
    if(MyLPGFxMovie.LoopingUmbilicalAC != none)
    {
        MyLPGFxMovie.LoopingUmbilicalAC.Resume();
        MyLPGFxMovie.LoopingUmbilicalAC.VolumeMultiplier = 1.0000000;
    }
    //return;    
}

function ShouldKeepPauseMenuInMemory()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone);
    //return ReturnValue;    
}

function OpenPauseMenuKits()
{
    local /*0x97E50000-0x00000000*/ private @NULL PauseMenuMP;

    PauseMenuMP = LPGFxMoviePlayerPauseMenu_MP(GFxFlashMovieInstancePauseMenu);
    // End:0x4C
    if(PauseMenuMP != none)
    {
        PauseMenuMP.bLoadoutKitsOnly = true;
    }
    CreatePauseMenu();
    //return;    
}

function IsPauseMenuOpen()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x33
    if(GFxFlashMovieInstancePauseMenu != none)
    {
        // End:0x33
        if(GFxFlashMovieInstancePauseMenu.bMovieIsOpen)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function UnloadPauseMenu()
{
    // End:0x7C
    if(GFxFlashMovieInstancePauseMenu != none)
    {
        // End:0x51
        if(SPGFxMoviePlayerViewManager(GFxFlashMovieInstancePauseMenu) != none)
        {
            SPGFxMoviePlayerViewManager(GFxFlashMovieInstancePauseMenu).bUnloadViewsOnClose = true;
        }
        GFxFlashMovieInstancePauseMenu.Close(true);
        GFxFlashMovieInstancePauseMenu = none;
    }
    //return;    
}

function ShouldDisplayRadar()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2C
    if((int(HUDDisplayState) == int(4)) || int(HUDDisplayState) == int(1))
    {
        return false;
    }
    // End:0x69
    if((int(WorldInfo.NetMode) != int(NM_Standalone)) && bShowRadarInMP == false)
    {
        return false;
    }
    // End:0xC8
    if(int(LocalPlayer(PlayerOwner.Player).ViewportClient.GetSplitscreenConfiguration()) != int(0))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function ShouldDisplayWeaponInfoCluster()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !ScoreboardIsShown() && ShouldDisplayHealthInfoCluster();
    //return ReturnValue;    
}

function ShouldDisplayHealthInfoCluster()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x16
    if(int(HUDDisplayState) == int(4))
    {
        return false;
    }
    // End:0x5B
    if((int(HUDDisplayState) == int(1)) && LPPlayerTurretPawn(PlayerOwner.Pawn) == none)
    {
        return false;
    }
    // End:0xBA
    if(int(LocalPlayer(PlayerOwner.Player).ViewportClient.GetSplitscreenConfiguration()) != int(0))
    {
        return false;
    }
    // End:0x1F7
    if((PlayerOwner != none) && PlayerOwner.Pawn != none)
    {
        // End:0x181
        if((PlayerOwner.Pawn.Weapon != none) && SPInventoryWeapon(PlayerOwner.Pawn.Weapon).IsScopeActive())
        {
            return false;
        }
        // End:0x1F7
        if(!PlayerOwner.Pawn.IsAliveAndWell() && !PlayerOwner.Pawn.bHidden)
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

function CreateVSHUDMovie()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    LPP = LPVSPlayerPawn(PlayerOwner.Pawn);
    // End:0x42
    if(LPP == none)
    {
        return;
    }
    LPP.Mesh.ShowMaterialSection(LPP.HUDMaterialIndex, true, 0);
    // End:0xA8
    if(bVSHUD_Panels_Created == true)
    {
        return;
    }
    I = 0;
    J0xB3:

    // End:0x436 [Loop If]
    if(I < 2)
    {
        // End:0x428
        if(LPP.VSHUD_PanelsStaticInfo[I].GFxFlashMovie != none)
        {
            Class'SPGfx.SPGFxMoviePlayer'.static.StartSPGFxMoviePlayer(self, LPP.VSHUD_PanelsStaticInfo[I].GFxFlashMovie, LPP.VSHUD_PanelsStaticInfo[I].GFxFlashMovieInstanceClass, FindLocalPlayerIndex(LocalPlayer(PlayerOwner.Player)), VSHUD_Panels[I].GFxFlashMovieInstance_VS, 0, bClearCaptureKeys, LPP.VSHUD_PanelsStaticInfo[I].RenderTexture, 2);
            VSHUD_Panels[I].GFxFlashMovieInstance_VS.bAllowInput = false;
            VSHUD_Panels[I].GFxFlashMovieInstance_VS.bAllowFocus = false;
            VSHUD_Panels[I].GFxFlashMovieInstance_VS.bCaptureInput = false;
            VSHUD_Panels[I].GFxFlashMovieInstance_VS.Init(LocalPlayer(PlayerOwner.Player));
            VSHUD_Panels[I].MyLPGFxMovie_VS = LPGFxMoviePlayerVSHUD(VSHUD_Panels[I].GFxFlashMovieInstance_VS);
            VSHUD_Panels[I].MyLPGFxMovie_VS.myHUD = self;
            VSHUD_Panels[I].MyLPGFxMovie_VS.SetVisible(false);
        }
        I++;
        // [Loop Continue]
        goto J0xB3;
    }
    bVSHUD_Panels_Created = true;
    //return;    
}

function CreateVSFutureHUDMovie()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    // End:0x12
    if(bFutureVSHUD_Panels_Created == true)
    {
        return;
    }
    LPP = LPVSFuturePlayerPawn(PlayerOwner.Pawn);
    // End:0x54
    if(LPP == none)
    {
        return;
    }
    I = 0;
    J0x5F:

    // End:0x3E2 [Loop If]
    if(I < 2)
    {
        // End:0x3D4
        if(LPP.VSFutureHUD_PanelsStaticInfo[I].GFxFlashMovie != none)
        {
            Class'SPGfx.SPGFxMoviePlayer'.static.StartSPGFxMoviePlayer(self, LPP.VSFutureHUD_PanelsStaticInfo[I].GFxFlashMovie, LPP.VSFutureHUD_PanelsStaticInfo[I].GFxFlashMovieInstanceClass, FindLocalPlayerIndex(LocalPlayer(PlayerOwner.Player)), VSFutureHUD_Panels[I].GFxFlashMovieInstance_VS, 0, bClearCaptureKeys, LPP.VSFutureHUD_PanelsStaticInfo[I].RenderTexture, 2);
            VSFutureHUD_Panels[I].GFxFlashMovieInstance_VS.bAllowInput = false;
            VSFutureHUD_Panels[I].GFxFlashMovieInstance_VS.bAllowFocus = false;
            VSFutureHUD_Panels[I].GFxFlashMovieInstance_VS.bCaptureInput = false;
            VSFutureHUD_Panels[I].GFxFlashMovieInstance_VS.Init(LocalPlayer(PlayerOwner.Player));
            VSFutureHUD_Panels[I].MyLPGFxMovie_VS = LPGFxMoviePlayerVSHUD(VSFutureHUD_Panels[I].GFxFlashMovieInstance_VS);
            VSFutureHUD_Panels[I].MyLPGFxMovie_VS.myHUD = self;
            VSFutureHUD_Panels[I].MyLPGFxMovie_VS.SetVisible(false);
        }
        I++;
        // [Loop Continue]
        goto J0x5F;
    }
    bFutureVSHUD_Panels_Created = true;
    //return;    
}

function RemoveMovies()
{
    local /*0x97E50000-0x00000000*/ private int I;

    super.RemoveMovies();
    I = 0;
    J0x15:

    // End:0x128 [Loop If]
    if(I < 2)
    {
        // End:0x11A
        if(VSHUD_Panels[I].GFxFlashMovieInstance_VS != none)
        {
            VSHUD_Panels[I].GFxFlashMovieInstance_VS.RenderTexture = none;
            VSHUD_Panels[I].GFxFlashMovieInstance_VS.EndSPGFxMoviePlayer();
            VSHUD_Panels[I].GFxFlashMovieInstance_VS = none;
            VSHUD_Panels[I].MyLPGFxMovie_VS = none;
        }
        I++;
        // [Loop Continue]
        goto J0x15;
    }
    I = 0;
    J0x133:

    // End:0x246 [Loop If]
    if(I < 2)
    {
        // End:0x238
        if(VSFutureHUD_Panels[I].GFxFlashMovieInstance_VS != none)
        {
            VSFutureHUD_Panels[I].GFxFlashMovieInstance_VS.RenderTexture = none;
            VSFutureHUD_Panels[I].GFxFlashMovieInstance_VS.EndSPGFxMoviePlayer();
            VSFutureHUD_Panels[I].GFxFlashMovieInstance_VS = none;
            VSFutureHUD_Panels[I].MyLPGFxMovie_VS = none;
        }
        I++;
        // [Loop Continue]
        goto J0x133;
    }
    RemoveProceduralMovies();
    MyLPGFxMovie = none;
    bVSHUD_Panels_Created = false;
    bFutureVSHUD_Panels_Created = false;
    //return;    
}

function RemoveProceduralMovies()
{
    RemoveAllGrenadeWarnings();
    RemoveAllBombPoints();
    RemoveAllCourierIcons();
    RemoveAllDisableRepairPoints();
    RemoveAllKillObjectives();
    RemoveAllSeizeControlPoints();
    RemoveAllSnowcatPoints();
    RemoveAllCreditsForDamagePoints();
    RemoveAllMunitionsLockerIcons();
    RemoveAllTENGPoints();
    RemoveAllDNATags();
    RemoveAllGrabPoints();
    RemoveAllGrapplePoints();
    RemoveAllWinchPoints();
    RemoveAllTaserPoints();
    RemoveAllDrillVolumes();
    RemoveAllInteractionPoints();
    RemoveEnhancedRepairBar();
    RemoveAllWeldPoints();
    //return;    
}

function ToggleVSDisplayState()
{
    local /*0x97E50000-0x00000000*/ private bool bIsInVS[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[9437185];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private bool bFutureVS;

    none
    // End:0xF4
    if(bIsInVS)
    {
        bShouldUpdateTemperature = true;
        // End:0x62
        if(PlayerOwner.Pawn.IsA('LPVSFuturePlayerPawn'))
        {
            bFutureVS = true;
        }
        // End:0xB1
        if(LPPlayerTurretPawn(PlayerOwner.Pawn) != none)
        {
            MyLPGFxMovie.EnableTurretReticle();            
        }
        else
        {
            // End:0xCB
            if(bFutureVS)
            {
                CreateVSFutureHUDMovie();                
            }
            else
            {
                CreateVSHUDMovie();
                SetVSReticle("grab");
            }
        }
        SetDisplayState(1);        
    }
    else
    {
        bShouldUpdateTemperature = false;
        // End:0x17C
        if((LPPlayerController(PlayerOwner).ExitVSPawn != none) && LPPlayerController(PlayerOwner).ExitVSPawn.IsA('LPVSFuturePlayerPawn'))
        {
            bFutureVS = true;
        }
        RemoveProceduralMovies();
        SetDisplayState(2);
    }
    // End:0x1D4
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ToggleVSDisplayState(bIsInVS, bFutureVS);
    }
    I = 0;
    J0x1DF:

    // End:0x28B [Loop If]
    if(I < 2)
    {
        // End:0x27D
        if(VSHUD_Panels[I].GFxFlashMovieInstance_VS != none)
        {
            LPGFxMoviePlayerVSHUD(VSHUD_Panels[I].GFxFlashMovieInstance_VS).ToggleVSDisplayState(bIsInVS, bFutureVS, vsPawn);
        }
        I++;
        // [Loop Continue]
        goto J0x1DF;
    }
    I = 0;
    J0x296:

    // End:0x342 [Loop If]
    if(I < 2)
    {
        // End:0x334
        if(VSFutureHUD_Panels[I].GFxFlashMovieInstance_VS != none)
        {
            LPGFxMoviePlayerVSFutureHUD(VSFutureHUD_Panels[I].GFxFlashMovieInstance_VS).ToggleVSDisplayState(bIsInVS, bFutureVS, vsPawn);
        }
        I++;
        // [Loop Continue]
        goto J0x296;
    }
    //return;    
}

function ShowStruggleReticle()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowStruggleReticle(bShow);
    }
    // End:0x7C
    if(bShow && IsTimerActive('HullIntegrityTimeOut'))
    {
        ClearTimer('HullIntegrityTimeOut');
        HullIntegrityTimeOut();
    }
    //return;    
}

function TurnOnStruggleDisplayState()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.TurnOnStruggleDisplayState();
    }
    //return;    
}

function TurnOffStruggleDisplayState()
{
    local /*0x97E50000-0x00000000*/ private bool bResetReticle[9437185];

    // End:0x39
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.TurnOffStruggleDisplayState(bResetReticle);
    }
    //return;    
}

function ToggleStruggleDisplayState()
{
    local /*0x97E50000-0x00000000*/ private bool bStruggleMode[8388609], bReticleHidden;

    true
    // End:0x47
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ToggleStruggleDisplayState(bStruggleMode, bReticleHidden);
    }
    //return;    
}

function SetStruggleReticleProgress()
{
    local /*0x97E50000-0x00000000*/ private float NewTime[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetStruggleReticleProgress(NewTime);
    }
    //return;    
}

function UpdateStruggleModeDirection()
{
    local /*0x97E50000-0x00000000*/ private float AngleDegrees[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.UpdateStruggleModeDirection(AngleDegrees);
    }
    //return;    
}

function ToggleStruggleReticleInRange()
{
    local /*0x97E50000-0x00000000*/ private bool bInRange[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ToggleStruggleReticleInRange(bInRange);
    }
    //return;    
}

exec function ShowVSBootSequence()
{
    // End:0x59
    if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
    {
        VSHUD_Panels[0].MyLPGFxMovie_VS.ShowVSBootSequence();
    }
    //return;    
}

function SetVSReticle()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReticleName[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetVSReticle(ReticleName);
    }
    //return;    
}

function ShowVSGrabIndicator()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowVSGrabIndicator(bShow);
    }
    //return;    
}

function SetVSGrabIndicatorPresure()
{
    local /*0x97E50000-0x00000000*/ private float InValue[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetVSGrabIndicator(InValue);
    }
    //return;    
}

function PlayVSGrabSuccess()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.PlayVSGrabSuccess();
    }
    //return;    
}

function NotifyWinchProjectileRetracting()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.NotifyWinchProjectileRetracting();
    }
    //return;    
}

function NotifyWinchProjectileRetracted()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.NotifyWinchProjectileRetracted();
    }
    //return;    
}

function ShowWinchGear()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL WinchProjectile[9437185];

    // End:0x42
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowWinchGear(bOn, WinchProjectile);
    }
    //return;    
}

function SetMaxWinchDistance()
{
    local /*0x97E50000-0x00000000*/ private float newdist[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetMaxWinchDistance(newdist);
    }
    //return;    
}

function SetVSReticleDrillSpeed()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string SpeedName[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetVSReticleDrillSpeed(SpeedName);
    }
    //return;    
}

function SetVSReticleWelderState()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetVSReticleWelderState(bOn);
    }
    //return;    
}

function SetVSReticleGrabState()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetVSReticleGrabState(bOn);
    }
    //return;    
}

exec function ShowVSReticle_Winch_Tutorial()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowVSReticle_Winch_Tutorial(bOn);
    }
    //return;    
}

exec function ShowVSReticle_LeftArm_Tutorial()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowVSReticle_LeftArm_Tutorial(bOn);
    }
    //return;    
}

exec function ShowVSReticle_ShieldBlock_Tutorial()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowVSReticle_ShieldBlock_Tutorial(bOn);
    }
    //return;    
}

exec function ShowVSReticle_RightArm_Tutorial()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowVSReticle_RightArm_Tutorial(bOn);
    }
    //return;    
}

function SetVSReticleQuickGrab()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetVSReticleQuickGrab();
    }
    //return;    
}

function SetReticleCustomAmmoMode()
{
    local /*0x97E50000-0x00000000*/ private bool bUseCustomMode[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CustomAddColor[9437185], CustomMultiplyColor;

    // End:0x4C
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetReticleCustomAmmoMode(bUseCustomMode, CustomAddColor, CustomMultiplyColor);
    }
    //return;    
}

function SetHalberdReticleChargePercent()
{
    local /*0x97E50000-0x00000000*/ private float ChargePercent[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetHalberdReticleChargePercent(ChargePercent);
    }
    //return;    
}

function SetCrossbowReticleChargePercent()
{
    local /*0x97E50000-0x00000000*/ private float ChargePercent[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetCrossbowReticleChargePercent(ChargePercent);
    }
    //return;    
}

exec function testwinch()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609];

    SetWinchMechanicalError(bSet);
    //return;    
}

exec function testweld()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609];
    local /*0x97E50000-0x00000000*/ private float val[8388609];

    MyLPGFxMovie.SetVSReticle("weld");
    SetVSReticleWelderState(bSet);
    ShowVSReticleWeldCompletionMeter(bSet);
    SetVSReticleWeldProgress(val);
    //return;    
}

exec function testshock()
{
    local /*0x97E50000-0x00000000*/ private bool bReady[8388609], bShow, bShocking;
    local /*0x97E50000-0x00000000*/ private float val[8388609];

    ShowVSReticleShockMeter(bShow);
    SetVSReticleShockHelp(bReady);
    SetVSReticleShockActive(bShocking);
    SetVSReticleShockMeterLevel(val);
    //return;    
}

function SetWinchMechanicalError()
{
    local /*0x97E50000-0x00000000*/ private bool bShowIt[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetWinchMechanicalError(bShowIt);
    }
    //return;    
}

function SetVSReticleWeldProgress()
{
    local /*0x97E50000-0x00000000*/ private float val[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetVSReticleWeldProgress(val);
    }
    //return;    
}

function ShowVSReticleWeldCompletionMeter()
{
    local /*0x97E50000-0x00000000*/ private bool bShowIt[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowVSReticleWeldCompletionMeter(bShowIt);
    }
    //return;    
}

function ShowVSReticleShockMeter()
{
    local /*0x97E50000-0x00000000*/ private bool bShowIt[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowVSReticleShockMeter(bShowIt);
    }
    //return;    
}

function SetVSReticleShockMeterLevel()
{
    local /*0x97E50000-0x00000000*/ private float val[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetVSReticleShockMeterLevel(val);
    }
    //return;    
}

function SetVSReticleShockHelp()
{
    local /*0x97E50000-0x00000000*/ private bool bShowIt[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetVSReticleShockHelp(bShowIt);
    }
    //return;    
}

function SetVSReticleShockActive()
{
    local /*0x97E50000-0x00000000*/ private bool bShowIt[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetVSReticleShockActive(bShowIt);
    }
    //return;    
}

function SetVSReticleShockCharging()
{
    local /*0x97E50000-0x00000000*/ private bool bShowIt[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetVSReticleShockCharging(bShowIt);
    }
    //return;    
}

event UpdateGrabPointForPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL TPawn[8388609];
    local /*0x97E50000-0x00000000*/ private int GrabPointIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL pos[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFirmGrab[8388609], bPlayerIsBusy;
    local /*0x97E50000-0x00000000*/ private name UIElementClassName[8388609];

    // End:0x127
    if(MyLPGFxMovie != none)
    {
        // End:0xA8
        if(UIElementClassName == 'LPGFxUIElementVSWinchPoint')
        {
            MyLPGFxMovie.CreateWinchPointForPawn(TPawn, GrabPointIndex);
            MyLPGFxMovie.UpdateWinchPointForPawn(TPawn, GrabPointIndex, pos, bFirmGrab, bPlayerIsBusy);            
        }
        else
        {
            MyLPGFxMovie.CreateGrabPointForPawn(TPawn, GrabPointIndex);
            MyLPGFxMovie.UpdateGrabPointForPawn(TPawn, GrabPointIndex, pos, bFirmGrab, bPlayerIsBusy);
        }
    }
    //return;    
}

event StopGrabPointForPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL TPawn[8388609];
    local /*0x97E50000-0x00000000*/ private int GrabPointIndex[8388609];
    local /*0x97E50000-0x00000000*/ private name UIElementClassName[8388609];

    // End:0x8B
    if(MyLPGFxMovie != none)
    {
        // End:0x5A
        if(UIElementClassName == 'LPGFxUIElementVSWinchPoint')
        {
            MyLPGFxMovie.StopWinchPointForPawn(TPawn, GrabPointIndex);            
        }
        else
        {
            MyLPGFxMovie.StopGrabPointForPawn(TPawn, GrabPointIndex);
        }
    }
    //return;    
}

event StopAllGrabPoints()
{
    // End:0x4D
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.StopAllGrabPoints();
        MyLPGFxMovie.RemoveAllWinchPoints();
    }
    //return;    
}

function RemoveAllGrabPoints()
{
    //return;    
}

function RemoveAllTaserPoints()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.RemoveAllTaserPoints();
    }
    //return;    
}

function CleanupOrphans()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.CleanupOrphans();
    }
    //return;    
}

function CreateWinchPointReticle()
{
    local /*0x97E50000-0x00000000*/ private @NULL WinchPoint[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.CreateWinchPointReticle(WinchPoint);
    }
    //return;    
}

function UpdateWinchPointForActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPlayerIsBusy[8388609];

    // End:0x41
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.UpdateWinchPointForActor(TheActor, bPlayerIsBusy);
    }
    //return;    
}

function AnyWinchPointActive()
{
    local /*0x97E50000-0x00000000*/ private @NULL inTestActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        return MyLPGFxMovie.AnyWinchPointActive(inTestActor);
    }
    return false;
    //return ReturnValue;    
}

function StopWinchPointReticle()
{
    local /*0x97E50000-0x00000000*/ private @NULL WinchPoint[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.StopWinchPointReticle(WinchPoint);
    }
    //return;    
}

function RemoveAllWinchPoints()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.RemoveAllWinchPoints();
    }
    //return;    
}

function CreateDrillVolumeReticle()
{
    local /*0x97E50000-0x00000000*/ private @NULL DrillVolume[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.CreateDrillVolumeReticle(DrillVolume);
    }
    //return;    
}

function SetDrillVolumeReticleLock()
{
    local /*0x97E50000-0x00000000*/ private @NULL DrillVolume[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLockedOn[8388609], bElementIsLocked;

    // End:0x74
    if(MyLPGFxMovie != none)
    {
        bElementIsLocked = MyLPGFxMovie.GetDrillVolumeLockedOn(DrillVolume);
        MyLPGFxMovie.SetDrillVolumeLockedOn(DrillVolume, bLockedOn);
    }
    // End:0x124
    if(bLockedOn && !bElementIsLocked)
    {
        // End:0xEC
        if(DrillVolume.bUsesDrillArmSwing)
        {
            VSHUD_Panels[0].MyLPGFxMovie_VS.EnableDrillSwingDisplay(true);            
        }
        else
        {
            VSHUD_Panels[0].MyLPGFxMovie_VS.EnableDrillSpinDisplay(true);
        }        
    }
    else
    {
        // End:0x1D1
        if(!bLockedOn && bElementIsLocked)
        {
            // End:0x19C
            if(DrillVolume.bUsesDrillArmSwing)
            {
                VSHUD_Panels[0].MyLPGFxMovie_VS.EnableDrillSwingDisplay(false);                
            }
            else
            {
                VSHUD_Panels[0].MyLPGFxMovie_VS.EnableDrillSpinDisplay(false);
            }
        }
    }
    //return;    
}

function StopDrillVolumeReticle()
{
    local /*0x97E50000-0x00000000*/ private @NULL DrillVolume[8388609];
    local /*0x97E50000-0x00000000*/ private bool bTemporary[9437185], bElementIsLocked;

    // End:0x6B
    if(MyLPGFxMovie != none)
    {
        bElementIsLocked = MyLPGFxMovie.GetDrillVolumeLockedOn(DrillVolume);
        MyLPGFxMovie.StopDrillVolumeReticle(DrillVolume);
    }
    // End:0x12B
    if(bElementIsLocked)
    {
        // End:0x12B
        if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
        {
            // End:0xF6
            if(DrillVolume.bUsesDrillArmSwing)
            {
                VSHUD_Panels[0].MyLPGFxMovie_VS.EnableDrillSwingDisplay(false);                
            }
            else
            {
                VSHUD_Panels[0].MyLPGFxMovie_VS.EnableDrillSpinDisplay(false);
            }
        }
    }
    //return;    
}

function RemoveAllDrillVolumes()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.RemoveAllDrillPoints();
    }
    //return;    
}

function CreateInteractionReticle()
{
    local /*0x97E50000-0x00000000*/ private @NULL InteractionPoint[8388609];

    // End:0xFA
    if(MyLPGFxMovie != none)
    {
        switch(InteractionPoint.UIElementType)
        {
            // End:0x67
            case 0:
                MyLPGFxMovie.CreateInteractionReticle(InteractionPoint);
                // End:0xFA
                break;
            // End:0x97
            case 1:
                MyLPGFxMovie.CreateWeldReticle(InteractionPoint);
                // End:0xFA
                break;
            // End:0xC7
            case 2:
                MyLPGFxMovie.CreateDrillVolumeReticle(InteractionPoint);
                // End:0xFA
                break;
            // End:0xF7
            case 3:
                MyLPGFxMovie.CreateTaserReticle(InteractionPoint);
                // End:0xFA
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        //return;        
    }
}

function StopInteractionReticle()
{
    local /*0x97E50000-0x00000000*/ private @NULL InteractionPoint[8388609];

    // End:0xFA
    if(MyLPGFxMovie != none)
    {
        switch(InteractionPoint.UIElementType)
        {
            // End:0x67
            case 0:
                MyLPGFxMovie.StopInteractionReticle(InteractionPoint);
                // End:0xFA
                break;
            // End:0x97
            case 1:
                MyLPGFxMovie.StopWeldReticle(InteractionPoint);
                // End:0xFA
                break;
            // End:0xC7
            case 2:
                MyLPGFxMovie.StopDrillVolumeReticle(InteractionPoint);
                // End:0xFA
                break;
            // End:0xF7
            case 3:
                MyLPGFxMovie.StopTaserReticle(InteractionPoint);
                // End:0xFA
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        //return;        
    }
}

function RemoveAllInteractionPoints()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.RemoveAllInteractionPoints();
    }
    //return;    
}

function RemoveAllWeldPoints()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.RemoveAllWeldPoints();
    }
    //return;    
}

function PickedUpThermalEnergy()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.PickedUpThermalEnergy();
    }
    //return;    
}

function ShouldShowGrenadeWarnings()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldShowTENGPoints()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ShouldShowCourierItems()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ShouldShowSeizeControlObjectives()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ShouldShowDisableRepairObjectives()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ShouldShowBombObjectives()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ShouldShowKillObjectives()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ShouldShowSnowcatObjectives()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function CreateTENGPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL TEP[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.CreateTENGPoint(TEP);
    }
    //return;    
}

function StopTENGPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL TEP[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.StopTENGPoint(TEP);
    }
    //return;    
}

function RemoveAllTENGPoints()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.RemoveAllTENGPoints();
    }
    //return;    
}

function TENGPostChangedOwner()
{
    local /*0x97E50000-0x00000000*/ private @NULL TEP[8388609], Post;
    local /*0x97E50000-0x00000000*/ private int OwningTeam[9437185];

    -1
    // End:0x52
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.TENGPostChangedOwner(TEP, Post, OwningTeam);
    }
    //return;    
}

function TENGPostDeploying()
{
    local /*0x97E50000-0x00000000*/ private @NULL TEP[8388609], Post;
    local /*0x97E50000-0x00000000*/ private int OwningTeam[9437185];

    -1
    // End:0x52
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.TENGPostDeploying(TEP, Post, OwningTeam);
    }
    //return;    
}

function TENGPostRetracting()
{
    local /*0x97E50000-0x00000000*/ private @NULL TEP[8388609], Post;
    local /*0x97E50000-0x00000000*/ private int OwningTeam[9437185];

    -1
    // End:0x52
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.TENGPostRetracting(TEP, Post, OwningTeam);
    }
    //return;    
}

function TENGPostTookDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL TEP[8388609], Post;

    // End:0x40
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.TENGPostTookDamage(TEP, Post);
    }
    //return;    
}

function CreateDNATag()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.CreateDNATag(A);
    }
    //return;    
}

function StopDNATag()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.StopDNATag(A);
    }
    //return;    
}

function RemoveAllDNATags()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.RemoveAllDNATags();
    }
    //return;    
}

function CreateMunitionsLockerIcon()
{
    local /*0x97E50000-0x00000000*/ private @NULL MunitionsLocker[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.CreateMunitionsLockerIcon(MunitionsLocker);
    }
    //return;    
}

function StopMunitionsLockerIcon()
{
    local /*0x97E50000-0x00000000*/ private @NULL MunitionsLocker[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.StopMunitionsLockerIcon(MunitionsLocker);
    }
    //return;    
}

function RemoveAllMunitionsLockerIcons()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.RemoveAllMunitionsLockerIcons();
    }
    //return;    
}

function CreateGrenadeWarning()
{
    local /*0x97E50000-0x00000000*/ private @NULL Grenade[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.CreateGrenadeWarning(Grenade);
    }
    //return;    
}

function StopGrenadeWarning()
{
    local /*0x97E50000-0x00000000*/ private @NULL Grenade[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.StopGrenadeWarning(Grenade);
    }
    //return;    
}

function RemoveExpiredGrenadeWarnings()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.RemoveExpiredGrenadeWarnings();
    }
    //return;    
}

function RemoveAllGrenadeWarnings()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.RemoveAllGrenadeWarnings();
    }
    //return;    
}

function CreateCourierIcon()
{
    local /*0x97E50000-0x00000000*/ private @NULL CourierItem[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.CreateCourierIcon(CourierItem);
    }
    //return;    
}

function StopCourierIcon()
{
    local /*0x97E50000-0x00000000*/ private @NULL CourierItem[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.StopCourierIcon(CourierItem);
    }
    //return;    
}

function CourierItemChangedState()
{
    local /*0x97E50000-0x00000000*/ private @NULL CourierItem[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.CourierItemChangedState(CourierItem);
    }
    //return;    
}

function RemoveAllCourierIcons()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.RemoveAllCourierIcons();
    }
    //return;    
}

function CreateSeizeControlPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL SCObjective[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.CreateSeizeControlPoint(SCObjective);
    }
    //return;    
}

function StopSeizeControlPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL SCObjective[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.StopSeizeControlPoint(SCObjective);
    }
    //return;    
}

function SeizeControlPointChangedState()
{
    local /*0x97E50000-0x00000000*/ private @NULL SCObjective[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SeizeControlPointChangedState(SCObjective);
    }
    //return;    
}

function SeizeControlPointChangedTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL SCObjective[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsTouching[8388609];

    // End:0x41
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SeizeControlPointChangedTouch(SCObjective, bIsTouching);
    }
    //return;    
}

function RemoveAllSeizeControlPoints()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.RemoveAllSeizeControlPoints();
    }
    //return;    
}

function CreateDisableRepairPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL DRObjective[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.CreateDisableRepairPoint(DRObjective);
    }
    //return;    
}

function StopDisableRepairPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL DRObjective[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.StopDisableRepairPoint(DRObjective);
    }
    //return;    
}

function DisableRepairPointChangedState()
{
    local /*0x97E50000-0x00000000*/ private @NULL DRObjective[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.DisableRepairPointChangedState(DRObjective);
    }
    //return;    
}

function RemoveAllDisableRepairPoints()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.RemoveAllDisableRepairPoints();
    }
    //return;    
}

function CreateKillObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL KillObjective[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.CreateKillObjective(KillObjective);
    }
    //return;    
}

function StopKillObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL KillObjective[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.StopKillObjective(KillObjective);
    }
    //return;    
}

function RemoveAllKillObjectives()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.RemoveAllKillObjectives();
    }
    //return;    
}

function CreateBombPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL BombActor[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.CreateBombPoint(BombActor);
    }
    //return;    
}

function StopBombPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL BombActor[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.StopBombPoint(BombActor);
    }
    //return;    
}

function BombPointChangedState()
{
    local /*0x97E50000-0x00000000*/ private @NULL BombActor[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.BombPointChangedState(BombActor);
    }
    //return;    
}

function RemoveAllBombPoints()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.RemoveAllBombPoints();
    }
    //return;    
}

function CreateSnowcatPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL SCObjective[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.CreateSnowcatPoint(SCObjective);
    }
    //return;    
}

function StopSnowcatPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL SCObjective[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.StopSnowcatPoint(SCObjective);
    }
    //return;    
}

function SnowcatPointChangedState()
{
    local /*0x97E50000-0x00000000*/ private @NULL SCObjective[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SnowcatPointChangedState(SCObjective);
    }
    //return;    
}

function RemoveAllSnowcatPoints()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.RemoveAllSnowcatPoints();
    }
    //return;    
}

event CreateCreditsForDamagePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL DamagedActor[8388609];
    local /*0x97E50000-0x00000000*/ private int CreditAmount[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsKillShot[8388609];

    // End:0x4A
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.CreateCreditsForDamagePoint(DamagedActor, CreditAmount, bIsKillShot);
    }
    //return;    
}

function StopCreditsForDamagePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL DamagedActor[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.StopCreditsForDamagePoint(DamagedActor);
    }
    //return;    
}

function RemoveAllCreditsForDamagePoints()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.RemoveAllCreditsForDamagePoints();
    }
    //return;    
}

function CreateEnhancedRepairBar()
{
    local /*0x97E50000-0x00000000*/ private @NULL RepairActor[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.CreateEnhancedRepairBar(RepairActor);
    }
    //return;    
}

function StopEnhancedRepairBar()
{
    local /*0x97E50000-0x00000000*/ private @NULL RepairActor[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.StopEnhancedRepairBar(RepairActor);
    }
    //return;    
}

function RemoveEnhancedRepairBar()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.RemoveEnhancedRepairBar();
    }
    //return;    
}

event Destroyed()
{
    // End:0x3A
    if(LPGFxMoviePlayerScoreboardInstance != none)
    {
        LPGFxMoviePlayerScoreboardInstance.Close(true);
        LPGFxMoviePlayerScoreboardInstance = none;
    }
    RemoveProceduralMovies();
    MyLPGFxMovie = none;
    UnloadPauseMenu();
    super.Destroyed();
    //return;    
}

function DrawHUD()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private float DeltaTime;

    DeltaTime = WorldInfo.DeltaSeconds;
    // End:0x5F
    if(MessageLayerManager != none)
    {
        MessageLayerManager.Tick(DeltaTime);
    }
    super.DrawHUD();
    // End:0xD9
    if(!bWeaponInitialized)
    {
        // End:0xD9
        if(PlayerOwner.Pawn != none)
        {
            ChangedWeapon(PlayerOwner.Pawn.Weapon);
        }
    }
    // End:0x157
    if(!IsVSEnvironmentalMessageDone())
    {
        // End:0x157
        if((VSEnvironmentalMessage.MessageEndTime > float(0)) && VSEnvironmentalMessage.MessageEndTime <= WorldInfo.TimeSeconds)
        {
            CloseVSEnvironmentalMessageScene();
        }
    }
    // End:0x2A6
    if(bShowingGFxHUD)
    {
        I = 0;
        J0x16F:

        // End:0x1FE [Loop If]
        if(I < 2)
        {
            // End:0x1F0
            if(VSHUD_Panels[I].MyLPGFxMovie_VS != none)
            {
                VSHUD_Panels[I].MyLPGFxMovie_VS.Update(DeltaTime);
            }
            I++;
            // [Loop Continue]
            goto J0x16F;
        }
        I = 0;
        J0x209:

        // End:0x298 [Loop If]
        if(I < 2)
        {
            // End:0x28A
            if(VSFutureHUD_Panels[I].MyLPGFxMovie_VS != none)
            {
                VSFutureHUD_Panels[I].MyLPGFxMovie_VS.Update(DeltaTime);
            }
            I++;
            // [Loop Continue]
            goto J0x209;
        }
        // End:0x2A6
        if(true)
        {
            UpdateDisplayedTemperature();
        }
    }
    // End:0x2DB
    if(ScoreboardIsShown())
    {
        LPGFxMoviePlayerScoreboard(LPGFxMoviePlayerScoreboardInstance).UpdateTables();
    }
    // End:0x31B
    if(InteractiveUnlockMovieInstance != none)
    {
        LPGFxInteractiveMoviePlayer(InteractiveUnlockMovieInstance).Tick(DeltaTime);
    }
    //return;    
}

function UpdateDisplayedTemperature()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC;
    local /*0x97E50000-0x00000000*/ private float DeltaTime;

    PC = LPPlayerController(PlayerOwner);
    DeltaTime = WorldInfo.DeltaSeconds;
    // End:0x147
    if(!PC.IsPaused())
    {
        // End:0x147
        if(CurrentDisplayedTemperature != PC.CurrentAmbientTemperature)
        {
            // End:0xE5
            if(PC.AmbientTemperatureChangeRate <= float(0))
            {
                CurrentDisplayedTemperature = PC.CurrentAmbientTemperature;                
            }
            else
            {
                CurrentDisplayedTemperature = FInterpConstantTo(CurrentDisplayedTemperature, PC.CurrentAmbientTemperature, DeltaTime, PC.AmbientTemperatureChangeRate);
            }
        }
    }
    //return;    
}

exec function SetScreenRes()
{
    local /*0x97E50000-0x00000000*/ private int X[8388609], Y;
    local /*0x97E50000-0x00000000*/ private bool bFullScreen[8388609];

    SetScreenResolution(X, Y, bFullScreen);
    //return;    
}

function SetVSEmp()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetVSReticleDamage();
    }
    //return;    
}

function ClearVSEmp()
{
    //return;    
}

function UpdateVSUmbilicalRange()
{
    local /*0x97E50000-0x00000000*/ private float PercentOfUmbilicalReached[8388609];
    local /*0x97E50000-0x00000000*/ private bool bEMPOverride[9437185];
    local /*0x97E50000-0x00000000*/ private byte OldState;

    OldState = GetDisplayState();
    // End:0xCE
    if((int(WorldInfo.NetMode) != int(NM_Standalone)) && !bEMPOverride)
    {
        SetDisplayState(2);
        // End:0xCB
        if((bUmbilicalRangeInitialized == false) || int(OldState) != int(GetDisplayState()))
        {
            // End:0xCB
            if(MyLPGFxMovie != none)
            {
                MyLPGFxMovie.SetUmbilicalRangeDisplayState(GetDisplayState(), OldState, true);
            }
        }        
    }
    else
    {
        // End:0xF0
        if(PercentOfUmbilicalReached >= 1.0000000)
        {
            SetDisplayState(4);            
        }
        else
        {
            // End:0x121
            if((PercentOfUmbilicalReached > 0.9000000) || bEMPOverride)
            {
                SetDisplayState(3);                
            }
            else
            {
                SetDisplayState(2);
            }
        }
        // End:0x1A6
        if((bUmbilicalRangeInitialized == false) || int(OldState) != int(GetDisplayState()))
        {
            // End:0x1A6
            if(MyLPGFxMovie != none)
            {
                MyLPGFxMovie.SetUmbilicalRangeDisplayState(GetDisplayState(), OldState, bEMPOverride);
            }
        }
    }
    // End:0x20F
    if((int(WorldInfo.NetMode) != int(NM_Standalone)) && !bShowRadarInMP)
    {
        // End:0x20F
        if(MyLPGFxMovie != none)
        {
            MyLPGFxMovie.ShowRadar(false);
        }
    }
    bUmbilicalRangeInitialized = true;
    //return;    
}

function SetDirectionalDamage()
{
    local /*0x97E50000-0x00000000*/ private float AngleInDegrees[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetDirectionalDamage(AngleInDegrees);
    }
    ClearTimer('DirectionalDamageTimeOut');
    SetTimer(DirectionalDamageTimeoutTime, false, 'DirectionalDamageTimeOut');
    //return;    
}

function SetSixthSenseWarning()
{
    local /*0x97E50000-0x00000000*/ private float AngleInDegrees[8388609];
    local /*0x97E50000-0x00000000*/ private bool bShowWarning;

    bShowWarning = !IsTimerActive('DirectionalDamageTimeOut');
    // End:0x7E
    if(!bShowWarning && GetTimerCount('DirectionalDamageTimeOut') >= SixthSenseDamageInterruptTime)
    {
        ClearTimer('DirectionalDamageTimeOut');
        DirectionalDamageTimeOut();
        bShowWarning = true;
    }
    // End:0xC4
    if(bShowWarning && MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetSixthSenseWarning(AngleInDegrees);
    }
    //return;    
}

function DirectionalDamageTimeOut()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ClearDirectionalDamage();
    }
    //return;    
}

exec function HideVSHUD()
{
    local /*0x97E50000-0x00000000*/ private bool bHide[8388609], bImmediate;

    bVSHUDHidden = bHide;
    // End:0x82
    if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
    {
        VSHUD_Panels[0].MyLPGFxMovie_VS.HideAllElements(bHide, bImmediate);
    }
    // End:0xEE
    if(MyLPGFxMovie.UI_Reticle_VS != none)
    {
        MyLPGFxMovie.UI_Reticle_VS.hide(bHide, bImmediate);
    }
    // End:0x114
    if(bHide)
    {
        ShowVideoMessage(false);
        ShowJobLog(false);
    }
    //return;    
}

exec function HideVSReticle()
{
    local /*0x97E50000-0x00000000*/ private bool bHide[8388609], bImmediate;

    // End:0x6D
    if(MyLPGFxMovie.UI_Reticle_VS != none)
    {
        MyLPGFxMovie.UI_Reticle_VS.hide(bHide, bImmediate);
    }
    //return;    
}

exec function ToggleVSTemperatureDamageEffect()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609];

    // End:0x48
    if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
    {
        // End:0x3E
        if(bSet)
        {
            SetVSHUDInstrumentDamage();            
        }
        else
        {
            ClearVSHUDInstrumentDamage();
        }
    }
    //return;    
}

exec function ToggleVSMinimapDamageEffect()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609];

    // End:0x48
    if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
    {
        // End:0x3E
        if(bSet)
        {
            SetVSHUDInstrumentDamage();            
        }
        else
        {
            ClearVSHUDInstrumentDamage();
        }
    }
    //return;    
}

function SetVSDirectionalDamage()
{
    local /*0x97E50000-0x00000000*/ private float AngleInDegrees[8388609];

    // End:0x90
    if(!IsTimerActive('VSDirectionalDamageTimeOut'))
    {
        SetVSHUDInstrumentDamage();
        ShowHullIntegrity();
        // End:0x65
        if(MyLPGFxMovie != none)
        {
            MyLPGFxMovie.SetDirectionalDamage(AngleInDegrees);
        }
        ClearTimer('VSDirectionalDamageTimeOut');
        SetTimer(VSDirectionalDamageTimeoutTime, false, 'VSDirectionalDamageTimeOut');
    }
    //return;    
}

function VSDirectionalDamageTimeOut()
{
    // End:0x0F
    if(MyLPGFxMovie != none)
    {
    }
    //return;    
}

function SetVSHUDInstrumentDamage()
{
    ClearVSHUDInstrumentDamage();
    SetTimer(VSInstrumentDamageTimeoutTime, false, 'VSInstrumentDamageTimeOut');
    //return;    
}

function ClearVSHUDInstrumentDamage()
{
    ClearTimer('VSInstrumentDamageTimeOut');
    //return;    
}

function VSInstrumentDamageTimeOut()
{
    //return;    
}

function VSTemperatureDamageTimeOut()
{
    // End:0x58
    if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
    {
        VSHUD_Panels[0].MyLPGFxMovie_VS.ClearTemperatureInstrumentDamage();
    }
    //return;    
}

function VSMinimapDamageTimeOut()
{
    // End:0x58
    if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
    {
        VSHUD_Panels[0].MyLPGFxMovie_VS.ClearMinimapInstrumentDamage();
    }
    //return;    
}

function ShowHullIntegrity()
{
    local /*0x97E50000-0x00000000*/ private bool bRepairing[9437185];

    // End:0x141
    if(!IsTimerActive('HullIntegrityTimeOut'))
    {
        // End:0xE7
        if(PlayerOwner.Pawn.IsA('LPVSFuturePlayerPawn'))
        {
            // End:0x81
            if(MyLPGFxMovie != none)
            {
                MyLPGFxMovie.ShowHullIntegrity(true);
            }
            // End:0xE4
            if(VSFutureHUD_Panels[0].MyLPGFxMovie_VS != none)
            {
                VSFutureHUD_Panels[0].MyLPGFxMovie_VS.ShowHullIntegrity(true, bRepairing);
            }            
        }
        else
        {
            // End:0x141
            if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
            {
                VSHUD_Panels[0].MyLPGFxMovie_VS.ShowHullIntegrity(true);
            }
        }
    }
    ClearTimer('HullIntegrityTimeOut');
    SetTimer(HullIntegrityTimeoutTime, false, 'HullIntegrityTimeOut');
    //return;    
}

function HullIntegrityTimeOut()
{
    // End:0xC4
    if(PlayerOwner.Pawn.IsA('LPVSFuturePlayerPawn'))
    {
        // End:0x67
        if(MyLPGFxMovie != none)
        {
            MyLPGFxMovie.ShowHullIntegrity(false);
        }
        // End:0xC1
        if(VSFutureHUD_Panels[0].MyLPGFxMovie_VS != none)
        {
            VSFutureHUD_Panels[0].MyLPGFxMovie_VS.ShowHullIntegrity(false);
        }        
    }
    else
    {
        // End:0x11E
        if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
        {
            VSHUD_Panels[0].MyLPGFxMovie_VS.ShowHullIntegrity(false);
        }
    }
    //return;    
}

function ShowVSDash()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowVSDash(bShow);
    }
    // End:0x9A
    if(VSFutureHUD_Panels[0].MyLPGFxMovie_VS != none)
    {
        VSFutureHUD_Panels[0].MyLPGFxMovie_VS.ShowVSDash(bShow);
    }
    //return;    
}

function EnableMPTeamScores()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[9437185];

    true
    // End:0x3D
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.EnableMPTeamScores(bEnable);
    }
    //return;    
}

function NotifyWeaponFired()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.NotifyWeaponFired();
    }
    //return;    
}

simulated function NotifyWeaponReload()
{
    //return;    
}

simulated function NotifyShoulderAimCameraActive()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.NotifyShoulderAimCameraActive();
    }
    //return;    
}

simulated function NotifyShoulderAimCameraInactive()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.NotifyShoulderAimCameraInactive();
    }
    //return;    
}

function RefreshLoadoutUI()
{
    MyLPGFxMovie.RefreshLoadoutUI();
    //return;    
}

function RefreshHUDAmmoCount()
{
    MyLPGFxMovie.RefreshHUDAmmoCount();
    //return;    
}

simulated function NotifyInstantHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL Impact[8388609], HitPawn, GRI, Player;

    // End:0x115
    if(MyLPGFxMovie != none)
    {
        HitPawn = Pawn(Impact.HitActor);
        // End:0x115
        if(HitPawn != none)
        {
            GRI = LPGRI(WorldInfo.GRI);
            Player = LPPlayerController(PlayerOwner);
            // End:0x115
            if((GRI != none) && GRI.IsPlayerEnemy(Player.Pawn, HitPawn))
            {
                MyLPGFxMovie.ShowEnemyHitMarker(true);
            }
        }
    }
    //return;    
}

exec function SetShowScores()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    super(HUD).SetShowScores(false);
    // End:0x72
    if(bShow)
    {
        // End:0x32
        if(ShouldShowWinLossSplashScreen())
        {
            ShowWinLossSplashScreen();            
        }
        else
        {
            // End:0x6F
            if(!ScoreboardIsShown())
            {
                CreateRoundScoreboard(false,, int(PlayerOwner.GetTeamNum()));
            }
        }        
    }
    else
    {
        // End:0x8C
        if(LPGFxMoviePlayerScoreboardInstance != none)
        {
            CloseRoundScoreboard(false);
        }
    }
    //return;    
}

function ShouldShowWinLossSplashScreen()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return PlayerOwner.IsInState('RoundEnded') && !bWinLossSplashShown;
    //return ReturnValue;    
}

function ShowWinLossSplashScreen()
{
    // End:0x37
    if(GFxFlashMovieInstancePauseMenu != none)
    {
        LPGFxMoviePlayerPauseMenu(GFxFlashMovieInstancePauseMenu).PauseMenuClose();
    }
    HideCrosshair(true);
    CloseRoundScoreboard(true);
    ClearHUDMessage();
    MessageLayerManager.RemoveAllMessageLayers();
    MyLPGFxMovie.ShowDPadCluster(false);
    MyLPGFxMovie.UI_DPadCluster = none;
    MyLPGFxMovie.ShowWinLossSplashScreen();
    //return;    
}

function NotifyWinLossSplashComplete()
{
    bWinLossSplashShown = true;
    SetShowScores(true);
    //return;    
}

function ToggleRoundScoreboard()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex;
    local /*0x97E50000-0x00000000*/ private @NULL PC, LPG;

    // End:0x1AB
    if(!ScoreboardIsShown())
    {
        PC = LPPlayerController(PlayerOwner);
        LPG = LPGRI_Base_MP(WorldInfo.GRI);
        // End:0xE3
        if((PC != none) && PC.PlayerReplicationInfo != none)
        {
            TeamIndex = PC.PlayerReplicationInfo.Team.TeamIndex;
        }
        // End:0x19A
        if((LPG != none) && (PC.GetStateName() == 'Dead') || PC.GetStateName() == 'Incapacitated')
        {
            CreateRoundScoreboard(true, LPG.GetRespawnDelay(int(PC.GetTeamNum())), TeamIndex);            
        }
        else
        {
            CreateRoundScoreboard(false);
        }        
    }
    else
    {
        LPGFxMoviePlayerScoreboard(LPGFxMoviePlayerScoreboardInstance).CloseScoreboard(true, false);
    }
    //return;    
}

function CreateRoundScoreboard()
{
    local /*0x97E50000-0x00000000*/ private bool bShowRespawnCounter[8388609];
    local /*0x97E50000-0x00000000*/ private int InitialCounterValue[9437185], TeamIndex;
    local /*0x97E50000-0x00000000*/ private bool bShowSpawnQueue[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL PC, PRI;
    local /*0x97E50000-0x00000000*/ private class PawnClass;
    local /*0x97E50000-0x00000000*/ private int NewTeamIndex;

    PC = LPPlayerController(PlayerOwner);
    // End:0xBB
    if(PC != none)
    {
        NewTeamIndex = int(PC.GetTeamNum());
        TeamIndex = NewTeamIndex;
        PawnClass = class<LPPlayerPawn>(LPPRI(PC.PlayerReplicationInfo).PawnClass);
    }
    // End:0x2D2
    if(LPGFxMoviePlayerScoreboardInstance == none)
    {
        // End:0x137
        if(PawnClass == none)
        {
            // End:0x136
            foreach DynamicActors(Class'LPPRI', PRI)
            {
                PawnClass = class<LPPlayerPawn>(PRI.PawnClass);
                // End:0x135
                if(PawnClass != none)
                {
                    // End:0x136
                    break;
                }                
            }            
        }
        // End:0x2CF
        if(((PawnClass != none) && PawnClass.default.LPGFxMoviePlayerScoreboardMovie != none) && PawnClass.default.LPGFxMoviePlayerScoreboardContentClass != none)
        {
            Class'SPGfx.SPGFxMoviePlayer'.static.StartSPGFxMoviePlayer(self, PawnClass.default.LPGFxMoviePlayerScoreboardMovie, PawnClass.default.LPGFxMoviePlayerScoreboardContentClass, FindLocalPlayerIndex(LocalPlayer(PlayerOwner.Player)), LPGFxMoviePlayerScoreboardInstance, 1, false);
            LPGFxMoviePlayerScoreboardInstance.bOnlyOwnerFocusable = true;
            LPGFxMoviePlayerScoreboardInstance.Init(LocalPlayer(PlayerOwner.Player));
            LPGFxMoviePlayerScoreboard(LPGFxMoviePlayerScoreboardInstance).ConstructScoreboard(WorldInfo, TeamIndex);
        }        
    }
    else
    {
        LPGFxMoviePlayerScoreboardInstance.Start();
    }
    // End:0x33F
    if(bShowRespawnCounter)
    {
        ShowDPadCluster(false);
        LPGFxMoviePlayerScoreboard(LPGFxMoviePlayerScoreboardInstance).ConstructRespawnInfo(InitialCounterValue);        
    }
    else
    {
        LPGFxMoviePlayerScoreboard(LPGFxMoviePlayerScoreboardInstance).RemoveRespawnInfo();
    }
    // End:0x39C
    if(bShowSpawnQueue)
    {
        LPGFxMoviePlayerScoreboard(LPGFxMoviePlayerScoreboardInstance).ConstructSpawnQueuePrompt();
    }
    //return;    
}

function CloseRoundScoreboard()
{
    local /*0x97E50000-0x00000000*/ private bool bImmediateClose[8388609];

    // End:0x2F
    if(LPGFxMoviePlayerScoreboardInstance != none)
    {
        LPGFxMoviePlayerScoreboardInstance.Close(false);
    }
    //return;    
}

event ScoreboardIsShown()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x35
    if((LPGFxMoviePlayerScoreboardInstance != none) && LPGFxMoviePlayerScoreboardInstance.bMovieIsOpen)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function DecrementRespawnCounter()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bStopTimer;
    local /*0x97E50000-0x00000000*/ private @NULL ScoreMC;

    ScoreMC = LPGFxMoviePlayerScoreboard(LPGFxMoviePlayerScoreboardInstance);
    // End:0x54
    if((ScoreMC.bShowRespawnInfo == false) || !ScoreboardIsShown())
    {
        return true;
    }
    bStopTimer = ScoreMC.DecrementRespawnCounter();
    return bStopTimer;
    //return ReturnValue;    
}

function RemoveRespawnInfo()
{
    // End:0x35
    if(ScoreboardIsShown())
    {
        LPGFxMoviePlayerScoreboard(LPGFxMoviePlayerScoreboardInstance).RemoveRespawnInfo();
    }
    //return;    
}

function SetScoreboardBackplateOpaque()
{
    local /*0x97E50000-0x00000000*/ private bool bOpaque[8388609];

    // End:0x36
    if(ScoreboardIsShown())
    {
        LPGFxMoviePlayerScoreboard(LPGFxMoviePlayerScoreboardInstance).SetScoreboardBackplateOpaque(true);
    }
    //return;    
}

exec function SetPOFMinimapZoom()
{
    local /*0x97E50000-0x00000000*/ private float zoom[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetPOFMinimapZoom(zoom);
    }
    //return;    
}

exec function SetVSMinimapZoom()
{
    local /*0x97E50000-0x00000000*/ private float zoom[8388609];

    // End:0x61
    if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
    {
        VSHUD_Panels[0].MyLPGFxMovie_VS.SetVSMinimapZoom(zoom);
    }
    //return;    
}

exec function MinimapZoomIn()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.MinimapZoomIn();
    }
    //return;    
}

exec function MinimapZoomOut()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.MinimapZoomOut();
    }
    //return;    
}

function SetMasterDisplaySwitchHUD()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetMasterDisplaySwitchHUD(bEnable);
    }
    //return;    
}

function SetMasterDisplaySwitchRadar()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetMasterDisplaySwitchRadar(bEnable);
    }
    //return;    
}

exec function ShowRadar()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowRadar(bShow);
    }
    //return;    
}

function ShowSaveWheel()
{
    local /*0x97E50000-0x00000000*/ private float MinDisplayTime[9437185];

    3.0000000
    // End:0x40
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowSaveWheel(MinDisplayTime);
    }
    //return;    
}

function HideSaveWheel()
{
    local /*0x97E50000-0x00000000*/ private bool bImmediate[9437185];

    false
    // End:0x3D
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.HideSaveWheel(bImmediate);
    }
    //return;    
}

function SetMasterDisplaySwitchReticle()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetMasterDisplaySwitchReticle(bEnable);
    }
    //return;    
}

exec function SetCrosshairActive()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x39
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetCrosshairActive(bShow);
    }
    //return;    
}

exec function HideCrosshair()
{
    local /*0x97E50000-0x00000000*/ private bool bHide[8388609];

    // End:0x39
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.HideCrosshair(bHide);
    }
    //return;    
}

event IsCrosshairShown()
{
    local /*0x97E50000-0x00000000*/ private bool considerCrosshairAboutToBeShownAsShown[9437185], ReturnValue;

    true
    return (MyLPGFxMovie != none) && MyLPGFxMovie.IsCrosshairShown(considerCrosshairAboutToBeShownAsShown);
    //return ReturnValue;    
}

function SetMasterDisplaySwitchWeaponsCluster()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetMasterDisplaySwitchWeaponsCluster(bEnable);
    }
    //return;    
}

exec function ShowWeaponCluster()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowWeaponCluster(bShow);
    }
    //return;    
}

exec function ShowHealthCluster()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowHealthCluster(bShow);
    }
    //return;    
}

function SetMasterDisplaySwitchDPAD()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetMasterDisplaySwitchDPAD(bEnable);
    }
    //return;    
}

function NotifyMoviePlayerClosed()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    super.NotifyMoviePlayerClosed(MP);
    // End:0x47
    if(MP == MyLPGFxMovie)
    {
        // End:0x44
        if(MyLPGFxMovie != none)
        {
            MyLPGFxMovie = none;
        }        
    }
    else
    {
        I = 0;
        J0x52:

        // End:0xFB [Loop If]
        if(I < 2)
        {
            // End:0xED
            if(MP == VSHUD_Panels[I].GFxFlashMovieInstance_VS)
            {
                // End:0xEA
                if(VSHUD_Panels[I].GFxFlashMovieInstance_VS != none)
                {
                    VSHUD_Panels[I].GFxFlashMovieInstance_VS = none;
                }
                // [Explicit Break]
                goto J0xFB;
            }
            I++;
            // [Loop Continue]
            goto J0x52;
        }
        J0xFB:

        I = 0;
        J0x106:

        // End:0x1AF [Loop If]
        if(I < 2)
        {
            // End:0x1A1
            if(MP == VSFutureHUD_Panels[I].GFxFlashMovieInstance_VS)
            {
                // End:0x19E
                if(VSFutureHUD_Panels[I].GFxFlashMovieInstance_VS != none)
                {
                    VSFutureHUD_Panels[I].GFxFlashMovieInstance_VS = none;
                }
                // [Explicit Break]
                goto J0x1AF;
            }
            I++;
            // [Loop Continue]
            goto J0x106;
        }
    }
    J0x1AF:

    //return;    
}

exec function ShowDebugGFX()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    bShowGFxDebug = bShow;
    //return;    
}

function OpenVSEnvironmentalMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(inAction == none)
    {
        return false;
    }
    // End:0x3D
    if(VSEnvironmentalMessage.Action == inAction)
    {
        return true;
    }
    // End:0x95
    if((VSEnvironmentalMessage.Action != none) && VSEnvironmentalMessage.Action != inAction)
    {
        AbortVSEnvironmentalMessage();
    }
    VSEnvironmentalMessage.Action = inAction;
    SetVSEnvironmentalMessageDuration(inAction.DisplayTimeSeconds);
    VSEnvironmentalMessageID++;
    // End:0x1CA
    if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
    {
        VSHUD_Panels[0].MyLPGFxMovie_VS.OpenVSEnvironmentalMessage(inAction.MessageType, inAction.MessageText.LocalizedTextMarkUp, inAction.SecondaryMessageText.LocalizedTextMarkUp);
    }
    return true;
    //return ReturnValue;    
}

simulated function DisplayVSEnvironmentalMessage()
{
    local /*0x97E50000-0x00000000*/ private byte MessageType[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageText[8388609], SecondaryMessageText;
    local /*0x97E50000-0x00000000*/ private bool bForceDisplay[8388609];
    local /*0x97E50000-0x00000000*/ private float fDisplayTime[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x2F
    if(!IsVSEnvironmentalMessageDone())
    {
        // End:0x29
        if(bForceDisplay)
        {
            CloseVSEnvironmentalMessageScene();            
        }
        else
        {
            return -1;
        }
    }
    VSEnvironmentalMessageID++;
    SetVSEnvironmentalMessageDuration(fDisplayTime);
    // End:0xC0
    if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
    {
        VSHUD_Panels[0].MyLPGFxMovie_VS.OpenVSEnvironmentalMessage(MessageType, MessageText, SecondaryMessageText);
    }
    return VSEnvironmentalMessageID;
    //return ReturnValue;    
}

simulated function IsVSEnvironmentalMessageIDActive()
{
    local /*0x97E50000-0x00000000*/ private int InID[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(!IsVSEnvironmentalMessageDone())
    {
        return InID == VSEnvironmentalMessageID;
    }
    return false;
    //return ReturnValue;    
}

simulated function SetVSEnvironmentalMessageDuration()
{
    local /*0x97E50000-0x00000000*/ private float Duration[8388609];

    VSEnvironmentalMessage.MessageEndTime = -1.0000000;
    // End:0x79
    if(Duration > float(0))
    {
        VSEnvironmentalMessage.MessageEndTime = WorldInfo.TimeSeconds + Duration;
    }
    //return;    
}

exec function testvsmessage()
{
    DisplayVSEnvironmentalMessage(0, "test message", "test second message", false, 2.0000000);
    //return;    
}

exec function testvsmessagenotimeout()
{
    DisplayVSEnvironmentalMessage(0, "test notimeout message", "test second message", false, 0.0000000);
    //return;    
}

exec function closevsmessage()
{
    ClearVSEnvironmentalMessage();
    //return;    
}

simulated function ClearVSEnvironmentalMessage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1B
    if(!IsVSEnvironmentalMessageDone())
    {
        CloseVSEnvironmentalMessageScene();
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsVSEnvironmentalMessageDone()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x59
    if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
    {
        return VSHUD_Panels[0].MyLPGFxMovie_VS.IsVSEnvironmentalMessageDone();
    }
    return true;
    //return ReturnValue;    
}

event IsVSEnvironmentalMessageDoneForAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x59
    if((VSEnvironmentalMessage.Action != none) && VSEnvironmentalMessage.Action == inAction)
    {
        return IsVSEnvironmentalMessageDone();
    }
    return true;
    //return ReturnValue;    
}

function AbortVSEnvironmentalMessage()
{
    // End:0x56
    if(VSEnvironmentalMessage.Action != none)
    {
        VSEnvironmentalMessage.Action.bAborted = true;
    }
    AbortVSEnvironmentalMessageScene();
    //return;    
}

function CloseVSEnvironmentalMessageScene()
{
    // End:0x58
    if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
    {
        VSHUD_Panels[0].MyLPGFxMovie_VS.CloseVSEnvironmentalMessage();
    }
    ClearVSEnvironmentalMessageData();
    //return;    
}

function AbortVSEnvironmentalMessageScene()
{
    // End:0x58
    if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
    {
        VSHUD_Panels[0].MyLPGFxMovie_VS.AbortVSEnvironmentalMessage();
    }
    ClearVSEnvironmentalMessageData();
    //return;    
}

function ClearVSEnvironmentalMessageData()
{
    VSEnvironmentalMessage.Action = none;
    VSEnvironmentalMessage.MessageEndTime = -1.0000000;
    //return;    
}

event ClearVSEnvironmentalMessageForAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x45
    if((inAction != none) && inAction == VSEnvironmentalMessage.Action)
    {
        CloseVSEnvironmentalMessageScene();
    }
    //return;    
}

function OnGiveInventory()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.OnGiveInventory();
    }
    //return;    
}

function ChangedWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewWeapon[8388609];

    // End:0x40
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ChangedWeapon(LPWeapon(NewWeapon));
    }
    bWeaponInitialized = true;
    //return;    
}

function SwitchedToNewInventoryPart()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SwitchedToNewInventoryPart();
    }
    //return;    
}

exec function SetIncomingMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    PC = LPPlayerController(PlayerOwner);
    // End:0x134
    if((PC != none) && PC.bIsInVitalSuit)
    {
        // End:0x134
        if(VSIncomingMessage.bIncomingMessage == false)
        {
            VSIncomingMessage.bIncomingMessage = true;
            VSIncomingMessage.bIncomingMessageClicked = false;
            // End:0x109
            if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
            {
                VSHUD_Panels[0].MyLPGFxMovie_VS.ShowIncomingMessage(true);
            }
            ClearTimer('IncomingMessageTimeOut');
            SetTimer(IncomingMessageTimeoutTime, false, 'IncomingMessageTimeOut');
        }
    }
    //return;    
}

function IncomingMessageTimeOut()
{
    // End:0x71
    if((VSIncomingMessage.bIncomingMessage == true) && VSIncomingMessage.bIncomingMessageClicked == false)
    {
        VSIncomingMessage.bIncomingMessageTimedOut = true;
        VideoCompleted();
    }
    //return;    
}

function IncomingMessageButtonPress()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    PC = LPPlayerController(PlayerOwner);
    // End:0x14D
    if((VSIncomingMessage.bIncomingMessage == true) && VSIncomingMessage.bIncomingMessageClicked == false)
    {
        VSIncomingMessage.bIncomingMessageClicked = true;
        ClearTimer('IncomingMessageTimeOut');
        // End:0xEF
        if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
        {
            VSHUD_Panels[0].MyLPGFxMovie_VS.ClickIncomingMessage();
        }
        PC.Pawn.TriggerEventClass(Class'LPSeqEvent_VSIncomingMessageOpened', PC.Pawn);
    }
    //return;    
}

exec function ShowRadioMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bInShow[8388609], bShow;

    // End:0x1B
    if(bInShow)
    {
        ++ShowVSRadioMsgRefCount;        
    }
    else
    {
        --ShowVSRadioMsgRefCount;
    }
    // End:0x44
    if(ShowVSRadioMsgRefCount > 0)
    {
        bShow = true;        
    }
    else
    {
        bShow = false;
    }
    // End:0xB2
    if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
    {
        VSHUD_Panels[0].MyLPGFxMovie_VS.ShowRadioMessage(bShow);
    }
    //return;    
}

exec function ShowDrillSwing()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x62
    if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
    {
        VSHUD_Panels[0].MyLPGFxMovie_VS.EnableDrillSwingDisplay(bShow);
    }
    //return;    
}

exec function ShowDrillSpin()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x62
    if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
    {
        VSHUD_Panels[0].MyLPGFxMovie_VS.EnableDrillSpinDisplay(bShow);
    }
    //return;    
}

exec function ShowVideoMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MovieStreamFilename[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    PC = LPPlayerController(PlayerOwner);
    // End:0x2D1
    if(PC != none)
    {
        // End:0x2D1
        if(true)
        {
            // End:0x187
            if(bShow)
            {
                // End:0x184
                if((MovieStreamFilename != "") || (VSIncomingMessage.bIncomingMessage == true) && (VSIncomingMessage.bIncomingMessageClicked == true) || VSIncomingMessage.bIncomingMessageTimedOut == true)
                {
                    // End:0x184
                    if(PC.bIsInVitalSuit && VSIncomingMessage.bVideoMessagePlaying == false)
                    {
                        // End:0x165
                        if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
                        {
                            VSHUD_Panels[0].MyLPGFxMovie_VS.ShowVideoMessage(true, MovieStreamFilename);
                        }
                        VSIncomingMessage.bVideoMessagePlaying = true;
                    }
                }                
            }
            else
            {
                // End:0x216
                if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
                {
                    VSHUD_Panels[0].MyLPGFxMovie_VS.ShowIncomingMessage(false);
                    VSHUD_Panels[0].MyLPGFxMovie_VS.ShowVideoMessage(false);
                }
                VSIncomingMessage.bIncomingMessage = false;
                VSIncomingMessage.bIncomingMessageClicked = false;
                VSIncomingMessage.bVideoMessagePlaying = false;
                PC.Pawn.TriggerEventClass(Class'LPSeqEvent_VSIncomingMessageClosed', PC.Pawn);
            }
        }
    }
    //return;    
}

function VideoCompleted()
{
    ShowVideoMessage(false);
    //return;    
}

function VideoMessageEnded()
{
    //return;    
}

function ShowShop()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InGFxFlashMovie[8388609];
    local /*0x97E50000-0x00000000*/ private byte ShopType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ShopAction[8388609];

    // End:0x53
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowShop(bShow, InGFxFlashMovie, ShopType, ShopAction);
    }
    //return;    
}

function ShowElevatorLevelSelector()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InGFxFlashMovie[8388609], Action;

    // End:0x4A
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowElevatorLevelSelector(bShow, InGFxFlashMovie, Action);
    }
    //return;    
}

exec function ShowJobLog()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bVSMode, bForceImmediateCancel;

    false
    false
    // End:0x12B
    if((MyLPGFxMovie != none) && !bShow && PlayerOwner.bCinematicMode)
    {
        MyLPGFxMovie.ShowJobLog(bShow, bVSMode, bForceImmediateCancel);
        // End:0x12B
        if(bShow)
        {
            // End:0x12B
            if((PlayerOwner != none) && PlayerOwner.Pawn != none)
            {
                PlayerOwner.Pawn.TriggerEventClass(Class'LPSeqEvent_JobLogOpened', PlayerOwner.Pawn);
            }
        }
    }
    //return;    
}

exec function ShowMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ParentScoreboard[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForce[9437185];

    // End:0x78
    if((!PlayerOwner.bCinematicMode || bForce) && MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowMunitionsLocker(bShow, ParentScoreboard);
    }
    //return;    
}

function SetVSJobLogFocused()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609], bResetTime;

    true
    // End:0xB8
    if(MyLPGFxMovie != none)
    {
        // End:0x8E
        if(bResetTime && MyLPGFxMovie.bVSJobLogFocused != bSet)
        {
            MyLPGFxMovie.VSJobLogFocusedTime = WorldInfo.TimeSeconds;
        }
        MyLPGFxMovie.bVSJobLogFocused = bSet;
    }
    //return;    
}

function ShowMunitionsLockerShell()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x39
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowMunitionsLocker(bShow);
    }
    //return;    
}

function IsMunitionsLockerOpen()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(MyLPGFxMovie != none)
    {
        return MyLPGFxMovie.IsMunitionsLockerOpen();
    }
    return false;
    //return ReturnValue;    
}

function CancelMunitionsLocker()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.CancelMunitionsLocker();
    }
    //return;    
}

function HandlePickup()
{
    local /*0x97E50000-0x00000000*/ private class Inv[8388609];
    local /*0x97E50000-0x00000000*/ private int iCount[8388609], iIndex;

    // End:0x4A
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.HandlePickup(Inv, iCount, iIndex);
    }
    //return;    
}

function ShowAward()
{
    local /*0x97E50000-0x00000000*/ private @NULL Award[8388609];
    local /*0x97E50000-0x00000000*/ private int CreditsAdded[8388609];

    // End:0x6F
    if(MyLPGFxMovie != none)
    {
        // End:0x6F
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            // End:0x6F
            if(!MyLPGFxMovie.ShowAward(true, Award, CreditsAdded))
            {
            }
        }
    }
    //return;    
}

function NotifyAwardIntroComplete()
{
    local /*0x97E50000-0x00000000*/ private @NULL Award[8388609];

    SetTimer(AwardTimeoutTime, false, 'TimerCloseAward');
    //return;    
}

function TimerCloseAward()
{
    // End:0x31
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowAward(false);
    }
    //return;    
}

function IsAwardVisible()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(MyLPGFxMovie != none)
    {
        return MyLPGFxMovie.IsAwardBusy();
    }
    return false;
    //return ReturnValue;    
}

exec function ShowDPadCluster()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bTimeout;

    true
    // End:0x78
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowDPadCluster(bShow);
        ClearTimer('DpadClusterTimeOut');
        // End:0x78
        if(bShow && bTimeout)
        {
            SetDPadClusterTimeout();
        }
    }
    //return;    
}

function SetDPadClusterTimeout()
{
    local /*0x97E50000-0x00000000*/ private float fTime[9437185], TimeoutTime;

    0.0000000
    // End:0x30
    if(fTime > float(0))
    {
        TimeoutTime = fTime;        
    }
    else
    {
        TimeoutTime = DpadClusterTimeoutTime;
    }
    ClearTimer('DpadClusterTimeOut');
    SetTimer(TimeoutTime, false, 'DpadClusterTimeOut');
    //return;    
}

function DpadClusterTimeOut()
{
    // End:0x2F
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowDPadCluster(false);
    }
    //return;    
}

function IsDPADClusterVisible()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(MyLPGFxMovie != none)
    {
        return MyLPGFxMovie.IsDPADClusterVisible();
    }
    return false;
    //return ReturnValue;    
}

function SetDPadClusterPerkState()
{
    local /*0x97E50000-0x00000000*/ private byte PerkStatus[8388609];
    local /*0x97E50000-0x00000000*/ private int PerkNum[8388609];

    // End:0x40
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetDPadClusterPerkState(PerkStatus, PerkNum);
    }
    //return;    
}

function ForceDPadClusterUpdate()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ForceDPadClusterUpdate();
    }
    //return;    
}

function ShowMusicPlayerPlay()
{
    local /*0x97E50000-0x00000000*/ private bool bIsNotAllowed[9437185];

    false
    ShowMusicPlayer(true, 0, bIsNotAllowed);
    //return;    
}

function ShowMusicPlayerPause()
{
    local /*0x97E50000-0x00000000*/ private bool bIsNotAllowed[9437185];

    false
    ShowMusicPlayer(true, 4, bIsNotAllowed);
    //return;    
}

function ShowMusicPlayerStop()
{
    local /*0x97E50000-0x00000000*/ private bool bIsNotAllowed[9437185];

    false
    ShowMusicPlayer(true, 2, bIsNotAllowed);
    //return;    
}

function ShowMusicPlayerPrev()
{
    local /*0x97E50000-0x00000000*/ private bool bIsNotAllowed[9437185];

    false
    ShowMusicPlayer(true, 3, bIsNotAllowed);
    //return;    
}

function ShowMusicPlayerNext()
{
    local /*0x97E50000-0x00000000*/ private bool bIsNotAllowed[9437185];

    false
    ShowMusicPlayer(true, 1, bIsNotAllowed);
    //return;    
}

exec function ShowMusicPlayer()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private int dpadButtonIndex[9437185];
    local /*0x97E50000-0x00000000*/ private bool bIsNotAllowed[9437185], bSongInfoOnly;

    -1
    false
    false
    // End:0x94
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowMusicPlayer(bShow, dpadButtonIndex, bIsNotAllowed, bSongInfoOnly);
        ClearTimer('MusicPlayerTimeOut');
        // End:0x94
        if(bShow)
        {
            SetMusicPlayerTimeout();
        }
    }
    //return;    
}

function SetMusicPlayerTimeout()
{
    local /*0x97E50000-0x00000000*/ private float fTime[9437185], TimeoutTime;

    0.0000000
    // End:0x30
    if(fTime > float(0))
    {
        TimeoutTime = fTime;        
    }
    else
    {
        TimeoutTime = MusicPlayerTimeoutTime;
    }
    ClearTimer('MusicPlayerTimeOut');
    SetTimer(TimeoutTime, false, 'MusicPlayerTimeOut');
    //return;    
}

function MusicPlayerTimeOut()
{
    // End:0x32
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowMusicPlayer(false);
    }
    //return;    
}

function ShowPlatformMeter()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL inExtractPocket[9437185], InVsPawn;

    // End:0x4C
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowPlatformMeter(bShow, inExtractPocket, InVsPawn);
    }
    //return;    
}

function AddStatusMessage()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageString[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.PostStatusMessage(MessageString);
    }
    //return;    
}

event PostRender()
{
    // End:0xEE
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        // End:0x96
        if(bNoGRI && Class'Engine.WorldInfo'.static.GetWorldInfo().GRI != none)
        {
            bNoGRI = false;
            RemoveMovies();
            CreateHUDMovie();            
        }
        else
        {
            // End:0xEE
            if(!bNoGRI && Class'Engine.WorldInfo'.static.GetWorldInfo().GRI == none)
            {
                bNoGRI = true;
            }
        }
    }
    super.PostRender();
    //return;    
}

function ShowAmmoModeSwitch()
{
    local /*0x97E50000-0x00000000*/ private int AmmoMode[8388609];

    MyLPGFxMovie.ShowAmmoModeSwitch(AmmoMode);
    //return;    
}

function ShowAmmoSwitchProgress()
{
    local /*0x97E50000-0x00000000*/ private float progressPercent[8388609];
    local /*0x97E50000-0x00000000*/ private int CurrentAmmoMode[8388609];

    MyLPGFxMovie.ShowAmmoSwitchProgress(progressPercent, CurrentAmmoMode);
    //return;    
}

// Export ULPHUD::execTransformHUDPosToScaleformStagePos(FFrame&, void* const)
native function TransformHUDPosToScaleformStagePos()
{
    local /*0x97E50000-0x00000000*/ private float PosX[25165825], PosY, stageWidth, stageHeight;

    1280.0000000
    720.0000000                        
}

function PlayerDied()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.PlayerDied();
    }
    // End:0x7E
    if(!MessageLayerManager.IsMessageLayerActive(0))
    {
        ClearHUDMessage();
        MessageLayerManager.RemoveAllMessageLayers();
    }
    //return;    
}

function RoundEnded()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.RoundEnded();
    }
    //return;    
}

function InitScope()
{
    LoadScope();
    //return;    
}

function UpdateScopeText()
{
    local /*0x97E50000-0x00000000*/ private @NULL TransContext;
    local /*0x97E50000-0x00000000*/ private editfixedsize string RangeText, ZoomText;

    TransContext = MyLPGFxMovie.GetLP().GetTranslationContext();
    // End:0x109
    if(TransContext != none)
    {
        RangeText = Class'GFxUI.GFxObject'.static.TranslateString("<Strings:LostPlanetGame.WeaponScope.Range>", TransContext);
        ZoomText = Class'GFxUI.GFxObject'.static.TranslateString("<Strings:LostPlanetGame.WeaponScope.Zoom>", TransContext);
    }
    SetScopeRangeText(RangeText);
    SetScopeZoomText(ZoomText);
    //return;    
}

function LoadScope()
{
    bOwnerHasScopedWeapon = true;
    // End:0x3A
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.LoadScope();
    }
    //return;    
}

function SetScopeRangeText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string RangeText[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetScopeRangeText(RangeText);
    }
    //return;    
}

function SetScopeRange()
{
    local /*0x97E50000-0x00000000*/ private float Range[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetScopeRange(Range);
    }
    //return;    
}

function SetScopeZoomText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ZoomText[8388609];

    // End:0x37
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.SetScopeZoomText(ZoomText);
    }
    //return;    
}

function SetScopeActive()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ScopeTypeString[8388609];
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];
    local /*0x97E50000-0x00000000*/ private int ZoomLevel[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize array args;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL as_val1, as_val2, as_val3;

    0
    as_val1.Type = 4;
    as_val1.S = ((ScopeTypeString != "None") ? ScopeTypeString : LastActiveScopeType);
    args.AddItem(as_val1);    
    as_val2.Type = 5;
    as_val2.B = bEnable;
    args.AddItem(as_val2);    
    as_val3.Type = 2;
    as_val3.N = float(ZoomLevel);
    args.AddItem(as_val3);    
    // End:0x1C7
    if((LastActiveScopeType != "None") || ScopeTypeString != "None")
    {
        LastActiveScopeType = ScopeTypeString;
        // End:0x1C7
        if(MyLPGFxMovie != none)
        {            
            MyLPGFxMovie.Invoke("_root.showScope", args);
        }
    }
    // End:0x1E5
    if(ScopeTypeString != "None")
    {
        UpdateScopeText();
    }
    //return;    
}

exec function HideLPHUD()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609];

    MyLPGFxMovie.SetHidden(bSet);
    //return;    
}

function NotifyWaypointActivated()
{
    local /*0x97E50000-0x00000000*/ private @NULL WaypointMarker[8388609];

    MyLPGFxMovie.NotifyWaypointActivated(WaypointMarker);
    //return;    
}

function NotifyWaypointDeactivated()
{
    local /*0x97E50000-0x00000000*/ private @NULL WaypointMarker[8388609];

    MyLPGFxMovie.NotifyWaypointDeactivated(WaypointMarker);
    //return;    
}

function ShowLocationDiscoveredMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL Q[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageString, HeaderString;

    // End:0x11
    if(Q == none)
    {
        return;
    }
    // End:0x7F
    if(SPQO_Quest(Q) != none)
    {
        HeaderString = "<Strings:LostPlanetGame.HUDStatusMessages.HUDStatus_LocationDiscovered>";        
    }
    else
    {
        HeaderString = "<Strings:LostPlanetGame.HUDStatusMessages.HUDStatus_LocationDiscovered>";
    }
    MessageString = Q.Description;
    DisplayHUDMessage(MessageString, true, ObjectiveCompleteMessageTimeoutTime,,, -0.2500000,, HeaderString, "LocationDiscovered", ObjectiveCompleteSound);
    //return;    
}

function ShowQuestObjectiveCompleteMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL Q[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageString, HeaderString, SubModeString;
    local /*0x97E50000-0x00000000*/ private @NULL Quest;

    // End:0x11
    if(Q == none)
    {
        return;
    }
    // End:0x7A
    if(SPQO_Quest(Q) != none)
    {
        HeaderString = "<Strings:LostPlanetGame.HUDStatusMessages.HUDStatus_QuestComplete>";        
    }
    else
    {
        HeaderString = "<Strings:LostPlanetGame.HUDStatusMessages.HUDStatus_ObjectiveComplete>";
    }
    MessageString = Q.Description;
    SubModeString = "";
    Quest = LPQO_Quest(Q.Outer);
    // End:0x17F
    if((Quest != none) && Quest.bOptionalQuest)
    {
        SubModeString = "optionalMission";
    }
    DisplayHUDMessage(MessageString, true, ObjectiveCompleteMessageTimeoutTime,,, -0.2500000,, HeaderString, "MissionComplete", ObjectiveCompleteSound, SubModeString);
    //return;    
}

function ShowQuestRewardMessage()
{
    local /*0x97E50000-0x00000000*/ private float RewardAmount[8388609];
    local /*0x97E50000-0x00000000*/ private byte RewardType[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageString, HeaderString, SubModeString;
    local /*0x97E50000-0x00000000*/ private int DecimalIdx, NewLength, Precision;

    // End:0x13
    if(RewardAmount <= float(0))
    {
        return;
    }
    switch(RewardType)
    {
        // End:0x97
        case 0:
            HeaderString = "<Strings:LostPlanetGame.HUDStatusMessages.HUDStatus_TEnergyRewardCredited>";
            SubModeString = "tenergy";
            // End:0x175
            break;
        // End:0x106
        case 1:
            HeaderString = "<Strings:LostPlanetGame.HUDStatusMessages.HUDStatus_ScrapRewardCredited>";
            SubModeString = "salvage";
            // End:0x175
            break;
        // End:0x172
        case 2:
            HeaderString = "<Strings:LostPlanetGame.HUDStatusMessages.HUDStatus_DNATagRewardCredited>";
            SubModeString = "dna";
            // End:0x175
            break;
        // End:0xFFFF
        default:
            break;
    }
    Precision = 0;
    MessageString = string(RewardAmount);
    DecimalIdx = InStr(MessageString, ".");
    // End:0x210
    if(DecimalIdx >= 0)
    {
        NewLength = DecimalIdx + ((Precision == 0) ? 0 : Precision + 1);
        MessageString = Left(MessageString, NewLength);
    }
    MessageString = "+" $ MessageString;
    DisplayHUDMessage(MessageString, true, ObjectiveCompleteMessageTimeoutTime,,, -0.2500000,, HeaderString, "MissionComplete", ObjectiveCompleteSound, SubModeString);
    //return;    
}

function ShowQuestObjectiveActivatedMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL Q[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageString, HeaderString, SubModeString;
    local /*0x97E50000-0x00000000*/ private @NULL Quest;

    // End:0x11
    if(Q == none)
    {
        return;
    }
    // End:0x7B
    if(SPQO_Quest(Q) != none)
    {
        HeaderString = "<Strings:LostPlanetGame.HUDStatusMessages.HUDStatus_QuestActivated>";        
    }
    else
    {
        HeaderString = "<Strings:LostPlanetGame.HUDStatusMessages.HUDStatus_ObjectiveActivated>";
    }
    MessageString = Q.Description;
    SubModeString = "";
    Quest = LPQO_Quest(Q.Outer);
    // End:0x181
    if((Quest != none) && Quest.bOptionalQuest)
    {
        SubModeString = "optionalMission";
    }
    DisplayHUDMessage(MessageString, true, ObjectiveCompleteMessageTimeoutTime,,, -0.2500000,, HeaderString, "MissionObjective", ObjectiveUnlockedSound, SubModeString);
    //return;    
}

function ShowQuestObjectiveFailedMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL Q[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageString, HeaderString, SubModeString;
    local /*0x97E50000-0x00000000*/ private @NULL Quest;

    // End:0x11
    if(Q == none)
    {
        return;
    }
    // End:0x78
    if(SPQO_Quest(Q) != none)
    {
        HeaderString = "<Strings:LostPlanetGame.HUDStatusMessages.HUDStatus_QuestFailed>";        
    }
    else
    {
        HeaderString = "<Strings:LostPlanetGame.HUDStatusMessages.HUDStatus_ObjectiveFailed>";
    }
    MessageString = Q.Description;
    SubModeString = "";
    Quest = LPQO_Quest(Q.Outer);
    // End:0x17B
    if((Quest != none) && Quest.bOptionalQuest)
    {
        SubModeString = "optionalMission";
    }
    DisplayHUDMessage(MessageString, true, ObjectiveCompleteMessageTimeoutTime,,, -0.2500000,, HeaderString, "MissionObjective", ObjectiveUnlockedSound, SubModeString);
    //return;    
}

function ShowQuestCurrentObjectiveMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL Q[8388609];
    local /*0x97E50000-0x00000000*/ private bool bOnlyShowIfNothingQueued[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageString, HeaderString, SubModeString;
    local /*0x97E50000-0x00000000*/ private @NULL Quest;

    // End:0x12
    if(Q == none)
    {
        return;
    }
    // End:0x43
    if(bOnlyShowIfNothingQueued)
    {
        // End:0x43
        if(GFxFlashMovieInstanceKismetMessage.IsAnyMessageQueued())
        {
            return;
        }
    }
    HeaderString = "<Strings:LostPlanetGame.HUDStatusMessages.HUDStatus_CurrentObjective>";
    MessageString = Q.Description;
    SubModeString = "";
    Quest = LPQO_Quest(Q.Outer);
    // End:0x147
    if((Quest != none) && Quest.bOptionalQuest)
    {
        SubModeString = "optionalMission";
    }
    DisplayHUDMessage(MessageString, true, ObjectiveCompleteMessageTimeoutTime,,, -0.2500000,, HeaderString, "MissionObjective", none, SubModeString);
    //return;    
}

exec function ToggleHUDDamageEffects()
{
    bDisableHUDDamageEffects = !bDisableHUDDamageEffects;
    //return;    
}

function NotifyThermalEnergyChanged()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.NotifyThermalEnergyChanged();
    }
    //return;    
}

function NotifyPerkInventoryChanged()
{
    // End:0x2E
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.NotifyPerkInventoryChanged();
    }
    //return;    
}

function NotifyDeploymentModeChanged()
{
    local /*0x97E50000-0x00000000*/ private bool bDeploymentModeActive[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.NotifyDeploymentModeChanged(bDeploymentModeActive);
    }
    //return;    
}

function SetDamageImmunityTime()
{
    local /*0x97E50000-0x00000000*/ private int DamageImmunityTime[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ImmunityTextMarkUp;

    ImmunityTextMarkUp = "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_Invulnerable>";
    // End:0xD2
    if(((MyLPGFxMovie != none) && MyLPGFxMovie.bCountdownVisible) && MyLPGFxMovie.CountdownTextMarkUp == ImmunityTextMarkUp)
    {
        MyLPGFxMovie.SetCountdownTime(DamageImmunityTime);
    }
    //return;    
}

function SetGameBeginCountdownTime()
{
    local /*0x97E50000-0x00000000*/ private int Time[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string CountdownTextMarkUp;

    // End:0x51
    if(Time == 0)
    {
        MyLPGFxMovie.SetCountdownTime(0);
        MyLPGFxMovie.ShowCountdown(false);
        return;
    }
    CountdownTextMarkUp = "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_GameStartCountdown>";
    // End:0x13A
    if(!MyLPGFxMovie.bCountdownVisible || MyLPGFxMovie.CountdownTextMarkUp != CountdownTextMarkUp)
    {
        MyLPGFxMovie.SetCountdownTextMarkUp(CountdownTextMarkUp);
        MyLPGFxMovie.ShowCountdown(true);
    }
    MyLPGFxMovie.SetCountdownTime(Time);
    //return;    
}

function ShowDamageImmunity()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ImmunityTextMarkUp;

    ImmunityTextMarkUp = "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_Invulnerable>";
    // End:0x14D
    if((MyLPGFxMovie != none) && !MyLPGFxMovie.bCountdownVisible || MyLPGFxMovie.CountdownTextMarkUp == ImmunityTextMarkUp)
    {
        // End:0x12D
        if(bShow && !PlayerOwner.IsInState('RoundEnded'))
        {
            MyLPGFxMovie.SetCountdownTextMarkUp(ImmunityTextMarkUp);
            MyLPGFxMovie.ShowCountdown(true);            
        }
        else
        {
            MyLPGFxMovie.ShowCountdown(false);
        }
    }
    //return;    
}

function StartCountdown()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string CountdownMarkUp[8388609];
    local /*0x97E50000-0x00000000*/ private int CountdownTime[8388609];

    // End:0xA7
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowCountdown(true);
        MyLPGFxMovie.SetCountdownTextMarkUp(CountdownMarkUp);
        MyLPGFxMovie.SetCountdownTime(CountdownTime);
        PlayerOwner.SetTimer(1.0000000, false, 'UpdateCountdown', self);
    }
    //return;    
}

function UpdateCountdown()
{
    local /*0x97E50000-0x00000000*/ private int NewCountdownTime;

    // End:0x12F
    if(MyLPGFxMovie != none)
    {
        NewCountdownTime = MyLPGFxMovie.CountdownTimeRemaining - 1;
        // End:0x8C
        if(NewCountdownTime <= 0)
        {
            MyLPGFxMovie.SetCountdownTime(0);
            MyLPGFxMovie.ShowCountdown(false);            
        }
        else
        {
            // End:0xDF
            if(!MyLPGFxMovie.bCountdownVisible && CanShowCountdown())
            {
                MyLPGFxMovie.ShowCountdown(true);
            }
            MyLPGFxMovie.SetCountdownTime(NewCountdownTime);
            PlayerOwner.SetTimer(1.0000000, false, 'UpdateCountdown', self);
        }
    }
    //return;    
}

function ShowCountdown()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x38
    if(MyLPGFxMovie != none)
    {
        MyLPGFxMovie.ShowCountdown(bShow);
    }
    //return;    
}

function CanShowCountdown()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((PlayerOwner.Pawn != none) && PlayerOwner.Pawn.IsAliveAndWell()) && !PlayerOwner.IsInState('RoundEnded');
    //return ReturnValue;    
}

function CreateInteractiveMovie()
{
    local /*0x97E50000-0x00000000*/ private @NULL MovieToPlay[8388609];
    local /*0x97E50000-0x00000000*/ private class MoviePlayerClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL RenderTarget[8388609];
    local /*0x97E50000-0x00000000*/ private byte RenderTextureMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3A
    if(InteractiveUnlockMovieInstance != none)
    {
        InteractiveUnlockMovieInstance.Close(false);
        InteractiveUnlockMovieInstance = none;
    }
    // End:0x142
    if(((MoviePlayerClass != none) && MovieToPlay != none) && InteractiveUnlockMovieInstance == none)
    {
        Class'SPGfx.SPGFxMoviePlayer'.static.StartSPGFxMoviePlayer(self, MovieToPlay, MoviePlayerClass, FindLocalPlayerIndex(LocalPlayer(PlayerOwner.Player)), InteractiveUnlockMovieInstance, 1, false, RenderTarget, RenderTextureMode);
        // End:0x142
        if(InteractiveUnlockMovieInstance != none)
        {
            InteractiveUnlockMovieInstance.Init(LocalPlayer(PlayerOwner.Player));
        }
    }
    return InteractiveUnlockMovieInstance != none;
    //return ReturnValue;    
}

function CloseInteractiveMovie()
{
    local /*0x97E50000-0x00000000*/ private bool bUnload[8388609], ReturnValue;

    // End:0x43
    if(InteractiveUnlockMovieInstance != none)
    {
        InteractiveUnlockMovieInstance.Close(bUnload);
        InteractiveUnlockMovieInstance = none;
    }
    return true;
    //return ReturnValue;    
}

function IsInteractiveMovieLoaded()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x35
    if((InteractiveUnlockMovieInstance != none) && InteractiveUnlockMovieInstance.bMovieIsOpen)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetViewManager()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], PC, MPVP;

    PC = LPMenuGamePC(PlayerOwner);
    // End:0x53
    if(PC != none)
    {
        MPVP = PC.MyLPGFxMovie_FrontEnd;
    }
    // End:0x9B
    if(MPVP == none)
    {
        // End:0x9A
        foreach Class'SPEngine.SPUtil'.static.AllMoviePlayers(Class'SPGfx.SPGFxMoviePlayerViewManager', MPVP)
        {
            // End:0x9A
            break;            
        }        
    }
    return MPVP;
    //return ReturnValue;    
}

function UnregisteredControllerButtonPress()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MPVP;
    local /*0x97E50000-0x00000000*/ private bool bHandled;

    MPVP = GetViewManager();
    // End:0x56
    if(MPVP != none)
    {
        bHandled = MPVP.UnregisteredControllerButtonPress(ControllerId);
    }
    return bHandled;
    //return ReturnValue;    
}

function NonPrimaryControllerButtonPress()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609], PlayerID;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MPVP;
    local /*0x97E50000-0x00000000*/ private bool bHandled;

    MPVP = GetViewManager();
    // End:0x5F
    if(MPVP != none)
    {
        bHandled = MPVP.NonPrimaryControllerButtonPress(ControllerId, PlayerID);
    }
    return bHandled;
    //return ReturnValue;    
}

exec function HideUIElements()
{
    local /*0x97E50000-0x00000000*/ private class elementClass[8388609];
    local /*0x97E50000-0x00000000*/ private bool bHide[8388609], bExactClass;

    false
    //return;    
}

function SetCurrentMapDisplayIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];

    MyLPGFxMovie.SetCurrentMapDisplayIndex(Index);
    // End:0x89
    if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
    {
        VSHUD_Panels[0].MyLPGFxMovie_VS.SetCurrentMapDisplayIndex(Index);
    }
    //return;    
}

function IsRadarShowingEnemies()
{
    local /*0x97E50000-0x00000000*/ private bool bVS[8388609], ReturnValue;

    // End:0x69
    if(bVS)
    {
        // End:0x66
        if(VSHUD_Panels[0].MyLPGFxMovie_VS != none)
        {
            return VSHUD_Panels[0].MyLPGFxMovie_VS.IsRadarShowingEnemies();
        }        
    }
    else
    {
        // End:0x98
        if(MyLPGFxMovie != none)
        {
            return MyLPGFxMovie.IsRadarShowingEnemies();
        }
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    bNoGRI=true
    CurrentDisplayedTemperature=32.0000000
    DirectionalDamageTimeoutTime=2.0000000
    VSDirectionalDamageTimeoutTime=1.0000000
    VSInstrumentDamageTimeoutTime=1.0000000
    SixthSenseDamageInterruptTime=0.7000000
    HullIntegrityTimeoutTime=13.0000000
    IncomingMessageTimeoutTime=20.0000000
    DpadClusterTimeoutTime=3.0000000
    AwardTimeoutTime=2.0000000
    ObjectiveCompleteMessageTimeoutTime=5.0000000
    MusicPlayerTimeoutTime=3.0000000
    // Reference: LPHUDMessageLayerManager'Default__LPHUD.LPHUDMessageLayerManagerA'
    begin object name=LPHUDMessageLayerManagerA class=Class'LPHUDMessageLayerManager'
    end object
    MessageLayerManager=LPHUDMessageLayerManagerA
}