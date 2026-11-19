///////////////////////////////////////////////////////////////////////////////
// PlagueBounceProjectile.
// Copyright 2023 Running With Scissors Studios LLC.  All Rights Reserved.
//
// Shoots straight, but heavier than normal one. Also bounces everywhere, but
// doesn't seek.
// Not really concerned about fuel in this one. 
// 
///////////////////////////////////////////////////////////////////////////////
class PlagueBounceProjectile extends PlagueProjectile;

///////////////////////////////////////////////////////////////////////////////
// Vars and Consts
///////////////////////////////////////////////////////////////////////////////
var float VelDampenAdd;

const FLY_STRAIGHT_TIME	=	0.3;
const FIRST_STRAIGHT_TIME=  1.0;
const DAMPEN_ADD_MAX	=	0.7;
const DAMPEN_ADD_MIN	=	-0.2;

///////////////////////////////////////////////////////////////////////////////
// Explode on contact with walls.. people.. everything else makes you bounce off 
///////////////////////////////////////////////////////////////////////////////
simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	if ((Pawn(Other) != None
			&& Pawn(Other).Health > 0))
	{
		if(Other != Instigator)
		{
			GenExplosion(HitLocation,-Normal(Velocity), Other);
		}
	}
	// try to bounce off static stuff
	else if(Other.bStatic
		&& bBounce)
	{
		BounceOffSomething(-Velocity, Other);
	}
	else if(Other != self)
	{
		Other.Bump(self);
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
simulated function HitWall( vector HitNormal, actor Wall )
{
	// try to bounce off static stuff
	if(bBounce)
	{
		BounceOffSomething(HitNormal, Wall);
	}
	else 
		GenExplosion(Location, HitNormal, Wall);
}

///////////////////////////////////////////////////////////////////////////////
// Bounces off anything that's not your target, in a reflective manner
// and record the bounce. 
///////////////////////////////////////////////////////////////////////////////
function BounceOffSomething( vector HitNormal, actor Wall )
{
	local vector newhit, newnormal, EndPt;
	local bool bStopped;
	local float speed;
	local SparkHit spark1;
	
	// Cough
	//EmitSmokePuff(1.0);
	// Throw off some sparks from the hit
	spark1 = spawn(class'Fx.SparkHitProjectile',Owner,,Location,rotator(HitNormal));

	// Make it bounce up and off the normal a little strangely
	VelDampenAdd += 0.05*FRand();
	if(VelDampenAdd > DAMPEN_ADD_MAX)
		 VelDampenAdd = DAMPEN_ADD_MIN + 0.05*FRand();
	VelDampen = VelDampenAdd + default.VelDampen;

	// Update velocity
	Velocity = VelDampen * (Velocity - 2 * HitNormal * (Velocity Dot HitNormal));// + (speed*Frand()*HitNormal);

	// Update direction
	SetRotation(rotator(Velocity));

	Acceleration = ForwardAccelerationMag*Normal(Velocity);

	// play a noise (make it much lower)
	spark1.PlaySound(RocketBounce,,,,150,0.7*GetRandPitch());

	// Let it go straight for a little while
	GotoState('Flying', 'Straight');
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// FirstFlying
// When we first take off, set up a straight flying without gravity.
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
auto state FirstFlying
{
Begin:
	GotoState('Flying', 'FirstStraight');
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// Flying
// Actually cruising through the air
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state Flying
{
	///////////////////////////////////////////////////////////////////////////////
	// Change our direction from falling and all
	///////////////////////////////////////////////////////////////////////////////
	function Tick(float DeltaTime)
	{
		//log(self$" vel after "$Velocity);
		SetRotation(rotator(Velocity));
	}
FirstStraight:
	Sleep(FIRST_STRAIGHT_TIME);
	Acceleration.z += GravAccZ;
	Goto('Begin');

Straight:
	Sleep(FLY_STRAIGHT_TIME);
	Acceleration.z += GravAccZ;

Begin:
	// After this time make the rocket fall for lack of fuel before 
	// a given amount of time, before it's supposed to die.
	Sleep(LifeSpan - FallAfterNoFuelTime);
	StartTumbling();
}


// Decompiled with UE Explorer.
defaultproperties
{
    BlastOffVelMag=300.0000000
    GravAccZ=-1000.0000000
    VelDampen=0.9500000
    MaxSpeed=1200.0000000
    bBounce=true
}