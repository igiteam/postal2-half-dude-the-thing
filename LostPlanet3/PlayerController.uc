class PlayerController extends Controller
    nativereplication
    config(Game)
    notplaceable
    hidecategories(AnimDependency,Navigation);

const MAXPOSITIONERRORSQUARED = 3.0;
const MAXNEARZEROVELOCITYSQUARED = 9.0;
const MAXVEHICLEPOSITIONERRORSQUARED = 900.0;
const CLIENTADJUSTUPDATECOST = 180.0;
const MAXCLIENTUPDATEINTERVAL = 0.25;

enum EInputTypes
{
    IT_XAxis,                       // 0
    IT_YAxis,                       // 1
    IT_MAX                          // 2
};

enum EInputMatchAction
{
    IMA_GreaterThan,                // 0
    IMA_LessThan,                   // 1
    IMA_MAX                         // 2
};

enum EProgressMessageType
{
    PMT_Clear,                      // 0
    PMT_Information,                // 1
    PMT_AdminMessage,               // 2
    PMT_DownloadProgress,           // 3
    PMT_ConnectionFailure,          // 4
    PMT_PeerConnectionFailure,      // 5
    PMT_PeerHostMigrationFailure,   // 6
    PMT_SocketFailure,              // 7
    PMT_MAX                         // 8
};

struct native ClientAdjustment
{
    var(*) /*0x35EA0000-0x00000000*/ private float TimeStamp;
    var(*) /*0x35EA0000-0x00000000*/ private byte newPhysics;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL NewLoc;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL NewVel;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL NewBase;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL NewFloor;
    var(*) /*0x35EA0000-0x00000000*/ private byte bAckGoodMove;

    structdefaultproperties
    {
        TimeStamp=0.0000000
        newPhysics=EPhysics.PHYS_None
        NewLoc=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        NewVel=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        NewBase=none
        NewFloor=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        bAckGoodMove=0
    }
};

struct native ConnectedPeerInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL PlayerID;
    var(*) /*0x35EA0000-0x00000000*/ private byte NatType;
    var(*) /*0x35EA0000-0x00000000*/ private bool bLostConnectionToHost;

    structdefaultproperties
    {
        PlayerID=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        NatType=ENATType.NAT_Unknown
        bLostConnectionToHost=false
    }
};

struct native InputEntry
{
    var(*) /*0x35EA0000-0x00000000*/ private byte Type;
    var(*) /*0x35EA0000-0x00000000*/ private float Value;
    var(*) /*0x35EA0000-0x00000000*/ private float TimeDelta;
    var(*) /*0x35EA0000-0x00000000*/ private byte Action;

    structdefaultproperties
    {
        Type=EInputTypes.IT_XAxis
        Value=0.0000000
        TimeDelta=0.0000000
        Action=EInputMatchAction.IMA_GreaterThan
    }
};

struct native InputMatchRequest
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Inputs;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL MatchActor;
    var(*) /*0x35EA0000-0x00000000*/ private name MatchFuncName;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> MatchDelegate;
    var(*) /*0x35EA0000-0x00000000*/ private name FailedFuncName;
    var(*) /*0x35EA0000-0x00000000*/ private name RequestName;
    var(*) /*0x35EA0000-0x00000000*/ private int MatchIdx[536870913];
    var(*) /*0x35EA0000-0x00000000*/ private float LastMatchTime[536870913];

    structdefaultproperties
    {
        Inputs=none
        MatchActor=none
        MatchFuncName="None"
        MatchDelegate=None
        FailedFuncName="None"
        RequestName="None"
        MatchIdx=0
        LastMatchTime=0.0000000
    }
};

struct native DebugTextInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SrcActor;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SrcActorOffset;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SrcActorDesiredOffset;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string DebugText;
    var(*) /*0x35EA0000-0x00000000*/ private float TimeRemaining[536870913];
    var(*) /*0x35EA0000-0x00000000*/ private float Duration;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL TextColor;
    var(*) /*0x35EA0000-0x00000000*/ private bool bAbsoluteLocation;
    var(*) /*0x35EA0000-0x00000000*/ private bool bKeepAttachedToActor;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL OrigActorLocation;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Font;

    structdefaultproperties
    {
        SrcActor=none
        SrcActorOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        SrcActorDesiredOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DebugText=""
        TimeRemaining=0.0000000
        Duration=0.0000000
        TextColor=(R=0,G=0,B=0,A=0)
        bAbsoluteLocation=false
        bKeepAttachedToActor=false
        OrigActorLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Font=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL Player[131073];
var(*) /*0x10A20000-0x00000400*/ private @NULL PlayerCamera[65537];
var(*) /*0x35EA0000-0x00000000*/ private class CameraClass[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bFrozen;
var(*) /*0x35EA0000-0x00000000*/ private bool bPressedJump;
var(*) /*0x35EA0000-0x00000000*/ private bool bDoubleJump;
var(*) /*0x35EA0000-0x00000000*/ private bool bUpdatePosition;
var(*) /*0x35EA0000-0x00000000*/ private bool bUpdating;
var(*) /*0x35EA0000-0x00000000*/ private input bool bNeverSwitchOnPickup[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bCheatFlying;
var(*) /*0x35EA0000-0x00000000*/ private bool bCameraPositionLocked;
var(*) /*0x35EA0000-0x00000000*/ private bool bShortConnectTimeOut;
var(*) /*0x35EA0000-0x00000000*/ private bool bPendingDestroy[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bWasSpeedHack;
var(*) /*0x35EA0000-0x00000000*/ private bool bWasSaturated[131073];
var(*) /*0x35EA0000-0x00000000*/ private input bool bAimingHelp[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bCameraCut[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bClientSimulatingViewTarget;
var(*) /*0x35EA0000-0x00000000*/ private bool bHasVoiceHandshakeCompleted;
var(*) /*0x35EA0000-0x00000000*/ private bool bCinematicMode;
var(*) /*0x35EA0000-0x00000000*/ private bool bInteractiveMode;
var(*) /*0x35EA0000-0x00000000*/ private bool bCinemaDisableInputMove;
var(*) /*0x35EA0000-0x00000000*/ private bool bCinemaDisableInputLook;
var(*) /*0x35EA0000-0x00000000*/ private bool bRenderHUDFullScreen;
var(*) /*0x35EA0000-0x00000000*/ private bool bIgnoreNetworkMessages;
var(*) /*0x35EA0000-0x00000000*/ private bool bShowKismetDrawText[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bReplicateAllPawns;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsUsingStreamingVolumes;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsExternalUIOpen;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsControllerConnected;
var(*) /*0x35EA0000-0x00000000*/ private bool bCheckSoundOcclusion;
var(*) /*0x35EA0000-0x00000000*/ private bool bDebugCameraAnims;
var(*) /*0x35EA0000-0x00000000*/ private bool bBlockCameraAnimsFromOverridingPostProcess;
var(*) /*0x35EA0000-0x00000000*/ private input bool bLogHearSoundOverflow[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input bool bCheckRelevancyThroughPortals[1073741825];
var(*) /*0x16220000-0x00000000*/ private bool bDebugClientAdjustPosition[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bIgnorePlayerMove[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float MaxResponseTime;
var(*) /*0x35EA0000-0x00000000*/ private float WaitDelay;
var(*) /*0x35EA0000-0x00000000*/ private @NULL AcknowledgedPawn;
var(*) /*0x35EA0000-0x00000000*/ private byte DoubleClickDir;
var(*) /*0x35EA0000-0x00000000*/ private byte bIgnoreMoveInput;
var(*) /*0x35EA0000-0x00000000*/ private byte bIgnoreLookInput;
var(*) /*0x35EA0000-0x00000000*/ private byte bRun[262145];
var(*) /*0x35EA0000-0x00000000*/ private byte bDuck[262145];
var(*) /*0x35EA0000-0x00000000*/ private byte NetPlayerIndex[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ViewTarget[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RealViewTarget;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ControllingDirTrackInst[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float FOVAngle;
var(*) /*0x35EA0000-0x00000000*/ private float DesiredFOV;
var(*) /*0x35EA0000-0x00000000*/ private float DefaultFOV;
var(*) /*0x35EA0000-0x00000000*/ private float LODDistanceFactor[131073];
var(*) /*0x35EA0000-0x00000000*/ private Rotator TargetViewRotation[2097153];
var(*) /*0x35EA0000-0x00000000*/ private float TargetEyeHeight[2097153];
var(*) /*0x35EA0000-0x00000000*/ private @NULL BlendedTargetViewRotation;
var(*) /*0x35EA0000-0x00000000*/ private @NULL myHUD;
var(*) /*0x35EA0000-0x00000000*/ private @NULL mySecondaryHUD;
var(*) /*0x35EA0000-0x00000000*/ private class SavedMoveClass;
var(*) /*0x35EA0000-0x00000000*/ private @NULL SavedMoves;
var(*) /*0x35EA0000-0x00000000*/ private @NULL FreeMoves;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PendingMove;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LastAckedAccel;
var(*) /*0x35EA0000-0x00000000*/ private float CurrentTimeStamp;
var(*) /*0x35EA0000-0x00000000*/ private float LastUpdateTime;
var(*) /*0x35EA0000-0x00000000*/ private float ServerTimeStamp;
var(*) /*0x35EA0000-0x00000000*/ private float TimeMargin;
var(*) /*0x35EA0000-0x00000000*/ private float ClientUpdateTime;
var(*) /*0x35EA0000-0x00000000*/ private float MaxTimeMargin;
var(*) /*0x35EA0000-0x00000000*/ private float LastActiveTime;
var(*) /*0x35EA0000-0x00000000*/ private int ClientCap;
var(*) /*0x35EA0000-0x00000000*/ private transient float DynamicPingThreshold;
var(*) /*0x35EA0000-0x00000000*/ private float LastPingUpdate;
var(*) /*0x35EA0000-0x00000000*/ private float LastSpeedHackLog;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PendingAdjustment;
var(*) /*0x35EA0000-0x00000000*/ private int GroundPitch;
var(*) /*0x35EA0000-0x00000000*/ private @NULL CheatManager[536870913];
var(*) /*0x35EA0000-0x00000000*/ private class CheatClass;
var(*) /*0x3CD50000-0x00000400*/ private @NULL PlayerInput[536936449];
var(*) /*0x35EA0000-0x00000000*/ private class InputClass;
var(*) /*0x35EA0000-0x00000000*/ private @NULL FailedPathStart[131073];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL CylinderComponent[524289];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ForceFeedbackManagerClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ForceFeedbackManager[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Interactions[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array VoiceMuteList;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array GameplayVoiceMuteList;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array VoicePacketFilter;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ConnectedPeers;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array BestNextHostPeers;
var(*) /*0x35EA0000-0x00000000*/ private @NULL MigratedSearchToJoin;
var(*) /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;
var(*) /*0x35EA0000-0x00000000*/ private @NULL VoiceInterface;
var(*) /*0x35EA0000-0x00000000*/ private @NULL OnlinePlayerData;
var(*) /*0x35EA0000-0x00000000*/ private float InteractDistance[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private name DelayedJoinSessionName;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array InputRequests;
var(*) /*0x35EA0000-0x00000000*/ private float LastBroadcastTime;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string LastBroadcastString[4];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PendingMapChangeLevelNames;
var(*) /*0x35EA0000-0x00000000*/ private @NULL MyCoverReplicator;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array DebugTextList;
var(*) /*0x35EA0000-0x00000000*/ private float SpectatorCameraSpeed;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PendingSwapConnection[131073];
var(*) /*0x35EA0000-0x00000000*/ private float MinRespawnDelay;
var(*) /*0x35EA0000-0x00000000*/ private input int MaxConcurrentHearSounds[1073741825];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array HearSoundActiveComponents[524289];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize export array HearSoundPoolComponents[524289];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array HiddenActors;
var(*) /*0x35EA0000-0x00000000*/ private float LastSpectatorStateSynchTime;
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnMissingPeersUnregistered__Delegate;
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __CanUnpause__Delegate;
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __InputMatchDelegate__Delegate;

replication
{
    // Pos:0x000
    if(((bNetOwner && int(Role) == int(ROLE_Authority)) && ViewTarget != Pawn) && Pawn(ViewTarget) != none
        NetPlayerIndex, PendingSwapConnection;
}

// Export UPlayerController::execSetNetSpeed(FFrame&, void* const)
native final function SetNetSpeed()
{
    local /*0x35EA0000-0x00000000*/ private int NewSpeed[8388609];


}

// Export UPlayerController::execGetPlayerNetworkAddress(FFrame&, void* const)
native final function GetPlayerNetworkAddress()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UPlayerController::execGetServerNetworkAddress(FFrame&, void* const)
native final function GetServerNetworkAddress()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UPlayerController::execConsoleCommand(FFrame&, void* const)
native function ConsoleCommand()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Command[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWriteToLog[9437185];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    true                
}

// Export UPlayerController::execClientTravel(FFrame&, void* const)
reliable client native simulated event ClientTravel()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[8388609];
    local /*0x35EA0000-0x00000000*/ private byte TravelType[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bSeamless[9437185];
    local /*0x35EA0000-0x00000010*/ private @NULL MapPackageGuid[9437185];

    false                            
}

// Export UPlayerController::execUpdateURL(FFrame&, void* const)
native(546) final function UpdateURL()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string NewOption[8388609], NewValue;
    local /*0x35EA0000-0x00000000*/ private bool bSave1Default[8388609];


}

// Export UPlayerController::execGetDefaultURL(FFrame&, void* const)
native final function GetDefaultURL()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Option[8388609], ReturnValue;


}

// Export UPlayerController::execCopyToClipboard(FFrame&, void* const)
native function CopyToClipboard()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Text[8388609];


}

// Export UPlayerController::execPasteFromClipboard(FFrame&, void* const)
native function PasteFromClipboard()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UPlayerController::execSetAllowMatureLanguage(FFrame&, void* const)
native function SetAllowMatureLanguage()
{
    local /*0x35EA0000-0x00000000*/ private bool bAllowMatureLanguge[8388609];


}

// Export UPlayerController::execSetAudioGroupVolume(FFrame&, void* const)
native exec function SetAudioGroupVolume()
{
    local /*0x35EA0000-0x00000000*/ private name GroupName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Volume[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bReplaceBaseValue[9437185];

    false                    
}

// Export UPlayerController::execClientConvolve(FFrame&, void* const)
private reliable client native final simulated event ClientConvolve()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string C[8388609];
    local /*0x35EA0000-0x00000000*/ private int H[8388609];


}

// Export UPlayerController::execServerProcessConvolve(FFrame&, void* const)
private reliable server native final event ServerProcessConvolve()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string C[8388609];
    local /*0x35EA0000-0x00000000*/ private int H[8388609];


}

// Export UPlayerController::execCheckSpeedHack(FFrame&, void* const)
native final function CheckSpeedHack()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPlayerController::execFindStairRotation(FFrame&, void* const)
native(524) final function FindStairRotation()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UPlayerController::execCleanUpAudioComponents(FFrame&, void* const)
native function CleanUpAudioComponents();

simulated event FellOutOfWorld()
{
    local /*0x35EA0000-0x00000000*/ private class dmgType[8388609];

    //return;    
}

unreliable client simulated function EnableActorHeadTracking()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TargetActor[8388609];
    local /*0x35EA0000-0x00000000*/ private name TrackControllerName[8388618];
    local /*0x35EA0000-0x00000000*/ private class ActorClassesToLookAt[8388618];
    local /*0x35EA0000-0x00000000*/ private bool bLookAtPawns[8388609];
    local /*0x35EA0000-0x00000000*/ private float MinLookAtTime[8388609], MaxLookAtTime, MaxInterestTime, LookAtActorRadius;
    local /*0x35EA0000-0x00000000*/ private name TargetBoneNames[8388618];

    //return;    
}

unreliable client simulated function DisableActorHeadTracking()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TargetActor[8388609];

    //return;    
}

simulated event SoundModeFinished()
{
    local /*0x35EA0000-0x00000000*/ private @NULL FinishedSoundMode[8388609];
    local /*0x35EA0000-0x00000000*/ private name ReturnValue[92274689];

    return 'None';
    //return ReturnValue;    
}

function ForceClearUnpauseDelegates()
{
    // End:0x59
    if(WorldInfo.Game != none)
    {
        WorldInfo.Game.super(PlayerController).ForceClearUnpauseDelegates(self);
    }
    //return;    
}

function OnExternalUIChanged()
{
    local /*0x35EA0000-0x00000000*/ private bool bIsOpening[8388609];

    bIsExternalUIOpen = bIsOpening;
    SetPause(bIsOpening, CanUnpauseExternalUI);
    //return;    
}

function CanUnpauseExternalUI()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return ((!bIsExternalUIOpen || bPendingDelete) || bPendingDestroy) || bDeleteMe;
    //return ReturnValue;    
}

function OnControllerChanged()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIsConnected[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL LP;

    LP = LocalPlayer(Player);
    // End:0x11B
    if((((LP != none) && LP.ControllerId == ControllerId) && WorldInfo.IsConsoleBuild()) && (WorldInfo.Game == none) || !WorldInfo.Game.IsAutomatedPerfTesting())
    {
        bIsControllerConnected = bIsConnected;
        SetPause(!bIsConnected, CanUnpauseControllerConnected);
    }
    //return;    
}

function CanUnpauseControllerConnected()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return bIsControllerConnected;
    //return ReturnValue;    
}

function SpawnCoverReplicator()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x82
    if(((MyCoverReplicator == none) && int(Role) == int(ROLE_Authority)) && LocalPlayer(Player) == none)
    {
        MyCoverReplicator = Spawn(Class'CoverReplicator', self);
        MyCoverReplicator.ReplicateInitialCoverInfo();
    }
    return MyCoverReplicator;
    //return ReturnValue;    
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    ResetCameraMode();
    MaxTimeMargin = Class'GameInfo'.default.MaxTimeMargin;
    MaxResponseTime = default.MaxResponseTime * WorldInfo.TimeDilation;
    // End:0xA6
    if(int(WorldInfo.NetMode) == int(NM_Client))
    {
        SpawnDefaultHUD();        
    }
    else
    {
        AddCheats();
    }
    SetViewTarget(self);
    LastActiveTime = WorldInfo.TimeSeconds;
    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0x141
    if(int(WorldInfo.NetMode) == int(NM_Client))
    {
        InitNavigationHandle();
    }
    //return;    
}

simulated event ReceivedPlayer()
{
    RegisterPlayerDataStores();
    //return;    
}

final function FindConnectedPeerIndex()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PeerNetId[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689], PeerIdx;

    PeerIdx = 0;
    J0x0B:

    // End:0x77 [Loop If]
    if(PeerIdx < ConnectedPeers.Length)
    {
        // End:0x69
        if(EqualEqual_UniqueNetIdUniqueNetId(PeerNetId, ConnectedPeers[PeerIdx].PlayerID))
        {
            return PeerIdx;
        }
        PeerIdx++;
        // [Loop Continue]
        goto J0x0B;
    }
    return -1;
    //return ReturnValue;    
}

event AddPeer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PeerNetId[8388609];
    local /*0x35EA0000-0x00000000*/ private byte NatType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ZeroId, NewPeerInfo;

    // End:0xCE
    if(NotEqual_UniqueNetIdUniqueNetId(PeerNetId, ZeroId))
    {
        ServerAddPeer(PeerNetId, NatType);
        // End:0xCE
        if(int(Role) < int(ROLE_Authority))
        {
            // End:0xCE
            if(FindConnectedPeerIndex(PeerNetId) == -1)
            {
                NewPeerInfo.PlayerID = PeerNetId;
                NewPeerInfo.NatType = NatType;
                ConnectedPeers.AddItem(NewPeerInfo);                
            }
        }
    }
    //return;    
}

event RemovePeer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PeerNetId[8388609], ZeroId;
    local /*0x35EA0000-0x00000000*/ private int PeerIdx;

    // End:0x8B
    if(NotEqual_UniqueNetIdUniqueNetId(PeerNetId, ZeroId))
    {
        ServerRemovePeer(PeerNetId);
        // End:0x8B
        if(int(Role) < int(ROLE_Authority))
        {
            PeerIdx = FindConnectedPeerIndex(PeerNetId);
            // End:0x8B
            if(PeerIdx != -1)
            {
                ConnectedPeers.Remove(PeerIdx, 1);                
            }
        }
    }
    //return;    
}

reliable server function ServerAddPeer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PeerNetId[8388609];
    local /*0x35EA0000-0x00000000*/ private byte NatType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ZeroId, NewPeerInfo;

    // End:0x9E
    if(NotEqual_UniqueNetIdUniqueNetId(PeerNetId, ZeroId))
    {
        // End:0x9E
        if(FindConnectedPeerIndex(PeerNetId) == -1)
        {
            NewPeerInfo.PlayerID = PeerNetId;
            NewPeerInfo.NatType = NatType;
            ConnectedPeers.AddItem(NewPeerInfo);            
        }
    }
    //return;    
}

reliable server function ServerRemovePeer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PeerNetId[8388609], ZeroId;
    local /*0x35EA0000-0x00000000*/ private int PeerIdx;

    // End:0x64
    if(NotEqual_UniqueNetIdUniqueNetId(PeerNetId, ZeroId))
    {
        PeerIdx = FindConnectedPeerIndex(PeerNetId);
        // End:0x64
        if(PeerIdx != -1)
        {
            ConnectedPeers.Remove(PeerIdx, 1);            
        }
    }
    //return;    
}

reliable client simulated function ClientUpdateBestNextHosts()
{
    local /*0x35EA0000-0x00000000*/ private @NULL SortedNextHosts[8388618];
    local /*0x35EA0000-0x00000000*/ private byte NumEntries[8388609];
    local /*0x35EA0000-0x00000000*/ private int Idx;

    BestNextHostPeers.Length = Min(int(NumEntries), 10);
    Idx = 0;
    J0x25:

    // End:0x72 [Loop If]
    if(Idx < BestNextHostPeers.Length)
    {
        BestNextHostPeers[Idx] = SortedNextHosts[Idx];
        Idx++;
        // [Loop Continue]
        goto J0x25;
    }
    //return;    
}

event NotifyPeerDisconnectHost()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PeerNetId[8388609];
    local /*0x35EA0000-0x00000000*/ private int PeerIdx;

    PeerIdx = FindConnectedPeerIndex(PeerNetId);
    // End:0x59
    if(PeerIdx != -1)
    {
        ConnectedPeers[PeerIdx].bLostConnectionToHost = true;
    }
    //return;    
}

function IsBestHostPeer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PeerNetId[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int Idx, PeerIdx;

    Idx = 0;
    J0x0B:

    // End:0xC3 [Loop If]
    if(Idx < BestNextHostPeers.Length)
    {
        // End:0x4E
        if(EqualEqual_UniqueNetIdUniqueNetId(BestNextHostPeers[Idx], PeerNetId))
        {
            return true;
        }
        PeerIdx = FindConnectedPeerIndex(BestNextHostPeers[Idx]);
        // End:0xB5
        if(PeerIdx != -1)
        {
            // End:0xB5
            if(ConnectedPeers[PeerIdx].bLostConnectionToHost)
            {
                // [Explicit Break]
                goto J0xC3;
            }
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0xC3:

    return false;
    //return ReturnValue;    
}

event MigrateNewHost()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL LP;

    // End:0x1DF
    if(IsBestHostPeer(PlayerReplicationInfo.UniqueId))
    {
        LP = LocalPlayer(Player);
        // End:0x1B5
        if((((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none))) && OnlineSub.GameInterface.GetGameSettings(PlayerReplicationInfo.SessionName) != none) && LP != none)
        {
            OnlineSub.GameInterface.AddMigrateOnlineGameCompleteDelegate(OnHostMigratedOnlineGame);
            OnlineSub.GameInterface.MigrateOnlineGame(byte(LP.ControllerId), PlayerReplicationInfo.SessionName);            
        }
        else
        {
            PeerDesignatedAsHost(PlayerReplicationInfo.SessionName);
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function NotifyHostMigrationStarted()
{
    //return;    
}

function GetRegisteredPlayersInSession()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array OutRegisteredPlayers[25165825];

    //return;    
}

delegate OnMissingPeersUnregistered()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    //return;    
}

function GetPRIFromNetId()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609], ReturnValue, CurrentPRI;

    // End:0x81
    foreach WorldInfo.GRI.PRIArray(CurrentPRI)
    {
        // End:0x80
        if(EqualEqual_UniqueNetIdUniqueNetId(CurrentPRI.UniqueId, PlayerID))
        {            
            return CurrentPRI;
        }        
    }    
    return none;
    //return ReturnValue;    
}

function RemoveMissingPeersFromSession()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> UnregisterDelegate[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array RegisteredPlayers;
    local /*0x35EA0000-0x00000000*/ private @NULL ZeroId;
    local /*0x35EA0000-0x00000000*/ private int PlayerIdx;
    local /*0x35EA0000-0x00000000*/ private @NULL RegisteredPRI;

    // End:0x245
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none)))
    {
        GetRegisteredPlayersInSession(SessionName, RegisteredPlayers);
        PlayerIdx = 0;
        J0x6D:

        // End:0x1A9 [Loop If]
        if(PlayerIdx < RegisteredPlayers.Length)
        {
            RegisteredPRI = GetPRIFromNetId(RegisteredPlayers[PlayerIdx]);
            // End:0x198
            if(((EqualEqual_UniqueNetIdUniqueNetId(RegisteredPlayers[PlayerIdx], PlayerReplicationInfo.UniqueId) || EqualEqual_UniqueNetIdUniqueNetId(RegisteredPlayers[PlayerIdx], ZeroId)) || FindConnectedPeerIndex(RegisteredPlayers[PlayerIdx]) != -1) || !(RegisteredPRI != none) && RegisteredPRI.IsPrimaryPlayer())
            {
                RegisteredPlayers.Remove(PlayerIdx, 1);                
                PlayerIdx--;                
            }
            else
            {
                // [Explicit Break]
                goto J0x1A9;
            }
            PlayerIdx++;
            // [Loop Continue]
            goto J0x6D;
        }
        J0x1A9:

        // End:0x242
        if(RegisteredPlayers.Length > 0)
        {
            OnlineSub.GameInterface.AddUnregisterPlayerCompleteDelegate(UnregisterDelegate);
            OnlineSub.GameInterface.UnregisterPlayer(SessionName, RegisteredPlayers[0]);
            return true;
        }        
    }
    return false;
    //return ReturnValue;    
}

function OnUnregisterPlayerCompleteForHostMigrate()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    OnlineSub.GameInterface.ClearUnregisterPlayerCompleteDelegate(OnUnregisterPlayerCompleteForHostMigrate);
    // End:0x82
    if(!RemoveMissingPeersFromSession(SessionName, OnUnregisterPlayerCompleteForHostMigrate))
    {
        PeerDesignatedAsHost(SessionName);
    }
    //return;    
}

function OnHostMigratedOnlineGame()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    OnlineSub.GameInterface.ClearMigrateOnlineGameCompleteDelegate(OnHostMigratedOnlineGame);
    // End:0x92
    if(bWasSuccessful)
    {
        // End:0x8F
        if(!RemoveMissingPeersFromSession(SessionName, OnUnregisterPlayerCompleteForHostMigrate))
        {
            PeerDesignatedAsHost(SessionName);
        }        
    }
    else
    {
        ClientSetProgressMessage(6, "<Strings:Engine.Errors.ConnectionFailed>", "<Strings:Engine.Errors.ConnectionFailed_Title>", true);
    }
    //return;    
}

function GetCurrentSearchClass()
{
    local /*0x35EA0000-0x00000000*/ private class ReturnValue[92274689];

    return Class'OnlineGameSearch';
    //return ReturnValue;    
}

function PeerDesignatedAsHost()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private int PeerIdx;
    local /*0x35EA0000-0x00000000*/ private byte PlatformInfo[140];

    // End:0x184
    if((((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none))) && OnlineSub.GameInterface.GetGameSettings(SessionName) != none) && OnlineSub.GameInterface.ReadPlatformSpecificSessionInfoBySessionName(SessionName, PlatformInfo))
    {
        PeerIdx = 0;
        J0xE3:

        // End:0x181 [Loop If]
        if(PeerIdx < ConnectedPeers.Length)
        {
            // End:0x173
            if(ConnectedPeers[PeerIdx].bLostConnectionToHost)
            {
                TellPeerToTravelToSession(ConnectedPeers[PeerIdx].PlayerID, SessionName, GetCurrentSearchClass(), PlatformInfo, 80);
            }
            PeerIdx++;
            // [Loop Continue]
            goto J0xE3;
        }        
    }
    else
    {
        PeerIdx = 0;
        J0x18F:

        // End:0x20F [Loop If]
        if(PeerIdx < ConnectedPeers.Length)
        {
            // End:0x201
            if(ConnectedPeers[PeerIdx].bLostConnectionToHost)
            {
                TellPeerToTravel(ConnectedPeers[PeerIdx].PlayerID);
            }
            PeerIdx++;
            // [Loop Continue]
            goto J0x18F;
        }
    }
    PeerTravelAsHost(0.5000000, GetNewPeerHostURL());
    //return;    
}

function GetNewPeerHostURL()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return ((WorldInfo.GetMapName(true) $ "?game=") $ PathName(WorldInfo.GetGameClass())) $ "?listen";
    //return ReturnValue;    
}

// Export UPlayerController::execPeerTravelAsHost(FFrame&, void* const)
native function PeerTravelAsHost()
{
    local /*0x35EA0000-0x00000000*/ private float TravelCountdownTimer[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[8388609];


}

// Export UPlayerController::execTellPeerToTravel(FFrame&, void* const)
native function TellPeerToTravel()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ToPeerNetId[8388609];


}

// Export UPlayerController::execTellPeerToTravelToSession(FFrame&, void* const)
native function TellPeerToTravelToSession()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ToPeerNetId[8388609];
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private class SearchClass[8388609];
    local /*0x35EA0000-0x00000000*/ private byte PlatformSpecificInfo[8388748];
    local /*0x35EA0000-0x00000000*/ private int PlatformSpecificInfoSize[8388609];


}

