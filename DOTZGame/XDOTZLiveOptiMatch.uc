/**
 * XDOTZLiveMultiplayer
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZLiveOptiMatch extends XDOTZLiveMatchPage;



//Page components
var Automated GuiLabel   GametypeTitleLabel;
var Automated GuiLabel   MaxPlayersTitleLabel;

var Automated BBXSelectBox   GametypeSelect;
var Automated BBXSelectBox   MaxPlayersValue;

var Automated GuiButton  SearchMatchButton;

//configurable stuff
var localized string PageCaption;

// Menu locations
var string    ErrorMenu;
var string    GettingMatchesMenu;

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
   //AddSelectButton ();
   AddContinueButton();

   // Populate Menus

   // Game type
   FillInGameTypesAny(GametypeSelect);
   GametypeSelect.SetIndex(4);

   // Max players
//   FillInPlayerLimitsAny(MaxPlayersValue);
  // MaxPlayersValue.SetIndex(8);
}


/*****************************************************************
 * Happens every time the menu is opened, not just the first.
 *****************************************************************
 */

event Opened( GUIComponent Sender ) {
    super.Opened(Sender);
}

function GameTypeChange( GUIComponent Sender ) {
   FillInPlayerLimitsAny(MaxPlayersValue, GameTypeSelect.List.Index);
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
 * A Button pressed
 *****************************************************************
 */

function DoButtonA ()
{
     local int gametype;
     local int maxplayers;
     local int error;

     // Get the values for the query
     gametype = GametypeSelect.List.Index;
     maxplayers = MaxPlayersValue.List.Index + 1;

     // Check for wildcard
     if (IsGameTypeIndexWildcard(gametype))
         gametype = -1;

     if (IsPlayerIndexWildcard(gametype, maxplayers))
         maxplayers = -1;

     Log("Searching for matches " $ gametype $ " " $ maxplayers);


     // Query the match making service
     class'UtilsXbox'.static.Match_Refresh_Criteria (gametype, maxplayers);

     // Check errors
     error = class'UtilsXbox'.static.Get_Last_Error();
     if (error > 0) {
        Controller.OpenMenu(ErrorMenu);
     } else {
        Controller.OpenMenu(GettingMatchesMenu, "DOTZMenu.XDOTZLiveOptiMatchResults");
     }
}

/*****************************************************************
 * B Button pressed
 *****************************************************************
 */

function DoButtonB ()
{
    BBGuiController(Controller).CloseTo ('XDOTZLiveMultiplayer');
}

/*****************************************************************
 * X Button pressed
 *****************************************************************
 */

function DoButtonX ()
{

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
 * ButtonClicked
 * Notification that the user clicked a component on the page
 *****************************************************************
 */
/*function bool ButtonClicked(GUIComponent Sender) {
    local GUIButton Selected;
    local int gametype;
    local int maxplayers;
    local int error;

    if (GUIButton(Sender) != None) Selected = GUIButton(Sender);
    if (Selected == None) return false;


    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {
        case SearchMatchButton:
             // Get the values for the query
             gametype = GametypeSelect.List.Index;
             maxplayers = MaxPlayersValue.List.Index + 1;

             // Check for wildcard
             if (IsGameTypeIndexWildcard(gametype))
                 gametype = -1;

             if (IsPlayerIndexWildcard(maxplayers))
                 maxplayers = -1;

             // Query the match making service
             class'UtilsXbox'.static.Match_Refresh_Criteria (gametype, maxplayers);

             // Check errors
             error = class'UtilsXbox'.static.Get_Last_Error();
             if (error > 0) {
                Controller.OpenMenu(ErrorMenu);
             } else {
                Controller.OpenMenu(GettingMatchesMenu, "DOTZMenu.XDOTZLiveOptiMatchResults");
             }

             return false;
             break;
    };

   return false;
}  */


/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUILabel'XDOTZLiveOptiMatch.GametypeTitleLabel_lbl'
    begin object name=GametypeTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Game Type:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3900000
        WinLeft=0.2000000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    GametypeTitleLabel=GametypeTitleLabel_lbl
    // Reference: GUILabel'XDOTZLiveOptiMatch.MaxPlayersTitleLabel_lbl'
    begin object name=MaxPlayersTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Max Players:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4700000
        WinLeft=0.2000000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    MaxPlayersTitleLabel=MaxPlayersTitleLabel_lbl
    // Reference: BBXSelectBox'XDOTZLiveOptiMatch.GametypeValue_lbl'
    begin object name=GametypeValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.4100000
        WinLeft=0.4000000
        WinWidth=0.4000000
        WinHeight=0.0600000
        OnChange=XDOTZLiveOptiMatch.GameTypeChange
    end object
    GameTypeSelect=GametypeValue_lbl
    // Reference: BBXSelectBox'XDOTZLiveOptiMatch.MaxPlayersValue_lbl'
    begin object name=MaxPlayersValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.4900000
        WinLeft=0.4000000
        WinWidth=0.4000000
        WinHeight=0.0600000
    end object
    MaxPlayersValue=MaxPlayersValue_lbl
    PageCaption="OptiMatch"
    ErrorMenu="DOTZMenu.XDOTZLiveError"
    GettingMatchesMenu="DOTZMenu.XDOTZLiveGettingMatches"
    ClickSound=Sound'DOTZXInterface.Select'
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnKeyEvent=XDOTZLiveOptiMatch.HandleKeyEvent
}