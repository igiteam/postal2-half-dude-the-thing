/****************************************************************
 * ACTION_AdvancedDisplayKills
 *
 * @author  Jesse LaChapelle (jesse@digitialextremes.com)
 * @version $Revision: 1.1 $
 * @date    Dec 2003
 ****************************************************************
 */
class ACTION_Talk extends ScriptedAction;

var() bool bTalk;


/****************************************************************
 * InitActionsFor
 ****************************************************************
 */
function bool InitActionFor( ScriptedController c ) {

   local AdvancedPawn Talker;
   Talker = AdvancedPawn(c.Pawn);

   if (bTalk){
      Talker.GotoState('Talking');
   } else {
      Talker.GotoState('');
   }
   return false;

}


/****************************************************************
 * DefaultProperties
 ****************************************************************
 */

// Decompiled with UE Explorer.
defaultproperties
{
    bTalk=true
    ActionString="Talking"
}