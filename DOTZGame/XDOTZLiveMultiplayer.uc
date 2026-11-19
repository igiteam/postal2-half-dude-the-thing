/**
 * XDOTZLiveMultiplayer
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZLiveMultiplayer extends XDOTZLivePage;



//Page components
var Automated GuiButton  QuickMatchButton;
var Automated GuiButton  OptimatchButton;
var Automated GuiButton  CreateMatchButton;
var Automated GuiButton  FriendsListButton;
//var Automated GuiButton  DashboardButton;
var Automated GuiButton  AppearOfflineButton;
var Automated GuiButton  SignOutButton;

var Automated GUIImage   FriendsRequestNotification;
var Automated GUIImage   FriendsInviteNotification;

//configurable stuff
var string QuickMatchMenu;
var string OptimatchMenu;
var string CreateMatchMenu;
var string FriendsListMenu;
//var string DashboardMenu;
var string ErrorMenu;
var string GettingMatchesMenu;



//configurable stuff
var localized string PageCaption;
var localized string appear_offline_string;             // "Appear Offline"
var localized string appear_online_string;              // "Appear Online"


var sound ClickSound;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner )
{
   Super.Initcomponent(MyController, MyOwner);
   // init my components...

   SetPageCaption (PageCaption);
   AddBackButton ();
   AddSelectButton ();

    // Check for recommended message
    if (class'UtilsXbox'.static.Is_Optional_Message()) {
        Controller.OpenMenu("DOTZMenu.XDOTZLiveMessage");
    }

    // Online/offline text
    if (class'UtilsXbox'.static.Is_Player_Online_Set()) {
        AppearOfflineButton.Caption = appear_offline_string;
    } else {
        AppearOfflineButton.Caption = appear_online_string;
    }
}


/*****************************************************************
 * Happens every time the menu is opened, not just the first.
 *****************************************************************
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
    local int error;

    if (GUIButton(Sender) != None) Selected = GUIButton(Sender);
    if (Selected == None) return false;

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {
        case QuickMatchButton:
             // Query the match making service
             class'UtilsXbox'.static.Match_Refresh ();

             // Check errors
             error = class'UtilsXbox'.static.Get_Last_Error();
             if (error > 0) {
                Controller.OpenMenu(ErrorMenu);
             } else {
                Controller.OpenMenu(GettingMatchesMenu, "DOTZMenu.XDOTZLiveQuickMatch");
             }

             return false;
             break;

        case OptimatchButton:
             return Controller.OpenMenu(OptimatchMenu); break;

        case CreateMatchButton:
             return Controller.OpenMenu(CreateMatchMenu); break;

        case FriendsListButton:
             return Controller.OpenMenu(FriendsListMenu);
             break;

        /*case DashboardButton:
             class'UtilsXbox'.static.Do_Dashboard();
             return false;
             break; */

        case AppearOfflineButton:
             if (class'UtilsXbox'.static.Is_Player_Online_Set()) {
                 class'UtilsXbox'.static.Set_Player_Offline();
                 AppearOfflineButton.Caption = appear_online_string;
             } else {
                 class'UtilsXbox'.static.Set_Player_Online();
                 AppearOfflineButton.Caption = appear_offline_string;
             }
             break;

        case SignOutButton:
             class'UtilsXbox'.static.Sign_Out();
             return BBGuiController(Controller).CloseTo ('XDOTZLiveSignIn');
             //return Controller.OpenMenu(SignOutMenu); break;
    };

   return false;
}

/*****************************************************************
 * B Button pressed
 *****************************************************************
 */

function DoButtonB ()
{
    BBGuiController(Controller).CloseTo ('XDOTZMainMenu');
}

/*****************************************************************
 * NotifyLevelChange
 *****************************************************************
 */

event NotifyLevelChange()
{
    Controller.CloseMenu(true);
}

/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUIButton'XDOTZLiveMultiplayer.QuickMatchButton_btn'
    begin object name=QuickMatchButton_btn class=Class'GUI.GUIButton'
        Caption="Quick Match"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2500000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZLiveMultiplayer.ButtonClicked
    end object
    QuickMatchButton=QuickMatchButton_btn
    // Reference: GUIButton'XDOTZLiveMultiplayer.OptimatchButton_btn'
    begin object name=OptimatchButton_btn class=Class'GUI.GUIButton'
        Caption="OptiMatch"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3400000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZLiveMultiplayer.ButtonClicked
    end object
    OptimatchButton=OptimatchButton_btn
    // Reference: GUIButton'XDOTZLiveMultiplayer.CreateMatchButton_btn'
    begin object name=CreateMatchButton_btn class=Class'GUI.GUIButton'
        Caption="Create Match"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4200000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZLiveMultiplayer.ButtonClicked
    end object
    CreateMatchButton=CreateMatchButton_btn
    // Reference: GUIButton'XDOTZLiveMultiplayer.FriendsListButton_btn'
    begin object name=FriendsListButton_btn class=Class'GUI.GUIButton'
        Caption="Friends List"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZLiveMultiplayer.ButtonClicked
    end object
    FriendsListButton=FriendsListButton_btn
    // Reference: GUIButton'XDOTZLiveMultiplayer.AppearOfflineButton_btn'
    begin object name=AppearOfflineButton_btn class=Class'GUI.GUIButton'
        Caption="Appear Offline"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5900000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZLiveMultiplayer.ButtonClicked
    end object
    AppearOfflineButton=AppearOfflineButton_btn
    // Reference: GUIButton'XDOTZLiveMultiplayer.SignOutButton_btn'
    begin object name=SignOutButton_btn class=Class'GUI.GUIButton'
        Caption="Sign Out"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6800000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZLiveMultiplayer.ButtonClicked
    end object
    SignOutButton=SignOutButton_btn
    // Reference: GUIImage'XDOTZLiveMultiplayer.FriendsRequestNotification_icn'
    begin object name=FriendsRequestNotification_icn class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.XBoxIcons.FriendRequest'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.5000000
        WinLeft=0.3500000
        WinWidth=0.0800000
        WinHeight=0.0800000
    end object
    FriendsRequestNotification=FriendsRequestNotification_icn
    // Reference: GUIImage'XDOTZLiveMultiplayer.FriendsInviteNotification_icn'
    begin object name=FriendsInviteNotification_icn class=Class'GUI.GUIImage'
        Image=Texture'DOTZTInterface.XBoxIcons.Invite'
        ImageStyle=4
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        bNeverFocus=true
        WinTop=0.5000000
        WinLeft=0.3500000
        WinWidth=0.0800000
        WinHeight=0.0800000
    end object
    FriendsInviteNotification=FriendsInviteNotification_icn
    QuickMatchMenu="DOTZMenu.XDOTZLiveQuickMatch"
    OptimatchMenu="DOTZMenu.XDOTZLiveOptiMatch"
    CreateMatchMenu="DOTZMenu.XDOTZLiveCreateMatch"
    FriendsListMenu="DOTZMenu.XDOTZLiveFriendsList"
    ErrorMenu="DOTZMenu.XDOTZLiveError"
    GettingMatchesMenu="DOTZMenu.XDOTZLiveGettingMatches"
    PageCaption="Xbox Live Multiplayer"
    appear_offline_string="Appear Offline"
    appear_online_string="Appear Online"
    ClickSound=Sound'DOTZXInterface.Select'
    period=0.0500000
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnKeyEvent=XDOTZLiveMultiplayer.HandleKeyEvent
}