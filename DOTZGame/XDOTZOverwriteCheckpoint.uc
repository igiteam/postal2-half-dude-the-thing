/**
 * XDOTZOverwriteCheckpoint : ask user if they want to overwrite a checkpoitn
 *
 * @author  Seelan V. (seelan@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    July 2005
 */
class XDOTZOverwriteCheckpoint extends XDOTZErrorPage;


var localized string SaveMessageOver1;
var localized string SaveMessageOver2;
var localized string save_string;

var string mapname;

var Automated GUILabel   ErrorMessage2;        // The error message to be displayed
var Automated GUILabel   ErrorMessage3;        // The error message to be displayed


/*****************************************************************
 * Opened
 *****************************************************************
 */
event Opened( GUIComponent Sender ) {
   Super.Opened(Sender);
  AddBackButton(cancel_string);
  AddSelectButton(save_string);
}


/*****************************************************************
 * HandleParameters
 * When open menu get's called, the parameter values are supplied here.
 *****************************************************************
 */
event HandleParameters( String param1, String param2 ) {
    //local string tmp;

    mapname = param1;
    //tmp = "Checkpoint" @ PlayerOwner().Level.ActiveCheckPointID @ "-" @ GameSpecificLevelInfo(PlayerOwner().Level.GameSpecificLevelInfo).LevelName;
    SetErrorCaption( mapname );

    SetErrorCaption( SaveMessageOver1 );
    ErrorMessage2.Caption = mapname $ ".";
    ErrorMessage3.Caption = SaveMessageOver2;

    //You have reached Checkpoint 1 ? The farm. This is a previously saved checkpoint.  Would you like to overwrite it? Existing information will be lost
    //tmp = SaveMessageOver1 @ mapname $ SaveMessageOver2;
    //ErrorMessage2.Caption =  SaveMessageOver;
    //SetErrorCaption( tmp );
}


/*****************************************************************
 * DoButtonA
 *****************************************************************
 */
function DoButtonA(){
    PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
    Controller.OpenMenu("DOTZMenu.XDOTZSaving");

    //AdvancedHud(Level.GetLocalPlayerController().myHud).Message(Level.GetLocalPlayerController().PlayerReplicationInfo, SaveMessage, 'INFO');
    Controller.ConsoleCommand( "SaveCheckPoint \"" $ mapname $ "\"");

    //the save slot protects itself so that nothing can happen until the
    //next tick. However there is no next tick if you are paused (as you are now)
    //so if you want to save to another slot, then you need to reset the save
    //var manually
    //AdvancedGameInfo(PlayerOwner().Level.Game).bSaveInProgress = false;

}

/*****************************************************************
 * DoButtonB
 *****************************************************************
 */
function DoButtonB(){
   //Controller.CloseMenu(false);
   //Controller.CloseAll(false);

   Controller.ViewportOwner.Actor.Level.Game
        .SetPause( false, Controller.ViewportOwner.Actor );
    BBGuiController(Controller).CloseAll( false );
}






//===========================================================================
// defaultproperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    SaveMessageOver1="You have reached"
    SaveMessageOver2="This is a previously saved checkpoint.  Would you like to overwrite it? Existing information will be lost."
    save_string="Save"
    // Reference: GUILabel'XDOTZOverwriteCheckpoint.ErrorMessage2_lbl'
    begin object name=ErrorMessage2_lbl class=Class'GUI.GUILabel'
        TextFont="XBigFont"
        bMultiLine=true
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2000000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.8000000
        RenderWeight=0.9000000
    end object
    ErrorMessage2=ErrorMessage2_lbl
    // Reference: GUILabel'XDOTZOverwriteCheckpoint.ErrorMessage3_lbl'
    begin object name=ErrorMessage3_lbl class=Class'GUI.GUILabel'
        TextFont="XBigFont"
        bMultiLine=true
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.4000000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.8000000
        RenderWeight=0.9000000
    end object
    ErrorMessage3=ErrorMessage3_lbl
    OnKeyEvent=XDOTZOverwriteCheckpoint.HandleKeyEvent
}