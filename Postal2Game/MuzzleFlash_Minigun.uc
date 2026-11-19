//=====================================================================================
// MuzzleFlash_Minigun
// Created by Man Chrzan for xPatch 2.0
//
// Muzzle Flash for Paradise Lost's Munted Minigun with dynamic lighting support
//=====================================================================================
class MuzzleFlash_Minigun extends xMuzzleFlashEmitter;

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
		//P2Weapon(Instigator.Weapon).SetupWeaponGlow(0);
	}

	simulated function BeginState()
	{
		TickCount=0;
		LightBrightness = RandRange(100,200);
		LightRadius = RandRange(10,20);
		LightType = FlashLightType;
		//P2Weapon(Instigator.Weapon).SetupWeaponGlow(FlashAmbientGlow);
	}
}

/////////////////////////////////////////////////////////////////
// Default properties
/////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitterMG'
    AutoDestroy=true
}