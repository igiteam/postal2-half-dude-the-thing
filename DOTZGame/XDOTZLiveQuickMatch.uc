/**
 * XDOTZLiveMultiplayer
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZLiveQuickMatch extends XDOTZLiveMatchPage;



//Page components
var Automated GuiLabel   SessionNameTitleLabel;
var Automated GuiLabel   GametypeTitleLabel;
var Automated GuiLabel   MapNameTitleLabel;
var Automated GuiLabel   TimeLimitTitleLabel;
var Automated GuiLabel   ScoreLimitTitleLabel;
var Automated GuiLabel   MaxPlayersTitleLabel;
var Automated GuiLabel   FriendlyFireTitleLabel;

var Automated GuiLabel   SessionNameValueLabel;
var Automated GuiLabel   GametypeValueLabel;
var Automated GuiLabel   MapNameValueLabel;
var Automated GuiLabel   TimeLimitValueLabel;
var Automated GuiLabel   ScoreLimitValueLabel;
var Automated GuiLabel   MaxPlayersValueLabel;
var Automated GuiLabel   FriendlyFireValueLabel;

var int match_num;

//configurable stuff
var localized string PageCaption;

// Menu locations
var string    ErrorMenu;
var string    NoSessionsMenu;

//
var string    EmptyEntry;

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
   AddNextButton ();
}


/*****************************************************************
 * Happens every time the menu is opened, not just the first.
 *****************************************************************
 */

