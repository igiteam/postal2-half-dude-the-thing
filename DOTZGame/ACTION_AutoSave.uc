/**
 * ACTION_AutoSave - autosaves the current state of the game.  Don't
 *     use this during cinematics!
 *
 * @author  Neil Gower (neilg@digitialextremes.com)
 * @version $Revision: 1.1 $
 * @date    Feb 2004
 */
class ACTION_AutoSave extends ScriptedAction;

/**
 */
function bool InitActionFor( ScriptedController c ) {
    local AdvancedGameInfo theGame;

    theGame = AdvancedGameInfo(c.Level.Game);
    if ( theGame == None ) return false;

    theGame.autosave();
    return false;
}

//===========================================================================
// Default Properties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="auto save"
}