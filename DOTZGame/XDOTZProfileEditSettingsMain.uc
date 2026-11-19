//-----------------------------------------------------------
//
//-----------------------------------------------------------
class XDOTZProfileEditSettingsMain extends XDOTZProfileEditSettings;

/*****************************************************************
 * InitDynamicValues
 * So we can initialize from other delegates too
 *****************************************************************
 */
function AddButtons(){
   AddBackButton ();
   //AddSelectButton ();
   AddSaveButton ();
}

/*****************************************************************
 * B Button pressed
 *
 *****************************************************************
 */
function DoButtonB ()
{
    CloseMenu ();
}

/*****************************************************************
 * Close menus
 *
 *****************************************************************
 */
function CloseMenu ()
{
    Controller.CloseMenu(true);
}


// Decompiled with UE Explorer.
defaultproperties
{
    OnActivate=XDOTZProfileEditSettingsMain.HandleActivate
    OnKeyEvent=XDOTZProfileEditSettingsMain.HandleKeyEvent
}