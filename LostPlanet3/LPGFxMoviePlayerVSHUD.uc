class LPGFxMoviePlayerVSHUD extends SPGFxMoviePlayerHUD
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HUD;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVideoMessagePlaying;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVideoMessageAttached;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VideoMessageBinkTexture;

// Export ULPGFxMoviePlayerVSHUD::execGetFormattedTemperatureString(FFrame&, void* const)
native function GetFormattedTemperatureString()
{
    local /*0x97E50000-0x00000000*/ private float temperature[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL Player[9437185];

    super.Init(Player);
    HUD = LPHUD(GetPC().myHUD);
    //return;    
}

function GetVSPlayerPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], PC;

    PC = LPPlayerController(HUD.PlayerOwner);
    // End:0x68
    if(PC != none)
    {
        return LPVSPlayerPawn(PC.Pawn);
    }
    return none;
    //return ReturnValue;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Update(DeltaTime);
    // End:0xA8
    if(VideoMessageBinkTexture != none)
    {
        // End:0xA8
        if(bVideoMessagePlaying)
        {
            // End:0x9E
            if(TextureMovie(VideoMessageBinkTexture).IsPlaying())
            {
                // End:0x9B
                if(!TextureMovie(VideoMessageBinkTexture).bWaitingForAsyncOpenToFinish)
                {
                    AttachVideoMessage(GetVSPlayerPawn());
                }                
            }
            else
            {
                VideoCompleted();
            }
        }
    }
    //return;    
}

function SetVSMinimapZoom()
{
    local /*0x97E50000-0x00000000*/ private float zoom[8388609];

    //return;    
}

function HideVSHUD()
{
    local /*0x97E50000-0x00000000*/ private bool bHide[8388609];

    //return;    
}

function ShowVSBootSequence()
{
    local /*0x97E50000-0x00000000*/ private bool bHide[9437185];

    true
    //return;    
}

function HydraulicPressureHidden()
{
    //return;    
}

function GrabOnInstanced()
{
    local /*0x97E50000-0x00000000*/ private int startFrame[8388609], endFrame;

    //return;    
}

function TextCountInstanced()
{
    //return;    
}

function ReadyForDepletion()
{
    //return;    
}

function SetTemperatureInstrumentDamage()
{
    //return;    
}

function ClearTemperatureInstrumentDamage()
{
    //return;    
}

function SetMinimapInstrumentDamage()
{
    //return;    
}

function ClearMinimapInstrumentDamage()
{
    //return;    
}

function registerMiniMapView()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string clipName[8388609];
    local /*0x97E50000-0x00000000*/ private float R[8388609];

    //return;    
}

function ShowHullIntegrity()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bRepairing;

    //return;    
}

function VSHullStatusOutroComplete()
{
    //return;    
}

function OpenVSEnvironmentalMessage()
{
    local /*0x97E50000-0x00000000*/ private byte MessageType[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageText[8388609], SecondaryMessageText;

    //return;    
}

function CloseVSEnvironmentalMessage()
{
    //return;    
}

function AbortVSEnvironmentalMessage()
{
    //return;    
}

function VSMessageHidden()
{
    //return;    
}

function IsVSEnvironmentalMessageDone()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ShowIncomingMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    //return;    
}

function ClickIncomingMessage()
{
    //return;    
}

function IncomingMessageHidden()
{
    //return;    
}

function ShowRadioMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    //return;    
}

function EnableDrillSpinDisplay()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    //return;    
}

function EnableDrillSwingDisplay()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    //return;    
}

function DrillIconHidden()
{
    //return;    
}

function ShowVSDash()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    //return;    
}

function SetCurrentMapDisplayIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];

    //return;    
}

function IsRadarShowingEnemies()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function ToggleVSDisplayState()
{
    local /*0x97E50000-0x00000000*/ private bool bIsInVS[8388609], bFutureVS;
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[9437185], VSP;

    false
    none
    // End:0x23
    if(bFutureVS)
    {
        bIsInVS = false;
    }
    SetActive(bIsInVS);
    SetPause(!bIsInVS);
    // End:0xB2
    if(bVideoMessagePlaying)
    {
        VideoCompleted();
        // End:0xB2
        if(vsPawn != none)
        {
            VSP = LPVSPlayerPawn(vsPawn);
            // End:0xB2
            if(VSP != none)
            {
                DetachVideoMessage(VSP);
            }
        }
    }
    //return;    
}

function ShowVideoMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MovieStreamFilename[9437185];

    bVideoMessagePlaying = bShow;
    // End:0xAD
    if(bShow)
    {
        // End:0x73
        if(MovieStreamFilename != "")
        {
            // End:0x73
            if(VideoMessageBinkTexture != none)
            {
                TextureMovie(VideoMessageBinkTexture).MovieStreamFilename = MovieStreamFilename;
            }
        }
        // End:0xAA
        if(VideoMessageBinkTexture != none)
        {
            TextureMovie(VideoMessageBinkTexture).Play();
        }        
    }
    else
    {
        DetachVideoMessage(GetVSPlayerPawn());
        TextureMovie(VideoMessageBinkTexture).Stop();
    }
    //return;    
}

function PauseVideoMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x7C
    if(bVideoMessagePlaying)
    {
        // End:0x7C
        if(VideoMessageBinkTexture != none)
        {
            // End:0x54
            if(bPause)
            {
                TextureMovie(VideoMessageBinkTexture).Pause();                
            }
            else
            {
                TextureMovie(VideoMessageBinkTexture).Play();
            }
        }
    }
    //return;    
}

function VideoMessageEnded()
{
    HUD.VideoMessageEnded();
    //return;    
}

function VideoCompleted()
{
    LPHUD(myHUD).VideoCompleted();
    //return;    
}

function AttachVideoMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVS[8388609];

    // End:0x49
    if(!bVideoMessageAttached)
    {
        // End:0x49
        if(InVS != none)
        {
            InVS.AttachVideoPlayerComponent();
            bVideoMessageAttached = true;
        }
    }
    //return;    
}

function DetachVideoMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVS[8388609];

    // End:0x47
    if(bVideoMessageAttached)
    {
        // End:0x47
        if(InVS != none)
        {
            InVS.DetachVideoPlayerComponent();
            bVideoMessageAttached = false;
        }
    }
    //return;    
}
