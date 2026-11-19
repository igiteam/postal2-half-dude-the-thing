class WillowWhisp extends Emitter;

var		vector		WayPoints[17];
var		int			NumPoints;
var		int			Position;
var		float		Sleeptime;

function PostBeginPlay()
{
	local int i;
	local Controller C;
	local Actor HitActor;
	local Vector HitLocation,HitNormal;
	Super.PostBeginPlay();

	C = Pawn(Owner).Controller;
	SetLocation(Owner.Location);

	WayPoints[0] = Owner.Location + 200 * vector(C.Rotation);
	HitActor = Trace(HitLocation, HitNormal,WayPoints[0], Owner.Location,false);
	if ( HitActor != None )
		WayPoints[0] = HitLocation;
	NumPoints++;
	for ( i=0; i<16; i++ )
	{
		if ( C.RouteCache[i] == None )
			break;
		else
		{
			WayPoints[NumPoints] = C.RouteCache[i].Location;
			NumPoints++;
		}
	}
	StartNextPath();
}

function bool StartNextPath()
{
	if ( Position == NumPoints )
		return false;

	Velocity = 1000 * Normal(WayPoints[Position] - Location);
	SetRotation(rotator(Velocity));
	SleepTime = VSize(WayPoints[Position] - Location)/1000;
	Position++;
	return true;
}

Auto State Pathing
{
Begin:
	Sleep(SleepTime);
	if ( StartNextPath() )
		Goto('Begin');
	Destroy();
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitter0'
    bNoDelete=false
    bOnlyOwnerSee=true
    Physics=6
    RemoteRole=2
    bIgnoreOutOfWorld=true
}