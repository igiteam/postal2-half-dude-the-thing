//=============================================================================
// TimedTrigger: causes an event after X seconds.
//=============================================================================
class TimedTrigger extends Trigger;

var() float DelaySeconds;
var() bool bRepeating;

function Timer()
{
	TriggerEvent(Event,self,None);

	if ( !bRepeating )
		Destroy();
}

function MatchStarting()
{
	SetTimer(DelaySeconds, bRepeating);
}


// Decompiled with UE Explorer.
defaultproperties
{
    DelaySeconds=1.0000000
    bCollideActors=false
    bObsolete=true
}