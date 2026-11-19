class ACTION_Stand extends ScriptedAction;

function bool InitActionFor(ScriptedController C)
{
	C.Pawn.ShouldCrouch(false);
	return false;	
}


// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="stand"
    bValidForTrigger=false
}