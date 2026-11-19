//-----------------------------------------------------------
//
//-----------------------------------------------------------
class DOTZLoadingMenuClientTravel extends DOTZLoadingMenu;

var string travelto;
var int pass;

/*****************************************************************
 * HandleParameters
 * When open menu get's called, the parameter values are supplied
 * here.
 *
 * Param1 - the menu to load
 * Param2 - the name of the sub menu to load on top of the first menu
 *****************************************************************
 */
event HandleParameters( String param1, String param2 ) {
    super.HandleParameters("", "" );

    // load the game
    //PlayerOwner().ClientTravel( "?loadnamed=" $ EncodeStringURL(GamesList.List.GetItemAtIndex(list_index)),TRAVEL_Absolute, false );

    travelto = param1;
}

function Periodic()
{
    super.Periodic();

    if (pass == 0) {
        Log("Travelling to" @ travelto);
        PlayerOwner().ClientTravel( "?loadnamed=" $ travelto,TRAVEL_Absolute, false );
    } else if (pass == 1) {
        Controller.CloseAll(true);
    }

    ++pass;
}





// Decompiled with UE Explorer.
defaultproperties
{
    period=1.0000000
    OnKeyEvent=DOTZLoadingMenuClientTravel.HandleKeyEvent
}