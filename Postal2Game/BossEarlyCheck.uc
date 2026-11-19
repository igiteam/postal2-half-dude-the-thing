///////////////////////////////////////////////////////////////////////////////
// Tells owner about touches
///////////////////////////////////////////////////////////////////////////////
class BossEarlyCheck extends Keypoint;

///////////////////////////////////////////////////////////////////////////////
// Pass hit along to owner
///////////////////////////////////////////////////////////////////////////////
function Touch(Actor Other)
{
	// If projectile hits area and it's the players, tell your owner about it
	if(Projectile(Other) != None
		&& AWDude(Other.Owner) != None)
	{
		AWCowBossPawn(Owner).ProjectileComing(Other);
	}
	// Tell him also if a cat is coming that way (dervish or not)
	else if(AWCatPawn(Other) != None)
		AWCowBossPawn(Owner).DervishComing(Other);
}


// Decompiled with UE Explorer.
defaultproperties
{
    bStatic=false
    DrawScale=5.0000000
    CollisionRadius=250.0000000
    CollisionHeight=225.0000000
    bCollideActors=true
}