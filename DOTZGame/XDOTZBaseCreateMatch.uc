/**
 * XDOTZLiveMultiplayer
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZBaseCreateMatch extends XDOTZLiveMatchPage;



//Page components
var Automated GuiLabel   GametypeTitleLabel;
var Automated GuiLabel   MapsTitleLabel;
var Automated GuiLabel   TimeLimitTitleLabel;
var Automated GuiLabel   ScoreLimitTitleLabel;
var Automated GuiLabel   MaxPlayersTitleLabel;
var Automated GuiLabel   FriendlyFireTitleLabel;
var Automated GuiLabel   EnemyStrengthLabel;

var Automated BBXSelectBox GameTypeSelect;
var Automated BBXSelectBox MapsSelect;
var Automated BBXSelectBox TimeLimitSelect;
var Automated BBXSelectBox   ScoreLimitValue;
var Automated BBXSelectBox   MaxPlayersValue;
var Automated BBXSelectBox   FriendlyFireValue;
var Automated BBXSelectBox   EnemyStrengthValue;

//var Automated GuiButton  CreateMatchButton;


var sound ClickSound;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner )
{
   Super.Initcomponent(MyController, MyOwner);
   // init my components...

   AddBackButton ();
   AddContinueButton ();

   // Populate Menus

   // Game type
   FillInGameTypes(GametypeSelect);

   // Time limit
   FillInTimeLimits(TimeLimitSelect);
   TimeLimitSelect.SetIndex(9);

   // Score limit
   //FillInScoreLimits(ScoreLimitValue, GametypeSelect.List.Index);
   //ScoreLimitValue.AddItem(UnlimitedText);

   // Max players
   //FillInPlayerLimits(MaxPlayersValue);
   //MaxPlayersValue.SetIndex(7);

   //Friendly Fire
   FriendlyFireValue.AddItem(IntToYesNo(0));
   FriendlyFireValue.AddItem(IntToYesNo(1));

   EnemyStrengthValue.AddItem(EnemyPatheticTxt);
   EnemyStrengthValue.AddItem(EnemyNormalTxt);
   EnemyStrengthValue.AddItem(EnemyImpossibleTxt);
   EnemyStrengthValue.SetIndex(1);
}


/*****************************************************************
 * Happens every time the menu is opened, not just the first.
 *****************************************************************
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
 * A Button pressed
 *****************************************************************
 */

