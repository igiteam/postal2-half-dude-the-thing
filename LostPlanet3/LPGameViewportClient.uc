class LPGameViewportClient extends SPGameViewportClient within Engine
    transient
    config(Engine);

struct native CheatKeyState
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name KeyName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StateValue;

    structdefaultproperties
    {
        KeyName="None"
        StateValue=0.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private input bool bEnableCapcomWaterMark[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private input bool bCaptivateDemo[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private input bool bTGSDemo[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDrawCapcomWaterMark[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMatchedDemoGodCheatKeys[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CapcomDecodedWaterMark;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CapcomWaterMarkKeyStates;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DemoGodCheatKeyStates;

// Export ULPGameViewportClient::execVerifyCapcomWaterMark(FFrame&, void* const)
native function VerifyCapcomWaterMark()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

event Init()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string OutError[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x50
    if(bEnableCapcomWaterMark)
    {
        // End:0x50
        if(VerifyCapcomWaterMark())
        {
            __HandleInputKey__Delegate = CapcomWaterMarkInputKey;
            __HandleInputAxis__Delegate = CapcomWaterMarkInputAxis;
        }
    }
    return super(GameViewportClient).Init(OutError);
    //return ReturnValue;    
}

function ShouldCreateViewportConsole()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function CapcomWaterMarkInputKey()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name Key[8388609];
    local /*0x97E50000-0x00000000*/ private byte EventType[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountDepressed[8388609];
    local /*0x97E50000-0x00000000*/ private bool bGamepad[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int Idx, NumMatch;
    local /*0x97E50000-0x00000000*/ private bool bRetval, bSavedMatchedDemoGodCheatKeys;
    local /*0x97E50000-0x00000000*/ private @NULL LP, LPPC, LPCM;

    bRetval = false;
    bDrawCapcomWaterMark = false;
    // End:0x187
    if(CapcomWaterMarkKeyStates.Length > 0)
    {
        NumMatch = 0;
        Idx = 0;
        J0x3F:

        // End:0x157 [Loop If]
        if(Idx < CapcomWaterMarkKeyStates.Length)
        {
            // End:0x10E
            if(CapcomWaterMarkKeyStates[Idx].KeyName == Key)
            {
                // End:0xCE
                if(int(EventType) == int(0))
                {
                    CapcomWaterMarkKeyStates[Idx].StateValue = 1.0000000;                    
                }
                else
                {
                    // End:0x10E
                    if(int(EventType) == int(1))
                    {
                        CapcomWaterMarkKeyStates[Idx].StateValue = 0.0000000;
                    }
                }
            }
            // End:0x149
            if(CapcomWaterMarkKeyStates[Idx].StateValue == 1.0000000)
            {
                ++NumMatch;
            }
            ++Idx;
            // [Loop Continue]
            goto J0x3F;
        }
        // End:0x187
        if(NumMatch == CapcomWaterMarkKeyStates.Length)
        {
            bDrawCapcomWaterMark = true;
            bRetval = true;
        }
    }
    bSavedMatchedDemoGodCheatKeys = bMatchedDemoGodCheatKeys;
    bMatchedDemoGodCheatKeys = false;
    // End:0x41F
    if((!bRetval && bCaptivateDemo) && DemoGodCheatKeyStates.Length > 0)
    {
        NumMatch = 0;
        Idx = 0;
        J0x1EE:

        // End:0x306 [Loop If]
        if(Idx < DemoGodCheatKeyStates.Length)
        {
            // End:0x2BD
            if(DemoGodCheatKeyStates[Idx].KeyName == Key)
            {
                // End:0x27D
                if(int(EventType) == int(0))
                {
                    DemoGodCheatKeyStates[Idx].StateValue = 1.0000000;                    
                }
                else
                {
                    // End:0x2BD
                    if(int(EventType) == int(1))
                    {
                        DemoGodCheatKeyStates[Idx].StateValue = 0.0000000;
                    }
                }
            }
            // End:0x2F8
            if(DemoGodCheatKeyStates[Idx].StateValue == 1.0000000)
            {
                ++NumMatch;
            }
            ++Idx;
            // [Loop Continue]
            goto J0x1EE;
        }
        // End:0x41F
        if(NumMatch == DemoGodCheatKeyStates.Length)
        {
            bMatchedDemoGodCheatKeys = true;
            bRetval = true;
            // End:0x41F
            if(!bSavedMatchedDemoGodCheatKeys && bMatchedDemoGodCheatKeys)
            {
                LP = FindPlayerByControllerId(ControllerId);
                // End:0x41F
                if(LP != none)
                {
                    LPPC = LPPlayerController(LP.Actor);
                    // End:0x41F
                    if(LPPC != none)
                    {
                        LPCM = LPCheatManager(LPPC.CheatManager);
                        // End:0x41F
                        if(LPCM != none)
                        {
                            LPCM.SemiGod();
                        }
                    }
                }
            }
        }
    }
    return bRetval;
    //return ReturnValue;    
}

function CapcomWaterMarkInputAxis()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name Key[8388609];
    local /*0x97E50000-0x00000000*/ private float Delta[8388609], DeltaTime;
    local /*0x97E50000-0x00000000*/ private bool bGamepad[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int Idx, NumMatch;
    local /*0x97E50000-0x00000000*/ private bool bRetval;

    bRetval = false;
    bDrawCapcomWaterMark = false;
    // End:0x173
    if(CapcomWaterMarkKeyStates.Length > 0)
    {
        NumMatch = 0;
        Idx = 0;
        J0x3E:

        // End:0x143 [Loop If]
        if(Idx < CapcomWaterMarkKeyStates.Length)
        {
            // End:0xFA
            if(CapcomWaterMarkKeyStates[Idx].KeyName == Key)
            {
                // End:0xCE
                if(Abs(Delta) > 0.5000000)
                {
                    CapcomWaterMarkKeyStates[Idx].StateValue = 1.0000000;                    
                }
                else
                {
                    CapcomWaterMarkKeyStates[Idx].StateValue = 0.0000000;
                }
            }
            // End:0x135
            if(CapcomWaterMarkKeyStates[Idx].StateValue == 1.0000000)
            {
                ++NumMatch;
            }
            ++Idx;
            // [Loop Continue]
            goto J0x3E;
        }
        // End:0x173
        if(NumMatch == CapcomWaterMarkKeyStates.Length)
        {
            bDrawCapcomWaterMark = true;
            bRetval = true;
        }
    }
    return bRetval;
    //return ReturnValue;    
}

function DrawTransition()
{
    local /*0x97E50000-0x00000000*/ private @NULL Canvas[8388609];
    local /*0x97E50000-0x00000000*/ private float XL, YL;
    local /*0x97E50000-0x00000000*/ private editfixedsize string Message;

    // End:0x275
    if(bDrawCapcomWaterMark)
    {
        Message = CapcomDecodedWaterMark;
        Canvas.Font = Class'Engine.Engine'.static.GetLargeFont();
        Canvas.bCenter = false;
        Canvas.StrLen(Message, XL, YL);
        Canvas.SetPos((0.5000000 * (Canvas.ClipX - XL)) + float(1), ((0.6600000 * Canvas.ClipY) - (YL * 0.5000000)) + float(1));
        Canvas.SetDrawColor(0, 0, 0);
        Canvas.DrawText(Message, false);
        Canvas.SetPos(0.5000000 * (Canvas.ClipX - XL), (0.6600000 * Canvas.ClipY) - (YL * 0.5000000));
        Canvas.SetDrawColor(255, 128, 0);
        Canvas.DrawText(Message, false);
    }
    //return;    
}

static function IsCaptivateDemo()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LP, LPGVC;

    LP = Class'SPEngine.SPUtil'.static.GetPlayerOwner(0);
    // End:0x99
    if(LP != none)
    {
        LPGVC = LPGameViewportClient(LP.ViewportClient);
        // End:0x99
        if(LPGVC != none)
        {
            return LPGVC.bCaptivateDemo;
        }
    }
    return false;
    //return ReturnValue;    
}

static function IsTGSDemo()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LP, LPGVC;

    LP = Class'SPEngine.SPUtil'.static.GetPlayerOwner(0);
    // End:0x99
    if(LP != none)
    {
        LPGVC = LPGameViewportClient(LP.ViewportClient);
        // End:0x99
        if(LPGVC != none)
        {
            return LPGVC.bTGSDemo;
        }
    }
    return false;
    //return ReturnValue;    
}

static function EnableTGSDemo()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LP, LPGVC;

    true
    LP = Class'SPEngine.SPUtil'.static.GetPlayerOwner(0);
    // End:0xA8
    if(LP != none)
    {
        LPGVC = LPGameViewportClient(LP.ViewportClient);
        // End:0xA8
        if(LPGVC != none)
        {
            LPGVC.bTGSDemo = bEnable;
        }
    }
    //return;    
}

event UnregisteredControllerButtonPress()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PC, HUD;

    // End:0xB6
    foreach Class'Engine.WorldInfo'.static.GetWorldInfo().LocalPlayerControllers(Class'Engine.PlayerController', PC)
    {
        HUD = LPHUD(PC.myHUD);
        // End:0xB5
        if(HUD != none)
        {            
            return HUD.UnregisteredControllerButtonPress(ControllerId);
        }        
    }    
    return false;
    //return ReturnValue;    
}

event NonPrimaryControllerButtonPress()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609], PlayerID;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PC, HUD;

    // End:0xBF
    foreach Class'Engine.WorldInfo'.static.GetWorldInfo().LocalPlayerControllers(Class'Engine.PlayerController', PC)
    {
        HUD = LPHUD(PC.myHUD);
        // End:0xBE
        if(HUD != none)
        {            
            return HUD.NonPrimaryControllerButtonPress(ControllerId, PlayerID);
        }        
    }    
    return false;
    //return ReturnValue;    
}

function StopMovie()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIgnoreSilenceOnNextUpdate[8388609];

    // End:0x2D
    if(bIgnoreSilenceOnNextUpdate)
    {
        LPPC.ClientMovieSetIgnoreSilenceOnNextUpdate(true);
    }
    LPPC.ClientStopMovie(0.0000000, false, true, true);
    //return;    
}

