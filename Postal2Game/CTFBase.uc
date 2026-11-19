//=============================================================================
// CTFBase.
//=============================================================================
class CTFBase extends GameObjective
	abstract;

var CTFFlag myFlag;
var class<CTFFlag> FlagType;

function BeginPlay()
{
	Super.BeginPlay();
	bHidden = false;

	myFlag = Spawn(FlagType, self);

	if (myFlag==None)
	{
		warn(Self$" could not spawn flag of type '"$FlagType$"' at "$location);
		return;
	}
	else
	{
		myFlag.HomeBase = self;
		myFlag.TeamNum = DefenderTeamIndex;
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    bStatic=false
    bAlwaysRelevant=true
    SoundRadius=255.0000000
    SoundVolume=255
    bCollideActors=true
    NetUpdateFrequency=8.0000000
}