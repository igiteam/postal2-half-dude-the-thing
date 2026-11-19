//=============================================================================
// a trail of gasoline fuel on a surface
//=============================================================================
class GasTrail extends FluidTrail;



///////////////////////////////////////////////////////////////////////////////
// Set whether or not you can be damaged or not
// Override base class so we can modify it, but say, urine won't
///////////////////////////////////////////////////////////////////////////////
function SetCanBeDamaged(bool bNewCan)
{
	bCanBeDamaged=bNewCan;
}


// Decompiled with UE Explorer.
defaultproperties
{
    DripTrailClass=Class'GasDripTrail'
    UseColRadius=50.0000000
    MyType=1
    Health=75.0000000
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter157'
    AutoDestroy=true
    LifeSpan=40.0000000
    CollisionRadius=100.0000000
    CollisionHeight=100.0000000
    bCollideActors=true
}