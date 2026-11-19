/****************************************************************
 * ACTION_AdvancedFadeView
 *
 * @author  Jesse LaChapelle (jesse@digitialextremes.com)
 * @version $Revision: 1.1 $
 * @date    Dec 2003
 ****************************************************************
 */
class ACTION_ClearScreen extends ScriptedAction;

var() bool bClear;

/****************************************************************
 * InitActionsFor
 ****************************************************************
 */
function bool InitActionFor( ScriptedController c ) {

   local AdvancedPlayerController Player;

   Player = AdvancedPlayerController(c.Level.GetLocalPlayerController());
   Player.bClearScreen = bClear;

   return false;

}


/****************************************************************
 * DefaultProperties
 ****************************************************************
 */

// Decompiled with UE Explorer.
defaultproperties
{
    bClear=true
    ActionString="Advanced Fade View"
}