///////////////////////////////////////////////////////////////////////////////
// PathBlockingVolume:  
//
// Same as a blocking volume but it gets destroyed on level startup. It effectively
// is there to block paths when they are built, but then go away when the level is played.
//
///////////////////////////////////////////////////////////////////////////////

class PathBlockingVolume extends BlockingVolume;

///////////////////////////////////////////////////////////////////////////////
// Since script only gets called when the level is run--not it the editor--we'll
// just destroy the object here.
///////////////////////////////////////////////////////////////////////////////
function PostBeginPlay()
{
	Super.PostBeginPlay();
	Destroy();
}


// Decompiled with UE Explorer.
defaultproperties
{
    BrushColor=(R=150,G=0,B=0,A=255)
    bColored=true
    bStatic=false
    bNoDelete=false
    bBlockZeroExtentTraces=true
    bPathColliding=true
}