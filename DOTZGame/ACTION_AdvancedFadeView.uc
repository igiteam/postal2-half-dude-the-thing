/****************************************************************
 * ACTION_AdvancedFadeView
 * 
 * @author  Jesse LaChapelle (jesse@digitialextremes.com)
 * @version $Revision: 1.1 $
 * @date    Dec 2003
 ****************************************************************
 */
class ACTION_AdvancedFadeView extends ScriptedAction;


/****************************************************************
 * InitActionsFor
 ****************************************************************
 */
function bool InitActionFor( ScriptedController c ) {

   local AdvancedPlayerController Player;

   Player = AdvancedPlayerController(c.Level.GetLocalPlayerController());
   Player.Fade();

   return false;   

}


/****************************************************************
 * DefaultProperties
 ****************************************************************
 */

// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="Advanced Fade View"
}