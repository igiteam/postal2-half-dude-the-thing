class ACTION_SetPhysics extends ScriptedAction;

var(Action) Actor.EPhysics NewPhysicsMode;

function bool InitActionFor(ScriptedController C)
{
	C.GetInstigator().SetPhysics(NewPhysicsMode);
	return false;	
}

function string GetActionString()
{
	return ActionString@NewPhysicsMode;
}


// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="change physics to "
}