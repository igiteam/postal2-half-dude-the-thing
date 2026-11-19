class LPGFxFrontEnd_ContextMenu extends SPGFxUIView within GFxMoviePlayer
    config(UI);

enum EContextMenuAction
{
    CMA_Custom,                     // 0
    CMA_ToggleMute,                 // 1
    CMA_JoinParty,                  // 2
    CMA_JoinParty_XMB,              // 3
    CMA_KickPlayer,                 // 4
    CMA_ViewProfile,                // 5
    CMA_ViewRecords,                // 6
    CMA_SendInvite,                 // 7
    CMA_AcceptInvite,               // 8
    CMA_DeclineInvite,              // 9
    CMA_AddFriend,                  // 10
    CMA_RemoveFriend,               // 11
    CMA_AcceptFriend,               // 12
    CMA_DeclineFriend,              // 13
    CMA_MAX                         // 14
};

struct ContextOptionInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OptionButton;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte OptionType;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> OnOptionSelectDelegate;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDisabled;

    structdefaultproperties
    {
        OptionButton=none
        OptionType=EContextMenuAction.CMA_Custom
        OnOptionSelectDelegate=None
        bIsDisabled=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DialogPRI;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DialogPlayerID;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DialogPlayerTag;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DialogMessageIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLocalPlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRecordsScreenOpen;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSelectionConfirmed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DialogMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL OptionInfo[6];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ButtonPrompts[3];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RecordsMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ListItemIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SelectedIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> OnMenuVisibleDelegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnMenuVisible__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnOptionSelect__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __Select_ToggleMute__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __Select_JoinParty__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __Select_JoinParty_XMB__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __Select_KickPlayer__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __Select_ViewProfile__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __Select_ViewRecords__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __Select_SendInvite__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __Select_AcceptInvite__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __Select_DeclineInvite__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __Select_AddFriend__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __Select_RemoveFriend__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __Select_AcceptFriend__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __Select_DeclineFriend__Delegate;

delegate OnMenuVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    //return;    
}

delegate OnOptionSelect()
{
    //return;    
}

function DisableSubComponents()
{
    local /*0x97E50000-0x00000000*/ private bool bDisableComponents[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    super.DisableSubComponents(bDisableComponents);
    I = 0;
    J0x1F:

    // End:0xD3 [Loop If]
    if(I < 6)
    {
        // End:0xC5
        if(OptionInfo[I].OptionButton != none)
        {
            // End:0x82
            if(bDisableComponents)
            {
                ASDisableOption(I + 1, true);                
            }
            else
            {
                // End:0xC5
                if(!OptionInfo[I].bIsDisabled)
                {
                    ASDisableOption(I + 1, false);
                }
            }
        }
        I++;
        // [Loop Continue]
        goto J0x1F;
    }
    //return;    
}

function GetLocalizedStringShort()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ShortPath[8388609], ReturnValue;

    return GetLocalizedString(("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites.ContextMenu_" $ ShortPath) $ ">");
    //return ReturnValue;    
}

function SetupTest()
{
    InitFromPRI(LPPRI(MoviePlayer.GetPC().PlayerReplicationInfo));
    SetNumOptions(6);
    SetOptionType(0, 1);
    SetOptionType(1, 2);
    SetOptionType(2, 4);
    SetOptionType(3, 5);
    SetOptionType(4, 10);
    SetOptionType(5, 7);
    //return;    
}

function InitFromPRI()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePRI[8388609];

    DialogPRI = ThePRI;
    SetHeaderText(GetPlayerTag());
    //return;    
}

function InitFromUniqueID()
{
    local /*0x97E50000-0x00000000*/ private @NULL UniqueId[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string PlayerTag[8388609];

    DialogPlayerID = UniqueId;
    DialogPlayerTag = PlayerTag;
    DialogPRI = GetPRIFromUniqueID(UniqueId);
    SetHeaderText(DialogPlayerTag);
    //return;    
}

function GetUniqueNetId()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x37
    if(DialogPRI != none)
    {
        DialogPlayerID = DialogPRI.UniqueId;
    }
    return DialogPlayerID;
    //return ReturnValue;    
}

