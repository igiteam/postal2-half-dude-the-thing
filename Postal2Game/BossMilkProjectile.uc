//////////////////////////////////////////////////////////////////////////////
// BossMilkProjectile.
// Copyright 2004 Running With Scissors, Inc.  All Rights Reserved.
//
// Diseased milk shot from the cow boss teat
//
///////////////////////////////////////////////////////////////////////////////
class BossMilkProjectile extends VomitProjectile;

var float UpdateTime;
var float LongStreamRatio;	// how much the longer stream lags behind

///////////////////////////////////////////////////////////////////////////////
// Take damage or be force around
///////////////////////////////////////////////////////////////////////////////
function TakeDamage( int Dam, Pawn instigatedBy, Vector hitlocation, 
							Vector momentum, class<DamageType> damageType)
{
	// Explosions don't blow us up
	if(ClassIsChildOf(damageType, class'ExplodedDamage'))
		return;

	Super.TakeDamage(Dam, instigatedby, hitlocation, momentum, damageType);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// Flying
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
auto state Flying
{
	function UpdateRotation()
	{
		SetRotation(Rotator(Velocity));
		if(BossMilkTrail(SpitTrail) != None)
			BossMilkTrail(SpitTrail).UpdateLongStream(LongStreamRatio*Velocity);
	}

Begin:
	Sleep(UpdateTime);
	UpdateRotation();
	Goto('Begin');
}


// Decompiled with UE Explorer.
defaultproperties
{
    UpdateTime=0.1000000
    LongStreamRatio=0.0500000
    splatmakerclass=none
    TrailClass=Class'AWEffects.BossMilkTrail'
    explclass=Class'FX.MilkExplosion'
    explflyclass=Class'FX.MilkExplosionAir'
    StartSpinMag=0.0000000
    speed=600.0000000
    RotationRate=(Pitch=0,Yaw=0,Roll=0)
}