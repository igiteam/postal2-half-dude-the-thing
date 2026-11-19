class LPGFxHUD_PauseMPInvites extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Messages;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentSelectedInviteIndex;

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];
    local /*0x97E50000-0x00000000*/ private byte I;
    local /*0x97E50000-0x00000000*/ private @NULL DataProvider, TempObj;
    local /*0x97E50000-0x00000000*/ private editfixedsize array FriendMessages;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Message, OnlineSub;
    local /*0x97E50000-0x00000000*/ private int FoundMessageIdx;

    0
    Messages.Remove(0, Messages.Length);    
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterface.GetFriendMessages(byte(Outer.GetLP().ControllerId), FriendMessages);
    DataProvider = Outer.CreateArray();
    FoundMessageIdx = 0;
    I = 0;
    J0xF8:

    // End:0x2DB [Loop If]
    if(int(I) < FriendMessages.Length)
    {
        Message = FriendMessages[int(I)];
        // End:0x2CD
        if((Message.bIsFriendInvite || Message.bIsGameInvite) && !Message.bWasAccepted)
        {
            TempObj = Outer.CreateObject("Object");
            TempObj.SetString("label", Message.SendingPlayerNick);
            TempObj.SetString("control", "menu");
            TempObj.SetBool("bUpdateFromUnreal", true);
            DataProvider.SetElementObject(FoundMessageIdx, TempObj);
            FoundMessageIdx++;
            Messages.AddItem(FriendMessages[int(I)]);            
        }
        I++;
        // [Loop Continue]
        goto J0xF8;
    }
    ListMC.SetString("wrapping", ((Messages.Length > 0) ? "wrap" : "normal"));
    ListMC.SetObject("dataProvider", DataProvider);
    ListDataProvider = ListMC.GetObject("dataProvider");
    ListMC.SetFloat("selectedIndex", float(SelectedIndex));
    CurrentSelectedInviteIndex = -1;
    //return;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    super(SPGFxUIViewSettingsMenuBase).OnListItemPress(ev);
    CurrentSelectedInviteIndex = ev.Index;
    BuildAcceptInviteDialog();
    //return;    
}

function BuildAcceptInviteDialog()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmMC;

    ConfirmMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, true));
    // End:0x25E
    if(ConfirmMC != none)
    {
        ConfirmMC.SetDefaultFocusedButton(0);
        ConfirmMC.EnableDialogBackground(true);
        ConfirmMC.SetNumberOfOptions(2);
        ConfirmMC.SetTitle("<Strings:LostPlanetGame.PauseMenu.MPConfirmAcceptInvite_Title>");
        ConfirmMC.SetInfo("<Strings:LostPlanetGame.PauseMenu.MPConfirmAcceptInvite_Body>");
        ConfirmMC.SetButtonLabel(0, "<Strings:LostPlanetGame.PauseMenu.No>");
        ConfirmMC.SetButtonLabel(1, "<Strings:LostPlanetGame.PauseMenu.Yes>");
        ConfirmMC.SetButtonOnPress(0, AcceptInviteNo);
        ConfirmMC.SetButtonOnPress(1, AcceptInviteYes);        
    }
    else
    {
        MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    }
    //return;    
}

function AcceptInviteNo()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

function AcceptInviteYes()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0x97
    if((CurrentSelectedInviteIndex >= 0) && CurrentSelectedInviteIndex < Messages.Length)
    {
        MPMgr.JoinFriend(Messages[CurrentSelectedInviteIndex].SendingPlayerId);
    }
    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

defaultproperties
{
    ViewTitle="<Strings:LostPlanetGame.PauseMenu.Invites>"
    bDisableRenderer3DEffects=true
}