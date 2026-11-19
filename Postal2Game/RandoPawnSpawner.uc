class RandoPawnSpawner extends AWPawnSpawner;

var() array< class<Pawn> > SpawnClasses;	// List of classes to spawn (picks one at random every time)

///////////////////////////////////////////////////////////////////////////////
// Get the class of the thing to spawn
///////////////////////////////////////////////////////////////////////////////
function class<Actor> GetSpawnClass()
{
	return SpawnClasses[Rand(SpawnClasses.Length)];
}

