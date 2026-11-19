class LPGFxHUD_PauseMPConfirmPlayer extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GFxPlayerList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerPRI;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte VoiceStatus;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsPlayerTeammate;

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    GFxPlayerList = LPGFxHUD_PauseMPPlayersList(ParentView);
    // End:0x1A4
    if(GFxPlayerList != none)
    {
        // End:0x1A1
        if((GFxPlayerList.SelectedPlayerIndex >= 0) && GFxPlayerList.SelectedPlayerIndex < GFxPlayerList.PlayerList.Length)
        {
            PlayerPRI = GFxPlayerList.PlayerList[GFxPlayerList.SelectedPlayerIndex];
            VoiceStatus = Class'LPMultiplayerManager'.static.GetInstance().GetVoiceStatus(PlayerPRI.UniqueId);
            bIsPlayerTeammate = int(PlayerPRI.GetTeamNum()) == int(Outer.GetPC().GetTeamNum());            
        }        
    }
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    // End:0x202
    if(PlayerPRI != none)
    {
        ViewTitle = PlayerPRI.PlayerName;
        UpdateTitle();
    }
    RegisterUpdate();
    //return;    
}

function OnViewClosed()
{
    super(SPGFxUIView).OnViewClosed();
    UnregisterUpdate();
    //return;    
}

function RegisterUpdate()
{
    Outer.GetPC().SetTimer(0.1000000, true, 'UpdatePlayer', self);
    //return;    
}

function UnregisterUpdate()
{
    Outer.GetPC().ClearTimer('UpdatePlayer', self);
    //return;    
}

function UpdatePlayer()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private bool bPlayerValid;
    local /*0x97E50000-0x00000000*/ private @NULL Uid;

    bPlayerValid = false;
    // End:0x12A
    if(PlayerPRI != none)
    {
        I = 0;
        J0x26:

        // End:0x12A [Loop If]
        if(I < GFxPlayerList.MyGRI.PRIArray.Length)
        {
            Uid = GFxPlayerList.MyGRI.PRIArray[I].UniqueId;
            // End:0x11C
            if(Class'Engine.OnlineSubsystem'.static.AreUniqueNetIdsEqual(Uid, PlayerPRI.UniqueId))
            {
                bPlayerValid = true;
                // [Explicit Break]
                goto J0x12A;
            }
            I++;
            // [Loop Continue]
            goto J0x26;
        }
    }
    J0x12A:

    // End:0x17A
    if(!bPlayerValid)
    {
        MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());        
    }
    else
    {
        bIsPlayerTeammate = int(PlayerPRI.GetTeamNum()) == int(Outer.GetPC().GetTeamNum());
        // End:0x1F6
        if(bIsPlayerTeammate)
        {
            UpdateMuteOption();
        }
    }
    //return;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];
    local /*0x97E50000-0x00000000*/ private bool bHideMuteOption;

    // End:0x3A
    if(!Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
    {
        RemoveOptionItemByName("Profile");
    }
    // End:0x75
    if(!Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
    {
        RemoveOptionItemByName("GamerCard");
    }
    bHideMuteOption = !bIsPlayerTeammate || int(VoiceStatus) == int(1);
    SelectedIndex = ((bHideMuteOption) ? 0 : SelectedIndex);
    // End:0x177
    if(!bHideMuteOption)
    {
        // End:0x132
        if(int(VoiceStatus) == int(3))
        {
            RenameOptionItemByName("Mute", GetLocalizedString("<Strings:LostPlanetGame.PauseMenu.MPUnmute>"));            
        }
        else
        {
            RenameOptionItemByName("Mute", GetLocalizedString("<Strings:LostPlanetGame.PauseMenu.MPMute>"));
        }
    }
    HideOptionItemByName("Mute", bHideMuteOption);
    SetNumOptions(GetSettingsList().Length);
    super(SPGFxUIViewSettingsMenuBase).UpdateListDataProvider(SelectedIndex);
    //return;    
}

function UpdateMuteOption()
{
    local /*0x97E50000-0x00000000*/ private bool bMuteOptionChanged;
    local /*0x97E50000-0x00000000*/ private byte CurrentVoiceStatus;

    bMuteOptionChanged = false;
    CurrentVoiceStatus = Class'LPMultiplayerManager'.static.GetInstance().GetVoiceStatus(PlayerPRI.UniqueId);
    // End:0xF9
    if(int(CurrentVoiceStatus) != int(VoiceStatus))
    {
        // End:0xE6
        if((((int(CurrentVoiceStatus) == int(1)) || int(CurrentVoiceStatus) == int(3)) || int(VoiceStatus) == int(1)) || int(VoiceStatus) == int(3))
        {
            bMuteOptionChanged = true;
        }
        VoiceStatus = CurrentVoiceStatus;
    }
    // End:0x115
    if(bMuteOptionChanged)
    {
        UpdateListDataProvider(-1);
    }
    //return;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;
    local /*0x97E50000-0x00000000*/ private name Selection;
    local /*0x97E50000-0x00000000*/ private editfixedsize array mySettingsList;

    super(SPGFxUIViewSettingsMenuBase).OnListItemPress(ev);
    SelectedIndex = GetSettingsListIndexFromDataIndex(ev.Index);
    mySettingsList = GetSettingsList();
    Selection = name(mySettingsList[SelectedIndex].OptionName);
    switch(Selection)
    {
        // End:0xA8
        case 'Profile':
        // End:0xC1
        case 'GamerCard':
            Select_Profile();
            // End:0xE0
            break;
        // End:0xDA
        case 'Mute':
            Select_Mute();
            // End:0xE0
            break;
        // End:0xFFFF
        default:
            // End:0xE0
            break;
            break;
    }
    //return;    
}

function Select_Profile()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterfaceEx.ShowGamerCardUI(byte(Outer.GetLP().ControllerId), PlayerPRI.UniqueId);
    //return;    
}

function Select_Mute()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub, LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0x15A
    if(NotEqual_InterfaceInterface(OnlineSub.VoiceInterface, OnlineVoiceInterface(none)))
    {
        // End:0xE4
        if(int(VoiceStatus) == int(3))
        {
            LPPC.UnmutePlayer(PlayerPRI.UniqueId);            
        }
        else
        {
            // End:0x14B
            if((int(VoiceStatus) == int(0)) || int(VoiceStatus) == int(2))
            {
                LPPC.MutePlayer(PlayerPRI.UniqueId);
            }
        }
        UpdateListDataProvider(-1);
    }
    //return;    
}

function SetNumOptions()
{
    local /*0x97E50000-0x00000000*/ private int Num[8388609];

    ActionScriptVoid("setNumOptions");
    //return;    
}

defaultproperties
{
    ViewTitle="player name here"
    SettingsList=/* Array type was not detected. */
    bDisableRenderer3DEffects=true
}