//=============================================================================
// Splat
// base class of Postal damage decals
//=============================================================================
class Splat extends Projector;

var float Lifetime;
var float UseLife;
var float StartTime;

const MIN_RESTART_TIME	=	5.0;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
simulated function PreBeginPlay()
{
    if (Level.NetMode == NM_DedicatedServer)
    {
        Destroy();
        return;
    }
	else
		Super.PreBeginPlay();
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
simulated function PostBeginPlay()
{
	//log(self$" postbeginplay "$level.game$", casted "$FPSGameInfo(Level.Game));
	// Don't allow me at all if the game info said so
	if(Level.Game != None
		&& !bUseProjectors)
	{
		Destroy();
	}
	else
	{
		// Don't call super
		AttachProjector();
		// Don't modify lifetime
		if(FPSGameInfo(Level.Game) != None)
			UseLife = 2 + Lifetime*FPSGameInfo(Level.Game).GetSplatDetail();
		else
			UseLife = 2 + Lifetime;
		AbandonProjector(UseLife);
		// Save that we projected and are waiting for a reload to reproject
		// Don't destroy me, so I can be saved and then come back to be reprojected
		bReprojectAfterLoad=true;
		// Destroy yourself after this
		SetTimer(UseLife, false);
		StartTime = Level.TimeSeconds;
	}
}

// RWS Change 02/20/02
// Reproject after the load if we need to
event PostLoadGame()
{
	local float restarttime;

	restarttime = (UseLife + StartTime) - Level.TimeSeconds;

	if(restarttime > MIN_RESTART_TIME)
	{
		// Reproject now
		AttachProjector();
		AbandonProjector(restarttime);
		// Save that we projected and are waiting for a reload to reproject. 
		// Don't destroy us though. We must be saved, in order to come back
		bReprojectAfterLoad=true;
		SetTimer(restarttime, false);
	}
}

// RWS Change 02/20/02
// Only called when you need to destroy yourself, so you aren't resaved even
// after the projector has been abadoned.
simulated function Timer()
{
	Destroy();
}

/* Reset() 
reset actor to initial state - used when restarting level without reloading.
*/
simulated function Reset()
{
	Destroy();
}


// Decompiled with UE Explorer.
defaultproperties
{
    Lifetime=3.0000000
    MaxTraceDistance=32
    bProjectActor=false
    bClipBSP=true
    bStatic=false
    bNetOptional=true
    CullDistance=4000.0000000
    bGameRelevant=true
}