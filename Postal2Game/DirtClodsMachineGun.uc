//=============================================================================
// DirtClodsMachineGun.
//=============================================================================
class DirtClodsMachineGun extends P2Emitter;

const VEL_MAX = 280;
//const LIFETIME_MAX = 400;
//const LIFETIME_DIV = 100;
//const LIFETIME_MIN_RATIO=0.6;

//replication
//{
	// server sends this to client if enough bandwidth available
//	unreliable if(Role==ROLE_Authority)
//		FitToNormal;
//}

function PostBeginPlay()
{
	Super.PostBeginPlay();
	RandomizeStart();
	FitToNormal(vector(Rotation));
}

function RandomizeStart()
{
//	Emitters[0].LifetimeRange.Max=(LIFETIME_MAX*FRand() + LIFETIME_DIV)/LIFETIME_DIV;
//	Emitters[0].LifetimeRange.Min=Emitters[0].LifetimeRange.Max*LIFETIME_MIN_RATIO;
}

simulated function FitToNormal(vector HNormal)
{
	Emitters[0].StartVelocityRange.X.Max+=HNormal.x*VEL_MAX;
	Emitters[0].StartVelocityRange.Y.Max+=HNormal.y*VEL_MAX;
	Emitters[0].StartVelocityRange.Z.Max+=HNormal.z*VEL_MAX;
	Emitters[0].StartVelocityRange.X.Min+=HNormal.x*VEL_MAX;
	Emitters[0].StartVelocityRange.Y.Min+=HNormal.y*VEL_MAX;
	Emitters[0].StartVelocityRange.Z.Min+=HNormal.z*VEL_MAX;
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitter269'
    AutoDestroy=true
    bNetOptional=true
    RemoteRole=0
    CullDistance=3500.0000000
}