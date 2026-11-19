class DOTZGetPassword extends DOTZInGamePage;

var string	RetryURL;
var string PageCaption;

var automated GUIButton YesButton;
var automated GUIButton NoButton;
var Automated GUILabel  ErrorMessage;        // The error message to be displayed
var Automated BBEditBox PasswordBox;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */
function InitComponent(GUIController MyController, GUIComponent MyOwner){
	Super.InitComponent(Mycontroller, MyOwner);
   SetPageCaption(PageCaption);
	PasswordBox.bConvertSpaces = true;
}

/*****************************************************************
 * HandleParameters
 *****************************************************************
 */
function HandleParameters(string URL,string Unused)
{
	RetryURL = URL;
}

/*****************************************************************
 * CancelClicked
 *****************************************************************
 */
function bool CancelClicked(GUIComponent Sender){
    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);

    Controller.OpenMenu("DOTZMenu.DOTZLoadingMenu");
    //PlayerOwner().ConsoleCommand("Disconnect");
    PlayerOwner().ConsoleCommand("start MainMenu.dz");

    return true;
}

/*****************************************************************
 * LoadClicked
 *****************************************************************
 */
function bool LoadClicked(GUIComponent Sender){
    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
    PlayerOwner().ClientTravel(RetryURL$"?password="$PasswordBox.GetText(),TRAVEL_Absolute,false);
    Controller.OpenMenu("DOTZMenu.DOTZLoadingMenu");
    return true;
}

/*****************************************************************
 * HandleKeyEven
 * Intercepts A and B presses
 *****************************************************************
 */

function bool HandleKeyEvent(out byte Key,out byte State,float delta) {
    return true;
}


// Decompiled with UE Explorer.
defaultproperties
{
    PageCaption="Password Required"
    // Reference: GUIButton'DOTZGetPassword.cYesButton'
    begin object name=cYesButton class=Class'GUI.GUIButton'
        Caption="OK"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.8000000
        WinLeft=0.6000000
        WinWidth=0.2500000
        WinHeight=0.1000000
        OnClick=DOTZGetPassword.LoadClicked
    end object
    YesButton=cYesButton
    // Reference: GUIButton'DOTZGetPassword.cNoButton'
    begin object name=cNoButton class=Class'GUI.GUIButton'
        Caption="Quit"
        StyleName="BBRoundButton"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.8000000
        WinLeft=0.2000000
        WinWidth=0.2500000
        WinHeight=0.1000000
        TabOrder=1
        OnClick=DOTZGetPassword.CancelClicked
    end object
    NoButton=cNoButton
    // Reference: GUILabel'DOTZGetPassword.ErrorMessage_lbl'
    begin object name=ErrorMessage_lbl class=Class'GUI.GUILabel'
        Caption="Enter password for the server:"
        TextFont="BigGuiFont"
        bMultiLine=true
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.1000000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.8000000
        RenderWeight=0.9000000
    end object
    ErrorMessage=ErrorMessage_lbl
    // Reference: BBEditBox'DOTZGetPassword.GetPassPW'
    begin object name=GetPassPW class=Class'BBGui.BBEditBox'
        WinTop=0.5085940
        WinLeft=0.2500000
        WinWidth=0.5000000
        WinHeight=0.0600000
    end object
    PasswordBox=GetPassPW
    WinTop=0.2500000
    WinHeight=0.5000000
    OnKeyEvent=DOTZGetPassword.HandleKeyEvent
}