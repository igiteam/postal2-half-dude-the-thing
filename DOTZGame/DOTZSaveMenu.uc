/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class DOTZSaveMenu extends DOTZInGamePage;



var localized string PageCaption;
var localized string NewSlot;

var automated GUIButton YesButton;
var automated GUIButton NoButton;

var string ConfirmMenu;

//Page components
var Automated BBListBox  GamesList;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent(GUIController MyController, GUIComponent MyOwner){
    Super.InitComponent(MyController, MyOwner);
    SetPageCaption (PageCaption);

    Refresh();
}

/**
 * Happens every time the menu is opened, not just the first.
 */
event Opened( GUIComponent Sender ) {
    super.Opened(Sender);
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
        if (class'UtilsXbox'.static.Get_Container_Meta(ireal, "AUTOSAVE") != "true" &&
            class'UtilsXbox'.static.Get_Container_Meta(ireal, "QUICKSAVE") != "true") {
            GamesList.List.Add(class'UtilsXbox'.static.Get_Container_Meta(ireal, "TITLE"));
        }
    }

    // Magical sorting
    Sort_Games(GamesList);
}

/*****************************************************************
 * Add a new slot?
 *****************************************************************
 */

function bool AddNewSlot (){
   return (class'UtilsXbox'.static.Get_Num_Filtered_Containers() < 10);
}

/*****************************************************************
 * ButtonClicked
 * Notification that the user clicked a component on the page
 *****************************************************************
 */

function bool ButtonClicked(GUIComponent Sender) {
    local GUIButton Selected;
    local int list_index;

    if (GUIButton(Sender) != None) Selected = GUIButton(Sender);
    if (Selected == None) return false;

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {
        case YesButton:
             list_index = GamesList.List.Index;

             if (list_index < 0 || list_index >= GamesList.List.ItemCount)
                return true;

             if (list_index == 0) {
                Controller.OpenMenu(ConfirmMenu, "", DOTZPlayerControllerBase(PlayerOwner()).GetCurrentProfileName());
             } else {
                Controller.OpenMenu(ConfirmMenu, GamesList.List.GetItemAtIndex(list_index), DOTZPlayerControllerBase(PlayerOwner()).GetCurrentProfileName());
             }

             break;

        case NoButton:
            Controller.CloseMenu( true );
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
    // Reference: GUIButton'DOTZSaveMenu.cYesButton'
    begin object name=cYesButton class=Class'GUI.GUIButton'
        Caption="Save"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.8000000
        WinLeft=0.6000000
        WinWidth=0.2500000
        WinHeight=0.0500000
        OnClick=DOTZSaveMenu.ButtonClicked
    end object
    YesButton=cYesButton
    // Reference: GUIButton'DOTZSaveMenu.cNoButton'
    begin object name=cNoButton class=Class'GUI.GUIButton'
        Caption="Cancel"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.8000000
        WinLeft=0.2000000
        WinWidth=0.2500000
        WinHeight=0.0500000
        TabOrder=1
        OnClick=DOTZSaveMenu.ButtonClicked
    end object
    NoButton=cNoButton
    ConfirmMenu="DOTZMenu.DOTZSaveConfirm"
    // Reference: BBListBox'DOTZSaveMenu.GamesList_btn'
    begin object name=GamesList_btn class=Class'BBGui.BBListBox'
        bVisibleWhenEmpty=true
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.1000000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.6000000
        OnClick=DOTZSaveMenu.ButtonClicked
    end object
    GamesList=GamesList_btn
    OnKeyEvent=DOTZSaveMenu.HandleKeyEvent
}