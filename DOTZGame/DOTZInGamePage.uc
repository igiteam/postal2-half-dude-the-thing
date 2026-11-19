//-----------------------------------------------------------
//  XDOTZErrorPage - Base class for error pages
//-----------------------------------------------------------

class DOTZInGamePage extends DOTZPageBase;

var Automated GUILabel   PageCaption;
var automated GUIButton  InGameBackground;     // Button placed in the background

var sound ClickSound;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */

function InitComponent( GUIController MyController, GUIComponent MyOwner ) {
    Super.Initcomponent(MyController, MyOwner);
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
 * Sets the caption displayed at the top of the page
 *****************************************************************
 */

function SetPageCaption(string caption) {
    PageCaption.Caption = caption;
}

/*****************************************************************
 * HandleKeyEven
 * It was like this when I got here
 *****************************************************************
 */

function bool HandleKeyEvent(out byte Key,out byte State,float delta) {

    // A short pause
    if (!accept_input) return false;

    // Key down only
    if (State != 1) return false;
    //Log(" *** Button down " $ Key);

    if (Key == 27) {  //Esc
        // Unpause if this is the last menu
        if (BBGUIController(Controller).GetMenuStackSize() == 1) {
            Controller.ViewportOwner.Actor.SetPause(false);
        }

        Controller.CloseMenu(true);
    }

    //for working with PC
    /*if (Key == 13){ //Enter
      DoButtonA();
    } else if (Key == 27){  //Esc
      DoButtonB();
    } else if  (Key == 32){
      DoButtonStart();
    }*/

    return true;
}

/*****************************************************************
 * Default properties
 *****************************************************************
 */


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: GUILabel'DOTZInGamePage.PageCaption_lbl'
    begin object name=PageCaption_lbl class=Class'GUI.GUILabel'
        bMultiLine=true
        StyleName="BBRoundButton"
        bVisible=false
        bNeverFocus=true
        WinTop=0.1200000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.1000000
    end object
    PageCaption=PageCaption_lbl
    // Reference: GUIButton'DOTZInGamePage.InGameBackground_btn'
    begin object name=InGameBackground_btn class=Class'GUI.GUIButton'
        StyleName="BBHorizontalBarSolid"
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=false
        bNeverFocus=true
        WinHeight=1.0000000
        RenderWeight=0.1000000
    end object
    InGameBackground=InGameBackground_btn
    ClickSound=Sound'DOTZXInterface.Select'
    bRequire640x480=false
    bAllowedAsLast=true
    WinTop=0.1000000
    WinLeft=0.1000000
    WinWidth=0.8000000
    WinHeight=0.8500000
}