event PeerReceivedMigratedSession()
{
    local /*0x35EA0000-0x00000000*/ private @NULL FromPeerNetId[8388609];
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private class SearchClass[8388609];
    local /*0x35EA0000-0x00000000*/ private byte PlatformSpecificInfo[8388748];
    local /*0x35EA0000-0x00000000*/ private @NULL SessionToJoin, LP;

    LP = LocalPlayer(Player);
    // End:0x24C
    if(((LP != none) && OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none)))
    {
        MigratedSearchToJoin = new SearchClass;
        // End:0x1DA
        if(OnlineSub.GameInterface.BindPlatformSpecificSessionToSearch(byte(LP.ControllerId), MigratedSearchToJoin, PlatformSpecificInfo))
        {
            SessionToJoin = MigratedSearchToJoin.Results[0];
            MigratedSearchToJoin = none;
            OnlineSub.GameInterface.AddJoinMigratedOnlineGameCompleteDelegate(OnJoinMigratedGame);
            OnlineSub.GameInterface.JoinMigratedOnlineGame(byte(LP.ControllerId), SessionName, SessionToJoin);            
        }
        else
        {
            MigratedSearchToJoin = none;
            ClientSetProgressMessage(6, "<Strings:Engine.Errors.ConnectionFailed>", "<Strings:Engine.Errors.ConnectionFailed_Title>", true);
        }
    }
    //return;    
}

function OnUnregisterPlayerCompleteForJoinMigrate()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    OnlineSub.GameInterface.ClearUnregisterPlayerCompleteDelegate(OnUnregisterPlayerCompleteForJoinMigrate);
    // End:0x82
    if(!RemoveMissingPeersFromSession(SessionName, OnUnregisterPlayerCompleteForJoinMigrate))
    {
        PeerDesignatedAsClient(SessionName);
    }
    //return;    
}

function PeerDesignatedAsClient()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL;

    // End:0x64
    if(OnlineSub.GameInterface.GetResolvedConnectString(SessionName, URL))
    {
        ClientTravel(URL, 0);        
    }
    else
    {
        ClientSetProgressMessage(6, "<Strings:Engine.Errors.ConnectionFailed>", "<Strings:Engine.Errors.ConnectionFailed_Title>", true);
    }
    //return;    
}

function OnJoinMigratedGame()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    OnlineSub.GameInterface.ClearJoinMigratedOnlineGameCompleteDelegate(OnJoinMigratedGame);
    // End:0x8F
    if(bWasSuccessful)
    {
        // End:0x8F
        if(!RemoveMissingPeersFromSession(SessionName, OnUnregisterPlayerCompleteForJoinMigrate))
        {
            PeerDesignatedAsClient(SessionName);
        }
    }
    // End:0x105
    if(!bWasSuccessful)
    {
        ClientSetProgressMessage(6, "<Strings:Engine.Errors.ConnectionFailed>", "<Strings:Engine.Errors.ConnectionFailed_Title>", true);
    }
    //return;    
}

event PreRender()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Canvas[8388609];

    //return;    
}

// Export UPlayerController::execResetTimeMargin(FFrame&, void* const)
native function ResetTimeMargin();

reliable server function ServerShortTimeout()
{
    local /*0x35EA0000-0x00000000*/ private @NULL A;

    // End:0x287
    if(!bShortConnectTimeOut)
    {
        bShortConnectTimeOut = true;
        ResetTimeMargin();
        // End:0xAC
        if(WorldInfo.Pauser != none)
        {
            // End:0xA8
            foreach AllActors(Class'Actor', A)
            {
                // End:0xA7
                if(!A.bOnlyRelevantToOwner)
                {
                    A.bForceNetUpdate = true;
                }                
            }                        
        }
        else
        {
            // End:0x1B8
            if(WorldInfo.Game.NumPlayers < 8)
            {
                // End:0x1B4
                foreach AllActors(Class'Actor', A)
                {
                    // End:0x1B3
                    if((A.NetUpdateFrequency < float(1)) && !A.bOnlyRelevantToOwner)
                    {
                        A.SetNetUpdateTime(FMin(A.NetUpdateTime, WorldInfo.TimeSeconds + (0.2000000 * FRand())));
                    }                    
                }                                
            }
            else
            {
                // End:0x286
                foreach AllActors(Class'Actor', A)
                {
                    // End:0x285
                    if((A.NetUpdateFrequency < float(1)) && !A.bOnlyRelevantToOwner)
                    {
                        A.SetNetUpdateTime(FMin(A.NetUpdateTime, WorldInfo.TimeSeconds + (0.5000000 * FRand())));
                    }                    
                }                
            }
        }
    }
    //return;    
}

function ServerGivePawn()
{
    GivePawn(Pawn);
    //return;    
}

event KickWarning()
{
    ReceiveLocalizedMessage(Class'GameMessage', 15);
    //return;    
}

function AddCheats()
{
    local /*0x35EA0000-0x00000000*/ private bool bForce[9437185];

    // End:0xB6
    if((((CheatManager == none) && WorldInfo.Game != none) && WorldInfo.Game.AllowCheats(self)) || bForce)
    {
        CheatManager = new (self) CheatClass;
        CheatManager.InitCheatManager();
    }
    //return;    
}

exec function EnableCheats()
{
    AddCheats();
    //return;    
}

function SpawnDefaultHUD()
{
    // End:0x1A
    if(LocalPlayer(Player) == none)
    {
        return;
    }
    myHUD = Spawn(Class'HUD', self);
    //return;    
}

function Reset()
{
    local /*0x35EA0000-0x00000000*/ private @NULL DrivenVehicle;

    DrivenVehicle = Vehicle(Pawn);
    // End:0x4B
    if(DrivenVehicle != none)
    {
        DrivenVehicle.DriverLeave(true);
    }
    // End:0x77
    if(Pawn != none)
    {
        PawnDied(Pawn);
        UnPossess();
    }
    super.Reset();
    SetViewTarget(self);
    ResetCameraMode();
    WaitDelay = WorldInfo.TimeSeconds + float(2);
    FixFOV();
    // End:0x103
    if(PlayerReplicationInfo.bOnlySpectator)
    {
        GotoState('Spectating');        
    }
    else
    {
        GotoState('PlayerWaiting');
    }
    //return;    
}

reliable client simulated function ClientReset()
{
    ResetCameraMode();
    SetViewTarget(self);
    GotoState(((PlayerReplicationInfo.bOnlySpectator) ? 'Spectating' : 'PlayerWaiting'));
    //return;    
}

function CleanOutSavedMoves()
{
    SavedMoves = none;
    PendingMove = none;
    //return;    
}

function PreControllerIdChange()
{
    local /*0x35EA0000-0x00000000*/ private @NULL LP;

    LP = LocalPlayer(Player);
    // End:0x49
    if(LP != none)
    {
        ClientStopNetworkedVoice();
        ClearOnlineDelegates();
        UnregisterPlayerDataStores();
    }
    //return;    
}

function PostControllerIdChange()
{
    local /*0x35EA0000-0x00000000*/ private @NULL LP, PlayerID;

    LP = LocalPlayer(Player);
    // End:0x183
    if(LP != none)
    {
        // End:0x122
        if(((int(WorldInfo.NetMode) != int(NM_Client)) && OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
        {
            OnlineSub.PlayerInterface.GetUniquePlayerId(byte(LP.ControllerId), PlayerID);
            PlayerReplicationInfo.SetUniqueId(PlayerID);
        }
        RegisterPlayerDataStores();
        RegisterOnlineDelegates();
        ClientSetOnlineStatus();
        // End:0x183
        if(!WorldInfo.Game.bRequiresPushToTalk)
        {
            ClientStartNetworkedVoice();
        }
    }
    //return;    
}

final simulated function GetOnlineSubsystem()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x38
    if(OnlineSub == none)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    }
    return OnlineSub;
    //return ReturnValue;    
}

event InitInputSystem()
{
    local /*0x35EA0000-0x00000000*/ private class FFManagerClass;
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private @NULL GameSeq;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array AllInterpActions;

    // End:0x65
    if(PlayerInput == none)
    {
        // DebugMode: 0
        assert(InputClass != none);
        PlayerInput = new (self) InputClass;
        // End:0x65
        if(PlayerInput != none)
        {
            PlayerInput.InitInputSystem();
        }
    }
    // End:0xA3
    if(Interactions.Find(PlayerInput) == )
    {        
        Interactions[Interactions.Length] = PlayerInput;
    }
    // End:0x10A
    if(ForceFeedbackManagerClassName != "")
    {
        FFManagerClass = class<ForceFeedbackManager>(DynamicLoadObject(ForceFeedbackManagerClassName, Class'Core.Class'));
        // End:0x10A
        if(FFManagerClass != none)
        {
            ForceFeedbackManager = new (self) FFManagerClass;
        }
    }
    RegisterOnlineDelegates();
    // End:0x1F6
    if(int(Role) < int(ROLE_Authority))
    {
        GameSeq = WorldInfo.GetGameSequence();
        // End:0x1F6
        if(GameSeq != none)
        {
            GameSeq.FindSeqObjectsByClass(Class'SeqAct_Interp', true, AllInterpActions);
            I = 0;
            J0x19D:

            // End:0x1F6 [Loop If]
            if(I < AllInterpActions.Length)
            {
                SeqAct_Interp(AllInterpActions[I]).AddPlayerToDirectorTracks(self);
                I++;
                // [Loop Continue]
                goto J0x19D;
            }
        }
    }
    SetOnlyUseControllerTiltInput(false);
    SetUseTiltForwardAndBack(true);
    SetControllerTiltActive(false);
    //return;    
}

reliable client simulated function ClientInitializeDataStores()
{
    RegisterPlayerDataStores();
    //return;    
}

final simulated function RegisterPlayerDataStores()
{
    RegisterCustomPlayerDataStores();
    RegisterStandardPlayerDataStores();
    //return;    
}

protected simulated function RegisterCustomPlayerDataStores()
{
    local /*0x35EA0000-0x00000000*/ private @NULL LP, DataStoreManager;
    local /*0x35EA0000-0x00000000*/ private class PlayerDataStoreClass;

    LP = LocalPlayer(Player);
    // End:0x180
    if(LP != none)
    {
        DataStoreManager = Class'UIInteraction'.static.GetDataStoreClient();
        // End:0x180
        if(DataStoreManager != none)
        {
            OnlinePlayerData = UIDataStore_OnlinePlayerData(DataStoreManager.FindDataStore('OnlinePlayerData', LP));
            // End:0x180
            if(OnlinePlayerData == none)
            {
                PlayerDataStoreClass = class<UIDataStore_OnlinePlayerData>(DataStoreManager.FindDataStoreClass(Class'UIDataStore_OnlinePlayerData'));
                // End:0x17D
                if(PlayerDataStoreClass != none)
                {
                    OnlinePlayerData = DataStoreManager.CreateDataStore(PlayerDataStoreClass);
                    // End:0x17A
                    if(OnlinePlayerData != none)
                    {
                        // End:0x177
                        if(!DataStoreManager.RegisterDataStore(OnlinePlayerData, LP))
                        {
                        }                        
                    }                    
                }                
            }
        }
    }
    //return;    
}

protected simulated function RegisterStandardPlayerDataStores()
{
    local /*0x35EA0000-0x00000000*/ private @NULL LP, DataStoreManager;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array PlayerDataStoreClasses;
    local /*0x35EA0000-0x00000000*/ private class PlayerDataStoreClass;
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerDataStore;
    local /*0x35EA0000-0x00000000*/ private int ClassIndex;

    LP = LocalPlayer(Player);
    // End:0x1C1
    if(LP != none)
    {
        DataStoreManager = Class'UIInteraction'.static.GetDataStoreClient();
        // End:0x1C1
        if(DataStoreManager != none)
        {
            DataStoreManager.GetPlayerDataStoreClasses(PlayerDataStoreClasses);
            ClassIndex = 0;
            J0x96:

            // End:0x1C1 [Loop If]
            if(ClassIndex < PlayerDataStoreClasses.Length)
            {
                PlayerDataStoreClass = PlayerDataStoreClasses[ClassIndex];
                // End:0x1B3
                if(PlayerDataStoreClass != none)
                {
                    PlayerDataStore = DataStoreManager.FindDataStore(PlayerDataStoreClass.default.Tag, LP);
                    // End:0x1B3
                    if(PlayerDataStore == none)
                    {
                        PlayerDataStore = DataStoreManager.CreateDataStore(PlayerDataStoreClass);
                        // End:0x1B0
                        if(PlayerDataStore != none)
                        {
                            // End:0x1B0
                            if(!DataStoreManager.RegisterDataStore(PlayerDataStore, LP))
                            {
                            }
                        }                        
                    }
                }
                ClassIndex++;
                // [Loop Continue]
                goto J0x96;
            }
        }
    }
    //return;    
}

simulated function UnregisterPlayerDataStores()
{
    local /*0x35EA0000-0x00000000*/ private @NULL LP, DataStoreManager, OnlinePlayerDataStore;

    LP = LocalPlayer(Player);
    // End:0xFE
    if(LP != none)
    {
        DataStoreManager = Class'UIInteraction'.static.GetDataStoreClient();
        // End:0xFE
        if(DataStoreManager != none)
        {
            OnlinePlayerData = none;
            OnlinePlayerDataStore = UIDataStore_OnlinePlayerData(DataStoreManager.FindDataStore('OnlinePlayerData', LP));
            // End:0xF1
            if(OnlinePlayerDataStore != none)
            {
                // End:0xEE
                if(!DataStoreManager.UnregisterDataStore(OnlinePlayerDataStore))
                {
                }                
            }
            UnregisterStandardPlayerDataStores();            
        }
    }
    //return;    
}

simulated function UnregisterStandardPlayerDataStores()
{
    local /*0x35EA0000-0x00000000*/ private @NULL LP, DataStoreManager;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array PlayerDataStoreClasses;
    local /*0x35EA0000-0x00000000*/ private class PlayerDataStoreClass;
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerDataStore;
    local /*0x35EA0000-0x00000000*/ private int ClassIndex;

    LP = LocalPlayer(Player);
    // End:0x174
    if(LP != none)
    {
        DataStoreManager = Class'UIInteraction'.static.GetDataStoreClient();
        // End:0x174
        if(DataStoreManager != none)
        {
            DataStoreManager.GetPlayerDataStoreClasses(PlayerDataStoreClasses);
            ClassIndex = 0;
            J0x96:

            // End:0x174 [Loop If]
            if(ClassIndex < PlayerDataStoreClasses.Length)
            {
                PlayerDataStoreClass = PlayerDataStoreClasses[ClassIndex];
                // End:0x166
                if(PlayerDataStoreClass != none)
                {
                    PlayerDataStore = DataStoreManager.FindDataStore(PlayerDataStoreClass.default.Tag, LP);
                    // End:0x166
                    if(PlayerDataStore != none)
                    {
                        // End:0x166
                        if(!DataStoreManager.UnregisterDataStore(PlayerDataStore))
                        {
                        }
                    }
                }
                ClassIndex++;
                // [Loop Continue]
                goto J0x96;
            }
        }
    }
    //return;    
}

simulated function ReloadProfileSettings()
{
    // End:0x69
    if((OnlinePlayerData != none) && OnlinePlayerData.ProfileProvider != none)
    {
        OnlinePlayerData.ProfileProvider.RefreshStorageData();
    }
    //return;    
}

final function SetRumbleScale()
{
    local /*0x35EA0000-0x00000000*/ private float ScaleBy[8388609];

    // End:0x37
    if(ForceFeedbackManager != none)
    {
        ForceFeedbackManager.ScaleAllWaveformsBy = ScaleBy;
    }
    //return;    
}

// Export UPlayerController::execIsControllerTiltActive(FFrame&, void* const)
native simulated function IsControllerTiltActive()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPlayerController::execSetControllerTiltActive(FFrame&, void* const)
native simulated function SetControllerTiltActive()
{
    local /*0x35EA0000-0x00000000*/ private bool bActive[8388609];


}

// Export UPlayerController::execSetOnlyUseControllerTiltInput(FFrame&, void* const)
native simulated function SetOnlyUseControllerTiltInput()
{
    local /*0x35EA0000-0x00000000*/ private bool bActive[8388609];


}

// Export UPlayerController::execSetUseTiltForwardAndBack(FFrame&, void* const)
native simulated function SetUseTiltForwardAndBack()
{
    local /*0x35EA0000-0x00000000*/ private bool bActive[8388609];


}

// Export UPlayerController::execIsKeyboardAvailable(FFrame&, void* const)
native simulated function IsKeyboardAvailable()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPlayerController::execIsMouseAvailable(FFrame&, void* const)
native simulated function IsMouseAvailable()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

exec function SetTiltActive()
{
    local /*0x35EA0000-0x00000000*/ private bool bActive[8388609];

    SetControllerTiltActive(bActive);
    //return;    
}

reliable client simulated function ClientGotoState()
{
    local /*0x35EA0000-0x00000000*/ private name NewState[8388609], NewLabel;

    // End:0x56
    if(((NewLabel == 'Begin') || NewLabel == 'None') && !IsInState(NewState))
    {
        GotoState(NewState);        
    }
    else
    {
        GotoState(NewState, NewLabel);
    }
    //return;    
}

reliable server function AskForPawn()
{
    // End:0x26
    if(GamePlayEndedState())
    {
        ClientGotoState(GetStateName(), 'Begin');        
    }
    else
    {
        // End:0x4B
        if(Pawn != none)
        {
            GivePawn(Pawn);            
        }
        else
        {
            bFrozen = false;
            ServerRestartPlayer();
        }
    }
    //return;    
}

reliable client simulated event GivePawn()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewPawn[8388609];

    // End:0x11
    if(NewPawn == none)
    {
        return;
    }
    // End:0x94
    if((Pawn != NewPawn) || NewPawn.Controller != self)
    {
        Pawn = NewPawn;
        NewPawn.Controller = self;
        ClientRestart(Pawn);
    }
    //return;    
}

event Possess()
{
    local /*0x35EA0000-0x00000000*/ private @NULL aPawn[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bVehicleTransition[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL A;
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private @NULL TouchEvent;

    // End:0x20C
    if(!PlayerReplicationInfo.bOnlySpectator)
    {
        // End:0x7C
        if(aPawn.Controller != none)
        {
            aPawn.Controller.UnPossess();
        }
        aPawn.PossessedBy(self, bVehicleTransition);
        Pawn = aPawn;
        Pawn.SetTickIsDisabled(false);
        ResetTimeMargin();
        Restart(bVehicleTransition);
        // End:0x20B
        foreach Pawn.TouchingActors(Class'Actor', A)
        {
            I = 0;
            J0x12F:

            // End:0x20A [Loop If]
            if(I < A.GeneratedEvents.Length)
            {
                TouchEvent = SeqEvent_Touch(A.GeneratedEvents[I]);
                // End:0x1FC
                if((TouchEvent != none) && TouchEvent.bPlayerOnly)
                {
                    TouchEvent.CheckTouchActivate(A, Pawn);
                }
                I++;
                // [Loop Continue]
                goto J0x12F;
            }            
        }        
    }
    //return;    
}

function AcknowledgePossession()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];

    // End:0xA9
    if(LocalPlayer(Player) != none)
    {
        AcknowledgedPawn = P;
        // End:0x96
        if(P != none)
        {
            P.SetBaseEyeheight();
            P.EyeHeight = P.BaseEyeHeight;
        }
        ServerAcknowledgePossession(P);
    }
    //return;    
}

reliable server function ServerAcknowledgePossession()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];

    // End:0x4B
    if(((P != none) && P == Pawn) && P != AcknowledgedPawn)
    {
        ResetTimeMargin();
    }
    AcknowledgedPawn = P;
    //return;    
}

event UnPossess()
{
    // End:0xB2
    if(Pawn != none)
    {
        SetLocation(Pawn.Location);
        // End:0x65
        if(int(Role) == int(ROLE_Authority))
        {
            Pawn.RemoteRole = ROLE_SimulatedProxy;
        }
        Pawn.UnPossessed();
        CleanOutSavedMoves();
        // End:0xB2
        if((GetViewTarget()) == Pawn)
        {
            SetViewTarget(self);
        }
    }
    Pawn = none;
    //return;    
}

function PawnDied()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];

    // End:0x70
    if(P == Pawn)
    {
        // End:0x5D
        if((int(Role) == int(ROLE_Authority)) && Pawn != none)
        {
            Pawn.RemoteRole = ROLE_SimulatedProxy;
        }
        super.PawnDied(P);
    }
    //return;    
}

reliable client simulated function ClientSetHUD()
{
    local /*0x35EA0000-0x00000000*/ private class newHUDType[8388609];

    // End:0x27
    if(myHUD != none)
    {
        myHUD.Destroy();
    }
    myHUD = ((newHUDType != none) ? Spawn(newHUDType, self) : none);
    //return;    
}

reliable client simulated function ClientSetSecondaryHUD()
{
    local /*0x35EA0000-0x00000000*/ private class newHUDType[8388609];

    // End:0x27
    if(mySecondaryHUD != none)
    {
        mySecondaryHUD.Destroy();
    }
    mySecondaryHUD = ((newHUDType != none) ? Spawn(newHUDType, self) : none);
    //return;    
}

function HandlePickup()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Inv[8388609];

    ReceiveLocalizedMessage(Inv.MessageClass,,,, Inv.Class);
    //return;    
}

function CleanupPRI()
{
    WorldInfo.Game.AddInactivePRI(PlayerReplicationInfo, self);
    PlayerReplicationInfo = none;
    //return;    
}

reliable client simulated event ReceiveLocalizedMessage()
{
    local /*0x35EA0000-0x00000000*/ private class Message[8388609];
    local /*0x35EA0000-0x00000000*/ private int Switch[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL RelatedPRI_1[9437185], RelatedPRI_2, OptionalObject;

    // End:0x55
    if((int(WorldInfo.NetMode) == int(NM_DedicatedServer)) || WorldInfo.GRI == none)
    {
        return;
    }
    Message.static.ClientReceive(self, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    //return;    
}

unreliable client simulated event ClientPlaySound()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ASound[8388609];

    ClientHearSound(ASound, self, Location, false, false);
    //return;    
}

simulated function @NULL HearSoundFinished()
{
    local /*0x35EA0000-0x00000400*/ private @NULL AC[8388609];

    HearSoundActiveComponents.RemoveItem(AC);    
    // End:0x77
    if(!AC.IsPendingKill())
    {
        AC.ResetToDefaults();
        HearSoundPoolComponents[HearSoundPoolComponents.Length] = AC;
    }
    //return;    
}

// Export UPlayerController::execGetPooledAudioComponent(FFrame&, void* const)
native function @NULL GetPooledAudioComponent()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ASound[8388609], SourceActor;
    local /*0x35EA0000-0x00000000*/ private bool bStopWhenOwnerDestroyed[8388609], bUseLocation;
    local /*0x35EA0000-0x00000000*/ private @NULL SourceLocation[9437185], ReturnValue;


}

unreliable client simulated event @NULL ClientHearSound()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ASound[8388609], SourceActor, SourceLocation;
    local /*0x35EA0000-0x00000000*/ private bool bStopWhenOwnerDestroyed[8388609], bIsOccluded;
    local /*0x35EA0000-0x00000400*/ private @NULL AC;

    // End:0xA7
    if(SourceActor == none)
    {
        AC = GetPooledAudioComponent(ASound, SourceActor, bStopWhenOwnerDestroyed, true, SourceLocation);
        // End:0x5B
        if(AC == none)
        {
            return;
        }
        AC.bUseOwnerLocation = false;
        AC.Location = SourceLocation;        
    }
    else
    {
        // End:0x12F
        if((SourceActor == (GetViewTarget())) || SourceActor == self)
        {
            AC = GetPooledAudioComponent(ASound, none, bStopWhenOwnerDestroyed);
            // End:0x10B
            if(AC == none)
            {
                return;
            }
            AC.bAllowSpatialization = false;            
        }
        else
        {
            AC = GetPooledAudioComponent(ASound, SourceActor, bStopWhenOwnerDestroyed);
            // End:0x172
            if(AC == none)
            {
                return;
            }
            // End:0x1FA
            if(!IsZero(SourceLocation) && SourceLocation != SourceActor.Location)
            {
                AC.bUseOwnerLocation = false;
                AC.Location = SourceLocation;
            }
        }
    }
    // End:0x22C
    if(bIsOccluded)
    {
        AC.VolumeMultiplier *= 0.5000000;
    }
    AC.Play();
    //return;    
}

// Export UPlayerController::execWwiseClientHearSound(FFrame&, void* const)
unreliable client native simulated event WwiseClientHearSound()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ASound[8388609], SourceActor, SourceLocation;
    local /*0x35EA0000-0x00000000*/ private bool bStopWhenOwnerDestroyed[8388609], bIsOccluded;


}

simulated function IsClosestLocalPlayerToActor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL PC;
    local /*0x35EA0000-0x00000000*/ private float MyDist;

    // End:0x11
    if(ViewTarget == none)
    {
        return false;
    }
    MyDist = VSize(ViewTarget.Location - TheActor.Location);
    // End:0x118
    foreach LocalPlayerControllers(Class'PlayerController', PC)
    {
        // End:0x117
        if(((PC != self) && PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - TheActor.Location) < MyDist)
        {            
            return false;
        }        
    }    
    return true;
    //return ReturnValue;    
}

reliable client simulated event @NULL Kismet_ClientPlaySound()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ASound[8388609], SourceActor;
    local /*0x35EA0000-0x00000000*/ private float VolumeMultiplier[8388609], PitchMultiplier, FadeInTime;
    local /*0x35EA0000-0x00000000*/ private bool bSuppressSubtitles[8388609], bSuppressSpatialization;
    local /*0x35EA0000-0x00000400*/ private @NULL AC;

    // End:0x238
    if((SourceActor != none) && IsClosestLocalPlayerToActor(SourceActor))
    {
        // End:0xD8
        if((ASound.FaceFXAnimName != "") && SourceActor.PlayActorFaceFXAnim(ASound.FaceFXAnimSetRef, ASound.FaceFXGroupName, ASound.FaceFXAnimName, ASound, none))
        {            
        }
        else
        {
            AC = SourceActor.CreateAudioComponent(ASound, false, true);
            // End:0x238
            if(AC != none)
            {
                AC.VolumeMultiplier = VolumeMultiplier;
                AC.PitchMultiplier = PitchMultiplier;
                AC.bAutoDestroy = true;
                AC.SubtitlePriority = 10000.0000000;
                AC.bSuppressSubtitles = bSuppressSubtitles;
                AC.FadeIn(FadeInTime, 1.0000000);
                // End:0x238
                if(bSuppressSpatialization)
                {
                    AC.bAllowSpatialization = false;
                }
            }
        }
    }
    //return;    
}

reliable client simulated event @NULL Kismet_ClientStopSound()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ASound[8388609], SourceActor;
    local /*0x35EA0000-0x00000000*/ private float FadeOutTime[8388609];
    local /*0x35EA0000-0x00000400*/ private @NULL AC, CheckAC;

    // End:0x22
    if(SourceActor == none)
    {
        SourceActor = WorldInfo;
    }
    // End:0x99
    foreach SourceActor.AllOwnedComponents(Class'AudioComponent', CheckAC)
    {
        // End:0x98
        if(CheckAC.SoundCue == ASound)
        {
            AC = CheckAC;
            // End:0x99
            break;
        }        
    }    
    // End:0xD6
    if(AC != none)
    {
        AC.FadeOut(FadeOutTime, 0.0000000);
    }
    //return;    
}

reliable client simulated function ClientPlayActorFaceFXAnim()
{
    local /*0x35EA0000-0x00000000*/ private @NULL SourceActor[8388609], AnimSet;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string GroupName[8388609], SeqName;
    local /*0x35EA0000-0x00000000*/ private @NULL SoundCueToPlay[8388609], AkEventToPlay;

    // End:0x5C
    if(SourceActor != none)
    {
        SourceActor.PlayActorFaceFXAnim(AnimSet, GroupName, SeqName, SoundCueToPlay, AkEventToPlay);
    }
    //return;    
}

reliable client simulated event ClientMessage()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string S[142606337];
    local /*0x35EA0000-0x00000000*/ private name Type[9437185];
    local /*0x35EA0000-0x00000000*/ private float MsgLifeTime[9437185];

    // End:0x53
    if((int(WorldInfo.NetMode) == int(NM_DedicatedServer)) || WorldInfo.GRI == none)
    {
        return;
    }
    // End:0x7D
    if(Type == 'None')
    {
        Type = 'Event';
    }
    TeamMessage(PlayerReplicationInfo, S, Type, MsgLifeTime);
    //return;    
}

private final simulated function CanCommunicate()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

private final simulated function AllowTTSMessageFrom()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PRI[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

// Export UPlayerController::execCreateTTSSoundCue(FFrame&, void* const)
private native final simulated function CreateTTSSoundCue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string StrToSpeak[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PRI[8388609], ReturnValue;


}

exec function Talk()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerConsole, LP;

    LP = LocalPlayer(Player);
    // End:0xE0
    if(((LP != none) && CanCommunicate()) && LP.ViewportClient.ViewportConsole != none)
    {
        PlayerConsole = LocalPlayer(Player).ViewportClient.ViewportConsole;
        PlayerConsole.StartTyping("Say ");
    }
    //return;    
}

exec function TeamTalk()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerConsole, LP;

    LP = LocalPlayer(Player);
    // End:0xE4
    if(((LP != none) && CanCommunicate()) && LP.ViewportClient.ViewportConsole != none)
    {
        PlayerConsole = LocalPlayer(Player).ViewportClient.ViewportConsole;
        PlayerConsole.StartTyping("TeamSay ");
    }
    //return;    
}

simulated function @NULL SpeakTTS()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string S[142606337];
    local /*0x35EA0000-0x00000000*/ private @NULL PRI[9437185], Cue, AC;

    Cue = CreateTTSSoundCue(S, PRI);
    // End:0xB9
    if(Cue != none)
    {
        AC = CreateAudioComponent(Cue, false, true,,, true);
        AC.bAllowSpatialization = false;
        AC.bAutoDestroy = true;
        AC.Play();
    }
    //return;    
}

