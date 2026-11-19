//-----------------------------------------------------------
//
//-----------------------------------------------------------
class ACTION_SetInfection extends ScriptedAction;

// turn god mode on?
var() bool bInfected;

/**
 */
function bool InitActionFor( ScriptedController c ) {
    local PlayerPawnBase p;
    p = PlayerPawnBase( c.Pawn );
    if ( p == None ) return false;
    p.SetInfectionState(bInfected, true );
    return false;
}


//===========================================================================
// Default Properties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ActionString=""
}