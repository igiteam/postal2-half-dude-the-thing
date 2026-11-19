///////////////////////////////////////////////////////////////////////////////
// Puddle zombie bodies dissolve into--but not connected to the liquid physics
///////////////////////////////////////////////////////////////////////////////
class ZDissolvePuddle extends P2Emitter;

#exec TEXTURE IMPORT NAME=whitecircle FILE=Textures\whitecircle.dds MIPS=on

var float randsizepct;		// range of percentages, from 0.0 to this
var float randstarttimepct;		// range of percentages, from 0.0 to this

///////////////////////////////////////////////////////////////////////////////
// Randomize the size some
///////////////////////////////////////////////////////////////////////////////
function PostBeginPlay()
{
	Super.PostBeginPlay();
	RandomizePuddle();
}

///////////////////////////////////////////////////////////////////////////////
// when the timer is called, selfdestroy the emitter
///////////////////////////////////////////////////////////////////////////////
function Timer()
{
	SelfDestroy();
}

///////////////////////////////////////////////////////////////////////////////
// Randomizes size and start time
///////////////////////////////////////////////////////////////////////////////
function RandomizePuddle()
{
	local int i;
	local float sizer, timer;

	if(Emitters.Length > 0)
	{
		sizer = randsizepct*FRand();
		timer = randstarttimepct*FRand();
		// Randomize the size of the first one
		Emitters[0].StartSizeRange.X.Min += sizer*(Emitters[0].StartSizeRange.X.Min);
		Emitters[0].StartSizeRange.X.Max += sizer*(Emitters[0].StartSizeRange.X.Max);
		// Randomize the times for the first one
		Emitters[0].LifetimeRange.Min += timer*Emitters[0].LifetimeRange.Min;
		Emitters[0].LifetimeRange.Max += timer*Emitters[0].LifetimeRange.Max;
		Emitters[0].FadeOutStartTime += timer*Emitters[0].FadeOutStartTime;
		Emitters[0].FadeInEndTime += timer*Emitters[0].FadeInEndTime;
		// increase the start location area for the next two
		if(Emitters.Length > 2)
		{
			for(i=1; i<3; i++)
			{
				Emitters[i].StartLocationRange.X.Min += sizer*(Emitters[i].StartLocationRange.X.Min);
				Emitters[i].StartLocationRange.X.Max += sizer*(Emitters[i].StartLocationRange.X.Max);
				Emitters[i].StartLocationRange.Y.Min += sizer*(Emitters[i].StartLocationRange.Y.Min);
				Emitters[i].StartLocationRange.Y.Max += sizer*(Emitters[i].StartLocationRange.Y.Max);
			}
		}
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    randsizepct=0.7000000
    randstarttimepct=1.0000000
    Emitters[0]=SpriteEmitter'SpriteEmitter81'
    Emitters[1]=SpriteEmitter'SpriteEmitter85'
    Emitters[2]=SpriteEmitter'SpriteEmitter86'
    AutoDestroy=true
    LifeSpan=40.0000000
}