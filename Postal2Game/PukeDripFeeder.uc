//=============================================================================
// Feeder to be dripping off of roofs and ledges where a stream led up to.
//=============================================================================
class PukeDripFeeder extends FluidDripFeeder;


// Decompiled with UE Explorer.
defaultproperties
{
    QuantityPerHit=20.0000000
    SplashClass=Class'PukeSplashEmitter'
    TrailClass=Class'PukeTrail'
    TrailStarterClass=Class'PukeTrailStarter'
    PuddleClass=Class'pukepuddle'
    MyType=4
    Quantity=50.0000000
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter127'
    Emitters[1]=SuperSpriteEmitter'SuperSpriteEmitter128'
    AutoDestroy=true
    bCollideActors=true
}