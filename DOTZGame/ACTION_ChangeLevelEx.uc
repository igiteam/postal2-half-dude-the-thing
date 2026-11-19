class ACTION_ChangeLevelEx extends ScriptedAction;

var(Action) string URL;
var(Action) bool bShowLoadingMessage;
var(Action) bool bTakeItems;

function bool InitActionFor(ScriptedController C)
{
	if( bShowLoadingMessage )
		C.Level.ServerTravel(URL, bTakeItems);
	else
		C.Level.ServerTravel(URL$"?quiet", bTakeItems);
	return true;
}

function string GetActionString()
{
	return ActionString;
}



// Decompiled with UE Explorer.
defaultproperties
{
    bTakeItems=true
    ActionString="Change level"
}