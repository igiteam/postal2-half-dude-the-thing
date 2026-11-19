class TriggeredPlayerStart extends PlayerStart;

function Trigger( actor Other, pawn EventInstigator )
{
	bEnabled = !bEnabled;
}


// Decompiled with UE Explorer.
defaultproperties
{
    bStatic=false
}