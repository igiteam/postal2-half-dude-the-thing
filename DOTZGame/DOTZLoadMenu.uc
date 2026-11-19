/**
 *
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.13 $
 * @date    Sept 2003
 */
class DOTZLoadMenu extends DOTZSinglePlayerBase;



//Page components
var Automated BBListBox  GamesList;

var String PageCaption;

//internal
//var int escHack;
var sound ClickSound;

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
    AddBackButton();
    AddNextButton();

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
 * Next Button
 *****************************************************************
 */

function Click_Next ()
{
    local int list_index;

    list_index = GamesList.List.Index;

    if (list_index < 0 || list_index >= GamesList.List.ItemCount)
        return;

    Controller.OpenMenu("DOTZMenu.DOTZLoadingMenuClientTravel", EncodeStringURL(GamesList.List.GetItemAtIndex(list_index)));
}

/*****************************************************************
 * Closed
 *****************************************************************
 */

event Closed(GUIComponent Sender, bool bCancelled){
}


/*****************************************************************
 * HandleKeyEvent
 *****************************************************************
 */
/*function bool HandleKeyEvent(out byte Key,out byte State,float delta) {

    //ESC IS PRESSED
    if (Key==0x1B) {
       if (escHack == 0){
          escHack = 1;
          return true;
       }
       Controller.CloseMenu(true);
    }
    return true;
} */



//===========================================================================
// DefaultProperties
//===========================================================================


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: BBListBox'DOTZLoadMenu.GamesList_btn'
    begin object name=GamesList_btn class=Class'BBGui.BBListBox'
        bVisibleWhenEmpty=true
        bNeverFocus=true
        WinTop=0.2500000
        WinLeft=0.2500000
        WinWidth=0.5000000
        WinHeight=0.6000000
    end object
    GamesList=GamesList_btn
    PageCaption="Load Game"
    ClickSound=Sound'DOTZXInterface.Select'
    OnKeyEvent=DOTZLoadMenu.HandleKeyEvent
}