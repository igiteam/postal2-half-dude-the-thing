class ACTION_WaitForPlayer extends LatentScriptedAction;

var(Action) float Distance;

function bool InitActionFor(ScriptedController C)
{
	if ( C.CheckIfNearPlayer(Distance) )
		return false;
	C.CurrentAction = self;
	C.SetTimer(0.1,true);
	return true;
}

function float GetDistance()
{
	return Distance;
}

function bool WaitForPlayer()
{
	return true;
}


// Decompiled with UE Explorer.
defaultproperties
{
    Distance=150.0000000
    ActionString="Wait for player"
    bValidForTrigger=false
}