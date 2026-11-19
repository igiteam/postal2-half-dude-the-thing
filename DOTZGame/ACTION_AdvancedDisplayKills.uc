/****************************************************************
 * ACTION_AdvancedDisplayKills
 *
 * @author  Jesse LaChapelle (jesse@digitialextremes.com)
 * @version $Revision: 1.1 $
 * @date    Dec 2003
 ****************************************************************
 */
class ACTION_AdvancedDisplayKills extends ScriptedAction;


/****************************************************************
 * InitActionsFor
 ****************************************************************
 */
function bool InitActionFor( ScriptedController c ) {

   local AdvancedPlayerController Player;

   Player = AdvancedPlayerController(c.Level.GetLocalPlayerController());
   Player.kills();
   return false;

}


/****************************************************************
 * DefaultProperties
 ****************************************************************
 */

// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="Advanced Display Kills"
}