reliable client simulated event TeamMessage()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PRI[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string S[142606337];
    local /*0x35EA0000-0x00000000*/ private name Type[8388609];
    local /*0x35EA0000-0x00000000*/ private float MsgLifeTime[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bIsUserCreated;

    // End:0x21F
    if(CanCommunicate())
    {
        // End:0xB0
        if((((Type == 'Say') || Type == 'TeamSay') && PRI != none) && AllowTTSMessageFrom(PRI))
        {
            // End:0xB0
            if(!bIsUserCreated || bIsUserCreated && CanViewUserCreatedContent())
            {
                SpeakTTS(S, PRI);
            }
        }
        // End:0x102
        if(myHUD != none)
        {
            myHUD.Message(PRI, S, Type, MsgLifeTime);
        }
        // End:0x188
        if(((Type == 'Say') || Type == 'TeamSay') && PRI != none)
        {
            S = (PRI.PlayerName $ ": ") $ S;
            bIsUserCreated = true;
        }
        // End:0x21F
        if(Player != none)
        {
            // End:0x21F
            if(!bIsUserCreated || bIsUserCreated && CanViewUserCreatedContent())
            {
                LocalPlayer(Player).ViewportClient.ViewportConsole.OutputText(S);
            }
        }
    }
    //return;    
}

function PlayBeepSound()
{
    //return;    
}

function RegisterOnlineDelegates()
{
    local /*0x35EA0000-0x00000000*/ private @NULL LP;

    LP = LocalPlayer(Player);
    // End:0x2C1
    if((OnlineSub != none) && LP != none)
    {
        VoiceInterface = OnlineSub.VoiceInterface;
        // End:0x125
        if(NotEqual_InterfaceInterface(OnlineSub.SystemInterface, OnlineSystemInterface(none)))
        {
            OnlineSub.SystemInterface.AddExternalUIChangeDelegate(OnExternalUIChanged);
            OnlineSub.SystemInterface.AddControllerChangeDelegate(OnControllerChanged);
        }
        // End:0x1C0
        if(NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none)))
        {
            OnlineSub.GameInterface.AddGameInviteAcceptedDelegate(byte(LP.ControllerId), OnGameInviteAccepted);
        }
        // End:0x2C1
        if(NotEqual_InterfaceInterface(OnlineSub.PartyChatInterface, OnlinePartyChatInterface(none)))
        {
            OnlineSub.PartyChatInterface.AddPartyMemberListChangedDelegate(byte(LP.ControllerId), OnPartyMemberListChanged);
            OnlineSub.PartyChatInterface.AddPartyMembersInfoChangedDelegate(byte(LP.ControllerId), OnPartyMembersInfoChanged);
        }
    }
    //return;    
}

function OnPartyMemberListChanged()
{
    local /*0x35EA0000-0x00000000*/ private bool bJoinedOrLeft[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string PlayerName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];

    //return;    
}

function OnPartyMembersInfoChanged()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string PlayerName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private int CustomData1[8388609], CustomData2, CustomData3, CustomData4;

    //return;    
}

event ClearOnlineDelegates()
{
    local /*0x35EA0000-0x00000000*/ private @NULL LP;

    LP = LocalPlayer(Player);
    // End:0x2BC
    if((int(Role) < int(ROLE_Authority)) || LP != none)
    {
        // End:0x2BC
        if(OnlineSub != none)
        {
            // End:0x111
            if(NotEqual_InterfaceInterface(OnlineSub.SystemInterface, OnlineSystemInterface(none)))
            {
                OnlineSub.SystemInterface.ClearExternalUIChangeDelegate(OnExternalUIChanged);
                OnlineSub.SystemInterface.ClearControllerChangeDelegate(OnControllerChanged);
            }
            // End:0x2BC
            if(LP != none)
            {
                // End:0x1BB
                if(NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none)))
                {
                    OnlineSub.GameInterface.ClearGameInviteAcceptedDelegate(byte(LP.ControllerId), OnGameInviteAccepted);
                }
                // End:0x2BC
                if(NotEqual_InterfaceInterface(OnlineSub.PartyChatInterface, OnlinePartyChatInterface(none)))
                {
                    OnlineSub.PartyChatInterface.ClearPartyMemberListChangedDelegate(byte(LP.ControllerId), OnPartyMemberListChanged);
                    OnlineSub.PartyChatInterface.ClearPartyMembersInfoChangedDelegate(byte(LP.ControllerId), OnPartyMembersInfoChanged);
                }
            }
        }
    }
    //return;    
}

function CleanUpSelf()
{
    // End:0x40
    if(LocalPlayer(Player) != none)
    {
        LocalPlayer(Player).SceneMaterialCleanUp();
    }
    //return;    
}

function CleanupPawn()
{
    local /*0x35EA0000-0x00000000*/ private @NULL DrivenVehicle, Driver;

    DrivenVehicle = Vehicle(Pawn);
    // End:0xEC
    if(DrivenVehicle != none)
    {
        Driver = DrivenVehicle.Driver;
        DrivenVehicle.DriverLeave(true);
        // End:0xE9
        if(Driver != none)
        {
            Driver.Health = 0;
            Driver.Died(self, Class'DmgType_Suicided', Driver.Location);
        }        
    }
    else
    {
        // End:0x162
        if(Pawn != none)
        {
            Pawn.Health = 0;
            Pawn.Died(self, Class'DmgType_Suicided', Pawn.Location);
        }
    }
    //return;    
}

event Destroyed()
{
    local /*0x35EA0000-0x00000000*/ private int EffectIdx;
    local /*0x35EA0000-0x00000000*/ private @NULL LPlayer, Effect, MIC;

    ClientPlayForceFeedbackWaveform(none, none);
    // End:0x44
    if((int(Role) < int(ROLE_Authority)) || LocalPlayer(Player) != none)
    {
        ClearOnlineDelegates();
    }
    // End:0x5D
    if(Pawn != none)
    {
        CleanupPawn();
    }
    // End:0x8F
    if(myHUD != none)
    {
        myHUD.Destroy();
        myHUD = none;
    }
    // End:0xC1
    if(PlayerCamera != none)
    {
        PlayerCamera.Destroy();
        PlayerCamera = none;
    }
    ForceClearUnpauseDelegates();
    UnregisterPlayerDataStores();
    CleanUpSelf();
    LPlayer = LocalPlayer(Player);
    // End:0x2B3
    if((LPlayer != none) && LPlayer.PlayerPostProcess != none)
    {
        EffectIdx = 0;
        J0x13B:

        // End:0x2B3 [Loop If]
        if(EffectIdx < LPlayer.PlayerPostProcess.Effects.Length)
        {
            Effect = MaterialEffect(LPlayer.PlayerPostProcess.Effects[EffectIdx]);
            // End:0x2A5
            if((Effect != none) && Effect.Material != none)
            {
                MIC = MaterialInstanceConstant(Effect.Material);
                // End:0x2A5
                if((MIC != none) && MIC.Parent != none)
                {
                    Effect.Material = MIC.Parent;
                }
            }
            EffectIdx++;
            // [Loop Continue]
            goto J0x13B;
        }
    }
    super.Destroyed();
    //return;    
}

function FixFOV()
{
    FOVAngle = default.DefaultFOV;
    DesiredFOV = default.DefaultFOV;
    DefaultFOV = default.DefaultFOV;
    //return;    
}

function SetFOV()
{
    local /*0x35EA0000-0x00000000*/ private float NewFOV[8388609];

    DesiredFOV = NewFOV;
    FOVAngle = NewFOV;
    //return;    
}

function ResetFOV()
{
    DesiredFOV = DefaultFOV;
    FOVAngle = DefaultFOV;
    //return;    
}

exec function FOV()
{
    local /*0x35EA0000-0x00000000*/ private float F[8388609];

    // End:0x39
    if(PlayerCamera != none)
    {
        PlayerCamera.SetFOV(F);
        return;
    }
    // End:0xCD
    if(((F >= 80.0000000) || int(WorldInfo.NetMode) == int(NM_Standalone)) || PlayerReplicationInfo.bOnlySpectator)
    {
        DefaultFOV = FClamp(F, 80.0000000, 100.0000000);
        DesiredFOV = DefaultFOV;
    }
    //return;    
}

exec function Mutate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string MutateString[8388609];

    ServerMutate(MutateString);
    //return;    
}

reliable server function ServerMutate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string MutateString[8388609];

    // End:0x2B
    if(int(WorldInfo.NetMode) == int(NM_Client))
    {
        return;
    }
    WorldInfo.Game.Mutate(MutateString, self);
    //return;    
}

function AllowTextMessage()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string msg[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int I;

    // End:0x4F
    if((int(WorldInfo.NetMode) == int(NM_Standalone)) || PlayerReplicationInfo.bAdmin)
    {
        return true;
    }
    // End:0xA9
    if((WorldInfo.Pauser == none) && (WorldInfo.TimeSeconds - LastBroadcastTime) < float(2))
    {
        return false;
    }
    // End:0x151
    if((WorldInfo.TimeSeconds - LastBroadcastTime) < float(5))
    {
        msg = Left(msg, Clamp(Len(msg) - 4, 8, 64));
        I = 0;
        J0x110:

        // End:0x151 [Loop If]
        if(I < 4)
        {
            // End:0x143
            if(LastBroadcastString[I] ~= msg)
            {
                return false;
            }
            I++;
            // [Loop Continue]
            goto J0x110;
        }
    }
    I = 3;
    J0x15D:

    // End:0x1A4 [Loop If]
    if(I > 0)
    {
        LastBroadcastString[I] = LastBroadcastString[I - 1];
        I--;
        // [Loop Continue]
        goto J0x15D;
    }
    LastBroadcastTime = WorldInfo.TimeSeconds;
    return true;
    //return ReturnValue;    
}

exec function Say()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string msg[8388609];

    msg = Left(msg, 128);
    // End:0x40
    if(AllowTextMessage(msg))
    {
        ServerSay(msg);
    }
    //return;    
}

unreliable server function ServerSay()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string msg[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    // End:0xBB
    if(PlayerReplicationInfo.bAdmin && Left(msg, 1) == "#")
    {
        msg = Right(msg, Len(msg) - 1);
        // End:0xB8
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            PC.ClientAdminMessage(msg);            
        }        
        return;
    }
    WorldInfo.Game.Broadcast(self, msg, 'Say');
    //return;    
}

reliable client simulated function ClientAdminMessage()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string msg[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL LP;

    LP = LocalPlayer(Player);
    // End:0xD9
    if(LP != none)
    {
        LP.ViewportClient.ClearProgressMessages();
        LP.ViewportClient.SetProgressTime(6.0000000);
        LP.ViewportClient.SetProgressMessage(2, msg);
    }
    //return;    
}

exec function TeamSay()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string msg[8388609];

    msg = Left(msg, 128);
    // End:0x40
    if(AllowTextMessage(msg))
    {
        ServerTeamSay(msg);
    }
    //return;    
}

unreliable server function ServerTeamSay()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string msg[8388609];

    LastActiveTime = WorldInfo.TimeSeconds;
    // End:0x8B
    if(!WorldInfo.GRI.GameClass.default.bTeamGame)
    {
        Say(msg);
        return;
    }
    WorldInfo.Game.BroadcastTeam(self, msg, 'TeamSay');
    //return;    
}

