class DOTZMPSay extends DOTZInGamePage;

var string PageCaption;

var automated GUIButton YesButton;
var automated GUIButton NoButton;
var Automated GUILabel  ErrorMessage;        // The error message to be displayed
var Automated BBEditBox MsgBox;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */
function InitComponent(GUIController MyController, GUIComponent MyOwner){
	Super.InitComponent(Mycontroller, MyOwner);
   SetPageCaption(PageCaption);
   SetTimer(0.5,false);
}


function Timer(){
   super.Timer();
   SetFocus(MsgBox);
   MsgBox.SetFocus(self);
}

/*****************************************************************
 * CancelClicked
 *****************************************************************
 */
function bool CancelClicked(GUIComponent Sender){
    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
    Controller.CloseMenu(false);
    return true;
}

/*****************************************************************
 * LoadClicked
 *****************************************************************
 */
function bool LoadClicked(GUIComponent Sender){
    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
    PlayerOwner().Say(MsgBox.GetText());
    Controller.CloseMenu(false);
    return true;
}

/*****************************************************************
 * HandleKeyEven
 * Intercepts A and B presses
 *****************************************************************
 */

function bool HandleKeyEvent(out byte Key,out byte State,float delta) {
  if (Key == 13){ //Enter
     LoadClicked(None);
  } else if (Key == 27){  //Esc
     CancelClicked(None);
  }
  return true;
}


// Decompiled with UE Explorer.
defaultproperties
{
    PageCaption="Broadcast"
    // Reference: GUIButton'DOTZMPSay.cYesButton'
    begin object name=cYesButton class=Class'GUI.GUIButton'
        Caption="OK"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.6500000
        WinWidth=0.2000000
        WinHeight=0.1500000
        OnClick=DOTZMPSay.LoadClicked
    end object
    YesButton=cYesButton
    // Reference: GUIButton'DOTZMPSay.cNoButton'
    begin object name=cNoButton class=Class'GUI.GUIButton'
        Caption="Cancel"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.6000000
        WinLeft=0.3000000
        WinWidth=0.2000000
        WinHeight=0.1500000
        TabOrder=1
        OnClick=DOTZMPSay.CancelClicked
    end object
    NoButton=cNoButton
    // Reference: GUILabel'DOTZMPSay.ErrorMessage_lbl'
    begin object name=ErrorMessage_lbl class=Class'GUI.GUILabel'
        Caption="Enter message:"
        TextFont="PlainSmGuiFont"
        bMultiLine=true
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2200000
        WinLeft=0.1000000
        WinWidth=0.6000000
        WinHeight=0.8000000
        RenderWeight=0.9000000
    end object
    ErrorMessage=ErrorMessage_lbl
    // Reference: BBEditBox'DOTZMPSay.GetMsg'
    begin object name=GetMsg class=Class'BBGui.BBEditBox'
        MaxWidth=25
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2000000
        WinLeft=0.2700000
        WinWidth=0.6000000
        WinHeight=0.1500000
    end object
    MsgBox=GetMsg
    WinTop=0.2500000
    WinLeft=0.1500000
    WinWidth=0.7000000
    WinHeight=0.2000000
    OnKeyEvent=DOTZMPSay.HandleKeyEvent
}