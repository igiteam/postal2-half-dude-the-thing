/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZMPPause extends XDOTZInGamePage;



//Page components
var Automated GuiButton  ContinueButton;
var Automated GuiButton  SwitchTeamsButton;
var Automated GuiButton  PlayersListButton;
var Automated GuiButton  FriendsListButton;
var Automated GuiButton  OfflineButton;
var Automated GuiButton  OptionsButton;
var Automated GuiButton  QuitButton;

var Automated GUIImage   FriendsRequestNotification;
var Automated GUIImage   FriendsInviteNotification;

//configurable stuff
var string ContinueMenu;              // Single Player menu location
var string PlayersListMenu;           // Xbox Live menu location
var string FriendsListMenu;           // Xbox Live menu location
var string OptionsMenu;      // System Link menu location
var string QuitMenu;                  // Profile menu location

//configurable stuff
var localized string PageCaption;

var sound ClickSound;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    Super.Initcomponent(MyController, MyOwner);

    SetPageCaption (PageCaption);
    AddBackButton ();
    AddSelectButton ();

    // if we are not signed in to live, then hide the friends menu
    if (!class'UtilsXbox'.static.Is_Signed_In()) {
        // Hide button and move up other two

        OptionsButton.WinTop = OptionsButton.WinTop - 0.2;
        QuitButton.WinTop = QuitButton.WinTop - 0.2;

        RemoveComponent(FriendsListButton, true);
        RemoveComponent(OfflineButton, true);
        MapControls();
    } else {
        if (class'UtilsXbox'.static.Is_Player_Online_Set()) {
            OfflineButton.Caption = appear_offline_string;
        } else {
            OfflineButton.Caption = appear_online_string;
        }
    }

    //remove the switch teams option if not a team game
    if( (PlayerOwner() != none && PlayerOwner().GameReplicationInfo != none &&
        !PlayerOwner().GameReplicationInfo.bTeamGame) ||
        (PlayerOwner() != none && PlayerOwner().GameReplicationInfo != none &&
        !PlayerOwner().GameReplicationInfo.bAllowedToSwitchTeams)){

      RemoveComponent(SwitchTeamsButton, true);

      PlayersListButton.WinTop = PlayersListButton.WinTop - 0.1;
      FriendsListButton.WinTop = FriendsListButton.WinTop - 0.1;

      OptionsButton.WinTop = OptionsButton.WinTop - 0.1;
      QuitButton.WinTop = QuitButton.WinTop - 0.1;
      OfflineButton.WinTop = OfflineButton.WinTop - 0.1;
      FriendsInviteNotification.WinTop = FriendsInviteNotification.WinTop - 0.1;
      FriendsRequestNotification.WinTop = FriendsRequestNotification.WinTop - 0.1;
      MapControls();

    }


    // if saving is disabled
    /*if (!class'UtilsXbox'.static.Get_Save_Enable()) {
       // Hide button and move up other two

        QuitButton.WinTop = QuitButton.WinTop - 0.1;

        RemoveComponent(OptionsButton, true);
        MapControls();
    }*/
}



/**
 * Happens every time the menu is opened, not just the first.
 */
event Opened( GUIComponent Sender ) {
    super.Opened(Sender);

    Refresh_Icons();
}

/*****************************************************************
 * Closed
 *****************************************************************
 */
event Closed(GUIComponent Sender, bool bCancelled) {
   Super.Closed(Sender,bCancelled);
   Controller.MouseEmulation(false);
}

/*****************************************************************
 * This gets called every 1/2 second
 *****************************************************************
 */

function Refresh_Icons ()
{
    class'UtilsXbox'.static.Friends_Refresh_List();

    if (class'UtilsXbox'.static.Is_Signed_In()) {
        if (class'UtilsXbox'.static.Friends_Is_Any_Recv_Invitation()) {
            FriendsRequestNotification.bVisible = false;
            FriendsInviteNotification.bVisible = true;
        } else if (class'UtilsXbox'.static.Friends_Is_Any_Recv_Friend_Request()) {
            FriendsRequestNotification.bVisible = true;
            FriendsInviteNotification.bVisible = false;
        } else {
            FriendsRequestNotification.bVisible = false;
            FriendsInviteNotification.bVisible = false;
        }
    } else {
        FriendsRequestNotification.bVisible = false;
        FriendsInviteNotification.bVisible = false;
    }
}

function Periodic ()
{
    super.Periodic();
    Refresh_Icons();
}

/*****************************************************************
 * ButtonClicked
 * Notification that the user clicked a component on the page
 *****************************************************************
 */
