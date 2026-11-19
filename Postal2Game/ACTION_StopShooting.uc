class ACTION_StopShooting extends ScriptedAction;

function bool InitActionFor(ScriptedController C)
{
	C.bShootTarget = false;
	C.bShootSpray = false;
	return false;	
}


// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="stop shooting"
}