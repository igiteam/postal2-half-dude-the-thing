///////////////////////////////////////////////////////////////////////////////
// A standing puddle of Puke
///////////////////////////////////////////////////////////////////////////////
class PukePuddle extends FluidPuddle;


var float LifeLeft;		// how much time till i'm dissolved slowly

const MIN_KEEP_RADIUS = 20;
const MAX_LIFE_SPAN	=	60;
const MIN_LIFE_SPAN	=	20;
const TIME_TO_MAKE_PUDDLE = 0.2;

const RAD_RAND	=	30;
const RAD_BASE	=	60;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function PostBeginPlay()
{
	RadMax = RAD_BASE + FRand()*RAD_RAND;
	Super.PostBeginPlay();
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function bool CheckForKeepRadius()
{
	if(UseColRadius < MIN_KEEP_RADIUS
		&& !IsLeaking)
	{
		SlowlyDestroy();
		return false;
	}

	return true;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function AddQuantity(float MoreQ, vector InputPoint, Fluid InputFluid)
{
	UpdateCollisionFromNewQuantity(MoreQ, InputPoint, InputFluid);

	// update visuals
	Emitters[0].StartSizeRange.X.Min = UseColRadius/3;
	Emitters[0].StartSizeRange.X.Max = UseColRadius/3+1;
	Emitters[0].StartSizeRange.Y.Min = UseColRadius/3;
	Emitters[0].StartSizeRange.Y.Max = UseColRadius/3+1;
	// update particle motion
    Emitters[0].StartVelocityRange.X.Max=UseColRadius;
	Emitters[0].StartVelocityRange.X.Min=-UseColRadius;
    Emitters[0].StartVelocityRange.Y.Max=UseColRadius;
	Emitters[0].StartVelocityRange.Y.Min=-UseColRadius;
	// emit more
	Emitters[0].SpawnParticle(1);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// Waiting to die
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state WaitingToDie
{
	function bool CalcDieTime(out float DieTime)
	{
		if(!IsLeaking)
		{
			DieTime = UseColRadius/6;

			if(DieTime < MIN_LIFE_SPAN)
				DieTime = MIN_LIFE_SPAN;
			if(DieTime > MAX_LIFE_SPAN)
				DieTime = MAX_LIFE_SPAN;

			return true;
		}
		return false;
	}
Begin:
	if(CalcDieTime(LifeLeft))
	{
		Sleep(LifeLeft);
		SlowlyDestroy();
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    TrailStarterClass=Class'PukeTrailStarter'
    DripFeederClass=Class'PukeDripFeeder'
    RippleClass=Class'PukeRippleEmitter'
    UseColRadius=35.0000000
    MyType=4
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter145'
    AutoDestroy=true
    bCollideActors=true
}