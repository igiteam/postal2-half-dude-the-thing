class ACTION_Freeze extends LatentScriptedAction;

function bool InitActionFor(ScriptedController C)
{
	if ( C.Pawn != None )
	{
		C.Pawn.bPhysicsAnimUpdate = false;
		C.Pawn.StopAnimating();
		C.Pawn.SetPhysics(PHYS_None);
	}
	C.CurrentAction = self;
	return true;	
}



// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="Freeze"
}