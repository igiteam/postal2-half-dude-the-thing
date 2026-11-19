//////////////////////////////////////////////////////////////////////////////
// DynamiteAltProjectile.
// New re-written class, extend DynamiteProjectile.
// Man Chrzan, 2021. 
///////////////////////////////////////////////////////////////////////////////

class DynamiteAltProjectile extends DynamiteProjectile;   

simulated function HitByMatch()
{
	bArmed=True;
	DetonateTime=5.00;
	SetupDynamite(DetonateTime);
}


// Decompiled with UE Explorer.
defaultproperties
{
    bArmed=false
    DetonateTime=0.0000000
}