event PreClientTravel()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string PendingURL[8388609];
    local /*0x35EA0000-0x00000000*/ private byte TravelType[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIsSeamlessTravel[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL UIController, GameSceneClient;

    UIController = GetUIController();
    // End:0xEF
    if((UIController != none) && IsPrimaryPlayer())
    {
        GameSceneClient = UIController.SceneClient;
        // End:0xA5
        if(GameSceneClient != none)
        {
            GameSceneClient.NotifyClientTravel(self, PendingURL, TravelType, bIsSeamlessTravel);
        }
        // End:0xEF
        if(PlayerInput != none)
        {
            PlayerInput.PreClientTravel(PendingURL, TravelType, bIsSeamlessTravel);
        }
    }
    //return;    
}

exec function Camera()
{
    local /*0x35EA0000-0x00000000*/ private name NewMode[8388609];

    ServerCamera(NewMode);
    //return;    
}

reliable server function ServerCamera()
{
    local /*0x35EA0000-0x00000000*/ private name NewMode[8388609];

    // End:0x2D
    if(NewMode == '1st')
    {
        NewMode = 'FirstPerson';        
    }
    else
    {
        // End:0x57
        if(NewMode == '3rd')
        {
            NewMode = 'ThirdPerson';
        }
    }
    SetCameraMode(NewMode);
    //return;    
}

reliable client simulated function ClientSetCameraMode()
{
    local /*0x35EA0000-0x00000000*/ private name NewCamMode[8388609];

    // End:0x37
    if(PlayerCamera != none)
    {
        PlayerCamera.CameraStyle = NewCamMode;
    }
    //return;    
}

function SetCameraMode()
{
    local /*0x35EA0000-0x00000000*/ private name NewCamMode[8388609];

    // End:0x73
    if(PlayerCamera != none)
    {
        PlayerCamera.CameraStyle = NewCamMode;
        // End:0x73
        if(int(WorldInfo.NetMode) == int(NM_DedicatedServer))
        {
            ClientSetCameraMode(NewCamMode);
        }
    }
    //return;    
}

event ResetCameraMode()
{
    local /*0x35EA0000-0x00000000*/ private bool bVehicleTransition[9437185];

    // End:0x3D
    if(Pawn != none)
    {
        SetCameraMode(Pawn.GetDefaultCameraMode(self));        
    }
    else
    {
        SetCameraMode('FirstPerson');
    }
    //return;    
}

reliable client simulated event ClientSetCameraFade()
{
    local /*0x35EA0000-0x00000000*/ private bool bEnableFading[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL FadeColor[9437185], FadeAlpha;
    local /*0x35EA0000-0x00000000*/ private float FadeTime[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bFadeAudio[9437185];

    // End:0x1E5
    if(PlayerCamera != none)
    {
        PlayerCamera.bEnableFading = bEnableFading;
        // End:0x12C
        if(PlayerCamera.bEnableFading)
        {
            PlayerCamera.FadeColor = FadeColor;
            PlayerCamera.FadeAlpha = FadeAlpha;
            PlayerCamera.FadeTime = FadeTime;
            PlayerCamera.FadeTimeRemaining = FadeTime;
            PlayerCamera.bFadeAudio = bFadeAudio;            
        }
        else
        {
            PlayerCamera.FadeAmount = PlayerCamera.FadeAlpha.Y;
            PlayerCamera.FadeColor = FadeColor;
            // End:0x1E5
            if(PlayerCamera.bFadeAudio)
            {
                PlayerCamera.ApplyAudioFade();
            }
        }
    }
    //return;    
}

function UsingFirstPersonCamera()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return ((PlayerCamera == none) || PlayerCamera.CameraStyle == 'FirstPerson') && LocalPlayer(Player) != none;
    //return ReturnValue;    
}

function ForceDeathUpdate()
{
    LastUpdateTime = WorldInfo.TimeSeconds - float(10);
    //return;    
}

unreliable server function DualServerMove()
{
    local /*0x35EA0000-0x00000000*/ private float TimeStamp0[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InAccel0[8388609];
    local /*0x35EA0000-0x00000000*/ private byte PendingFlags[8388609];
    local /*0x35EA0000-0x00000000*/ private int View0[8388609];
    local /*0x35EA0000-0x00000000*/ private float TimeStamp[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InAccel[8388609], ClientLoc;
    local /*0x35EA0000-0x00000000*/ private byte NewFlags[8388609], ClientRoll;
    local /*0x35EA0000-0x00000000*/ private int View[8388609];

    ServerMove(TimeStamp0, InAccel0, vect(1.0000000, 2.0000000, 3.0000000), PendingFlags, ClientRoll, View0);
    ServerMove(TimeStamp, InAccel, ClientLoc, NewFlags, ClientRoll, View);
    //return;    
}

unreliable server function OldServerMove()
{
    local /*0x35EA0000-0x00000000*/ private float OldTimeStamp[8388609];
    local /*0x35EA0000-0x00000000*/ private byte OldAccelX[8388609], OldAccelY, OldAccelZ, OldMoveFlags;
    local /*0x35EA0000-0x00000000*/ private @NULL Accel;

    // End:0x19
    if(AcknowledgedPawn != Pawn)
    {
        return;
    }
    // End:0x278
    if(CurrentTimeStamp < (OldTimeStamp - 0.0010000))
    {
        Accel.X = float(OldAccelX);
        // End:0xCA
        if(Accel.X > float(127))
        {
            Accel.X = -1.0000000 * (Accel.X - float(128));
        }
        Accel.Y = float(OldAccelY);
        // End:0x15D
        if(Accel.Y > float(127))
        {
            Accel.Y = -1.0000000 * (Accel.Y - float(128));
        }
        Accel.Z = float(OldAccelZ);
        // End:0x1F0
        if(Accel.Z > float(127))
        {
            Accel.Z = -1.0000000 * (Accel.Z - float(128));
        }
        Accel *= float(20);
        OldTimeStamp = FMin(OldTimeStamp, CurrentTimeStamp + MaxResponseTime);
        MoveAutonomous(OldTimeStamp - CurrentTimeStamp, OldMoveFlags, Accel, rot(0, 0, 0));
        CurrentTimeStamp = OldTimeStamp;
    }
    //return;    
}

// Export UPlayerController::execGetServerMoveDeltaTime(FFrame&, void* const)
native function GetServerMoveDeltaTime()
{
    local /*0x35EA0000-0x00000000*/ private float TimeStamp[8388609], ReturnValue;


}

// Export UPlayerController::execServerMoveHandleClientError(FFrame&, void* const)
native function ServerMoveHandleClientError()
{
    local /*0x35EA0000-0x00000000*/ private float TimeStamp[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Accel[8388609], ClientLoc;


}

// Export UPlayerController::execServerMove(FFrame&, void* const)
unreliable server native function ServerMove()
{
    local /*0x35EA0000-0x00000000*/ private float TimeStamp[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InAccel[8388609], ClientLoc;
    local /*0x35EA0000-0x00000000*/ private byte MoveFlags[8388609], ClientRoll;
    local /*0x35EA0000-0x00000000*/ private int View[8388609];


}

event SendClientAdjustment()
{
    // End:0x3B
    if(AcknowledgedPawn != Pawn)
    {
        PendingAdjustment.TimeStamp = 0.0000000;
        return;
    }
    // End:0x8B
    if(int(PendingAdjustment.bAckGoodMove) == int(1))
    {
        ClientAckGoodMove(PendingAdjustment.TimeStamp);        
    }
    else
    {
        // End:0x481
        if((Pawn == none) || int(Pawn.Physics) != int(8))
        {
            // End:0x303
            if(PendingAdjustment.NewVel == vect(0.0000000, 0.0000000, 0.0000000))
            {
                // End:0x212
                if(((GetStateName() == 'PlayerWalking') && Pawn != none) && int(Pawn.Physics) == int(1))
                {
                    VeryShortClientAdjustPosition(PendingAdjustment.TimeStamp, PendingAdjustment.NewLoc.X, PendingAdjustment.NewLoc.Y, PendingAdjustment.NewLoc.Z, PendingAdjustment.NewBase);                    
                }
                else
                {
                    ShortClientAdjustPosition(PendingAdjustment.TimeStamp, GetStateName(), PendingAdjustment.newPhysics, PendingAdjustment.NewLoc.X, PendingAdjustment.NewLoc.Y, PendingAdjustment.NewLoc.Z, PendingAdjustment.NewBase);
                }                
            }
            else
            {
                ClientAdjustPosition(PendingAdjustment.TimeStamp, GetStateName(), PendingAdjustment.newPhysics, PendingAdjustment.NewLoc.X, PendingAdjustment.NewLoc.Y, PendingAdjustment.NewLoc.Z, PendingAdjustment.NewVel.X, PendingAdjustment.NewVel.Y, PendingAdjustment.NewVel.Z, PendingAdjustment.NewBase);
            }            
        }
        else
        {
            LongClientAdjustPosition(PendingAdjustment.TimeStamp, GetStateName(), PendingAdjustment.newPhysics, PendingAdjustment.NewLoc.X, PendingAdjustment.NewLoc.Y, PendingAdjustment.NewLoc.Z, PendingAdjustment.NewVel.X, PendingAdjustment.NewVel.Y, PendingAdjustment.NewVel.Z, PendingAdjustment.NewBase, PendingAdjustment.NewFloor.X, PendingAdjustment.NewFloor.Y, PendingAdjustment.NewFloor.Z);
        }
    }
    PendingAdjustment.TimeStamp = 0.0000000;
    PendingAdjustment.bAckGoodMove = 0;
    //return;    
}

unreliable server function ServerDrive()
{
    local /*0x35EA0000-0x00000000*/ private float InForward[8388609], InStrafe, aUp;
    local /*0x35EA0000-0x00000000*/ private bool InJump[8388609];
    local /*0x35EA0000-0x00000000*/ private int View[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ViewRotation;

    ViewRotation.Pitch = View & 65535;
    ViewRotation.Yaw = View >> 16;
    ViewRotation.Roll = 0;
    SetRotation(ViewRotation);
    ProcessDrive(InForward, InStrafe, aUp, InJump);
    //return;    
}

function ProcessDrive()
{
    local /*0x35EA0000-0x00000000*/ private float InForward[8388609], InStrafe, InUp;
    local /*0x35EA0000-0x00000000*/ private bool InJump[8388609];

    ClientGotoState(GetStateName(), 'Begin');
    //return;    
}

// Export UPlayerController::execProcessMove(FFrame&, void* const)
native function ProcessMove()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL newAccel[8388609];
    local /*0x35EA0000-0x00000000*/ private byte DoubleClickMove[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL DeltaRot[8388609];


}

// Export UPlayerController::execMoveAutonomous(FFrame&, void* const)
native function MoveAutonomous()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private byte CompressedFlags[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL newAccel[8388609], DeltaRot;


}

unreliable client simulated function VeryShortClientAdjustPosition()
{
    local /*0x35EA0000-0x00000000*/ private float TimeStamp[8388609], NewLocX, NewLocY, NewLocZ;
    local /*0x35EA0000-0x00000000*/ private @NULL NewBase[8388609], Floor;

    // End:0x37
    if(Pawn != none)
    {
        Floor = Pawn.Floor;
    }
    LongClientAdjustPosition(TimeStamp, 'PlayerWalking', 1, NewLocX, NewLocY, NewLocZ, 0.0000000, 0.0000000, 0.0000000, NewBase, Floor.X, Floor.Y, Floor.Z);
    //return;    
}

unreliable client simulated function ShortClientAdjustPosition()
{
    local /*0x35EA0000-0x00000000*/ private float TimeStamp[8388609];
    local /*0x35EA0000-0x00000000*/ private name NewState[8388609];
    local /*0x35EA0000-0x00000000*/ private byte newPhysics[8388609];
    local /*0x35EA0000-0x00000000*/ private float NewLocX[8388609], NewLocY, NewLocZ;
    local /*0x35EA0000-0x00000000*/ private @NULL NewBase[8388609], Floor;

    // End:0x37
    if(Pawn != none)
    {
        Floor = Pawn.Floor;
    }
    LongClientAdjustPosition(TimeStamp, NewState, newPhysics, NewLocX, NewLocY, NewLocZ, 0.0000000, 0.0000000, 0.0000000, NewBase, Floor.X, Floor.Y, Floor.Z);
    //return;    
}

reliable client simulated function ClientCapBandwidth()
{
    local /*0x35EA0000-0x00000000*/ private int Cap[8388609];

    ClientCap = Cap;
    // End:0x63
    if((Player != none) && Player.CurrentNetSpeed > Cap)
    {
        SetNetSpeed(Cap);
    }
    //return;    
}

unreliable client simulated function ClientAckGoodMove()
{
    local /*0x35EA0000-0x00000000*/ private float TimeStamp[8388609];

    UpdatePing(TimeStamp);
    CurrentTimeStamp = TimeStamp;
    ClearAckedMoves();
    //return;    
}

unreliable client simulated function ClientAdjustPosition()
{
    local /*0x35EA0000-0x00000000*/ private float TimeStamp[8388609];
    local /*0x35EA0000-0x00000000*/ private name NewState[8388609];
    local /*0x35EA0000-0x00000000*/ private byte newPhysics[8388609];
    local /*0x35EA0000-0x00000000*/ private float NewLocX[8388609], NewLocY, NewLocZ, NewVelX, NewVelY, NewVelZ;

    local /*0x35EA0000-0x00000000*/ private @NULL NewBase[8388609], Floor;

    // End:0x37
    if(Pawn != none)
    {
        Floor = Pawn.Floor;
    }
    LongClientAdjustPosition(TimeStamp, NewState, newPhysics, NewLocX, NewLocY, NewLocZ, NewVelX, NewVelY, NewVelZ, NewBase, Floor.X, Floor.Y, Floor.Z);
    //return;    
}

final function UpdatePing()
{
    local /*0x35EA0000-0x00000000*/ private float TimeStamp[8388609];

    // End:0xC4
    if(PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo.super(PlayerController).UpdatePing(TimeStamp);
        // End:0xC4
        if((WorldInfo.TimeSeconds - LastPingUpdate) > float(4))
        {
            LastPingUpdate = WorldInfo.TimeSeconds;
            ServerUpdatePing(int(float(1000) * PlayerReplicationInfo.ExactPing));
        }
    }
    //return;    
}

simulated function DoesIgnoreReplicatedRootMotion()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function SkipPositionUpdateForRM()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL CurrentMove;

    // End:0x193
    if((Pawn != none) && int(Pawn.default.Mesh.RootMotionMode) == int(2))
    {
        // End:0x115
        if(((((int(Pawn.Physics) != int(2)) && Pawn.Mesh != none) && int(Pawn.Mesh.RootMotionMode) != int(2)) && !Pawn.bRootMotionFromInterpCurve) && DoesIgnoreReplicatedRootMotion())
        {
            return true;
        }
        CurrentMove = SavedMoves;
        // End:0x193
        if(DoesIgnoreReplicatedRootMotion())
        {
            J0x135:

            // End:0x193 [Loop If]
            if(CurrentMove != none)
            {
                // End:0x168
                if(CurrentMove.bForceRMVelocity)
                {
                    return true;
                }
                CurrentMove = CurrentMove.NextMove;
                // [Loop Continue]
                goto J0x135;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

unreliable client simulated function LongClientAdjustPosition()
{
    local /*0x35EA0000-0x00000000*/ private float TimeStamp[8388609];
    local /*0x35EA0000-0x00000000*/ private name NewState[8388609];
    local /*0x35EA0000-0x00000000*/ private byte newPhysics[8388609];
    local /*0x35EA0000-0x00000000*/ private float NewLocX[8388609], NewLocY, NewLocZ, NewVelX, NewVelY, NewVelZ;

    local /*0x35EA0000-0x00000000*/ private @NULL NewBase[8388609];
    local /*0x35EA0000-0x00000000*/ private float NewFloorX[8388609], NewFloorY, NewFloorZ;
    local /*0x35EA0000-0x00000000*/ private @NULL NewLocation, NewVelocity, NewFloor, MoveActor, CurrentMove, TheViewTarget;

    UpdatePing(TimeStamp);
    // End:0x13C
    if(Pawn != none)
    {
        // End:0x82
        if(Pawn.bTearOff)
        {
            Pawn = none;
            // End:0x80
            if(!GamePlayEndedState() && !IsInState('Dead'))
            {
                GotoState('Dead');
            }
            return;
        }
        MoveActor = Pawn;
        TheViewTarget = GetViewTarget();
        // End:0x139
        if((TheViewTarget != Pawn) && (TheViewTarget == self) || (Pawn(TheViewTarget) != none) && Pawn(TheViewTarget).Health <= 0)
        {
            ResetCameraMode();
            SetViewTarget(Pawn);
        }        
    }
    else
    {
        MoveActor = self;
        // End:0x1F8
        if(GetStateName() != NewState)
        {
            // End:0x180
            if(NewState == 'RoundEnded')
            {
                GotoState(NewState);                
            }
            else
            {
                // End:0x1D3
                if(IsInState('Dead'))
                {
                    // End:0x1CE
                    if((NewState != 'PlayerWalking') && NewState != 'PlayerSwimming')
                    {
                        GotoState(NewState);
                    }
                    return;                    
                }
                else
                {
                    // End:0x1F8
                    if(NewState == 'Dead')
                    {
                        GotoState(NewState);
                    }
                }
            }
        }
    }
    // End:0x211
    if(CurrentTimeStamp >= TimeStamp)
    {
        return;
    }
    CurrentTimeStamp = TimeStamp;
    NewLocation.X = NewLocX;
    NewLocation.Y = NewLocY;
    NewLocation.Z = NewLocZ;
    NewVelocity.X = NewVelX;
    NewVelocity.Y = NewVelY;
    NewVelocity.Z = NewVelZ;
    CurrentMove = SavedMoves;
    J0x31B:

    // End:0x736 [Loop If]
    if(CurrentMove != none)
    {
        // End:0x728
        if(CurrentMove.TimeStamp <= CurrentTimeStamp)
        {
            SavedMoves = CurrentMove.NextMove;
            CurrentMove.NextMove = FreeMoves;
            FreeMoves = CurrentMove;
            // End:0x6F3
            if(CurrentMove.TimeStamp == CurrentTimeStamp)
            {
                LastAckedAccel = CurrentMove.Acceleration;
                FreeMoves.Clear();
                // End:0x5F1
                if((((InterpActor(NewBase) != none) || Vehicle(NewBase) != none) || DynamicBlockingVolume(NewBase) != none) && NewBase == CurrentMove.EndBase)
                {
                    // End:0x5EE
                    if(((GetStateName() == NewState) && IsInState('PlayerWalking')) && (int(MoveActor.Physics) == int(1)) || int(MoveActor.Physics) == int(2))
                    {
                        // End:0x564
                        if(VSizeSq(CurrentMove.SavedRelativeLocation - NewLocation) < 3.0000000)
                        {
                            CurrentMove = none;
                            return;                            
                        }
                        else
                        {
                            // End:0x5EE
                            if((((Vehicle(NewBase) != none) && VSizeSq(Velocity) < 9.0000000) && VSizeSq(NewVelocity) < 9.0000000) && VSizeSq(CurrentMove.SavedRelativeLocation - NewLocation) < 900.0000000)
                            {
                                CurrentMove = none;
                                return;
                            }
                        }
                    }                    
                }
                else
                {
                    // End:0x6E5
                    if(((((VSizeSq(CurrentMove.SavedLocation - NewLocation) < 3.0000000) && VSizeSq(CurrentMove.SavedVelocity - NewVelocity) < 9.0000000) && GetStateName() == NewState) && IsInState('PlayerWalking')) && (int(MoveActor.Physics) == int(1)) || int(MoveActor.Physics) == int(2))
                    {
                        CurrentMove = none;
                        return;
                    }
                }
                CurrentMove = none;                
            }
            else
            {
                FreeMoves.Clear();
                CurrentMove = SavedMoves;
            }            
        }
        else
        {
            CurrentMove = none;
        }
        // [Loop Continue]
        goto J0x31B;
    }
    // End:0x878
    if(MoveActor.bHardAttach)
    {
        // End:0x876
        if((MoveActor.Base == none) || MoveActor.Base.bWorldGeometry)
        {
            // End:0x82A
            if(NewBase != none)
            {
                MoveActor.SetLocation(NewLocation);
                MoveActor.SetPhysics(newPhysics);
                MoveActor.SetBase(NewBase);
            }
            // End:0x871
            if(MoveActor.Base == none)
            {
                MoveActor.SetHardAttach(false);                
            }
            else
            {
                return;
            }            
        }
        else
        {
            return;
        }
    }
    NewFloor.X = NewFloorX;
    NewFloor.Y = NewFloorY;
    NewFloor.Z = NewFloorZ;
    // End:0x8F9
    if(SkipPositionUpdateForRM())
    {
        return;
    }
    // End:0x96E
    if(((InterpActor(NewBase) != none) || Vehicle(NewBase) != none) || DynamicBlockingVolume(NewBase) != none)
    {
        NewLocation += NewBase.Location;
    }
    MoveActor.bCanTeleport = false;
    // End:0xBC2
    if(((((!MoveActor.SetLocation(NewLocation) && Pawn(MoveActor) != none) && Pawn(MoveActor).CylinderComponent.CollisionHeight > Pawn(MoveActor).CrouchHeight) && !Pawn(MoveActor).bIsCrouched) && int(newPhysics) == int(1)) && int(MoveActor.Physics) != int(10))
    {
        MoveActor.SetPhysics(newPhysics);
        // End:0xB74
        if(!MoveActor.SetLocation(NewLocation + (vect(0.0000000, 0.0000000, 1.0000000) * Pawn(MoveActor).MaxStepHeight)))
        {
            Pawn(MoveActor).ForceCrouch();
            MoveActor.SetLocation(NewLocation);            
        }
        else
        {
            MoveActor.MoveSmooth(vect(0.0000000, 0.0000000, -1.0000000) * Pawn(MoveActor).MaxStepHeight);
        }
    }
    MoveActor.bCanTeleport = true;
    // End:0xC43
    if((int(MoveActor.Physics) != int(10)) && int(newPhysics) != int(10))
    {
        MoveActor.SetPhysics(newPhysics);
    }
    // End:0xC7E
    if(MoveActor != self)
    {
        MoveActor.SetBase(NewBase, NewFloor);
    }
    MoveActor.Velocity = NewVelocity;
    UpdateStateFromAdjustment(NewState);
    bUpdatePosition = true;
    //return;    
}

function UpdateStateFromAdjustment()
{
    local /*0x35EA0000-0x00000000*/ private name NewState[8388609];

    // End:0x1F
    if(GetStateName() != NewState)
    {
        GotoState(NewState);
    }
    //return;    
}

unreliable server function ServerUpdatePing()
{
    local /*0x35EA0000-0x00000000*/ private int NewPing[8388609];

    PlayerReplicationInfo.Ping = byte(Min(int(0.2500000 * float(NewPing)), 250));
    //return;    
}

function ClearAckedMoves()
{
    local /*0x35EA0000-0x00000000*/ private @NULL CurrentMove;

    CurrentMove = SavedMoves;
    J0x13:

    // End:0x140 [Loop If]
    if(CurrentMove != none)
    {
        // End:0x13A
        if(CurrentMove.TimeStamp <= CurrentTimeStamp)
        {
            // End:0xA2
            if(CurrentMove.TimeStamp == CurrentTimeStamp)
            {
                LastAckedAccel = CurrentMove.Acceleration;
            }
            SavedMoves = CurrentMove.NextMove;
            CurrentMove.NextMove = FreeMoves;
            FreeMoves = CurrentMove;
            FreeMoves.Clear();
            CurrentMove = SavedMoves;            
        }
        else
        {
            // [Explicit Break]
            goto J0x140;
        }
        // [Loop Continue]
        goto J0x13;
    }
    J0x140:

    //return;    
}

function ClientUpdatePosition()
{
    local /*0x35EA0000-0x00000000*/ private @NULL CurrentMove;
    local /*0x35EA0000-0x00000000*/ private int realbRun, realbDuck;
    local /*0x35EA0000-0x00000000*/ private bool bRealJump, bRealPreciseDestination, bRealForceMaxAccel, bRealRootMotionFromInterpCurve;
    local /*0x35EA0000-0x00000000*/ private byte RealRootMotionMode;

    bUpdatePosition = false;
    // End:0x48
    if((Pawn != none) && int(Pawn.Physics) == int(10))
    {
        return;
    }
    realbRun = int(bRun);
    realbDuck = int(bDuck);
    bRealJump = bPressedJump;
    bUpdating = true;
    bRealPreciseDestination = bPreciseDestination;
    // End:0x148
    if(Pawn != none)
    {
        bRealForceMaxAccel = Pawn.bForceMaxAccel;
        bRealRootMotionFromInterpCurve = Pawn.bRootMotionFromInterpCurve;
        RealRootMotionMode = Pawn.Mesh.RootMotionMode;
    }
    ClearAckedMoves();
    CurrentMove = SavedMoves;
    J0x165:

    // End:0x2B1 [Loop If]
    if(CurrentMove != none)
    {
        // End:0x1C4
        if((PendingMove == CurrentMove) && Pawn != none)
        {
            PendingMove.SetInitialPosition(Pawn);
        }
        CurrentMove.PrepMoveFor(Pawn);
        MoveAutonomous(CurrentMove.Delta, CurrentMove.CompressedFlags(), CurrentMove.Acceleration, rot(0, 0, 0));
        CurrentMove.ResetMoveFor(Pawn);
        CurrentMove = CurrentMove.NextMove;
        // [Loop Continue]
        goto J0x165;
    }
    bUpdating = false;
    bDuck = byte(realbDuck);
    bRun = byte(realbRun);
    bPressedJump = bRealJump;
    bPreciseDestination = bRealPreciseDestination;
    // End:0x3B1
    if(Pawn != none)
    {
        Pawn.bForceMaxAccel = bRealForceMaxAccel;
        Pawn.bRootMotionFromInterpCurve = bRealRootMotionFromInterpCurve;
        Pawn.Mesh.RootMotionMode = RealRootMotionMode;
    }
    //return;    
}

final function GetFreeMove()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], S, first;
    local /*0x35EA0000-0x00000000*/ private int I;

    // End:0x1BF
    if(FreeMoves == none)
    {
        S = SavedMoves;
        J0x22:

        // End:0x1AD [Loop If]
        if(S != none)
        {
            I++;
            // End:0x182
            if(I > 100)
            {
                first = SavedMoves;
                SavedMoves = SavedMoves.NextMove;
                first.Clear();
                first.NextMove = none;
                J0xC6:

                // End:0x16D [Loop If]
                if(SavedMoves != none)
                {
                    S = SavedMoves;
                    SavedMoves = SavedMoves.NextMove;
                    S.Clear();
                    S.NextMove = FreeMoves;
                    FreeMoves = S;
                    // [Loop Continue]
                    goto J0xC6;
                }
                PendingMove = none;
                return first;
            }
            S = S.NextMove;
            // [Loop Continue]
            goto J0x22;
        }
        return new (self) SavedMoveClass;        
    }
    else
    {
        S = FreeMoves;
        FreeMoves = FreeMoves.NextMove;
        S.NextMove = none;
        return S;
    }
    //return ReturnValue;    
}

function CompressAccel()
{
    local /*0x35EA0000-0x00000000*/ private int C[8388609], ReturnValue;

    // End:0x29
    if(C >= 0)
    {
        C = Min(C, 127);        
    }
    else
    {
        C = Min(int(Abs(float(C))), 127) + 128;
    }
    return C;
    //return ReturnValue;    
}

function ReplicateMove()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL newAccel[8388609];
    local /*0x35EA0000-0x00000000*/ private byte DoubleClickMove[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL DeltaRot[8388609], NewMove, OldMove, AlmostLastMove, LastMove;

    local /*0x35EA0000-0x00000000*/ private byte ClientRoll;
    local /*0x35EA0000-0x00000000*/ private float NetMoveDelta;

    // End:0x11
    if(Player == none)
    {
        return;
    }
    MaxResponseTime = default.MaxResponseTime * WorldInfo.TimeDilation;
    DeltaTime = ((Pawn != none) ? Pawn.CustomTimeDilation : CustomTimeDilation) * FMin(DeltaTime, MaxResponseTime);
    // End:0x19E
    if(SavedMoves != none)
    {
        LastMove = SavedMoves;
        AlmostLastMove = LastMove;
        OldMove = none;
        J0xDC:

        // End:0x19E [Loop If]
        if(LastMove.NextMove != none)
        {
            // End:0x160
            if(((OldMove == none) && Pawn != none) && LastMove.IsImportantMove(LastAckedAccel))
            {
                OldMove = LastMove;
            }
            AlmostLastMove = LastMove;
            LastMove = LastMove.NextMove;
            // [Loop Continue]
            goto J0xDC;
        }
    }
    NewMove = GetFreeMove();
    // End:0x1C3
    if(NewMove == none)
    {
        return;
    }
    NewMove.SetMoveFor(self, DeltaTime, newAccel, DoubleClickMove);
    bDoubleJump = false;
    ProcessMove(NewMove.Delta, NewMove.Acceleration, NewMove.DoubleClickMove, DeltaRot);
    // End:0x574
    if((PendingMove != none) && PendingMove.CanCombineWith(NewMove, Pawn, MaxResponseTime))
    {
        Pawn.SetLocation(PendingMove.GetStartLocation());
        Pawn.Velocity = PendingMove.StartVelocity;
        // End:0x3B3
        if(PendingMove.StartBase != Pawn.Base)
        {
            Pawn.SetBase(PendingMove.StartBase);
        }
        Pawn.Floor = PendingMove.StartFloor;
        NewMove.Delta += PendingMove.Delta;
        NewMove.SetInitialPosition(Pawn);
        // End:0x569
        if(LastMove == PendingMove)
        {
            // End:0x4CD
            if(SavedMoves == PendingMove)
            {
                SavedMoves.NextMove = FreeMoves;
                FreeMoves = SavedMoves;
                SavedMoves = none;                
            }
            else
            {
                PendingMove.NextMove = FreeMoves;
                FreeMoves = PendingMove;
                // End:0x54A
                if(AlmostLastMove != none)
                {
                    AlmostLastMove.NextMove = none;
                    LastMove = AlmostLastMove;
                }
            }
            FreeMoves.Clear();
        }
        PendingMove = none;
    }
    // End:0x5BC
    if(Pawn != none)
    {
        Pawn.AutonomousPhysics(NewMove.Delta);        
    }
    else
    {
        AutonomousPhysics(DeltaTime);
    }
    NewMove.PostUpdate(self);
    // End:0x60D
    if(SavedMoves == none)
    {
        SavedMoves = NewMove;        
    }
    else
    {
        LastMove.NextMove = NewMove;
    }
    // End:0x7A5
    if(PendingMove == none)
    {
        // End:0x6E1
        if(((Player.CurrentNetSpeed > 10000) && WorldInfo.GRI != none) && WorldInfo.GRI.PRIArray.Length <= 10)
        {
            NetMoveDelta = 0.0110000;            
        }
        else
        {
            NetMoveDelta = FMax(0.0222000, (2.0000000 * WorldInfo.MoveRepSize) / float(Player.CurrentNetSpeed));
        }
        // End:0x7A5
        if(((WorldInfo.TimeSeconds - ClientUpdateTime) * WorldInfo.TimeDilation) < NetMoveDelta)
        {
            PendingMove = NewMove;
            return;
        }
    }
    ClientUpdateTime = WorldInfo.TimeSeconds;
    ClientRoll = byte((Rotation.Roll >> 8) & 255);
    CallServerMove(NewMove, ((Pawn == none) ? Location : Pawn.Location), ClientRoll, ((Rotation.Yaw & 65535) << 16) + (Rotation.Pitch & 65535), OldMove);
    PendingMove = none;
    //return;    
}

function CallServerMove()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewMove[8388609], ClientLoc;
    local /*0x35EA0000-0x00000000*/ private byte ClientRoll[8388609];
    local /*0x35EA0000-0x00000000*/ private int View[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OldMove[8388609], BuildAccel;
    local /*0x35EA0000-0x00000000*/ private byte OldAccelX, OldAccelY, OldAccelZ;

    // End:0x14B
    if(OldMove != none)
    {
        BuildAccel = (0.0500000 * OldMove.Acceleration) + vect(0.5000000, 0.5000000, 0.5000000);
        OldAccelX = byte(CompressAccel(int(BuildAccel.X)));
        OldAccelY = byte(CompressAccel(int(BuildAccel.Y)));
        OldAccelZ = byte(CompressAccel(int(BuildAccel.Z)));
        OldServerMove(OldMove.TimeStamp, OldAccelX, OldAccelY, OldAccelZ, OldMove.CompressedFlags());
    }
    // End:0x2BA
    if(PendingMove != none)
    {
        DualServerMove(PendingMove.TimeStamp, PendingMove.Acceleration * float(10), PendingMove.CompressedFlags(), ((PendingMove.Rotation.Yaw & 65535) << 16) + (PendingMove.Rotation.Pitch & 65535), NewMove.TimeStamp, NewMove.Acceleration * float(10), ClientLoc, NewMove.CompressedFlags(), ClientRoll, View);        
    }
    else
    {
        ServerMove(NewMove.TimeStamp, NewMove.Acceleration * float(10), ClientLoc, NewMove.CompressedFlags(), ClientRoll, View);
    }
    // End:0x394
    if((PlayerCamera != none) && PlayerCamera.bUseClientSideCameraUpdates)
    {
        PlayerCamera.bShouldSendClientSideCameraUpdate = true;
    }
    //return;    
}

unreliable server function ServerUpdateCamera()
{
    local /*0x35EA0000-0x00000000*/ private @NULL CamLoc[8388609];
    local /*0x35EA0000-0x00000000*/ private int CamPitchAndYaw[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL NewPOV;

    NewPOV.Location = CamLoc;
    NewPOV.Rotation.Yaw = (CamPitchAndYaw >> 16) & 65535;
    NewPOV.Rotation.Pitch = CamPitchAndYaw & 65535;
    // End:0x2EC
    if(PlayerCamera != none)
    {
        // End:0x2C4
        if(PlayerCamera.bDebugClientSideCamera)
        {
            DrawDebugSphere(PlayerCamera.CameraCache.POV.Location, 10.0000000, 10, 0, 255, 0);
            DrawDebugSphere(NewPOV.Location, 10.0000000, 10, 255, 255, 0);
            DrawDebugLine(PlayerCamera.CameraCache.POV.Location, PlayerCamera.CameraCache.POV.Location + (float(100) * Vector(PlayerCamera.CameraCache.POV.Rotation)), 0, 255, 0);
            DrawDebugLine(NewPOV.Location, NewPOV.Location + (float(100) * Vector(NewPOV.Rotation)), 255, 255, 0);            
        }
        else
        {
            PlayerCamera.FillCameraCache(NewPOV);
        }
    }
    //return;    
}

// Export UPlayerController::execHandleWalking(FFrame&, void* const)
native function HandleWalking();

reliable server function ServerRestartGame()
{
    //return;    
}

exec function Speech()
{
    local /*0x35EA0000-0x00000000*/ private name Type[8388609];
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Callsign[8388609];

    ServerSpeech(Type, Index, Callsign);
    //return;    
}

reliable server function ServerSpeech()
{
    local /*0x35EA0000-0x00000000*/ private name Type[8388609];
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Callsign[8388609];

    //return;    
}

exec function RestartLevel()
{
    // End:0x41
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        ClientTravel("?restart", NM_ListenServer);
    }
    //return;    
}

exec function LocalTravel()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[8388609];

    // End:0x40
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        ClientTravel(URL, 2);
    }
    //return;    
}

function PauseRumbleForAllPlayers()
{
    local /*0x35EA0000-0x00000000*/ private bool bShouldPauseRumble[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    true
    // End:0x63
    foreach WorldInfo.AllControllers(Class'PlayerController', PC)
    {
        PC.ClientPauseRumble(bShouldPauseRumble);        
    }    
    //return;    
}

reliable client simulated function ClientPauseRumble()
{
    local /*0x35EA0000-0x00000000*/ private bool bShouldPauseRumble[8388609];

    // End:0x38
    if(ForceFeedbackManager != none)
    {
        ForceFeedbackManager.PauseWaveform(bShouldPauseRumble);
    }
    //return;    
}

delegate CanUnpause()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return WorldInfo.Pauser == PlayerReplicationInfo;
    //return ReturnValue;    
}

function SetPause()
{
    local /*0x35EA0000-0x00000000*/ private bool bPause[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> CanUnpauseDelegate[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689], bResult;

    CanUnpause
    // End:0x13F
    if(int(WorldInfo.NetMode) != int(NM_Client))
    {
        // End:0xBB
        if(bPause)
        {
            bFire = 0;
            bResult = WorldInfo.Game.SetPause(self, CanUnpauseDelegate);
            // End:0xB8
            if(bResult)
            {
                PauseRumbleForAllPlayers();
            }            
        }
        else
        {
            WorldInfo.Game.ClearPause();
            // End:0x13F
            if(WorldInfo.Pauser == none)
            {
                WorldInfo.bGameplayFramePause = false;
                PauseRumbleForAllPlayers(false);
            }
        }
    }
    return bResult;
    //return ReturnValue;    
}

final simulated function IsPaused()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return WorldInfo.Pauser != none;
    //return ReturnValue;    
}

exec function Pause()
{
    ServerPause();
    //return;    
}

reliable server function ServerPause()
{
    // End:0x1E
    if(!IsPaused())
    {
        SetPause(true);        
    }
    else
    {
        SetPause(false);
    }
    //return;    
}

event ConditionalPause()
{
    local /*0x35EA0000-0x00000000*/ private bool bDesiredPauseState[8388609];

    // End:0x2E
    if(bDesiredPauseState != IsPaused())
    {
        SetPause(bDesiredPauseState);
    }
    //return;    
}

reliable server function ServerUTrace()
{
    // End:0x62
    if((int(WorldInfo.NetMode) != int(NM_Standalone)) && (PlayerReplicationInfo == none) || !PlayerReplicationInfo.bAdmin)
    {
        return;
    }
    UTrace();
    //return;    
}

exec function UTrace()
{
    ConsoleCommand("hidelog");
    // End:0x3B
    if(int(Role) != int(ROLE_Authority))
    {
        ServerUTrace();
    }
    SetUTracing(!IsUTracing());
    //return;    
}

exec function ThrowWeapon()
{
    // End:0x37
    if((Pawn == none) || Pawn.Weapon == none)
    {
        return;
    }
    ServerThrowWeapon();
    //return;    
}

reliable server function ServerThrowWeapon()
{
    // End:0x42
    if(Pawn.CanThrowWeapon())
    {
        Pawn.ThrowActiveWeapon();
    }
    //return;    
}

exec function PrevWeapon()
{
    // End:0x26
    if(WorldInfo.Pauser != none)
    {
        return;
    }
    // End:0x57
    if(Pawn.Weapon == none)
    {
        SwitchToBestWeapon();
        return;
    }
    // End:0xAF
    if(Pawn.InvManager != none)
    {
        Pawn.InvManager.PrevWeapon();
    }
    //return;    
}

exec function NextWeapon()
{
    // End:0x26
    if(WorldInfo.Pauser != none)
    {
        return;
    }
    // End:0x57
    if(Pawn.Weapon == none)
    {
        SwitchToBestWeapon();
        return;
    }
    // End:0xAF
    if(Pawn.InvManager != none)
    {
        Pawn.InvManager.NextWeapon();
    }
    //return;    
}

exec function StartFire()
{
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[9437185];

    // End:0x3B
    if(WorldInfo.Pauser == PlayerReplicationInfo)
    {
        SetPause(false);
        return;
    }
    // End:0xA9
    if(((Pawn != none) && !bCinematicMode) && !WorldInfo.bPlayersOnly)
    {
        Pawn.StartFire(FireModeNum);
    }
    //return;    
}

exec function StopFire()
{
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[9437185];

    // End:0x38
    if(Pawn != none)
    {
        Pawn.StopFire(FireModeNum);
    }
    //return;    
}

exec function StartAltFire()
{
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[9437185];

    StartFire(1);
    //return;    
}

exec function StopAltFire()
{
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[9437185];

    StopFire(1);
    //return;    
}

function GetTriggerUseList()
{
    local /*0x35EA0000-0x00000000*/ private float interactDistanceToCheck[8388609], crosshairDist, minDot;
    local /*0x35EA0000-0x00000000*/ private bool bUsuableOnly[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array out_useList[25165825];
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private @NULL CameraLoc, CameraRot, checkTrigger, UseSeq;

    // End:0x320
    if(Pawn != none)
    {
        GetPlayerViewPoint(CameraLoc, CameraRot);
        // End:0x31F
        foreach Pawn.CollidingActors(Class'Trigger', checkTrigger, interactDistanceToCheck)
        {
            Idx = 0;
            J0x70:

            // End:0x31E [Loop If]
            if(Idx < checkTrigger.GeneratedEvents.Length)
            {
                UseSeq = SeqEvent_Used(checkTrigger.GeneratedEvents[Idx]);
                // End:0x310
                if((((UseSeq != none) && !bUsuableOnly || checkTrigger.GeneratedEvents[Idx].CheckActivate(checkTrigger, Pawn, true)) && (Normal(checkTrigger.Location - CameraLoc) Dot Vector(CameraRot)) >= minDot) && ((UseSeq.bAimToInteract && IsAimingAt(checkTrigger, 0.9800000)) && VSize(Pawn.Location - checkTrigger.Location) <= UseSeq.InteractDistance) || !UseSeq.bAimToInteract && VSize(Pawn.Location - checkTrigger.Location) <= UseSeq.InteractDistance)
                {
                    out_useList[out_useList.Length] = checkTrigger;
                    Idx = checkTrigger.GeneratedEvents.Length;
                }
                Idx++;
                // [Loop Continue]
                goto J0x70;
            }            
        }        
    }
    //return;    
}

exec function Use()
{
    // End:0x1E
    if(int(Role) < int(ROLE_Authority))
    {
        PerformedUseAction();
    }
    ServerUse();
    //return;    
}

unreliable server function ServerUse()
{
    PerformedUseAction();
    //return;    
}

function PerformedUseAction()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4E
    if(WorldInfo.Pauser == PlayerReplicationInfo)
    {
        // End:0x4C
        if(int(Role) == int(ROLE_Authority))
        {
            SetPause(false);
        }
        return true;
    }
    // End:0x5F
    if(Pawn == none)
    {
        return true;
    }
    // End:0x75
    if(int(Role) < int(ROLE_Authority))
    {
        return false;
    }
    // End:0xB7
    if(Vehicle(Pawn) != none)
    {
        return Vehicle(Pawn).DriverLeave(false);
    }
    // End:0xC6
    if(FindVehicleToDrive())
    {
        return true;
    }
    return TriggerInteracted();
    //return ReturnValue;    
}

function FindVehicleToDrive()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL V, Best, ViewDir, PawnLoc2D, VLoc2D;

    local /*0x35EA0000-0x00000000*/ private float NewDot, BestDot;

    // End:0x7A
    if((Vehicle(Pawn.Base) != none) && Vehicle(Pawn.Base).TryToDrive(Pawn))
    {
        return true;
    }
    PawnLoc2D = Pawn.Location;
    PawnLoc2D.Z = 0.0000000;
    ViewDir = Vector(Pawn.Rotation);
    // End:0x24A
    foreach Pawn.OverlappingActors(Class'Vehicle', V, Pawn.VehicleCheckRadius)
    {
        VLoc2D = V.Location;
        VLoc2D.Z = 0.0000000;
        NewDot = Normal(VLoc2D - PawnLoc2D) Dot ViewDir;
        // End:0x249
        if((Best == none) || NewDot > BestDot)
        {
            // End:0x249
            if(FastTrace(V.Location, Pawn.Location))
            {
                Best = V;
                BestDot = NewDot;
            }
        }        
    }    
    return (Best != none) && Best.TryToDrive(Pawn);
    //return ReturnValue;    
}

function TriggerInteracted()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL A;
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private float Weight;
    local /*0x35EA0000-0x00000000*/ private bool bInserted;
    local /*0x35EA0000-0x00000000*/ private @NULL CameraLoc, CameraRot;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array useList, sortedList, weightList;

    // End:0x2F1
    if(Pawn != none)
    {
        GetTriggerUseList(InteractDistance, 60.0000000, 0.0000000, true, useList);
        // End:0x2F1
        if(useList.Length > 0)
        {
            GetPlayerViewPoint(CameraLoc, CameraRot);
            J0x62:

            // End:0x289 [Loop If]
            if(useList.Length > 0)
            {
                A = useList[useList.Length - 1];
                useList.Length = useList.Length - 1;
                Weight = Normal(A.Location - CameraLoc) Dot Vector(CameraRot);
                Weight += (1.0000000 - (VSize(A.Location - Pawn.Location) / InteractDistance));
                bInserted = false;
                Idx = 0;
                J0x161:

                // End:0x229 [Loop If]
                if((Idx < sortedList.Length) && !bInserted)
                {
                    // End:0x21B
                    if(weightList[Idx] < Weight)
                    {
                        sortedList.Insert(Idx, 1);                        
                        weightList.Insert(Idx, 1);                        
                        sortedList[Idx] = A;
                        weightList[Idx] = Weight;
                        bInserted = true;
                    }
                    Idx++;
                    // [Loop Continue]
                    goto J0x161;
                }
                // End:0x286
                if(!bInserted)
                {
                    Idx = sortedList.Length;
                    sortedList[Idx] = A;
                    weightList[Idx] = Weight;
                }
                // [Loop Continue]
                goto J0x62;
            }
            Idx = 0;
            J0x294:

            // End:0x2F1 [Loop If]
            if(Idx < sortedList.Length)
            {
                // End:0x2E3
                if(sortedList[Idx].UsedBy(Pawn))
                {
                    return true;
                }
                Idx++;
                // [Loop Continue]
                goto J0x294;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

exec function Suicide()
{
    ServerSuicide();
    //return;    
}

reliable server function ServerSuicide()
{
    // End:0xA2
    if((Pawn != none) && ((WorldInfo.TimeSeconds - Pawn.LastStartTime) > float(10)) || int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        Pawn.Suicide();
    }
    //return;    
}

exec function SetName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string S[142606337], NewName;
    local /*0x35EA0000-0x00000000*/ private @NULL LocPlayer;

    // End:0x1EA
    if(S != "")
    {
        LocPlayer = LocalPlayer(Player);
        // End:0x1AE
        if(((LocPlayer != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none))) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
        {
            // End:0x1AE
            if((int(OnlineSub.PlayerInterface.GetLoginStatus(byte(LocPlayer.ControllerId))) == int(2)) && OnlineSub.GameInterface.GetGameSettings('Game') != none)
            {
                S = OnlineSub.PlayerInterface.GetPlayerNickname(byte(LocPlayer.ControllerId));
            }
        }
        NewName = S;
        ServerChangeName(NewName);
        UpdateURL("Name", NewName, true);
        SaveConfig();
    }
    //return;    
}

reliable server function ServerChangeName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string S[142606337];

    // End:0x4F
    if(S != "")
    {
        WorldInfo.Game.ChangeName(self, S, true);
    }
    //return;    
}

exec function SwitchTeam()
{
    // End:0x6D
    if((PlayerReplicationInfo.Team == none) || PlayerReplicationInfo.Team.TeamIndex == 1)
    {
        ServerChangeTeam(0);        
    }
    else
    {
        ServerChangeTeam(1);
    }
    //return;    
}

exec function ChangeTeam()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string TeamName[9437185];
    local /*0x35EA0000-0x00000000*/ private int N;

    // End:0x23
    if(TeamName ~= "blue")
    {
        N = 1;        
    }
    else
    {
        // End:0xB6
        if((((TeamName ~= "red") || PlayerReplicationInfo == none) || PlayerReplicationInfo.Team == none) || PlayerReplicationInfo.Team.TeamIndex > 1)
        {
            N = 0;            
        }
        else
        {
            N = 1 - PlayerReplicationInfo.Team.TeamIndex;
        }
    }
    ServerChangeTeam(N);
    //return;    
}

reliable server function ServerChangeTeam()
{
    local /*0x35EA0000-0x00000000*/ private int N[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OldTeam;

    OldTeam = PlayerReplicationInfo.Team;
    WorldInfo.Game.ChangeTeam(self, N, true);
    // End:0xFA
    if(WorldInfo.Game.bTeamGame && PlayerReplicationInfo.Team != OldTeam)
    {
        // End:0xFA
        if(Pawn != none)
        {
            Pawn.PlayerChangedTeam();
        }
    }
    //return;    
}

exec function SwitchLevel()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[8388609];

    // End:0x7E
    if((int(WorldInfo.NetMode) == int(NM_Standalone)) || int(WorldInfo.NetMode) == int(NM_ListenServer))
    {
        WorldInfo.ServerTravel(URL);
    }
    //return;    
}

reliable client simulated event ClientSetProgressMessage()
{
    local /*0x35EA0000-0x00000000*/ private byte MessageType[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Message[8388609], Title;
    local /*0x35EA0000-0x00000000*/ private bool bIgnoreFutureNetworkMessages[9437185];

    // End:0x7F
    if(LocalPlayer(Player) != none)
    {
        LocalPlayer(Player).ViewportClient.SetProgressMessage(MessageType, Message, Title, bIgnoreFutureNetworkMessages);        
    }
    //return;    
}

function Restart()
{
    local /*0x35EA0000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Restart(bVehicleTransition);
    ServerTimeStamp = 0.0000000;
    ResetTimeMargin();
    EnterStartState();
    ClientRestart(Pawn);
    SetViewTarget(Pawn);
    ResetCameraMode(bVehicleTransition);
    //return;    
}

// Export UPlayerController::execServerNotifyLoadedWorld(FFrame&, void* const)
reliable server native final event ServerNotifyLoadedWorld()
{
    local /*0x35EA0000-0x00000000*/ private name WorldPackageName[8388609];


}

event NotifyLoadedWorld()
{
    local /*0x35EA0000-0x00000000*/ private name WorldPackageName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bFinalDest[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL P, SpawnRotation;

    SetViewTarget(self);
    // End:0xC6
    foreach WorldInfo.AllNavigationPoints(Class'PlayerStart', P)
    {
        SetLocation(P.Location);
        SpawnRotation.Yaw = P.Rotation.Yaw;
        SetRotation(SpawnRotation);
        // End:0xC6
        break;        
    }    
    //return;    
}

// Export UPlayerController::execHasClientLoadedCurrentWorld(FFrame&, void* const)
native final function HasClientLoadedCurrentWorld()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPlayerController::execForceSingleNetUpdateFor(FFrame&, void* const)
native final function ForceSingleNetUpdateFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Target[8388609];


}

function EnterStartState()
{
    local /*0x35EA0000-0x00000000*/ private name NewState;

    // End:0xD6
    if(Pawn.PhysicsVolume.bWaterVolume)
    {
        // End:0xAB
        if(Pawn.HeadVolume.bWaterVolume)
        {
            Pawn.BreathTime = Pawn.UnderWaterTime;
        }
        NewState = Pawn.WaterMovementState;        
    }
    else
    {
        NewState = Pawn.LandMovementState;
    }
    // End:0x125
    if(GetStateName() == NewState)
    {
        BeginState(NewState);        
    }
    else
    {
        GotoState(NewState);
    }
    //return;    
}

reliable client simulated function ClientRestart()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewPawn[8388609];

    ResetPlayerMovementInput();
    CleanOutSavedMoves();
    Pawn = NewPawn;
    // End:0x6F
    if((Pawn != none) && Pawn.bTearOff)
    {
        UnPossess();
        Pawn = none;
    }
    AcknowledgePossession(Pawn);
    // End:0xA1
    if(Pawn == none)
    {
        GotoState('WaitingForPawn');
        return;
    }
    Pawn.ClientRestart();
    // End:0xFD
    if(int(Role) < int(ROLE_Authority))
    {
        SetViewTarget(Pawn);
        ResetCameraMode();
        EnterStartState();
    }
    CleanOutSavedMoves();
    //return;    
}

function GameHasEnded()
{
    local /*0x35EA0000-0x00000000*/ private @NULL EndGameFocus[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bIsWinner[9437185];

    SetViewTarget(EndGameFocus);
    GotoState('RoundEnded');
    ClientGameEnded(EndGameFocus, bIsWinner);
    //return;    
}

reliable client simulated function ClientGameEnded()
{
    local /*0x35EA0000-0x00000000*/ private @NULL EndGameFocus[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIsWinner[8388609];

    SetViewTarget(EndGameFocus);
    GotoState('RoundEnded');
    //return;    
}

function NotifyChangedWeapon()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PreviousWeapon[8388609], NewWeapon;

    //return;    
}

event PlayerTick()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x25
    if(!bShortConnectTimeOut)
    {
        bShortConnectTimeOut = true;
        ServerShortTimeout();
    }
    // End:0xB8
    if(Pawn != AcknowledgedPawn)
    {
        // End:0xA5
        if(int(Role) < int(ROLE_Authority))
        {
            // End:0xA5
            if((AcknowledgedPawn != none) && AcknowledgedPawn.Controller == self)
            {
                AcknowledgedPawn.Controller = none;
            }
        }
        AcknowledgePossession(Pawn);
    }
    PlayerInput.PlayerInput(DeltaTime);
    // End:0xF7
    if(bUpdatePosition)
    {
        ClientUpdatePosition();
    }
    // End:0x119
    if(!bIgnorePlayerMove)
    {
        PlayerMove(DeltaTime);
    }
    AdjustFOV(DeltaTime);
    //return;    
}

function PlayerMove()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

function AimingHelp()
{
    local /*0x35EA0000-0x00000000*/ private bool bInstantHit[8388609], ReturnValue;

    return (int(WorldInfo.NetMode) == int(NM_Standalone)) && bAimingHelp;
    //return ReturnValue;    
}

event CameraLookAtFinished()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    //return;    
}

function GetAdjustedAimFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL W[8388609], StartFireLoc, ReturnValue, FireDir, AimSpot, HitLocation,
	    HitNormal, OldAim, AimOffset, BestTarget, HitActor;

    local /*0x35EA0000-0x00000000*/ private float bestAim, bestDist;
    local /*0x35EA0000-0x00000000*/ private bool bNoZAdjust, bInstantHit;
    local /*0x35EA0000-0x00000000*/ private @NULL BaseAimRot, AimRot;

    bInstantHit = (W == none) || W.bInstantHit;
    BaseAimRot = ((Pawn != none) ? Pawn.GetBaseAimRotation() : Rotation);
    FireDir = Vector(BaseAimRot);
    HitActor = Trace(HitLocation, HitNormal, StartFireLoc + (W.GetTraceRange() * FireDir), StartFireLoc, true);
    // End:0x1A6
    if((HitActor != none) && HitActor.bProjTarget)
    {
        BestTarget = HitActor;
        bNoZAdjust = true;
        OldAim = HitLocation;
        bestDist = VSize(BestTarget.Location - Pawn.Location);        
    }
    else
    {
        bestAim = 0.9000000;
        // End:0x1ED
        if(AimingHelp(bInstantHit))
        {
            bestAim = AimHelpDot(bInstantHit);            
        }
        else
        {
            // End:0x209
            if(bInstantHit)
            {
                bestAim = 1.0000000;
            }
        }
        BestTarget = PickTarget(Class'Pawn', bestAim, bestDist, FireDir, StartFireLoc, W.WeaponRange);
        // End:0x27A
        if(BestTarget == none)
        {
            return BaseAimRot;
        }
        OldAim = StartFireLoc + (FireDir * bestDist);
    }
    ShotTarget = Pawn(BestTarget);
    // End:0x2E2
    if(!AimingHelp(bInstantHit))
    {
        return BaseAimRot;
    }
    FireDir = BestTarget.Location - StartFireLoc;
    AimSpot = StartFireLoc + (bestDist * Normal(FireDir));
    AimOffset = AimSpot - OldAim;
    // End:0x4F4
    if(ShotTarget != none)
    {
        // End:0x3B6
        if(bNoZAdjust)
        {
            AimSpot.Z = OldAim.Z;            
        }
        else
        {
            // End:0x467
            if(AimOffset.Z < float(0))
            {
                AimSpot.Z = ShotTarget.Location.Z + (0.4000000 * ShotTarget.CylinderComponent.CollisionHeight);                
            }
            else
            {
                AimSpot.Z = ShotTarget.Location.Z - (0.7000000 * ShotTarget.CylinderComponent.CollisionHeight);
            }
        }        
    }
    else
    {
        AimSpot.Z = OldAim.Z;
    }
    // End:0x615
    if(!bNoZAdjust)
    {
        AimRot = Rotator(AimSpot - StartFireLoc);
        // End:0x5C2
        if(FOVAngle < (DefaultFOV - float(8)))
        {
            AimRot.Yaw = (AimRot.Yaw + 200) - Rand(400);            
        }
        else
        {
            AimRot.Yaw = (AimRot.Yaw + 375) - Rand(750);
        }
        return AimRot;
    }
    return Rotator(AimSpot - StartFireLoc);
    //return ReturnValue;    
}

function AimHelpDot()
{
    local /*0x35EA0000-0x00000000*/ private bool bInstantHit[8388609];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x23
    if(FOVAngle < (DefaultFOV - float(8)))
    {
        return 0.9900000;
    }
    // End:0x36
    if(bInstantHit)
    {
        return 0.9700000;
    }
    return 0.9300000;
    //return ReturnValue;    
}

event NotifyLanded()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitNormal[8388609], FloorActor;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return bUpdating;
    //return ReturnValue;    
}

function AdjustFOV()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];

    // End:0xE7
    if(FOVAngle != DesiredFOV)
    {
        // End:0x73
        if(FOVAngle > DesiredFOV)
        {
            FOVAngle = FOVAngle - FMax(7.0000000, (0.9000000 * DeltaTime) * (FOVAngle - DesiredFOV));            
        }
        else
        {
            FOVAngle = FOVAngle - FMin(-7.0000000, (0.9000000 * DeltaTime) * (FOVAngle - DesiredFOV));
        }
        // End:0xE7
        if(Abs(FOVAngle - DesiredFOV) <= float(10))
        {
            FOVAngle = DesiredFOV;
        }
    }
    //return;    
}

