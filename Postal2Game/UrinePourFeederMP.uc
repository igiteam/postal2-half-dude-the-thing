///////////////////////////////////////////////////////////////////////////
// Feeder that attaches to other objects to be poured out (like a gas tank)
//
// MP only
//
// Uses Pawn's bSteadyFiring to know when all remote clients are peeing.
//
///////////////////////////////////////////////////////////////////////////
class UrinePourFeederMP extends UrinePourFeeder;

///////////////////////////////////////////////////////////////////////////
// Make the visual component for *each* client (remotes and local that's pissing)
// and connect it
///////////////////////////////////////////////////////////////////////////
simulated function PostNetBeginPlay()
{
	local UrineStreamMP ustm;

	Super.PostNetBeginPlay();

	// Say it's flowing, for use in MP
	if(Pawn(Owner) != None)
	{
		// Tells the visuals on all the clients to say alive and not die yet. 
		Pawn(Owner).bSteadyFiring=true;

		// Only attach the visual version on the clients/listenserver
		if(NotDedOnServer())
		{
			// Check first to make sure it doesn't already have one with this same owner
			foreach DynamicActors(class'UrineStreamMP', ustm);
			if(ustm == None)
			{
				ustm = spawn(class'UrineStreamMP',Owner);
				ustm.SetBase(Owner);
			}
		}
	}
	else
		Destroyed();
}

///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
simulated function Destroyed()
{
	// Tells the visuals of the pissing on all the clients to die now.
	if(Pawn(Owner) != None)
		Pawn(Owner).bSteadyFiring=false;
	Super.Destroyed();
}


// Decompiled with UE Explorer.
defaultproperties
{
    QuantityPerHit=10.0000000
    Quantity=40.0000000
    Emitters[0]=StripEmitter'StripEmitter36'
    Emitters[1]=SpriteEmitter'SpriteEmitter298'
}