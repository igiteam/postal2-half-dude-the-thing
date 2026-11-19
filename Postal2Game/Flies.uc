//=============================================================================
// Flies.
//=============================================================================
class Flies extends P2Emitter;

var vector AccDir;
var float dir1;

const ACC_MAX	=	100;

function PostBeginPlay()
{
	Super.PostBeginPlay();
	SetTimer(0.15, true);
//	log("flies object was begun");
}

function Timer()
{
	local vector randvect;
	AccDir.x+=dir1;
	AccDir.y-=dir1/2;
	AccDir.z+=dir1/3;
	if(AccDir.x > 1.0 && dir1 > 0)
		dir1 = -dir1;
	else if(AccDir.x < -1.0 && dir1 < 0)
		dir1 = -dir1;
//	randvect.x = FRand() - 0.5;
//	randvect.y = FRand() - 0.5;
//	randvect.z = FRand() - 0.5;
//	Normal(randvect);
	randvect = Normal(AccDir);

	Emitters[0].Acceleration = (FRand()*ACC_MAX)*randvect;
//	log("new flies acceleration "$Emitters[0].Acceleration);

	//SetTimer(FRand()+0.1, false);
}


// Decompiled with UE Explorer.
defaultproperties
{
    dir1=0.0500000
    Emitters[0]=SpriteEmitter'SpriteEmitter8'
    AutoDestroy=true
}