event GetFOVAngle()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return ((PlayerCamera != none) ? PlayerCamera.GetFOVAngle() : FOVAngle);
    //return ReturnValue;    
}

// Export UPlayerController::execIsLocalPlayerController(FFrame&, void* const)
native function IsLocalPlayerController()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPlayerController::execIsLocalController(FFrame&, void* const)
native function IsLocalController()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UPlayerController::execSetViewTarget(FFrame&, void* const)
native function SetViewTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewViewTarget[8388609], TransitionParams;


}

final function SetViewTargetWithBlend()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewViewTarget[8388609];
    local /*0x35EA0000-0x00000000*/ private float BlendTime[9437185];
    local /*0x35EA0000-0x00000000*/ private byte BlendFunc[9437185];
    local /*0x35EA0000-0x00000000*/ private float BlendExp[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bLockOutgoing[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL TransitionParams;

    0.3500000
    1
    2.0000000
    false
    TransitionParams.BlendTime = BlendTime;
    TransitionParams.BlendFunction = BlendFunc;
    TransitionParams.BlendExp = BlendExp;
    TransitionParams.bLockOutgoing = bLockOutgoing;
    SetViewTarget(NewViewTarget, TransitionParams);
    //return;    
}

reliable client simulated event ClientSetViewTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL A[8388609], TransitionParams;

    // End:0x45
    if(!bClientSimulatingViewTarget)
    {
        // End:0x29
        if(A == none)
        {
            ServerVerifyViewTarget();
        }
        SetViewTarget(A, TransitionParams);
    }
    //return;    
}

// Export UPlayerController::execGetViewTarget(FFrame&, void* const)
native function GetViewTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

reliable server function ServerVerifyViewTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TheViewTarget;

    TheViewTarget = GetViewTarget();
    // End:0x25
    if(TheViewTarget == self)
    {
        return;
    }
    ClientSetViewTarget(TheViewTarget);
    //return;    
}

event SpawnPlayerCamera()
{
    // End:0x68
    if(CameraClass != none)
    {
        PlayerCamera = Spawn(CameraClass, self);
        // End:0x65
        if(PlayerCamera != none)
        {
            PlayerCamera.InitializeFor(self);            
        }        
    }
    //return;    
}

simulated event GetPlayerViewPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL out_Location[25165825], out_Rotation, TheViewTarget;

    // End:0x74
    if(PlayerCamera == none)
    {
        // End:0x74
        if(CameraClass != none)
        {
            PlayerCamera = Spawn(CameraClass, self);
            // End:0x74
            if(PlayerCamera != none)
            {
                PlayerCamera.InitializeFor(self);                
            }
        }
    }
    // End:0xB7
    if(PlayerCamera != none)
    {
        PlayerCamera.GetCameraViewPoint(out_Location, out_Rotation);        
    }
    else
    {
        TheViewTarget = GetViewTarget();
        // End:0x12D
        if(TheViewTarget != none)
        {
            out_Location = TheViewTarget.Location;
            out_Rotation = TheViewTarget.Rotation;            
        }
        else
        {
            super.GetPlayerViewPoint(out_Location, out_Rotation);
        }
    }
    //return;    
}

simulated event GetLevelStreamingVolumeStreamViewPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL out_Location[25165825], out_Rotation;

    GetPlayerViewPoint(out_Location, out_Rotation);
    //return;    
}

function ViewShake()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

function UpdateRotation()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL DeltaRot, NewRotation, ViewRotation;

    ViewRotation = Rotation;
    // End:0x4E
    if(Pawn != none)
    {
        Pawn.SetDesiredRotation(ViewRotation);
    }
    DeltaRot.Yaw = int(PlayerInput.aTurn);
    DeltaRot.Pitch = int(PlayerInput.aLookUp);
    ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
    SetRotation(ViewRotation);
    ViewShake(DeltaTime);
    NewRotation = ViewRotation;
    NewRotation.Roll = Rotation.Roll;
    // End:0x19F
    if(Pawn != none)
    {
        Pawn.FaceRotation(NewRotation, DeltaTime);
    }
    //return;    
}

function ProcessViewRotation()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL out_ViewRotation[25165825], DeltaRot;

    // End:0x92
    if(((DeltaRot.Yaw != 0) || DeltaRot.Pitch != 0) || DeltaRot.Roll != 0)
    {
        LastActiveTime = WorldInfo.TimeSeconds;
    }
    // End:0xDB
    if(PlayerCamera != none)
    {
        PlayerCamera.ProcessViewRotation(DeltaTime, out_ViewRotation, DeltaRot);
    }
    // End:0x127
    if(Pawn != none)
    {
        Pawn.ProcessViewRotation(DeltaTime, out_ViewRotation, DeltaRot);        
    }
    else
    {
        out_ViewRotation += DeltaRot;
        out_ViewRotation = LimitViewRotation(out_ViewRotation, -16384.0000000, 16383.0000000);
    }
    //return;    
}

event LimitViewRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ViewRotation[8388609];
    local /*0x35EA0000-0x00000000*/ private float ViewPitchMin[8388609], ViewPitchMax;
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    ViewRotation.Pitch = ViewRotation.Pitch & 65535;
    // End:0x125
    if((float(ViewRotation.Pitch) > ViewPitchMax) && float(ViewRotation.Pitch) < (float(65535) + ViewPitchMin))
    {
        // End:0xF4
        if(ViewRotation.Pitch < 32768)
        {
            ViewRotation.Pitch = int(ViewPitchMax);            
        }
        else
        {
            ViewRotation.Pitch = int(float(65535) + ViewPitchMin);
        }
    }
    return ViewRotation;
    //return ReturnValue;    
}

function CheckJumpOrDuck()
{
    // End:0x47
    if(bPressedJump && Pawn != none)
    {
        Pawn.DoJump(bUpdating);
    }
    //return;    
}

function AdjustPlayerWalkingMoveAccel()
{
    local /*0x35EA0000-0x00000000*/ private @NULL newAccel[25165825];

    //return;    
}

function IsSpectating()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

unreliable server function ServerSetSpectatorLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewLoc[8388609];

    // End:0x77
    if(WorldInfo.TimeSeconds != LastSpectatorStateSynchTime)
    {
        ClientGotoState(GetStateName());
        ClientSetViewTarget(GetViewTarget());
        LastSpectatorStateSynchTime = WorldInfo.TimeSeconds;
    }
    //return;    
}

unreliable server function ServerViewNextPlayer()
{
    // End:0x18
    if(IsSpectating())
    {
        ViewAPlayer(1);
    }
    //return;    
}

unreliable server function ServerViewPrevPlayer()
{
    // End:0x1C
    if(IsSpectating())
    {
        ViewAPlayer(-1);
    }
    //return;    
}

function GetNextViewablePlayer()
{
    local /*0x35EA0000-0x00000000*/ private int Dir[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int I, CurrentIndex, NewIndex;
    local /*0x35EA0000-0x00000000*/ private @NULL PRI;

    CurrentIndex = -1;
    // End:0xDA
    if(RealViewTarget != none)
    {
        I = 0;
        J0x29:

        // End:0xDA [Loop If]
        if(I < WorldInfo.GRI.PRIArray.Length)
        {
            // End:0xCC
            if(RealViewTarget == WorldInfo.GRI.PRIArray[I])
            {
                CurrentIndex = I;
                // [Explicit Break]
                goto J0xDA;
            }
            I++;
            // [Loop Continue]
            goto J0x29;
        }
    }
    J0xDA:

    NewIndex = CurrentIndex + Dir;
    J0xF8:

    // End:0x282 [Loop If]
    if((NewIndex >= 0) && NewIndex < WorldInfo.GRI.PRIArray.Length)
    {
        PRI = WorldInfo.GRI.PRIArray[NewIndex];
        // End:0x261
        if((((PRI != none) && Controller(PRI.Owner) != none) && Controller(PRI.Owner).Pawn != none) && WorldInfo.Game.CanSpectate(self, PRI))
        {
            return PRI;
        }
        NewIndex = NewIndex + Dir;
        // [Loop Continue]
        goto J0xF8;
    }
    CurrentIndex = ((NewIndex < 0) ? WorldInfo.GRI.PRIArray.Length : -1);
    NewIndex = CurrentIndex + Dir;
    J0x2F4:

    // End:0x47E [Loop If]
    if((NewIndex >= 0) && NewIndex < WorldInfo.GRI.PRIArray.Length)
    {
        PRI = WorldInfo.GRI.PRIArray[NewIndex];
        // End:0x45D
        if((((PRI != none) && Controller(PRI.Owner) != none) && Controller(PRI.Owner).Pawn != none) && WorldInfo.Game.CanSpectate(self, PRI))
        {
            return PRI;
        }
        NewIndex = NewIndex + Dir;
        // [Loop Continue]
        goto J0x2F4;
    }
    return none;
    //return ReturnValue;    
}

function ViewAPlayer()
{
    local /*0x35EA0000-0x00000000*/ private int Dir[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PRI;

    PRI = GetNextViewablePlayer(Dir);
    // End:0x40
    if(PRI != none)
    {
        SetViewTarget(PRI);
    }
    //return;    
}

unreliable server function ServerViewSelf()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TransitionParams[9437185];

    // End:0x41
    if(IsSpectating())
    {
        ResetCameraMode();
        SetViewTarget(self, TransitionParams);
        ClientSetViewTarget(self, TransitionParams);
    }
    //return;    
}

function CanRestartPlayer()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (((PlayerReplicationInfo != none) && !PlayerReplicationInfo.bOnlySpectator) && HasClientLoadedCurrentWorld()) && PendingSwapConnection == none;
    //return ReturnValue;    
}

function DrawHUD()
{
    local /*0x35EA0000-0x00000000*/ private @NULL H[8388609];

    // End:0x37
    if(Pawn != none)
    {
        Pawn.DrawHUD(H);
    }
    // End:0x6E
    if(PlayerInput != none)
    {
        PlayerInput.DrawHUD(H);
    }
    //return;    
}

event AdjustHUDRenderSize()
{
    local /*0x35EA0000-0x00000000*/ private int X[25165825], Y, SizeX, SizeY, FullScreenSizeX, FullScreenSizeY;

    // End:0x49
    if(bRenderHUDFullScreen)
    {
        X = 0;
        Y = 0;
        SizeX = FullScreenSizeX;
        SizeY = FullScreenSizeY;
    }
    //return;    
}

function OnToggleInput()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bNewValue;

    // End:0x16
    if(int(Role) < int(ROLE_Authority))
    {
        return;
    }
    // End:0xC0
    if(inAction.InputLinks[0].bHasImpulse)
    {
        // End:0x85
        if(inAction.bToggleMovement)
        {
            IgnoreMoveInput(false);
            ClientIgnoreMoveInput(false);
        }
        // End:0xBD
        if(inAction.bToggleTurning)
        {
            IgnoreLookInput(false);
            ClientIgnoreLookInput(false);
        }        
    }
    else
    {
        // End:0x16A
        if(inAction.InputLinks[1].bHasImpulse)
        {
            // End:0x12F
            if(inAction.bToggleMovement)
            {
                IgnoreMoveInput(true);
                ClientIgnoreMoveInput(true);
            }
            // End:0x167
            if(inAction.bToggleTurning)
            {
                IgnoreLookInput(true);
                ClientIgnoreLookInput(true);
            }            
        }
        else
        {
            // End:0x264
            if(inAction.InputLinks[2].bHasImpulse)
            {
                // End:0x203
                if(inAction.bToggleMovement)
                {
                    bNewValue = !IsMoveInputIgnored();
                    IgnoreMoveInput(bNewValue);
                    ClientIgnoreMoveInput(bNewValue);
                }
                // End:0x264
                if(inAction.bToggleTurning)
                {
                    bNewValue = !IsLookInputIgnored();
                    IgnoreLookInput(bNewValue);
                    ClientIgnoreLookInput(bNewValue);
                }
            }
        }
    }
    //return;    
}

reliable client simulated function ClientIgnoreMoveInput()
{
    local /*0x35EA0000-0x00000000*/ private bool bIgnore[8388609];

    IgnoreMoveInput(bIgnore);
    //return;    
}

reliable client simulated function ClientIgnoreLookInput()
{
    local /*0x35EA0000-0x00000000*/ private bool bIgnore[8388609];

    IgnoreLookInput(bIgnore);
    //return;    
}

simulated function DisplayDebug()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x35EA0000-0x00000000*/ private float out_YL[25165825], out_YPos;

    super.DisplayDebug(HUD, out_YL, out_YPos);
    // End:0x175
    if(false)
    {
        // End:0x175
        if(HUD.ShouldDisplayDebug('Camera'))
        {
            // End:0xA0
            if(PlayerCamera != none)
            {
                PlayerCamera.DisplayDebug(HUD, out_YL, out_YPos);                
            }
            else
            {
                HUD.Canvas.SetDrawColor(255, 0, 0);
                HUD.Canvas.DrawText("NO CAMERA");
                out_YPos += out_YL;
                HUD.Canvas.SetPos(4.0000000, out_YPos);
            }
        }
    }
    // End:0x2D8
    if(HUD.ShouldDisplayDebug('Input'))
    {
        HUD.Canvas.SetDrawColor(255, 0, 0);
        HUD.Canvas.DrawText((((("Input ignoremove " $ string(bIgnoreMoveInput)) $ " ignore look ") $ string(bIgnoreLookInput)) $ " aForward ") $ string(PlayerInput.aForward));
        out_YPos += out_YL;
        HUD.Canvas.SetPos(4.0000000, out_YPos);
    }
    //return;    
}

function OnDrawText()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x80
    if(inAction.InputLinks[0].bHasImpulse)
    {
        ClientDrawKismetText(inAction.DrawTextInfo, inAction.DisplayTimeSeconds);        
    }
    else
    {
        ClientClearKismetText(inAction.DrawTextInfo.MessageOffset);
    }
    //return;    
}

reliable client final simulated function ClientDrawKismetText()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL DrawTextInfo[8388609];
    local /*0x35EA0000-0x00000000*/ private float DisplayTime[8388609];

    // End:0x11
    if(!bShowKismetDrawText)
    {
        return;
    }
    // End:0x6B
    if(DisplayTime > float(0))
    {
        DrawTextInfo.MessageEndTime = WorldInfo.TimeSeconds + DisplayTime;        
    }
    else
    {
        DrawTextInfo.MessageEndTime = -1.0000000;
    }
    myHUD.KismetTextInfo.AddItem(DrawTextInfo);    
    //return;    
}

reliable client final simulated function ClientClearKismetText()
{
    local /*0x35EA0000-0x00000000*/ private @NULL MessageOffset[8388609];
    local /*0x35EA0000-0x00000000*/ private int RemoveIdx;

    RemoveIdx = myHUD.KismetTextInfo.Find('MessageOffset', MessageOffset);    
    // End:0x7B
    if(RemoveIdx != -1)
    {
        myHUD.KismetTextInfo.Remove(RemoveIdx, 1);        
    }
    //return;    
}

simulated function OnSetCameraTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609], RealCameraTarget;

    RealCameraTarget = inAction.CameraTarget;
    // End:0x5F
    if(RealCameraTarget == none)
    {
        RealCameraTarget = ((Pawn != none) ? Pawn : self);        
    }
    else
    {
        // End:0xB3
        if(RealCameraTarget.IsA('Controller'))
        {
            RealCameraTarget = Controller(RealCameraTarget).Pawn;
        }
    }
    SetViewTarget(RealCameraTarget, inAction.TransitionParams);
    //return;    
}

simulated function OnToggleHUD()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x13E
    if(myHUD != none)
    {
        // End:0x6A
        if(inAction.InputLinks[0].bHasImpulse)
        {
            myHUD.bShowHUD = true;            
        }
        else
        {
            // End:0xC5
            if(inAction.InputLinks[1].bHasImpulse)
            {
                myHUD.bShowHUD = false;                
            }
            else
            {
                // End:0x13E
                if(inAction.InputLinks[2].bHasImpulse)
                {
                    myHUD.bShowHUD = !myHUD.bShowHUD;
                }
            }
        }
    }
    //return;    
}

unreliable server function ServerCauseEvent()
{
    local /*0x35EA0000-0x00000000*/ private name EventName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array AllConsoleEvents;
    local /*0x35EA0000-0x00000000*/ private @NULL ConsoleEvt, GameSeq;
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private bool bFoundEvt;

    GameSeq = WorldInfo.GetGameSequence();
    // End:0x14F
    if((GameSeq != none) && EventName != 'None')
    {
        GameSeq.FindSeqObjectsByClass(Class'SeqEvent_Console', true, AllConsoleEvents);
        Idx = 0;
        J0x8E:

        // End:0x14F [Loop If]
        if(Idx < AllConsoleEvents.Length)
        {
            ConsoleEvt = SeqEvent_Console(AllConsoleEvents[Idx]);
            // End:0x141
            if((ConsoleEvt != none) && EventName == ConsoleEvt.ConsoleEventName)
            {
                bFoundEvt = true;
                ConsoleEvt.CheckActivate(self, Pawn);
            }
            Idx++;
            // [Loop Continue]
            goto J0x8E;
        }
    }
    // End:0x168
    if(!bFoundEvt)
    {
        ListConsoleEvents();
    }
    //return;    
}

exec function CauseEvent()
{
    local /*0x35EA0000-0x00000000*/ private name EventName[9437185];

    ServerCauseEvent(EventName);
    //return;    
}

exec function CE()
{
    local /*0x35EA0000-0x00000000*/ private name EventName[9437185];

    ServerCauseEvent(EventName);
    //return;    
}

exec function ListConsoleEvents()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ConsoleEvents;
    local /*0x35EA0000-0x00000000*/ private @NULL ConsoleEvt, GameSeq;
    local /*0x35EA0000-0x00000000*/ private int Idx;

    GameSeq = WorldInfo.GetGameSequence();
    // End:0x16A
    if(GameSeq != none)
    {
        ClientMessage("Console events:",, 15.0000000);
        GameSeq.FindSeqObjectsByClass(Class'SeqEvent_Console', true, ConsoleEvents);
        Idx = 0;
        J0x96:

        // End:0x16A [Loop If]
        if(Idx < ConsoleEvents.Length)
        {
            ConsoleEvt = SeqEvent_Console(ConsoleEvents[Idx]);
            // End:0x15C
            if((ConsoleEvt != none) && ConsoleEvt.bEnabled)
            {
                ClientMessage(("-" @ string(ConsoleEvt.ConsoleEventName)) @ ConsoleEvt.EventDesc,, 15.0000000);
            }
            Idx++;
            // [Loop Continue]
            goto J0x96;
        }
    }
    //return;    
}

exec function ListCE()
{
    ListConsoleEvents();
    //return;    
}

exec function RemoteEvent()
{
    local /*0x35EA0000-0x00000000*/ private name EventName[9437185];

    ServerRemoteEvent(EventName);
    //return;    
}

exec function RE()
{
    local /*0x35EA0000-0x00000000*/ private name EventName[9437185];

    ServerRemoteEvent(EventName);
    //return;    
}

unreliable server function ServerRemoteEvent()
{
    local /*0x35EA0000-0x00000000*/ private name EventName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array AllRemoteEvents;
    local /*0x35EA0000-0x00000000*/ private @NULL RemoteEvt, GameSeq;
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private bool bFoundEvt;

    GameSeq = WorldInfo.GetGameSequence();
    // End:0x14D
    if(GameSeq != none)
    {
        GameSeq.FindSeqObjectsByClass(Class'SeqEvent_RemoteEvent', true, AllRemoteEvents);
        // End:0x14D
        if(EventName != 'None')
        {
            Idx = 0;
            J0x8C:

            // End:0x14D [Loop If]
            if(Idx < AllRemoteEvents.Length)
            {
                RemoteEvt = SeqEvent_RemoteEvent(AllRemoteEvents[Idx]);
                // End:0x13F
                if((RemoteEvt != none) && EventName == RemoteEvt.EventName)
                {
                    bFoundEvt = true;
                    RemoteEvt.CheckActivate(self, Pawn);
                }
                Idx++;
                // [Loop Continue]
                goto J0x8C;
            }
        }
    }
    // End:0x23B
    if(!bFoundEvt)
    {
        ClientMessage("Remote events:",, 15.0000000);
        Idx = 0;
        J0x187:

        // End:0x23B [Loop If]
        if(Idx < AllRemoteEvents.Length)
        {
            RemoteEvt = SeqEvent_RemoteEvent(AllRemoteEvents[Idx]);
            // End:0x22D
            if((RemoteEvt != none) && RemoteEvt.bEnabled)
            {
                ClientMessage("-" @ string(RemoteEvt.EventName),, 15.0000000);
            }
            Idx++;
            // [Loop Continue]
            goto J0x187;
        }
    }
    //return;    
}

exec function ShowPlayerState()
{
    DumpStateStack();
    //return;    
}

exec function ShowGameState()
{
    // End:0x5B
    if(WorldInfo.Game != none)
    {
        WorldInfo.Game.DumpStateStack();        
    }
    //return;    
}

function NotifyTakeHit()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation;
    local /*0x35EA0000-0x00000000*/ private int Damage[8388609];
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Momentum[8388609];

    super.NotifyTakeHit(InstigatedBy, HitLocation, Damage, DamageType, Momentum);
    // End:0x84
    if(DamageType.default.DamagedFFWaveform != none)
    {
        ClientPlayForceFeedbackWaveform(DamageType.default.DamagedFFWaveform);
    }
    //return;    
}

function OnForceFeedback()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x63
    if(Action.InputLinks[0].bHasImpulse)
    {
        ClientPlayForceFeedbackWaveform(Action.FFWaveform);        
    }
    else
    {
        // End:0xC2
        if(Action.InputLinks[1].bHasImpulse)
        {
            ClientStopForceFeedbackWaveform(Action.FFWaveform);
        }
    }
    //return;    
}