function DoButtonA ()
{
    StartHosting ();
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
 * NotifyLevelChange
 *****************************************************************
 */

event NotifyLevelChange()
{
    Controller.CloseMenu(true);
}

/*****************************************************************
 * Game type change
 *****************************************************************
 */

function GameTypeChange( GUIComponent Sender ) {
   // Maps
   MapsSelect.List.Clear();
   FillInMapTitles(MapsSelect, GametypeSelect.List.Index);

   //score limits
   ScoreLimitValue.List.Clear();
   FillInScoreLimits(ScoreLimitValue, GametypeSelect.List.Index);

   FillInPlayerLimits(MaxPlayersValue, GameTypeSelect.List.Index);


}

/*****************************************************************
 * ButtonClicked
 * Notification that the user clicked a component on the page
 *****************************************************************
 */

function StartHosting () {

}

/*****************************************************************
 * ButtonClicked
 * Notification that the user clicked a component on the page
 *****************************************************************
 */
function bool ButtonClicked(GUIComponent Sender) {
    local GUIButton Selected;

    if (GUIButton(Sender) != none || BBXSelectBox(Sender) !=none) {
      Selected = GUIButton(Sender);
    }
    if (Selected == None) return false;


   	PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {
        /*case CreateMatchButton:
             StartHosting ();
             return false;
             break;*/
    };

   return false;
}


/*****************************************************************
 * SetTeamMatchStatus
 * Use the notification to determine if a friendlyfire button makes
 * any sense to display
 *****************************************************************
 */
function SetTeamMatchStatus(bool IsTeamGame){
   super.SetTeamMatchStatus(IsTeamGame);
   FriendlyFireValue.bNeverFocus = !IsTeamGame;
   FriendlyFireValue.bVisible = IsTeamGame;
   FriendlyFireTitleLabel.bVisible = IsTeamGame;
   MapControls();
}


/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUILabel'XDOTZBaseCreateMatch.GametypeTitleLabel_lbl'
    begin object name=GametypeTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Game Type:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2000000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    GametypeTitleLabel=GametypeTitleLabel_lbl
    // Reference: GUILabel'XDOTZBaseCreateMatch.MapsTitleLabel_lbl'
    begin object name=MapsTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Map:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2700000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    MapsTitleLabel=MapsTitleLabel_lbl
    // Reference: GUILabel'XDOTZBaseCreateMatch.TimeLimitTitleLabel_lbl'
    begin object name=TimeLimitTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Time Limit:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3400000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    TimeLimitTitleLabel=TimeLimitTitleLabel_lbl
    // Reference: GUILabel'XDOTZBaseCreateMatch.ScoreLimitTitleLabel_lbl'
    begin object name=ScoreLimitTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Score Limit:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4100000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    ScoreLimitTitleLabel=ScoreLimitTitleLabel_lbl
    // Reference: GUILabel'XDOTZBaseCreateMatch.MaxPlayersTitleLabel_lbl'
    begin object name=MaxPlayersTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Max Players:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4800000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    MaxPlayersTitleLabel=MaxPlayersTitleLabel_lbl
    // Reference: GUILabel'XDOTZBaseCreateMatch.FriendlyFireTitleLabel_lbl'
    begin object name=FriendlyFireTitleLabel_lbl class=Class'GUI.GUILabel'
        Caption="Friendly Fire:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        bVisible=false
        WinTop=0.6200000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    FriendlyFireTitleLabel=FriendlyFireTitleLabel_lbl
    // Reference: GUILabel'XDOTZBaseCreateMatch.EnemyStrengthLabel_lbl'
    begin object name=EnemyStrengthLabel_lbl class=Class'GUI.GUILabel'
        Caption="Enemy Resilience:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5500000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    EnemyStrengthLabel=EnemyStrengthLabel_lbl
    // Reference: BBXSelectBox'XDOTZBaseCreateMatch.GametypeValue_lbl'
    begin object name=GametypeValue_lbl class=Class'BBGui.BBXSelectBox'
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2200000
        WinLeft=0.4500000
        WinWidth=0.4000000
        WinHeight=0.0600000
        OnClick=XDOTZBaseCreateMatch.ButtonClicked
        OnChange=XDOTZBaseCreateMatch.GameTypeChange
    end object
    GameTypeSelect=GametypeValue_lbl
    // Reference: BBXSelectBox'XDOTZBaseCreateMatch.MapsValue_lbl'
    begin object name=MapsValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.2900000
        WinLeft=0.4500000
        WinWidth=0.4000000
        WinHeight=0.0600000
        OnClick=XDOTZBaseCreateMatch.ButtonClicked
    end object
    MapsSelect=MapsValue_lbl
    // Reference: BBXSelectBox'XDOTZBaseCreateMatch.TimeLimitValue_lbl'
    begin object name=TimeLimitValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.3600000
        WinLeft=0.4500000
        WinWidth=0.4000000
        WinHeight=0.0600000
    end object
    TimeLimitSelect=TimeLimitValue_lbl
    // Reference: BBXSelectBox'XDOTZBaseCreateMatch.ScoreLimitValue_lbl'
    begin object name=ScoreLimitValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.4300000
        WinLeft=0.4500000
        WinWidth=0.4000000
        WinHeight=0.0600000
    end object
    ScoreLimitValue=ScoreLimitValue_lbl
    // Reference: BBXSelectBox'XDOTZBaseCreateMatch.MaxPlayersValue_lbl'
    begin object name=MaxPlayersValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.5000000
        WinLeft=0.4500000
        WinWidth=0.4000000
        WinHeight=0.0600000
    end object
    MaxPlayersValue=MaxPlayersValue_lbl
    // Reference: BBXSelectBox'XDOTZBaseCreateMatch.FriendlyFireValue_lbl'
    begin object name=FriendlyFireValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.6400000
        WinLeft=0.4500000
        WinWidth=0.4000000
        WinHeight=0.0600000
    end object
    FriendlyFireValue=FriendlyFireValue_lbl
    // Reference: BBXSelectBox'XDOTZBaseCreateMatch.EnemyStrengthValue_lbl'
    begin object name=EnemyStrengthValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.5700000
        WinLeft=0.4500000
        WinWidth=0.4000000
        WinHeight=0.0600000
    end object
    EnemyStrengthValue=EnemyStrengthValue_lbl
    ClickSound=Sound'DOTZXInterface.Select'
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnKeyEvent=XDOTZBaseCreateMatch.HandleKeyEvent
}