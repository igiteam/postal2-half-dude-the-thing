/**
 * P2EWeedFireEmitter
 *
 * Small damageless fire emitter to attach to the weed
 */
class P2EWeedFireEmitter extends FireEmitter;

var float SmokeSizeChange;
var float SmokeVelZChange;
var float SmokeEmissionChange;

/** Stubbed out, we don't deal damage */
function DealDamage(float DeltaTime);

state Fading
{
    function BeginState() {
		LifeSpan = FadeTime + WaitAfterFadeTime;
		SetTimer(FadeTime, false);

		SizeChange = -Emitters[0].StartSizeRange.X.Min / (2 * FadeTime);
		VelZChange = -Emitters[0].StartVelocityRange.Z.Min / FadeTime;
		EmissionChange = -Emitters[0].ParticlesPerSecond / 2 * FadeTime;

		SmokeSizeChange = -Emitters[1].StartSizeRange.X.Min / (2 * FadeTime);
		SmokeVelZChange = -Emitters[1].StartVelocityRange.Z.Min / FadeTime;
		SmokeEmissionChange = -Emitters[1].ParticlesPerSecond / 2 * FadeTime;
	}

	simulated function Timer() {
		GotoState('WaitAfterFade');
	}

	function Tick(float DeltaTime) {
		Emitters[0].StartSizeRange.X.Max += (2 * SizeChange * DeltaTime);
		Emitters[0].StartSizeRange.X.Min += (SizeChange * DeltaTime);
		Emitters[0].StartVelocityRange.Z.Max += (VelZChange * DeltaTime);
		Emitters[0].StartVelocityRange.Z.Min += (VelZChange * DeltaTime);
		Emitters[0].InitialParticlesPerSecond += (EmissionChange * DeltaTime);
		Emitters[0].ParticlesPerSecond += (EmissionChange * DeltaTime);

		Emitters[1].StartSizeRange.X.Max += (2 * SmokeSizeChange * DeltaTime);
		Emitters[1].StartSizeRange.X.Min += (SmokeSizeChange * DeltaTime);
		Emitters[1].StartVelocityRange.Z.Max += (SmokeVelZChange * DeltaTime);
		Emitters[1].StartVelocityRange.Z.Min += (SmokeVelZChange * DeltaTime);
		Emitters[1].InitialParticlesPerSecond += (SmokeEmissionChange * DeltaTime);
		Emitters[1].ParticlesPerSecond += (SmokeEmissionChange * DeltaTime);
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter0'
    Emitters[1]=SuperSpriteEmitter'SuperSpriteEmitter1'
    bDynamicLight=true
    CollisionRadius=100.0000000
    CollisionHeight=100.0000000
}