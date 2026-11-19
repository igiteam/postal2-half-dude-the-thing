///////////////////////////////////////////////////////////////////////////
// UrineStreamMP
//
// Visual-only fluid effect (doesn't support collision or any interesting 
// physics)
//
// Checks the remote client owner pawns' bSteadyFiring variable to know if
// it should stay alive.
//
///////////////////////////////////////////////////////////////////////////
class UrineStreamMP extends P2Emitter;

var float InitialPourSpeed, InitialSpeedZPlus, SpeedVariance;
var int ReadyToDie;

const READY_TO_DIE_COUNT=8;

///////////////////////////////////////////////////////////////////////////
// Make the emitter shoot out of Rotation
///////////////////////////////////////////////////////////////////////////
function SetDir(vector newloc, vector dir, optional float velmag, optional bool bInitArc)
{
	local int i;
	//local vector dir;
	local float addzmag, usevelmag, zcheck;
	local vector ownervel;

	/*
	// find a factor of how inline with velocity motion, this direction is
	usevelmag = VSize(Owner.Velocity);
	if(usevelmag > 0)
		addzmag = ((VEL_Z_DOT_PLUS*(MyOwner.Velocity Dot dir))/usevelmag);
	else
		addzmag = 0;
		*/
	addzmag = InitialSpeedZPlus;
	//ownervel = -0.8*MyOwner.Velocity;

	// record velocity for collision particles
	//CollisionVelocity = InitialPourSpeed*dir - ownervel;
	//CollisionVelocity.z+= addzmag;

	// make it wobble a little
	//dir += VaryDir;

	for(i=0; i<Emitters.length; i++)
	{
		if(Emitters[i] != None)
		{
			Emitters[i].StartVelocityRange.X.Max = 	InitialPourSpeed*dir.x + -ownervel.x ;
			Emitters[i].StartVelocityRange.X.Min = 	Emitters[i].StartVelocityRange.X.Max;
			Emitters[i].StartVelocityRange.Y.Max = 	InitialPourSpeed*dir.y + -ownervel.y ;
			Emitters[i].StartVelocityRange.Y.Min = 	Emitters[i].StartVelocityRange.Y.Max;
			Emitters[i].StartVelocityRange.Z.Max = 	InitialPourSpeed*dir.z + -ownervel.z + addzmag;
			Emitters[i].StartVelocityRange.Z.Min = 	Emitters[i].StartVelocityRange.Z.Max;
		}
	}
	for(i=1; i<Emitters.length; i++)
	{
		if(Emitters[i] != None)
		{
			Emitters[i].StartVelocityRange.X.Max += (SpeedVariance);
			Emitters[i].StartVelocityRange.X.Min -= (SpeedVariance);
			Emitters[i].StartVelocityRange.Y.Max += (SpeedVariance);
			Emitters[i].StartVelocityRange.Y.Min -= (SpeedVariance);
			Emitters[i].StartVelocityRange.Z.Max += (SpeedVariance);
			Emitters[i].StartVelocityRange.Z.Min -= (SpeedVariance);
		}
	}
}

///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
simulated function Tick(float DeltaTime)
{
	local vector Dir;
	local Rotator Userot;
	local float OwnerPitch;

	if(Pawn(Owner) == None
		|| Pawn(Owner).bDeleteMe)
		Destroy();
	else
	{
		OwnerPitch = Pawn(Owner).ViewPitch * 256;     
		if (OwnerPitch > 32768) 
			OwnerPitch -= 65536;

		UseRot = Owner.Rotation;
		Userot.Pitch = OwnerPitch;
		Dir = vector(UseRot);

		SetDir(Location, Dir);

		if(!Pawn(Owner).bSteadyFiring)
		{
			ReadyToDie++;
			if(ReadyToDie >= READY_TO_DIE_COUNT)
				Destroy();
		}
		else
			ReadyToDie=0;
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    InitialPourSpeed=600.0000000
    InitialSpeedZPlus=500.0000000
    SpeedVariance=15.0000000
    Emitters[0]=StripEmitter'StripEmitter0'
    Emitters[1]=SpriteEmitter'SpriteEmitter299'
    AutoDestroy=true
    RemoteRole=2
}