event PlayRumble()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TheAnimNotify[8519681];

    // End:0x65
    if(TheAnimNotify.PredefinedWaveForm != none)
    {
        ClientPlayForceFeedbackWaveform(TheAnimNotify.PredefinedWaveForm.default.TheWaveForm);        
    }
    else
    {
        ClientPlayForceFeedbackWaveform(TheAnimNotify.WaveForm);
    }
    //return;    
}

reliable client simulated event ClientPlayForceFeedbackWaveform()
{
    local /*0x35EA0000-0x00000000*/ private @NULL FFWaveform[8388609], FFWaveformInstigator;

    // End:0x60
    if(((PlayerInput != none) && !PlayerInput.bUsingGamepad) && !WorldInfo.IsConsoleBuild(0))
    {
        return;
    }
    // End:0xC0
    if(((ForceFeedbackManager != none) && PlayerReplicationInfo != none) && IsForceFeedbackAllowed())
    {
        ForceFeedbackManager.PlayForceFeedbackWaveform(FFWaveform, FFWaveformInstigator);
    }
    //return;    
}

reliable client simulated event ClientStopForceFeedbackWaveform()
{
    local /*0x35EA0000-0x00000000*/ private @NULL FFWaveform[9437185];

    // End:0x38
    if(ForceFeedbackManager != none)
    {
        ForceFeedbackManager.StopForceFeedbackWaveform(FFWaveform);
    }
    //return;    
}

simulated function IsForceFeedbackAllowed()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (ForceFeedbackManager != none) && ForceFeedbackManager.bAllowsForceFeedback;
    //return ReturnValue;    
}

function OnToggleCinematicMode()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bNewCinematicMode;

    // End:0x16
    if(int(Role) < int(ROLE_Authority))
    {
        return;
    }
    // End:0x5C
    if(Action.InputLinks[0].bHasImpulse)
    {
        bNewCinematicMode = true;        
    }
    else
    {
        // End:0xA2
        if(Action.InputLinks[1].bHasImpulse)
        {
            bNewCinematicMode = false;            
        }
        else
        {
            // End:0xF1
            if(Action.InputLinks[2].bHasImpulse)
            {
                bNewCinematicMode = !bCinematicMode;
            }
        }
    }
    SetCinematicMode(bNewCinematicMode, Action.bHidePlayer, Action.bHideHUD, Action.bDisableMovement, Action.bDisableTurning, Action.bDisableInput);
    //return;    
}

function SetCinematicMode()
{
    local /*0x35EA0000-0x00000000*/ private bool bInCinematicMode[8388609], bHidePlayer, bAffectsHUD, bAffectsMovement, bAffectsTurning, bAffectsButtons,
	    bAdjustMoveInput, bAdjustLookInput;

    bCinematicMode = bInCinematicMode;
    // End:0x63
    if(bCinematicMode)
    {
        // End:0x60
        if((Pawn != none) && bHidePlayer)
        {
            Pawn.SetHidden(true);
        }        
    }
    else
    {
        // End:0x92
        if(Pawn != none)
        {
            Pawn.SetHidden(false);
        }
    }
    bAdjustMoveInput = bAffectsMovement && bCinematicMode != bCinemaDisableInputMove;
    bAdjustLookInput = bAffectsTurning && bCinematicMode != bCinemaDisableInputLook;
    // End:0x128
    if(bAdjustMoveInput)
    {
        IgnoreMoveInput(bCinematicMode);
        bCinemaDisableInputMove = bCinematicMode;
    }
    // End:0x15E
    if(bAdjustLookInput)
    {
        IgnoreLookInput(bCinematicMode);
        bCinemaDisableInputLook = bCinematicMode;
    }
    ClientSetCinematicMode(bCinematicMode, bAdjustMoveInput, bAdjustLookInput, bAffectsHUD);
    //return;    
}

reliable client simulated function ClientSetCinematicMode()
{
    local /*0x35EA0000-0x00000000*/ private bool bInCinematicMode[8388609], bAffectsMovement, bAffectsTurning, bAffectsHUD;

    bCinematicMode = bInCinematicMode;
    // End:0x5F
    if((myHUD != none) && bAffectsHUD)
    {
        myHUD.bShowHUD = !bCinematicMode;
    }
    // End:0x80
    if(bAffectsMovement)
    {
        IgnoreMoveInput(bCinematicMode);
    }
    // End:0xA1
    if(bAffectsTurning)
    {
        IgnoreLookInput(bCinematicMode);
    }
    //return;    
}

function IgnoreMoveInput()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewMoveInput[8388609];

    bIgnoreMoveInput = byte(Max(int(bIgnoreMoveInput) + ((bNewMoveInput) ? 1 : -1), 0));
    //return;    
}

event IsMoveInputIgnored()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return int(bIgnoreMoveInput) > int(0);
    //return ReturnValue;    
}

function IgnoreLookInput()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewLookInput[8388609];

    bIgnoreLookInput = byte(Max(int(bIgnoreLookInput) + ((bNewLookInput) ? 1 : -1), 0));
    //return;    
}

event IsLookInputIgnored()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return int(bIgnoreLookInput) > int(0);
    //return ReturnValue;    
}

function ResetPlayerMovementInput()
{
    bIgnoreMoveInput = default.bIgnoreMoveInput;
    bIgnoreLookInput = default.bIgnoreLookInput;
    //return;    
}

function OnConsoleCommand()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Command;

    // End:0x85
    foreach inAction.Commands(Command)
    {
        // End:0x84
        if(!Left(Command, 4) ~= "set " && !Left(Command, 9) ~= "setnopec ")
        {            
            ConsoleCommand(Command);
        }        
    }    
    //return;    
}

reliable client simulated event ClientForceGarbageCollection()
{
    WorldInfo.ForceGarbageCollection();
    //return;    
}

final event LevelStreamingStatusChanged()
{
    local /*0x35EA0000-0x00000000*/ private @NULL LevelObject[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bNewShouldBeLoaded[8388609], bNewShouldBeVisible, bNewShouldBlockOnLoad;

    ClientUpdateLevelStreamingStatus(LevelObject.PackageName, bNewShouldBeLoaded, bNewShouldBeVisible, bNewShouldBlockOnLoad);
    //return;    
}

// Export UPlayerController::execClientUpdateLevelStreamingStatus(FFrame&, void* const)
reliable client native simulated function ClientUpdateLevelStreamingStatus()
{
    local /*0x35EA0000-0x00000000*/ private name PackageName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bNewShouldBeLoaded[8388609], bNewShouldBeVisible, bNewShouldBlockOnLoad;


}

// Export UPlayerController::execServerUpdateLevelVisibility(FFrame&, void* const)
reliable server native final event ServerUpdateLevelVisibility()
{
    local /*0x35EA0000-0x00000000*/ private name PackageName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIsVisible[8388609];


}

event AddToWorld()
{
    local /*0x35EA0000-0x00000000*/ private name LevelName[8388609];

    //return;    
}

event RemoveFromWorld()
{
    local /*0x35EA0000-0x00000000*/ private name LevelName[8388609];

    //return;    
}

reliable client simulated event ClientPrepareMapChange()
{
    local /*0x35EA0000-0x00000000*/ private name LevelName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bFirst[8388609], bLast, bSkipProcessingAlreadyLoadedLevels;
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    false
    // End:0x3D
    foreach LocalPlayerControllers(Class'PlayerController', PC)
    {
        // End:0x39
        if(PC != self)
        {            
            return;
            // End:0x3C
            continue;
        }
        // End:0x3D
        break;        
    }    
    // End:0x6B
    if(bFirst)
    {
        PendingMapChangeLevelNames.Length = 0;
        ClearTimer('DelayedPrepareMapChange');
    }
    PendingMapChangeLevelNames[PendingMapChangeLevelNames.Length] = LevelName;
    // End:0xAA
    if(bLast)
    {
        DelayedPrepareMapChange(bSkipProcessingAlreadyLoadedLevels);
    }
    //return;    
}

function DelayedPrepareMapChange()
{
    local /*0x35EA0000-0x00000000*/ private bool bSkipProcessingAlreadyLoadedLevels[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL GE;

    false
    GE = GameEngine(Class'Engine'.static.GetEngine());
    // End:0x70
    if(GE != none)
    {
        GE.bSkipProcessingAlreadyLoadedLevelsOnPrepareMapChange = bSkipProcessingAlreadyLoadedLevels;
    }
    DelayedPrepareMapChangeTimer();
    //return;    
}

function DelayedPrepareMapChangeTimer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL GE;
    local /*0x35EA0000-0x00000000*/ private bool bSkipProcessingAlreadyLoadedLevels;

    GE = GameEngine(Class'Engine'.static.GetEngine());
    // End:0x6B
    if(GE != none)
    {
        bSkipProcessingAlreadyLoadedLevels = GE.bSkipProcessingAlreadyLoadedLevelsOnPrepareMapChange;
    }
    // End:0xA3
    if(WorldInfo.IsPreparingMapChange())
    {
        SetTimer(0.0100000, false, 'DelayedPrepareMapChangeTimer');        
    }
    else
    {
        WorldInfo.PrepareMapChange(PendingMapChangeLevelNames, bSkipProcessingAlreadyLoadedLevels);
    }
    //return;    
}

reliable client simulated event ClientCommitMapChange()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ExtraParams[9437185], GE;

    GE = GameEngine(Class'Engine'.static.GetEngine());
    // End:0x6A
    if(GE != none)
    {
        GE.ExtraParamsOnCommitMapChange = ExtraParams;
    }
    ClientCommitMapChangeTimer();
    //return;    
}

function ClientCommitMapChangeTimer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL GE, ExtraParams;

    GE = GameEngine(Class'Engine'.static.GetEngine());
    // End:0x69
    if(GE != none)
    {
        ExtraParams = GE.ExtraParamsOnCommitMapChange;
    }
    // End:0x96
    if(IsTimerActive('DelayedPrepareMapChange'))
    {
        SetTimer(0.0100000, false, 'ClientCommitMapChangeTimer');        
    }
    else
    {
        // End:0xBC
        if(Pawn != none)
        {
            SetViewTarget(Pawn);            
        }
        else
        {
            SetViewTarget(self);
        }
        WorldInfo.CommitMapChange(ExtraParams);
    }
    //return;    
}

event PreCommitMapChange()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ExtraParams[9437185];

    //return;    
}

event CommitMapChangeCleanup()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ExtraParams[9437185];

    //return;    
}

event PostCommitMapChange()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ExtraParams[9437185];

    //return;    
}

reliable client simulated event ClientCancelPendingMapChange()
{
    local /*0x35EA0000-0x00000000*/ private bool bUnloadExistingStreamLevels[9437185];

    false
    WorldInfo.CancelPendingMapChange(bUnloadExistingStreamLevels);
    //return;    
}

// Export UPlayerController::execClientFlushLevelStreaming(FFrame&, void* const)
reliable client native final simulated event ClientFlushLevelStreaming();

reliable client simulated event ClientSetBlockOnAsyncLoading()
{
    WorldInfo.bRequestedBlockOnAsyncLoading = true;
    //return;    
}

reliable client simulated function ClientWaitForLevelsVisible()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];

    inAction.CheckLevelsVisible();
    //return;    
}

exec function SaveClassConfig()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ClassName[142606337];
    local /*0x35EA0000-0x00000000*/ private class saveClass;

    saveClass = class<Object>(DynamicLoadObject(ClassName, Class'Core.Class'));
    // End:0x5E
    if(saveClass != none)
    {
        saveClass.static.StaticSaveConfig();
    }
    //return;    
}

exec function SaveActorConfig()
{
    local /*0x35EA0000-0x00000000*/ private name actorName[142606337];
    local /*0x35EA0000-0x00000000*/ private @NULL ChkActor;

    // End:0x6F
    foreach AllActors(Class'Actor', ChkActor)
    {
        // End:0x6E
        if((ChkActor != none) && ChkActor.Name == actorName)
        {
            ChkActor.SaveConfig();
        }        
    }    
    //return;    
}

final function GetUIController()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], LP, Result;

    LP = LocalPlayer(Player);
    // End:0x8E
    if((LP != none) && LP.ViewportClient != none)
    {
        Result = LP.ViewportClient.UIController;
    }
    return Result;
    //return ReturnValue;    
}

// Export UPlayerController::execIsPlayerMuted(FFrame&, void* const)
native function IsPlayerMuted()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Sender[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

event GetSeamlessTravelActorList()
{
    local /*0x35EA0000-0x00000000*/ private bool bToEntry[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ActorList[25165825];

    HearSoundActiveComponents.Length = 0;
    HearSoundPoolComponents.Length = 0;
    // End:0x45
    if(myHUD != none)
    {
        ActorList[ActorList.Length] = myHUD;
    }
    //return;    
}

function SeamlessTravelTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewPC[8388609];

    //return;    
}

function SeamlessTravelFrom()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OldPC[8388609];

    OldPC.PlayerReplicationInfo.Reset();
    OldPC.PlayerReplicationInfo.SeamlessTravelTo(PlayerReplicationInfo);
    OldPC.bIsPlayer = false;
    OldPC.PlayerReplicationInfo.Destroy();
    OldPC.PlayerReplicationInfo = none;
    //return;    
}

reliable client simulated function ClientSetOnlineStatus()
{
    //return;    
}

// Export UPlayerController::execGetPlayerControllerFromNetId(FFrame&, void* const)
native static function GetPlayerControllerFromNetId()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerNetId[8388609], ReturnValue;


}

reliable client simulated function ClientVoiceHandshakeComplete()
{
    local /*0x35EA0000-0x00000000*/ private int PeerIdx;

    bHasVoiceHandshakeCompleted = true;
    PeerIdx = 0;
    J0x17:

    // End:0x93 [Loop If]
    if(PeerIdx < ConnectedPeers.Length)
    {
        ServerAddPeer(ConnectedPeers[PeerIdx].PlayerID, ConnectedPeers[PeerIdx].NatType);
        PeerIdx++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

reliable client simulated event ClientMutePlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerNetId[8388609], LocPlayer;

    // End:0x52
    if(VoicePacketFilter.Find('Uid', PlayerNetId.Uid) == )
    {        
        VoicePacketFilter.AddItem(PlayerNetId);        
    }
    // End:0xE7
    if(NotEqual_InterfaceInterface(VoiceInterface, OnlineVoiceInterface(none)))
    {
        LocPlayer = LocalPlayer(Player);
        // End:0xE7
        if(LocPlayer != none)
        {
            VoiceInterface.MuteRemoteTalker(byte(LocPlayer.ControllerId), PlayerNetId);
        }
    }
    //return;    
}

reliable client simulated event ClientUnmutePlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerNetId[8388609], LocPlayer;
    local /*0x35EA0000-0x00000000*/ private int RemoveIndex;

    RemoveIndex = VoicePacketFilter.Find('Uid', PlayerNetId.Uid);    
    // End:0x64
    if(RemoveIndex != -1)
    {
        VoicePacketFilter.Remove(RemoveIndex, 1);        
    }
    // End:0xF9
    if(NotEqual_InterfaceInterface(VoiceInterface, OnlineVoiceInterface(none)))
    {
        LocPlayer = LocalPlayer(Player);
        // End:0xF9
        if(LocPlayer != none)
        {
            VoiceInterface.UnmuteRemoteTalker(byte(LocPlayer.ControllerId), PlayerNetId);
        }
    }
    //return;    
}

function GameplayMutePlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerNetId[8388609];

    // End:0x52
    if(GameplayVoiceMuteList.Find('Uid', PlayerNetId.Uid) == )
    {        
        GameplayVoiceMuteList.AddItem(PlayerNetId);        
    }
    // End:0xA4
    if(VoicePacketFilter.Find('Uid', PlayerNetId.Uid) == )
    {        
        VoicePacketFilter.AddItem(PlayerNetId);        
    }
    ClientMutePlayer(PlayerNetId);
    //return;    
}

function GameplayUnmutePlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerNetId[8388609];
    local /*0x35EA0000-0x00000000*/ private int RemoveIndex;
    local /*0x35EA0000-0x00000000*/ private @NULL Other;

    RemoveIndex = GameplayVoiceMuteList.Find('Uid', PlayerNetId.Uid);    
    // End:0x64
    if(RemoveIndex != -1)
    {
        GameplayVoiceMuteList.Remove(RemoveIndex, 1);        
    }
    Other = GetPlayerControllerFromNetId(PlayerNetId);
    // End:0x1AB
    if(Other != none)
    {
        // End:0x1AB
        if((VoiceMuteList.Find('Uid', PlayerNetId.Uid) == ) && )
        {
            Other.VoiceMuteList.Find('Uid', PlayerReplicationInfo.UniqueId.Uid) == ;                        
            RemoveIndex = VoicePacketFilter.Find('Uid', PlayerNetId.Uid);            
            // End:0x198
            if(RemoveIndex != -1)
            {
                VoicePacketFilter.Remove(RemoveIndex, 1);                
            }
            ClientUnmutePlayer(PlayerNetId);
        }
    }
    //return;    
}

reliable server event ServerMutePlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerNetId[8388609], Other;

    // End:0x52
    if(VoiceMuteList.Find('Uid', PlayerNetId.Uid) == )
    {        
        VoiceMuteList.AddItem(PlayerNetId);        
    }
    // End:0xA4
    if(VoicePacketFilter.Find('Uid', PlayerNetId.Uid) == )
    {        
        VoicePacketFilter.AddItem(PlayerNetId);        
    }
    ClientMutePlayer(PlayerNetId);
    Other = GetPlayerControllerFromNetId(PlayerNetId);
    // End:0x1C6
    if(Other != none)
    {
        // End:0x189
        if(Other.VoicePacketFilter.Find('Uid', PlayerReplicationInfo.UniqueId.Uid) == )
        {            
            Other.VoicePacketFilter.AddItem(PlayerReplicationInfo.UniqueId);            
        }
        Other.ClientMutePlayer(PlayerReplicationInfo.UniqueId);
    }
    //return;    
}

reliable server event ServerUnmutePlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerNetId[8388609], Other;
    local /*0x35EA0000-0x00000000*/ private int RemoveIndex;

    RemoveIndex = VoiceMuteList.Find('Uid', PlayerNetId.Uid);    
    // End:0x64
    if(RemoveIndex != -1)
    {
        VoiceMuteList.Remove(RemoveIndex, 1);        
    }
    Other = GetPlayerControllerFromNetId(PlayerNetId);
    // End:0x359
    if(Other != none)
    {
        // End:0x147
        if((GameplayVoiceMuteList.Find('Uid', PlayerNetId.Uid) == ) && )
        {
            Other.VoiceMuteList.Find('Uid', PlayerReplicationInfo.UniqueId.Uid) == ;                        
            ClientUnmutePlayer(PlayerNetId);
        }
        // End:0x359
        if((Other.VoiceMuteList.Find('Uid', PlayerReplicationInfo.UniqueId.Uid) == ) && )
        {
            Other.GameplayVoiceMuteList.Find('Uid', PlayerReplicationInfo.UniqueId.Uid) == ;                        
            RemoveIndex = VoicePacketFilter.Find('Uid', PlayerNetId.Uid);            
            // End:0x279
            if(RemoveIndex != -1)
            {
                VoicePacketFilter.Remove(RemoveIndex, 1);                
            }
            RemoveIndex = Other.VoicePacketFilter.Find('Uid', PlayerReplicationInfo.UniqueId.Uid);            
            // End:0x31C
            if(RemoveIndex != -1)
            {
                Other.VoicePacketFilter.Remove(RemoveIndex, 1);                
            }
            Other.ClientUnmutePlayer(PlayerReplicationInfo.UniqueId);
        }
    }
    //return;    
}

function MutePlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerNetId[8388609];

    //return;    
}

function UnmutePlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerNetId[8388609];

    //return;    
}

// Export UPlayerController::execIsPlayerLocallyMuted(FFrame&, void* const)
native function IsPlayerLocallyMuted()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerNetId[25296897];
    local /*0x35EA0000-0x00000000*/ private bool checkSystemWide[9437185], ReturnValue;

    true                
}

event NotifyDirectorControl()
{
    local /*0x35EA0000-0x00000000*/ private bool bNowControlling[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL CurrentMatinee[8388609];

    // End:0x53
    if((!bNowControlling && int(WorldInfo.NetMode) == int(NM_Client)) && bClientSimulatingViewTarget)
    {
        ServerVerifyViewTarget();
    }
    //return;    
}

// Export UPlayerController::execSetShowSubtitles(FFrame&, void* const)
native simulated exec function SetShowSubtitles()
{
    local /*0x35EA0000-0x00000000*/ private bool bValue[8388609];


}

// Export UPlayerController::execIsShowingSubtitles(FFrame&, void* const)
native simulated function IsShowingSubtitles()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

reliable client simulated event ClientWasKicked()
{
    //return;    
}

reliable client simulated function ClientRegisterForArbitration()
{
    // End:0xCD
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none)))
    {
        OnlineSub.GameInterface.AddArbitrationRegistrationCompleteDelegate(OnArbitrationRegisterComplete);
        OnlineSub.GameInterface.RegisterForArbitration('Game');        
    }
    else
    {
        ServerRegisteredForArbitration(true);
    }
    //return;    
}

function OnArbitrationRegisterComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    OnlineSub.GameInterface.ClearArbitrationRegistrationCompleteDelegate(OnArbitrationRegisterComplete);
    ServerRegisteredForArbitration(bWasSuccessful);
    //return;    
}

reliable server function ServerRegisteredForArbitration()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    WorldInfo.Game.ProcessClientRegistrationCompletion(self, bWasSuccessful);
    //return;    
}

function OnGameInviteAccepted()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InviteResult[25296897], GameInviteSettings;

    // End:0x35C
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none)))
    {
        GameInviteSettings = InviteResult.GameSettings;
        // End:0x352
        if(GameInviteSettings != none)
        {
            // End:0x345
            if(InviteHasEnoughSpace(GameInviteSettings))
            {
                // End:0x338
                if(CanAllPlayersPlayOnline())
                {
                    // End:0x233
                    if(int(WorldInfo.NetMode) != int(NM_Standalone))
                    {
                        // End:0x1AC
                        if(OnlineSub.GameInterface.GetGameSettings('Game').bUsesArbitration)
                        {
                            ClientWriteOnlinePlayerScores(((WorldInfo.GRI.GameClass != none) ? WorldInfo.GRI.GameClass.default.ArbitratedLeaderboardId : 0));
                        }
                        OnlineSub.GameInterface.AddEndOnlineGameCompleteDelegate(OnEndForInviteComplete);
                        OnlineSub.GameInterface.EndOnlineGame('Game');                        
                    }
                    else
                    {
                        OnlineSub.GameInterface.AddJoinOnlineGameCompleteDelegate(OnInviteJoinComplete);
                        // End:0x335
                        if(!OnlineSub.GameInterface.AcceptGameInvite(byte(LocalPlayer(Player).ControllerId), 'Game'))
                        {
                            OnlineSub.GameInterface.ClearJoinOnlineGameCompleteDelegate(OnInviteJoinComplete);
                            NotifyInviteFailed();
                        }
                    }                    
                }
                else
                {
                    NotifyNotAllPlayersCanJoinInvite();
                }                
            }
            else
            {
                NotifyNotEnoughSpaceInInvite();
            }            
        }
        else
        {
            NotifyInviteFailed();
        }
    }
    //return;    
}

function InviteHasEnoughSpace()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InviteSettings[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int NumLocalPlayers;
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    // End:0x2B
    foreach LocalPlayerControllers(Class'PlayerController', PC)
    {
        NumLocalPlayers++;        
    }    
    return (InviteSettings.NumOpenPrivateConnections + InviteSettings.NumOpenPublicConnections) >= NumLocalPlayers;
    //return ReturnValue;    
}

function CanAllPlayersPlayOnline()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL PC, LocPlayer;

    // End:0x12B
    foreach LocalPlayerControllers(Class'PlayerController', PC)
    {
        LocPlayer = LocalPlayer(PC.Player);
        // End:0x127
        if(LocPlayer != none)
        {
            // End:0x124
            if((int(OnlineSub.PlayerInterface.GetLoginStatus(byte(LocPlayer.ControllerId))) != int(2)) || int(OnlineSub.PlayerInterface.CanPlayOnline(byte(LocPlayer.ControllerId))) == int(0))
            {                
                return false;
            }
            // End:0x12A
            continue;
        }        
        return false;        
    }    
    return true;
    //return ReturnValue;    
}

function ClearInviteDelegates()
{
    OnlineSub.GameInterface.ClearEndOnlineGameCompleteDelegate(OnEndForInviteComplete);
    OnlineSub.GameInterface.ClearDestroyOnlineGameCompleteDelegate(OnDestroyForInviteComplete);
    OnlineSub.GameInterface.ClearJoinOnlineGameCompleteDelegate(OnInviteJoinComplete);
    //return;    
}

function OnEndForInviteComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    OnlineSub.GameInterface.AddDestroyOnlineGameCompleteDelegate(OnDestroyForInviteComplete);
    OnlineSub.GameInterface.DestroyOnlineGame(SessionName);
    //return;    
}

function OnDestroyForInviteComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    // End:0x112
    if(bWasSuccessful)
    {
        OnlineSub.GameInterface.AddJoinOnlineGameCompleteDelegate(OnInviteJoinComplete);
        // End:0x10F
        if(!OnlineSub.GameInterface.AcceptGameInvite(byte(LocalPlayer(Player).ControllerId), SessionName))
        {
            OnlineSub.GameInterface.ClearJoinOnlineGameCompleteDelegate(OnInviteJoinComplete);
            NotifyInviteFailed();
        }        
    }
    else
    {
        NotifyInviteFailed();
    }
    //return;    
}

function ModifyClientURL()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[8388609], ReturnValue;

    return URL;
    //return ReturnValue;    
}

function OnInviteJoinComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL;

    // End:0xF9
    if(bWasSuccessful)
    {
        // End:0xF6
        if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none)))
        {
            // End:0xF6
            if(OnlineSub.GameInterface.GetResolvedConnectString(SessionName, URL))
            {                
                URL $= "?bIsFromInvite";
                URL = ModifyClientURL(URL);
                ClientTravel(URL, 0);
            }
        }        
    }
    else
    {
        NotifyInviteFailed();
    }
    ClearInviteDelegates();
    //return;    
}

function NotifyInviteFailed()
{
    ClearInviteDelegates();
    //return;    
}

function NotifyNotAllPlayersCanJoinInvite()
{
    //return;    
}

function NotifyNotEnoughSpaceInInvite()
{
    //return;    
}

reliable client simulated function ClientArbitratedMatchEnded()
{
    ConsoleCommand("Disconnect");
    //return;    
}

reliable client simulated function ClientWriteOnlinePlayerScores()
{
    local /*0x35EA0000-0x00000000*/ private int LeaderboardId[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL GRI;
    local /*0x35EA0000-0x00000000*/ private int Index;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array PlayerScores;
    local /*0x35EA0000-0x00000000*/ private @NULL ZeroUniqueId;
    local /*0x35EA0000-0x00000000*/ private bool bIsTeamGame;
    local /*0x35EA0000-0x00000000*/ private int ScoreIndex;

    GRI = WorldInfo.GRI;
    // End:0x4DE
    if(((GRI != none) && OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.StatsInterface, OnlineStatsInterface(none)))
    {
        bIsTeamGame = ((GRI.GameClass != none) ? GRI.GameClass.default.bTeamGame : false);
        Index = 0;
        J0xF0:

        // End:0x479 [Loop If]
        if(Index < GRI.PRIArray.Length)
        {
            // End:0x46B
            if(NotEqual_UniqueNetIdUniqueNetId(GRI.PRIArray[Index].UniqueId, ZeroUniqueId))
            {
                // End:0x346
                if(bIsTeamGame)
                {
                    // End:0x343
                    if(GRI.PRIArray[Index].Team != none)
                    {
                        ScoreIndex = PlayerScores.Length;
                        PlayerScores.Length = ScoreIndex + 1;
                        PlayerScores[ScoreIndex].PlayerID = GRI.PRIArray[Index].UniqueId;
                        PlayerScores[ScoreIndex].TeamID = GRI.PRIArray[Index].Team.TeamIndex;
                        PlayerScores[ScoreIndex].Score = int(GRI.PRIArray[Index].Team.Score);
                    }                    
                }
                else
                {
                    ScoreIndex = PlayerScores.Length;
                    PlayerScores.Length = ScoreIndex + 1;
                    PlayerScores[ScoreIndex].PlayerID = GRI.PRIArray[Index].UniqueId;
                    PlayerScores[ScoreIndex].TeamID = Index;
                    PlayerScores[ScoreIndex].Score = int(GRI.PRIArray[Index].Score);
                }
            }
            Index++;
            // [Loop Continue]
            goto J0xF0;
        }
        OnlineSub.StatsInterface.WriteOnlinePlayerScores(PlayerReplicationInfo.SessionName, LeaderboardId, PlayerScores);
    }
    //return;    
}

reliable client simulated function ClientWriteLeaderboardStats()
{
    local /*0x35EA0000-0x00000000*/ private class OnlineStatsWriteClass[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIsIncomplete[9437185];

    false
    //return;    
}

reliable client simulated function ClientSetHostUniqueId()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InHostId[8388609];

    //return;    
}

reliable client simulated function ClientStopNetworkedVoice()
{
    local /*0x35EA0000-0x00000000*/ private @NULL LocPlayer;

    LocPlayer = LocalPlayer(Player);
    // End:0xC8
    if(((LocPlayer != none) && OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.VoiceInterface, OnlineVoiceInterface(none)))
    {
        OnlineSub.VoiceInterface.StopNetworkedVoice(byte(LocPlayer.ControllerId));
    }
    //return;    
}

reliable client simulated function ClientStartNetworkedVoice()
{
    local /*0x35EA0000-0x00000000*/ private @NULL LocPlayer;

    LocPlayer = LocalPlayer(Player);
    // End:0xC8
    if(((LocPlayer != none) && OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.VoiceInterface, OnlineVoiceInterface(none)))
    {
        OnlineSub.VoiceInterface.StartNetworkedVoice(byte(LocPlayer.ControllerId));
    }
    //return;    
}

simulated function OnDestroy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    Action.ScriptLog("Cannot use Destroy action on players");
    //return;    
}

