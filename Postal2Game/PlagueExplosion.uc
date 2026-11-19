///////////////////////////////////////////////////////////////////////////////
// PlagueExplosion
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
// 
// Effect and damage for chemical-tipped rockets
///////////////////////////////////////////////////////////////////////////////
class PlagueExplosion extends MolotovExplosion;

// Special vars for the gas effects.
var float GasRadius;
var float GasDamage;
var class<P2Damage> GasDamageType;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
auto state Exploding
{
	///////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////
	function MakeBase()
	{
		local vector loc;

		loc = 2*UseNormal + Location;
		spawn(class'ChemBase',,,loc);
	}

	///////////////////////////////////////////////////////////////////////////////
	// Central fire pillar
	///////////////////////////////////////////////////////////////////////////////
	function MakePillar()
	{
		local vector loc;

		loc = 2*UseNormal + Location;
		spawn(class'ChemPillar',,,loc);
	}
Begin:
	MakeBase();	
	MakePillar();
	PlaySound(ExplodingSound,,1.0,,,,true);
	CheckHurtRadius(ExplosionDamage, ExplosionRadius, MyDamageType, ExplosionMag, ForceLocation);
	Sleep(DelayToHurtTime);
	CheckHurtRadius(GasDamage, GasRadius, GasDamageType, 0, ForceLocation);
	NotifyPawns();
	Sleep(0.6);
}


// Decompiled with UE Explorer.
defaultproperties
{
    GasRadius=700.0000000
    GasDamage=200.0000000
    GasDamageType=Class'BaseFX.ChemDamage'
    pillclass=none
    ballclass=Class'ChemBall'
    ExplodingSound=Sound'WeaponSounds.explosion_long'
    ExplosionMag=130000.0000000
    ExplosionDamage=200.0000000
    ExplosionRadius=550.0000000
    MyDamageType=Class'BaseFX.ExplodedDamage'
}