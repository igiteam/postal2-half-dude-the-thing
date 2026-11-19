class LPGFxHUD_PauseMPConfirmFriend extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyFriendsList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL MyFriend;

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    MyFriendsList = LPGFxHUD_PauseMPFriendsList(ParentView);
    // End:0x112
    if(MyFriendsList != none)
    {
        // End:0x10F
        if((MyFriendsList.CurrentSelectedFriendIndex >= 0) && MyFriendsList.CurrentSelectedFriendIndex < MyFriendsList.Friends.Length)
        {
            MyFriend = MyFriendsList.Friends[MyFriendsList.CurrentSelectedFriendIndex];
            ViewTitle = MyFriend.NickName;
            UpdateTitle();            
        }        
    }
    RegisterDelegates();
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    //return;    
}

function OnViewClosed()
{
    super(SPGFxUIView).OnViewClosed();
    UnregisterDelegates();
    //return;    
}

function RegisterDelegates()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterface.AddFriendsChangeDelegate(byte(Outer.GetLP().ControllerId), OnFriendsChange);
    OnlineSub.PlayerInterface.AddReadFriendsCompleteDelegate(byte(Outer.GetLP().ControllerId), OnReadFriendsComplete);
    //return;    
}

function UnregisterDelegates()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterface.ClearFriendsChangeDelegate(byte(Outer.GetLP().ControllerId), OnFriendsChange);
    OnlineSub.PlayerInterface.ClearReadFriendsCompleteDelegate(byte(Outer.GetLP().ControllerId), OnReadFriendsComplete);
    //return;    
}

function OnFriendsChange()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterface.ReadFriendsList(byte(Outer.GetLP().ControllerId));
    //return;    
}

function OnReadFriendsComplete()
{
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private editfixedsize array AllFriends;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    // End:0x22
    if(!bWasSuccessful || !bIsTopView)
    {
        return;
    }
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterface.GetFriendsList(byte(Outer.GetLP().ControllerId), AllFriends);
    I = 0;
    J0xCC:

    // End:0x176 [Loop If]
    if(I < AllFriends.Length)
    {
        // End:0x168
        if(Class'Engine.OnlineSubsystem'.static.AreUniqueNetIdsEqual(AllFriends[I].UniqueId, MyFriend.UniqueId))
        {
            MyFriend = AllFriends[I];
            // [Explicit Break]
            goto J0x176;
        }
        I++;
        // [Loop Continue]
        goto J0xCC;
    }
    J0x176:

    UpdateListDataProvider();
    //return;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];

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
    // End:0xBE
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
    {
        RemoveOptionItemByName("Invite");
        RemoveOptionItemByName("Join");        
    }
    else
    {
        HideOptionItemByName("Invite", !MyFriend.bIsOnline);
        HideOptionItemByName("Join", !MyFriend.bIsJoinable);
    }
    SetNumOptions(GetSettingsList().Length);
    super(SPGFxUIViewSettingsMenuBase).UpdateListDataProvider(SelectedIndex);
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
        // End:0xB5
        case 'Invite':
            Select_Invite();
            // End:0xF9
            break;
        // End:0xCE
        case 'Join':
            Select_Join();
            // End:0xF9
            break;
        // End:0xDA
        case 'Profile':
        // End:0xF3
        case 'GamerCard':
            Select_Profile();
            // End:0xF9
            break;
        // End:0xFFFF
        default:
            // End:0xF9
            break;
            break;
    }
    //return;    
}

function Select_Invite()
{
    BuildInviteDialog();
    //return;    
}

function Select_Join()
{
    BuildJoinGameDialog();
    //return;    
}

function Select_Profile()
{
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    // End:0x14C
    if((MyFriendsList.CurrentSelectedFriendIndex >= 0) && MyFriendsList.CurrentSelectedFriendIndex < MyFriendsList.Friends.Length)
    {
        OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
        OnlineSub.PlayerInterfaceEx.ShowGamerCardUI(byte(Outer.GetLP().ControllerId), MyFriendsList.Friends[MyFriendsList.CurrentSelectedFriendIndex].UniqueId);
    }
    //return;    
}

function BuildJoinGameDialog()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmMC;

    ConfirmMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, true));
    // End:0x248
    if(ConfirmMC != none)
    {
        ConfirmMC.SetDefaultFocusedButton(0);
        ConfirmMC.EnableDialogBackground(true);
        ConfirmMC.SetNumberOfOptions(2);
        ConfirmMC.SetTitle("<Strings:LostPlanetGame.PauseMenu.MPJoinGame_Title>");
        ConfirmMC.SetInfo("<Strings:LostPlanetGame.PauseMenu.MPJoinGame_Body>");
        ConfirmMC.SetButtonLabel(0, "<Strings:LostPlanetGame.PauseMenu.No>");
        ConfirmMC.SetButtonLabel(1, "<Strings:LostPlanetGame.PauseMenu.Yes>");
        ConfirmMC.SetButtonOnPress(0, JoinGameNo);
        ConfirmMC.SetButtonOnPress(1, JoinGameYes);        
    }
    else
    {
        MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    }
    //return;    
}

function JoinGameNo()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

function JoinGameYes()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    // End:0x22A
    if(!Class'LPMultiplayerManager'.static.GetInstance().JoinFriend(MyFriend.UniqueId))
    {
        // End:0x18E
        if(Class'LPMultiplayerManager'.static.GetInstance().CheckIsPlayerInSession(MyFriend.UniqueId))
        {
            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.ErrorJoinFriendInSession_Message>", "", "<Strings:SPGameUI.CalloutButtonText.Continue>");            
        }
        else
        {
            Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.ErrorJoinFriend_Message>", "", "<Strings:SPGameUI.CalloutButtonText.Continue>");
        }
        return;
    }
    UnregisterDelegates();
    //return;    
}

function BuildInviteDialog()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmMC;

    ConfirmMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, true));
    // End:0x244
    if(ConfirmMC != none)
    {
        ConfirmMC.SetDefaultFocusedButton(0);
        ConfirmMC.EnableDialogBackground(true);
        ConfirmMC.SetNumberOfOptions(2);
        ConfirmMC.SetTitle("<Strings:LostPlanetGame.PauseMenu.MPInvite_Title>");
        ConfirmMC.SetInfo("<Strings:LostPlanetGame.PauseMenu.MPInvite_Body>");
        ConfirmMC.SetButtonLabel(0, "<Strings:LostPlanetGame.PauseMenu.No>");
        ConfirmMC.SetButtonLabel(1, "<Strings:LostPlanetGame.PauseMenu.Yes>");
        ConfirmMC.SetButtonOnPress(0, InviteNo);
        ConfirmMC.SetButtonOnPress(1, InviteYes);        
    }
    else
    {
        MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    }
    //return;    
}

function InviteNo()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

function InviteYes()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    // End:0x1BB
    if(!Class'Engine.GameEngine'.static.GetOnlineSubsystem().PlayerInterface.SendGameInviteToFriend(byte(Outer.GetLP().ControllerId), MyFriend.UniqueId, GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.MPInviteMessage>")))
    {
        Class'LPUIManager'.static.DisplayErrorMessage("<Strings:SPGameUI.MessageBoxErrorStrings.ErrorSendGameInvite_Message>", "", "<Strings:SPGameUI.CalloutButtonText.Continue>");
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
    ViewTitle="friend name here"
    SettingsList=/* Array type was not detected. */
    bDisableRenderer3DEffects=true
}