final simulated function DrawDebugTextList()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Canvas[8388609];
    local /*0x35EA0000-0x00000000*/ private float RenderDelta[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL CameraLoc, ScreenLoc, Offset, WorldTextLoc, CameraRot;

    local /*0x35EA0000-0x00000000*/ private int Idx;

    // End:0x5D0
    if(DebugTextList.Length > 0)
    {
        GetPlayerViewPoint(CameraLoc, CameraRot);
        Canvas.SetDrawColor(255, 255, 255);
        Idx = 0;
        J0x5D:

        // End:0x5D0 [Loop If]
        if(Idx < DebugTextList.Length)
        {
            // End:0xBB
            if(DebugTextList[Idx].SrcActor == none)
            {
                DebugTextList.Remove(Idx--, 1);                                
            }
            else
            {
                // End:0x166
                if(DebugTextList[Idx].TimeRemaining != -1.0000000)
                {
                    DebugTextList[Idx].TimeRemaining -= RenderDelta;
                    // End:0x166
                    if(DebugTextList[Idx].TimeRemaining <= 0.0000000)
                    {
                        DebugTextList.Remove(Idx--, 1);                        
                        // [Explicit Continue]
                        goto J0x5C2;
                    }
                }
                // End:0x1DA
                if(DebugTextList[Idx].Font != none)
                {
                    Canvas.Font = DebugTextList[Idx].Font;                    
                }
                else
                {
                    Canvas.Font = Class'Engine'.static.GetSmallFont();
                }
                // End:0x2FA
                if(DebugTextList[Idx].bAbsoluteLocation)
                {
                    WorldTextLoc = VLerp(DebugTextList[Idx].SrcActorOffset, DebugTextList[Idx].SrcActorDesiredOffset, 1.0000000 - (DebugTextList[Idx].TimeRemaining / DebugTextList[Idx].Duration));                    
                }
                else
                {
                    Offset = VLerp(DebugTextList[Idx].SrcActorOffset, DebugTextList[Idx].SrcActorDesiredOffset, 1.0000000 - (DebugTextList[Idx].TimeRemaining / DebugTextList[Idx].Duration));
                    // End:0x438
                    if(DebugTextList[Idx].bKeepAttachedToActor)
                    {
                        WorldTextLoc = DebugTextList[Idx].SrcActor.Location + (Offset >> CameraRot);                        
                    }
                    else
                    {
                        WorldTextLoc = DebugTextList[Idx].OrigActorLocation + (Offset >> CameraRot);
                    }
                }
                // End:0x5C2
                if(((WorldTextLoc - CameraLoc) Dot Vector(CameraRot)) > 0.0000000)
                {
                    ScreenLoc = Canvas.Project(WorldTextLoc);
                    Canvas.SetPos(ScreenLoc.X, ScreenLoc.Y);
                    Canvas.DrawColor = DebugTextList[Idx].TextColor;
                    Canvas.DrawText(DebugTextList[Idx].DebugText);
                }
            }
            J0x5C2:

            Idx++;
            // [Loop Continue]
            goto J0x5D;
        }
    }
    //return;    
}

reliable client simulated event AddDebugText()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string DebugText[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL SrcActor[9437185];
    local /*0x35EA0000-0x00000000*/ private float Duration[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL Offset[9437185], DesiredOffset, TextColor;
    local /*0x35EA0000-0x00000000*/ private bool bSkipOverwriteCheck[9437185], bAbsoluteLocation, bKeepAttachedToActor;
    local /*0x35EA0000-0x00000000*/ private @NULL InFont[9437185];
    local /*0x35EA0000-0x00000000*/ private int Idx;

    -1.0000000                    
    true    
    // End:0x133
    if((((int(TextColor.R) == int(0)) && int(TextColor.G) == int(0)) && int(TextColor.B) == int(0)) && int(TextColor.A) == int(0))
    {
        TextColor.R = 255;
        TextColor.G = 255;
        TextColor.B = 255;
        TextColor.A = 255;
    }
    // End:0x436
    if(SrcActor != none)
    {
        // End:0x169
        if(Len(DebugText) == 0)
        {
            RemoveDebugText(SrcActor);            
        }
        else
        {
            // End:0x1E2
            if(!bSkipOverwriteCheck)
            {
                Idx = DebugTextList.Find('SrcActor', SrcActor);                
                // End:0x1DF
                if(Idx == -1)
                {
                    Idx = DebugTextList.Length;
                    DebugTextList.Length = Idx + 1;
                }                
            }
            else
            {
                Idx = DebugTextList.Length;
                DebugTextList.Length = Idx + 1;
            }
            DebugTextList[Idx].SrcActor = SrcActor;
            DebugTextList[Idx].SrcActorOffset = Offset;
            DebugTextList[Idx].SrcActorDesiredOffset = DesiredOffset;
            DebugTextList[Idx].DebugText = DebugText;
            DebugTextList[Idx].TimeRemaining = Duration;
            DebugTextList[Idx].Duration = Duration;
            DebugTextList[Idx].TextColor = TextColor;
            DebugTextList[Idx].bAbsoluteLocation = bAbsoluteLocation;
            DebugTextList[Idx].bKeepAttachedToActor = bKeepAttachedToActor;
            DebugTextList[Idx].OrigActorLocation = SrcActor.Location;
            DebugTextList[Idx].Font = InFont;
        }
    }
    //return;    
}

reliable client final simulated event RemoveDebugText()
{
    local /*0x35EA0000-0x00000000*/ private @NULL SrcActor[8388609];
    local /*0x35EA0000-0x00000000*/ private int Idx;

    Idx = DebugTextList.Find('SrcActor', SrcActor);    
    // End:0x51
    if(Idx != -1)
    {
        DebugTextList.Remove(Idx, 1);        
    }
    //return;    
}

reliable client final simulated event RemoveAllDebugStrings()
{
    DebugTextList.Length = 0;
    //return;    
}

reliable client simulated function ClientRegisterHostStatGuid()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string StatGuid[8388609];

    // End:0xDB
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.StatsInterface, OnlineStatsInterface(none)))
    {
        OnlineSub.StatsInterface.AddRegisterHostStatGuidCompleteDelegate(OnRegisterHostStatGuidComplete);
        // End:0xDB
        if(OnlineSub.StatsInterface.RegisterHostStatGuid(StatGuid) == false)
        {
            OnRegisterHostStatGuidComplete(false);
        }
    }
    //return;    
}

function OnRegisterHostStatGuidComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string StatGuid;

    OnlineSub.StatsInterface.ClearRegisterHostStatGuidCompleteDelegateDelegate(OnRegisterHostStatGuidComplete);
    // End:0xA5
    if(bWasSuccessful)
    {
        StatGuid = OnlineSub.StatsInterface.GetClientStatGuid();
        ServerRegisterClientStatGuid(StatGuid);
    }
    //return;    
}

reliable server function ServerRegisterClientStatGuid()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string StatGuid[8388609];

    // End:0xA2
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.StatsInterface, OnlineStatsInterface(none)))
    {
        OnlineSub.StatsInterface.RegisterStatGuid(PlayerReplicationInfo.UniqueId, StatGuid);
    }
    //return;    
}

reliable client simulated function ClientStartOnlineGame()
{
    local /*0x35EA0000-0x00000000*/ private @NULL GameSettings;

    // End:0x16A
    if(((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none))) && IsPrimaryPlayer())
    {
        GameSettings = OnlineSub.GameInterface.GetGameSettings(PlayerReplicationInfo.SessionName);
        // End:0x16A
        if((GameSettings != none) && (int(GameSettings.GameState) == int(1)) || int(GameSettings.GameState) == int(5))
        {
            OnlineSub.GameInterface.StartOnlineGame(PlayerReplicationInfo.SessionName);
        }
    }
    //return;    
}

reliable client simulated function ClientEndOnlineGame()
{
    local /*0x35EA0000-0x00000000*/ private @NULL GameSettings;

    // End:0x13F
    if(((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none))) && IsPrimaryPlayer())
    {
        GameSettings = OnlineSub.GameInterface.GetGameSettings(PlayerReplicationInfo.SessionName);
        // End:0x13F
        if((GameSettings != none) && int(GameSettings.GameState) == int(3))
        {
            OnlineSub.GameInterface.EndOnlineGame(PlayerReplicationInfo.SessionName);
        }
    }
    //return;    
}

function CanViewUserCreatedContent()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL LocPlayer;

    LocPlayer = LocalPlayer(Player);
    // End:0xD1
    if(((LocPlayer != none) && OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        return int(OnlineSub.PlayerInterface.CanDownloadUserContent(byte(LocPlayer.ControllerId))) == int(2);
    }
    return true;
    //return ReturnValue;    
}

function IncrementNumberOfMatchesPlayed()
{
    PlayerReplicationInfo.AutomatedTestingData.NumberOfMatchesPlayed++;
    //return;    
}

event SoakPause()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];

    SetViewTarget(P);
    SetPause(true);
    myHUD.bShowDebugInfo = true;
    //return;    
}

exec function PathStep()
{
    local /*0x35EA0000-0x00000000*/ private int Cnt[9437185];

    Pawn.IncrementPathStep(Max(1, Cnt), myHUD.Canvas);
    //return;    
}

exec function PathChild()
{
    local /*0x35EA0000-0x00000000*/ private int Cnt[9437185];

    Pawn.IncrementPathChild(Max(1, Cnt), myHUD.Canvas);
    //return;    
}

exec function PathClear()
{
    Pawn.ClearPathStep();
    //return;    
}

reliable client simulated function ClientTravelToSession()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private class SearchClass[8388609];
    local /*0x35EA0000-0x00000000*/ private byte PlatformSpecificInfo[8388748];
    local /*0x35EA0000-0x00000000*/ private bool bIsPartySession[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Search, LP, SessionToJoin;

    LP = LocalPlayer(Player);
    // End:0x1B3
    if(LP != none)
    {
        Search = new SearchClass;
        // End:0x1B3
        if(OnlineSub.GameInterface.BindPlatformSpecificSessionToSearch(byte(LP.ControllerId), Search, PlatformSpecificInfo))
        {
            SessionToJoin = Search.Results[0];
            PreJoinUpdateGameSettings(SessionName, SessionToJoin.GameSettings);
            OnlineSub.GameInterface.AddJoinOnlineGameCompleteDelegate(OnJoinTravelToSessionComplete);
            OnlineSub.GameInterface.JoinOnlineGame(byte(LP.ControllerId), SessionName, SessionToJoin);
        }
    }
    //return;    
}

simulated function PreJoinUpdateGameSettings()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL GameSettings[8388609];

    //return;    
}

function OnJoinTravelToSessionComplete()
{
    local /*0x35EA0000-0x00000000*/ private name SessionName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL;

    // End:0x6E
    if(bWasSuccessful)
    {
        // End:0x6E
        if(OnlineSub.GameInterface.GetResolvedConnectString(SessionName, URL))
        {
            ClientTravel(URL, 0);
        }
    }
    //return;    
}

reliable client simulated function ClientReturnToParty()
{
    local /*0x35EA0000-0x00000000*/ private @NULL RequestingPlayerId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL;

    WorldInfo.ToggleHostMigration(false);
    // End:0x204
    if(IsPrimaryPlayer())
    {
        // End:0x1E4
        if(((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none))) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
        {
            // End:0x1C1
            if(OnlineSub.GameInterface.GetGameSettings('Party') != none)
            {
                // End:0x15D
                if(IsPartyLeader())
                {
                    URL = (((GetPartyMapName()) $ "?game=") $ (GetPartyGameTypeName())) $ "?listen";
                    WorldInfo.ServerTravel(URL, true, true);                    
                }
                else
                {
                    // End:0x1BE
                    if(OnlineSub.GameInterface.GetResolvedConnectString('Party', URL))
                    {
                        ClientTravel(URL, 0);
                    }
                }                
            }
            else
            {                
                ConsoleCommand("disconnect");
            }            
        }
        else
        {            
            ConsoleCommand("disconnect");
        }
    }
    //return;    
}

reliable client simulated function ClientNotifyPartyHostLeaving()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PartyHostPlayerId[8388609];

    // End:0x45
    if((PlayerReplicationInfo != none) && NotEqual_UniqueNetIdUniqueNetId(PlayerReplicationInfo.UniqueId, PartyHostPlayerId))
    {
    }
    //return;    
}

reliable server function ServerNotifyPartyHostLeaving()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PartyHostPlayerId[8388609];

    // End:0x61
    if(WorldInfo.Game != none)
    {
        WorldInfo.Game.TellClientsPartyHostIsLeaving(PartyHostPlayerId);
    }
    //return;    
}

final simulated function IsPrimaryPlayer()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int SSIndex;

    return !IsSplitscreenPlayer(SSIndex) || SSIndex == 0;
    //return ReturnValue;    
}

final simulated function IsSplitscreenPlayer()
{
    local /*0x35EA0000-0x00000000*/ private int out_SplitscreenPlayerIndex[26214401];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689], bResult;
    local /*0x35EA0000-0x00000000*/ private @NULL LP, RemoteConnection, ChildRemoteConnection;

    out_SplitscreenPlayerIndex = int(NetPlayerIndex);
    // End:0x1E6
    if(Player != none)
    {
        LP = LocalPlayer(Player);
        // End:0xE3
        if(LP != none)
        {
            // End:0xE0
            if(LP.Outer.GamePlayers.Length > 1)
            {
                out_SplitscreenPlayerIndex = LP.Outer.GamePlayers.Find(LP);                
                bResult = true;
            }            
        }
        else
        {
            RemoteConnection = NetConnection(Player);
            // End:0x13E
            if(RemoteConnection.Children.Length > 0)
            {
                out_SplitscreenPlayerIndex = 0;
                bResult = true;                
            }
            else
            {
                ChildRemoteConnection = ChildConnection(RemoteConnection);
                // End:0x1E6
                if(ChildRemoteConnection != none)
                {
                    // End:0x1DA
                    if(ChildRemoteConnection.Parent != none)
                    {
                        out_SplitscreenPlayerIndex = ChildRemoteConnection.Parent.Children.Find(ChildRemoteConnection) + ;                        
                    }
                    bResult = true;
                }
            }
        }
    }
    return bResult;
    //return ReturnValue;    
}

simulated function GetSplitscreenPlayerByIndex()
{
    local /*0x35EA0000-0x00000000*/ private int PlayerIndex[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], Result, LP, SplitPlayer, MasterConnection, RemoteConnection,
	    ChildRemoteConnection;

    1
    // End:0x413
    if(Player != none)
    {
        // End:0x410
        if(IsSplitscreenPlayer())
        {
            LP = LocalPlayer(Player);
            RemoteConnection = NetConnection(Player);
            // End:0x170
            if(LP != none)
            {
                // End:0x16D
                if((PlayerIndex >= 0) && PlayerIndex < LP.ViewportClient.Outer.GamePlayers.Length)
                {
                    SplitPlayer = LP.ViewportClient.Outer.GamePlayers[PlayerIndex];
                    Result = SplitPlayer.Actor.PlayerReplicationInfo;                    
                }                
            }
            else
            {
                // End:0x410
                if(RemoteConnection != none)
                {
                    // End:0x1AB
                    if(int(WorldInfo.NetMode) == int(NM_Client))
                    {                        
                    }
                    else
                    {
                        ChildRemoteConnection = ChildConnection(RemoteConnection);
                        // End:0x308
                        if(ChildRemoteConnection != none)
                        {
                            MasterConnection = ChildRemoteConnection.Parent;
                            // End:0x24D
                            if(PlayerIndex == 0)
                            {
                                Result = MasterConnection.Actor.PlayerReplicationInfo;                                
                            }
                            else
                            {
                                PlayerIndex--;
                                // End:0x305
                                if((PlayerIndex >= 0) && PlayerIndex < MasterConnection.Children.Length)
                                {
                                    ChildRemoteConnection = MasterConnection.Children[PlayerIndex];
                                    Result = ChildRemoteConnection.Actor.PlayerReplicationInfo;
                                }
                            }                            
                        }
                        else
                        {
                            // End:0x40D
                            if(RemoteConnection.Children.Length > 0)
                            {
                                // End:0x352
                                if(PlayerIndex == 0)
                                {
                                    Result = PlayerReplicationInfo;                                    
                                }
                                else
                                {
                                    PlayerIndex--;
                                    // End:0x40A
                                    if((PlayerIndex >= 0) && PlayerIndex < RemoteConnection.Children.Length)
                                    {
                                        ChildRemoteConnection = RemoteConnection.Children[PlayerIndex];
                                        Result = ChildRemoteConnection.Actor.PlayerReplicationInfo;
                                    }
                                }                                
                            }
                        }
                    }                    
                }
            }
        }        
    }
    return Result;
    //return ReturnValue;    
}

simulated function GetSplitscreenPlayerCount()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL LP, RemoteConnection;
    local /*0x35EA0000-0x00000000*/ private int Result;

    // End:0x144
    if(IsSplitscreenPlayer())
    {
        // End:0x144
        if(Player != none)
        {
            LP = LocalPlayer(Player);
            RemoteConnection = NetConnection(Player);
            // End:0xBA
            if(LP != none)
            {
                Result = LP.ViewportClient.Outer.GamePlayers.Length;                
            }
            else
            {
                // End:0x141
                if(RemoteConnection != none)
                {
                    // End:0x112
                    if(ChildConnection(RemoteConnection) != none)
                    {
                        RemoteConnection = ChildConnection(RemoteConnection).Parent;
                    }
                    Result = RemoteConnection.Children.Length + 1;                    
                }
            }            
        }
    }
    return Result;
    //return ReturnValue;    
}

reliable client simulated function ClientControlMovieTexture()
{
    local /*0x35EA0000-0x00000000*/ private @NULL MovieTexture[8388609];
    local /*0x35EA0000-0x00000000*/ private byte Mode[8388609];

    // End:0x9D
    if(MovieTexture != none)
    {
        switch(Mode)
        {
            // End:0x49
            case 0:
                MovieTexture.Play();
                // End:0x9D
                break;
            // End:0x70
            case 1:
                MovieTexture.Stop();
                // End:0x9D
                break;
            // End:0x97
            case 2:
                MovieTexture.Pause();
                // End:0x9D
                break;
            // End:0xFFFF
            default:
                // End:0x9D
                break;
                break;
        }
    }
    //return;    
}

reliable client simulated event ClientSetForceMipLevelsToBeResident()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Material[8388609];
    local /*0x35EA0000-0x00000000*/ private float ForceDuration[8388609];
    local /*0x35EA0000-0x00000000*/ private int CinematicTextureGroups[9437185];

    // End:0x52
    if((Material != none) && IsPrimaryPlayer())
    {
        Material.SetForceMipLevelsToBeResident(false, false, ForceDuration, CinematicTextureGroups);
    }
    //return;    
}

reliable client simulated event ClientPrestreamTextures()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ForcedActor[8388609];
    local /*0x35EA0000-0x00000000*/ private float ForceDuration[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bEnableStreaming[8388609];
    local /*0x35EA0000-0x00000000*/ private int CinematicTextureGroups[9437185];

    0
    // End:0x5E
    if((ForcedActor != none) && IsPrimaryPlayer())
    {
        ForcedActor.PrestreamTextures(ForceDuration, bEnableStreaming, CinematicTextureGroups);
    }
    //return;    
}

// Export UPlayerController::execClientAddTextureStreamingLoc(FFrame&, void* const)
reliable client native final simulated event ClientAddTextureStreamingLoc()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InLoc[8388609];
    local /*0x35EA0000-0x00000000*/ private float Duration[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bOverrideLocation[8388609];


}

simulated function IsPartyLeader()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL PartySettings;

    // End:0xF3
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none)))
    {
        PartySettings = OnlineSub.GameInterface.GetGameSettings('Party');
        // End:0xF3
        if(PartySettings != none)
        {
            // End:0xF3
            if(PlayerReplicationInfo != none)
            {
                return EqualEqual_UniqueNetIdUniqueNetId(PartySettings.OwningPlayerId, PlayerReplicationInfo.UniqueId);
            }
        }
    }
    return (int(WorldInfo.NetMode) != int(NM_Client)) && IsPrimaryPlayer();
    //return ReturnValue;    
}

static function GetPartyMapName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    //return ReturnValue;    
}

static function GetPartyGameTypeName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    //return ReturnValue;    
}

event GetAchievementProgression()
{
    local /*0x35EA0000-0x00000000*/ private int AchievementId[8388609];
    local /*0x35EA0000-0x00000000*/ private float CurrentValue[25165825], MaxValue;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

simulated function OnFlyThroughHasEnded()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609], PC;

    // End:0x9C
    if(WorldInfo.Game.IsDoingASentinelRun())
    {
        // End:0x9B
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {            
            PC.ConsoleCommand("quit");            
        }        
    }
    //return;    
}

function Sentinel_SetupForGamebasedTravelTheWorld()
{
    //return;    
}

function Sentinel_PreAcquireTravelTheWorldPoints()
{
    //return;    
}

function Sentinel_PostAcquireTravelTheWorldPoints()
{
    //return;    
}

delegate InputMatchDelegate()
{
    //return;    
}

protected simulated function DoForceFeedbackForScreenShake()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ShakeData[8388609];
    local /*0x35EA0000-0x00000000*/ private float ShakeScale[8388609];

    //return;    
}

unreliable client simulated function ClientPlayCameraShake()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Shake[8388609];
    local /*0x35EA0000-0x00000000*/ private float Scale[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bTryForceFeedback[9437185];
    local /*0x35EA0000-0x00000000*/ private byte PlaySpace[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL UserPlaySpaceRot[9437185];

    1.0000000    
    0    
    // End:0x8C
    if(PlayerCamera != none)
    {
        PlayerCamera.PlayCameraShake(Shake, Scale, PlaySpace, UserPlaySpaceRot);
        // End:0x8C
        if(bTryForceFeedback)
        {
            DoForceFeedbackForScreenShake(Shake, Scale);
        }
    }
    //return;    
}

unreliable client simulated function ClientStopCameraShake()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Shake[8388609];

    // End:0x37
    if(PlayerCamera != none)
    {
        PlayerCamera.StopCameraShake(Shake);
    }
    //return;    
}

function OnCameraShake()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x297
    if(inAction.InputLinks[0].bHasImpulse)
    {
        // End:0x1AB
        if(inAction.bRadialShake)
        {
            // End:0x1A6
            if(inAction.LocationActor != none)
            {
                Class'Camera'.static.PlayWorldCameraShake(inAction.Shake, inAction.LocationActor, inAction.LocationActor.Location, inAction.RadialShake_InnerRadius, inAction.RadialShake_OuterRadius, inAction.RadialShake_Falloff, inAction.bDoControllerVibration, inAction.bOrientTowardRadialEpicenter);                
            }
            else
            {
                return;
            }            
        }
        else
        {
            ClientPlayCameraShake(inAction.Shake, inAction.ShakeScale, inAction.bDoControllerVibration, inAction.PlaySpace, ((inAction.LocationActor == none) ? rot(0, 0, 0) : inAction.LocationActor.Rotation));
        }        
    }
    else
    {
        ClientStopCameraShake(inAction.Shake);
    }
    //return;    
}

unreliable client simulated event ClientPlayCameraAnim()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimToPlay[8388609];
    local /*0x35EA0000-0x00000000*/ private float Scale[9437185], Rate, BlendInTime, BlendOutTime;
    local /*0x35EA0000-0x00000000*/ private bool bLoop[9437185], bRandomStartTime;
    local /*0x35EA0000-0x00000000*/ private byte Space[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL CustomPlaySpace[9437185], AnimInst;

    1.0000000
    1.0000000                
    0    
    // End:0xEE
    if(PlayerCamera != none)
    {
        AnimInst = PlayerCamera.PlayCameraAnim(AnimToPlay, Rate, Scale, BlendInTime, BlendOutTime, bLoop, bRandomStartTime);
        // End:0xEE
        if((AnimInst != none) && int(Space) != int(0))
        {
            AnimInst.SetPlaySpace(Space, CustomPlaySpace);
        }
    }
    //return;    
}

reliable client simulated event ClientStopCameraAnim()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimToStop[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bImmediate[9437185];

    // End:0x42
    if(PlayerCamera != none)
    {
        PlayerCamera.StopAllCameraAnimsByType(AnimToStop, bImmediate);
    }
    //return;    
}

exec function DebugCameraAnims()
{
    bDebugCameraAnims = !bDebugCameraAnims;
    // End:0x46
    if(bDebugCameraAnims == false)
    {
        WorldInfo.FlushPersistentDebugLines();
    }
    //return;    
}

unreliable client simulated event ClientSpawnCameraLensEffect()
{
    local /*0x35EA0000-0x00000000*/ private class LensEffectEmitterClass[8388609];

    // End:0x37
    if(PlayerCamera != none)
    {
        PlayerCamera.AddCameraLensEffect(LensEffectEmitterClass);
    }
    //return;    
}

function OnSetSoundMode()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609], Audio;

    Audio = Class'Engine'.static.GetAudioDevice();
    // End:0x112
    if(Audio != none)
    {
        // End:0xEA
        if(Action.InputLinks[0].bHasImpulse && Action.SoundMode != none)
        {
            Audio.SetSoundMode(Action.SoundMode.Name);            
        }
        else
        {
            Audio.SetSoundMode('Default');
        }
    }
    //return;    
}

// Export UPlayerController::execHasPeerConnection(FFrame&, void* const)
native function HasPeerConnection()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PeerNetId[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

exec function BugItGo()
{
    local /*0x35EA0000-0x00000000*/ private float X[142606337], Y, Z;
    local /*0x35EA0000-0x00000000*/ private int Pitch[142606337], Yaw, Roll;
    local /*0x35EA0000-0x00000000*/ private @NULL TheLocation, TheRotation;

    TheLocation.X = X;
    TheLocation.Y = Y;
    TheLocation.Z = Z;
    TheRotation.Pitch = Pitch;
    TheRotation.Yaw = Yaw;
    TheRotation.Roll = Roll;
    BugItWorker(TheLocation, TheRotation);
    //return;    
}

function BugItGoString()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string TheLocation[8388609], TheRotation;

    BugItWorker(Vector(TheLocation), Rotator(TheRotation));
    //return;    
}

function BugItWorker()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TheLocation[8388609], TheRotation;

    // End:0x2E
    if(CheatManager != none)
    {
        CheatManager.Ghost();
    }
    ViewTarget.SetLocation(TheLocation);
    Pawn.FaceRotation(TheRotation, 0.0000000);
    SetRotation(TheRotation);
    //return;    
}

exec event BugIt()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ScreenShotDescription[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bNoScreenShot[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ViewLocation, ViewRotation;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string GoString, LocString;

    false
    // End:0x44
    if(!bNoScreenShot)
    {        
        ConsoleCommand("bugscreenshot " $ ScreenShotDescription);
    }
    GetPlayerViewPoint(ViewLocation, ViewRotation);
    // End:0x97
    if(Pawn != none)
    {
        ViewLocation = Pawn.Location;
    }
    BugItStringCreator(ViewLocation, ViewRotation, GoString, LocString);
    LogOutBugItGoToLogFile(ScreenShotDescription, GoString, LocString);
    //return;    
}

exec function LogLoc()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ViewLocation, ViewRotation;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string GoString, LocString;

    GetPlayerViewPoint(ViewLocation, ViewRotation);
    // End:0x53
    if(Pawn != none)
    {
        ViewLocation = Pawn.Location;
    }
    BugItStringCreator(ViewLocation, ViewRotation, GoString, LocString);
    //return;    
}

exec event BugItAI()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ScreenShotDescription[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ViewLocation, ViewRotation;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string GoString, LocString;

    GetPlayerViewPoint(ViewLocation, ViewRotation);
    // End:0x54
    if(Pawn != none)
    {
        ViewLocation = Pawn.Location;
    }
    BugItStringCreator(ViewLocation, ViewRotation, GoString, LocString);    
    ConsoleCommand("debugai");
    SetTimer(0.1000000, false, 'DisableDebugAI');
    LogOutBugItAIGoToLogFile(ScreenShotDescription, GoString, LocString);
    //return;    
}

exec event BugItStringCreator()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ViewLocation[25296897], ViewRotation;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string GoString[25165825], LocString;

    GoString = (((((((((("BugItGo " $ string(ViewLocation.X)) $ " ") $ string(ViewLocation.Y)) $ " ") $ string(ViewLocation.Z)) $ " ") $ string(ViewRotation.Pitch)) $ " ") $ string(ViewRotation.Yaw)) $ " ") $ string(ViewRotation.Roll);
    LocString = (("?BugLoc=" $ string(ViewLocation)) $ "?BugRot=") $ string(ViewRotation);
    //return;    
}

event OnEngineInitialTick()
{
    // End:0x4C
    if(WorldInfo.IsConsoleBuild(3))
    {        
        ConsoleCommand("mobile stoploading");
    }
    //return;    
}

function DisableDebugAI()
{
    ConsoleCommand("debugai");
    //return;    
}

// Export UPlayerController::execLogOutBugItGoToLogFile(FFrame&, void* const)
private native final function LogOutBugItGoToLogFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InScreenShotDesc[8519681], InGoString, InLocString;


}

// Export UPlayerController::execLogOutBugItAIGoToLogFile(FFrame&, void* const)
private native final function LogOutBugItAIGoToLogFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InScreenShotDesc[8519681], InGoString, InLocString;


}

simulated function ReceivedGameClass()
{
    local /*0x35EA0000-0x00000000*/ private class GameClass[8388609];

    // End:0x2E
    if(PlayerInput != none)
    {
        PlayerInput.ClientInitInputSystem();
    }
    //return;    
}