function NotifyConnectionError()
{
    local /*0x97E50000-0x00000000*/ private byte MessageType[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Message[9437185], Title;
    local /*0x97E50000-0x00000000*/ private @NULL WI, LP, PC, LPPC, PendingPC, OnlineSub;

    local /*0x97E50000-0x00000000*/ private byte LoginStatus;
    local /*0x97E50000-0x00000000*/ private bool bNoSignChange;
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;
    local /*0x97E50000-0x00000000*/ private bool bInProcessOfJoiningGame, bCurrentMoviePlaying, bStopMovie, bIgnoreSilence;
    local /*0x97E50000-0x00000000*/ private editfixedsize string CurrentMovie;

    Localize("Errors", "ConnectionFailed", "Engine");
    Localize("Errors", "ConnectionFailed_Title", "Engine");
    WI = Class'Engine.Engine'.static.GetCurrentWorldInfo();
    LP = Outer.GamePlayers[0];
    PC = Outer.GamePlayers[0].Actor;
    LPPC = LPPlayerController(PC);
    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    ScriptTrace();
    bInProcessOfJoiningGame = MPMgr.IsInProcessOfJoiningGame();
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0x23F
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        LoginStatus = OnlineSub.PlayerInterface.GetLoginStatus(byte(LP.ControllerId));
    }
    // End:0x2CD
    if(!bInProcessOfJoiningGame)
    {
        // End:0x2CD
        if((int(WI.NetMode) == int(NM_Standalone)) && LPGameMP_Base(WI.Game) == none)
        {
            super(GameViewportClient).NotifyConnectionError(MessageType, Message, Title);
            return;
        }
    }
    MPMgr.bIsJoining = false;
    // End:0x337
    if(MPMgr.bInProgress)
    {
        super(GameViewportClient).NotifyConnectionError(MessageType, Message, Title);
        return;
    }
    bCurrentMoviePlaying = false;
    bStopMovie = false;
    bIgnoreSilence = false;
    // End:0x3BB
    if(LPPC != none)
    {
        LPPC.GetCurrentMovie(CurrentMovie);
        // End:0x3AF
        if(Len(CurrentMovie) > 0)
        {
            bCurrentMoviePlaying = true;
        }
        bStopMovie = true;
    }
    PC.bIgnoreNetworkMessages = true;
    WI.Pauser = none;
    // End:0x5A2
    if((!bInProcessOfJoiningGame && Class'Engine.WorldInfo'.static.IsConsoleBuild(2)) && int(WI.Game.Role) == int(ROLE_Authority))
    {
        // End:0x576
        if(int(LoginStatus) != int(2))
        {
            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.LostPSNConnection_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.DuplicateSigninPSN_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>",, OnNotifyConnectionErrorAccept);            
        }
        // End:0x5A0
        if(bStopMovie)
        {
            StopMovie(LPPC, bIgnoreSilence);
        }
        return;
    }
    PendingPC = LPPCPendingLevel(LPPC);
    // End:0x5D8
    if(PendingPC != none)
    {
        LPPC = none;
    }
    bNoSignChange = (int(LoginStatus) == int(2)) || (int(MPMgr.OnlineMode) == int(2)) && int(LoginStatus) > int(0);
    // End:0xDA0
    if(bNoSignChange || LPPC == none)
    {
        // End:0xDA0
        if(((int(MessageType) == int(4)) || int(MessageType) == int(7)) || int(MessageType) == int(6))
        {
            MPMgr.ConnectionErrorCount++;
            // End:0x81F
            if(((((bNoSignChange == false) && LPPC == none) && int(LoginStatus) == int(0)) && int(MPMgr.OnlineMode) == int(1)) && int(MessageType) == int(4))
            {
                Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.IllegalSigninChange_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.IllegalSigninChange_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>",, OnNotifyConnectionErrorAccept);                
            }
            else
            {
                // End:0x8D7
                if(LPPC.bIsReturningToMenu)
                {
                    // End:0x85A
                    if(bCurrentMoviePlaying)
                    {
                        bIgnoreSilence = true;
                    }
                    LPPC.ClientReturnToMPLobby("<Strings:Engine.Errors.ConnectionFailed>", "<Strings:Engine.Errors.ConnectionFailed_Title>");                    
                }
                else
                {
                    // End:0xA02
                    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2) && int(LoginStatus) != int(2))
                    {
                        Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.LostPSNConnection_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.DuplicateSigninPSN_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>",, OnNotifyConnectionErrorAccept);                        
                    }
                    else
                    {
                        // End:0xB2E
                        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1) && int(LoginStatus) != int(2))
                        {
                            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.LostLiveConnection_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.LostLiveConnection_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>",, OnNotifyConnectionErrorAccept);                            
                        }
                        else
                        {
                            // End:0xCB5
                            if(bInProcessOfJoiningGame)
                            {
                                // End:0xB97
                                if(LPPC != none)
                                {
                                    // End:0xB63
                                    if(bCurrentMoviePlaying)
                                    {
                                        bIgnoreSilence = true;
                                    }
                                    LPPC.ReturnToLastMenu(Message, Title);                                    
                                }
                                else
                                {
                                    // End:0xBF3
                                    if(PendingPC != none)
                                    {
                                        // End:0xBBF
                                        if(bCurrentMoviePlaying)
                                        {
                                            bIgnoreSilence = true;
                                        }
                                        PendingPC.ReturnToLastMenu(Message, Title);                                        
                                    }
                                    else
                                    {
                                        Class'LPUIManager'.static.DisplayErrorMessage("<Strings:Engine.Errors.ConnectionFailed>", "<Strings:Engine.Errors.ConnectionFailed_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>",, OnNotifyConnectionErrorAccept);
                                    }
                                }                                
                            }
                            else
                            {
                                Class'LPUIManager'.static.DisplayErrorMessage("<Strings:Engine.Errors.ConnectionFailed>", "<Strings:Engine.Errors.ConnectionFailed_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>",, OnNotifyConnectionErrorAccept);
                            }
                        }
                    }
                }
            }
            // End:0xD9E
            if(bStopMovie)
            {
                StopMovie(LPPC, bIgnoreSilence);
            }
            return;
        }
    }
    // End:0xE8B
    if(LPPC == none)
    {
        // End:0xE88
        if(int(WI.NetMode) != int(NM_Standalone))
        {
            // End:0xE32
            if(WI.Game != none)
            {
                WI.Game.bHasNetworkError = true;
            }            
            ConsoleCommand((("start ?failed?ErrorMessage=" $ Message) $ "?ErrorTitle=") $ Title);
        }        
    }
    else
    {
        // End:0xEE2
        if(bNoSignChange)
        {
            // End:0xEB1
            if(bCurrentMoviePlaying)
            {
                bIgnoreSilence = true;
            }
            LPPC.ReturnToLastMenu(Message, Title);
        }
    }
    // End:0xF0C
    if(bStopMovie)
    {
        StopMovie(LPPC, bIgnoreSilence);
    }
    //return;    
}

