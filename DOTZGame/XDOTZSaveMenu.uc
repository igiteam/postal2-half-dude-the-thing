/**
 *
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.13 $
 * @date    Sept 2003
 */
class XDOTZSaveMenu extends XDOTZSinglePlayerBase;

var localized string PageCaption;
var localized string NewSlot;

var string ConfirmMenu;

//Page components
var Automated BBXListBox  GamesList;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent(GUIController MyController, GUIComponent MyOwner){
    Super.InitComponent(MyController, MyOwner);
    SetPageCaption (PageCaption);
    AddBackButton();
    AddSelectButton();

    Refresh();
}

/*****************************************************************
 * Add a new slot?
 *****************************************************************
 */

function Refresh () {
    local int i;
    local int ireal;
    local int num;

    class'UtilsXbox'.static.Filter_Containers("OWNER", DOTZPlayerControllerBase(PlayerOwner()).GetCurrentProfileName());

    GamesList.List.Clear();

    num = class'UtilsXbox'.static.Get_Num_Filtered_Containers();

    if (AddNewSlot ()) {
        GamesList.List.Add(NewSlot);
    }

    for (i = 0; i < num; ++i) {
        ireal = class'UtilsXbox'.static.Filtered_To_Real_Index(i);
        if (class'UtilsXbox'.static.Get_Container_Meta(ireal, "AUTOSAVE") != "true") {
            GamesList.List.Add(class'UtilsXbox'.static.Get_Container_Meta(ireal, "TITLE"));
        }
    }
}

/*****************************************************************
 * Add a new slot?
 *****************************************************************
 */

function bool AddNewSlot (){
   return (class'UtilsXbox'.static.Get_Num_Filtered_Containers() < 10);
}

/*****************************************************************
 * DoButtonB
 *****************************************************************
 */

function DoButtonB(){
   PlayerOwner().PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
   Controller.CloseMenu( true );
}


/*****************************************************************
 * DoButtonA
 *****************************************************************
 */
function DoButtonA(){

}

/*****************************************************************
 * ButtonClicked
 * Notification that the user clicked a component on the page
 *****************************************************************
 */

function bool ButtonClicked(GUIComponent Sender) {
    local BBXListBox Selected;
    local int list_index;

    if (BBXListBox(Sender) != None) Selected = BBXListBox(Sender);
    if (Selected == None) return false;

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {
        case GamesList:
             list_index = GamesList.List.Index;

             if (list_index < 0 || list_index >= GamesList.List.ItemCount)
                return true;

             if (list_index == 0) {
                Controller.OpenMenu(ConfirmMenu, "", DOTZPlayerControllerBase(PlayerOwner()).GetCurrentProfileName());
             } else {
                Controller.OpenMenu(ConfirmMenu, GamesList.List.GetItemAtIndex(list_index), DOTZPlayerControllerBase(PlayerOwner()).GetCurrentProfileName());
             }

             break;
    };

   return true;
}

//===========================================================================
// DefaultProperties
//===========================================================================


// Decompiled with UE Explorer.
defaultproperties
{
    PageCaption="Save Game"
    NewSlot="<New Save Game>"
    ConfirmMenu="DOTZMenu.XDOTZSaveConfirm"
    // Reference: BBXListBox'XDOTZSaveMenu.GamesList_btn'
    begin object name=GamesList_btn class=Class'BBGui.BBXListBox'
        bVisibleWhenEmpty=true
        bNeverFocus=true
        WinTop=0.2000000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.6000000
        OnClick=XDOTZSaveMenu.ButtonClicked
    end object
    GamesList=GamesList_btn
    OnKeyEvent=XDOTZSaveMenu.HandleKeyEvent
}