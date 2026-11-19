///////////////////////////////////////////////////////////////////////////////
//
// BarrelExplodable
//
// Karma object that blows up when hit by somethings
// (it's filled with gasoline)
//
///////////////////////////////////////////////////////////////////////////////
class BarrelExplodable extends KActorExplodable;

///////////////////////////////////////////////////////////////////////////////
// VARS
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Modify the hit information, so it ridiculously flies up into the air
// and falls back over, while on fire
// put it below the object
///////////////////////////////////////////////////////////////////////////////
function CalcExplosionPhysics(out vector HitLocation, 
							  out vector Momentum)
{
	local float exp;

	HitLocation = Location;
	HitLocation.x += (FRand()*CollisionRadius) - CollisionRadius/2;
	HitLocation.y += (FRand()*CollisionRadius) - CollisionRadius/2;
	HitLocation.z -= CollisionRadius;

	Momentum.z = ExplosionMag;
	exp = ExplosionMag*0.4;
	Momentum.x=FRand()*exp - exp/2;
	Momentum.y=FRand()*exp - exp/2;
}



// Decompiled with UE Explorer.
defaultproperties
{
    Health=5.0000000
    BrokenStaticMesh=StaticMesh'Zo_Meshes.Karma.zo_barrel_exploded'
    ExplosionMag=80000.0000000
    WoofConversion=0.0015000
    StaticMesh=StaticMesh'Zo_Meshes.Karma.zo_barrel1'
    CollisionRadius=30.0000000
    CollisionHeight=50.0000000
    KParams=KarmaParams'KarmaParams13'
}