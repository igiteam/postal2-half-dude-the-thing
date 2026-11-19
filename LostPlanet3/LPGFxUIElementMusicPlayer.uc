class LPGFxUIElementMusicPlayer extends LPGFxUIElement;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RigMusicClusterMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MusicClusterMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MusicInfoMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ArtistTextField;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TrackTextField;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PendingDpadButtonIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPendingDpadIsNotAllowed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplayCluster;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplayText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTextIsShown;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OutroComplete__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __IntroComplete__Delegate;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    PendingDpadButtonIndex = -1;
    bPendingDpadIsNotAllowed = false;
    // End:0x1DB
    if(MoviePlayer != none)
    {
        RigMusicClusterMC = MoviePlayer.GetVariableObject("_root.stagePanel.panel_rigMusicCluster.rigMusicCluster");
        // End:0x1DB
        if(RigMusicClusterMC != none)
        {
            MusicClusterMC = RigMusicClusterMC.GetObject("musicCluster");
            MusicInfoMC = RigMusicClusterMC.GetObject("musicInfo");
            // End:0x1DB
            if(MusicInfoMC != none)
            {
                ArtistTextField = MusicInfoMC.GetObject("labelArtist").GetObject("textField");
                TrackTextField = MusicInfoMC.GetObject("labelTrack").GetObject("textField");
            }
        }
    }
    SetOnOutroComplete(OutroComplete);
    SetOnIntroComplete(IntroComplete);
    //return;    
}

function ShowMusicPlayer()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private int dpadButtonIndex[9437185];
    local /*0x97E50000-0x00000000*/ private bool bIsNotAllowed[9437185], bSongInfoOnly;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    -1
    false
    false
    // End:0x191
    if(bShow)
    {
        // End:0x3C
        if(bSongInfoOnly)
        {
            bDisplayCluster = false;            
        }
        else
        {
            bDisplayCluster = true;
        }
        // End:0xCE
        if(bIsNotAllowed)
        {
            LPPC = GetLPPC();
            // End:0xCB
            if(LPPC != none)
            {
                bDisplayText = !LPPC.IsAllowedToPlayMusicPlayer(LPVSPlayerPawn(LPPC.Pawn));
            }            
        }
        else
        {
            bDisplayText = true;
        }
        // End:0xF4
        if(bDisplayText)
        {
            SetMusicInfoLabels();            
        }
        else
        {
            ClearMusicInfoLabels();
        }
        // End:0x176
        if(bDisplayCluster)
        {
            // End:0x14B
            if(IsActive())
            {
                // End:0x148
                if(dpadButtonIndex != -1)
                {
                    ShowDpadButton(dpadButtonIndex, bIsNotAllowed);
                }                
            }
            else
            {
                PendingDpadButtonIndex = dpadButtonIndex;
                bPendingDpadIsNotAllowed = bIsNotAllowed;
            }            
        }
        else
        {
            PendingDpadButtonIndex = -1;
            bPendingDpadIsNotAllowed = false;
        }
    }
    SetActive(bShow);
    //return;    
}

function ShowDpadButton()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsNotAllowed[9437185];

    false
    // End:0x12
    if(bIsNotAllowed)
    {
    }
    switch(Index)
    {
        // End:0x40
        case 0:
            ASMusicClusterPlay(bIsNotAllowed);
            // End:0xB2
            break;
        // End:0x5B
        case 1:
            ASMusicClusterNext(bIsNotAllowed);
            // End:0xB2
            break;
        // End:0x77
        case 2:
            ASMusicClusterStop(bIsNotAllowed);
            // End:0xB2
            break;
        // End:0x93
        case 3:
            ASMusicClusterPrev(bIsNotAllowed);
            // End:0xB2
            break;
        // End:0xAF
        case 4:
            ASMusicClusterPause(bIsNotAllowed);
            // End:0xB2
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function ASMusicClusterPlay()
{
    local /*0x97E50000-0x00000000*/ private bool bIsNotAllowed[8388609];

    MusicClusterMC.ActionScriptVoid("GoToPlay");
    //return;    
}

function ASMusicClusterNext()
{
    local /*0x97E50000-0x00000000*/ private bool bIsNotAllowed[8388609];

    MusicClusterMC.ActionScriptVoid("GoToNext");
    //return;    
}

function ASMusicClusterStop()
{
    local /*0x97E50000-0x00000000*/ private bool bIsNotAllowed[8388609];

    MusicClusterMC.ActionScriptVoid("GoToStop");
    //return;    
}

function ASMusicClusterPrev()
{
    local /*0x97E50000-0x00000000*/ private bool bIsNotAllowed[8388609];

    MusicClusterMC.ActionScriptVoid("GoToPrev");
    //return;    
}

function ASMusicClusterPause()
{
    local /*0x97E50000-0x00000000*/ private bool bIsNotAllowed[8388609];

    MusicClusterMC.ActionScriptVoid("GoToPause");
    //return;    
}

function SetMusicInfoLabels()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ArtistString, TrackString;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, CurrentTrackInfo;

    LPPC = GetLPPC();
    // End:0x98
    if(LPPC != none)
    {
        CurrentTrackInfo = LPPC.GetCurrentVSMusicPlayerTrack();
        ArtistString = CurrentTrackInfo.Artist;
        TrackString = CurrentTrackInfo.Title;
    }
    // End:0xD0
    if(ArtistTextField != none)
    {
        ArtistTextField.SetText(ArtistString);
    }
    // End:0x108
    if(TrackTextField != none)
    {
        TrackTextField.SetText(TrackString);
    }
    //return;    
}

