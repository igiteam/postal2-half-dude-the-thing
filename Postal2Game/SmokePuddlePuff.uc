//=============================================================================
// SmokePuddlePuff. Puff of smoke to accompany FirePuddleBurst
//=============================================================================
class SmokePuddlePuff extends Wemitter;

const EMISSION_RATIO=2.0;

function SetBurstSize()
{
	local int usenum;

	usenum = Rand(Emitters[0].MaxParticles) + Emitters[0].MaxParticles;
	// Decrease smoke detail
	usenum = P2GameInfo(Level.Game).ModifyBySmokeDetail(usenum);
	if(usenum != 0)
	{
		SuperSpriteEmitter(Emitters[0]).SetMaxParticles(usenum);
		Emitters[0].InitialParticlesPerSecond = Emitters[0].MaxParticles*EMISSION_RATIO;
		Emitters[0].StartLocationRange.X.Max = 2*usenum;
		Emitters[0].StartLocationRange.X.Min = -Emitters[0].StartLocationRange.X.Max;
		Emitters[0].StartLocationRange.Y.Max = Emitters[0].StartLocationRange.X.Max;
		Emitters[0].StartLocationRange.Y.Min = Emitters[0].StartLocationRange.X.Min;
		Emitters[0].StartLocationRange.Z.Max = Emitters[0].StartLocationRange.X.Max;
		Emitters[0].StartLocationRange.Z.Min = Emitters[0].StartLocationRange.X.Min;
	}
	else
		Emitters[0].Disabled=true;
}

// SLOW: put the wind variable into level info or something, and just access
// it through there, rather than searching the level for the wind when you need it.
function AssessWind()
{
	local Wind usewind;

	ForEach DynamicActors(class 'Wind', usewind)
	{
		ApplyWindEffects(usewind.Acc, usewind.OldAcc);
		return;
	}
}

auto state Starting
{
	function BeginState()
	{
		SetBurstSize();
		// Try to find the wind in the level and apply some to us
		// since we're so short-lived.
		AssessWind();
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter218'
    AutoDestroy=true
}