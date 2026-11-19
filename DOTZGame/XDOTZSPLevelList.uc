/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZSPLevelList extends XDOTZSinglePlayerBase;




//Page components
var Automated BBXListBox  LevelList;

//configurable stuff
var localized string PageCaption;

var sound ClickSound;

var localized string ch01txt;
var localized string ch02atxt;
var localized string ch02btxt;
var localized string ch03atxt;
var localized string ch03btxt;
var localized string ch03ctxt;
var localized string ch04atxt;
var localized string ch04btxt;
var localized string ch05atxt;
var localized string ch05btxt;
var localized string ch06atxt;
var localized string ch06btxt;
var localized string ch07atxt;
var localized string ch07btxt;
var localized string ch08txt;
var localized string ch09atxt;
var localized string ch09btxt;
var localized string ch10txt;
var localized string ch11atxt;
var localized string ch11btxt;
var localized string ch12atxt;
var localized string ch12btxt;
var localized string ch13atxt;
var localized string ch13btxt;
var localized string ch13ctxt;
var localized string ch13dtxt;

/*****************************************************************
 * Refresh the accounts list
 *****************************************************************
 */

function Refresh_Profiles_List () {

    LevelList.List.Add(ch01txt,,"CH01.dz");
    LevelList.List.Add(ch02atxt,,"CH02a.dz");
    LevelList.List.Add(ch02btxt,,"CH02b.dz");
    LevelList.List.Add(ch03atxt,,"CH03a.dz");
    LevelList.List.Add(ch03btxt,,"CH03b.dz");
    LevelList.List.Add(ch03ctxt,,"CH03c.dz");
    LevelList.List.Add(ch04atxt,,"CH04a.dz");
    LevelList.List.Add(ch04btxt,,"CH04b.dz");
    LevelList.List.Add(ch05atxt,,"CH05a.dz");
    LevelList.List.Add(ch05btxt,,"CH05b.dz");
    LevelList.List.Add(ch06atxt,,"CH06a.dz");
    LevelList.List.Add(ch06btxt,,"CH06b.dz");
    LevelList.List.Add(ch07atxt,,"CH07a.dz");
    LevelList.List.Add(ch07btxt,,"CH07b.dz");
    LevelList.List.Add(ch08txt,,"CH08.dz");
    LevelList.List.Add(ch09atxt,,"CH09a.dz");
    LevelList.List.Add(ch09btxt,,"CH09b.dz");
    LevelList.List.Add(ch10txt,,"CH10.dz");
    LevelList.List.Add(ch11atxt,,"CH11a.dz");
    LevelList.List.Add(ch11btxt,,"CH11b.dz");
    LevelList.List.Add(ch12atxt,,"CH12a.dz");
    LevelList.List.Add(ch12btxt,,"CH12b.dz");
    LevelList.List.Add(ch13atxt,,"CH13a.dz");
    LevelList.List.Add(ch13btxt,,"CH13b.dz");
    LevelList.List.Add(ch13ctxt,,"CH13c.dz");
    LevelList.List.Add(ch13dtxt,,"CH13d.dz");

}

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
   Super.Initcomponent(MyController, MyOwner);
   // init my components...

   SetPageCaption (PageCaption);
   AddBackButton ();
   AddSelectButton ();

   Refresh_Profiles_List ();
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
 * ButtonClicked
 * Notification that the user clicked a component on the page
 *****************************************************************
 */
function bool ButtonClicked(GUIComponent Sender) {
    local BBXListBox Selected;
    local int list_index;
    local string list_item;

    if (BBXListBox(Sender) != None) Selected = BBXListBox(Sender);
    if (Selected == None) return false;


    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {
        case LevelList:
             list_index = LevelList.List.Index;
             list_item = LevelList.List.GetExtraAtIndex(list_index);

             class'UtilsXbox'.static.Set_Reboot_Type(5);   // Is single player
             //class'UtilsXbox'.static.SinglePlayer_Set_Map_Name(list_item);

             // Display loading screen
             Controller.OpenMenu("DOTZMenu.XDOTZLoadingMenu");

             // Reboot!
             //Console(Controller.Master.Console).ConsoleCommand("reboot");  // URL not part of command on xbox

             PlayerOwner().Level.ServerTravel(list_item,false);
             break;
    };

   return true;
}

/*****************************************************************
 * B Button pressed
 *
 *****************************************************************
 */

function DoButtonB ()
{
    Controller.CloseMenu(true);
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
    // Reference: BBXListBox'XDOTZSPLevelList.LevelList_btn'
    begin object name=LevelList_btn class=Class'BBGui.BBXListBox'
        bVisibleWhenEmpty=true
        bNeverFocus=true
        WinTop=0.1880000
        WinLeft=0.2500000
        WinWidth=0.5000000
        WinHeight=0.6310000
        OnClick=XDOTZSPLevelList.ButtonClicked
    end object
    LevelList=LevelList_btn
    PageCaption="SinglePlayer  Levels"
    ClickSound=Sound'DOTZXInterface.Select'
    ch01txt="The farm"
    ch02atxt="Cornfield"
    ch02btxt="Neighbors"
    ch03atxt="Main street"
    ch03btxt="Detour"
    ch03ctxt="Hospital"
    ch04atxt="The doctor"
    ch04btxt="Override"
    ch05atxt="Fire!"
    ch05btxt="Escape"
    ch06atxt="Back alleys"
    ch06btxt="Warehouse"
    ch07atxt="Police station"
    ch07btxt="Sniper rifle"
    ch08txt="Headshot!"
    ch09atxt="Sewers"
    ch09btxt="Labyrinth"
    ch10txt="The theater"
    ch11atxt="The docks"
    ch11btxt="Deliverance"
    ch12atxt="City of the living"
    ch12btxt="Heavy gunner"
    ch13atxt="Fiddler's Green garage"
    ch13btxt="Fiddler's Green atrium"
    ch13ctxt="Fiddler's Green penthouse"
    ch13dtxt="Annihilation"
    OnKeyEvent=XDOTZSPLevelList.HandleKeyEvent
}