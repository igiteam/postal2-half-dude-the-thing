//=============================================================================
// FireSmall.
//=============================================================================
class FireSmall extends FireEmitter;

const FADE_IN_TIME=2.0;

function PostBeginPlay()
{
	Emitters[0].Disabled=true;	// turn off at first (wait to start)
	Super.PostBeginPlay();
}

auto state Expanding
{
	simulated function Timer()
	{
		// turn back on (effectively start)
		Emitters[0].Disabled=false;
		GotoState('Burning');
	}
	function BeginState()
	{
		SetTimer(FADE_IN_TIME, false);
	}
}

state Burning
{
	simulated function Timer()
	{
		GotoState('Fading');
	}
	function BeginState()
	{
		SetTimer(OrigLifeSpan-FADE_IN_TIME, false);
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitter265'
    AutoDestroy=true
    bDynamicLight=true
    Physics=10
    LifeSpan=13.0000000
    CollisionRadius=60.0000000
    CollisionHeight=100.0000000
}