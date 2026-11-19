//=============================================================================
// SmokeHitPuff
//=============================================================================
class SmokeHitPuff extends Wemitter;

var float velmax;
var float velloss;
var float timemax;
var float timediv;
var float timeminratio;

//replication
//{
	// server sends this to client if enough bandwidth available
//	unreliable if(Role==ROLE_Authority)
//		FitToNormal;
//}

simulated function PostBeginPlay()
{
	// Don't call super
	RandomizeStart();
	FitToNormal(vector(Rotation));

	// Wipe the owner so that in single player, slow motion will work properly.
	// Anything who's owner is player still goes at normal speed, but if not
	// it goes in slow motion. 
	// But we definitely want the owner transferred correctly in MP for network relevance
	if(Level.Game != None
		&& Level.Game.bIsSinglePlayer)
		SetOwner(None);
}

simulated function RandomizeStart()
{
	Emitters[0].LifetimeRange.Max=(timemax*FRand() + timediv)/timediv;
	Emitters[0].LifetimeRange.Min=Emitters[0].LifetimeRange.Max*timeminratio;
}

simulated function FitToNormal(vector HNormal)
{
	Emitters[0].StartVelocityRange.X.Max+=HNormal.x*velmax;
	Emitters[0].StartVelocityRange.Y.Max+=HNormal.y*velmax;
	Emitters[0].StartVelocityRange.Z.Max+=HNormal.z*velmax;

	Emitters[0].VelocityLossRange.X.Max=abs(HNormal.x*velloss);
	Emitters[0].VelocityLossRange.X.Min=Emitters[0].VelocityLossRange.X.Max;
	Emitters[0].VelocityLossRange.Y.Max=abs(HNormal.y*velloss);
	Emitters[0].VelocityLossRange.Y.Min=Emitters[0].VelocityLossRange.Y.Max;
	Emitters[0].VelocityLossRange.Z.Max=abs(HNormal.z*velloss);
	Emitters[0].VelocityLossRange.Z.Min=Emitters[0].VelocityLossRange.Z.Max;
}


// Decompiled with UE Explorer.
defaultproperties
{
    VelMax=200.0000000
    velloss=4.0000000
    timemax=300.0000000
    timediv=100.0000000
    timeminratio=0.6000000
    bNetOptional=true
    RemoteRole=0
    TransientSoundRadius=10.0000000
}