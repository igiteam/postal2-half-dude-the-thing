/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class DOTZLoadMenuIG extends DOTZInGamePage;



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
    local int i;
    local int ireal;
    local int num;

    Super.InitComponent(MyController, MyOwner);
    SetPageCaption (PageCaption);

    class'UtilsXbox'.static.Filter_Containers("OWNER", DOTZPlayerControllerBase(PlayerOwner()).GetCurrentProfileName());
    //class'UtilsXbox'.static.Filter_Containers("DATATYPE", "SAVE");

    GamesList.List.Clear();

    num = class'UtilsXbox'.static.Get_Num_Filtered_Containers();

    for (i = 0; i < num; ++i) {
        ireal = class'UtilsXbox'.static.Filtered_To_Real_Index(i);
        GamesList.List.Add(class'UtilsXbox'.static.Get_Container_Meta(ireal, "TITLE"));
    }

    // Magical sorting
    Sort_Games(GamesList);
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
                return false;

            // load the game
            Controller.OpenMenu("DOTZMenu.DOTZLoadingMenuClientTravel", EncodeStringURL(GamesList.List.GetItemAtIndex(list_index)));
            //PlayerOwner().ClientTravel( "?loadnamed=" $ EncodeStringURL(GamesList.List.GetItemAtIndex(list_index)),TRAVEL_Absolute, false );

            //Controller.OpenMenu("DOTZMenu.XDOTZLoadingMenu");
            //BBGuiController(Controller).CloseAll(true);

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
    // Reference: GUIButton'DOTZLoadMenuIG.cYesButton'
    begin object name=cYesButton class=Class'GUI.GUIButton'
        Caption="Load"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.8000000
        WinLeft=0.6000000
        WinWidth=0.2500000
        WinHeight=0.0500000
        OnClick=DOTZLoadMenuIG.ButtonClicked
    end object
    YesButton=cYesButton
    // Reference: GUIButton'DOTZLoadMenuIG.cNoButton'
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
        OnClick=DOTZLoadMenuIG.ButtonClicked
    end object
    NoButton=cNoButton
    ConfirmMenu="DOTZMenu.DOTZSaveConfirm"
    // Reference: BBListBox'DOTZLoadMenuIG.GamesList_btn'
    begin object name=GamesList_btn class=Class'BBGui.BBListBox'
        bVisibleWhenEmpty=true
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
        WinTop=0.1000000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.6000000
        OnClick=DOTZLoadMenuIG.ButtonClicked
    end object
    GamesList=GamesList_btn
    OnKeyEvent=DOTZLoadMenuIG.HandleKeyEvent
}