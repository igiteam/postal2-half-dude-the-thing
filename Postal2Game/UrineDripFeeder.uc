//=============================================================================
// Feeder to be dripping off of roofs and ledges where a stream led up to.
//=============================================================================
class UrineDripFeeder extends FluidDripFeeder;


// Decompiled with UE Explorer.
defaultproperties
{
    QuantityPerHit=20.0000000
    SplashClass=Class'UrineSplashEmitter'
    TrailClass=Class'UrineTrail'
    TrailStarterClass=Class'UrineTrailStarter'
    PuddleClass=Class'UrinePuddle'
    MyType=2
    Quantity=50.0000000
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter5'
    Emitters[1]=SuperSpriteEmitter'SuperSpriteEmitter150'
    AutoDestroy=true
    bCollideActors=true
}