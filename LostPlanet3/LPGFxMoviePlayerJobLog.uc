class LPGFxMoviePlayerJobLog extends SPGFxMoviePlayer
    config(UI);

struct native TabBarData
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Label;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Data;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string IconName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisabled;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TabView;

    structdefaultproperties
    {
        Label=""
        Data=""
        IconName=""
        bDisabled=false
        TabView=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Tabs[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentTabIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ContractsTabIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MissionsTabIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MessagesTabIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CollectiblesTabIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MusicTabIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int EquipmentTabIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL JobLog;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL JobLogButtonBar;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ViewStack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL JobLogLoopingSound;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL JobLogLoopingAC[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ContractsMapView;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MissionsView;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MessagesView;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CollectiblesView;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MusicPlayerView;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EquipmentView;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLaunchVideoMessage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVSMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool b3DiInit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bClosing;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOpenJobLogToMusicPlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOpenJobLogToCollectibles;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPreLoadViews;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PendingVideoMessageInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StartRotation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int UpdateTicks;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ButtonLegendLabel1;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ButtonLegendLabel2;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ButtonLegendLabel3;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ButtonLegendLabel4;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ButtonLegendLabel5;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ButtonLegendLabel6;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __MessageSortDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __PanelContractsStateChangedDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __ToggleMapStateDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __SetCurrentCollectibleDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __SetCurrentEquipmentCollectibleDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __ActivateCurrentCollectibleDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __SetCurrentLoadoutDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __ActivateCurrentLoadoutDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __SetContractsButtonLegendDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __SetMissionsButtonLegendDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __SetMessagesButtonLegendDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __SetCollectiblesButtonLegendDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __SetMusicButtonLegendDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __SetEquipmentButtonLegendDelegate__Delegate;

function Start()
{
    local /*0x97E50000-0x00000000*/ private bool StartPaused[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private int intVal;

    false
    UpdateTicks = 0;
    LPPC = LPPlayerController(GetPC());
    CurrentTabIndex = LPPC.JobLogInfo.TabIndex;
    // End:0x82
    if(CurrentTabIndex < 0)
    {
        CurrentTabIndex = 0;
    }
    InitTabIndices();
    bPauseGameWhileActive = LPPC.bIsInVitalSuit;
    // End:0xE2
    if(bPauseGameWhileActive)
    {
        LPPC.SetupPausedSubtitlesAndAudioTimer();
    }
    super.Start();
    Advance(0.0000000);
    JobLog = GetVariableObject("_root.jobLogEffects.jobLog");
    bOpenJobLogToMusicPlayer = LPPC.bOpenJobLogToMusicPlayer;
    bOpenJobLogToCollectibles = LPPC.JobLogAutoOpenMessage != none;
    b3DiInit = false;
    bVSMode = false;
    bClosing = false;
    LPPC.myLPHUD.SleepHUDMessage(true);    
    GetPC().ConsoleCommand("HideLPHUD 1");
    LPPC.ReleaseHeldButtons();
    SetImageSubstitutions();
    bLaunchVideoMessage = false;
    LPPC.myLPHUD.ShowVideoMessage(false);
    PlaySoundFromTheme('OpenJobLog');
    intVal = int(LPPC.GetCurrencyAmount(0));
    SetCurrency("tenergy", float(intVal));
    intVal = int(LPPC.GetCurrencyAmount(1));
    SetCurrency("salvage", float(intVal));
    intVal = int(LPPC.GetCurrencyAmount(2));
    SetCurrency("dna", float(intVal));
    // End:0x3E7
    if(LPPC != none)
    {
        // End:0x3E7
        if(!LPPC.CanPlayAudioMessage() || !LPPC.CanPlayVideoMessage())
        {
            LPPC.AbortMailMessagePlayback();
        }
    }
    return true;
    //return ReturnValue;    
}

function SetCurrency()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string currencyType[8388609];
    local /*0x97E50000-0x00000000*/ private float Amount[8388609];

    // End:0x3B
    if(JobLog != none)
    {
        JobLog.ActionScriptVoid("SetCurrency");
    }
    //return;    
}

function InitTabIndices()
{
    local /*0x97E50000-0x00000000*/ private int I;

    ContractsTabIndex = -1;
    MessagesTabIndex = -1;
    CollectiblesTabIndex = -1;
    MusicTabIndex = -1;
    EquipmentTabIndex = -1;
    I = 0;
    J0x56:

    // End:0x19C [Loop If]
    if(I < Tabs.Length)
    {
        switch(Tabs[I].Data)
        {
            // End:0xC0
            case "MapView":
                ContractsTabIndex = I;
                // End:0x18E
                break;
            // End:0xE7
            case "MissionsView":
                MissionsTabIndex = I;
                // End:0x18E
                break;
            // End:0x10E
            case "MessagesView":
                MessagesTabIndex = I;
                // End:0x18E
                break;
            // End:0x139
            case "CollectiblesView":
                CollectiblesTabIndex = I;
                // End:0x18E
                break;
            // End:0x163
            case "MusicPlayerView":
                MusicTabIndex = I;
                // End:0x18E
                break;
            // End:0x18B
            case "EquipmentView":
                EquipmentTabIndex = I;
                // End:0x18E
                break;
            // End:0xFFFF
            default:
                break;
        }
        I++;
        // [Loop Continue]
        goto J0x56;
    }
    //return;    
}

function JobLogClipLoadComplete()
{
    local /*0x97E50000-0x00000000*/ private @NULL clip[8388609];

    // End:0x37
    if(ContractsMapView != none)
    {
        ContractsMapView.SetMapMC(clip);
    }
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval;
    local /*0x97E50000-0x00000000*/ private @NULL CurrentViewWidget;

    Retval = false;
    // End:0x1B
    if(bClosing)
    {
        return true;
    }
    CurrentViewWidget = Tabs[CurrentTabIndex].TabView;
    // End:0x28C
    if(CurrentViewWidget != none)
    {
        // End:0xCB
        if(CurrentViewWidget == ContractsMapView)
        {
            Retval = ContractsMapView.FilterButtonInput(ControllerId, ButtonName, InputEvent);
            // End:0xC8
            if(Retval == true)
            {
                return true;
            }            
        }
        else
        {
            // End:0x13C
            if(CurrentViewWidget == MusicPlayerView)
            {
                Retval = MusicPlayerView.FilterButtonInput(ControllerId, ButtonName, InputEvent);
                // End:0x139
                if(Retval == true)
                {
                    return true;
                }                
            }
            else
            {
                // End:0x1AD
                if(CurrentViewWidget == CollectiblesView)
                {
                    Retval = CollectiblesView.FilterButtonInput(ControllerId, ButtonName, InputEvent);
                    // End:0x1AA
                    if(Retval == true)
                    {
                        return true;
                    }                    
                }
                else
                {
                    // End:0x21E
                    if(CurrentViewWidget == EquipmentView)
                    {
                        Retval = EquipmentView.FilterButtonInput(ControllerId, ButtonName, InputEvent);
                        // End:0x21B
                        if(Retval == true)
                        {
                            return true;
                        }                        
                    }
                    else
                    {
                        // End:0x28C
                        if(CurrentViewWidget == MessagesView)
                        {
                            Retval = MessagesView.FilterButtonInput(ControllerId, ButtonName, InputEvent);
                            // End:0x28C
                            if(Retval == true)
                            {
                                return true;
                            }
                        }
                    }
                }
            }
        }
    }
    return Retval;
    //return ReturnValue;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CameraRot, CameraLoc;

    super.Update(DeltaTime);
    UpdateTicks++;
    // End:0xF1
    if(b3DiInit == false)
    {
        b3DiInit = true;
        // End:0xE7
        if(bVSMode == false)
        {
            JobLog.SetFloat("_z", 4000.0000000);
            JobLog.SetFloat("_yrotation", 22.0000000);
            GetPC().GetPlayerViewPoint(CameraLoc, CameraRot);
            StartRotation = CameraRot;
        }
        PlayJobLogLoopingSound();
    }
    UpdatePos();
    // End:0x14A
    if((ContractsMapView != none) && CurrentTabIndex == ContractsTabIndex)
    {
        ContractsMapView.Update(1.0000000);        
    }
    else
    {
        // End:0x19D
        if((MissionsView != none) && CurrentTabIndex == MissionsTabIndex)
        {
            MissionsView.Update(DeltaTime);            
        }
        else
        {
            // End:0x1F0
            if((CollectiblesView != none) && CurrentTabIndex == CollectiblesTabIndex)
            {
                CollectiblesView.Update(DeltaTime);                
            }
            else
            {
                // End:0x240
                if((EquipmentView != none) && CurrentTabIndex == EquipmentTabIndex)
                {
                    EquipmentView.Update(DeltaTime);
                }
            }
        }
    }
    //return;    
}

function SetVSMode()
{
    local /*0x97E50000-0x00000000*/ private bool bInVSMode[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Data, Obj, LPC;

    bVSMode = bInVSMode;
    ActionScriptVoid("SetVSMode");
    // End:0x50
    if(bVSMode)
    {
        GoToVSIntro();
        SetSceneDPG(4);        
    }
    else
    {
        GoToIntro();
    }
    LPC = LPPlayerController(GetPC());
    // End:0x1A6
    if(JobLogButtonBar != none)
    {
        // End:0xF5
        if(LPC.bOpenJobLogToAutopilot && ContractsTabIndex >= 0)
        {
            JobLogButtonBar.SetFloat("selectedIndex", float(ContractsTabIndex));            
        }
        else
        {
            // End:0x14F
            if(bOpenJobLogToMusicPlayer && MusicTabIndex >= 0)
            {
                JobLogButtonBar.SetFloat("selectedIndex", float(MusicTabIndex));                
            }
            else
            {
                // End:0x1A6
                if(bOpenJobLogToCollectibles && CollectiblesTabIndex >= 0)
                {
                    JobLogButtonBar.SetFloat("selectedIndex", float(CollectiblesTabIndex));
                }
            }
        }
    }
    // End:0x3F0
    if(bVSMode == false)
    {
        // End:0x1F1
        if((CurrentTabIndex == MusicTabIndex) || CurrentTabIndex == MessagesTabIndex)
        {
            CurrentTabIndex = 0;
        }
        // End:0x3ED
        if(JobLogButtonBar != none)
        {
            Data = JobLogButtonBar.GetObject("dataProvider");
            // End:0x3ED
            if(Data != none)
            {
                Tabs[MusicTabIndex].bDisabled = true;
                Obj = Data.GetElementObject(MusicTabIndex);
                Obj.SetBool("bDisabled", true);
                Data.SetElementObject(MusicTabIndex, Obj);
                Tabs[MessagesTabIndex].bDisabled = true;
                Obj = Data.GetElementObject(MessagesTabIndex);
                Obj.SetBool("bDisabled", true);
                Data.SetElementObject(MessagesTabIndex, Obj);
                JobLogButtonBar.SetObject("dataProvider", Data);
            }
        }        
    }
    else
    {
        // End:0x56B
        if(!LPC.CanPlayVideoMessage())
        {
            Data = JobLogButtonBar.GetObject("dataProvider");
            // End:0x549
            if(Data != none)
            {
                Tabs[MessagesTabIndex].bDisabled = true;
                Obj = Data.GetElementObject(MessagesTabIndex);
                Obj.SetBool("bDisabled", true);
                Data.SetElementObject(MessagesTabIndex, Obj);
                JobLogButtonBar.SetObject("dataProvider", Data);
            }
            // End:0x56B
            if(CurrentTabIndex == MessagesTabIndex)
            {
                CurrentTabIndex = 0;
            }
        }
    }
    // End:0x6E6
    if(!LPC.CanPlayAudioMessage())
    {
        Data = JobLogButtonBar.GetObject("dataProvider");
        // End:0x6C4
        if(Data != none)
        {
            Tabs[CollectiblesTabIndex].bDisabled = true;
            Obj = Data.GetElementObject(CollectiblesTabIndex);
            Obj.SetBool("bDisabled", true);
            Data.SetElementObject(CollectiblesTabIndex, Obj);
            JobLogButtonBar.SetObject("dataProvider", Data);
        }
        // End:0x6E6
        if(CurrentTabIndex == CollectiblesTabIndex)
        {
            CurrentTabIndex = 0;
        }
    }
    LoadAllViews();
    //return;    
}

function LoadAllViews()
{
    local /*0x97E50000-0x00000000*/ private int I, finalViewToLoad;

    finalViewToLoad = -1;
    I = 0;
    J0x1A:

    // End:0xD8 [Loop If]
    if(I < Tabs.Length)
    {
        // End:0xCA
        if(!Tabs[I].bDisabled)
        {
            // End:0x8B
            if(I == CurrentTabIndex)
            {
                finalViewToLoad = I;                
            }
            else
            {
                // End:0xCA
                if(bPreLoadViews)
                {
                    LoadView(Tabs[I].Data, false);
                }
            }
        }
        I++;
        // [Loop Continue]
        goto J0x1A;
    }
    // End:0x11D
    if(finalViewToLoad != -1)
    {
        LoadView(Tabs[finalViewToLoad].Data, true);
    }
    NotifyViewViewed(CurrentTabIndex);
    // End:0x179
    if(JobLogButtonBar != none)
    {
        JobLogButtonBar.SetFloat("selectedIndex", float(CurrentTabIndex));
    }
    //return;    
}

function UpdatePos()
{
    local /*0x97E50000-0x00000000*/ private float yawRadian, pitchRadian;
    local /*0x97E50000-0x00000000*/ private @NULL mYaw, mTranslate, mPitch, mScale, mFinal;

    local /*0x97E50000-0x00000000*/ private float distFromPawn, pawnPosX, pawnPosZ, Scale;
    local /*0x97E50000-0x00000000*/ private @NULL CameraRot, CameraLoc;

    // End:0x24
    if((b3DiInit == false) || bVSMode == true)
    {
        return;
    }
    Scale = 1.0000000;
    GetPC().GetPlayerViewPoint(CameraLoc, CameraRot);
    mTranslate.XPlane.X = 1.0000000;
    mTranslate.YPlane.Y = 1.0000000;
    mTranslate.ZPlane.Z = 1.0000000;
    mTranslate.WPlane.W = 1.0000000;
    mYaw = mTranslate;
    mPitch = mTranslate;
    mScale = mTranslate;
    yawRadian = float(-(16384 + (CameraRot.Yaw - StartRotation.Yaw)) & 65535) * (3.1415930 / 32768.0000000);
    yawRadian -= (float(3) * 1.5707960);
    pitchRadian = float(-(16384 + (CameraRot.Pitch - StartRotation.Pitch)) & 65535) * (3.1415930 / 32768.0000000);
    pitchRadian -= (float(3) * 1.5707960);
    mYaw.XPlane.X = Cos(yawRadian) * Scale;
    mYaw.XPlane.Z = -Sin(yawRadian) * Scale;
    mYaw.ZPlane.X = Sin(yawRadian) * Scale;
    mYaw.ZPlane.Z = Cos(yawRadian) * Scale;
    mPitch.YPlane.Y = Cos(pitchRadian) * Scale;
    mPitch.YPlane.Z = Sin(pitchRadian) * Scale;
    mPitch.ZPlane.Y = -Sin(pitchRadian) * Scale;
    mPitch.ZPlane.Z = Cos(pitchRadian) * Scale;
    distFromPawn = 12000.0000000;
    pawnPosX = -4000.0000000;
    pawnPosZ = 0.0000000;
    yawRadian += 1.5707960;
    yawRadian += 0.5000000;
    mTranslate.WPlane.X = (-Cos(yawRadian) * distFromPawn) + pawnPosX;
    mTranslate.WPlane.Z = (Sin(yawRadian) * distFromPawn) + pawnPosZ;
    mScale.XPlane.X = 1.2500000;
    mScale.YPlane.Y = 1.2500000;
    mScale.ZPlane.Z = 0.5000000;
    mScale.WPlane.W = 1.0000000;
    mFinal = Multiply_MatrixMatrix(Multiply_MatrixMatrix(Multiply_MatrixMatrix(mYaw, mPitch), mTranslate), mScale);
    JobLog.SetDisplayMatrix3D(mFinal);
    //return;    
}

function CreateJobLogLoopingAC()
{
    // End:0x5C
    if(JobLogLoopingAC == none)
    {
        JobLogLoopingAC = GetPC().Pawn.CreateAudioComponent(JobLogLoopingSound, false, true);
    }
    //return;    
}

function PlayJobLogLoopingSound()
{
    // End:0x19
    if(JobLogLoopingAC == none)
    {
        CreateJobLogLoopingAC();
    }
    // End:0x47
    if(JobLogLoopingAC != none)
    {
        JobLogLoopingAC.Play();
    }
    //return;    
}

function CleanUpJobLogLoopingSound()
{
    // End:0x4D
    if(JobLogLoopingAC != none)
    {
        JobLogLoopingAC.Stop();
        JobLogLoopingAC.DetachFromAny();
    }
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bWasHandled;

    bWasHandled = true;
    switch(WidgetName)
    {
        // End:0x41
        case 'VS':
            ViewStack = Widget;
            // End:0xA6A
            break;
        // End:0xA8
        case 'LabelLeftShoulder':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.JobLog.LeftShoulder>"));
            // End:0xA6A
            break;
        // End:0x110
        case 'LabelRightShoulder':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.JobLog.RightShoulder>"));
            // End:0xA6A
            break;
        // End:0x132
        case 'Label1':
            ButtonLegendLabel1 = Widget;
            // End:0xA6A
            break;
        // End:0x154
        case 'Label2':
            ButtonLegendLabel2 = Widget;
            // End:0xA6A
            break;
        // End:0x176
        case 'Label3':
            ButtonLegendLabel3 = Widget;
            // End:0xA6A
            break;
        // End:0x198
        case 'Label4':
            ButtonLegendLabel4 = Widget;
            // End:0xA6A
            break;
        // End:0x1BA
        case 'Label5':
            ButtonLegendLabel5 = Widget;
            // End:0xA6A
            break;
        // End:0x1DC
        case 'Label6':
            ButtonLegendLabel6 = Widget;
            // End:0xA6A
            break;
        // End:0x1EB
        case 'textTitle':
            // End:0xA6A
            break;
        // End:0x220
        case 'bb':
            JobLogButtonBar = GFxClikWidget(Widget);
            UpdateButtonBarDataProvider();
            // End:0xA6A
            break;
        // End:0x335
        case 'MapView':
            // End:0x332
            if(ContractsMapView == none)
            {
                ContractsMapView = LPGFxJobLogContractsMapView(Widget);
                ContractsMapView.Init();
                ContractsMapView.SetJobLogMoviePlayer(self, ContractsTabIndex);
                SetWidgetPathBinding(ContractsMapView, WidgetPath);
                // End:0x332
                if(Tabs.Length > ContractsTabIndex)
                {
                    Tabs[ContractsTabIndex].TabView = Widget;
                    // End:0x332
                    if(bPreLoadViews == false)
                    {
                        ContractsMapView.Viewed();
                    }
                }
            }
            // End:0xA6A
            break;
        // End:0x42B
        case 'MissionsView':
            // End:0x428
            if(MissionsView == none)
            {
                MissionsView = LPGFxJobLogMissionsView(Widget);
                MissionsView.Init(self, MissionsTabIndex);
                SetWidgetPathBinding(MissionsView, WidgetPath);
                // End:0x428
                if(Tabs.Length > MissionsTabIndex)
                {
                    Tabs[MissionsTabIndex].TabView = Widget;
                    // End:0x428
                    if(bPreLoadViews == false)
                    {
                        MissionsView.Viewed();
                    }
                }
            }
            // End:0xA6A
            break;
        // End:0x521
        case 'MessagesView':
            // End:0x51E
            if(MessagesView == none)
            {
                MessagesView = LPGFxJobLogMessagesView(Widget);
                MessagesView.Init(self, MessagesTabIndex);
                SetWidgetPathBinding(MessagesView, WidgetPath);
                // End:0x51E
                if(Tabs.Length > MessagesTabIndex)
                {
                    Tabs[MessagesTabIndex].TabView = Widget;
                    // End:0x51E
                    if(bPreLoadViews == false)
                    {
                        MessagesView.Viewed();
                    }
                }
            }
            // End:0xA6A
            break;
        // End:0x617
        case 'CollectiblesView':
            // End:0x614
            if(CollectiblesView == none)
            {
                CollectiblesView = LPGFxJobLogCollectiblesView(Widget);
                CollectiblesView.Init(self, CollectiblesTabIndex);
                SetWidgetPathBinding(CollectiblesView, WidgetPath);
                // End:0x614
                if(Tabs.Length > CollectiblesTabIndex)
                {
                    Tabs[CollectiblesTabIndex].TabView = Widget;
                    // End:0x614
                    if(bPreLoadViews == false)
                    {
                        CollectiblesView.Viewed();
                    }
                }
            }
            // End:0xA6A
            break;
        // End:0x70D
        case 'EquipmentView':
            // End:0x70A
            if(EquipmentView == none)
            {
                EquipmentView = LPGFxJobLogEquipmentView(Widget);
                EquipmentView.Init(self, EquipmentTabIndex);
                SetWidgetPathBinding(EquipmentView, WidgetPath);
                // End:0x70A
                if(Tabs.Length > EquipmentTabIndex)
                {
                    Tabs[EquipmentTabIndex].TabView = Widget;
                    // End:0x70A
                    if(bPreLoadViews == false)
                    {
                        EquipmentView.Viewed();
                    }
                }
            }
            // End:0xA6A
            break;
        // End:0x803
        case 'MusicPlayerView':
            // End:0x800
            if(MusicPlayerView == none)
            {
                MusicPlayerView = LPGFxJobLogMusicPlayerView(Widget);
                MusicPlayerView.Init(self, MusicTabIndex);
                SetWidgetPathBinding(MusicPlayerView, WidgetPath);
                // End:0x800
                if(Tabs.Length > MusicTabIndex)
                {
                    Tabs[MusicTabIndex].TabView = Widget;
                    // End:0x800
                    if(bPreLoadViews == false)
                    {
                        MusicPlayerView.Viewed();
                    }
                }
            }
            // End:0xA6A
            break;
        // End:0x858
        case 'ZoomLabel':
            Widget.SetText("<Strings:LostPlanetGame.JobLog.Zoom>");
            // End:0xA6A
            break;
        // End:0x8AC
        case 'PanLabel':
            Widget.SetText("<Strings:LostPlanetGame.JobLog.Pan>");
            // End:0xA6A
            break;
        // End:0x902
        case 'TrackLabel':
            Widget.SetText("<Strings:LostPlanetGame.JobLog.Track>");
            // End:0xA6A
            break;
        // End:0x957
        case 'BackLabel':
            Widget.SetText("<Strings:LostPlanetGame.JobLog.Back>");
            // End:0xA6A
            break;
        // End:0x9AE
        case 'SelectLabel':
            Widget.SetText("<Strings:LostPlanetGame.JobLog.Select>");
            // End:0xA6A
            break;
        // End:0xA03
        case 'SortLabel':
            Widget.SetText("<Strings:LostPlanetGame.JobLog.Sort>");
            // End:0xA6A
            break;
        // End:0xA58
        case 'PlayLabel':
            Widget.SetText("<Strings:LostPlanetGame.JobLog.Play>");
            // End:0xA6A
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0xA6A
            break;
            break;
    }
    // End:0xACD
    if(!bWasHandled)
    {
        // End:0xACD
        if(ContractsMapView != none)
        {
            bWasHandled = ContractsMapView.WidgetInitialized(WidgetName, WidgetPath, Widget);
        }
    }
    // End:0xB30
    if(!bWasHandled)
    {
        // End:0xB30
        if(MessagesView != none)
        {
            bWasHandled = MessagesView.WidgetInitialized(WidgetName, WidgetPath, Widget);
        }
    }
    // End:0xB6F
    if(!bWasHandled)
    {
        bWasHandled = super(GFxMoviePlayer).WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

function SetTabNewContentIndicator()
{
    local /*0x97E50000-0x00000000*/ private int TabIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bNewContent[8388609];

    //return;    
}

function UpdateButtonBarDataProvider()
{
    local /*0x97E50000-0x00000000*/ private byte I;
    local /*0x97E50000-0x00000000*/ private @NULL DataProvider, TempObj;

    DataProvider = CreateArray();
    I = 0;
    J0x20:

    // End:0x1B3 [Loop If]
    if(int(I) < Tabs.Length)
    {
        TempObj = CreateObject("Object");
        TempObj.SetString("label", Tabs[int(I)].Label);
        TempObj.SetString("data", Tabs[int(I)].Data);
        TempObj.SetString("iconName", Tabs[int(I)].IconName);
        DataProvider.SetElementObject(int(I), TempObj);
        Tabs[int(I)].bDisabled = false;
        I++;
        // [Loop Continue]
        goto J0x20;
    }
    // End:0x26D
    if(JobLogButtonBar != none)
    {
        JobLogButtonBar.SetObject("dataProvider", DataProvider);
        JobLogButtonBar.SetFloat("selectedIndex", float(CurrentTabIndex));
        JobLogButtonBar.AddEventListener('CLIK_change', OnButtonBarChange);
    }
    //return;    
}

function LoadView()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ViewName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInitialView[8388609], bCache;

    true
    // End:0x72
    if(ViewStack != none)
    {
        // End:0x49
        if(bInitialView)
        {
            ViewStack.ActionScriptVoid("show");            
        }
        else
        {
            ViewStack.ActionScriptVoid("loadView");
        }
    }
    //return;    
}

function OnButtonBarChange()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    NotifyViewViewed(CurrentTabIndex, true);
    CurrentTabIndex = ev.Index;
    NotifyViewViewed(CurrentTabIndex);
    //return;    
}

function NotifyViewViewed()
{
    local /*0x97E50000-0x00000000*/ private int viewIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUnViewed[9437185];

    false
    switch(viewIndex)
    {
        // End:0x75
        case ContractsTabIndex:
            // End:0x53
            if(bUnViewed)
            {
                ContractsMapView.UnViewed();                
            }
            else
            {
                ContractsMapView.Viewed();
            }
            // End:0x15E
            break;
        // End:0xA3
        case MissionsTabIndex:
            MissionsView.Viewed();
            // End:0x15E
            break;
        // End:0xD1
        case MessagesTabIndex:
            MessagesView.Viewed();
            // End:0x15E
            break;
        // End:0xFF
        case CollectiblesTabIndex:
            CollectiblesView.Viewed();
            // End:0x15E
            break;
        // End:0x12D
        case MusicTabIndex:
            MusicPlayerView.Viewed();
            // End:0x15E
            break;
        // End:0x15B
        case EquipmentTabIndex:
            EquipmentView.Viewed();
            // End:0x15E
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function PlayVideoMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL inMsg[8388609];

    bLaunchVideoMessage = true;
    PendingVideoMessageInfo = inMsg;
    CancelJobLog();
    //return;    
}

function CancelJobLog()
{
    local /*0x97E50000-0x00000000*/ private bool bForceImmediateCancel[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    false
    // End:0x14
    if(bClosing)
    {
        return;
    }
    bClosing = true;
    LPPC = LPPlayerController(GetPC());
    // End:0x8F
    if((LPPC != none) && LPPC.bIsInVitalSuit)
    {
        LPPC.ShutdownPausedSubtitlesAndAudioTimer();
    }
    // End:0xBD
    if(bForceImmediateCancel)
    {
        SaveState();
        JobLogOutroComplete();
        StopJobLogEffects();        
    }
    else
    {
        // End:0xED
        if(LPPC != none)
        {
            LPPC.bOpenJobLogToAutopilot = false;
        }
        GoToOutro();
        SaveState();
    }
    PlaySoundFromTheme('CloseJobLog');
    //return;    
}

function JobLogOutroComplete()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    EndSPGFxMoviePlayer();
    LPPC = LPPlayerController(GetPC());
    LPPC.myLPHUD.SetVSJobLogFocused(false);
    // End:0xBA
    if(bLaunchVideoMessage)
    {
        bLaunchVideoMessage = false;
        // End:0xBA
        if(PendingVideoMessageInfo.MovieStreamFilename != "")
        {
            PendingVideoMessageInfo.Play();
        }
    }
    //return;    
}

function SetTitleText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string newText[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL View[8388609], CurrentViewWidget;

    CurrentViewWidget = Tabs[CurrentTabIndex].TabView;
    // End:0x49
    if(View != CurrentViewWidget)
    {
        return;
    }
    JobLog.ActionScriptVoid("SetTitleText");
    //return;    
}

function GoToIntro()
{
    JobLog.ActionScriptVoid("GoToIntro");
    //return;    
}

function GoToVSIntro()
{
    JobLog.ActionScriptVoid("GoToIntro_VSMode");
    //return;    
}

function GoToOutro()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x41
    if(bVSMode)
    {
        JobLog.ActionScriptVoid("GoToOutro_VSMode");        
    }
    else
    {
        JobLog.ActionScriptVoid("GoToOutro");
    }
    LPPC = LPPlayerController(GetPC());
    // End:0x118
    if(LPPC != none)
    {
        // End:0x118
        if(LPPC.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerJobLog'))
        {
            LPPC.MySPPawn.BroadcastSMMessageToAll(0, Class'LPSMMTypes'.default.SMM_PlayJobLogOutro);
        }
    }
    //return;    
}

event OnClose()
{
    // End:0x2F
    if(ContractsMapView != none)
    {
        ContractsMapView.Cleanup(self);
    }
    // End:0x5E
    if(MessagesView != none)
    {
        MessagesView.Cleanup(self);
    }
    // End:0x8D
    if(CollectiblesView != none)
    {
        CollectiblesView.Cleanup(self);
    }
    // End:0xBC
    if(MusicPlayerView != none)
    {
        MusicPlayerView.Cleanup(self);
    }
    // End:0xEB
    if(EquipmentView != none)
    {
        EquipmentView.Cleanup(self);
    }
    super.OnClose();
    //return;    
}

function EndSPGFxMoviePlayer()
{
    super.EndSPGFxMoviePlayer();    
    GetPC().ConsoleCommand("HideLPHUD 0");
    CleanUpJobLogLoopingSound();
    LPPlayerController(GetPC()).myLPHUD.SleepHUDMessage(false);
    //return;    
}

function SaveState()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(GetPC());
    LPPC.JobLogInfo.TabIndex = CurrentTabIndex;
    // End:0xB4
    if((ContractsMapView != none) && !Tabs[ContractsTabIndex].bDisabled)
    {
        ContractsMapView.SaveState();
    }
    // End:0x110
    if((MissionsView != none) && !Tabs[MissionsTabIndex].bDisabled)
    {
        MissionsView.SaveState();
    }
    // End:0x16C
    if((MessagesView != none) && !Tabs[MessagesTabIndex].bDisabled)
    {
        MessagesView.SaveState();
    }
    // End:0x1C8
    if((CollectiblesView != none) && !Tabs[CollectiblesTabIndex].bDisabled)
    {
        CollectiblesView.SaveState();
    }
    // End:0x224
    if((MusicPlayerView != none) && !Tabs[MusicTabIndex].bDisabled)
    {
        MusicPlayerView.SaveState();
    }
    // End:0x280
    if((EquipmentView != none) && !Tabs[EquipmentTabIndex].bDisabled)
    {
        EquipmentView.SaveState();
    }
    //return;    
}

delegate MessageSortDelegate()
{
    //return;    
}

function SetMessageSortDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL _global;

    _global = GetVariableObject("_global");
    ActionScriptSetFunction(_global, "MessagesSorted");
    //return;    
}

delegate PanelContractsStateChangedDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string NewState[8388609];

    //return;    
}

function SetPanelContractsStateChangedDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL _global;

    _global = GetVariableObject("_global");
    ActionScriptSetFunction(_global, "PanelContractsStateChanged");
    //return;    
}

delegate ToggleMapStateDelegate()
{
    local /*0x97E50000-0x00000000*/ private bool bDisplayingWorldMap[8388609];

    //return;    
}

function SetToggleMapStateDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL _global;

    _global = GetVariableObject("_global");
    ActionScriptSetFunction(_global, "ToggleMapState");
    //return;    
}

