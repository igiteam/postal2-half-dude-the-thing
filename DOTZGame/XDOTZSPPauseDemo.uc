/**
 * XDOTZSPPauseDemo- demo pause page
 *  -ripped from XDOTZSPPause
 *
 * @author  Seelan Vamatheva
 * @version $Revision: 1.0 $
 * @date    June 21, 2005
 */

class XDOTZSPPauseDemo extends XDOTZInGamePage;



//Page components
var Automated GuiButton  ContinueButton;
var Automated GuiButton  FriendsListButton;
var Automated GuiButton  OfflineButton;
var Automated GuiButton  SaveButton;
var Automated GuiButton  LoadButton;
var Automated GuiButton  QuitButton;

var Automated GUIImage   FriendsRequestNotification;
var Automated GUIImage   FriendsInviteNotification;

//configurable stuff
var string ContinueMenu;              // Single Player menu location
var string FriendsListMenu;           // Xbox Live menu location
var string SaveMenu;
var string LoadMenu;      // System Link menu location
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
   // if (!class'UtilsXbox'.static.Is_Signed_In()) {
        // Hide button and move up other two

        SaveButton.WinTop = SaveButton.WinTop - 0.2;
        LoadButton.WinTop = LoadButton.WinTop - 0.2;
        QuitButton.WinTop = QuitButton.WinTop - 0.2;

        RemoveComponent(FriendsListButton, true);
        RemoveComponent(OfflineButton, true);
        MapControls();
        /*
    } else {
        if (class'UtilsXbox'.static.Is_Player_Online_Set()) {
            OfflineButton.Caption = appear_offline_string;
        } else {
            OfflineButton.Caption = appear_online_string;
        }
    }
    */
}


/**
 * Happens every time the menu is opened, not just the first.
 */
event Opened( GUIComponent Sender ) {
    super.Opened(Sender);

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

        case QuitButton:
             return Controller.OpenMenu(QuitMenu);
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
    // Reference: GUIButton'XDOTZSPPauseDemo.ContinueButton_btn'
    begin object name=ContinueButton_btn class=Class'GUI.GUIButton'
        Caption="Continue"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.1000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZSPPauseDemo.ButtonClicked
    end object
    ContinueButton=ContinueButton_btn
    // Reference: GUIButton'XDOTZSPPauseDemo.FriendsListButton_btn'
    begin object name=FriendsListButton_btn class=Class'GUI.GUIButton'
        Caption="Friends List"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZSPPauseDemo.ButtonClicked
    end object
    FriendsListButton=FriendsListButton_btn
    // Reference: GUIButton'XDOTZSPPauseDemo.OfflineButton_btn'
    begin object name=OfflineButton_btn class=Class'GUI.GUIButton'
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=1
        bFocusOnWatch=true
        OnClick=XDOTZSPPauseDemo.ButtonClicked
    end object
    OfflineButton=OfflineButton_btn
    // Reference: GUIButton'XDOTZSPPauseDemo.SaveButton_btn'
    begin object name=SaveButton_btn class=Class'GUI.GUIButton'
        Caption="Save Game"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.4000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
    end object
    SaveButton=SaveButton_btn
    // Reference: GUIButton'XDOTZSPPauseDemo.RevertToLastSaveButton_btn'
    begin object name=RevertToLastSaveButton_btn class=Class'GUI.GUIButton'
        Caption="Load Game"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.5000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
    end object
    LoadButton=RevertToLastSaveButton_btn
    // Reference: GUIButton'XDOTZSPPauseDemo.QuitButton_btn'
    begin object name=QuitButton_btn class=Class'GUI.GUIButton'
        Caption="Quit"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        TabOrder=3
        bFocusOnWatch=true
        OnClick=XDOTZSPPauseDemo.ButtonClicked
    end object
    QuitButton=QuitButton_btn
    // Reference: GUIImage'XDOTZSPPauseDemo.FriendsRequestNotification_icn'
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
    // Reference: GUIImage'XDOTZSPPauseDemo.FriendsInviteNotification_icn'
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
    SaveMenu="DOTZMenu.XDOTZSaveMenu"
    LoadMenu="DOTZMenu.XDOTZLoadMenu"
    QuitMenu="DOTZMenu.XDOTZQuitConfirmDemo"
    PageCaption="Paused"
    ClickSound=Sound'DOTZXInterface.Select'
    WinTop=0.2500000
    WinHeight=0.5000000
    OnKeyEvent=XDOTZSPPauseDemo.HandleKeyEvent
}