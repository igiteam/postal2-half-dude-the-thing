///////////////////////////////////////////////////////////////////////////////
// ProjectileAlert
// Copyright 2004 Running With Scissors, Inc.  All Rights Reserved.
//
// Tell people a projectile (like a flying machete) is coming so
// they can block it if they want.
///////////////////////////////////////////////////////////////////////////////
class ProjectileAlert extends Keypoint;

///////////////////////////////////////////////////////////////////////////////
// Tell things that you hit them, so they know what to do with you coming
// their way.
///////////////////////////////////////////////////////////////////////////////
function Touch(Actor Other)
{
	// If projectile hits area and it's the players, tell your owner about it
	if(PersonPawn(Other) != None
		&& Projectile(Owner) != None)
	{
		PersonPawn(Other).BlockMelee(Owner);
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    bStatic=false
    CollisionRadius=200.0000000
    CollisionHeight=80.0000000
    bCollideActors=true
}