function GetPRIFromUniqueID()
{
    local /*0x97E50000-0x00000000*/ private @NULL UniqueId[8388609], ReturnValue, GRI, PRI;

    GRI = Class'Engine.WorldInfo'.static.GetWorldInfo().GRI;
    // End:0xC9
    foreach GRI.PRIArray(PRI)
    {
        // End:0xC8
        if(Class'Engine.OnlineSubsystem'.static.AreUniqueNetIdsEqual(UniqueId, PRI.UniqueId))
        {            
            return LPPRI(PRI);
        }        
    }    
    // End:0x154
    foreach GRI.InactivePRIArray(PRI)
    {
        // End:0x153
        if(Class'Engine.OnlineSubsystem'.static.AreUniqueNetIdsEqual(UniqueId, PRI.UniqueId))
        {            
            return LPPRI(PRI);
        }        
    }    
    return none;
    //return ReturnValue;    
}

function GetPlayerTag()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    // End:0x38
    if(DialogPRI != none)
    {
        DialogPlayerTag = DialogPRI.GetHumanReadableName();
    }
    return DialogPlayerTag;
    //return ReturnValue;    
}

function IsPlayerFriend()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Class'Engine.GameEngine'.static.GetOnlineSubsystem().PlayerInterface.IsFriend(byte(Outer.GetLP().ControllerId), GetUniqueNetId());
    //return ReturnValue;    
}

function SetHeaderText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string HeaderText[8388609];

    ASSetHeaderText(HeaderText);
    //return;    
}

function SetNumOptions()
{
    local /*0x97E50000-0x00000000*/ private int NumOptions[8388609], I;

    ASSetNumOptions(NumOptions);
    I = 0;
    J0x1E:

    // End:0x57 [Loop If]
    if(I < NumOptions)
    {
        SetOptionDisabled(I, false);
        I++;
        // [Loop Continue]
        goto J0x1E;
    }
    //return;    
}

function SetButtonPrompt()
{
    local /*0x97E50000-0x00000000*/ private int PromptIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Prompt[8388609];

    // End:0x6F
    if(((PromptIndex >= 0) && PromptIndex < 3) && ButtonPrompts[PromptIndex] != none)
    {
        ButtonPrompts[PromptIndex].SetText(Prompt);
    }
    //return;    
}

function SetOptionText()
{
    local /*0x97E50000-0x00000000*/ private int OptionIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Label[8388609];

    ASSetOptionText(OptionIndex + 1, "", Label);
    //return;    
}

function SetOptionDisabled()
{
    local /*0x97E50000-0x00000000*/ private int OptionIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDisable[8388609];

    ASDisableOption(OptionIndex + 1, bDisable);
    OptionInfo[OptionIndex].bIsDisabled = bDisable;
    //return;    
}

function SetFocusedOption()
{
    local /*0x97E50000-0x00000000*/ private int OptionIndex[9437185];

    0
    // End:0x99
    if(((OptionIndex >= 0) && OptionIndex < 6) && OptionInfo[OptionIndex].OptionButton != none)
    {
        MenuViewLoader.SetSelectionFocus(OptionInfo[OptionIndex].OptionButton);
    }
    //return;    
}

function SetOptionOnSelected()
{
    local /*0x97E50000-0x00000000*/ private int OptionIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> OptionDelegate[8388609];

    // End:0x7F
    if(((OptionIndex >= 0) && OptionIndex < 6) && OptionInfo[OptionIndex].OptionButton != none)
    {
        OptionInfo[OptionIndex].OnOptionSelectDelegate = OptionDelegate;
    }
    //return;    
}

