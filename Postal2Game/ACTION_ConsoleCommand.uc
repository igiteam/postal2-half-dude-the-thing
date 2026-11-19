// ====================================================================
//  Executes a console command
// ====================================================================

class Action_ConsoleCommand extends ScriptedAction;

var(Action) string		CommandStr;	// The console command to execute

function bool InitActionFor(ScriptedController C)
{
	if (CommandStr!="")
		C.ConsoleCommand(CommandStr);
		
	return false;	
}

function string GetActionString()
{
	return ActionString@CommandStr;
}


// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="console command"
}