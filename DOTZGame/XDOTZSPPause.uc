/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZSPPause extends XDOTZInGamePage;



//Page components
var Automated GuiButton  ContinueButton;
var Automated GuiButton  FriendsListButton;
var Automated GuiButton  OfflineButton;
var Automated GuiButton  RevertButton;
//var Automated GuiButton  LoadButton;
var Automated GuiButton  OptionsButton;
var Automated GuiButton  QuitButton;

var Automated GUIImage   FriendsRequestNotification;
var Automated GUIImage   FriendsInviteNotification;

//configurable stuff
var string ContinueMenu;              // Single Player menu location
var string FriendsListMenu;           // Xbox Live menu location
var string RevertMenu;
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

        RevertButton.WinTop = RevertButton.WinTop - 0.2;
        //LoadButton.WinTop = LoadButton.WinTop - 0.2;
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

    // if saving is disabled
    if (!class'UtilsXbox'.static.Get_Save_Enable()) {
       // Hide button and move up other two

        QuitButton.WinTop = QuitButton.WinTop - 0.1;

        RemoveComponent(OptionsButton, true);
        MapControls();
    }

}


/**
 * Happens every time the menu is opened, not just the first.
 */
event Opened( GUIComponent Sender ) {
    super.Opened(Sender);

    Refresh_Icons();

    // Add a delay before accepting input
    accept_input = false;
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

        case FriendsListButton:
             return Controller.OpenMenu(FriendsListMenu);
             break;

        case RevertButton:
             return Controller.OpenMenu(RevertMenu);
             break;

        //case LoadButton:
             //return Controller.OpenMenu(LoadMenu,"true");
             //break;

        case OptionsButton:
             return Controller.OpenMenu(OptionsMenu);
             break;

        case QuitButton:
             return Controller.OpenMenu(QuitMenu);
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
    // Unpause
    Controller.ViewportOwner.Actor.Level.Game
        .SetPause( false, Controller.ViewportOwner.Actor );
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
    // Reference: GUIButton'XDOTZSPPause.ContinueButton_btn'
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
        OnClick=XDOTZSPPause.ButtonClicked
    end object
    ContinueButton=ContinueButton_btn
    // Reference: GUIButton'XDOTZSPPause.FriendsListButton_btn'
    begin object name=FriendsListButton_btn class=Class'GUI.GUIButton'
        Caption="Friends List"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZSPPause.ButtonClicked
    end object
    FriendsListButton=FriendsListButton_btn
    // Reference: GUIButton'XDOTZSPPause.OfflineButton_btn'
    begin object name=OfflineButton_btn class=Class'GUI.GUIButton'
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZSPPause.ButtonClicked
    end object
    OfflineButton=OfflineButton_btn
    // Reference: GUIButton'XDOTZSPPause.RevertButton_btn'
    begin object name=RevertButton_btn class=Class'GUI.GUIButton'
        Caption="Load Last Checkpoint"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        TabOrder=2
        bFocusOnWatch=true
        OnClick=XDOTZSPPause.ButtonClicked
    end object
    RevertButton=RevertButton_btn
    // Reference: GUIButton'XDOTZSPPause.OptionsButton_btn'
    begin object name=OptionsButton_btn class=Class'GUI.GUIButton'
        Caption="Settings"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        TabOrder=3
        bFocusOnWatch=true
        OnClick=XDOTZSPPause.ButtonClicked
    end object
    OptionsButton=OptionsButton_btn
    // Reference: GUIButton'XDOTZSPPause.QuitButton_btn'
    begin object name=QuitButton_btn class=Class'GUI.GUIButton'
        Caption="Quit"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0999000
        TabOrder=4
        bFocusOnWatch=true
        OnClick=XDOTZSPPause.ButtonClicked
    end object
    QuitButton=QuitButton_btn
    // Reference: GUIImage'XDOTZSPPause.FriendsRequestNotification_icn'
    begin object name=FriendsRequestNotification_icn class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.XBoxIcons.FriendRequest'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.2000000
        WinLeft=0.3500000
        WinWidth=0.0800000
        WinHeight=0.0800000
    end object
    FriendsRequestNotification=FriendsRequestNotification_icn
    // Reference: GUIImage'XDOTZSPPause.FriendsInviteNotification_icn'
    begin object name=FriendsInviteNotification_icn class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.XBoxIcons.Invite'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.2000000
        WinLeft=0.3500000
        WinWidth=0.0800000
        WinHeight=0.0800000
    end object
    FriendsInviteNotification=FriendsInviteNotification_icn
    ContinueMenu="DOTZMenu.XDOTZSPLevelList"
    FriendsListMenu="DOTZMenu.XDOTZLiveFriendsListIG"
    RevertMenu="DOTZMenu.XDOTZLoadConfirm"
    OptionsMenu="DOTZMenu.XDOTZOptionsIGSP"
    QuitMenu="DOTZMenu.XDOTZQuitConfirm"
    PageCaption="Paused"
    ClickSound=Sound'DOTZXInterface.Select'
    period=0.1000000
    WinTop=0.2500000
    WinHeight=0.5000000
    OnKeyEvent=XDOTZSPPause.HandleKeyEvent
}