event NotifyDisconnect()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Command[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

event SetMatineeConstantCameraAnim()
{
    local /*0x35EA0000-0x00000000*/ private bool bOn[8388609];
    local /*0x35EA0000-0x00000000*/ private byte Type[8388609];
    local /*0x35EA0000-0x00000000*/ private float Rate[8388609];

    //return;    
}

state PlayerWalking
{
    ignores SeePlayer, HearNoise, Bump;

    event NotifyPhysicsVolumeChange()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL NewVolume[8388609];

        // End:0x69
        if(NewVolume.bWaterVolume && Pawn.bCollideWorld)
        {
            GotoState(Pawn.WaterMovementState);
        }
        //return;        
    }

    function ProcessMove()
    {
        local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL newAccel[8388609];
        local /*0x35EA0000-0x00000000*/ private byte DoubleClickMove[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL DeltaRot[8388609];

        // End:0x11
        if(Pawn == none)
        {
            return;
        }
        // End:0x60
        if(int(Role) == int(ROLE_Authority))
        {
            Pawn.SetRemoteViewPitch(Rotation.Pitch);
        }
        Pawn.Acceleration = newAccel;
        CheckJumpOrDuck();
        //return;        
    }

    function PlayerMove()
    {
        local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL X, Y, Z, newAccel;
        local /*0x35EA0000-0x00000000*/ private byte DoubleClickMove;
        local /*0x35EA0000-0x00000000*/ private @NULL OldRotation;
        local /*0x35EA0000-0x00000000*/ private bool bSaveJump;

        // End:0x20
        if(Pawn == none)
        {
            GotoState('Dead');            
        }
        else
        {
            GetAxes(Pawn.Rotation, X, Y, Z);
            newAccel = (PlayerInput.aForward * X) + (PlayerInput.aStrafe * Y);
            newAccel.Z = 0.0000000;
            newAccel = Pawn.AccelRate * Normal(newAccel);
            // End:0x130
            if(IsLocalPlayerController())
            {
                AdjustPlayerWalkingMoveAccel(newAccel);
            }
            DoubleClickMove = PlayerInput.CheckForDoubleClickMove(DeltaTime / WorldInfo.TimeDilation);
            OldRotation = Rotation;
            UpdateRotation(DeltaTime);
            bDoubleJump = false;
            // End:0x200
            if(bPressedJump && Pawn.CannotJumpNow())
            {
                bSaveJump = true;
                bPressedJump = false;                
            }
            else
            {
                bSaveJump = false;
            }
            // End:0x25D
            if(int(Role) < int(ROLE_Authority))
            {
                ReplicateMove(DeltaTime, newAccel, DoubleClickMove, OldRotation - Rotation);                
            }
            else
            {
                ProcessMove(DeltaTime, newAccel, DoubleClickMove, OldRotation - Rotation);
            }
            bPressedJump = bSaveJump;
        }
        //return;        
    }

    event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        DoubleClickDir = 0;
        bPressedJump = false;
        GroundPitch = 0;
        // End:0xDC
        if(Pawn != none)
        {
            Pawn.ShouldCrouch(false);
            // End:0xDC
            if((int(Pawn.Physics) != int(2)) && int(Pawn.Physics) != int(10))
            {
                Pawn.SetPhysics(Pawn.WalkingPhysics);
            }
        }
        //return;        
    }

    event EndState()
    {
        local /*0x35EA0000-0x00000000*/ private name NextStateName[8388609];

        GroundPitch = 0;
        // End:0x6E
        if(Pawn != none)
        {
            Pawn.SetRemoteViewPitch(0);
            // End:0x6E
            if(int(bDuck) == int(0))
            {
                Pawn.ShouldCrouch(false);
            }
        }
        //return;        
    }
Begin:

    stop;                
}

state PlayerClimbing
{
    ignores SeePlayer, HearNoise, Bump;

    event NotifyPhysicsVolumeChange()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL NewVolume[8388609];

        // End:0x48
        if(NewVolume.bWaterVolume)
        {
            GotoState(Pawn.WaterMovementState);            
        }
        else
        {
            GotoState(Pawn.LandMovementState);
        }
        //return;        
    }

    function ProcessMove()
    {
        local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL newAccel[8388609];
        local /*0x35EA0000-0x00000000*/ private byte DoubleClickMove[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL DeltaRot[8388609];

        // End:0x11
        if(Pawn == none)
        {
            return;
        }
        // End:0x60
        if(int(Role) == int(ROLE_Authority))
        {
            Pawn.SetRemoteViewPitch(Rotation.Pitch);
        }
        Pawn.Acceleration = newAccel;
        // End:0x10A
        if(bPressedJump)
        {
            Pawn.DoJump(bUpdating);
            // End:0x10A
            if(int(Pawn.Physics) == int(2))
            {
                GotoState(Pawn.LandMovementState);
            }
        }
        //return;        
    }

    function PlayerMove()
    {
        local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL X, Y, Z, newAccel, OldRotation, ViewRotation;

        GetAxes(Rotation, X, Y, Z);
        // End:0x115
        if(Pawn.OnLadder != none)
        {
            newAccel = PlayerInput.aForward * Pawn.OnLadder.ClimbDir;
            // End:0x112
            if(Pawn.OnLadder.bAllowLadderStrafing)
            {
                newAccel += (PlayerInput.aStrafe * Y);
            }            
        }
        else
        {
            newAccel = (PlayerInput.aForward * X) + (PlayerInput.aStrafe * Y);
        }
        newAccel = Pawn.AccelRate * Normal(newAccel);
        ViewRotation = Rotation;
        SetRotation(ViewRotation);
        OldRotation = Rotation;
        UpdateRotation(DeltaTime);
        // End:0x23E
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, newAccel, 0, OldRotation - Rotation);            
        }
        else
        {
            ProcessMove(DeltaTime, newAccel, 0, OldRotation - Rotation);
        }
        bPressedJump = false;
        //return;        
    }

    event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        Pawn.ShouldCrouch(false);
        bPressedJump = false;
        //return;        
    }

    event EndState()
    {
        local /*0x35EA0000-0x00000000*/ private name NextStateName[8388609];

        // End:0x4F
        if(Pawn != none)
        {
            Pawn.SetRemoteViewPitch(0);
            Pawn.ShouldCrouch(false);
        }
        //return;        
    }
    stop;    
}

state PlayerDriving
{
    ignores SeePlayer, HearNoise, Bump, ProcessMove;

    function ProcessDrive()
    {
        local /*0x35EA0000-0x00000000*/ private float InForward[8388609], InStrafe, InUp;
        local /*0x35EA0000-0x00000000*/ private bool InJump[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL CurrentVehicle;

        CurrentVehicle = Vehicle(Pawn);
        // End:0x86
        if(CurrentVehicle != none)
        {
            bPressedJump = InJump;
            CurrentVehicle.SetInputs(InForward, -InStrafe, InUp);
            CheckJumpOrDuck();
        }
        //return;        
    }

    function PlayerMove()
    {
        local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];

        UpdateRotation(DeltaTime);
        ProcessDrive(PlayerInput.RawJoyUp, PlayerInput.RawJoyRight, PlayerInput.aUp, bPressedJump);
        // End:0x14F
        if(int(Role) < int(ROLE_Authority))
        {
            ServerDrive(PlayerInput.RawJoyUp, PlayerInput.RawJoyRight, PlayerInput.aUp, bPressedJump, ((Rotation.Yaw & 65535) << 16) + (Rotation.Pitch & 65535));
        }
        bPressedJump = false;
        //return;        
    }

    unreliable server function ServerUse()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL CurrentVehicle;

        CurrentVehicle = Vehicle(Pawn);
        CurrentVehicle.DriverLeave(false);
        //return;        
    }

    event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        CleanOutSavedMoves();
        //return;        
    }

    event EndState()
    {
        local /*0x35EA0000-0x00000000*/ private name NextStateName[8388609];

        CleanOutSavedMoves();
        //return;        
    }
    stop;    
}

state PlayerSwimming
{
    ignores SeePlayer, HearNoise, Bump;

    event NotifyLanded()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL HitNormal[8388609], FloorActor;
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x54
        if(Pawn.PhysicsVolume.bWaterVolume)
        {
            Pawn.SetPhysics(3);            
        }
        else
        {
            GotoState(Pawn.LandMovementState);
        }
        return bUpdating;
        //return ReturnValue;        
    }

    event NotifyPhysicsVolumeChange()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL NewVolume[8388609], HitActor, HitLocation, HitNormal, Checkpoint, X,
	        Y, Z;

        // End:0x47
        if(!Pawn.bCollideActors)
        {
            GotoState(Pawn.LandMovementState);
        }
        // End:0x43F
        if(int(Pawn.Physics) != int(10))
        {
            // End:0x416
            if(!NewVolume.bWaterVolume)
            {
                Pawn.SetPhysics(2);
                // End:0x413
                if(Pawn.Velocity.Z > float(0))
                {
                    GetAxes(Rotation, X, Y, Z);
                    Pawn.bUpAndOut = ((X Dot Pawn.Acceleration) > float(0)) && (Pawn.Acceleration.Z > float(0)) || Rotation.Pitch > 2048;
                    // End:0x283
                    if(Pawn.bUpAndOut && Pawn.CheckWaterJump(HitNormal))
                    {
                        Pawn.Velocity.Z = Pawn.OutofWaterZ;
                        GotoState(Pawn.LandMovementState);                        
                    }
                    else
                    {
                        // End:0x309
                        if((Pawn.Velocity.Z > float(160)) || !Pawn.TouchingWaterVolume())
                        {
                            GotoState(Pawn.LandMovementState);                            
                        }
                        else
                        {
                            Checkpoint = Pawn.Location;
                            Checkpoint.Z -= (Pawn.CylinderComponent.CollisionHeight + 6.0000000);
                            HitActor = Trace(HitLocation, HitNormal, Checkpoint, Pawn.Location, false);
                            // End:0x408
                            if(HitActor != none)
                            {
                                GotoState(Pawn.LandMovementState);                                
                            }
                            else
                            {
                                SetTimer(0.7000000, false);
                            }
                        }
                    }
                }                
            }
            else
            {
                ClearTimer();
                Pawn.SetPhysics(3);
            }            
        }
        else
        {
            // End:0x486
            if(!NewVolume.bWaterVolume)
            {
                GotoState(Pawn.LandMovementState);
            }
        }
        //return;        
    }

    function ProcessMove()
    {
        local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL newAccel[8388609];
        local /*0x35EA0000-0x00000000*/ private byte DoubleClickMove[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL DeltaRot[8388609];

        Pawn.Acceleration = newAccel;
        //return;        
    }

    function PlayerMove()
    {
        local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL OldRotation, X, Y, Z, newAccel;

        // End:0x20
        if(Pawn == none)
        {
            GotoState('Dead');            
        }
        else
        {
            GetAxes(Rotation, X, Y, Z);
            newAccel = ((PlayerInput.aForward * X) + (PlayerInput.aStrafe * Y)) + (PlayerInput.aUp * vect(0.0000000, 0.0000000, 1.0000000));
            newAccel = Pawn.AccelRate * Normal(newAccel);
            OldRotation = Rotation;
            UpdateRotation(DeltaTime);
            // End:0x178
            if(int(Role) < int(ROLE_Authority))
            {
                ReplicateMove(DeltaTime, newAccel, 0, OldRotation - Rotation);                
            }
            else
            {
                ProcessMove(DeltaTime, newAccel, 0, OldRotation - Rotation);
            }
            bPressedJump = false;
        }
        //return;        
    }

    event Timer()
    {
        // End:0x72
        if(!Pawn.PhysicsVolume.bWaterVolume && int(Role) == int(ROLE_Authority))
        {
            GotoState(Pawn.LandMovementState);
        }
        ClearTimer();
        //return;        
    }

    event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        ClearTimer();
        // End:0x4F
        if(int(Pawn.Physics) != int(10))
        {
            Pawn.SetPhysics(3);
        }
        //return;        
    }
Begin:

    stop;                
}

state PlayerFlying
{
    ignores SeePlayer, HearNoise, Bump;

    function PlayerMove()
    {
        local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL X, Y, Z;

        GetAxes(Rotation, X, Y, Z);
        Pawn.Acceleration = ((PlayerInput.aForward * X) + (PlayerInput.aStrafe * Y)) + (PlayerInput.aUp * vect(0.0000000, 0.0000000, 1.0000000));
        Pawn.Acceleration = Pawn.AccelRate * Normal(Pawn.Acceleration);
        // End:0x192
        if(bCheatFlying && Pawn.Acceleration == vect(0.0000000, 0.0000000, 0.0000000))
        {
            Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        }
        UpdateRotation(DeltaTime);
        // End:0x1FC
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }

    event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        Pawn.SetPhysics(4);
        //return;        
    }
    stop;    
}

state BaseSpectating
{
    function IsSpectating()
    {
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function LimitSpectatorVelocity()
    {
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0xAF
        if(Location.Z > WorldInfo.StallZ)
        {
            Velocity.Z = FMin(SpectatorCameraSpeed, (WorldInfo.StallZ - Location.Z) - 2.0000000);
            return true;            
        }
        else
        {
            // End:0x15B
            if(Location.Z < WorldInfo.KillZ)
            {
                Velocity.Z = FMin(SpectatorCameraSpeed, (WorldInfo.KillZ - Location.Z) + 2.0000000);
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }

    function ProcessMove()
    {
        local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL newAccel[8388609];
        local /*0x35EA0000-0x00000000*/ private byte DoubleClickMove[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL DeltaRot[8388609];
        local /*0x35EA0000-0x00000000*/ private float VelSize;

        Acceleration = Normal(newAccel) * SpectatorCameraSpeed;
        VelSize = VSize(Velocity);
        // End:0x94
        if(VelSize > float(0))
        {
            Velocity = Velocity - ((Velocity - (Normal(Acceleration) * VelSize)) * FMin(DeltaTime * float(8), 1.0000000));
        }
        Velocity = Velocity + (Acceleration * DeltaTime);
        // End:0xF6
        if(VSize(Velocity) > SpectatorCameraSpeed)
        {
            Velocity = Normal(Velocity) * SpectatorCameraSpeed;
        }
        LimitSpectatorVelocity();
        // End:0x182
        if(VSize(Velocity) > float(0))
        {
            MoveSmooth((float(1 + int(bRun)) * Velocity) * DeltaTime);
            // End:0x182
            if(LimitSpectatorVelocity())
            {
                MoveSmooth((Velocity.Z * vect(0.0000000, 0.0000000, 1.0000000)) * DeltaTime);
            }
        }
        //return;        
    }

    function PlayerMove()
    {
        local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL X, Y, Z;

        GetAxes(Rotation, X, Y, Z);
        Acceleration = ((PlayerInput.aForward * X) + (PlayerInput.aStrafe * Y)) + (PlayerInput.aUp * vect(0.0000000, 0.0000000, 1.0000000));
        UpdateRotation(DeltaTime);
        // End:0x108
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }

    unreliable server function ServerSetSpectatorLocation()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL NewLoc[8388609];

        SetLocation(NewLoc);
        // End:0x75
        if((WorldInfo.TimeSeconds - LastSpectatorStateSynchTime) > 2.0000000)
        {
            ClientGotoState(GetStateName());
            LastSpectatorStateSynchTime = WorldInfo.TimeSeconds;
        }
        //return;        
    }

    function ReplicateMove()
    {
        local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL newAccel[8388609];
        local /*0x35EA0000-0x00000000*/ private byte DoubleClickMove[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL DeltaRot[8388609];

        ProcessMove(DeltaTime, newAccel, DoubleClickMove, DeltaRot);
        ServerSetSpectatorLocation(Location);
        // End:0x95
        if((PlayerCamera != none) && PlayerCamera.bUseClientSideCameraUpdates)
        {
            PlayerCamera.bShouldSendClientSideCameraUpdate = true;
        }
        //return;        
    }

    event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        bCollideWorld = true;
        //return;        
    }

    event EndState()
    {
        local /*0x35EA0000-0x00000000*/ private name NextStateName[8388609];

        bCollideWorld = false;
        //return;        
    }
    stop;    
}

state Spectating extends BaseSpectating
{
    ignores RestartLevel, Suicide, ThrowWeapon, NotifyPhysicsVolumeChange, NotifyHeadVolumeChange;

    exec function StartFire()
    {
        local /*0x35EA0000-0x00000000*/ private byte FireModeNum[9437185];

        ServerViewNextPlayer();
        //return;        
    }

    exec function StartAltFire()
    {
        local /*0x35EA0000-0x00000000*/ private byte FireModeNum[9437185];

        ResetCameraMode();
        ServerViewSelf();
        //return;        
    }

    event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0x3A
        if(Pawn != none)
        {
            SetLocation(Pawn.Location);
            UnPossess();
        }
        bCollideWorld = true;
        //return;        
    }

    event EndState()
    {
        local /*0x35EA0000-0x00000000*/ private name NextStateName[8388609];

        // End:0x52
        if(PlayerReplicationInfo != none)
        {
            // End:0x31
            if(PlayerReplicationInfo.bOnlySpectator)
            {
            }
            PlayerReplicationInfo.bIsSpectator = false;
        }
        bCollideWorld = false;
        //return;        
    }
    stop;    
}

auto state PlayerWaiting extends BaseSpectating
{
    ignores SeePlayer, HearNoise, NotifyBump, TakeDamage, PhysicsVolumeChange, NextWeapon, 
	    PrevWeapon, SwitchToBestWeapon, Jump, Suicide, ServerSuicide;

    reliable server function ServerChangeTeam()
    {
        local /*0x35EA0000-0x00000000*/ private int N[8388609];

        WorldInfo.Game.ChangeTeam(self, N, true);
        //return;        
    }

    reliable server function ServerRestartPlayer()
    {
        // End:0x2E
        if(WorldInfo.TimeSeconds < WaitDelay)
        {
            return;
        }
        // End:0x59
        if(int(WorldInfo.NetMode) == int(NM_Client))
        {
            return;
        }
        // End:0xB4
        if(WorldInfo.Game.bWaitingToStartMatch)
        {
            PlayerReplicationInfo.bReadyToPlay = true;            
        }
        else
        {
            WorldInfo.Game.RestartPlayer(self);
        }
        //return;        
    }

    exec function StartFire()
    {
        local /*0x35EA0000-0x00000000*/ private byte FireModeNum[9437185];

        ServerRestartPlayer();
        //return;        
    }

    event EndState()
    {
        local /*0x35EA0000-0x00000000*/ private name NextStateName[8388609];

        // End:0x2F
        if(PlayerReplicationInfo != none)
        {
            PlayerReplicationInfo.SetWaitingPlayer(false);
        }
        bCollideWorld = false;
        //return;        
    }

    simulated event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0x2F
        if(PlayerReplicationInfo != none)
        {
            PlayerReplicationInfo.SetWaitingPlayer(true);
        }
        bCollideWorld = true;
        //return;        
    }
    stop;    
}

state WaitingForPawn extends BaseSpectating
{
    ignores SeePlayer, HearNoise, KilledBy;

    exec function StartFire()
    {
        local /*0x35EA0000-0x00000000*/ private byte FireModeNum[9437185];

        AskForPawn();
        //return;        
    }

    reliable client simulated function ClientGotoState()
    {
        local /*0x35EA0000-0x00000000*/ private name NewState[8388609], NewLabel;

        // End:0x34
        if(NewState == 'RoundEnded')
        {
            global.ClientGotoState(NewState, NewLabel);
        }
        //return;        
    }

    unreliable client simulated function LongClientAdjustPosition()
    {
        local /*0x35EA0000-0x00000000*/ private float TimeStamp[8388609];
        local /*0x35EA0000-0x00000000*/ private name NewState[8388609];
        local /*0x35EA0000-0x00000000*/ private byte newPhysics[8388609];
        local /*0x35EA0000-0x00000000*/ private float NewLocX[8388609], NewLocY, NewLocZ, NewVelX, NewVelY, NewVelZ;

        local /*0x35EA0000-0x00000000*/ private @NULL NewBase[8388609];
        local /*0x35EA0000-0x00000000*/ private float NewFloorX[8388609], NewFloorY, NewFloorZ;

        // End:0x25
        if(NewState == 'RoundEnded')
        {
            GotoState(NewState);
        }
        //return;        
    }

    event PlayerTick()
    {
        local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];

        global.PlayerTick(DeltaTime);
        // End:0x78
        if(Pawn != none)
        {
            Pawn.Controller = self;
            Pawn.BecomeViewTarget(self);
            ClientRestart(Pawn);            
        }
        else
        {
            // End:0xB6
            if(!IsTimerActive() || GetTimerCount() > 1.0000000)
            {
                SetTimer(0.2000000, true);
                AskForPawn();
            }
        }
        //return;        
    }

    function ReplicateMove()
    {
        local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL newAccel[8388609];
        local /*0x35EA0000-0x00000000*/ private byte DoubleClickMove[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL DeltaRot[8388609];

        ProcessMove(DeltaTime, newAccel, DoubleClickMove, DeltaRot);
        //return;        
    }

    event Timer()
    {
        AskForPawn();
        //return;        
    }

    event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        SetTimer(0.2000000, true);
        AskForPawn();
        //return;        
    }

    event EndState()
    {
        local /*0x35EA0000-0x00000000*/ private name NextStateName[8388609];

        ResetCameraMode();
        SetTimer(0.0000000, false);
        //return;        
    }
    stop;    
}

state RoundEnded
{
    ignores SeePlayer, HearNoise, KilledBy, NotifyBump, HitWall, NotifyHeadVolumeChange, 
	    NotifyPhysicsVolumeChange, Falling, TakeDamage, Suicide, ServerRestartPlayer, 
	    ThrowWeapon, Use, LongClientAdjustPosition;

    function IsSpectating()
    {
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    event Possess()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL aPawn[8388609];
        local /*0x35EA0000-0x00000000*/ private bool bVehicleTransition[8388609];

        global.Possess(aPawn, bVehicleTransition);
        // End:0x4B
        if(Pawn != none)
        {
            Pawn.TurnOff();
        }
        //return;        
    }

    reliable server function ServerRestartGame()
    {
        // End:0x6C
        if(WorldInfo.Game.PlayerCanRestartGame(self))
        {
            WorldInfo.Game.ResetLevel();
        }
        //return;        
    }

    exec function StartFire()
    {
        local /*0x35EA0000-0x00000000*/ private byte FireModeNum[9437185];

        // End:0x17
        if(int(Role) < int(ROLE_Authority))
        {
            return;
        }
        // End:0x33
        if(!bFrozen)
        {
            ServerRestartGame();            
        }
        else
        {
            // End:0x4F
            if(!IsTimerActive())
            {
                SetTimer(1.5000000, false);
            }
        }
        //return;        
    }

    function PlayerMove()
    {
        local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL X, Y, Z, DeltaRot, ViewRotation;

        GetAxes(Rotation, X, Y, Z);
        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        SetRotation(ViewRotation);
        ViewShake(DeltaTime);
        // End:0x144
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, vect(0.0000000, 0.0000000, 0.0000000), 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, vect(0.0000000, 0.0000000, 0.0000000), 0, rot(0, 0, 0));
        }
        bPressedJump = false;
        //return;        
    }

    unreliable server function ServerMove()
    {
        local /*0x35EA0000-0x00000000*/ private float TimeStamp[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL InAccel[8388609], ClientLoc;
        local /*0x35EA0000-0x00000000*/ private byte NewFlags[8388609], ClientRoll;
        local /*0x35EA0000-0x00000000*/ private int View[8388609];

        global.ServerMove(TimeStamp, InAccel, ClientLoc, NewFlags, ClientRoll, ((Rotation.Yaw & 65535) << 16) + (Rotation.Pitch & 65535));
        //return;        
    }

    function FindGoodView()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL GoodRotation;

        GoodRotation = Rotation;
        GetViewTarget().FindGoodEndView(self, GoodRotation);
        SetRotation(GoodRotation);
        //return;        
    }

    event Timer()
    {
        bFrozen = false;
        //return;        
    }

    event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL P;

        FOVAngle = DesiredFOV;
        bFire = 0;
        // End:0x57
        if(Pawn != none)
        {
            Pawn.TurnOff();
            StopFiring();
        }
        // End:0x86
        if(myHUD != none)
        {
            myHUD.SetShowScores(true);
        }
        bFrozen = true;
        FindGoodView();
        SetTimer(5.0000000, false);
        // End:0xE0
        foreach DynamicActors(Class'Pawn', P)
        {
            P.TurnOff();            
        }        
        //return;        
    }

    event EndState()
    {
        local /*0x35EA0000-0x00000000*/ private name NextStateName[8388609];

        // End:0x2F
        if(myHUD != none)
        {
            myHUD.SetShowScores(false);
        }
        //return;        
    }
Begin:

    stop;                
}

state Dead
{
    ignores SeePlayer, HearNoise, KilledBy, NextWeapon, PrevWeapon, ThrowWeapon;

    simulated event ReplicatedEvent()
    {
        local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

        // End:0x54
        if(((VarName == 'Pawn') && Pawn != none) && Pawn != AcknowledgedPawn)
        {
            ClientRestart(Pawn);
        }
        global.ReplicatedEvent(VarName);
        //return;        
    }

    function IsDead()
    {
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    reliable server function ServerRestartPlayer()
    {
        // End:0x3C
        if(!WorldInfo.Game.PlayerCanRestart(self))
        {
            return;
        }
        super.ServerRestartPlayer();
        //return;        
    }

    exec function StartFire()
    {
        local /*0x35EA0000-0x00000000*/ private byte FireModeNum[9437185];

        // End:0x49
        if(bFrozen)
        {
            // End:0x47
            if(!IsTimerActive() || GetTimerCount() > MinRespawnDelay)
            {
                bFrozen = false;
            }
            return;
        }
        ServerRestartPlayer();
        //return;        
    }

    exec function Use()
    {
        StartFire(0);
        //return;        
    }

    exec function Jump()
    {
        StartFire(0);
        //return;        
    }

    unreliable server function ServerMove()
    {
        local /*0x35EA0000-0x00000000*/ private float TimeStamp[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL Accel[8388609], ClientLoc;
        local /*0x35EA0000-0x00000000*/ private byte NewFlags[8388609], ClientRoll;
        local /*0x35EA0000-0x00000000*/ private int View[8388609];

        global.ServerMove(TimeStamp, Accel, ClientLoc, 0, ClientRoll, View);
        //return;        
    }

    function PlayerMove()
    {
        local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL X, Y, Z, DeltaRot, ViewRotation;

        // End:0x165
        if(!bFrozen)
        {
            // End:0x34
            if(bPressedJump)
            {
                StartFire(0);
                bPressedJump = false;
            }
            GetAxes(Rotation, X, Y, Z);
            ViewRotation = Rotation;
            DeltaRot.Yaw = int(PlayerInput.aTurn);
            DeltaRot.Pitch = int(PlayerInput.aLookUp);
            ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
            SetRotation(ViewRotation);
            // End:0x162
            if(int(Role) < int(ROLE_Authority))
            {
                ReplicateMove(DeltaTime, vect(0.0000000, 0.0000000, 0.0000000), 0, rot(0, 0, 0));
            }            
        }
        else
        {
            // End:0x19E
            if(!IsTimerActive() || GetTimerCount() > MinRespawnDelay)
            {
                bFrozen = false;
            }
        }
        ViewShake(DeltaTime);
        //return;        
    }

    function FindGoodView()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL CameraLoc, CameraRot, ViewRotation;
        local /*0x35EA0000-0x00000000*/ private int tries, besttry;
        local /*0x35EA0000-0x00000000*/ private float bestDist, newdist;
        local /*0x35EA0000-0x00000000*/ private int startYaw;
        local /*0x35EA0000-0x00000000*/ private @NULL TheViewTarget;

        ViewRotation = Rotation;
        ViewRotation.Pitch = 56000;
        tries = 0;
        besttry = 0;
        bestDist = 0.0000000;
        startYaw = ViewRotation.Yaw;
        TheViewTarget = GetViewTarget();
        tries = 0;
        J0x9F:

        // End:0x1A9 [Loop If]
        if(tries < 16)
        {
            CameraLoc = TheViewTarget.Location;
            SetRotation(ViewRotation);
            GetPlayerViewPoint(CameraLoc, CameraRot);
            newdist = VSize(CameraLoc - TheViewTarget.Location);
            // End:0x178
            if(newdist > bestDist)
            {
                bestDist = newdist;
                besttry = tries;
            }
            ViewRotation.Yaw += 4096;
            tries++;
            // [Loop Continue]
            goto J0x9F;
        }
        ViewRotation.Yaw = startYaw + (besttry * 4096);
        SetRotation(ViewRotation);
        //return;        
    }

    event Timer()
    {
        // End:0x11
        if(!bFrozen)
        {
            return;
        }
        bFrozen = false;
        bPressedJump = false;
        //return;        
    }

    event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0x55
        if((Pawn != none) && Pawn.Controller == self)
        {
            Pawn.Controller = none;
        }
        Pawn = none;
        FOVAngle = DesiredFOV;
        Enemy = none;
        bFrozen = true;
        bPressedJump = false;
        FindGoodView();
        SetTimer(MinRespawnDelay, false);
        CleanOutSavedMoves();
        //return;        
    }

    event EndState()
    {
        local /*0x35EA0000-0x00000000*/ private name NextStateName[8388609];

        CleanOutSavedMoves();
        Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0x67
        if(!PlayerReplicationInfo.bOutOfLives)
        {
            ResetCameraMode();
        }
        bPressedJump = false;
        // End:0xA2
        if(myHUD != none)
        {
            myHUD.SetShowScores(false);
        }
        //return;        
    }
Begin:

    // End:0x46
    if(LocalPlayer(Player) != none)
    {
        // End:0x46
        if(myHUD != none)
        {
            myHUD.PlayerOwnerDied();
        }
    }
    stop;        
}

defaultproperties
{
    CameraClass=Class'Camera'
    bInteractiveMode=true
    bRenderHUDFullScreen=true
    bShowKismetDrawText=true
    bIsUsingStreamingVolumes=true
    bCheckRelevancyThroughPortals=true
    MaxResponseTime=0.1250000
    FOVAngle=85.0000000
    DesiredFOV=85.0000000
    DefaultFOV=85.0000000
    LODDistanceFactor=1.0000000
    SavedMoveClass=Class'SavedMove'
    LastSpeedHackLog=-100.0000000
    CheatClass=Class'CheatManager'
    InputClass=Class'PlayerInput'
    // Reference: CylinderComponent'Default__PlayerController.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'CylinderComponent'
    end object
    CylinderComponent=CollisionCylinder
    ForceFeedbackManagerClassName="WinDrv.XnaForceFeedbackManager"
    InteractDistance=512.0000000
    SpectatorCameraSpeed=600.0000000
    MinRespawnDelay=1.0000000
    MaxConcurrentHearSounds=32
    bIsPlayer=true
    bCanDoSpecial=true
    Components[0]=CollisionCylinder
    NetPriority=3.0000000
    CollisionComponent=CollisionCylinder
}