function SetOptionType()
{
    local /*0x97E50000-0x00000000*/ private int OptionIndex[8388609];
    local /*0x97E50000-0x00000000*/ private byte OptionType[8388609];

    // End:0x23
    if((OptionIndex < 0) || OptionIndex >= 6)
    {
        return;
    }
    OptionInfo[OptionIndex].OptionType = OptionType;
    switch(OptionType)
    {
        // End:0xA5
        case 1:
            SetOptionOnSelected(OptionIndex, Select_ToggleMute);
            UpdateMuteText(OptionIndex);
            // End:0x4E3
            break;
        // End:0xF4
        case 2:
            SetOptionOnSelected(OptionIndex, Select_JoinParty);
            SetOptionText(OptionIndex, GetLocalizedStringShort("Join"));
            // End:0x4E3
            break;
        // End:0x143
        case 3:
            SetOptionOnSelected(OptionIndex, Select_JoinParty_XMB);
            SetOptionText(OptionIndex, GetLocalizedStringShort("Join"));
            // End:0x4E3
            break;
        // End:0x192
        case 4:
            SetOptionOnSelected(OptionIndex, Select_KickPlayer);
            SetOptionText(OptionIndex, GetLocalizedStringShort("Kick"));
            // End:0x4E3
            break;
        // End:0x233
        case 5:
            SetOptionOnSelected(OptionIndex, Select_ViewProfile);
            // End:0x20A
            if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
            {
                SetOptionText(OptionIndex, GetLocalizedStringShort("GamerCard"));                
            }
            else
            {
                SetOptionText(OptionIndex, GetLocalizedStringShort("Profile"));
            }
            // End:0x4E3
            break;
        // End:0x285
        case 6:
            SetOptionOnSelected(OptionIndex, Select_ViewRecords);
            SetOptionText(OptionIndex, GetLocalizedStringShort("Records"));
            // End:0x4E3
            break;
        // End:0x2D4
        case 7:
            SetOptionOnSelected(OptionIndex, Select_SendInvite);
            SetOptionText(OptionIndex, GetLocalizedStringShort("Send"));
            // End:0x4E3
            break;
        // End:0x32B
        case 8:
            SetOptionOnSelected(OptionIndex, Select_AcceptInvite);
            SetOptionText(OptionIndex, GetLocalizedStringShort("AcceptInvite"));
            // End:0x4E3
            break;
        // End:0x383
        case 9:
            SetOptionOnSelected(OptionIndex, Select_DeclineInvite);
            SetOptionText(OptionIndex, GetLocalizedStringShort("DeclineInvite"));
            // End:0x4E3
            break;
        // End:0x3D7
        case 10:
            SetOptionOnSelected(OptionIndex, Select_AddFriend);
            SetOptionText(OptionIndex, GetLocalizedStringShort("AddFriend"));
            // End:0x4E3
            break;
        // End:0x42E
        case 11:
            SetOptionOnSelected(OptionIndex, Select_RemoveFriend);
            SetOptionText(OptionIndex, GetLocalizedStringShort("RemoveFriend"));
            // End:0x4E3
            break;
        // End:0x485
        case 12:
            SetOptionOnSelected(OptionIndex, Select_AcceptFriend);
            SetOptionText(OptionIndex, GetLocalizedStringShort("AcceptFriend"));
            // End:0x4E3
            break;
        // End:0x4DD
        case 13:
            SetOptionOnSelected(OptionIndex, Select_DeclineFriend);
            SetOptionText(OptionIndex, GetLocalizedStringShort("DeclineFriend"));
            // End:0x4E3
            break;
        // End:0xFFFF
        default:
            // End:0x4E3
            break;
            break;
    }
    //return;    
}

function UpdateMuteText()
{
    local /*0x97E50000-0x00000000*/ private int OptionIndex[8388609];
    local /*0x97E50000-0x00000000*/ private byte VoiceStatus;

    // End:0x11B
    if(((OptionIndex >= 0) && OptionIndex < 6) && OptionInfo[OptionIndex].OptionButton != none)
    {
        VoiceStatus = Class'LPMultiplayerManager'.static.GetInstance().GetVoiceStatus(GetUniqueNetId());
        // End:0xD4
        if(int(VoiceStatus) == int(3))
        {
            SetOptionText(OptionIndex, GetLocalizedStringShort("Unmute"));            
        }
        else
        {
            SetOptionText(OptionIndex, GetLocalizedStringShort("Mute"));
            SetOptionDisabled(OptionIndex, int(VoiceStatus) == int(1));
        }
    }
    //return;    
}

function ShowMenu()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[9437185];

    true
    // End:0x1F
    if(bShow)
    {
        ASOpenPrompt();        
    }
    else
    {
        ASClosePrompt();
    }
    //return;    
}

