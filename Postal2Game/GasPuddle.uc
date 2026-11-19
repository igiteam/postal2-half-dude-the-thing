//=============================================================================
// A standing puddle of gasoline
//=============================================================================
class GasPuddle extends FluidPuddle;


// Decompiled with UE Explorer.
defaultproperties
{
    TrailStarterClass=Class'GasTrailStarter'
    DripFeederClass=Class'GasDripFeeder'
    RippleClass=Class'GasRippleEmitter'
    MyType=1
    bCanBeDamaged=true
    Emitters[0]=SpriteEmitter'SpriteEmitter189'
    AutoDestroy=true
    CollisionRadius=100.0000000
    CollisionHeight=50.0000000
    bCollideActors=true
}