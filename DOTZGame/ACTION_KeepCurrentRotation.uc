class ACTION_KeepCurrentRotation extends ScriptedAction;

function bool InitActionFor(ScriptedController C)
{
	C.bUseScriptFacing = false;
	return false;	
}


// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="keep current rotation"
}