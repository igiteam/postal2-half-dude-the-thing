//=============================================================================
// Puff of deadly gas
//=============================================================================
class AnthPuff extends Anth;

const VEL_MAX = 120;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	FitToNormal(vector(Rotation));
}

function FitToNormal(vector HNormal)
{
	Emitters[0].StartVelocityRange.X.Max=(HNormal.x+1)*VEL_MAX;
	Emitters[0].StartVelocityRange.X.Min=(HNormal.x-1)*VEL_MAX;
	Emitters[0].StartVelocityRange.Y.Max=(HNormal.y+1)*VEL_MAX;
	Emitters[0].StartVelocityRange.Y.Min=(HNormal.y-1)*VEL_MAX;
	Emitters[0].StartVelocityRange.Z.Max=(HNormal.z+1)*VEL_MAX;
	Emitters[0].StartVelocityRange.Z.Min=(HNormal.z-1)*VEL_MAX;
}

function ApplyWindEffects(vector WindAcc, vector OldWindAcc)
{
	WindAcc/=16;
	OldWindAcc/=16;
	Super.ApplyWindEffects(WindAcc, OldWindAcc);
}


// Decompiled with UE Explorer.
defaultproperties
{
    DamageDistMag=200.0000000
    Emitters[0]=SpriteEmitter'SpriteEmitter261'
    Emitters[1]=SpriteEmitter'SpriteEmitter297'
    Emitters[2]=SpriteEmitter'SpriteEmitter231'
    AutoDestroy=true
    LifeSpan=8.0000000
    CollisionHeight=160.0000000
}