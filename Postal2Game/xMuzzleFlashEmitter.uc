//=====================================================================================
// xMuzzleFlashEmitter
// Created by Man Chrzan for xPatch 2.0
//
// New base class for Emitter-based Muzzle Flashes with dynamic lighting support
//=====================================================================================
class xMuzzleFlashEmitter extends P2Emitter;

/////////////////////////////////////////////////////////////////
// Vars
/////////////////////////////////////////////////////////////////
var int TickCount;
var int MaxTickCount;
var byte FlashAmbientGlow;
var ELightType FlashLightType;

/////////////////////////////////////////////////////////////////
// Setup Emitter
/////////////////////////////////////////////////////////////////
simulated function SetEmitterScale(float Scale, float Scale2, float Time )
{
	if( Scale != 0 && Emitters[0] != None )	
		Emitters[0].SizeScale[0].RelativeSize = Scale;
	if( Scale2 != 0 && Emitters[0] != None )	
		Emitters[0].SizeScale[1].RelativeSize = Scale2;
	if( Time != 0 && Emitters[0] != None )	
		Emitters[0].SizeScale[1].RelativeTime = Time;
}

simulated function SetEmitterSize(float Size, float Size2)
{
	if( Size != 0 && Emitters[0] != None )	
		Emitters[0].StartSizeRange.X.Min = Size;
	if( Size2 != 0 && Emitters[0] != None )	
		Emitters[0].StartSizeRange.X.Max = Size2;
}

simulated function SetEmitterTexture(Texture newTex)
{
	if( newTex != None && Emitters[0] != None  )
		Emitters[0].Texture = newTex;
}
/*
simulated function SetEmitterSubdivisions(int U, int V)
{
	if( U != 0 && Emitters[0] != None  )
		Emitters[0].TextureUSubdivisions = U;
		
	if( V != 0 && Emitters[0] != None  )
		Emitters[0].TextureVSubdivisions = V;
}
*/
simulated function SetEmitterLifetime(float NewMin, float NewMax)
{
	if( NewMin != 0 )
		Emitters[0].LifetimeRange.Min = NewMin;		
	
	if( NewMax != 0 )
	{
		Emitters[0].LifetimeRange.Max = NewMax;
		if( NewMax > Default.LifeSpan )
			LifeSpan = NewMax;
	}	
}
/*
simulated function SetEmitterDrawStyle(bool bBrighten)
{
	if(bBrighten)
		Emitters[0].DrawStyle=PTDS_Brighten;
	else
		Emitters[0].DrawStyle=PTDS_AlphaBlend;
}
*/
simulated function SetEmitterSpin(range SpinRan, range SpinsPerSec)
{
	if(SpinsPerSec.Max != 0)
	{
		Emitters[0].SpinParticles = True;
		Emitters[0].StartSpinRange.X.Min = SpinRan.Min;
        Emitters[0].SpinsPerSecondRange.X.Min = SpinsPerSec.Min;
		Emitters[0].StartSpinRange.X.Max = SpinRan.Max;
        Emitters[0].SpinsPerSecondRange.X.Max = SpinsPerSec.Max;
	}
}

/////////////////////////////////////////////////////////////////
// Setup Dynamic Light
/////////////////////////////////////////////////////////////////
simulated function SetDynamicLight()
{
	GotoState('DynamicLight');
}

simulated state DynamicLight
{
	simulated event Tick(float Delta)
	{
		if (TickCount>MaxTickCount)
		{
			if(LightBrightness > 0)
				LightBrightness -= 50;
			else
				GotoState('');
		}
	
		TickCount++;
	}

	simulated function EndState()
	{
		LightType=LT_None;
	
		if(P2Weapon(Instigator.Weapon) != None)
			P2Weapon(Instigator.Weapon).SetupWeaponGlow(0);
	}

	simulated function BeginState()
	{
		TickCount=0;
		LightBrightness = RandRange(100,200);
		LightRadius = RandRange(10,20);
		LightType = FlashLightType;
		
		if(P2Weapon(Instigator.Weapon) != None)
			P2Weapon(Instigator.Weapon).SetupWeaponGlow(FlashAmbientGlow);

	}
}

/////////////////////////////////////////////////////////////////
// Default properties
/////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    MaxTickCount=4
    FlashAmbientGlow=180
    FlashLightType=1
    Emitters[0]=SpriteEmitter'MFEmitterBase'
    bDynamicLight=true
    bReplicateMovement=true
    RemoteRole=0
    LifeSpan=1.0000000
    LightHue=10
    LightSaturation=180
    LightRadius=30.0000000
    LightPeriod=108
}