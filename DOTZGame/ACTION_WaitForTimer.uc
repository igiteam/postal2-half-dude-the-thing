class ACTION_WaitForTimer extends LatentScriptedAction;

var(Action) float PauseTime;

function bool InitActionFor(ScriptedController C)
{
	C.CurrentAction = self;
	C.SetTimer(PauseTime, false);
	return true;
}

function bool CompleteWhenTriggered()
{
	return true;
}

function bool CompleteWhenTimer()
{
	return true;
}

function string GetActionString()
{
	return ActionString@PauseTime;
}


// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="Wait for timer"
}