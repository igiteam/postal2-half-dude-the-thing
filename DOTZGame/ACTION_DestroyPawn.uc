class ACTION_DestroyPawn extends ScriptedAction;

function bool InitActionFor(ScriptedController C)
{
	C.DestroyPawn();
	return true;
}


// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="destroy pawn"
    bValidForTrigger=false
}