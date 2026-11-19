///////////////////////////////////////////////////////////////////////////////
// NapalmTrail
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// a trail of napalm fuel on a surface
// We say napalm is so volatile that it will eventually ignite no matter
// what, like say just from the heat energy of getting moved around too much or
// something. So slowly eat off it's time
///////////////////////////////////////////////////////////////////////////////
class NapalmTrail extends GasTrail;

var float HealthReduction;		// how quickly to reduce your health from the environment

///////////////////////////////////////////////////////////////////////////////
// Slowly eat away your health so you'll ignite after a while no matter what
///////////////////////////////////////////////////////////////////////////////
function Tick(float DeltaTime)
{
	Health-=HealthReduction*DeltaTime;

	// set ablaze eventually.
	if(Health < MIN_HEALTH)
	{
		SetAblaze(Location, true);
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    HealthReduction=500.0000000
    DripTrailClass=none
    StarterClass=Class'NapalmStarterFollow'
    MyType=8
    FireClass=Class'FireNapalmStreak'
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter158'
    LifeSpan=10.0000000
    CollisionRadius=600.0000000
    CollisionHeight=600.0000000
}