class ACTION_ClientMessage extends P2ScriptedAction;

var(Action) string Message;		// Message to display

function bool InitActionFor(ScriptedController C)
	{
	if(GetPlayer(C) != None)
		GetPlayer(C).ClientMessage(Message);
	else
		warn(" Tried to start action without Player");

	return false;
	}

function string GetActionString()
	{
		return ActionString@Message;
	}


// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="action display message"
    bRequiresValidGameInfo=true
}