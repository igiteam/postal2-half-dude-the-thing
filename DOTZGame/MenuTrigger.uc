/**
 * A trigger that opens a menu. 
 *
 * Author : Neil Gower (neilg@digitalextremes.com)
 * Version: $Revision: 1.1 $
 * Date   : Sept 2003
 */
class MenuTrigger extends Trigger;

var() String Menu;

function Trigger( Actor other, Pawn eventInstigator ) {
   local PlayerController pc;

   Super.Trigger( other, eventInstigator );
   pc = Level.GetLocalPlayerController();
   if ( pc == None ) return;
   GuiController(pc.Player.InteractionMaster.GlobalInteractions[0])
      .OpenMenu( Menu );
}

