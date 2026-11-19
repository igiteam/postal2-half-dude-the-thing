/**
 *
 *
 * @author  Seelan V.
 * @version $Revision: 1.0$
 * @date    August 1, 2005
 */
class XDOTZLoadMenuCheckpoint extends XDOTZSinglePlayerBase;


var localized string PageCaption;
var bool bRequiresConfirmation;

//Page components
var Automated BBXListBox  GamesList;



/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent(GUIController MyController, GUIComponent MyOwner){
    local int i;
    local int num;
    local string tmpname;

    Super.InitComponent(MyController, MyOwner);
    SetPageCaption (PageCaption);
    AddBackButton();
    AddSelectButton();

    //class'UtilsXbox'.static.Filter_Containers("OWNER", DOTZPlayerControllerBase(PlayerOwner()).GetCurrentProfileName());

    GamesList.List.Clear();

    num = class'Profiler'.static.GetTotalCheckpoints();

    for (i = num - 1; i >= 0; --i)
    {
        tmpname = class'Profiler'.static.GetCheckpoint(i);
        GamesList.List.Add( tmpname );
    }
}


/*****************************************************************
 * HandleParameters
 * When open menu get's called, the parameter values are supplied here.
 *****************************************************************
 */
event HandleParameters( String param1, String param2 ) {
    bRequiresConfirmation = bool(param1);
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
    local string mapname;

    if (BBXListBox(Sender) != None) Selected = BBXListBox(Sender);
    if (Selected == None) return false;
    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {
        case GamesList:
             list_index = GamesList.List.Index;

             if (list_index < 0 || list_index >= GamesList.List.ItemCount)
                return true;

             if (bRequiresConfirmation == true){

               Controller.OpenMenu("DOTZMenu.XDOTZLoadConfirm",GamesList.List.GetItemAtIndex(list_index));
             } else {
                // Display loading screen
                Controller.OpenMenu("DOTZMenu.XDOTZLoadingMenu");

                mapname = GamesList.List.GetItemAtIndex(list_index);
                Log("Load to checkpoint:" @ mapname);
                // Load to last checkpoint
                Controller.ConsoleCommand( "loadcheckpoint \"" $ mapname $ "\"");
                // load the game
               //class'UtilsXbox'.static.Set_Reboot_Type(5);   // Is single player
               //PlayerOwner().ClientTravel( "?loadnamed=" $ EncodeStringURL(GamesList.List.GetItemAtIndex(list_index)),TRAVEL_Absolute, false );

             }


             break;
    };
   return true;
}

//===========================================================================
// defaultproperties
//===========================================================================










// Decompiled with UE Explorer.
defaultproperties
{
    PageCaption="Load Game"
    bRequiresConfirmation=true
    // Reference: BBXListBox'XDOTZLoadMenuCheckpoint.GamesList_btn'
    begin object name=GamesList_btn class=Class'BBGui.BBXListBox'
        bVisibleWhenEmpty=true
        bNeverFocus=true
        WinTop=0.2000000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.6000000
        OnClick=XDOTZLoadMenuCheckpoint.ButtonClicked
    end object
    GamesList=GamesList_btn
    OnKeyEvent=XDOTZLoadMenuCheckpoint.HandleKeyEvent
}