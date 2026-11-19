class ACTION_WaitForAnimend extends LatentScriptedAction;

var(Action) int Channel;

function bool CompleteOnAnim(int Num)
{
	return (Channel == Num);
}


// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="Wait for animend"
    bValidForTrigger=false
}