function Select_Back()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x57
    if(MenuViewLoader != none)
    {
        PlayCloseAnimation();
        MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    }
    //return;    
}

delegate Select_ToggleMute()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub, MenuPRI;
    local /*0x97E50000-0x00000000*/ private byte VoiceStatus;
    local /*0x97E50000-0x00000000*/ private @NULL UniqueId, LPPC;

    UniqueId = GetUniqueNetId();
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    MenuPRI = LPMenuGamePRI(DialogPRI);
    VoiceStatus = Class'LPMultiplayerManager'.static.GetInstance().GetVoiceStatus(UniqueId);
    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x1FC
    if(NotEqual_InterfaceInterface(OnlineSub.VoiceInterface, OnlineVoiceInterface(none)))
    {
        // End:0x177
        if(int(VoiceStatus) == int(3))
        {
            // End:0x14C
            if(MenuPRI != none)
            {
                MenuPRI.SetVoiceStatus(0);
            }
            LPPC.UnmutePlayer(UniqueId);            
        }
        else
        {
            // End:0x1FC
            if((int(VoiceStatus) == int(0)) || int(VoiceStatus) == int(2))
            {
                // End:0x1D1
                if(MenuPRI != none)
                {
                    MenuPRI.SetVoiceStatus(3);
                }
                LPPC.MutePlayer(UniqueId);                
            }
        }
    }
    UpdateMuteText(SelectedIndex);
    //return;    
}

delegate Select_JoinParty()
{
    // End:0x1C6
    if(!Class'LPMultiplayerManager'.static.GetInstance().JoinFriend(GetUniqueNetId()))
    {
        // End:0x12C
        if(Class'LPMultiplayerManager'.static.GetInstance().CheckIsPlayerInSession(GetUniqueNetId()))
        {
            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.ErrorJoinFriendInSession_Message>", "", "<Strings:SPGameUI.CalloutButtonText.Continue>");            
        }
        else
        {
            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.ErrorJoinFriend_Message>", "", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        }
    }
    MoveBackImpl();
    //return;    
}

delegate Select_JoinParty_XMB()
{
    Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.ErrorAcceptInvite_MessagePS3>", "", "<Strings:SPGameUI.CalloutButtonText.Continue>");
    MoveBackImpl();
    //return;    
}

delegate Select_KickPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC, WorldInfo;

    // End:0x7E
    if(!bSelectionConfirmed)
    {
        BuildResponseDialog("ConfirmKickPlayer_Title", "ConfirmKickPlayer_Body", "ConfirmKickPlayer_Confirm", "ConfirmKickPlayer_No");        
    }
    else
    {
        WorldInfo = Class'Engine.WorldInfo'.static.GetWorldInfo();
        // End:0x1BA
        foreach WorldInfo.AllControllers(Class'LPPlayerController', PC)
        {
            // End:0x1B9
            if(PC.PlayerReplicationInfo == DialogPRI)
            {
                PC.ClientReturnToMPLobby("<Strings:LostPlanetGame.MessageBoxStrings.PartyDisbanded_Message>", "<Strings:LostPlanetGame.MessageBoxStrings.PartyDisbanded_Title>", true);
                MoveBackImpl();                
                return;
            }            
        }        
    }
    //return;    
}

delegate Select_ViewProfile()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterfaceEx.ShowGamerCardUI(byte(Outer.GetLP().ControllerId), GetUniqueNetId());
    //return;    
}

delegate Select_ViewRecords()
{
    RecordsMC = LPGFxFrontEnd_Statistics(MenuViewLoader.SpawnDialog('Statistics', self, true));
    // End:0x74
    if(RecordsMC != none)
    {
        RecordsMC.SetUniqueNetId(DialogPlayerID);
    }
    bRecordsScreenOpen = true;
    //return;    
}

