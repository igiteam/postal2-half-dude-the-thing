class LPGFxJobLogMusicPlayerView extends GFxObject within GFxMoviePlayer;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MusicPlayerList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MusicPlayerTextArea;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PlaylistItems;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL JobLogMP;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentListIndex[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentListType[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bViewed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int InitialItemIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MyTabIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DisabledGameMusicListIndex[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DisabledUserMusicListIndex[536870913];

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL JLMP[8388609];
    local /*0x97E50000-0x00000000*/ private int TabIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    InitialItemIndex = LPPC.JobLogInfo.MusicPlayerRecord.ListSelectedIndex;
    // End:0x9A
    if(InitialItemIndex < 0)
    {
        InitialItemIndex = 0;
    }
    MyTabIndex = TabIndex;
    JobLogMP = JLMP;
    JLMP.SetSetMusicButtonLegendDelegate(SetMusicButtonLegend);
    //return;    
}

function Cleanup()
{
    local /*0x97E50000-0x00000000*/ private @NULL JLMP[8388609];

    Class'SPEngine.SPAkMusicPlayer'.static.GetMusicPlayerNative().bAllowPlaybackOnGamePause = false;
    JLMP.SetSetMusicButtonLegendDelegate(None);
    //return;    
}

function SaveState()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0xB6
    if(MusicPlayerList != none)
    {
        LPPC.JobLogInfo.MusicPlayerRecord.ListSelectedIndex = int(MusicPlayerList.GetFloat("selectedIndex"));
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
        // End:0x81
        case 'MusicHeader':
            Widget.SetText("<Strings:LostPlanetGame.JobLog.SelectMusicSource>");
            // End:0x171
            break;
        // End:0xA3
        case 'musicBodyTextArea':
            MusicPlayerTextArea = Widget;
            // End:0x171
            break;
        // End:0x15F
        case 'MusicPlayerList':
            // End:0x15C
            if(MusicPlayerList == none)
            {
                MusicPlayerList = GFxClikWidget(Widget);
                UpdateMusicListDataProvider();
                MusicPlayerList.AddEventListener('CLIK_change', OnListChange);
                MusicPlayerList.AddEventListener('CLIK_itemPress', OnListItemPress);
            }
            // End:0x171
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x171
            break;
            break;
    }
    // End:0x1B0
    if(!bWasHandled)
    {
        bWasHandled = super.WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

function UpdateMusicListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int I, CurrentPlayListIdx;
    local /*0x97E50000-0x00000000*/ private @NULL DataProvider, TempObj;
    local /*0x97E50000-0x00000000*/ private bool bItemFound;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private editfixedsize array PlaylistList;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Playlist;

    DataProvider = Outer.CreateArray();
    PlaylistItems.Length = 0;
    CurrentPlayListIdx = 0;
    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x5C9
    if(LPPC != none)
    {
        // End:0x211
        if(!LPPC.IsVSGameMusicDisabled())
        {
            DisabledGameMusicListIndex = -1;
            // End:0x20E
            if(LPPC.GetVSPlaylistList(byte(CurrentListType), PlaylistList, true, false))
            {
                I = 0;
                J0xF7:

                // End:0x20E [Loop If]
                if(I < PlaylistList.Length)
                {
                    Playlist = PlaylistList[I];
                    TempObj = Outer.CreateObject("Object");
                    TempObj.SetString("label", Playlist.Name);
                    DataProvider.SetElementObject(CurrentPlayListIdx, TempObj);
                    PlaylistItems.AddItem(Playlist);                    
                    CurrentPlayListIdx++;
                    bItemFound = true;
                    I++;
                    // [Loop Continue]
                    goto J0xF7;
                }
            }            
        }
        else
        {
            DisabledGameMusicListIndex = CurrentPlayListIdx;
            TempObj = Outer.CreateObject("Object");
            TempObj.SetString("label", JobLogMP.GetLocalizedString("<Strings:LostPlanetGame.JobLog.VSGameMusicTrackDisabled>"));
            DataProvider.SetElementObject(CurrentPlayListIdx, TempObj);
            CurrentPlayListIdx++;
            bItemFound = true;
        }
        PlaylistList.Length = 0;
        // End:0x4BB
        if(!LPPC.IsVSUserMusicDisabled())
        {
            DisabledUserMusicListIndex = -1;
            // End:0x4B8
            if(LPPC.GetVSPlaylistList(byte(CurrentListType), PlaylistList, false, true))
            {
                I = 0;
                J0x3A1:

                // End:0x4B8 [Loop If]
                if(I < PlaylistList.Length)
                {
                    Playlist = PlaylistList[I];
                    TempObj = Outer.CreateObject("Object");
                    TempObj.SetString("label", Playlist.Name);
                    DataProvider.SetElementObject(CurrentPlayListIdx, TempObj);
                    PlaylistItems.AddItem(Playlist);                    
                    CurrentPlayListIdx++;
                    bItemFound = true;
                    I++;
                    // [Loop Continue]
                    goto J0x3A1;
                }
            }            
        }
        else
        {
            DisabledUserMusicListIndex = CurrentPlayListIdx;
            TempObj = Outer.CreateObject("Object");
            TempObj.SetString("label", JobLogMP.GetLocalizedString("<Strings:LostPlanetGame.JobLog.VSUserMusicTrackDisabled>"));
            DataProvider.SetElementObject(CurrentPlayListIdx, TempObj);
            CurrentPlayListIdx++;
            bItemFound = true;
        }
    }
    // End:0x6A0
    if(MusicPlayerList != none)
    {
        MusicPlayerList.SetFloat("selectedIndex", float(((InitialItemIndex < 0) ? 0 : InitialItemIndex)));
        MusicPlayerList.SetObject("dataProvider", DataProvider);
        MusicPlayerList.SetString("wrapping", ((bItemFound) ? "wrap" : "normal"));
    }
    //return;    
}

function ToggleListType()
{
    // End:0x1D
    if(++CurrentListType >= 3)
    {
        CurrentListType = 0;
    }
    SetMusicButtonLegend();
    UpdateMusicListDataProvider();
    //return;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private int ListIndex;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x90
    if((LPPC != none) && LPPC.IsMoveInputIgnored())
    {
        Outer.PlaySoundFromTheme('AudioLog_Busy');
        return;
    }
    ListIndex = ev.Index;
    PlayItem(ListIndex);
    //return;    
}

function OnListChange()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    CurrentListIndex = ev.Index;
    JobLogMP.PlaySoundFromTheme('Select');
    //return;    
}

function PlayItem()
{
    local /*0x97E50000-0x00000000*/ private int ListIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x178
    if(LPPC != none)
    {
        // End:0x178
        if((ListIndex != DisabledGameMusicListIndex) && ListIndex != DisabledUserMusicListIndex)
        {
            // End:0x178
            if((ListIndex >= 0) && ListIndex < PlaylistItems.Length)
            {
                PlaylistItems[ListIndex].bRepeatList = true;
                // End:0x178
                if(LPPC.SetCurrentVSPlaylist(PlaylistItems[ListIndex]))
                {
                    Class'SPEngine.SPAkMusicPlayer'.static.GetMusicPlayerNative().bAllowPlaybackOnGamePause = true;
                    Outer.PlaySoundFromTheme('PlayMusic');
                    LPPC.MusicPlayerStart();
                }
            }
        }
    }
    //return;    
}

function Sort()
{
    ToggleListType();
    //return;    
}

function Play()
{
    PlayItem(CurrentListIndex);
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval;

    Retval = false;
    // End:0x8F
    if(int(InputEvent) == int(0))
    {
        // End:0x8F
        if((ButtonName == 'XboxTypeS_Y') || ButtonName == 'T')
        {
            Outer.PlaySoundFromTheme('MusicPlayerShowAlbum');
            ToggleListType();
            Retval = true;
        }
    }
    return Retval;
    //return ReturnValue;    
}

function SetMusicButtonLegend()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string s1, s2, s3, s4, s5, s6;

    s1 = "";
    s2 = "";
    switch(CurrentListType)
    {
        // End:0x68
        case 0:
            s3 = "<Strings:LostPlanetGame.JobLog.ShowAlbums>";
            // End:0xEF
            break;
        // End:0xAB
        case 1:
            s3 = "<Strings:LostPlanetGame.JobLog.ShowAlbumArtists>";
            // End:0xEF
            break;
        // End:0xEC
        case 2:
            s3 = "<Strings:LostPlanetGame.JobLog.ShowPlaylists>";
            // End:0xEF
            break;
        // End:0xFFFF
        default:
            break;
    }
    s4 = "<Strings:LostPlanetGame.JobLog.Play>";
    s5 = "<Strings:LostPlanetGame.UI.ButtonBack>";
    s6 = "";
    JobLogMP.SetButtonLegendLabelStrings(s1, s2, s3, s4, s5, s6, self);
    JobLogMP.ASRepositionButtonPrompts();
    JobLogMP.SetTitleText(JobLogMP.GetLocalizedString("<Strings:LostPlanetGame.JobLog.Music>"), self);
    //return;    
}

function Viewed()
{
    bViewed = true;
    SetMusicButtonLegend();
    //return;    
}

defaultproperties
{
    DisabledGameMusicListIndex=-1
    DisabledUserMusicListIndex=-1
    SubWidgetBindings=/* Array type was not detected. */
}