function ClearMusicInfoLabels()
{
    // End:0x31
    if(ArtistTextField != none)
    {
        ArtistTextField.SetText("");
    }
    // End:0x62
    if(TrackTextField != none)
    {
        TrackTextField.SetText("");
    }
    //return;    
}

function ShowText()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x4E
    if(bShow)
    {
        // End:0x4B
        if(!bTextIsShown)
        {
            bTextIsShown = true;
            MusicInfoMC.GotoAndPlay("on");
        }        
    }
    else
    {
        MusicInfoMC.GotoAndPlay("off");
        bTextIsShown = false;
    }
    //return;    
}

delegate OutroComplete()
{
    // End:0x19
    if(bPendingInactive)
    {
        SetActive(false, true);
    }
    //return;    
}

delegate IntroComplete()
{
    // End:0x4B
    if(PendingDpadButtonIndex != -1)
    {
        ShowDpadButton(PendingDpadButtonIndex, bPendingDpadIsNotAllowed);
        PendingDpadButtonIndex = -1;
        bPendingDpadIsNotAllowed = false;
    }
    //return;    
}

function SetOnOutroComplete()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> F[8388609];

    // End:0x42
    if(MusicClusterMC != none)
    {
        MusicClusterMC.ActionScriptSetFunction("OutroCompleteEvent");
    }
    //return;    
}

function SetOnIntroComplete()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> F[8388609];

    // End:0x42
    if(MusicClusterMC != none)
    {
        MusicClusterMC.ActionScriptSetFunction("IntroCompleteEvent");
    }
    //return;    
}

function SetActive()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609], bImmediate;

    // End:0x4A
    if(bSet || bImmediate)
    {
        bPendingInactive = false;
        super(SPGFxUIElement).SetActive(bSet, bImmediate);        
    }
    else
    {
        bPendingInactive = true;
        Show(bSet, bImmediate);
    }
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bShouldBeActive;

    bShouldBeActive = super(SPGFxUIElement).Update(DeltaTime);
    // End:0x2B
    if(bShouldBeActive)
    {
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x23B
    if(RigMusicClusterMC != none)
    {
        // End:0x14D
        if(bShow)
        {
            DI = RigMusicClusterMC.GetDisplayInfo();
            DI.Visible = bShow;
            RigMusicClusterMC.SetDisplayInfo(DI);
            DI = MusicClusterMC.GetDisplayInfo();
            DI.Visible = bDisplayCluster;
            MusicClusterMC.SetDisplayInfo(DI);
            // End:0x132
            if(bDisplayCluster)
            {
                GoToIntro();
                ShouldDisplayOutro = true;
            }
            // End:0x14A
            if(bDisplayText)
            {
                ShowText(true);
            }            
        }
        else
        {
            // End:0x185
            if(!bImmediate && ShouldDisplayOutro)
            {
                // End:0x182
                if(bDisplayCluster)
                {
                    GoToOutro();
                }                
            }
            else
            {
                DI = RigMusicClusterMC.GetDisplayInfo();
                DI.Visible = bShow;
                RigMusicClusterMC.SetDisplayInfo(DI);
                // End:0x217
                if(bPendingInactive)
                {
                    SetActive(false, true);
                }
            }
            ShouldDisplayOutro = false;
            // End:0x23B
            if(bDisplayText)
            {
                ShowText(false);
            }
        }
    }
    //return;    
}

function GoToIntro()
{
    // End:0x11
    if(MusicClusterMC == none)
    {
        return;
    }
    // End:0x4B
    if(ShouldDisplayOutro == false)
    {
        MusicClusterMC.ActionScriptVoid("GoToIntro");
    }
    //return;    
}

function GoToOutro()
{
    // End:0x11
    if(MusicClusterMC == none)
    {
        return;
    }
    MusicClusterMC.ActionScriptVoid("GoToOutro");
    MusicInfoMC.GotoAndPlay("off");
    //return;    
}