delegate SetCurrentCollectibleDelegate()
{
    local /*0x97E50000-0x00000000*/ private int CollectibleSlotNum[8388609], CollectibleIndex;

    //return;    
}

function SetSetCurrentCollectibleDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL _global;

    _global = GetVariableObject("_global");
    ActionScriptSetFunction(_global, "SetCurrentCollectible");
    //return;    
}

delegate SetCurrentEquipmentCollectibleDelegate()
{
    local /*0x97E50000-0x00000000*/ private int CollectibleSlotNum[8388609], CollectibleIndex;

    //return;    
}

function SetSetCurrentEquipmentCollectibleDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL _global;

    _global = GetVariableObject("_global");
    ActionScriptSetFunction(_global, "SetCurrentEquipmentCollectible");
    //return;    
}

delegate ActivateCurrentCollectibleDelegate()
{
    local /*0x97E50000-0x00000000*/ private int CollectibleSlotNum[8388609], CollectibleIndex;

    //return;    
}

function SetActivateCurrentCollectibleDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL _global;

    _global = GetVariableObject("_global");
    ActionScriptSetFunction(_global, "ActivateCurrentCollectible");
    //return;    
}

delegate SetCurrentLoadoutDelegate()
{
    local /*0x97E50000-0x00000000*/ private int LoadoutSlotNum[8388609], LoadoutIndex;

    //return;    
}

function SetSetCurrentLoadoutDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL _global;

    _global = GetVariableObject("_global");
    ActionScriptSetFunction(_global, "SetCurrentLoadout");
    //return;    
}

delegate ActivateCurrentLoadoutDelegate()
{
    local /*0x97E50000-0x00000000*/ private int LoadoutSlotNum[8388609], LoadoutIndex;

    //return;    
}

function SetActivateCurrentLoadoutDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL _global;

    _global = GetVariableObject("_global");
    ActionScriptSetFunction(_global, "ActivateCurrentLoadout");
    //return;    
}

delegate SetContractsButtonLegendDelegate()
{
    local /*0x97E50000-0x00000000*/ private bool bSlideListActive[8388609], bDisplayingWorldMap, bFastTravelMode;

    //return;    
}

function SetSetContractsButtonLegendDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL _global;

    _global = GetVariableObject("_global");
    ActionScriptSetFunction(_global, "SetContractsButtonLegend");
    //return;    
}

delegate SetMissionsButtonLegendDelegate()
{
    //return;    
}

function SetSetMissionsButtonLegendDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL _global;

    _global = GetVariableObject("_global");
    ActionScriptSetFunction(_global, "SetMissionsButtonLegend");
    //return;    
}

delegate SetMessagesButtonLegendDelegate()
{
    //return;    
}

function SetSetMessagesButtonLegendDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL _global;

    _global = GetVariableObject("_global");
    ActionScriptSetFunction(_global, "SetMessagesButtonLegend");
    //return;    
}

delegate SetCollectiblesButtonLegendDelegate()
{
    local /*0x97E50000-0x00000000*/ private bool bAudioPlay[8388609];

    //return;    
}

function SetSetCollectiblesButtonLegendDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL _global;

    _global = GetVariableObject("_global");
    ActionScriptSetFunction(_global, "SetCollectiblesButtonLegend");
    //return;    
}

delegate SetMusicButtonLegendDelegate()
{
    //return;    
}

function SetSetMusicButtonLegendDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL _global;

    _global = GetVariableObject("_global");
    ActionScriptSetFunction(_global, "SetMusicButtonLegend");
    //return;    
}

delegate SetEquipmentButtonLegendDelegate()
{
    //return;    
}

function SetSetEquipmentButtonLegendDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL _global;

    _global = GetVariableObject("_global");
    ActionScriptSetFunction(_global, "SetEquipmentButtonLegend");
    //return;    
}

function StartJobLogEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(GetPC());
    // End:0x4B
    if(LPPC != none)
    {
        LPPC.StartJobLogEffects();
    }
    //return;    
}

function StopJobLogEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(GetPC());
    // End:0x4B
    if(LPPC != none)
    {
        LPPC.StopJobLogEffects();
    }
    //return;    
}

