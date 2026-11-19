class ACTION_PlayLocalSound extends ScriptedAction;

var(Action)		sound	Sound;

function bool InitActionFor(ScriptedController C)
{
	local PlayerController P;

	// play appropriate sound
		ForEach C.DynamicActors(class'PlayerController', P)
			P.ClientPlaySound(Sound);
	return false;	
}

function string GetActionString()
{
	return ActionString@Sound;
}


// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="play sound"
}