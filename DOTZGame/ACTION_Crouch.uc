class ACTION_Crouch extends ScriptedAction;

function bool InitActionFor(ScriptedController C)
{
	C.Pawn.ShouldCrouch(true);
	return false;	
}


// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="crouch"
    bValidForTrigger=false
}