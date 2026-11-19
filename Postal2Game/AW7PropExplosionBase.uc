// PropExplosionBase
// a base class for LD's to create their own prop explosions.
// Provides all the functionality of an explosion except the emitters.
class AW7PropExplosionBase extends P2Explosion;

var(Explosion) float MyExplosionMag;			// How strong (momentum, damage, radius) the explosion is
var(Explosion) float MyExplosionDamage;			// how much it hurts
var(Explosion) float MyExplosionRadius;			// how far the hurt reaches
var(Explosion) class<DamageType> MyDamageClass;	// type of damage caused

function PostBeginPlay()
{
	if (Pawn(Owner) != None)
		Instigator = Pawn(Owner);
		
	Super.PostBeginPlay();
}

// state Exploding
// Use our values instead of the P2Explosion defaults
auto state Exploding
{
Begin:
	if (ExplodingSound != None)
		PlaySound(ExplodingSound,,1.0,,,,true);
	Sleep(DelayToHurtTime);
	CheckHurtRadius(MyExplosionDamage, MyExplosionRadius, MyDamageClass, MyExplosionMag, ForceLocation);
	Sleep(DelayToNotifyTime);
	NotifyPawns();
}


// Decompiled with UE Explorer.
defaultproperties
{
    MyExplosionMag=50000.0000000
    MyExplosionDamage=100.0000000
    MyExplosionRadius=500.0000000
    MyDamageClass=Class'BaseFX.ExplodedDamage'
    ExplodingSound=none
    AutoDestroy=true
    LifeSpan=5.0000000
}