event Opened( GUIComponent Sender ) {
    super.Opened(Sender);

    UpdateSessionText ();
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

/*function bool ButtonClicked(GUIComponent Sender) {
    local GUIButton Selected;

    if (GUIButton(Sender) != None) Selected = GUIButton(Sender);
    if (Selected == None) return false;


    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {
        case QuickMatchButton:
             return Controller.OpenMenu(QuickMatchMenu); break;

        case OptimatchButton:
             return Controller.OpenMenu(OptimatchMenu); break;

        case CreateMatchButton:
             return Controller.OpenMenu(CreateMatchMenu); break;

        case FriendsListButton:
             return Controller.OpenMenu(FriendsListMenu); break;

        case DashboardButton:
             class'UtilsXbox'.static.Do_Dashboard();
             return false;
             break;

        case SignOutButton:
             return BBGuiController(Controller).CloseTo ('XDOTZLiveSignIn');
             //return Controller.OpenMenu(SignOutMenu); break;
    };

   return false;
}*/

/*****************************************************************
 * A Button pressed
 *****************************************************************
 */

function DoButtonA ()
{
    // Currently viewd session is already selected
    // so all we have to do is reboot.

    class'UtilsXbox'.static.Set_Reboot_Type(4);   // Is live client

    // Display loading screen
    //Controller.OpenMenu("DOTZMenu.XDOTZLoadingMenu");

    // Not joining a friend
    class'UtilsXbox'.static.Live_Client_Set_Joining_Friend(false);
    class'UtilsXbox'.static.Live_Client_Set_Joining_Cross(false);

    // Reboot!
    //Console(Controller.Master.Console).ConsoleCommand("reboot");  // URL not part of command on xbox

    // 0.0.0.0 Gets replaced with the real IP after reboot
    Controller.OpenMenu("DOTZMenu.XDOTZCharacterSelect", "0.0.0.0"
            //$ "?XGAMERTAG=" $ EncodeStringURL(class'UtilsXbox'.static.Get_Current_Name())
            //$ "?XUID=" $ class'UtilsXbox'.static.Get_Current_ID()
            //$ "?XNADDR=" $ class'UtilsXbox'.static.Get_Current_Address()
        );

}

/*****************************************************************
 * B Button pressed
 *****************************************************************
 */

function DoButtonB ()
{
    Controller.CloseMenu(true);
}

/*****************************************************************
 * X Button pressed
 *****************************************************************
 */

function DoButtonX ()
{
    local int numsessions;
    numsessions = class'UtilsXbox'.static.Match_Get_Num_Sessions ();

    match_num++;

    if (match_num >= numsessions) {
        match_num = 0;
    }

    UpdateSessionText ();
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
 * UpdateSessionText
 *****************************************************************
 */

function UpdateSessionText ()
{
    local int numsessions;

    local string sessionname;
    local int gametype;
    local int mapindex;
    local int timelimit;
    local int scorelimit;
    local int FriendlyFire;
    local int maxplayers;

    numsessions = class'UtilsXbox'.static.Match_Get_Num_Sessions ();

    if (match_num < numsessions) {
        class'UtilsXbox'.static.Match_Select (match_num);

        sessionname = class'UtilsXbox'.static.Match_Get_SessionName ();
        gametype = class'UtilsXbox'.static.Match_Get_Gametype ();
        mapindex = class'UtilsXbox'.static.Match_Get_Map_Index ();
        timelimit = class'UtilsXbox'.static.Match_Get_TimeLimit ();
        scorelimit = class'UtilsXbox'.static.Match_Get_ScoreLimit ();
        maxplayers = class'UtilsXbox'.static.Match_Get_MaxPlayers ();
        FriendlyFire = class'UtilsXbox'.static.Match_Get_RegenerateAmmo ();

        SessionNameValueLabel.Caption = sessionname;
        GametypeValueLabel.Caption = IntToGameType (gametype);
        MapNameValueLabel.Caption = IntToMap (mapindex);
        TimeLimitValueLabel.Caption = string(timelimit);
        ScoreLimitValueLabel.Caption = string(scorelimit);
        MaxPlayersValueLabel.Caption = string(maxplayers);
        FriendlyFireValueLabel.Caption = IntToYesNo(FriendlyFire);
    } else {
        SessionNameValueLabel.Caption = EmptyEntry;
        GametypeValueLabel.Caption = EmptyEntry;
        TimeLimitValueLabel.Caption = EmptyEntry;
        ScoreLimitValueLabel.Caption = EmptyEntry;
        MaxPlayersValueLabel.Caption = EmptyEntry;
        FriendlyFireValueLabel.Caption = EmptyEntry;
    }

}

/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUILabel'XDOTZLiveQuickMatch.SessionNameTitleLabel_lbl'
    begin object name=SessionNameTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Session Name:"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2000000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    SessionNameTitleLabel=SessionNameTitleLabel_lbl
    // Reference: GUILabel'XDOTZLiveQuickMatch.GametypeTitleLabel_lbl'
    begin object name=GametypeTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Game Type:"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2800000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    GametypeTitleLabel=GametypeTitleLabel_lbl
    // Reference: GUILabel'XDOTZLiveQuickMatch.MapNameTitleLabel_lbl'
    begin object name=MapNameTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Map Name:"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3600000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    MapNameTitleLabel=MapNameTitleLabel_lbl
    // Reference: GUILabel'XDOTZLiveQuickMatch.TimeLimitTitleLabel_lbl'
    begin object name=TimeLimitTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Time Limit:"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4400000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    TimeLimitTitleLabel=TimeLimitTitleLabel_lbl
    // Reference: GUILabel'XDOTZLiveQuickMatch.ScoreLimitTitleLabel_lbl'
    begin object name=ScoreLimitTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Score Limit:"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5200000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    ScoreLimitTitleLabel=ScoreLimitTitleLabel_lbl
    // Reference: GUILabel'XDOTZLiveQuickMatch.MaxPlayersTitleLabel_lbl'
    begin object name=MaxPlayersTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Max Players:"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    MaxPlayersTitleLabel=MaxPlayersTitleLabel_lbl
    // Reference: GUILabel'XDOTZLiveQuickMatch.FriendlyFireTitleLabel_lbl'
    begin object name=FriendlyFireTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Regenerate Ammo:"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        WinTop=0.6800000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    FriendlyFireTitleLabel=FriendlyFireTitleLabel_lbl
    // Reference: GUILabel'XDOTZLiveQuickMatch.SessionNameValueLabel_lbl'
    begin object name=SessionNameValueLabel_lbl class=Class'GUI.GUILabel'
        Caption="..."
        TextFont="XPlainMedFont"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2000000
        WinLeft=0.5000000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    SessionNameValueLabel=SessionNameValueLabel_lbl
    // Reference: GUILabel'XDOTZLiveQuickMatch.GametypeValueLabel_lbl'
    begin object name=GametypeValueLabel_lbl class=Class'GUI.GUILabel'
        Caption="..."
        TextFont="XPlainMedFont"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2800000
        WinLeft=0.5000000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    GametypeValueLabel=GametypeValueLabel_lbl
    // Reference: GUILabel'XDOTZLiveQuickMatch.MapNameValueLabel_lbl'
    begin object name=MapNameValueLabel_lbl class=Class'GUI.GUILabel'
        Caption="..."
        TextFont="XPlainMedFont"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3600000
        WinLeft=0.5000000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    MapNameValueLabel=MapNameValueLabel_lbl
    // Reference: GUILabel'XDOTZLiveQuickMatch.TimeLimitValueLabel_lbl'
    begin object name=TimeLimitValueLabel_lbl class=Class'GUI.GUILabel'
        Caption="..."
        TextFont="XPlainMedFont"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4400000
        WinLeft=0.5000000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    TimeLimitValueLabel=TimeLimitValueLabel_lbl
    // Reference: GUILabel'XDOTZLiveQuickMatch.ScoreLimitValueLabel_lbl'
    begin object name=ScoreLimitValueLabel_lbl class=Class'GUI.GUILabel'
        Caption="..."
        TextFont="XPlainMedFont"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5200000
        WinLeft=0.5000000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    ScoreLimitValueLabel=ScoreLimitValueLabel_lbl
    // Reference: GUILabel'XDOTZLiveQuickMatch.MaxPlayersValueLabel_lbl'
    begin object name=MaxPlayersValueLabel_lbl class=Class'GUI.GUILabel'
        Caption="..."
        TextFont="XPlainMedFont"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.5000000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    MaxPlayersValueLabel=MaxPlayersValueLabel_lbl
    // Reference: GUILabel'XDOTZLiveQuickMatch.FriendlyFireValueLabel_lbl'
    begin object name=FriendlyFireValueLabel_lbl class=Class'GUI.GUILabel'
        Caption="..."
        TextFont="XPlainMedFont"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        WinTop=0.6800000
        WinLeft=0.5000000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    FriendlyFireValueLabel=FriendlyFireValueLabel_lbl
    PageCaption="Quick Match"
    NoSessionsMenu="DOTZMenu.XDOTZLiveNoSessionsError"
    EmptyEntry="..."
    ClickSound=Sound'DOTZXInterface.Select'
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnKeyEvent=XDOTZLiveQuickMatch.HandleKeyEvent
}