delegate Select_SendInvite()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    // End:0x86
    if(!bSelectionConfirmed)
    {
        BuildResponseDialog("ConfirmInviteFriend_Title", "ConfirmInviteFriend_Body", "ConfirmInviteFriend_Confirm", "ConfirmInviteFriend_No");        
    }
    else
    {
        OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
        // End:0x24C
        if(OnlineSub.PlayerInterface.SendGameInviteToFriend(byte(Outer.GetLP().ControllerId), GetUniqueNetId(), GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.MPInviteMessage>")))
        {
            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:LostPlanetGame.LPGFxFrontEnd_Online.GameInviteSuccess_Message>", "<Strings:LostPlanetGame.LPGFxFrontEnd_Online.GameInviteSuccess_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>");            
        }
        else
        {
            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.ErrorSendGameInvite_Message>", "", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        }
        MoveBackImpl();
    }
    //return;    
}

delegate Select_AcceptInvite()
{
    // End:0x86
    if(!bSelectionConfirmed)
    {
        BuildResponseDialog("ConfirmAcceptInvite_Title", "ConfirmAcceptInvite_Body", "ConfirmAcceptInvite_Confirm", "ConfirmAcceptInvite_No");        
    }
    else
    {
        // End:0x24C
        if(!Class'LPMultiplayerManager'.static.GetInstance().JoinFriend(GetUniqueNetId()))
        {
            // End:0x1B2
            if(Class'LPMultiplayerManager'.static.GetInstance().CheckIsPlayerInSession(GetUniqueNetId()))
            {
                Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.ErrorJoinFriendInSession_Message>", "", "<Strings:SPGameUI.CalloutButtonText.Continue>");                
            }
            else
            {
                Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.ErrorJoinFriend_Message>", "", "<Strings:SPGameUI.CalloutButtonText.Continue>");
            }
        }
        MoveBackImpl();
    }
    //return;    
}

delegate Select_DeclineInvite()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    // End:0x8A
    if(!bSelectionConfirmed)
    {
        BuildResponseDialog("ConfirmDeclineInvite_Title", "ConfirmDeclineInvite_Body", "ConfirmDeclineInvite_Confirm", "ConfirmDeclineInvite_No");        
    }
    else
    {
        OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
        // End:0x1C9
        if(!OnlineSub.PlayerInterface.DeleteMessage(byte(Outer.GetLP().ControllerId), DialogMessageIndex))
        {
            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.ErrorDeclineInvite_Message>", "", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        }
        MoveBackImpl();
    }
    //return;    
}

delegate Select_AddFriend()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    // End:0x7A
    if(!bSelectionConfirmed)
    {
        BuildResponseDialog("ConfirmAddFriend_Title", "ConfirmAddFriend_Body", "ConfirmAddFriend_Confirm", "ConfirmAddFriend_No");        
    }
    else
    {
        OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
        // End:0x2CA
        if(!OnlineSub.PlayerInterface.IsFriend(byte(Outer.GetLP().ControllerId), GetUniqueNetId()))
        {
            // End:0x2CA
            if(!OnlineSub.PlayerInterface.AddFriend(byte(Outer.GetLP().ControllerId), GetUniqueNetId(), "Friend Request"))
            {
                // End:0x2CA
                if(!OnlineSub.PlayerInterface.AddFriendByName(byte(Outer.GetLP().ControllerId), GetPlayerTag(), "Friend Request"))
                {
                    Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.ErrorAddFriend_Message>", "", "<Strings:SPGameUI.CalloutButtonText.Continue>");
                }
            }
        }
        MoveBackImpl();
    }
    //return;    
}

delegate Select_RemoveFriend()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    // End:0xC0
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
    {
        Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.PS3RemoveFriend_Message>", "", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        return;
    }
    // End:0x146
    if(!bSelectionConfirmed)
    {
        BuildResponseDialog("ConfirmRemoveFriend_Title", "ConfirmRemoveFriend_Body", "ConfirmRemoveFriend_Confirm", "ConfirmRemoveFriend_No");        
    }
    else
    {
        OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
        // End:0x285
        if(!OnlineSub.PlayerInterface.RemoveFriend(byte(Outer.GetLP().ControllerId), GetUniqueNetId()))
        {
            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.ErrorRemoveFriend_Message>", "", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        }
        MoveBackImpl();
    }
    //return;    
}

delegate Select_AcceptFriend()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    // End:0x86
    if(!bSelectionConfirmed)
    {
        BuildResponseDialog("ConfirmAcceptFriend_Title", "ConfirmAcceptFriend_Body", "ConfirmAcceptFriend_Confirm", "ConfirmAcceptFriend_No");        
    }
    else
    {
        OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
        // End:0x13F
        if(OnlineSub.PlayerInterface.AcceptFriendInvite(byte(Outer.GetLP().ControllerId), GetUniqueNetId()))
        {
            Select_AddFriend();
            return;            
        }
        else
        {
            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.ErrorAcceptFriend_Message>", "", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        }
        MoveBackImpl();
    }
    //return;    
}

delegate Select_DeclineFriend()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    // End:0x8A
    if(!bSelectionConfirmed)
    {
        BuildResponseDialog("ConfirmDeclineFriend_Title", "ConfirmDeclineFriend_Body", "ConfirmDeclineFriend_Confirm", "ConfirmDeclineFriend_No");        
    }
    else
    {
        // End:0x151
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
        {
            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.ErrorDeclineFriend_MessagePS3>", "", "<Strings:SPGameUI.CalloutButtonText.Continue>");            
        }
        else
        {
            OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
            // End:0x291
            if(!OnlineSub.PlayerInterface.DenyFriendInvite(byte(Outer.GetLP().ControllerId), GetUniqueNetId()))
            {
                Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.ErrorDeclineFriend_Message>", "", "<Strings:SPGameUI.CalloutButtonText.Continue>");
            }
        }
        MoveBackImpl();
    }
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bResult;

    switch(WidgetName)
    {
        // End:0x65
        case 'buttonPrompt1':
            ButtonPrompts[0] = Widget.GetObject("textField");
            bResult = true;
            // End:0x2EF
            break;
        // End:0xB7
        case 'buttonPrompt2':
            ButtonPrompts[1] = Widget.GetObject("textField");
            bResult = true;
            // End:0x2EF
            break;
        // End:0x10A
        case 'buttonPrompt3':
            ButtonPrompts[2] = Widget.GetObject("textField");
            bResult = true;
            // End:0x2EF
            break;
        // End:0x14D
        case 'b1':
            OptionInfo[0].OptionButton = Widget;
            bResult = true;
            // End:0x2EF
            break;
        // End:0x190
        case 'b2':
            OptionInfo[1].OptionButton = Widget;
            bResult = true;
            // End:0x2EF
            break;
        // End:0x1D4
        case 'b3':
            OptionInfo[2].OptionButton = Widget;
            bResult = true;
            // End:0x2EF
            break;
        // End:0x218
        case 'b4':
            OptionInfo[3].OptionButton = Widget;
            bResult = true;
            // End:0x2EF
            break;
        // End:0x25C
        case 'b5':
            OptionInfo[4].OptionButton = Widget;
            bResult = true;
            // End:0x2EF
            break;
        // End:0x2A0
        case 'b6':
            OptionInfo[5].OptionButton = Widget;
            bResult = true;
            // End:0x2EF
            break;
        // End:0x2DD
        case 'subMenu':
            // End:0x2DA
            if(DialogMC == none)
            {
                DialogMC = Widget;
                bResult = true;
            }
            // End:0x2EF
            break;
        // End:0xFFFF
        default:
            bResult = false;
            // End:0x2EF
            break;
            break;
    }
    return bResult;
    //return ReturnValue;    
}