function SetButtonLegendLabelStrings()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string s1[8388609], s2, s3, s4, s5, s6;

    local /*0x97E50000-0x00000000*/ private @NULL View[8388609], CurrentViewWidget;

    CurrentViewWidget = Tabs[CurrentTabIndex].TabView;
    // End:0x49
    if(View != CurrentViewWidget)
    {
        return;
    }
    // End:0x8B
    if(ButtonLegendLabel1 != none)
    {
        ButtonLegendLabel1.SetText(GetLocalizedString(s1));
    }
    // End:0xCD
    if(ButtonLegendLabel2 != none)
    {
        ButtonLegendLabel2.SetText(GetLocalizedString(s2));
    }
    // End:0x10F
    if(ButtonLegendLabel3 != none)
    {
        ButtonLegendLabel3.SetText(GetLocalizedString(s3));
    }
    // End:0x151
    if(ButtonLegendLabel4 != none)
    {
        ButtonLegendLabel4.SetText(GetLocalizedString(s4));
    }
    // End:0x193
    if(ButtonLegendLabel5 != none)
    {
        ButtonLegendLabel5.SetText(GetLocalizedString(s5));
    }
    // End:0x1D5
    if(ButtonLegendLabel6 != none)
    {
        ButtonLegendLabel6.SetText(GetLocalizedString(s6));
    }
    //return;    
}

