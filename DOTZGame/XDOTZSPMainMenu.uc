/**
 * XDOTZLiveMultiplayer
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZSPMainMenu extends XDOTZSinglePlayerBase;



struct CheatSeq{
   var Array<int> cmd;
   var int pos;
};

var Array<CheatSeq> Cheats;
var localized string LevelNameTxt;

//Page components
var Automated GuiButton  NewGameButton;
var Automated GuiButton  LoadGameButton;
var Automated GuiButton  DebugButton;

//configurable stuff
var string LoadMenu;
var string DebugMenu;

//configurable stuff
var localized string PageCaption;


var sound ClickSound;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner )
{
   Super.Initcomponent(MyController, MyOwner);
   // init my components...
   RemoveComponent(DebugButton, true);
   MapControls();

   SetPageCaption (PageCaption);
   AddBackButton ();
   AddSelectButton ();
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
    local GUIButton Selected;

    if (GUIButton(Sender) != None) Selected = GUIButton(Sender);
    if (Selected == None) return false;

    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    switch (Selected) {
        case NewGameButton:
            class'UtilsXbox'.static.Set_Reboot_Type(5);   // Is single player

             // Display loading screen
             Controller.OpenMenu("DOTZMenu.XDOTZLoadingMenu",LevelNameTxt);

             PlayerOwner().Level.ServerTravel("CH01.dz",false);
             break;

        case LoadGameButton:
             return Controller.OpenMenu(LoadMenu,"false");
             break;

        case DebugButton:
             return Controller.OpenMenu(DebugMenu);
             break;

    };

   return false;
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
 * NotifyLevelChange
 *****************************************************************
 */

event NotifyLevelChange()
{
    Controller.CloseMenu(true);
}

function bool HandleKeyEvent(out byte Key,out byte State,float delta) {
   //only check the button down
   if (State== 1){
      ProcessInput(Key);
   }
   return super.HandleKeyEvent(Key,State,delta);
}

/*****************************************************************
 * You can look at the actual keys that were pressed if you co-ordinate
 * with your controller class and call the function right. Rereading this
 * comment, I have written something pretty useless. Great!
//A     = 200
//B     = 201
//X     = 202
//UP    = 208
//DOWN  = 209
//LEFT  = 210
//RIGHT = 211
 *****************************************************************
 */
function ProcessInput(int Key){

   local int i;
   local int SearchKey;

   for (i=0;i<Cheats.length;++i){
      SearchKey = Cheats[i].cmd[Cheats[i].pos];
      if ( SearchKey == Key){
         Cheats[i].pos++;
         Log("part of a cheat detected");
         if (Cheats[i].pos == Cheats[i].cmd.length){
            DoCheat(i);
            Cheats[i].pos = 0;
         }
      } else {
        Cheats[i].pos = 0;
      }
   }

}

/*****************************************************************
 * DoCheat
 *****************************************************************
 */
function DoCheat(int CheatNumber){
   Log("The debug button should be visible");
   InsertComponent(DebugButton,0);
   MapControls();
}


/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    Cheats[0]=(Cmd=Cmd[0]=202
    Cmd[1]=208
    Cmd[2]=211
    Cmd[3]=208
    Cmd[4]=211,pos=0)
    LevelNameTxt="Loading... The farm"
    // Reference: GUIButton'XDOTZSPMainMenu.NewGameButton_btn'
    begin object name=NewGameButton_btn class=Class'GUI.GUIButton'
        Caption="New Game"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3700000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZSPMainMenu.ButtonClicked
    end object
    NewGameButton=NewGameButton_btn
    // Reference: GUIButton'XDOTZSPMainMenu.LoadGameButton_btn'
    begin object name=LoadGameButton_btn class=Class'GUI.GUIButton'
        Caption="Load Game"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4700000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZSPMainMenu.ButtonClicked
    end object
    LoadGameButton=LoadGameButton_btn
    // Reference: GUIButton'XDOTZSPMainMenu.DebugButton_btn'
    begin object name=DebugButton_btn class=Class'GUI.GUIButton'
        Caption="All Levels"
        StyleName="BBXTextButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.5700000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.0800000
        bFocusOnWatch=true
        OnClick=XDOTZSPMainMenu.ButtonClicked
    end object
    DebugButton=DebugButton_btn
    LoadMenu="DOTZMenu.XDOTZLoadMenuCheckpoint"
    DebugMenu="DOTZMenu.XDOTZSPLevelList"
    PageCaption="Single Player"
    ClickSound=Sound'DOTZXInterface.Select'
    OnKeyEvent=XDOTZSPMainMenu.HandleKeyEvent
}