function OnNotifyConnectionErrorAccept()
{
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedButtonIndex[8388609], PlayerIndex;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Outer.GamePlayers[0].Actor);
    // End:0x7B
    if(LPPC != none)
    {
        LPPC.ReturnToLastMenu();        
    }
    else
    {        
        ConsoleCommand("start ?failed");
    }
    return true;
    //return ReturnValue;    
}

function OnPrimaryPlayerSwitch()
{
    local /*0x97E50000-0x00000000*/ private @NULL OldPrimaryPlayer[8388609], NewPrimaryPlayer, oldLPPC, newLPPC;

    oldLPPC = LPMenuGamePC(OldPrimaryPlayer.Actor);
    // End:0x40
    if(oldLPPC == none)
    {
    }
    newLPPC = LPMenuGamePC(NewPrimaryPlayer.Actor);
    // End:0x80
    if(newLPPC == none)
    {
    }
    // End:0xFD
    if((oldLPPC != none) && newLPPC != none)
    {
        newLPPC.MyLPGFxMovie_FrontEnd = oldLPPC.MyLPGFxMovie_FrontEnd;
        oldLPPC.MyLPGFxMovie_FrontEnd = none;
    }
    super(GameViewportClient).OnPrimaryPlayerSwitch(OldPrimaryPlayer, NewPrimaryPlayer);
    //return;    
}

function UpdateActiveSplitscreenType()
{
    ActiveSplitscreenType = 0;
    //return;    
}

defaultproperties
{
    CapcomWaterMarkKeyStates=/* Array type was not detected. */
    DemoGodCheatKeyStates=/* Array type was not detected. */
    SubtitleMinX=0.2000000
    SubtitleMaxX=0.8000000
    MultiplayerSubtitleMinX=0.2000000
    MultiplayerSubtitleMaxX=0.8000000
    UIControllerClass=Class'LPUIInteraction'
}