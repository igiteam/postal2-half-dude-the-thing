//=============================================================================
// Feeder to be dripping off of roofs and ledges where a stream led up to.
//=============================================================================
class GasDripFeeder extends FluidDripFeeder;

const CHECK_DIST_TO_GROUND = 3000;
const DRIP_SIZE1 = 250;
const DRIP_SIZE2 = 1000;

const QUANTITY_MOD_BY_Z	=	0.7;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function InitFlow()
{
	local vector newhit, newnormal, endpt;

	// Check distance to ground to determine what 
	// effects will accompany this
	endpt=Location;
	endpt.z-=CHECK_DIST_TO_GROUND;
	if(Trace(newhit, newnormal, endpt, Location, false) != None)
	{
		//log("making new FSplash for "$self);
		DistToGround = VSize(newhit-Location);
		if(FSplash != None)
		{
			//log("destroying "$FSplash);
			FSplash.Destroy();
		}
		// based on the size, make certain splashes
		if(DistToGround < DRIP_SIZE1)
		{
			FSplash = spawn(class'GasSplashEmitterSmall',self);
		}
		else if(DistToGround < DRIP_SIZE2)
		{
			FSplash = spawn(class'GasSplashEmitterMed',self);
		}
		else
		{
			FSplash = spawn(class'GasSplashEmitterLarge',self);
		}
		FSplash.EnableSpawnAll(false);

		//log("gas splash made as a "$FSplash);
		//log("dist was "$DistToGround);
	}

	Super.InitFlow();
}


// Decompiled with UE Explorer.
defaultproperties
{
    QuantityPerHit=25.0000000
    SplashClass=Class'GasSplashEmitterMed'
    TrailClass=Class'GasTrail'
    TrailStarterClass=Class'GasTrailStarter'
    PuddleClass=Class'GasPuddle'
    MyType=1
    bCanBeDamaged=true
    Quantity=400.0000000
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter125'
    Emitters[1]=SuperSpriteEmitter'SuperSpriteEmitter126'
    AutoDestroy=true
    bCollideActors=true
}