function PlayCloseAnimation()
{
    super.PlayCloseAnimation();
    ASClosePrompt();
    //return;    
}

function OnViewClosed()
{
    super.OnViewClosed();
    DisableSubComponents(false);
    // End:0x38
    if(OnMenuVisibleDelegate != none)
    {
        OnMenuVisible(false);
    }
    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    MoviePlayer.SetExternalInterface(self);
    // End:0x8E
    if(!bRecordsScreenOpen && previousView != 'InfoDialog')
    {
        SelectedIndex = 0;
        bSelectionConfirmed = false;
    }
    bRecordsScreenOpen = false;
    SetFocusedOption(SelectedIndex);
    //return;    
}

function OnOptionFocus()
{
    Outer.PlaySoundFromTheme(ListChangeSoundEventName);
    //return;    
}

function OnOptionSelected()
{
    local /*0x97E50000-0x00000000*/ private int OptionIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> SelectDelegate;

    OptionIndex--;
    // End:0xE5
    if(((OptionIndex >= 0) && OptionIndex < 6) && OptionInfo[OptionIndex].OnOptionSelectDelegate != none)
    {
        bSelectionConfirmed = false;
        SelectedIndex = OptionIndex;
        SelectDelegate = OptionInfo[OptionIndex].OnOptionSelectDelegate;
        OnOptionSelect();
        Outer.PlaySoundFromTheme(ListItemPressSoundEventName);
    }
    //return;    
}

function OnContextMenuVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    // End:0xED
    if(bVisible)
    {
        SetButtonPrompt(0, GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonConfirm>"));
        SetButtonPrompt(1, GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonBack>"));
        SetButtonPrompt(2, GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonSelect>"));
        // End:0xED
        if(OnMenuVisibleDelegate != none)
        {
            OnMenuVisible(true);
        }
    }
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2D
    if(super.FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    // End:0x75
    if(bRecordsScreenOpen)
    {
        return RecordsMC.FilterButtonInput(ControllerId, ButtonName, InputEvent);
    }
    // End:0xC0
    if(((ButtonName == 'XboxTypeS_RightTrigger') || ButtonName == 'XboxTypeS_LeftTrigger') || ButtonName == 'SpaceBar')
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function BuildResponseDialog()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Title[8388609], Body, Yes, No;
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmMC;

    ConfirmMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, true));
    // End:0x2B5
    if(ConfirmMC != none)
    {
        ConfirmMC.EnableDialogBackground(true);
        ConfirmMC.SetNumberOfOptions(2);
        ConfirmMC.SetTitle(("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites." $ Title) $ ">");
        ConfirmMC.SetInfo(("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites." $ Body) $ ">");
        ConfirmMC.SetButtonLabel(0, ("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites." $ Yes) $ ">");
        ConfirmMC.SetButtonLabel(1, ("<Strings:LostPlanetGame.LPGFxFrontEnd_PartyLobbyInvites." $ No) $ ">");
        ConfirmMC.SetButtonOnPress(0, ResponseDialogYes);
        ConfirmMC.SetButtonOnPress(1, ResponseDialogNo);
        ConfirmMC.SetDefaultFocusedButton(0);
    }
    //return;    
}

function ResponseDialogNo()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

function ResponseDialogYes()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> SelectDelegate;

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    // End:0xDC
    if(((SelectedIndex >= 0) && SelectedIndex < 6) && OptionInfo[SelectedIndex].OnOptionSelectDelegate != none)
    {
        bSelectionConfirmed = true;
        SelectDelegate = OptionInfo[SelectedIndex].OnOptionSelectDelegate;
        OnOptionSelect();
    }
    //return;    
}

function ASOpenPrompt()
{
    ActionScriptVoid("openPrompt");
    //return;    
}

function ASClosePrompt()
{
    ActionScriptVoid("closePrompt");
    //return;    
}

function ASSetNumOptions()
{
    local /*0x97E50000-0x00000000*/ private int NumOptions[8388609];

    // End:0x41
    if((NumOptions >= 1) && NumOptions <= 6)
    {
        ActionScriptVoid("setSubMenuNumOptions");
    }
    //return;    
}

function ASSetOptionText()
{
    local /*0x97E50000-0x00000000*/ private int OptionIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string OptionName[8388609], OptionText;

    // End:0x40
    if((OptionIndex >= 1) && OptionIndex <= 6)
    {
        ActionScriptVoid("updateSubMenuOption");
    }
    //return;    
}

function ASDisableOption()
{
    local /*0x97E50000-0x00000000*/ private int OptionIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDisable[8388609];

    // End:0x41
    if((OptionIndex >= 1) && OptionIndex <= 6)
    {
        ActionScriptVoid("disableSubMenuButton");
    }
    //return;    
}

function ASSetHeaderText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string HeaderText[8388609];

    ActionScriptVoid("setHeaderText");
    //return;    
}

defaultproperties
{
    bShouldHideViewStack=false
    ListItemPressSoundEventName="ViewPlayerConfirm"
    ListChangeSoundEventName="ViewPlayerSelect"
    NavBackSoundEventName="NetLobbyMenuBack"
}