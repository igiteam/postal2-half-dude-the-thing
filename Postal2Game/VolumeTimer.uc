class VolumeTimer extends info;

var PhysicsVolume V;

function PostBeginPlay()
{
	Super.PostBeginPlay();
	SetTimer(1.0, true);
	V = PhysicsVolume(Owner);
}

function Timer()
{
	V.TimerPop(self);
}


// Decompiled with UE Explorer.
defaultproperties
{
    RemoteRole=0
}