function PressLabel1()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentViewWidget;

    CurrentViewWidget = Tabs[CurrentTabIndex].TabView;
    // End:0xD8
    if(CurrentViewWidget != none)
    {
        // End:0x59
        if(CurrentViewWidget == ContractsMapView)
        {            
        }
        else
        {
            // End:0x73
            if(CurrentViewWidget == MissionsView)
            {                
            }
            else
            {
                // End:0x8D
                if(CurrentViewWidget == MusicPlayerView)
                {                    
                }
                else
                {
                    // End:0xA7
                    if(CurrentViewWidget == CollectiblesView)
                    {                        
                    }
                    else
                    {
                        // End:0xC1
                        if(CurrentViewWidget == EquipmentView)
                        {                            
                        }
                        else
                        {
                            // End:0xD8
                            if(CurrentViewWidget == MessagesView)
                            {
                            }
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function PressLabel2()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentViewWidget;

    CurrentViewWidget = Tabs[CurrentTabIndex].TabView;
    // End:0x140
    if(CurrentViewWidget != none)
    {
        // End:0x78
        if(CurrentViewWidget == ContractsMapView)
        {
            ContractsMapView.PressLabel2();            
        }
        else
        {
            // End:0x92
            if(CurrentViewWidget == MissionsView)
            {                
            }
            else
            {
                // End:0xCB
                if(CurrentViewWidget == MusicPlayerView)
                {
                    MusicPlayerView.Sort();                    
                }
                else
                {
                    // End:0xE5
                    if(CurrentViewWidget == CollectiblesView)
                    {                        
                    }
                    else
                    {
                        // End:0x10A
                        if(CurrentViewWidget == EquipmentView)
                        {
                            CancelJobLog();                            
                        }
                        else
                        {
                            // End:0x140
                            if(CurrentViewWidget == MessagesView)
                            {
                                MessagesView.Sort();
                            }
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function PressLabel3()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentViewWidget;

    CurrentViewWidget = Tabs[CurrentTabIndex].TabView;
    // End:0x140
    if(CurrentViewWidget != none)
    {
        // End:0x78
        if(CurrentViewWidget == ContractsMapView)
        {
            ContractsMapView.PressLabel3();            
        }
        else
        {
            // End:0x92
            if(CurrentViewWidget == MissionsView)
            {                
            }
            else
            {
                // End:0xCB
                if(CurrentViewWidget == MusicPlayerView)
                {
                    MusicPlayerView.Play();                    
                }
                else
                {
                    // End:0xF0
                    if(CurrentViewWidget == CollectiblesView)
                    {
                        CancelJobLog();                        
                    }
                    else
                    {
                        // End:0x10A
                        if(CurrentViewWidget == EquipmentView)
                        {                            
                        }
                        else
                        {
                            // End:0x140
                            if(CurrentViewWidget == MessagesView)
                            {
                                MessagesView.Play();
                            }
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function PressLabel4()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentViewWidget;

    CurrentViewWidget = Tabs[CurrentTabIndex].TabView;
    // End:0x10D
    if(CurrentViewWidget != none)
    {
        // End:0x78
        if(CurrentViewWidget == ContractsMapView)
        {
            ContractsMapView.PressLabel4();            
        }
        else
        {
            // End:0x92
            if(CurrentViewWidget == MissionsView)
            {                
            }
            else
            {
                // End:0xB7
                if(CurrentViewWidget == MusicPlayerView)
                {
                    CancelJobLog();                    
                }
                else
                {
                    // End:0xD1
                    if(CurrentViewWidget == CollectiblesView)
                    {                        
                    }
                    else
                    {
                        // End:0xEB
                        if(CurrentViewWidget == EquipmentView)
                        {                            
                        }
                        else
                        {
                            // End:0x10D
                            if(CurrentViewWidget == MessagesView)
                            {
                                CancelJobLog();
                            }
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function PressLabel5()
{
    //return;    
}

function IsCurrentJoblogViewIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float SelectedIndex;

    // End:0x62
    if(JobLogButtonBar != none)
    {
        SelectedIndex = JobLogButtonBar.GetFloat("selectedIndex");
        // End:0x62
        if(int(SelectedIndex) == Index)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function PostWidgetInit()
{
    // End:0x2E
    if(ContractsMapView != none)
    {
        ContractsMapView.PostWidgetInit();
    }
    //return;    
}

function ASRepositionButtonPrompts()
{
    // End:0x0F
    if(bClosing)
    {
        return;
    }
    ActionScriptVoid("repositionButtonPrompts");
    //return;    
}

defaultproperties
{
    Tabs=/* Array type was not detected. */
    ImageSubstitutions=/* Array type was not detected. */
    CaptureKeys=/* Array type was not detected. */
    SceneDPG=ESceneDepthPriorityGroup.SDPG_World
    Priority=10
    WidgetBindings=/* Array type was not detected. */
}