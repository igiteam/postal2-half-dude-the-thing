class ACTION_MoveToPlayer extends LatentScriptedAction;

function bool MoveToGoal()
{
	return true;
}

function Actor GetMoveTargetFor(ScriptedController C)
{
	return C.GetMyPlayer();
}


// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="Move to player"
    bValidForTrigger=false
}