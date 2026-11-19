//=============================================================================
// DefaultPhysicsVolume:  the default physics volume for areas of the level with 
// no physics volume specified
//=============================================================================
class DefaultPhysicsVolume extends PhysicsVolume
	native;

function Destroyed()
{
	log(self$" destroyed!");
	assert(false);
}


// Decompiled with UE Explorer.
defaultproperties
{
    bStatic=false
    bNoDelete=false
    bAlwaysRelevant=false
    RemoteRole=0
}