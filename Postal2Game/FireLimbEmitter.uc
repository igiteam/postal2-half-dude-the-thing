//=============================================================================
// FireLimbEmitter.
// Don't catch things on fire here--have the limb do it on touch/bumps
//=============================================================================
class FireLimbEmitter extends FireHeadEmitter;

///////////////////////////////////////////////////////////////////////////////
// update location
///////////////////////////////////////////////////////////////////////////////
function Tick(float DeltaTime)
{
	if (MyHead == None || MyHead.bDeleteMe)
		Destroy();
	else
		SetLocation(MyHead.Location + MyHead.Velocity/12);
}

///////////////////////////////////////////////////////////////////////////////
// Turn into napalm fire or not
///////////////////////////////////////////////////////////////////////////////
function SetFireType(bool bNapalm)
{
	local int i, count;

	bIsNapalm = bNapalm;

	if(Emitters.Length > 0)
	{
		// Decrease fire detail 
		count = Emitters[0].MaxParticles;
		count = P2GameInfo(Level.Game).ModifyByFireDetail(count);
		SuperSpriteEmitter(Emitters[0]).SetMaxParticles(count);
		// we have no smoke
		// Decrease smoke detail 
		//count = Emitters[1].MaxParticles;
		//count = P2GameInfo(Level.Game).ModifyBySmokeDetail(count);
		//if(count != 0)
		//	SuperSpriteEmitter(Emitters[1]).SetMaxParticles(count);
		//else
		//	Emitters[1].Disabled=true;
	}

	// changes texture, speeds it up some
	if(bIsNapalm)
	{
		// modify fire look
		if(Emitters.Length > 0)
		{
			// increase speed
			Emitters[0].StartVelocityRange.X.Max *= NapalmSpeedRatio;
			Emitters[0].StartVelocityRange.X.Min *= NapalmSpeedRatio;
			Emitters[0].StartVelocityRange.Y.Max *= NapalmSpeedRatio;
			Emitters[0].StartVelocityRange.Y.Min *= NapalmSpeedRatio;
			Emitters[0].StartVelocityRange.Z.Max *= NapalmSpeedRatio;
			Emitters[0].StartVelocityRange.Z.Min *= NapalmSpeedRatio;
			// change texture
			Emitters[0].Texture=NapalmTexture;
		}
		// change the type of damage we deal
		MyDamageType = class'NapalmDamage';
	}


}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter31'
    Emitters[1]=SuperSpriteEmitter'SuperSpriteEmitter192'
}