function bool ButtonClicked(GUIComponent Sender) {
    local GUIButton Selected;

    if (GUIButton(Sender) != None) Selected = GUIButton(Sender);
    if (Selected == None) return false;

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {
        case ContinueButton:
             DoButtonB ();

             return false;
             break;

        case SwitchTeamsButton:
             Controller.OpenMenu("DOTZMenu.XDOTZSwitchTeamsConfirm");
             //DoButtonB ();
             return false;
             break;

        case FriendsListButton:
             return Controller.OpenMenu(FriendsListMenu);
             break;

        case PlayersListButton:
             return Controller.OpenMenu(PlayersListMenu);
             break;

        case OptionsButton:
             return Controller.OpenMenu(OptionsMenu);
             break;

        case QuitButton:

             if (PlayerOwner().Level.NetMode == NM_Client){
                class'UtilsXbox'.static.Set_Reboot_Type(6);   // IS_RETURN_FROM_SINGLE_PLAYER
                Controller.OpenMenu("DOTZMenu.XDOTZLoadingMenu");
                Console(Controller.Master.Console).ConsoleCommand("reboot");  // URL not part of command on xbox
             } else {
                return Controller.OpenMenu(QuitMenu);
             }
             break;

        case OfflineButton:
             if (class'UtilsXbox'.static.Is_Player_Online_Set()) {
                 class'UtilsXbox'.static.Set_Player_Offline();
                 OfflineButton.Caption = appear_online_string;
             } else {
                 class'UtilsXbox'.static.Set_Player_Online();
                 OfflineButton.Caption = appear_offline_string;
             }
             break;
    };

   return false;
}

/*****************************************************************
 * Continue if B pressed too
 *
 *****************************************************************
 */

function DoButtonB ()
{
   // Unpause //whoops, no game on the client!
   //Controller.ViewportOwner.Actor.Level.Game
   //SetPause( false, Controller.ViewportOwner.Actor );

   Controller.ViewportOwner.Actor.SetPause(false);
   Controller.CloseAll(false);
}

/*****************************************************************
 * NotifyLevelChange
 *
 *****************************************************************
 */
event NotifyLevelChange() {
    Controller.CloseMenu(true);
}

//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUIButton'XDOTZMPPause.ContinueButton_btn'
    begin object name=ContinueButton_btn class=Class'GUI.GUIButton'
        Caption="Continue"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.1000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        bFocusOnWatch=true
        OnClick=XDOTZMPPause.ButtonClicked
    end object
    ContinueButton=ContinueButton_btn
    // Reference: GUIButton'XDOTZMPPause.SwitchTeamsButton_btn'
    begin object name=SwitchTeamsButton_btn class=Class'GUI.GUIButton'
        Caption="Switch Teams"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        bFocusOnWatch=true
        OnClick=XDOTZMPPause.ButtonClicked
    end object
    SwitchTeamsButton=SwitchTeamsButton_btn
    // Reference: GUIButton'XDOTZMPPause.PlayersListButton_btn'
    begin object name=PlayersListButton_btn class=Class'GUI.GUIButton'
        Caption="Players List"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZMPPause.ButtonClicked
    end object
    PlayersListButton=PlayersListButton_btn
    // Reference: GUIButton'XDOTZMPPause.FriendsListButton_btn'
    begin object name=FriendsListButton_btn class=Class'GUI.GUIButton'
        Caption="Friends List"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZMPPause.ButtonClicked
    end object
    FriendsListButton=FriendsListButton_btn
    // Reference: GUIButton'XDOTZMPPause.OfflineButton_btn'
    begin object name=OfflineButton_btn class=Class'GUI.GUIButton'
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZMPPause.ButtonClicked
    end object
    OfflineButton=OfflineButton_btn
    // Reference: GUIButton'XDOTZMPPause.OptionsButton_btn'
    begin object name=OptionsButton_btn class=Class'GUI.GUIButton'
        Caption="Settings"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        TabOrder=3
        bFocusOnWatch=true
        OnClick=XDOTZMPPause.ButtonClicked
    end object
    OptionsButton=OptionsButton_btn
    // Reference: GUIButton'XDOTZMPPause.QuitButton_btn'
    begin object name=QuitButton_btn class=Class'GUI.GUIButton'
        Caption="Quit"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.7000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        TabOrder=3
        bFocusOnWatch=true
        OnClick=XDOTZMPPause.ButtonClicked
    end object
    QuitButton=QuitButton_btn
    // Reference: GUIImage'XDOTZMPPause.FriendsRequestNotification_icn'
    begin object name=FriendsRequestNotification_icn class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.XBoxIcons.FriendRequest'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.4000000
        WinLeft=0.3500000
        WinWidth=0.0800000
        WinHeight=0.0800000
    end object
    FriendsRequestNotification=FriendsRequestNotification_icn
    // Reference: GUIImage'XDOTZMPPause.FriendsInviteNotification_icn'
    begin object name=FriendsInviteNotification_icn class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.XBoxIcons.Invite'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.4000000
        WinLeft=0.3500000
        WinWidth=0.0800000
        WinHeight=0.0800000
    end object
    FriendsInviteNotification=FriendsInviteNotification_icn
    ContinueMenu="DOTZMenu.XDOTZSPLevelList"
    PlayersListMenu="DOTZMenu.XDOTZLivePlayersListIG"
    FriendsListMenu="DOTZMenu.XDOTZLiveFriendsListIG"
    OptionsMenu="DOTZMenu.XDOTZOptionsIG"
    QuitMenu="DOTZMenu.XDOTZHostQuitConfirm"
    PageCaption="Paused"
    ClickSound=Sound'DOTZXInterface.Select'
    WinTop=0.2500000
    WinHeight=0.5000000
    OnKeyEvent=XDOTZMPPause.HandleKeyEvent
}