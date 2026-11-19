/**
 * ACTION_SetGodMode - enables god mode on AdvancedPawns.
 *
 * @version $Rev: 5335 $
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @date    Aug 2004
 */
class ACTION_SetGodMode extends ScriptedAction;

// turn god mode on?
var() bool bEnableGodMode;

/**
 */
function bool InitActionFor( ScriptedController c ) {
    local AdvancedPawn p;
    p = AdvancedPawn( c.Pawn );
    if ( p == None ) return false;
    p.bGodMode = bEnableGodMode;
    return false;
}


//===========================================================================
// Default Properties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="SafePawnKill"
}