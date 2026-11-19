class ACTION_StopAnimation extends ScriptedAction;

function bool InitActionFor(ScriptedController C)
{
	C.ClearAnimation();
	return false;	
}


// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="stop animation"
    bValidForTrigger=false
}