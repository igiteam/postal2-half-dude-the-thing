//=============================================================================
// Cloud of deadly gas
//=============================================================================
class AnthCloud extends Anth;

var	float RadVel;
var	vector MainAcc;
var	vector Velocity;
var	vector colpt1, colpt2;
var	float CollisionTime;
var vector VelocityMax;

const EXPANDING_TIME = 10;
const VEL_MAG_COL_MULT=5;
const COLLISION_MOVEMENT_FREQ_TIME = 1.0;
const HURTING_TIME = 10;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	RadVel = (CollisionRadius/2 - DamageDistMag)/EXPANDING_TIME;
	VelocityMax = Emitters[0].MaxAbsVelocity;
}

/*
function MoveCenter(float DeltaTime)
{
	local int i;

	Velocity+=MainAcc*DeltaTime;
	CollisionLocation += Velocity*DeltaTime;
	for(i=0; i<Emitters.length; i++)
	{
		Emitters[i].StartLocationOffset = CollisionLocation - Location;
	}
}

*/

function CapVel(out float vx, float vmax)
{
	if(vx > vmax)
		vx = vmax;
	else if(vx < -vmax)
		vx = -vmax;
}

function MoveCenter(float DeltaTime)
{
	Velocity+=MainAcc*DeltaTime;
	SetLocation(Location + Velocity*DeltaTime);
	CollisionLocation = Location;
	// cap velocity
	CapVel(Velocity.x, VelocityMax.x);
	CapVel(Velocity.y, VelocityMax.y);
	CapVel(Velocity.z, VelocityMax.z);
}

auto state Expanding
{
	simulated function Timer()
	{
		GoToState('Hurting');
	}
	
	simulated function Tick(float DeltaTime)
	{
		// increase the radius of the cloud
		DamageDistMag+=RadVel*DeltaTime;
		// increase the area to emit little particles
		Emitters[1].StartLocationRange.X.Max += RadVel*DeltaTime;
		Emitters[1].StartLocationRange.X.Min = -Emitters[1].StartLocationRange.X.Max;
		Emitters[1].StartLocationRange.Y.Max =  Emitters[1].StartLocationRange.X.Max;
		Emitters[1].StartLocationRange.Y.Min =  Emitters[1].StartLocationRange.X.Min;
		Emitters[1].StartLocationRange.Z.Max =  Emitters[1].StartLocationRange.X.Max;
		Emitters[1].StartLocationRange.Z.Min =  Emitters[1].StartLocationRange.X.Min;
		Emitters[2].StartLocationRange = Emitters[1].StartLocationRange;
		Emitters[0].StartLocationRange.X.Max = Emitters[1].StartLocationRange.X.Max/2;
		Emitters[0].StartLocationRange.X.Min = -Emitters[0].StartLocationRange.X.Max;
		Emitters[0].StartLocationRange.Y.Max =  Emitters[0].StartLocationRange.X.Max;
		Emitters[0].StartLocationRange.Y.Min =  Emitters[0].StartLocationRange.X.Min;
		Emitters[0].StartLocationRange.Z.Max =  Emitters[0].StartLocationRange.X.Max;
		Emitters[0].StartLocationRange.Z.Min =  Emitters[0].StartLocationRange.X.Min;

		// perform collisions
		CheckToHitActors(DeltaTime);
		CheckWalls();
		// move center emitter to match particles
		MoveCenter(DeltaTime);
	}

	simulated function BeginState()
	{
		SetTimer(EXPANDING_TIME, false);
	}
}

state Hurting
{
	simulated function Tick(float DeltaTime)
	{
		CheckToHitActors(DeltaTime);
		// move center emitter to match particles
		MoveCenter(DeltaTime);
	}

	simulated function BeginState()
	{
		// set up collision movement timer
		SetTimer(COLLISION_MOVEMENT_FREQ_TIME, true);
	}
}

state WaitAndFade
{
	ignores Timer;

	simulated function Tick(float DeltaTime)
	{
		// don't hurt things here
	}

	// Don't hurt stuff here, in this state
	simulated function BeginState()
	{
		local int i;
		for(i=0; i<Emitters.length; i++)
		{
			AutoDestroy=true;
			Emitters[i].ParticlesPerSecond=0;
			Emitters[i].RespawnDeadParticles=false;
		}
	}
}

function ApplyWindEffects(vector NewAcc, vector OldAcc)
{
	local vector newhit, newnormal;
	local float vdist;

	// Scale accelerations down so we don't get too quickly
	// swept away by wind.
	NewAcc/=32;
	OldAcc/=32;
	// Get moved by the wind (a fractional amount though)
	MainAcc -= OldAcc;
	MainAcc += NewAcc;
	Super.ApplyWindEffects(NewAcc, OldAcc);
}

function CheckWalls()
{
	local vector newhit, newnormal;
	local float vdist, cfull, chalf;
	local vector NewAcc, OldAcc;

	OldAcc=vect(0, 0, 0);
	// do collision based on velocity
	vdist = VSize(Velocity);
	if(vdist > 0)
	{
		// start with cloud center
		colpt1 = CollisionLocation;
		colpt2 = VEL_MAG_COL_MULT*Velocity;
		/*
		cfull = Emitters[0].StartLocationRange.X.Max;
		chalf = chalf/2;
		// for second point, extend out a multiple of the velocity, and add
		// some randomness based on the cloud size
		colpt2.x+=(FRand()*cfull - chalf);
		colpt2.y+=(FRand()*cfull - chalf);
		colpt2.z+=(FRand()*cfull - chalf);
		*/
		colpt2 += CollisionLocation;
		if(Trace(newhit, newnormal, colpt2, colpt1, false) != None)
		{
			//log("mainacc before "$MainAcc);
			//log("wind acc before "$NewAcc);
			//NewAcc += (Velocity - 2 * newnormal * (Velocity Dot newnormal))/4;
			Velocity = (Velocity - 2 * newnormal * (Velocity Dot newnormal));
			//Velocity/=2;
			//log("new acc "$NewAcc);
		}
		MainAcc += NewAcc;
		Super.ApplyWindEffects(NewAcc, OldAcc);
	}
}

// Perform collision operations
simulated function Timer()
{
	CheckWalls();

	// keep approx time of how long you've been doing this
	CollisionTime += COLLISION_MOVEMENT_FREQ_TIME;
	if(CollisionTime > HURTING_TIME)
		GotoState('WaitAndFade');
}

simulated event RenderOverlays( canvas Canvas )
{
/*
	Super.RenderOverlays(Canvas);
	if(SHOW_LINES == 1)
		Canvas.Draw3Line(colpt1, colpt2, 0);
*/
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitter196'
    Emitters[1]=SpriteEmitter'SpriteEmitter197'
    Emitters[2]=SpriteEmitter'SpriteEmitter198'
    AutoDestroy=true
    RemoteRole=2
    LifeSpan=120.0000000
    CollisionRadius=800.0000000
    CollisionHeight=400.0000000
}